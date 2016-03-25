object DMCoreAccountData: TDMCoreAccountData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 327
  Width = 597
  object ZQDebtor: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from debtor where WaccountId=:WaccountID')
    UpdateObject = ZUSQLDebtor
    BeforeOpen = InitOnAccountid
    AfterInsert = ZQGenAfterInsert
    Left = 400
    Top = 16
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
  end
  object ZQAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from account where WaccountId=:WaccountID')
    UpdateObject = ZUSQLAccount
    BeforeOpen = InitOnAccountid
    AfterInsert = ZQGenAfterInsert
    Left = 296
    Top = 16
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
    object ZQAccountBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQAccountBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQAccountWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQAccountWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
    object ZQAccountWTAXACCOUNT: TIntegerField
      FieldName = 'WTAXACCOUNT'
    end
  end
  object ZQCreditor: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from creditor where WaccountId=:WaccountID')
    UpdateObject = ZUSQLCreditor
    BeforeOpen = InitOnAccountid
    AfterInsert = ZQGenAfterInsert
    Left = 496
    Top = 16
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
    object ZQCreditorWPOSTCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSTCOUNTRIES_ID'
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
    object ZQCreditorWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
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
  object ZQTax: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from  Tax where  Tax.WaccountId =:WAccountID')
    UpdateObject = ZUSQLTax
    BeforeOpen = InitOnAccountid
    AfterInsert = ZQGenAfterInsert
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
      end>
    object ZQTaxWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTaxSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
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
    object ZQTaxDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTaxWLINKTAXID: TIntegerField
      FieldName = 'WLINKTAXID'
    end
    object ZQTaxBLINKCONTRA: TSmallintField
      FieldName = 'BLINKCONTRA'
    end
    object ZQTaxSHOWTYPE: TIntegerField
      FieldName = 'SHOWTYPE'
    end
  end
  object ZQBank: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from bank where  WaccountId =:WAccountID')
    UpdateObject = ZUSQLBank
    BeforeOpen = InitOnAccountid
    AfterInsert = ZQGenAfterInsert
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
      end>
    object ZQBankWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQBankWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object ZQBankWRECEIPTSID: TIntegerField
      FieldName = 'WRECEIPTSID'
    end
    object ZQBankWPAYMENTSID: TIntegerField
      FieldName = 'WPAYMENTSID'
    end
    object ZQBankWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQBankDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object ZQBatTypes: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from battypes')
    UpdateObject = ZUSQLBatTypes
    BeforeOpen = InitOnAccountid
    AfterInsert = ZQGenAfterInsert
    Left = 112
    Top = 16
    object ZQBatTypesWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQBatTypesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object ZQBatTypesBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object ZQBatTypesWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object ZQBatTypesBCONTRAPERLINE: TSmallintField
      FieldName = 'BCONTRAPERLINE'
    end
    object ZQBatTypesBINCREMENTREFNO: TSmallintField
      FieldName = 'BINCREMENTREFNO'
    end
    object ZQBatTypesBREPEATDETAILS: TSmallintField
      FieldName = 'BREPEATDETAILS'
    end
    object ZQBatTypesBCONSOLIDATEBALANCING: TSmallintField
      FieldName = 'BCONSOLIDATEBALANCING'
    end
    object ZQBatTypesWDEBITCREDIT: TIntegerField
      FieldName = 'WDEBITCREDIT'
    end
    object ZQBatTypesWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object ZQBatTypesWDEFAULTTAXID: TIntegerField
      FieldName = 'WDEFAULTTAXID'
    end
    object ZQBatTypesBVIEWEXCLUSIVE: TSmallintField
      FieldName = 'BVIEWEXCLUSIVE'
    end
    object ZQBatTypesBLINKOI: TSmallintField
      FieldName = 'BLINKOI'
    end
    object ZQBatTypesBINCLUSIVEMODE: TSmallintField
      FieldName = 'BINCLUSIVEMODE'
    end
    object ZQBatTypesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object ZQTotals: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from totals where WAccountId =:WAccountId ')
    UpdateObject = ZUSQLTotals
    AfterInsert = ZQGenAfterInsert
    Left = 32
    Top = 112
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
    object ZQTotalsWYEARID: TIntegerField
      FieldName = 'WYEARID'
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
    Left = 32
    Top = 160
  end
  object ZUSQLBatTypes: TUniUpdateSQL
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
    Left = 112
    Top = 64
  end
  object ZUSQLBank: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO bank'
      
        '  (bank.WACCOUNTID, bank.WCONTACTID, bank.WRECEIPTSID, bank.WPAY' +
        'MENTSID, '
      '   bank.WCURRENCYID, bank.DSYSDATE)'
      'VALUES'
      
        '  (:WACCOUNTID, :WCONTACTID, :WRECEIPTSID, :WPAYMENTSID, :WCURRE' +
        'NCYID, '
      '   :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM bank'
      'WHERE'
      '  bank.WACCOUNTID = :OLD_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE bank SET'
      '  bank.WACCOUNTID = :WACCOUNTID,'
      '  bank.WCONTACTID = :WCONTACTID,'
      '  bank.WRECEIPTSID = :WRECEIPTSID,'
      '  bank.WPAYMENTSID = :WPAYMENTSID,'
      '  bank.WCURRENCYID = :WCURRENCYID,'
      '  bank.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  bank.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 32
    Top = 64
  end
  object ZUSQLTax: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO Tax'
      
        '  (Tax.WACCOUNTID, Tax.SDESCRIPTION, Tax.DSTARTDATE, Tax.DENDDAT' +
        'E, Tax.FRATE, '
      '   Tax.DSYSDATE, Tax.WLINKTAXID, Tax.BLINKCONTRA, Tax.SHOWTYPE)'
      'VALUES'
      
        '  (:WACCOUNTID, :SDESCRIPTION, :DSTARTDATE, :DENDDATE, :FRATE, :' +
        'DSYSDATE, '
      '   :WLINKTAXID, :BLINKCONTRA, :SHOWTYPE)')
    DeleteSQL.Strings = (
      'DELETE FROM Tax'
      'WHERE'
      '  Tax.WACCOUNTID = :OLD_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE Tax SET'
      '  Tax.WACCOUNTID = :WACCOUNTID,'
      '  Tax.SDESCRIPTION = :SDESCRIPTION,'
      '  Tax.DSTARTDATE = :DSTARTDATE,'
      '  Tax.DENDDATE = :DENDDATE,'
      '  Tax.FRATE = :FRATE,'
      '  Tax.DSYSDATE = :DSYSDATE,'
      '  Tax.WLINKTAXID = :WLINKTAXID,'
      '  Tax.BLINKCONTRA = :BLINKCONTRA,'
      '  Tax.SHOWTYPE = :SHOWTYPE'
      'WHERE'
      '  Tax.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 208
    Top = 64
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
    Left = 296
    Top = 64
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
      '   debtor.SFREEFIELD1, debtor.SFREEFIELD2, debtor.SFREEFIELD3)'
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
      '   :SFREEFIELD1, :SFREEFIELD2, :SFREEFIELD3)')
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
      '  debtor.SFREEFIELD3 = :SFREEFIELD3'
      'WHERE'
      '  debtor.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 400
    Top = 64
  end
  object ZUSQLCreditor: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO creditor'
      
        '  (creditor.WACCOUNTID, creditor.SCODE, creditor.WCONTACTID, cre' +
        'ditor.SPASSWORD, '
      
        '   creditor.SPOSTAL1, creditor.SPOSTAL2, creditor.SPOSTAL3, cred' +
        'itor.SPOSTALCODE, '
      
        '   creditor.WPOSTCOUNTRIES_ID, creditor.SDELIVERY1, creditor.SDE' +
        'LIVERY2, '
      
        '   creditor.SDELIVERY3, creditor.WDELCOUNTRIES_ID, creditor.STEL' +
        'EPHONE1, '
      
        '   creditor.STELEPHONE2, creditor.SFAX, creditor.SEMAIL, credito' +
        'r.WBANKNAME, '
      
        '   creditor.SBRANCHCODE, creditor.SBANKACCOUNTNUMBER, creditor.S' +
        'BANKACCOUNTNAME, '
      
        '   creditor.FCREDITLIMIT, creditor.FCHARGEAMOUNT, creditor.BOPEN' +
        'ITEM, creditor.BPOSTBBF, '
      
        '   creditor.DLASTACTIVITY, creditor.WCURRENCYID, creditor.WFOREX' +
        'ACCOUNTID, '
      
        '   creditor.SMESSAGE, creditor.SREFERENCE, creditor.FDISCOUNT, c' +
        'reditor.WDEFAULTPRICETYPEID, '
      
        '   creditor.DSYSDATE, creditor.WDUEDAYS, creditor.WDEFAULTACCOUN' +
        'T, creditor.WDEFAULTTAX, '
      
        '   creditor.SCOMPANYREGNO, creditor.SFREEFIELD1, creditor.SFREEF' +
        'IELD2, '
      '   creditor.SFREEFIELD3)'
      'VALUES'
      
        '  (:WACCOUNTID, :SCODE, :WCONTACTID, :SPASSWORD, :SPOSTAL1, :SPO' +
        'STAL2, '
      
        '   :SPOSTAL3, :SPOSTALCODE, :WPOSTCOUNTRIES_ID, :SDELIVERY1, :SD' +
        'ELIVERY2, '
      
        '   :SDELIVERY3, :WDELCOUNTRIES_ID, :STELEPHONE1, :STELEPHONE2, :' +
        'SFAX, :SEMAIL, '
      
        '   :WBANKNAME, :SBRANCHCODE, :SBANKACCOUNTNUMBER, :SBANKACCOUNTN' +
        'AME, :FCREDITLIMIT, '
      
        '   :FCHARGEAMOUNT, :BOPENITEM, :BPOSTBBF, :DLASTACTIVITY, :WCURR' +
        'ENCYID, '
      
        '   :WFOREXACCOUNTID, :SMESSAGE, :SREFERENCE, :FDISCOUNT, :WDEFAU' +
        'LTPRICETYPEID, '
      
        '   :DSYSDATE, :WDUEDAYS, :WDEFAULTACCOUNT, :WDEFAULTTAX, :SCOMPA' +
        'NYREGNO, '
      '   :SFREEFIELD1, :SFREEFIELD2, :SFREEFIELD3)')
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
      '  creditor.SFREEFIELD3 = :SFREEFIELD3'
      'WHERE'
      '  creditor.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 496
    Top = 64
  end
  object ZQGen: TUniQuery
    DataTypeMap = <>
    Left = 240
    Top = 160
  end
end
