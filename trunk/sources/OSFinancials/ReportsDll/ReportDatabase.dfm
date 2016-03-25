object dmDatabase: TdmDatabase
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 153
  Top = 143
  Height = 689
  Width = 965
  object dsAbreviations: TDataSource
    DataSet = tblAbreviations
    Left = 837
    Top = 531
  end
  object tblAbreviations: TuniTable
    Connection = ZMainconnection
    TableName = 'Abreviat'
    Left = 202
    Top = 365
    object tblAbreviationsCKEY: TStringField
      FieldName = 'CKEY'
      Size = 1
    end
    object tblAbreviationsSABREVIATION: TStringField
      FieldName = 'SABREVIATION'
      Size = 30
    end
  end
  object dSACCOUNT: TDataSource
    DataSet = tblAccount
    Left = 838
    Top = 529
  end
  object tblAccount: TuniTable
    Connection = ZMainconnection
    SortedFields = 'SACCOUNTCODE'
    AutoCalcFields = False
    TableName = 'Account'
    IndexFieldNames = 'SACCOUNTCODE'
    Left = 288
    Top = 53
    object tblAccountWACCOUNTID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WACCOUNTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tblAccountSACCOUNTCODE: TStringField
      DisplayWidth = 7
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object tblAccountSMAINACCOUNTCODE: TStringField
      DisplayWidth = 4
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object tblAccountSSUBACCOUNTCODE: TStringField
      DisplayWidth = 3
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object tblAccountSDESCRIPTION: TStringField
      DisplayWidth = 35
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblAccountWACCOUNTTYPEID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP1ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP2ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object tblAccountBSUBACCOUNTS: TSmallintField
      DisplayWidth = 10
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object tblAccountBINCOMEEXPENSE: TSmallintField
      DisplayWidth = 10
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object tblAccountBOPENITEM: TSmallintField
      DisplayWidth = 10
      FieldName = 'BOPENITEM'
    end
    object tblAccountBINACTIVE: TSmallintField
      DisplayWidth = 10
      FieldName = 'BINACTIVE'
    end
    object tblAccountDSYSDATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DSYSDATE'
    end
    object tblAccountWPROFILEID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WPROFILEID'
    end
    object tblAccountWLINKACCOUNT: TIntegerField
      DisplayWidth = 10
      FieldName = 'WLINKACCOUNT'
    end
  end
  object dsBackOrder: TDataSource
    DataSet = tblBackOrder
    Left = 834
    Top = 490
  end
  object tblBackOrder: TuniTable
    Connection = ZMainconnection
    OnCalcFields = tblBackOrderCalcFields
    TableName = 'BackOrd'
    Left = 316
    Top = 440
    object tblBackOrderWBACKORDERID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WBACKORDERID'
    end
    object tblBackOrderWACCOUNTID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WACCOUNTID'
    end
    object tblBackOrderWSTOCKID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WSTOCKID'
    end
    object tblBackOrderFQTY: TFloatField
      DisplayWidth = 10
      FieldName = 'FQTY'
    end
    object tblBackOrderFSELLINGPRICE: TFloatField
      DisplayWidth = 10
      FieldName = 'FSELLINGPRICE'
    end
    object tblBackOrderBSELECTED: TSmallintField
      DisplayWidth = 10
      FieldName = 'BSELECTED'
    end
    object tblBackOrderDSYSDATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DSYSDATE'
    end
    object tblBackOrderSDescription: TStringField
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'SDescription'
      Size = 35
      Calculated = True
    end
  end
  object dsBatchTypes: TDataSource
    DataSet = tblBatchTypes
    Left = 838
    Top = 523
  end
  object tblBatchTypes: TuniTable
    Connection = ZMainconnection
    TableName = 'BatTypes'
    Left = 117
    Top = 408
    object tblBatchTypesWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object tblBatchTypesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object tblBatchTypesBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object tblBatchTypesWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object tblBatchTypesBCONTRAPERLINE: TSmallintField
      FieldName = 'BCONTRAPERLINE'
    end
    object tblBatchTypesBINCREMENTREFNO: TSmallintField
      FieldName = 'BINCREMENTREFNO'
    end
    object tblBatchTypesBREPEATDETAILS: TSmallintField
      FieldName = 'BREPEATDETAILS'
    end
    object tblBatchTypesBCONSOLIDATEBALANCING: TSmallintField
      FieldName = 'BCONSOLIDATEBALANCING'
    end
    object tblBatchTypesWDEBITCREDIT: TIntegerField
      FieldName = 'WDEBITCREDIT'
    end
    object tblBatchTypesWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object tblBatchTypesWDEFAULTTAXID: TIntegerField
      FieldName = 'WDEFAULTTAXID'
    end
    object tblBatchTypesBVIEWEXCLUSIVE: TSmallintField
      FieldName = 'BVIEWEXCLUSIVE'
    end
    object tblBatchTypesBLINKOI: TSmallintField
      FieldName = 'BLINKOI'
    end
    object tblBatchTypesBINCLUSIVEMODE: TSmallintField
      FieldName = 'BINCLUSIVEMODE'
    end
    object tblBatchTypesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsBatchControl: TDataSource
    DataSet = tblBatchControl
    Left = 843
    Top = 511
  end
  object tblBatchControl: TuniTable
    Connection = ZMainconnection
    BeforePost = tblBatchControlBeforePost
    TableName = 'BatCon'
    Left = 117
    Top = 149
    object tblBatchControlWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object tblBatchControlWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblBatchControlWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object tblBatchControlSBATCHNUMBER: TStringField
      FieldName = 'SBATCHNUMBER'
      Size = 8
    end
    object tblBatchControlBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object tblBatchControlBIMPORTED: TSmallintField
      FieldName = 'BIMPORTED'
    end
    object tblBatchControlBDOCSOURCE: TSmallintField
      FieldName = 'BDOCSOURCE'
    end
    object tblBatchControlWLINECOUNT: TIntegerField
      FieldName = 'WLINECOUNT'
    end
    object tblBatchControlSFILENAME: TStringField
      FieldName = 'SFILENAME'
      Size = 16
    end
    object tblBatchControlWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object tblBatchControlDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBatchControlWINITBATID: TIntegerField
      FieldName = 'WINITBATID'
    end
    object tblBatchControlSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object tblBatchControlSUNIQUEID: TStringField
      FieldName = 'SUNIQUEID'
      Size = 8
    end
  end
  object dsCreditor: TDataSource
    DataSet = tblCreditor
    Left = 825
    Top = 485
  end
  object tblCreditor: TuniTable
    Connection = ZMainconnection
    TableName = 'Creditor'
    MasterFields = 'WAccountID'
    IndexFieldNames = 'WAccountID'
    Left = 262
    Top = 18
    object tblCreditorWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblCreditorWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object tblCreditorSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object tblCreditorSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object tblCreditorSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object tblCreditorSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object tblCreditorSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object tblCreditorSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object tblCreditorSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object tblCreditorSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object tblCreditorSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object tblCreditorSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object tblCreditorSFAX: TStringField
      FieldName = 'SFAX'
    end
    object tblCreditorSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object tblCreditorWBANKNAME: TStringField
      FieldName = 'WBANKNAME'
    end
    object tblCreditorSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object tblCreditorSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object tblCreditorSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object tblCreditorFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object tblCreditorFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object tblCreditorSCODE: TStringField
      FieldName = 'SCODE'
      Size = 6
    end
    object tblCreditorBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object tblCreditorBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object tblCreditorDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object tblCreditorWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblCreditorWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object tblCreditorSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object tblCreditorSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblCreditorFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object tblCreditorWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object tblCreditorDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblCreditorWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object tblCreditorWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object tblCreditorWDEFAULTTAX: TIntegerField
      FieldName = 'WDEFAULTTAX'
    end
  end
  object dsCurrency: TDataSource
    DataSet = tblCurrency
    Left = 807
    Top = 480
  end
  object tblCurrency: TuniTable
    Connection = ZMainconnection
    TableName = 'Currency'
    Left = 117
    Top = 380
    object tblCurrencyWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblCurrencySDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object tblCurrencySSYMBOL: TStringField
      FieldName = 'SSYMBOL'
      Size = 6
    end
    object tblCurrencyFRATE1: TFloatField
      FieldName = 'FRATE1'
    end
    object tblCurrencyFRATE2: TFloatField
      FieldName = 'FRATE2'
    end
    object tblCurrencyFRETE3: TFloatField
      FieldName = 'FRETE3'
    end
    object tblCurrencyFRATE4: TFloatField
      FieldName = 'FRATE4'
    end
    object tblCurrencyFRATE5: TFloatField
      FieldName = 'FRATE5'
    end
    object tblCurrencyFRATE6: TFloatField
      FieldName = 'FRATE6'
    end
    object tblCurrencyFRATE7: TFloatField
      FieldName = 'FRATE7'
    end
    object tblCurrencyFRATE8: TFloatField
      FieldName = 'FRATE8'
    end
    object tblCurrencyFRATE9: TFloatField
      FieldName = 'FRATE9'
    end
    object tblCurrencyFRATE10: TFloatField
      FieldName = 'FRATE10'
    end
    object tblCurrencyFRATE11: TFloatField
      FieldName = 'FRATE11'
    end
    object tblCurrencyFRATE12: TFloatField
      FieldName = 'FRATE12'
    end
    object tblCurrencyFRATE13: TFloatField
      FieldName = 'FRATE13'
    end
    object tblCurrencyFRATE14: TFloatField
      FieldName = 'FRATE14'
    end
    object tblCurrencyFRATE15: TFloatField
      FieldName = 'FRATE15'
    end
    object tblCurrencyFRATE16: TFloatField
      FieldName = 'FRATE16'
    end
    object tblCurrencyFRATE17: TFloatField
      FieldName = 'FRATE17'
    end
    object tblCurrencyFRATE18: TFloatField
      FieldName = 'FRATE18'
    end
    object tblCurrencyFRATE19: TFloatField
      FieldName = 'FRATE19'
    end
    object tblCurrencyFRATE20: TFloatField
      FieldName = 'FRATE20'
    end
    object tblCurrencyFRATE21: TFloatField
      FieldName = 'FRATE21'
    end
    object tblCurrencyFRATE22: TFloatField
      FieldName = 'FRATE22'
    end
    object tblCurrencyFRATE23: TFloatField
      FieldName = 'FRATE23'
    end
    object tblCurrencyFRATE24: TFloatField
      FieldName = 'FRATE24'
    end
    object tblCurrencyFRATE25: TFloatField
      FieldName = 'FRATE25'
    end
    object tblCurrencyFRATE26: TFloatField
      FieldName = 'FRATE26'
    end
    object tblCurrencyWCONTRYID: TIntegerField
      FieldName = 'WCONTRYID'
    end
    object tblCurrencyWVARIANCEACCOUNTID: TIntegerField
      FieldName = 'WVARIANCEACCOUNTID'
    end
    object tblCurrencyWNOOFDECIMALS: TIntegerField
      FieldName = 'WNOOFDECIMALS'
    end
  end
  object dsDebtor: TDataSource
    DataSet = tblDebtor
    Left = 816
    Top = 506
  end
  object tblDebtor: TuniTable
    Connection = ZMainconnection
    TableName = 'Debtor'
    MasterFields = 'WAccountID'
    IndexFieldNames = 'WAccountID'
    Left = 310
    Top = 13
    object tblDebtorWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblDebtorWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object tblDebtorSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object tblDebtorSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object tblDebtorSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object tblDebtorSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object tblDebtorSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object tblDebtorSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object tblDebtorSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object tblDebtorSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object tblDebtorSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object tblDebtorSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object tblDebtorSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object tblDebtorSFAX: TStringField
      FieldName = 'SFAX'
    end
    object tblDebtorSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object tblDebtorSBANKNAME: TStringField
      FieldName = 'SBANKNAME'
    end
    object tblDebtorSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object tblDebtorSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object tblDebtorSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object tblDebtorSCREDITCARDNUMBER: TStringField
      FieldName = 'SCREDITCARDNUMBER'
    end
    object tblDebtorDEXPIRYDATE: TDateTimeField
      FieldName = 'DEXPIRYDATE'
    end
    object tblDebtorSCREDITCARDTYPE: TStringField
      FieldName = 'SCREDITCARDTYPE'
    end
    object tblDebtorSCREDITCARDHOLDER: TStringField
      FieldName = 'SCREDITCARDHOLDER'
    end
    object tblDebtorFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object tblDebtorFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object tblDebtorFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object tblDebtorFINTEREST: TFloatField
      FieldName = 'FINTEREST'
    end
    object tblDebtorWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object tblDebtorWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object tblDebtorBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object tblDebtorBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object tblDebtorBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblDebtorSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object tblDebtorWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object tblDebtorDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object tblDebtorWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblDebtorWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object tblDebtorSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblDebtorDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblDebtorWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object tblDebtorWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object tblDebtorWDEFAULTTAX: TIntegerField
      FieldName = 'WDEFAULTTAX'
    end
  end
  object dsGroups: TDataSource
    DataSet = tblGroups
    Left = 815
    Top = 495
  end
  object tblGroups: TuniTable
    Connection = ZMainconnection
    TableName = 'Groups'
    IndexFieldNames = 'WGroupID'
    Left = 117
    Top = 356
    object tblGroupsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object tblGroupsWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object tblGroupsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object tblGroupsWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object tblGroupsWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object tblGroupsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblGroupsWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
  end
  object dsPeriods: TDataSource
    DataSet = tblPeriods
    Left = 816
    Top = 489
  end
  object tblPeriods: TuniTable
    Connection = ZMainconnection
    SortedFields = 'WPERIODID'
    Filter = '(WyearID = 1) or (WYearid = 2)'
    Filtered = True
    TableName = 'Periods'
    Left = 274
    Top = 333
    object tblPeriodsWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object tblPeriodsWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
    end
    object tblPeriodsDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
    end
    object tblPeriodsDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
    end
    object tblPeriodsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 12
    end
    object tblPeriodsBSHUTDOWN: TSmallintField
      FieldName = 'BSHUTDOWN'
    end
    object tblPeriodsBCONTAINSTRANSACTIONS: TSmallintField
      FieldName = 'BCONTAINSTRANSACTIONS'
    end
  end
  object dsRepeatingDocs: TDataSource
    DataSet = tblRepeatingDocs
    Left = 834
    Top = 491
  end
  object tblRepeatingDocs: TuniTable
    Connection = ZMainconnection
    TableName = 'ReptDocs'
    Left = 375
    Top = 302
    object tblRepeatingDocsWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object tblRepeatingDocsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
  end
  object dsStock: TDataSource
    DataSet = tblStock
    Left = 815
    Top = 488
  end
  object tblStock: TuniTable
    Connection = ZMainconnection
    AfterClose = tblStockAfterClose
    AfterScroll = tblStockAfterScroll
    TableName = 'Stock'
    Left = 108
    Top = 584
    object tblStockWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object tblStockSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object tblStockSBARCODENUMBER: TStringField
      FieldName = 'SBARCODENUMBER'
      Size = 25
    end
    object tblStockSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblStockWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblStockWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblStockWCOSTACCOUNTID: TIntegerField
      FieldName = 'WCOSTACCOUNTID'
    end
    object tblStockWINPUTTAXID: TIntegerField
      FieldName = 'WINPUTTAXID'
    end
    object tblStockWOUTPUTTAXID: TIntegerField
      FieldName = 'WOUTPUTTAXID'
    end
    object tblStockFOPENINGAVECOST: TFloatField
      FieldName = 'FOPENINGAVECOST'
    end
    object tblStockFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object tblStockFOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object tblStockFINVQTYONHAND: TFloatField
      FieldName = 'FINVQTYONHAND'
    end
    object tblStockFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object tblStockWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object tblStockBAPPLYINVOICEDISCOUNT: TSmallintField
      FieldName = 'BAPPLYINVOICEDISCOUNT'
    end
    object tblStockWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object tblStockFSELLINGPRICE1: TFloatField
      FieldName = 'FSELLINGPRICE1'
    end
    object tblStockFSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
    object tblStockFSELLINGPRICE3: TFloatField
      FieldName = 'FSELLINGPRICE3'
    end
    object tblStockFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object tblStockFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object tblStockWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object tblStockDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblStockBAPPLYTAX: TSmallintField
      FieldName = 'BAPPLYTAX'
    end
    object tblStockWINPUTTAX2ID: TIntegerField
      FieldName = 'WINPUTTAX2ID'
    end
    object tblStockBTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object tblStockWSUPPLIER1ID: TIntegerField
      FieldName = 'WSUPPLIER1ID'
    end
    object tblStockWSUPPLIER2ID: TIntegerField
      FieldName = 'WSUPPLIER2ID'
    end
    object tblStockWSTOCKTYPEID: TIntegerField
      FieldName = 'WSTOCKTYPEID'
    end
    object tblStockWOUTPUTTAX2ID: TIntegerField
      FieldName = 'WOUTPUTTAX2ID'
    end
    object tblStockWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblStockBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblStockWPERENTID: TIntegerField
      FieldName = 'WPERENTID'
    end
    object tblStockWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object tblStockWFILENAMEID: TIntegerField
      FieldName = 'WFILENAMEID'
    end
    object tblStockSEXTRADESC: TStringField
      FieldName = 'SEXTRADESC'
      Size = 255
    end
  end
  object dsStockPublishing: TDataSource
    DataSet = tblStockPublishing
    Left = 842
    Top = 500
  end
  object tblStockPublishing: TuniTable
    Connection = ZMainconnection
    TableName = 'StockPub'
    Left = 202
    Top = 174
    object tblStockPublishingWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object tblStockPublishingWPRICEID: TIntegerField
      FieldName = 'WPRICEID'
    end
    object tblStockPublishingBLOBPICTURE: TBlobField
      FieldName = 'BLOBPICTURE'
    end
    object tblStockPublishingDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsStockTrans: TDataSource
    DataSet = tblStockTrans
    Left = 821
    Top = 516
  end
  object tblStockTrans: TuniTable
    Connection = ZMainconnection
    TableName = 'StockTrn'
    Left = 202
    Top = 143
    object tblStockTransWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object tblStockTransWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object tblStockTransDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblStockTransWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object tblStockTransWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object tblStockTransWDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object tblStockTransFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object tblStockTransFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object tblStockTransFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object tblStockTransWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblStockTransDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsSysVars: TDataSource
    DataSet = tblSysVars
    Left = 814
    Top = 483
  end
  object tblSysVars: TuniTable
    Connection = ZMainconnection
    TableName = 'SYSVARS'
    Left = 202
    Top = 121
    object tblSysVarsSCOMPANYNAME: TStringField
      FieldName = 'SCOMPANYNAME'
      Size = 35
    end
    object tblSysVarsSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 30
    end
    object tblSysVarsWEMAILSERVERADDRESS: TStringField
      FieldName = 'WEMAILSERVERADDRESS'
      Size = 30
    end
    object tblSysVarsWFAXSERVERID: TIntegerField
      FieldName = 'WFAXSERVERID'
    end
    object tblSysVarsBLOBLOGO: TBlobField
      FieldName = 'BLOBLOGO'
    end
    object tblSysVarsSADDRESS1: TStringField
      FieldName = 'SADDRESS1'
      Size = 30
    end
    object tblSysVarsSADDRESS2: TStringField
      FieldName = 'SADDRESS2'
      Size = 30
    end
    object tblSysVarsSADDRESS3: TStringField
      FieldName = 'SADDRESS3'
      Size = 30
    end
    object tblSysVarsSPOSTCODE: TStringField
      FieldName = 'SPOSTCODE'
      Size = 8
    end
    object tblSysVarsSPHONENUMBER: TStringField
      FieldName = 'SPHONENUMBER'
      Size = 30
    end
    object tblSysVarsSFAXNUMBER: TStringField
      FieldName = 'SFAXNUMBER'
      Size = 30
    end
    object tblSysVarsWRETAINEDINCOMEID: TIntegerField
      FieldName = 'WRETAINEDINCOMEID'
    end
    object tblSysVarsWDEBTORSCONTROLID: TIntegerField
      FieldName = 'WDEBTORSCONTROLID'
    end
    object tblSysVarsWCREDITORSCONTROLID: TIntegerField
      FieldName = 'WCREDITORSCONTROLID'
    end
    object tblSysVarsSBACKUPPATH: TStringField
      FieldName = 'SBACKUPPATH'
      Size = 255
    end
    object tblSysVarsWCOSTOFSALESTYPEID: TIntegerField
      FieldName = 'WCOSTOFSALESTYPEID'
    end
    object tblSysVarsWCREDITNOTEBATCHTYPEID: TIntegerField
      FieldName = 'WCREDITNOTEBATCHTYPEID'
    end
    object tblSysVarsSCREDITNOTEMESSAGE1: TStringField
      FieldName = 'SCREDITNOTEMESSAGE1'
      Size = 30
    end
    object tblSysVarsSCREDITNOTEMESSAGE2: TStringField
      FieldName = 'SCREDITNOTEMESSAGE2'
      Size = 30
    end
    object tblSysVarsSCREDITNOTEMESSAGE3: TStringField
      FieldName = 'SCREDITNOTEMESSAGE3'
      Size = 30
    end
    object tblSysVarsWPURCHASESBATCHID: TIntegerField
      FieldName = 'WPURCHASESBATCHID'
    end
    object tblSysVarsSPURCHASESMESSAGE1: TStringField
      FieldName = 'SPURCHASESMESSAGE1'
      Size = 30
    end
    object tblSysVarsSPURCHASESMESSAGE2: TStringField
      FieldName = 'SPURCHASESMESSAGE2'
      Size = 30
    end
    object tblSysVarsSPURCHASESMESSAGE3: TStringField
      FieldName = 'SPURCHASESMESSAGE3'
      Size = 30
    end
    object tblSysVarsWGOODSRETURNEDBATCHID: TIntegerField
      FieldName = 'WGOODSRETURNEDBATCHID'
    end
    object tblSysVarsSGOODSRETURNEDMESSAGE1: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE1'
      Size = 30
    end
    object tblSysVarsSGOODSRETURNEDMESSAGE2: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE2'
      Size = 30
    end
    object tblSysVarsSGOODSRETURNEDMESSAGE3: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE3'
      Size = 30
    end
    object tblSysVarsWINVOICESBATCHID: TIntegerField
      FieldName = 'WINVOICESBATCHID'
    end
    object tblSysVarsSINVOICESMESSAGE1: TStringField
      FieldName = 'SINVOICESMESSAGE1'
      Size = 30
    end
    object tblSysVarsSINVOICESMESSAGE2: TStringField
      FieldName = 'SINVOICESMESSAGE2'
      Size = 30
    end
    object tblSysVarsSINVOICESMESSAGE3: TStringField
      FieldName = 'SINVOICESMESSAGE3'
      Size = 30
    end
    object tblSysVarsWDISPLAYAMOUNT: TIntegerField
      FieldName = 'WDISPLAYAMOUNT'
    end
    object tblSysVarsBACCOUNTSOPEN: TSmallintField
      FieldName = 'BACCOUNTSOPEN'
    end
    object tblSysVarsBBATCHTYPES: TSmallintField
      FieldName = 'BBATCHTYPES'
    end
    object tblSysVarsBGROUPS: TSmallintField
      FieldName = 'BGROUPS'
    end
    object tblSysVarsBNOTCLOSED: TSmallintField
      FieldName = 'BNOTCLOSED'
    end
    object tblSysVarsBPERIODCHANGE: TSmallintField
      FieldName = 'BPERIODCHANGE'
    end
    object tblSysVarsBSALESMANEXIST: TSmallintField
      FieldName = 'BSALESMANEXIST'
    end
    object tblSysVarsBUNITSEXIST: TSmallintField
      FieldName = 'BUNITSEXIST'
    end
    object tblSysVarsFLASTYEARPL: TFloatField
      FieldName = 'FLASTYEARPL'
    end
    object tblSysVarsWNOOFPERIODS: TIntegerField
      FieldName = 'WNOOFPERIODS'
    end
    object tblSysVarsWINVOICEPAPERID: TIntegerField
      FieldName = 'WINVOICEPAPERID'
    end
    object tblSysVarsWCREDITNOTEPAPERID: TIntegerField
      FieldName = 'WCREDITNOTEPAPERID'
    end
    object tblSysVarsWPURCHASEPAPERID: TIntegerField
      FieldName = 'WPURCHASEPAPERID'
    end
    object tblSysVarsWGOODSRETURNEDPAPERID: TIntegerField
      FieldName = 'WGOODSRETURNEDPAPERID'
    end
    object tblSysVarsWQUOTEPAPERID: TIntegerField
      FieldName = 'WQUOTEPAPERID'
    end
    object tblSysVarsWORDERPAPERID: TIntegerField
      FieldName = 'WORDERPAPERID'
    end
    object tblSysVarsWSTATEMENTPAPERID: TIntegerField
      FieldName = 'WSTATEMENTPAPERID'
    end
    object tblSysVarsWREMITTANCEPAPERID: TIntegerField
      FieldName = 'WREMITTANCEPAPERID'
    end
    object tblSysVarsFRECONCILEDBANKBALANCE: TFloatField
      FieldName = 'FRECONCILEDBANKBALANCE'
    end
    object tblSysVarsWRECONCILEDBANKID: TIntegerField
      FieldName = 'WRECONCILEDBANKID'
    end
    object tblSysVarsDRECONCILEDLASTDATE: TDateTimeField
      FieldName = 'DRECONCILEDLASTDATE'
    end
    object tblSysVarsSSTATEMENTMESSAGE1: TStringField
      FieldName = 'SSTATEMENTMESSAGE1'
      Size = 30
    end
    object tblSysVarsSSTATEMENTMESSAGE2: TStringField
      FieldName = 'SSTATEMENTMESSAGE2'
      Size = 30
    end
    object tblSysVarsSSTATEMENTMESSAGE3: TStringField
      FieldName = 'SSTATEMENTMESSAGE3'
      Size = 30
    end
    object tblSysVarsBCREATEBALANCELINK: TSmallintField
      FieldName = 'BCREATEBALANCELINK'
    end
    object tblSysVarsWTAXDUEACCOUNTID: TIntegerField
      FieldName = 'WTAXDUEACCOUNTID'
    end
    object tblSysVarsBTAXINVOICEBASED: TSmallintField
      FieldName = 'BTAXINVOICEBASED'
    end
    object tblSysVarsBCREATECOSTOFSALES: TSmallintField
      FieldName = 'BCREATECOSTOFSALES'
    end
    object tblSysVarsWCURRENTUSERID: TIntegerField
      FieldName = 'WCURRENTUSERID'
    end
    object tblSysVarsSINVOICEHEADING: TStringField
      FieldName = 'SINVOICEHEADING'
    end
    object tblSysVarsSCREDITNOTEHEADING: TStringField
      FieldName = 'SCREDITNOTEHEADING'
    end
    object tblSysVarsSPURCHASEHEADING: TStringField
      FieldName = 'SPURCHASEHEADING'
    end
    object tblSysVarsSGOODSRETURNEDHEADING: TStringField
      FieldName = 'SGOODSRETURNEDHEADING'
    end
    object tblSysVarsSQUOTEHEADING: TStringField
      FieldName = 'SQUOTEHEADING'
    end
    object tblSysVarsSQUOTEMESSAGE1: TStringField
      FieldName = 'SQUOTEMESSAGE1'
      Size = 30
    end
    object tblSysVarsSQUOTEMESSAGE2: TStringField
      FieldName = 'SQUOTEMESSAGE2'
      Size = 30
    end
    object tblSysVarsSQUOTEMESSAGE3: TStringField
      FieldName = 'SQUOTEMESSAGE3'
      Size = 30
    end
    object tblSysVarsSORDERHEADING: TStringField
      FieldName = 'SORDERHEADING'
    end
    object tblSysVarsSORDERMESSAGE1: TStringField
      FieldName = 'SORDERMESSAGE1'
      Size = 30
    end
    object tblSysVarsSORDERMESSAGE2: TStringField
      FieldName = 'SORDERMESSAGE2'
      Size = 30
    end
    object tblSysVarsSORDERMESSAGE3: TStringField
      FieldName = 'SORDERMESSAGE3'
      Size = 30
    end
    object tblSysVarsBPOSTTOLASTYEAR: TSmallintField
      FieldName = 'BPOSTTOLASTYEAR'
    end
    object tblSysVarsWBASECURRENCYID: TIntegerField
      FieldName = 'WBASECURRENCYID'
    end
    object tblSysVarsBMULTICURRENCY: TSmallintField
      FieldName = 'BMULTICURRENCY'
    end
    object tblSysVarsSTAXREGNO: TStringField
      FieldName = 'STAXREGNO'
      Size = 30
    end
    object tblSysVarsBPAYMENTSBASED: TSmallintField
      FieldName = 'BPAYMENTSBASED'
    end
    object tblSysVarsWDUEACCOUNTID: TIntegerField
      FieldName = 'WDUEACCOUNTID'
    end
    object tblSysVarsWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
    end
    object tblSysVarsBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
    object tblSysVarsBREMOTE: TSmallintField
      FieldName = 'BREMOTE'
    end
    object tblSysVarsWCOLOURID: TIntegerField
      FieldName = 'WCOLOURID'
    end
    object tblSysVarsSACCOUNTREPORTNAME1: TStringField
      FieldName = 'SACCOUNTREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSACCOUNTREPORTNAME2: TStringField
      FieldName = 'SACCOUNTREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSDEBTORREPORTNAME1: TStringField
      FieldName = 'SDEBTORREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSDEBTORREPORTNAME2: TStringField
      FieldName = 'SDEBTORREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSCREDITORREPORTNAME1: TStringField
      FieldName = 'SCREDITORREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSCREDITORREPORTNAME2: TStringField
      FieldName = 'SCREDITORREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSSTOCKREPORTNAME1: TStringField
      FieldName = 'SSTOCKREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSSTOCKREPORTNAME2: TStringField
      FieldName = 'SSTOCKREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSDOCUMENTREPORTNAME1: TStringField
      FieldName = 'SDOCUMENTREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSDOCUMENTREPORTNAME2: TStringField
      FieldName = 'SDOCUMENTREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSSELLINGPRICENAME1: TStringField
      FieldName = 'SSELLINGPRICENAME1'
      Size = 15
    end
    object tblSysVarsSSELLINGPRICENAME2: TStringField
      FieldName = 'SSELLINGPRICENAME2'
      Size = 15
    end
    object tblSysVarsSSELLINGPRICENAME3: TStringField
      FieldName = 'SSELLINGPRICENAME3'
      Size = 15
    end
    object tblSysVarsWVERSION: TIntegerField
      FieldName = 'WVERSION'
    end
    object tblSysVarsSREPORTFONTSNAME: TStringField
      FieldName = 'SREPORTFONTSNAME'
      Size = 35
    end
    object tblSysVarsBUSEAVGCOST: TSmallintField
      FieldName = 'BUSEAVGCOST'
    end
    object tblSysVarsBPRNSTATEMENTLOGO: TSmallintField
      FieldName = 'BPRNSTATEMENTLOGO'
    end
    object tblSysVarsDTLASTUSETIME: TDateTimeField
      FieldName = 'DTLASTUSETIME'
    end
    object tblSysVarsBSHOWTIPS: TSmallintField
      FieldName = 'BSHOWTIPS'
    end
    object tblSysVarsWAUTOSAVETIME: TIntegerField
      FieldName = 'WAUTOSAVETIME'
    end
    object tblSysVarsBSHOWREMINDER: TSmallintField
      FieldName = 'BSHOWREMINDER'
    end
    object tblSysVarsBSERVICEPREPRINTED: TSmallintField
      FieldName = 'BSERVICEPREPRINTED'
    end
    object tblSysVarsWDEFAULTOUTPUTID: TIntegerField
      FieldName = 'WDEFAULTOUTPUTID'
    end
    object tblSysVarsWDEFAULTZOOM: TIntegerField
      FieldName = 'WDEFAULTZOOM'
    end
    object tblSysVarsBUSEOUTLOOKEXP: TSmallintField
      FieldName = 'BUSEOUTLOOKEXP'
    end
    object tblSysVarsSEMAILADDRESS: TStringField
      FieldName = 'SEMAILADDRESS'
      Size = 60
    end
  end
  object dsUnit: TDataSource
    DataSet = tblUnit
    Left = 815
    Top = 500
  end
  object tblUnit: TuniTable
    Connection = ZMainconnection
    TableName = 'Unit'
    Left = 117
    Top = 329
    object tblUnitWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object tblUnitSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 8
    end
    object tblUnitDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsUser: TDataSource
    DataSet = tblUser
    Left = 831
    Top = 480
  end
  object tblUser: TuniTable
    Connection = ZMainconnection
    TableName = 'USERS'
    Left = 202
    Top = 335
    object tblUserWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblUserSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object tblUserSUSERNAME: TStringField
      FieldName = 'SUSERNAME'
    end
    object tblUserSCREDITNOTENEXTNUMBER: TStringField
      FieldName = 'SCREDITNOTENEXTNUMBER'
      Size = 8
    end
    object tblUserSINVOICENEXTNUMBER: TStringField
      FieldName = 'SINVOICENEXTNUMBER'
      Size = 8
    end
    object tblUserSPURCHASENEXTNUMBER: TStringField
      FieldName = 'SPURCHASENEXTNUMBER'
      Size = 8
    end
    object tblUserSGOODSRETURNEDNEXTNUMBER: TStringField
      FieldName = 'SGOODSRETURNEDNEXTNUMBER'
      Size = 8
    end
    object tblUserSRECEIPTNEXTNUMBER: TStringField
      FieldName = 'SRECEIPTNEXTNUMBER'
      Size = 8
    end
    object tblUserSQUOTENEXTNUMBER: TStringField
      FieldName = 'SQUOTENEXTNUMBER'
      Size = 8
    end
    object tblUserSORDERNEXTNUMBER: TStringField
      FieldName = 'SORDERNEXTNUMBER'
      Size = 8
    end
    object tblUserSNEXTBATCHNUMBER: TStringField
      FieldName = 'SNEXTBATCHNUMBER'
      Size = 8
    end
    object tblUserBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblUserBACCOUNTS: TSmallintField
      FieldName = 'BACCOUNTS'
    end
    object tblUserBSTOCK: TSmallintField
      FieldName = 'BSTOCK'
    end
    object tblUserBBATCHENTRY: TSmallintField
      FieldName = 'BBATCHENTRY'
    end
    object tblUserBCREDITNOTE: TSmallintField
      FieldName = 'BCREDITNOTE'
    end
    object tblUserBINVOICES: TSmallintField
      FieldName = 'BINVOICES'
    end
    object tblUserBPURCHASES: TSmallintField
      FieldName = 'BPURCHASES'
    end
    object tblUserBSTOCKRETURNS: TSmallintField
      FieldName = 'BSTOCKRETURNS'
    end
    object tblUserBRECONCILIATION: TSmallintField
      FieldName = 'BRECONCILIATION'
    end
    object tblUserBCREDITORREPORTS: TSmallintField
      FieldName = 'BCREDITORREPORTS'
    end
    object tblUserBDEBTORREPORTS: TSmallintField
      FieldName = 'BDEBTORREPORTS'
    end
    object tblUserBLEDGERREPORTS: TSmallintField
      FieldName = 'BLEDGERREPORTS'
    end
    object tblUserBSTOCKREPORTS: TSmallintField
      FieldName = 'BSTOCKREPORTS'
    end
    object tblUserBUSERREPORTS: TSmallintField
      FieldName = 'BUSERREPORTS'
    end
    object tblUserBPOSTING: TSmallintField
      FieldName = 'BPOSTING'
    end
    object tblUserBGLOBALPROCESSES: TSmallintField
      FieldName = 'BGLOBALPROCESSES'
    end
    object tblUserBSYSTEMSETUP: TSmallintField
      FieldName = 'BSYSTEMSETUP'
    end
    object tblUserUSEREMAIL: TStringField
      FieldName = 'USEREMAIL'
      Size = 30
    end
    object tblUserBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
    object tblUserSPCIPADDRESS: TStringField
      FieldName = 'SPCIPADDRESS'
    end
    object tblUserDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblUserBEDITPRICES: TSmallintField
      FieldName = 'BEDITPRICES'
    end
    object tblUserBGLOBALSEQ: TSmallintField
      FieldName = 'BGLOBALSEQ'
    end
    object tblUserBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object tblUserBONLYPOS: TSmallintField
      FieldName = 'BONLYPOS'
    end
    object tblUserBPOSSUPER: TSmallintField
      FieldName = 'BPOSSUPER'
    end
    object tblUserBSEARCH: TSmallintField
      FieldName = 'BSEARCH'
    end
    object tblUserBEMAIL: TSmallintField
      FieldName = 'BEMAIL'
    end
    object tblUserBNOTUSED1: TSmallintField
      FieldName = 'BNOTUSED1'
    end
  end
  object dsRepeatingBatch: TDataSource
    DataSet = tblRepeatingBatch
    Left = 841
    Top = 509
  end
  object tblRepeatingBatch: TuniTable
    Connection = ZMainconnection
    TableName = 'ReptBat'
    Left = 202
    Top = 314
    object tblRepeatingBatchWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object tblRepeatingBatchWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblRepeatingBatchWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object tblRepeatingBatchSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblRepeatingBatchDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblRepeatingBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblRepeatingBatchWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblRepeatingBatchWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblRepeatingBatchWCONTRAID: TIntegerField
      FieldName = 'WCONTRAID'
    end
    object tblRepeatingBatchFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
  end
  object dsLabSpecs: TDataSource
    DataSet = tblLabSpecs
    Left = 817
    Top = 519
  end
  object tblLabSpecs: TuniTable
    Connection = ZMainconnection
    TableName = 'LabSpecs'
    Left = 278
    Top = 99
    object tblLabSpecsWLABSPECSID: TIntegerField
      FieldName = 'WLABSPECSID'
    end
    object tblLabSpecsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object tblLabSpecsFTOPMARGIN: TFloatField
      FieldName = 'FTOPMARGIN'
    end
    object tblLabSpecsFBOTTOMMARGIN: TFloatField
      FieldName = 'FBOTTOMMARGIN'
    end
    object tblLabSpecsFLEFTMARGIN: TFloatField
      FieldName = 'FLEFTMARGIN'
    end
    object tblLabSpecsFRIGHTMARGIN: TFloatField
      FieldName = 'FRIGHTMARGIN'
    end
    object tblLabSpecsBPORTRAIT: TSmallintField
      FieldName = 'BPORTRAIT'
    end
    object tblLabSpecsFHEIGHT: TFloatField
      FieldName = 'FHEIGHT'
    end
    object tblLabSpecsFWIDTH: TFloatField
      FieldName = 'FWIDTH'
    end
    object tblLabSpecsWACCROSS: TIntegerField
      FieldName = 'WACCROSS'
    end
    object tblLabSpecsWDOWN: TIntegerField
      FieldName = 'WDOWN'
    end
    object tblLabSpecsFHGAP: TFloatField
      FieldName = 'FHGAP'
    end
    object tblLabSpecsFVGAP: TFloatField
      FieldName = 'FVGAP'
    end
    object tblLabSpecsFUNPRINTABLETOP: TFloatField
      FieldName = 'FUNPRINTABLETOP'
    end
    object tblLabSpecsFUNPRINTABLELEFT: TFloatField
      FieldName = 'FUNPRINTABLELEFT'
    end
    object tblLabSpecsFPAGEHEIGHT: TFloatField
      FieldName = 'FPAGEHEIGHT'
    end
    object tblLabSpecsFPAGEWIDTH: TFloatField
      FieldName = 'FPAGEWIDTH'
    end
    object tblLabSpecsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblLabSpecsWFONTSIZE: TIntegerField
      FieldName = 'WFONTSIZE'
    end
  end
  object dsTotals: TDataSource
    DataSet = tblTotals
    Left = 819
    Top = 495
  end
  object tblTotals: TuniTable
    Connection = ZMainconnection
    BeforePost = tblTotalsBeforePost
    TableName = 'Totals'
    Left = 157
    Top = 323
    object tblTotalsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblTotalsWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
    end
    object tblTotalsBACTUAL: TSmallintField
      FieldName = 'BACTUAL'
    end
    object tblTotalsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblTotalsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblTotalsWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
  end
  object dsGlobal: TDataSource
    Left = 834
    Top = 512
  end
  object dsBatch: TDataSource
    DataSet = tblBatch
    Left = 846
    Top = 523
  end
  object tblBatch: TuniTable
    Connection = ZMainconnection
    AfterOpen = tblBatchAfterOpen
    AfterScroll = tblBatchAfterScroll
    AfterEdit = tblBatchAfterEdit
    TableName = 'BAT0T2'
    IndexFieldNames = 'WLineId'
    Left = 368
    Top = 112
    object tblBatchWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object tblBatchSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblBatchSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 8
    end
    object tblBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblBatchFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object tblBatchFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblBatchSTAX: TStringField
      FieldName = 'STAX'
      Size = 8
    end
    object tblBatchDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblBatchFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object tblBatchSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 8
    end
    object tblBatchFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblBatchDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object tblBatchBRECONCILED: TIntegerField
      FieldName = 'BRECONCILED'
    end
    object tblBatchBEXCLUSIVE: TIntegerField
      FieldName = 'BEXCLUSIVE'
    end
    object tblBatchWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblBatchFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object tblBatchWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBatchWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object tblBatchNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object tblBatchSPROFILE: TStringField
      FieldName = 'SPROFILE'
      Size = 35
    end
    object tblBatchSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      Size = 8
    end
    object tblBatchSTAX2: TStringField
      FieldName = 'STAX2'
      Size = 8
    end
    object tblBatchBLINKED: TIntegerField
      FieldName = 'BLINKED'
    end
    object tblBatchDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBatchFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object tblBatchWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblBatchWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object tblBatchWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblBatchWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblBatchWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
  end
  object dsBatchRefTotals: TDataSource
    DataSet = tblBatchRefTotals
    Left = 837
    Top = 512
  end
  object tblBatchRefTotals: TuniTable
    Connection = ZMainconnection
    BeforePost = tblBatchRefTotalsBeforePost
    AfterPost = tblBatchRefTotalsAfterPost
    TableName = 'BAT0T2'
    Left = 376
    Top = 71
    object tblBatchRefTotalsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblBatchRefTotalsSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 7
    end
    object tblBatchRefTotalsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblBatchRefTotalsFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object tblBatchRefTotalsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblBatchRefTotalsSTAX: TStringField
      FieldName = 'STAX'
      Size = 7
    end
    object tblBatchRefTotalsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblBatchRefTotalsFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object tblBatchRefTotalsSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 7
    end
    object tblBatchRefTotalsFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblBatchRefTotalsDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object tblBatchRefTotalsBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object tblBatchRefTotalsBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object tblBatchRefTotalsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblBatchRefTotalsWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object tblBatchRefTotalsFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object tblBatchRefTotalsWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBatchRefTotalsWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object tblBatchRefTotalsNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object tblBatchRefTotalsSPROFILE: TStringField
      FieldName = 'SPROFILE'
      Size = 35
    end
    object tblBatchRefTotalsSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      Size = 8
    end
    object tblBatchRefTotalsSTAX2: TStringField
      FieldName = 'STAX2'
      Size = 8
    end
    object tblBatchRefTotalsBLINKED: TSmallintField
      FieldName = 'BLINKED'
    end
    object tblBatchRefTotalsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBatchRefTotalsFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object tblBatchRefTotalsWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblBatchRefTotalsWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object tblBatchRefTotalsWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object tblBatchRefTotalsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblBatchRefTotalsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
  end
  object dsSelectUser: TDataSource
    DataSet = tblSelectUser
    Left = 841
    Top = 531
  end
  object tblSelectUser: TuniTable
    Connection = ZMainconnection
    TableName = 'USERS'
    Left = 202
    Top = 96
    object tblSelectUserWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblSelectUserSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object tblSelectUserSUSERNAME: TStringField
      FieldName = 'SUSERNAME'
    end
    object tblSelectUserSCREDITNOTENEXTNUMBER: TStringField
      FieldName = 'SCREDITNOTENEXTNUMBER'
      Size = 8
    end
    object tblSelectUserSINVOICENEXTNUMBER: TStringField
      FieldName = 'SINVOICENEXTNUMBER'
      Size = 8
    end
    object tblSelectUserSPURCHASENEXTNUMBER: TStringField
      FieldName = 'SPURCHASENEXTNUMBER'
      Size = 8
    end
    object tblSelectUserSGOODSRETURNEDNEXTNUMBER: TStringField
      FieldName = 'SGOODSRETURNEDNEXTNUMBER'
      Size = 8
    end
    object tblSelectUserSRECEIPTNEXTNUMBER: TStringField
      FieldName = 'SRECEIPTNEXTNUMBER'
      Size = 8
    end
    object tblSelectUserSQUOTENEXTNUMBER: TStringField
      FieldName = 'SQUOTENEXTNUMBER'
      Size = 8
    end
    object tblSelectUserSORDERNEXTNUMBER: TStringField
      FieldName = 'SORDERNEXTNUMBER'
      Size = 8
    end
    object tblSelectUserSNEXTBATCHNUMBER: TStringField
      FieldName = 'SNEXTBATCHNUMBER'
      Size = 8
    end
    object tblSelectUserBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblSelectUserBACCOUNTS: TSmallintField
      FieldName = 'BACCOUNTS'
    end
    object tblSelectUserBSTOCK: TSmallintField
      FieldName = 'BSTOCK'
    end
    object tblSelectUserBBATCHENTRY: TSmallintField
      FieldName = 'BBATCHENTRY'
    end
    object tblSelectUserBCREDITNOTE: TSmallintField
      FieldName = 'BCREDITNOTE'
    end
    object tblSelectUserBINVOICES: TSmallintField
      FieldName = 'BINVOICES'
    end
    object tblSelectUserBPURCHASES: TSmallintField
      FieldName = 'BPURCHASES'
    end
    object tblSelectUserBSTOCKRETURNS: TSmallintField
      FieldName = 'BSTOCKRETURNS'
    end
    object tblSelectUserBRECONCILIATION: TSmallintField
      FieldName = 'BRECONCILIATION'
    end
    object tblSelectUserBCREDITORREPORTS: TSmallintField
      FieldName = 'BCREDITORREPORTS'
    end
    object tblSelectUserBDEBTORREPORTS: TSmallintField
      FieldName = 'BDEBTORREPORTS'
    end
    object tblSelectUserBLEDGERREPORTS: TSmallintField
      FieldName = 'BLEDGERREPORTS'
    end
    object tblSelectUserBSTOCKREPORTS: TSmallintField
      FieldName = 'BSTOCKREPORTS'
    end
    object tblSelectUserBUSERREPORTS: TSmallintField
      FieldName = 'BUSERREPORTS'
    end
    object tblSelectUserBPOSTING: TSmallintField
      FieldName = 'BPOSTING'
    end
    object tblSelectUserBGLOBALPROCESSES: TSmallintField
      FieldName = 'BGLOBALPROCESSES'
    end
    object tblSelectUserBSYSTEMSETUP: TSmallintField
      FieldName = 'BSYSTEMSETUP'
    end
    object tblSelectUserUSEREMAIL: TStringField
      FieldName = 'USEREMAIL'
      Size = 30
    end
    object tblSelectUserBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
    object tblSelectUserSPCIPADDRESS: TStringField
      FieldName = 'SPCIPADDRESS'
    end
    object tblSelectUserDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblSelectUserBEDITPRICES: TSmallintField
      FieldName = 'BEDITPRICES'
    end
    object tblSelectUserBGLOBALSEQ: TSmallintField
      FieldName = 'BGLOBALSEQ'
    end
    object tblSelectUserBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object tblSelectUserBONLYPOS: TSmallintField
      FieldName = 'BONLYPOS'
    end
    object tblSelectUserBPOSSUPER: TSmallintField
      FieldName = 'BPOSSUPER'
    end
    object tblSelectUserBSEARCH: TSmallintField
      FieldName = 'BSEARCH'
    end
    object tblSelectUserBEMAIL: TSmallintField
      FieldName = 'BEMAIL'
    end
    object tblSelectUserBNOTUSED1: TSmallintField
      FieldName = 'BNOTUSED1'
    end
  end
  object dsReportingOptions: TDataSource
    DataSet = tblReportingOptions
    Left = 842
    Top = 534
  end
  object tblReportingOptions: TuniTable
    Connection = ZMainconnection
    TableName = 'ReportOp'
    Left = 40
    Top = 164
    object tblReportingOptionsSACCOUNTLISTINGSEQUENCE: TStringField
      FieldName = 'SACCOUNTLISTINGSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSACCOUNTLISTINGFROMACC: TStringField
      FieldName = 'SACCOUNTLISTINGFROMACC'
      Size = 7
    end
    object tblReportingOptionsSACCOUNTLISTINGTOACC: TStringField
      FieldName = 'SACCOUNTLISTINGTOACC'
      Size = 7
    end
    object tblReportingOptionsBACCOUNTLISTINGSHOWSUB: TSmallintField
      FieldName = 'BACCOUNTLISTINGSHOWSUB'
    end
    object tblReportingOptionsWTRIALBALFROMDATEID: TIntegerField
      FieldName = 'WTRIALBALFROMDATEID'
    end
    object tblReportingOptionsWTRIALBALODATEID: TIntegerField
      FieldName = 'WTRIALBALODATEID'
    end
    object tblReportingOptionsBTRIALBALDISPLAYSUBACC: TSmallintField
      FieldName = 'BTRIALBALDISPLAYSUBACC'
    end
    object tblReportingOptionsBTRIALBALNILBALANCES: TSmallintField
      FieldName = 'BTRIALBALNILBALANCES'
    end
    object tblReportingOptionsSTRIALBALSSEQUENCE: TStringField
      FieldName = 'STRIALBALSSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSBUDGETPERFSEQUENCE: TStringField
      FieldName = 'SBUDGETPERFSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSBUDGETPERFFROMACC: TStringField
      FieldName = 'SBUDGETPERFFROMACC'
      Size = 7
    end
    object tblReportingOptionsSBUDGETPERFTOACC: TStringField
      FieldName = 'SBUDGETPERFTOACC'
      Size = 7
    end
    object tblReportingOptionsBBUDGETPERFSHOWSUB: TSmallintField
      FieldName = 'BBUDGETPERFSHOWSUB'
    end
    object tblReportingOptionsBBUDGETPERFNILBAL: TSmallintField
      FieldName = 'BBUDGETPERFNILBAL'
    end
    object tblReportingOptionsWBATCHTYPETYPE: TIntegerField
      FieldName = 'WBATCHTYPETYPE'
    end
    object tblReportingOptionsSBATCHTYPEWHICHYEAR: TStringField
      FieldName = 'SBATCHTYPEWHICHYEAR'
      Size = 10
    end
    object tblReportingOptionsWBATCHTYPEFROMDATEID: TIntegerField
      FieldName = 'WBATCHTYPEFROMDATEID'
    end
    object tblReportingOptionsWBATCHTYPETODATEID: TIntegerField
      FieldName = 'WBATCHTYPETODATEID'
    end
    object tblReportingOptionsBBATCHTYPESHOWPERIOD: TSmallintField
      FieldName = 'BBATCHTYPESHOWPERIOD'
    end
    object tblReportingOptionsBBATCHTYPESHOWBAL: TSmallintField
      FieldName = 'BBATCHTYPESHOWBAL'
    end
    object tblReportingOptionsSCREDITORLISTINGSEQUENCE: TStringField
      FieldName = 'SCREDITORLISTINGSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSCREDLISTINGFROMACCOUNT: TStringField
      FieldName = 'SCREDLISTINGFROMACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSCREDLISTINGTOACCOUNT: TStringField
      FieldName = 'SCREDLISTINGTOACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSCREDMOVEMENTSSEQUENCE: TStringField
      FieldName = 'SCREDMOVEMENTSSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSCREDMOVEMENTSFROMACCOUNT: TStringField
      FieldName = 'SCREDMOVEMENTSFROMACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSCREDMOVEMENTSTOACCOUNT: TStringField
      FieldName = 'SCREDMOVEMENTSTOACCOUNT'
      Size = 7
    end
    object tblReportingOptionsBCREDMOVEMENTSBNIBAL: TSmallintField
      FieldName = 'BCREDMOVEMENTSBNIBAL'
    end
    object tblReportingOptionsSDEBTORLISTINGSEQUENCE: TStringField
      FieldName = 'SDEBTORLISTINGSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSDEBTORLISTINGFROMACCOUNT: TStringField
      FieldName = 'SDEBTORLISTINGFROMACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSDEBTORLISTINGTOACCOUNT: TStringField
      FieldName = 'SDEBTORLISTINGTOACCOUNT'
      Size = 7
    end
    object tblReportingOptionsBDEBTORLISTINGSHOWDETAIL: TSmallintField
      FieldName = 'BDEBTORLISTINGSHOWDETAIL'
    end
    object tblReportingOptionsSDEBTORMOVEMENTSEQUENCE: TStringField
      FieldName = 'SDEBTORMOVEMENTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSDEBTORMOVEMENTFROMACC: TStringField
      FieldName = 'SDEBTORMOVEMENTFROMACC'
      Size = 7
    end
    object tblReportingOptionsSDEBTORMOVEMENTTOACC: TStringField
      FieldName = 'SDEBTORMOVEMENTTOACC'
      Size = 7
    end
    object tblReportingOptionsBDEBTORMOVEMENTBNILBAL: TSmallintField
      FieldName = 'BDEBTORMOVEMENTBNILBAL'
    end
    object tblReportingOptionsWDOCLISTTYPEID: TIntegerField
      FieldName = 'WDOCLISTTYPEID'
    end
    object tblReportingOptionsSDOCLISTSEQUENCE: TStringField
      FieldName = 'SDOCLISTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSDOCLISTFROMNUMBER: TStringField
      FieldName = 'SDOCLISTFROMNUMBER'
      Size = 8
    end
    object tblReportingOptionsSDOCLISTTONUMBER: TStringField
      FieldName = 'SDOCLISTTONUMBER'
      Size = 8
    end
    object tblReportingOptionsDDOCLISTFROMDATE: TDateTimeField
      FieldName = 'DDOCLISTFROMDATE'
    end
    object tblReportingOptionsDDOCLISTTODATE: TDateTimeField
      FieldName = 'DDOCLISTTODATE'
    end
    object tblReportingOptionsSDEBTORAGEFROM: TStringField
      FieldName = 'SDEBTORAGEFROM'
      Size = 7
    end
    object tblReportingOptionsSDEBTORAGETO: TStringField
      FieldName = 'SDEBTORAGETO'
      Size = 7
    end
    object tblReportingOptionsDDEBTORAGECURRENTDATE: TDateTimeField
      FieldName = 'DDEBTORAGECURRENTDATE'
    end
    object tblReportingOptionsDDEBTORAGEDATELIMIT1: TDateTimeField
      FieldName = 'DDEBTORAGEDATELIMIT1'
    end
    object tblReportingOptionsDDEBTORAGEDATELIMIT2: TDateTimeField
      FieldName = 'DDEBTORAGEDATELIMIT2'
    end
    object tblReportingOptionsDDEBTORAGEDATELIMIT3: TDateTimeField
      FieldName = 'DDEBTORAGEDATELIMIT3'
    end
    object tblReportingOptionsDDEBTORAGEDATELIMIT4: TDateTimeField
      FieldName = 'DDEBTORAGEDATELIMIT4'
    end
    object tblReportingOptionsSDEBTORAGERANGENAME0: TStringField
      FieldName = 'SDEBTORAGERANGENAME0'
      Size = 15
    end
    object tblReportingOptionsSDEBTORAGERANGENAME1: TStringField
      FieldName = 'SDEBTORAGERANGENAME1'
      Size = 15
    end
    object tblReportingOptionsSDEBTORAGERANGENAME2: TStringField
      FieldName = 'SDEBTORAGERANGENAME2'
      Size = 15
    end
    object tblReportingOptionsSDEBTORAGERANGENAME3: TStringField
      FieldName = 'SDEBTORAGERANGENAME3'
      Size = 15
    end
    object tblReportingOptionsFDEBTORAGEMINIMUMAMOUNT: TFloatField
      FieldName = 'FDEBTORAGEMINIMUMAMOUNT'
    end
    object tblReportingOptionsWDEBTORAGEMONTH1: TIntegerField
      FieldName = 'WDEBTORAGEMONTH1'
    end
    object tblReportingOptionsWDEBTORAGEMONTH2: TIntegerField
      FieldName = 'WDEBTORAGEMONTH2'
    end
    object tblReportingOptionsWDEBTORAGEMONTH3: TIntegerField
      FieldName = 'WDEBTORAGEMONTH3'
    end
    object tblReportingOptionsBDEBTORAGESORT: TSmallintField
      FieldName = 'BDEBTORAGESORT'
    end
    object tblReportingOptionsBDEBTORAGEACCOUNTDETAIL: TSmallintField
      FieldName = 'BDEBTORAGEACCOUNTDETAIL'
    end
    object tblReportingOptionsBDEBTORAGESHOWTRANSAC: TSmallintField
      FieldName = 'BDEBTORAGESHOWTRANSAC'
    end
    object tblReportingOptionsBDEBTORAGESHOWOPENITEM: TSmallintField
      FieldName = 'BDEBTORAGESHOWOPENITEM'
    end
    object tblReportingOptionsBDEBTORAGEIGNOREZEROBAL: TSmallintField
      FieldName = 'BDEBTORAGEIGNOREZEROBAL'
    end
    object tblReportingOptionsSCREDITORAGEFROM: TStringField
      FieldName = 'SCREDITORAGEFROM'
      Size = 7
    end
    object tblReportingOptionsSCREDITORAGETO: TStringField
      FieldName = 'SCREDITORAGETO'
      Size = 7
    end
    object tblReportingOptionsDCREDITORAGECURRENTDATE: TDateTimeField
      FieldName = 'DCREDITORAGECURRENTDATE'
    end
    object tblReportingOptionsDCREDITORAGEDATELIMIT1: TDateTimeField
      FieldName = 'DCREDITORAGEDATELIMIT1'
    end
    object tblReportingOptionsDCREDITORAGEDATELIMIT2: TDateTimeField
      FieldName = 'DCREDITORAGEDATELIMIT2'
    end
    object tblReportingOptionsDCREDITORAGEDATELIMIT3: TDateTimeField
      FieldName = 'DCREDITORAGEDATELIMIT3'
    end
    object tblReportingOptionsDCREDITORAGEDATELIMIT4: TDateTimeField
      FieldName = 'DCREDITORAGEDATELIMIT4'
    end
    object tblReportingOptionsSCREDITORAGERANGENAME0: TStringField
      FieldName = 'SCREDITORAGERANGENAME0'
      Size = 15
    end
    object tblReportingOptionsSCREDITORAGERANGENAME1: TStringField
      FieldName = 'SCREDITORAGERANGENAME1'
      Size = 15
    end
    object tblReportingOptionsSCREDITORAGERANGENAME2: TStringField
      FieldName = 'SCREDITORAGERANGENAME2'
      Size = 15
    end
    object tblReportingOptionsSCREDITORAGERANGENAME3: TStringField
      FieldName = 'SCREDITORAGERANGENAME3'
      Size = 15
    end
    object tblReportingOptionsFCREDITORAGEMINIMUMAMOUNT: TFloatField
      FieldName = 'FCREDITORAGEMINIMUMAMOUNT'
    end
    object tblReportingOptionsWCREDITORAGEMONTH1: TIntegerField
      FieldName = 'WCREDITORAGEMONTH1'
    end
    object tblReportingOptionsWCREDITORAGEMONTH2: TIntegerField
      FieldName = 'WCREDITORAGEMONTH2'
    end
    object tblReportingOptionsWCREDITORAGEMONTH3: TIntegerField
      FieldName = 'WCREDITORAGEMONTH3'
    end
    object tblReportingOptionsBCREDITORAGESORT: TSmallintField
      FieldName = 'BCREDITORAGESORT'
    end
    object tblReportingOptionsBCREDITORAGEACCOUNTDETAIL: TSmallintField
      FieldName = 'BCREDITORAGEACCOUNTDETAIL'
    end
    object tblReportingOptionsBCREDITORAGESHOWTRANSAC: TSmallintField
      FieldName = 'BCREDITORAGESHOWTRANSAC'
    end
    object tblReportingOptionsBCREDITORAGESHOWOPENITEM: TSmallintField
      FieldName = 'BCREDITORAGESHOWOPENITEM'
    end
    object tblReportingOptionsBCREDITORAGEIGNOREZEROBAL: TSmallintField
      FieldName = 'BCREDITORAGEIGNOREZEROBAL'
    end
    object tblReportingOptionsSRECONBANKACCOUNT: TStringField
      FieldName = 'SRECONBANKACCOUNT'
      Size = 35
    end
    object tblReportingOptionsDRECONUNTIL: TDateTimeField
      FieldName = 'DRECONUNTIL'
    end
    object tblReportingOptionsFRECONBANKBALANCE: TFloatField
      FieldName = 'FRECONBANKBALANCE'
    end
    object tblReportingOptionsSRECONREPORTBANKACCOUNT: TStringField
      FieldName = 'SRECONREPORTBANKACCOUNT'
      Size = 35
    end
    object tblReportingOptionsDRECONREPORTUNTIL: TDateTimeField
      FieldName = 'DRECONREPORTUNTIL'
    end
    object tblReportingOptionsFRECONREPORTBALANCE: TFloatField
      FieldName = 'FRECONREPORTBALANCE'
    end
    object tblReportingOptionsBCREDTRANSINCNILBAL: TSmallintField
      FieldName = 'BCREDTRANSINCNILBAL'
    end
    object tblReportingOptionsSCREDTRANSSEQUENCE: TStringField
      FieldName = 'SCREDTRANSSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSCREDTRANSWHICHYEAR: TStringField
      FieldName = 'SCREDTRANSWHICHYEAR'
      Size = 35
    end
    object tblReportingOptionsSCREDTRANSFROMACCOUNT: TStringField
      FieldName = 'SCREDTRANSFROMACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSCREDTRANSTOACCOUNT: TStringField
      FieldName = 'SCREDTRANSTOACCOUNT'
      Size = 7
    end
    object tblReportingOptionsWCREDTRANSFROMDATE: TIntegerField
      FieldName = 'WCREDTRANSFROMDATE'
    end
    object tblReportingOptionsWCREDTRANSTODATE: TIntegerField
      FieldName = 'WCREDTRANSTODATE'
    end
    object tblReportingOptionsBCREDTRANSEACHPERIOD: TSmallintField
      FieldName = 'BCREDTRANSEACHPERIOD'
    end
    object tblReportingOptionsBCREDTRANSNEWPAGE: TSmallintField
      FieldName = 'BCREDTRANSNEWPAGE'
    end
    object tblReportingOptionsBDEBTRANSINCNILBAL: TSmallintField
      FieldName = 'BDEBTRANSINCNILBAL'
    end
    object tblReportingOptionsSDEBTRANSSEQUENCE: TStringField
      FieldName = 'SDEBTRANSSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSDEBTRANSWHICHYEAR: TStringField
      FieldName = 'SDEBTRANSWHICHYEAR'
      Size = 35
    end
    object tblReportingOptionsSDEBTRANSFROMACCOUNT: TStringField
      FieldName = 'SDEBTRANSFROMACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSDEBTRANSTOACCOUNT: TStringField
      FieldName = 'SDEBTRANSTOACCOUNT'
      Size = 7
    end
    object tblReportingOptionsWDEBTRANSFROMDATE: TIntegerField
      FieldName = 'WDEBTRANSFROMDATE'
    end
    object tblReportingOptionsWDEBTRANSTODATE: TIntegerField
      FieldName = 'WDEBTRANSTODATE'
    end
    object tblReportingOptionsBDEBTRANSEACHPERIOD: TSmallintField
      FieldName = 'BDEBTRANSEACHPERIOD'
    end
    object tblReportingOptionsBDEBTRANSNEWPAGE: TSmallintField
      FieldName = 'BDEBTRANSNEWPAGE'
    end
    object tblReportingOptionsSSTOCKACTIVITYFROMCODE: TStringField
      FieldName = 'SSTOCKACTIVITYFROMCODE'
      Size = 15
    end
    object tblReportingOptionsSSTOCKACTIVITYTOCODE: TStringField
      FieldName = 'SSTOCKACTIVITYTOCODE'
      Size = 15
    end
    object tblReportingOptionsSSTOCKACTIVITYSEQUENCE: TStringField
      FieldName = 'SSTOCKACTIVITYSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSTOCKLISTSEQUENCE: TStringField
      FieldName = 'SSTOCKLISTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSTOCKLISTFROMCODE: TStringField
      FieldName = 'SSTOCKLISTFROMCODE'
      Size = 15
    end
    object tblReportingOptionsSSTOCKLISTTOCODE: TStringField
      FieldName = 'SSTOCKLISTTOCODE'
      Size = 15
    end
    object tblReportingOptionsBSTOCKLISTQTYONHAND: TSmallintField
      FieldName = 'BSTOCKLISTQTYONHAND'
    end
    object tblReportingOptionsBSTOCKLISTCOSTPRICE: TSmallintField
      FieldName = 'BSTOCKLISTCOSTPRICE'
    end
    object tblReportingOptionsBSTOCKLISTSELLINGPRICE: TSmallintField
      FieldName = 'BSTOCKLISTSELLINGPRICE'
    end
    object tblReportingOptionsBSTOCKLISTSTOCKCOUNT: TSmallintField
      FieldName = 'BSTOCKLISTSTOCKCOUNT'
    end
    object tblReportingOptionsBSTOCKLISTSTOCKVALUE: TSmallintField
      FieldName = 'BSTOCKLISTSTOCKVALUE'
    end
    object tblReportingOptionsSSTOCKMOVEMENTSEQUENCE: TStringField
      FieldName = 'SSTOCKMOVEMENTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSTOCKMOVEMENTFROMCODE: TStringField
      FieldName = 'SSTOCKMOVEMENTFROMCODE'
      Size = 15
    end
    object tblReportingOptionsSSTOCKMOVEMENTTOCODE: TStringField
      FieldName = 'SSTOCKMOVEMENTTOCODE'
      Size = 15
    end
    object tblReportingOptionsDSTOCKMOVEMENTFROMDATE: TDateTimeField
      FieldName = 'DSTOCKMOVEMENTFROMDATE'
    end
    object tblReportingOptionsDSTOCKMOVEMENTTODATE: TDateTimeField
      FieldName = 'DSTOCKMOVEMENTTODATE'
    end
    object tblReportingOptionsBSTOCKMOVEMENTSHOWDETAIL: TSmallintField
      FieldName = 'BSTOCKMOVEMENTSHOWDETAIL'
    end
    object tblReportingOptionsBSTOCKMOVEMENTNEWPAGE: TSmallintField
      FieldName = 'BSTOCKMOVEMENTNEWPAGE'
    end
    object tblReportingOptionsSSTOCKREORDERSEQUENCE: TStringField
      FieldName = 'SSTOCKREORDERSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSTOCKREORDERFROMCODE: TStringField
      FieldName = 'SSTOCKREORDERFROMCODE'
      Size = 15
    end
    object tblReportingOptionsSSTOCKREORDERTOCODE: TStringField
      FieldName = 'SSTOCKREORDERTOCODE'
      Size = 15
    end
    object tblReportingOptionsBGLLEDGERNILBALANCES: TSmallintField
      FieldName = 'BGLLEDGERNILBALANCES'
    end
    object tblReportingOptionsSGLLEDGERSEQUENCE: TStringField
      FieldName = 'SGLLEDGERSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSGLLEDGERWHICHYEAR: TStringField
      FieldName = 'SGLLEDGERWHICHYEAR'
      Size = 35
    end
    object tblReportingOptionsSGLLEDGERFROMACCOUNT: TStringField
      FieldName = 'SGLLEDGERFROMACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSGLLEDGERTOACCOUNT: TStringField
      FieldName = 'SGLLEDGERTOACCOUNT'
      Size = 7
    end
    object tblReportingOptionsWGLLEDGERFROMDATE: TIntegerField
      FieldName = 'WGLLEDGERFROMDATE'
    end
    object tblReportingOptionsWGLLEDGERTODATE: TIntegerField
      FieldName = 'WGLLEDGERTODATE'
    end
    object tblReportingOptionsBGLLEDGEREACHPERIOD: TSmallintField
      FieldName = 'BGLLEDGEREACHPERIOD'
    end
    object tblReportingOptionsBGLLEDGERNEWPAGE: TSmallintField
      FieldName = 'BGLLEDGERNEWPAGE'
    end
    object tblReportingOptionsSGLMOVEMENTSEQUENCE: TStringField
      FieldName = 'SGLMOVEMENTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSGLMOVEMENTFROMACCOUNT: TStringField
      FieldName = 'SGLMOVEMENTFROMACCOUNT'
      Size = 7
    end
    object tblReportingOptionsSGLMOVEMENTTOACCOUNT: TStringField
      FieldName = 'SGLMOVEMENTTOACCOUNT'
      Size = 7
    end
    object tblReportingOptionsBGLMOVEMENTBINCLNILBAL: TSmallintField
      FieldName = 'BGLMOVEMENTBINCLNILBAL'
    end
    object tblReportingOptionsSSALESBYCUSTSEQUENCE: TStringField
      FieldName = 'SSALESBYCUSTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSALESBYCUSTFROMCUST: TStringField
      FieldName = 'SSALESBYCUSTFROMCUST'
      Size = 7
    end
    object tblReportingOptionsSSALESBYCUSTTOCUST: TStringField
      FieldName = 'SSALESBYCUSTTOCUST'
      Size = 7
    end
    object tblReportingOptionsDSALESBYCUSTFROMDATE: TDateTimeField
      FieldName = 'DSALESBYCUSTFROMDATE'
    end
    object tblReportingOptionsDSALESBYCUSTTODATE: TDateTimeField
      FieldName = 'DSALESBYCUSTTODATE'
    end
    object tblReportingOptionsSPURCHBYSUPPSEQUENCE: TStringField
      FieldName = 'SPURCHBYSUPPSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSPURCHBYSUPPFROMSUPP: TStringField
      FieldName = 'SPURCHBYSUPPFROMSUPP'
      Size = 7
    end
    object tblReportingOptionsSPURCHBYSUPPTOSUPP: TStringField
      FieldName = 'SPURCHBYSUPPTOSUPP'
      Size = 7
    end
    object tblReportingOptionsDPURCHBYSUPPFROMDATE: TDateTimeField
      FieldName = 'DPURCHBYSUPPFROMDATE'
    end
    object tblReportingOptionsDPURCHBYSUPPTODATE: TDateTimeField
      FieldName = 'DPURCHBYSUPPTODATE'
    end
    object tblReportingOptionsSSALESBYPRODSEQUENCE: TStringField
      FieldName = 'SSALESBYPRODSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSALESBYPRODFROMPROD: TStringField
      FieldName = 'SSALESBYPRODFROMPROD'
      Size = 15
    end
    object tblReportingOptionsSSALESBYPRODTOPROD: TStringField
      FieldName = 'SSALESBYPRODTOPROD'
      Size = 15
    end
    object tblReportingOptionsDSALESBYPRODFROMDATE: TDateTimeField
      FieldName = 'DSALESBYPRODFROMDATE'
    end
    object tblReportingOptionsDSALESBYPRODTODATE: TDateTimeField
      FieldName = 'DSALESBYPRODTODATE'
    end
    object tblReportingOptionsSPURCHBYPRODSEQUENCE: TStringField
      FieldName = 'SPURCHBYPRODSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSPURCHBYPRODFROMPROD: TStringField
      FieldName = 'SPURCHBYPRODFROMPROD'
      Size = 7
    end
    object tblReportingOptionsSPURCHBYPRODTOPROD: TStringField
      FieldName = 'SPURCHBYPRODTOPROD'
      Size = 7
    end
    object tblReportingOptionsDPURCHBYPRODFROMDATE: TDateTimeField
      FieldName = 'DPURCHBYPRODFROMDATE'
    end
    object tblReportingOptionsDPURCHBYPRODTODATE: TDateTimeField
      FieldName = 'DPURCHBYPRODTODATE'
    end
    object tblReportingOptionsSCUSTBYPRODSEQUENCE: TStringField
      FieldName = 'SCUSTBYPRODSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSCUSTBYPRODFROMPROD: TStringField
      FieldName = 'SCUSTBYPRODFROMPROD'
      Size = 15
    end
    object tblReportingOptionsSCUSTBYPRODTOPROD: TStringField
      FieldName = 'SCUSTBYPRODTOPROD'
      Size = 15
    end
    object tblReportingOptionsDCUSTBYPRODFROMDATE: TDateTimeField
      FieldName = 'DCUSTBYPRODFROMDATE'
    end
    object tblReportingOptionsDCUSTBYPRODTODATE: TDateTimeField
      FieldName = 'DCUSTBYPRODTODATE'
    end
    object tblReportingOptionsSSALESPERSBYPRODSEQUENCE: TStringField
      FieldName = 'SSALESPERSBYPRODSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSALESPERSBYPRODFROMPROD: TStringField
      FieldName = 'SSALESPERSBYPRODFROMPROD'
      Size = 15
    end
    object tblReportingOptionsSSALESPERSBYPRODTOPROD: TStringField
      FieldName = 'SSALESPERSBYPRODTOPROD'
      Size = 15
    end
    object tblReportingOptionsDSALESPERSBYPRODFROMDATE: TDateTimeField
      FieldName = 'DSALESPERSBYPRODFROMDATE'
    end
    object tblReportingOptionsDSALESPERSBYPRODTODATE: TDateTimeField
      FieldName = 'DSALESPERSBYPRODTODATE'
    end
    object tblReportingOptionsSPRODBYCUSTSEQUENCE: TStringField
      FieldName = 'SPRODBYCUSTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSPRODBYCUSTFROMPROD: TStringField
      FieldName = 'SPRODBYCUSTFROMPROD'
      Size = 15
    end
    object tblReportingOptionsSPRODBYCUSTTOPROD: TStringField
      FieldName = 'SPRODBYCUSTTOPROD'
      Size = 15
    end
    object tblReportingOptionsDPRODBYCUSTFROMDATE: TDateTimeField
      FieldName = 'DPRODBYCUSTFROMDATE'
    end
    object tblReportingOptionsDPRODBYCUSTTODATE: TDateTimeField
      FieldName = 'DPRODBYCUSTTODATE'
    end
    object tblReportingOptionsSCUSTBYSPERSONSPERSON: TStringField
      FieldName = 'SCUSTBYSPERSONSPERSON'
      Size = 30
    end
    object tblReportingOptionsDCUSTBYSPERSONFROMDATE: TDateTimeField
      FieldName = 'DCUSTBYSPERSONFROMDATE'
    end
    object tblReportingOptionsDCUSTBYSPERSONTODATE: TDateTimeField
      FieldName = 'DCUSTBYSPERSONTODATE'
    end
    object tblReportingOptionsSSALESBYSPSALESPERSON: TStringField
      FieldName = 'SSALESBYSPSALESPERSON'
      Size = 30
    end
    object tblReportingOptionsDSALESBYSPFROMDATE: TDateTimeField
      FieldName = 'DSALESBYSPFROMDATE'
    end
    object tblReportingOptionsDSALESBYSPTODATE: TDateTimeField
      FieldName = 'DSALESBYSPTODATE'
    end
    object tblReportingOptionsSPRODBYSPSALESPERSON: TStringField
      FieldName = 'SPRODBYSPSALESPERSON'
      Size = 30
    end
    object tblReportingOptionsDPRODBYSPFROMDATE: TDateTimeField
      FieldName = 'DPRODBYSPFROMDATE'
    end
    object tblReportingOptionsDPRODBYSPTODATE: TDateTimeField
      FieldName = 'DPRODBYSPTODATE'
    end
    object tblReportingOptionsSSALESBYGROUPFROMGROUP: TStringField
      FieldName = 'SSALESBYGROUPFROMGROUP'
      Size = 15
    end
    object tblReportingOptionsSSALESBYGROUPTOGROUP: TStringField
      FieldName = 'SSALESBYGROUPTOGROUP'
      Size = 15
    end
    object tblReportingOptionsDSALESBYGROUPFROMDATE: TDateTimeField
      FieldName = 'DSALESBYGROUPFROMDATE'
    end
    object tblReportingOptionsDSALESBYGROUPTODATE: TDateTimeField
      FieldName = 'DSALESBYGROUPTODATE'
    end
    object tblReportingOptionsSINVOICEDETAILWHICHYEAR: TStringField
      FieldName = 'SINVOICEDETAILWHICHYEAR'
      Size = 35
    end
    object tblReportingOptionsWINVOICEDETAILFROMDATE: TIntegerField
      FieldName = 'WINVOICEDETAILFROMDATE'
    end
    object tblReportingOptionsWINVOICEDETAILTODATE: TIntegerField
      FieldName = 'WINVOICEDETAILTODATE'
    end
    object tblReportingOptionsSINVOICEDETAILSTAXACCOUNT: TStringField
      FieldName = 'SINVOICEDETAILSTAXACCOUNT'
      Size = 35
    end
    object tblReportingOptionsBINVOICEDETAILSHOWDETAIL: TSmallintField
      FieldName = 'BINVOICEDETAILSHOWDETAIL'
    end
    object tblReportingOptionsSDEBTSTATEMENTFROMACC: TStringField
      FieldName = 'SDEBTSTATEMENTFROMACC'
      Size = 7
    end
    object tblReportingOptionsSDEBTSTATEMENTTOACC: TStringField
      FieldName = 'SDEBTSTATEMENTTOACC'
      Size = 7
    end
    object tblReportingOptionsFDEBTSTATEMENTMINAMOUNT: TFloatField
      FieldName = 'FDEBTSTATEMENTMINAMOUNT'
    end
    object tblReportingOptionsDDEBTSTATEMENTCURRENTDATE: TDateTimeField
      FieldName = 'DDEBTSTATEMENTCURRENTDATE'
    end
    object tblReportingOptionsDDEBTSTATEMENTDATELIMIT1: TDateTimeField
      FieldName = 'DDEBTSTATEMENTDATELIMIT1'
    end
    object tblReportingOptionsDDEBTSTATEMENTDATELIMIT2: TDateTimeField
      FieldName = 'DDEBTSTATEMENTDATELIMIT2'
    end
    object tblReportingOptionsDDEBTSTATEMENTDATELIMIT3: TDateTimeField
      FieldName = 'DDEBTSTATEMENTDATELIMIT3'
    end
    object tblReportingOptionsDDEBTSTATEMENTDATELIMIT4: TDateTimeField
      FieldName = 'DDEBTSTATEMENTDATELIMIT4'
    end
    object tblReportingOptionsSDEBTSTATEMENTAGENAME0: TStringField
      FieldName = 'SDEBTSTATEMENTAGENAME0'
      Size = 15
    end
    object tblReportingOptionsSDEBTSTATEMENTAGENAME1: TStringField
      FieldName = 'SDEBTSTATEMENTAGENAME1'
      Size = 15
    end
    object tblReportingOptionsSDEBTSTATEMENTAGENAME2: TStringField
      FieldName = 'SDEBTSTATEMENTAGENAME2'
      Size = 15
    end
    object tblReportingOptionsSDEBTSTATEMENTAGENAME3: TStringField
      FieldName = 'SDEBTSTATEMENTAGENAME3'
      Size = 15
    end
    object tblReportingOptionsWDEBTSTATEMENTMONTH1: TIntegerField
      FieldName = 'WDEBTSTATEMENTMONTH1'
    end
    object tblReportingOptionsWDEBTSTATEMENTMONTH2: TIntegerField
      FieldName = 'WDEBTSTATEMENTMONTH2'
    end
    object tblReportingOptionsWDEBTSTATEMENTMONTH3: TIntegerField
      FieldName = 'WDEBTSTATEMENTMONTH3'
    end
    object tblReportingOptionsBDEBTSTATEMENTTAXSEPERATE: TSmallintField
      FieldName = 'BDEBTSTATEMENTTAXSEPERATE'
    end
    object tblReportingOptionsBDEBTSTATEMENTTAXTRANSACT: TSmallintField
      FieldName = 'BDEBTSTATEMENTTAXTRANSACT'
    end
    object tblReportingOptionsBDEBTSTATEMENTOPENITEM: TSmallintField
      FieldName = 'BDEBTSTATEMENTOPENITEM'
    end
    object tblReportingOptionsWINCOMESTMNTFROMDATEID: TIntegerField
      FieldName = 'WINCOMESTMNTFROMDATEID'
    end
    object tblReportingOptionsWINCOMESTMNTTODATEID: TIntegerField
      FieldName = 'WINCOMESTMNTTODATEID'
    end
    object tblReportingOptionsBINCOMESTMNTDISPLAYSUBACC: TSmallintField
      FieldName = 'BINCOMESTMNTDISPLAYSUBACC'
    end
    object tblReportingOptionsBINCOMESTMNTNILBALANCES: TSmallintField
      FieldName = 'BINCOMESTMNTNILBALANCES'
    end
    object tblReportingOptionsSINCOMESTMNTSSEQUENCE: TStringField
      FieldName = 'SINCOMESTMNTSSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSREMITTANCEFROMACC: TStringField
      FieldName = 'SREMITTANCEFROMACC'
      Size = 7
    end
    object tblReportingOptionsSREMITTANCETOACC: TStringField
      FieldName = 'SREMITTANCETOACC'
      Size = 7
    end
    object tblReportingOptionsFREMITTANCEMINAMOUNT: TFloatField
      FieldName = 'FREMITTANCEMINAMOUNT'
    end
    object tblReportingOptionsDREMITTANCEDATELIMIT1: TDateTimeField
      FieldName = 'DREMITTANCEDATELIMIT1'
    end
    object tblReportingOptionsDREMITTANCEDATELIMIT2: TDateTimeField
      FieldName = 'DREMITTANCEDATELIMIT2'
    end
    object tblReportingOptionsDREMITTANCEDATELIMIT3: TDateTimeField
      FieldName = 'DREMITTANCEDATELIMIT3'
    end
    object tblReportingOptionsDREMITTANCEDATELIMIT4: TDateTimeField
      FieldName = 'DREMITTANCEDATELIMIT4'
    end
    object tblReportingOptionsSREMITTANCEAGENAME0: TStringField
      FieldName = 'SREMITTANCEAGENAME0'
      Size = 15
    end
    object tblReportingOptionsSREMITTANCEAGENAME1: TStringField
      FieldName = 'SREMITTANCEAGENAME1'
      Size = 15
    end
    object tblReportingOptionsSREMITTANCEAGENAME2: TStringField
      FieldName = 'SREMITTANCEAGENAME2'
      Size = 15
    end
    object tblReportingOptionsSREMITTANCEAGENAME3: TStringField
      FieldName = 'SREMITTANCEAGENAME3'
      Size = 15
    end
    object tblReportingOptionsWREMITTANCEMONTH1: TIntegerField
      FieldName = 'WREMITTANCEMONTH1'
    end
    object tblReportingOptionsWREMITTANCEMONTH2: TIntegerField
      FieldName = 'WREMITTANCEMONTH2'
    end
    object tblReportingOptionsWREMITTANCEMONTH3: TIntegerField
      FieldName = 'WREMITTANCEMONTH3'
    end
    object tblReportingOptionsBREMITTANCETAXSEPERATE: TSmallintField
      FieldName = 'BREMITTANCETAXSEPERATE'
    end
    object tblReportingOptionsBREMITTANCETAXTRANSACT: TSmallintField
      FieldName = 'BREMITTANCETAXTRANSACT'
    end
    object tblReportingOptionsBREMITTANCEOPENITEM: TSmallintField
      FieldName = 'BREMITTANCEOPENITEM'
    end
    object tblReportingOptionsWREMITTANCEFROMDATEID: TIntegerField
      FieldName = 'WREMITTANCEFROMDATEID'
    end
    object tblReportingOptionsWREMITTANCETODATEID: TIntegerField
      FieldName = 'WREMITTANCETODATEID'
    end
    object tblReportingOptionsBREMITTANCEDISPLAYSUBACC: TSmallintField
      FieldName = 'BREMITTANCEDISPLAYSUBACC'
    end
    object tblReportingOptionsBREMITTANCENILBALANCES: TSmallintField
      FieldName = 'BREMITTANCENILBALANCES'
    end
    object tblReportingOptionsSREMITTANCESSEQUENCE: TStringField
      FieldName = 'SREMITTANCESSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsWBALSHEETFROMDATEID: TIntegerField
      FieldName = 'WBALSHEETFROMDATEID'
    end
    object tblReportingOptionsWBALSHEETTODATEID: TIntegerField
      FieldName = 'WBALSHEETTODATEID'
    end
    object tblReportingOptionsBBALSHEETDISPLAYSUBACCS: TSmallintField
      FieldName = 'BBALSHEETDISPLAYSUBACCS'
    end
    object tblReportingOptionsBBALSHEETNILBALANCES: TSmallintField
      FieldName = 'BBALSHEETNILBALANCES'
    end
    object tblReportingOptionsSBALSHEETSSEQUENCE: TStringField
      FieldName = 'SBALSHEETSSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSALESPERSBYCUSTSEQUENCE: TStringField
      FieldName = 'SSALESPERSBYCUSTSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSSALESPERSBYCUSTFROMCUST: TStringField
      FieldName = 'SSALESPERSBYCUSTFROMCUST'
      Size = 7
    end
    object tblReportingOptionsSSALESPERSBYCUSTTOCUST: TStringField
      FieldName = 'SSALESPERSBYCUSTTOCUST'
      Size = 7
    end
    object tblReportingOptionsDSALESPERSBYCUSTFROMDATE: TDateTimeField
      FieldName = 'DSALESPERSBYCUSTFROMDATE'
    end
    object tblReportingOptionsDSALESPERSBYCUSTTODATE: TDateTimeField
      FieldName = 'DSALESPERSBYCUSTTODATE'
    end
    object tblReportingOptionsWDATAENTRYDRCRFORMAT: TIntegerField
      FieldName = 'WDATAENTRYDRCRFORMAT'
    end
    object tblReportingOptionsWDECIMAL: TIntegerField
      FieldName = 'WDECIMAL'
    end
    object tblReportingOptionsSLABELFROMACC: TStringField
      FieldName = 'SLABELFROMACC'
      Size = 7
    end
    object tblReportingOptionsSLABELTOACC: TStringField
      FieldName = 'SLABELTOACC'
      Size = 7
    end
    object tblReportingOptionsSLABELSSEQUENCE: TStringField
      FieldName = 'SLABELSSEQUENCE'
      Size = 35
    end
    object tblReportingOptionsSLABELSFILE: TStringField
      FieldName = 'SLABELSFILE'
      Size = 35
    end
  end
  object dsDocHeader: TDataSource
    DataSet = tblDocHeader
    Left = 848
    Top = 527
  end
  object dsDocLine: TDataSource
    DataSet = tblDocLine
    Left = 839
    Top = 506
  end
  object tblDocLine: TuniTable
    Connection = ZMainconnection
    TableName = 'DocLine'
    Left = 40
    Top = 550
    object tblDocLineWDOCLINEID: TIntegerField
      FieldName = 'WDOCLINEID'
    end
    object tblDocLineWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object tblDocLineWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object tblDocLineWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object tblDocLineWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object tblDocLineFQTYORDERED: TFloatField
      FieldName = 'FQTYORDERED'
    end
    object tblDocLineFQTYSHIPPED: TFloatField
      FieldName = 'FQTYSHIPPED'
    end
    object tblDocLineFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object tblDocLineFITEMDISCOUNT: TFloatField
      FieldName = 'FITEMDISCOUNT'
    end
    object tblDocLineWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblDocLineFEXCLUSIVEAMT: TFloatField
      FieldName = 'FEXCLUSIVEAMT'
    end
    object tblDocLineFINCLUSIVEAMT: TFloatField
      FieldName = 'FINCLUSIVEAMT'
    end
    object tblDocLineFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblDocLineDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblDocLineSUNIT: TStringField
      FieldName = 'SUNIT'
      Size = 8
    end
    object tblDocLineSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object tblDocLineWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblDocLineWSERIALNOID: TIntegerField
      FieldName = 'WSERIALNOID'
    end
  end
  object dsTransaction: TDataSource
    DataSet = tblTransaction
    Left = 837
    Top = 532
  end
  object tblTransaction: TuniTable
    Connection = ZMainconnection
    BeforePost = tblTransactionBeforePost
    TableName = 'TransAct'
    Left = 24
    Top = 177
    object tblTransactionWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object tblTransactionWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object tblTransactionWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object tblTransactionWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object tblTransactionBCARRIEDFORWARD: TSmallintField
      FieldName = 'BCARRIEDFORWARD'
    end
    object tblTransactionBLASTYEAR: TSmallintField
      FieldName = 'BLASTYEAR'
    end
    object tblTransactionBLINKSUSED: TSmallintField
      FieldName = 'BLINKSUSED'
    end
    object tblTransactionBMULTIPLEITEMS: TSmallintField
      FieldName = 'BMULTIPLEITEMS'
    end
    object tblTransactionWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblTransactionDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblTransactionWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
    end
    object tblTransactionSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblTransactionFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object tblTransactionWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object tblTransactionFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblTransactionFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblTransactionFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object tblTransactionBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object tblTransactionWBALANCINGACCOUNTID: TIntegerField
      FieldName = 'WBALANCINGACCOUNTID'
    end
    object tblTransactionWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object tblTransactionWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblTransactionFFOREXAMOUNT: TFloatField
      FieldName = 'FFOREXAMOUNT'
    end
    object tblTransactionWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblTransactionUNUSED: TIntegerField
      FieldName = 'UNUSED'
    end
    object tblTransactionDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblTransactionBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object tblTransactionWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object tblTransactionFCURRENCYRATE2: TFloatField
      FieldName = 'FCURRENCYRATE2'
    end
    object tblTransactionFTAXRATE2: TFloatField
      FieldName = 'FTAXRATE2'
    end
    object tblTransactionFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object tblTransactionWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object tblTransactionWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblTransactionBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object tblTransactionWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object tblTransactionWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblTransactionWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblTransactionWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object tblTransactionWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
  end
  object dsMessage: TDataSource
    DataSet = tblMessage
    Left = 813
    Top = 507
  end
  object qryDebtAge: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT tmpAgeAn.WAccountID, tmpAgeAn.SDescription, tmpAgeAn.SAcc' +
        'ountCode,'
      
        'Transact.WTransactionID, Transact.FOutstandingAmount, Transact.D' +
        'Date,'
      'BatTypes.SDescription, Transact.SReference, FAmount,'
      
        'A.WReportingGroup1ID,A.WReportingGroup2ID,Transact.SReference, F' +
        'Amount'
      'FROM tmpAgeAn, Transact, BatTypes,Account A'
      'WHERE (Transact.WAccountID = tmpAgeAn.WAccountID)'
      'AND (Account.WAccountID = tmpAgeAn.WAccountID)'
      'AND (BatTypes.WBatchTypeID = Transact.WBatchTypeID)'
      'AND (WTransactionID > 0) and ((FOutstandingamount * 100) <> 0)')
    Params = <>
    Left = 772
    Top = 74
    object qryDebtAgeWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryDebtAgeSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryDebtAgeSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object qryDebtAgeWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object qryDebtAgeFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object qryDebtAgeDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryDebtAgeSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 16
    end
    object qryDebtAgeSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryDebtAgeFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object qryDebtAgeWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qryDebtAgeWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qryDebtAgeSREFERENCE_1: TStringField
      FieldName = 'SREFERENCE_1'
      Size = 15
    end
    object qryDebtAgeFAMOUNT_1: TFloatField
      FieldName = 'FAMOUNT_1'
    end
  end
  object qryTransactionReport: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT Account.WAccountID, SMAINACCOUNTCODE, SSUBACCOUNTCODE, SD' +
        'escription, '
      'WAccountTypeID, DDate, WPeriodID,WBatchTypeID, SReference, '
      
        'WDescriptionID, FAmount , SACCOUNTCODE,WTransactionID , FTaxRate' +
        ', WJobCodeID'
      'FROM Account, Transact '
      'Where Account.WAccountID = Transact.WAccountID'
      'AND Transact.WTransactionID > 0'
      'AND Transact.WPeriodID >= :FromDate'
      'AND Transact.WPeriodID <= :ToDate'
      'And   Account.SACCOUNTCODE  >= :FromAcc'
      'AND  Account.SACCOUNTCODE  <= :ToAcc')
    Params = <
      item
        DataType = ftInteger
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ToDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FromAcc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToAcc'
        ParamType = ptUnknown
      end>
    DataSource = dSACCOUNT
    Left = 376
    Top = 286
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ToDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FromAcc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToAcc'
        ParamType = ptUnknown
      end>
    object qryTransactionReportWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryTransactionReportSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qryTransactionReportSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qryTransactionReportSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryTransactionReportWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object qryTransactionReportDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryTransactionReportWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
    end
    object qryTransactionReportWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object qryTransactionReportSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryTransactionReportWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object qryTransactionReportFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object qryTransactionReportSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qryTransactionReportWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object qryTransactionReportFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object qryTransactionReportWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
  end
  object wwqryOpenDebits: TuniQuery
    Connection = ZMainconnection
    UpdateObject = DtUpdate
    CachedUpdates = True
    SQL.Strings = (
      
        'SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingA' +
        'mount,'
      '             Messages.SDescription,BUnused'
      'FROM Transact,Messages'
      'WHERE (WAccountID = :Account) '
      'AND (FOutstandingAmount > 0)'
      'And (Transact.WDescriptionID=Messages.WMessageID)'
      'ORDER BY Transact.DDate')
    Params = <
      item
        DataType = ftInteger
        Name = 'Account'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account'
        ParamType = ptUnknown
      end>
    object wwqryOpenDebitsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object wwqryOpenDebitsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object wwqryOpenDebitsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object wwqryOpenDebitsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object wwqryOpenDebitsFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object wwqryOpenDebitsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object wwqryOpenDebitsBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
  end
  object wwdsOpenDebits: TDataSource
    DataSet = wwqryOpenDebits
    Left = 816
    Top = 489
  end
  object wwqryOpenCredits: TuniQuery
    Connection = ZMainconnection
    UpdateObject = CtUpdate
    CachedUpdates = True
    SQL.Strings = (
      
        'SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingA' +
        'mount,'
      '             Messages.SDescription, BUnused'
      'FROM Transact,Messages'
      'WHERE (WAccountID = :Account) '
      'AND (FOutstandingAmount < 0)'
      'And (Transact.WDescriptionID=Messages.WMessageID)'
      'ORDER BY Transact.DDate;')
    Params = <
      item
        DataType = ftInteger
        Name = 'Account'
        ParamType = ptUnknown
      end>
    Left = 266
    Top = 463
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account'
        ParamType = ptUnknown
      end>
    object wwqryOpenCreditsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object wwqryOpenCreditsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object wwqryOpenCreditsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object wwqryOpenCreditsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object wwqryOpenCreditsFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object wwqryOpenCreditsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object wwqryOpenCreditsBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
  end
  object wwdsOpenCredits: TDataSource
    DataSet = wwqryOpenCredits
    Left = 834
    Top = 498
  end
  object qrySalesByCustomer: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT SMAINACCOUNTCODE, SSUBACCOUNTCODE, Account.SDescription, '
      
        'StockTrn.WStockTransactionID, SDocNo, StockTrn.DDate,  StockTrn.' +
        'WDocTypeID,'
      
        'StockTrn.FSellingPrice, StockTrn.FCostPrice, StockTrn.FQty, SAcc' +
        'ountCode,'
      'WAccountTypeID , DocHead.BExclusive'
      'FROM Account, StockTrn, DocHead'
      'WHERE (SACCOUNTCODE >= :FromCode)'
      'AND (SACCOUNTCODE <= :ToCode)'
      'AND (Account.WAccountID = StockTrn.WAccountID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      
        'ORDER BY SACCOUNTCODE, StockTrn.DDate, StockTrn.WDocTypeID, SDoc' +
        'No;')
    Params = <
      item
        DataType = ftString
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    Left = 614
    Top = 469
    ParamData = <
      item
        DataType = ftString
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    object qrySalesByCustomerSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qrySalesByCustomerSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qrySalesByCustomerSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qrySalesByCustomerWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qrySalesByCustomerSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qrySalesByCustomerDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qrySalesByCustomerWDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object qrySalesByCustomerFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qrySalesByCustomerFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qrySalesByCustomerFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object qrySalesByCustomerSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qrySalesByCustomerWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object qrySalesByCustomerBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
  end
  object qrySalesByProduct: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT SSTOCKCODE, StockTrn.DDate, StockTrn.WStockTransactionID,' +
        ' '
      
        'Stock.SDescription, SDocNo, StockTrn.FSellingPrice, StockTrn.FCo' +
        'stPrice, '
      'StockTrn.FQty , DocHead.WTypeID'
      'FROM Stock, StockTrn, DocHead'
      'WHERE (SSTOCKCODE >= :FromCode)'
      'AND (SSTOCKCODE <= :ToCode)'
      'AND (Stock.WStockID = StockTrn.WStockID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'ORDER BY SSTOCKCODE, StockTrn.DDate, SDocNo;')
    Params = <
      item
        DataType = ftString
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    Left = 572
    Top = 339
    ParamData = <
      item
        DataType = ftString
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    object qrySalesByProductSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object qrySalesByProductDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qrySalesByProductWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qrySalesByProductSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qrySalesByProductSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qrySalesByProductFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qrySalesByProductFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qrySalesByProductFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object qrySalesByProductWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
  end
  object qrySalesBySalesperson: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT StockTrn.WStockTransactionID, Groups.WGroupID, '
      
        'Groups.SDescription, SDocNo, StockTrn.DDate, StockTrn.FSellingPr' +
        'ice, '
      'StockTrn.FCostPrice, StockTrn.FQty, Stock.SSTOCKCODE,'
      'Stocktrn.WDocTypeID, Account.SACCOUNTCODE, '
      'Stock.WReportingGroup1ID, Stock.WReportingGroup2ID'
      'FROM Groups, Stock, StockTrn, DocHead, Account'
      'WHERE (Groups.WGroupID = StockTrn.WSalesmanID)'
      'AND (DocHead.WaccountID = Account.WaccountID)'
      'AND (Stock.WStockID = StockTrn.WStockID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'AND (Groups.WGroupTypeID = 31)'
      'AND (StockTrn.DDate >= :FromDate)'
      'AND (StockTrn.DDate <= :ToDate)'
      'AND ((Stocktrn.WDocTypeID = 10) OR (Stocktrn.WDocTypeID = 11))'
      
        'ORDER BY Groups.WGroupID,Stocktrn.WDocTypeID , StockTrn.DDate, S' +
        'DocNo,'
      '     Stock.WReportingGroup1ID, Stock.WReportingGroup2ID;')
    Params = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    Left = 677
    Top = 343
    ParamData = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object qrySalesBySalespersonWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qrySalesBySalespersonWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object qrySalesBySalespersonSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object qrySalesBySalespersonSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qrySalesBySalespersonDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qrySalesBySalespersonFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qrySalesBySalespersonFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qrySalesBySalespersonFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object qrySalesBySalespersonSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object qrySalesBySalespersonWDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object qrySalesBySalespersonSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qrySalesBySalespersonWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qrySalesBySalespersonWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
  end
  object qryInvDetail: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT BatTypes.SDescription, Transact.DDate, Transact.SReferenc' +
        'e,'
      
        'messages.SDescription as SDescription_1, Account.SMainAccountCod' +
        'e, '
      'Account.SSUBACCOUNTCODE, Transact.FAmount, Transact.FTaxAmount,'
      'Transact.WTaxAccountID, BatTypes.BcashBook , Transact.WPeriodID,'
      
        'Account.SACCOUNTCODE, Account.WAccountTypeID, Transact.FTaxRate ' +
        ','
      'Transact.WAccountID'
      'FROM BatTypes, Transact, Account, messages'
      'WHERE (Account.WAccountID = Transact.WAccountID)'
      'AND (Transact.WTransactionID > 0)'
      'AND (BatTypes.WBatchTypeID = Transact.WBatchTypeID)'
      'AND (messages.WMessageID = Transact.WDescriptionID)'
      'AND (Transact.WPeriodID >= :FromDate)'
      'AND (Transact.WPeriodID <= :ToDate)'
      'ORDER BY Transact.WTaxAccountID,BatTypes.SDescription, '
      '      Transact.DDate;')
    Params = <
      item
        DataType = ftInteger
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    Left = 117
    Top = 276
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object qryInvDetailSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object qryInvDetailDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryInvDetailSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryInvDetailSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 35
    end
    object qryInvDetailSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qryInvDetailSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qryInvDetailFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object qryInvDetailFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object qryInvDetailWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object qryInvDetailBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object qryInvDetailWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
    end
    object qryInvDetailSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qryInvDetailWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object qryInvDetailFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object qryInvDetailWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object qryReconReport: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT BatTypes.SDescription, Transact.SReference, Transact.DDat' +
        'e, '
      'messages.SDescription, Transact.FAmount'
      'FROM Transact, messages, BatTypes'
      'WHERE (Transact.WTransactionID > 0)'
      'AND (Transact.BReconciled <> 1)'
      'AND (messages.WMessageID = Transact.WDescriptionID)'
      'AND (BatTypes.WBatchTypeID = Transact.WBatchTypeID)'
      'ORDER BY BatTypes.SDescription;')
    Params = <>
    Left = 202
    Top = 297
    object qryReconReportSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object qryReconReportSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryReconReportDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryReconReportSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 35
    end
    object qryReconReportFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
  end
  object qrySalesByGroup: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT StockTrn.WStockTransactionID, Groups.WGroupID, '
      
        'Groups.WGroupTypeID, Groups.SDescription, SDocNo, StockTrn.DDate' +
        ', '
      'StockTrn.FSellingPrice, StockTrn.FCostPrice, StockTrn.FQty'
      'FROM Groups, Stock, StockTrn, DocHead'
      'WHERE (Groups.WGroupID = DocHead.WReportingGroup1ID)'
      'AND (Stock.WStockID = StockTrn.WStockID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'AND (StockTrn.DDate >= :FromDate)'
      'AND (StockTrn.DDate <= :ToDate)'
      'AND ((Stocktrn.WDocTypeID = 10) OR (Stocktrn.WDocTypeID = 11))'
      'ORDER BY Groups.WGroupID, StockTrn.DDate;')
    Params = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    Left = 515
    Top = 176
    ParamData = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object qrySalesByGroupWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qrySalesByGroupWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object qrySalesByGroupWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object qrySalesByGroupSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object qrySalesByGroupSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qrySalesByGroupDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qrySalesByGroupFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qrySalesByGroupFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qrySalesByGroupFQTY: TFloatField
      FieldName = 'FQTY'
    end
  end
  object qryDebtStatement: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT tmpAgeAn.WAccountID, tmpAgeAn.SDescription, '
      ' Transact.WTransactionID, Transact.FAmount, Transact.DDate,'
      ' Transact.FOutstandingAmount, BatTypes.SDescription, '
      
        ' Transact.SReference, Debtor.SPostal1, Debtor.SPostal2, Debtor.S' +
        'Postal3, '
      ' Debtor.SPostalCode, tmpAgeAn.WAccountTypeID, '
      ' Transact.WDescriptionID, '
      
        ' tmpAgeAn.SACCOUNTCODE,Transact.FTaxRate , Transact.WTaxAccountI' +
        'D, '
      ' Debtor.SMessage,Debtor.WContactID '
      ' FROM Transact , BatTypes, Debtor , tmpAgeAn '
      ' Where (Transact.WAccountID = tmpAgeAn.WAccountID) '
      ' AND (Debtor.WAccountID = tmpAgeAn.WAccountID)'
      ' AND (BatTypes.WBatchTypeID = Transact.WBatchTypeID) '
      ' AND (WTransactionID > 0) ')
    Params = <>
    Left = 620
    Top = 541
    object qryDebtStatementWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object qryDebtStatementSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryDebtStatementWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object qryDebtStatementFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object qryDebtStatementDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryDebtStatementFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object qryDebtStatementSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 16
    end
    object qryDebtStatementSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryDebtStatementSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object qryDebtStatementSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object qryDebtStatementSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object qryDebtStatementSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object qryDebtStatementWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object qryDebtStatementWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object qryDebtStatementSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 8
    end
    object qryDebtStatementFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object qryDebtStatementWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object qryDebtStatementSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object qryDebtStatementWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
  end
  object qryStockMovement: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT Stock.SSTOCKCODE, Stock.SDescription as LDescription,Stoc' +
        'kTrn.DDate, '
      
        'Types.SDescription, Groups.SDescription, DocHead.SDocNo,WDocType' +
        'ID, '
      
        'StockTrn.WStockID, StockTrn.FQty, StockTrn.FCostPrice,Stock.FOpe' +
        'ningQty ,'
      'StockTrn.FSellingPrice, StockTrn.WSalesmanID'
      'FROM Stock, StockTrn, Types, Groups, DocHead'
      'WHERE (Stock.WStockID = StockTrn.WStockID)'
      'AND (Types.WTypeID = StockTrn.WDocTypeID)'
      'AND (Groups.WGroupID = StockTrn.WSalesmanID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'AND (StockTrn.WStockTransactionID > 0)'
      'AND (StockTrn.DDate >= :FromDate)'
      'AND (StockTrn.DDate <= :ToDate)'
      'ORDER BY Stock.SSTOCKCODE, StockTrn.DDate')
    Params = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    Left = 678
    Top = 326
    ParamData = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object qryStockMovementSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object qryStockMovementLDESCRIPTION: TStringField
      FieldName = 'LDESCRIPTION'
      Size = 35
    end
    object qryStockMovementDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryStockMovementSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object qryStockMovementSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 30
    end
    object qryStockMovementSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qryStockMovementWDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object qryStockMovementWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object qryStockMovementFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object qryStockMovementFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qryStockMovementFOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object qryStockMovementFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qryStockMovementWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
  end
  object dsRepHead: TDataSource
    DataSet = tblRepHead
    Left = 839
    Top = 531
  end
  object tblRepHead: TuniTable
    Connection = ZMainconnection
    TableName = 'RepHead'
    Left = 543
    Top = 503
    object tblRepHeadWREPORTID: TIntegerField
      FieldName = 'WREPORTID'
    end
    object tblRepHeadSREPORTNAME: TStringField
      FieldName = 'SREPORTNAME'
      Size = 15
    end
    object tblRepHeadSTITLE1: TStringField
      FieldName = 'STITLE1'
      Size = 31
    end
    object tblRepHeadSTITLE2: TStringField
      FieldName = 'STITLE2'
      Size = 31
    end
    object tblRepHeadBDISPLAYDECIMAL: TSmallintField
      FieldName = 'BDISPLAYDECIMAL'
    end
    object tblRepHeadBCOMPRESSPRINT: TSmallintField
      FieldName = 'BCOMPRESSPRINT'
    end
    object tblRepHeadWNOOFCOLUMNS: TIntegerField
      FieldName = 'WNOOFCOLUMNS'
    end
    object tblRepHeadWREPORTTYPEID: TIntegerField
      FieldName = 'WREPORTTYPEID'
    end
    object tblRepHeadDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsRepLine: TDataSource
    DataSet = tblRepLine
    Left = 821
    Top = 482
  end
  object tblRepLine: TuniTable
    Connection = ZMainconnection
    TableName = 'RepLine'
    Left = 117
    Top = 252
    object tblRepLineWREPORTID: TIntegerField
      FieldName = 'WREPORTID'
    end
    object tblRepLineWROWID: TIntegerField
      FieldName = 'WROWID'
    end
    object tblRepLineWROWTYPEID: TIntegerField
      FieldName = 'WROWTYPEID'
    end
    object tblRepLineWROWITEMID: TIntegerField
      FieldName = 'WROWITEMID'
    end
    object tblRepLineSITEMNAME: TStringField
      FieldName = 'SITEMNAME'
      Size = 8
    end
    object tblRepLineSROWDESCRIPTION: TStringField
      FieldName = 'SROWDESCRIPTION'
      Size = 35
    end
    object tblRepLineBMAINACCOUNT: TSmallintField
      FieldName = 'BMAINACCOUNT'
    end
    object tblRepLineBSUPRESSPRINT: TSmallintField
      FieldName = 'BSUPRESSPRINT'
    end
    object tblRepLineSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblRepLineSCOLUMN1: TStringField
      FieldName = 'SCOLUMN1'
      Size = 30
    end
    object tblRepLineSCOLUMN2: TStringField
      FieldName = 'SCOLUMN2'
      Size = 30
    end
    object tblRepLineSCOLUMN3: TStringField
      FieldName = 'SCOLUMN3'
      Size = 30
    end
    object tblRepLineSCOLUMN4: TStringField
      FieldName = 'SCOLUMN4'
      Size = 30
    end
    object tblRepLineSCOLUMN5: TStringField
      FieldName = 'SCOLUMN5'
      Size = 30
    end
    object tblRepLineSCOLUMN6: TStringField
      FieldName = 'SCOLUMN6'
      Size = 30
    end
    object tblRepLineSCOLUMN7: TStringField
      FieldName = 'SCOLUMN7'
      Size = 30
    end
    object tblRepLineSCOLUMN8: TStringField
      FieldName = 'SCOLUMN8'
      Size = 30
    end
    object tblRepLineSCOLUMN9: TStringField
      FieldName = 'SCOLUMN9'
      Size = 30
    end
    object tblRepLineSCOLUMN10: TStringField
      FieldName = 'SCOLUMN10'
      Size = 30
    end
    object tblRepLineSCOLUMN11: TStringField
      FieldName = 'SCOLUMN11'
      Size = 30
    end
    object tblRepLineSCOLUMN12: TStringField
      FieldName = 'SCOLUMN12'
      Size = 30
    end
    object tblRepLineSCOLUMN13: TStringField
      FieldName = 'SCOLUMN13'
      Size = 30
    end
    object tblRepLineSCOLUMN14: TStringField
      FieldName = 'SCOLUMN14'
      Size = 30
    end
    object tblRepLineSCOLUMN15: TStringField
      FieldName = 'SCOLUMN15'
      Size = 30
    end
    object tblRepLineDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsRepCols: TDataSource
    DataSet = tblRepCols
    Left = 828
    Top = 512
  end
  object tblRepCols: TuniTable
    Connection = ZMainconnection
    TableName = 'RepCols'
    Left = 196
    Top = 452
    object tblRepColsWREPORTID: TIntegerField
      FieldName = 'WREPORTID'
    end
    object tblRepColsWCOLUMNID: TIntegerField
      FieldName = 'WCOLUMNID'
    end
    object tblRepColsSHEADING1: TStringField
      FieldName = 'SHEADING1'
      Size = 15
    end
    object tblRepColsSHEADING2: TStringField
      FieldName = 'SHEADING2'
      Size = 15
    end
    object tblRepColsWCOLUMNTYPEID: TIntegerField
      FieldName = 'WCOLUMNTYPEID'
    end
    object tblRepColsWPERIODSTART: TIntegerField
      FieldName = 'WPERIODSTART'
    end
    object tblRepColsWPERIODEND: TIntegerField
      FieldName = 'WPERIODEND'
    end
    object tblRepColsSFORMULA: TStringField
      FieldName = 'SFORMULA'
      Size = 15
    end
    object tblRepColsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsType: TDataSource
    DataSet = tblType
    Left = 770
    Top = 442
  end
  object tblType: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLTypes
    SQL.Strings = (
      'select * from TYPES')
    Params = <>
    Left = 458
    Top = 190
    object tblTypeWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object tblTypeSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object tblTypeWTYPEPARENT: TIntegerField
      FieldName = 'WTYPEPARENT'
    end
  end
  object qryProductByCustomer: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE, '
      'Account.SDescription, StockTrn.WStockID, StockTrn.WAccountID, '
      
        'StockTrn.DDate, SUM(StockTrn.FQty) SUMQTY, SUM(StockTrn.FSelling' +
        'Price * -StockTrn.FQty ) As SumNettSales, '
      
        'SUM(StockTrn.FCostPrice* -StockTrn.FQty)  As SumNettCost , Stock' +
        '.SSTOCKCODE, Stock.SDescription'
      'FROM Account, StockTrn, Stock'
      'WHERE (Stock.WStockID = StockTrn.WStockID)'
      'AND (Account.WAccountID = StockTrn.WAccountID)'
      'AND (Account.WAccountTypeID=1)'
      
        'AND (StockTrn.DDate >= :FromDate) AND (StockTrn.DDate <= :ToDate' +
        ')'
      'AND (Account.WAccountID<>0)'
      'GROUP BY Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE, '
      'Account.SDescription, StockTrn.WAccountID, StockTrn.WStockID, '
      'StockTrn.DDate, Stock.SSTOCKCODE, Stock.SDescription'
      
        'ORDER BY StockTrn.WAccountID, Stock.SDescription,Stock.SStockCod' +
        'e;')
    Params = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    Left = 494
    Top = 57
    ParamData = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object qryProductByCustomerSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qryProductByCustomerSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qryProductByCustomerSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryProductByCustomerWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object qryProductByCustomerWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryProductByCustomerDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryProductByCustomerSUMQTY: TFloatField
      FieldName = 'SUMQTY'
    end
    object qryProductByCustomerSUMNETTSALES: TFloatField
      FieldName = 'SUMNETTSALES'
    end
    object qryProductByCustomerSUMNETTCOST: TFloatField
      FieldName = 'SUMNETTCOST'
    end
    object qryProductByCustomerSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object qryProductByCustomerSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 35
    end
  end
  object qryCustomerBySalesperson: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE, '
      
        'Account.SDescription, StockTrn.WSalesmanID, StockTrn.WAccountID,' +
        ' '
      
        'StockTrn.DDate, SUM(StockTrn.FQty) SumQty, SUM(StockTrn.FSelling' +
        'Price * StockTrn.FQty*-1) As TotalNettSales, '
      
        'SUM(StockTrn.FCostPrice * StockTrn.FQty*-1) As TotalNettCost, Gr' +
        'oups.WGroupID, Groups.SDescription'
      'FROM Account, StockTrn, Groups'
      'WHERE (Groups.WGroupID = StockTrn.WSalesmanID)'
      'AND (Account.WAccountID = StockTrn.WAccountID)'
      'AND (Groups.WGroupID<>0)'
      'AND (Account.WAccountTypeID=1)'
      
        'AND (StockTrn.DDate >= :FromDate) AND (StockTrn.DDate <= :ToDate' +
        ')'
      'GROUP BY StockTrn.WSalesmanID, StockTrn.WAccountID, '
      'StockTrn.DDate, Groups.WGroupID, Groups.SDescription,'
      'Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE, '
      'Account.SDescription'
      'ORDER BY StockTrn.WSalesmanID, StockTrn.WAccountID;')
    Params = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    Left = 701
    Top = 157
    ParamData = <
      item
        DataType = ftDate
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object qryCustomerBySalespersonSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qryCustomerBySalespersonSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qryCustomerBySalespersonSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryCustomerBySalespersonWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object qryCustomerBySalespersonWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryCustomerBySalespersonDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryCustomerBySalespersonSUMQTY: TFloatField
      FieldName = 'SUMQTY'
    end
    object qryCustomerBySalespersonTOTALNETTSALES: TFloatField
      FieldName = 'TOTALNETTSALES'
    end
    object qryCustomerBySalespersonTOTALNETTCOST: TFloatField
      FieldName = 'TOTALNETTCOST'
    end
    object qryCustomerBySalespersonWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object qryCustomerBySalespersonSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 30
    end
  end
  object qGenMast: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'select * from groups'
      'where WGroupTypeID = 20'
      'or WGroupTypeID = 21')
    Params = <>
    Left = 408
    Top = 349
  end
  object dsGenMast: TDataSource
    DataSet = qGenMast
    Left = 833
    Top = 502
  end
  object qGenDet: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'select * from Account')
    Params = <>
    DataSource = dsGenMast
    Left = 196
    Top = 594
    object qGenDetWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qGenDetSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qGenDetSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qGenDetWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object qGenDetSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qGenDetWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qGenDetWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qGenDetBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
    end
    object qGenDetBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
    end
    object qGenDetSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qGenDetDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object qGenDetWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
  end
  object dsGenDet: TDataSource
    DataSet = qGenDet
    Left = 821
    Top = 494
  end
  object qGen: TuniQuery
    Connection = ZMainconnection
    AfterClose = qGenAfterClose
    Params = <>
    Left = 645
    Top = 232
  end
  object qGenII: TuniQuery
    Connection = ZMainconnection
    Params = <>
    Left = 610
    Top = 215
  end
  object Temp_1: TuniTable
    Connection = ZMainconnection
    TableName = 'Temp1'
    Left = 401
    Top = 453
    object Temp_1SMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object Temp_1SSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object Temp_1WDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object Temp_1SDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object Temp_1WSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object Temp_1WGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object Temp_1SDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object Temp_1DDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object Temp_1WSALESPERSONID: TIntegerField
      FieldName = 'WSALESPERSONID'
    end
    object Temp_1SSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 35
    end
    object Temp_1FSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object Temp_1FCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object Temp_1FQTY: TFloatField
      FieldName = 'FQTY'
    end
  end
  object qrySalesPersonByCustomer: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT SMAINACCOUNTCODE, SSUBACCOUNTCODE, Account.SDescription, '
      
        'StockTrn.WStockTransactionID, SDocNo, StockTrn.DDate,  StockTrn.' +
        'WDocTypeID, StockTrn.WSalesmanID,'
      'StockTrn.FSellingPrice, StockTrn.FCostPrice, StockTrn.FQty'
      'FROM Account, StockTrn, DocHead'
      'WHERE (SMAINACCOUNTCODE >= :FromCode)'
      'AND (SMAINACCOUNTCODE <= :ToCode)'
      'AND (Account.WAccountID = StockTrn.WAccountID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'AND ((Stocktrn.WDocTypeID = 10) OR (Stocktrn.WDocTypeID = 11))'
      
        'ORDER BY SMAINACCOUNTCODE, StockTrn.WSalesmanID,StockTrn.DDate, ' +
        'StockTrn.WDocTypeID, SDocNo;'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    Left = 202
    Top = 274
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    object qrySalesPersonByCustomerSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qrySalesPersonByCustomerSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qrySalesPersonByCustomerSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qrySalesPersonByCustomerWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qrySalesPersonByCustomerSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qrySalesPersonByCustomerDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qrySalesPersonByCustomerWDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object qrySalesPersonByCustomerWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object qrySalesPersonByCustomerFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qrySalesPersonByCustomerFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qrySalesPersonByCustomerFQTY: TFloatField
      FieldName = 'FQTY'
    end
  end
  object qrySalespersonByProduct: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT SSTOCKCODE, StockTrn.DDate, StockTrn.WStockTransactionID,' +
        ' StockTrn.WSalesmanID,'
      
        'Stock.SDescription, SDocNo, StockTrn.FSellingPrice, StockTrn.FCo' +
        'stPrice, '
      'StockTrn.FQty'
      'FROM Stock, StockTrn, DocHead'
      'WHERE (SSTOCKCODE >= :FromCode)'
      'AND (SSTOCKCODE <= :ToCode)'
      'AND (Stock.WStockID = StockTrn.WStockID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'AND ( (DocHead.WTypeID =10) Or (DocHead.WTypeID =11) )'
      'ORDER BY SSTOCKCODE, StockTrn.DDate,SDocNo;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    Left = 677
    Top = 303
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    object qrySalespersonByProductSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object qrySalespersonByProductDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qrySalespersonByProductWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qrySalespersonByProductWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object qrySalespersonByProductSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qrySalespersonByProductSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qrySalespersonByProductFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qrySalespersonByProductFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qrySalespersonByProductFQTY: TFloatField
      FieldName = 'FQTY'
    end
  end
  object qBatPeriodTotals: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT FDEBIT,FCREDIT, DAllocatedDate'
      'FROM Batch;'
      ' '
      '')
    Params = <>
    Left = 353
    Top = 226
  end
  object DsBatPeriodTotals: TDataSource
    DataSet = qBatPeriodTotals
    Left = 819
    Top = 519
  end
  object qryProductBySalesperson: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT StockTrn.WStockTransactionID, Groups.WGroupID, Groups.WGr' +
        'oupTypeID, '
      
        'Groups.SDescription, SDocNo, StockTrn.DDate, StockTrn.FSellingPr' +
        'ice, '
      
        'StockTrn.FCostPrice, StockTrn.FQty, Stock.SDescription, StockTrn' +
        '.WStockID'
      'FROM Groups, Stock, StockTrn, DocHead'
      'WHERE (Groups.WGroupID = StockTrn.WSalesmanID)'
      'AND (Stock.WStockID = StockTrn.WStockID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'AND ( (DocHead.WTypeID = 10) Or (DocHead.WTypeID = 11) )'
      'AND (StockTrn.DDate >= :FromDate)'
      'AND (StockTrn.DDate <= :ToDate)'
      
        'ORDER BY Groups.WGroupID, Stock.SDescription, StockTrn.DDate, SD' +
        'ocNo;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    Left = 573
    Top = 321
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ToDate'
        ParamType = ptUnknown
      end>
    object qryProductBySalespersonWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qryProductBySalespersonWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object qryProductBySalespersonWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object qryProductBySalespersonSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object qryProductBySalespersonSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qryProductBySalespersonDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryProductBySalespersonFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qryProductBySalespersonFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qryProductBySalespersonFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object qryProductBySalespersonSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 35
    end
    object qryProductBySalespersonWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
  end
  object qryCustomerByProduct: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT SSTOCKCODE, StockTrn.DDate, StockTrn.WStockTransactionID,' +
        ' '
      
        'Stock.SDescription, SDocNo, StockTrn.FSellingPrice, StockTrn.FCo' +
        'stPrice, '
      'StockTrn.FQty , DocHead.WAccountID, Account.SACCOUNTCODE,'
      ' Account.SDescription As AccSDescription'
      'FROM Stock, StockTrn, DocHead , Account'
      'WHERE (SSTOCKCODE >= :FromCode)'
      'AND (DocHead.WaccountID= Account.WaccountID)'
      'AND (SSTOCKCODE <= :ToCode)'
      'AND (Stock.WStockID = StockTrn.WStockID)'
      'AND (DocHead.WDocID = StockTrn.WDocID)'
      'AND ( (DocHead.WTypeID =10) Or (DocHead.WTypeID =11) )'
      
        'ORDER BY SSTOCKCODE, Account.SDescription , StockTrn.DDate, SDoc' +
        'No ')
    Params = <
      item
        DataType = ftString
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    Left = 638
    Top = 129
    ParamData = <
      item
        DataType = ftString
        Name = 'FromCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ToCode'
        ParamType = ptUnknown
      end>
    object qryCustomerByProductSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object qryCustomerByProductDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryCustomerByProductWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
    end
    object qryCustomerByProductSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryCustomerByProductSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qryCustomerByProductFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qryCustomerByProductFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object qryCustomerByProductFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object qryCustomerByProductWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryCustomerByProductSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qryCustomerByProductACCSDESCRIPTION: TStringField
      FieldName = 'ACCSDESCRIPTION'
      Size = 35
    end
  end
  object qryCreditAge: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'SELECT tmpAgeAn.WAccountID, tmpAgeAn.SDescription, tmpAgeAn.SAcc' +
        'ountCode,'
      
        'Transact.WTransactionID, Transact.FOutstandingAmount, Transact.D' +
        'Date,'
      'BatTypes.SDescription, Transact.SReference, FAmount,'
      
        'A.WReportingGroup1ID,A.WReportingGroup2ID,Transact.SReference, F' +
        'Amount'
      'FROM tmpAgeAn, Transact, BatTypes,Account A'
      'WHERE (Transact.WAccountID = tmpAgeAn.WAccountID)'
      'AND (Account.WAccountID = tmpAgeAn.WAccountID)'
      'AND (BatTypes.WBatchTypeID = Transact.WBatchTypeID)'
      'AND (WTransactionID > 0) and ((FOutstandingamount * 100) <> 0)')
    Params = <>
    Left = 835
    Top = 17
    object qryCreditAgeWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryCreditAgeSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryCreditAgeSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object qryCreditAgeWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object qryCreditAgeFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object qryCreditAgeDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryCreditAgeSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 16
    end
    object qryCreditAgeSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryCreditAgeFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object qryCreditAgeWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qryCreditAgeWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qryCreditAgeSREFERENCE_1: TStringField
      FieldName = 'SREFERENCE_1'
      Size = 15
    end
    object qryCreditAgeFAMOUNT_1: TFloatField
      FieldName = 'FAMOUNT_1'
    end
  end
  object DsRecon: TDataSource
    DataSet = TblReconBank
    Left = 846
    Top = 534
  end
  object dsDocHead: TDataSource
    DataSet = qryDocHead
    Left = 816
    Top = 503
  end
  object tblTax: TuniTable
    Connection = ZMainconnection
    TableName = 'Tax'
    Left = 196
    Top = 494
    object tblTaxWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblTaxSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object tblTaxDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
    end
    object tblTaxDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
    end
    object tblTaxFRATE: TFloatField
      FieldName = 'FRATE'
    end
    object tblTaxDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblTaxWLINKTAXID: TIntegerField
      FieldName = 'WLINKTAXID'
    end
    object tblTaxBLINKCONTRA: TSmallintField
      FieldName = 'BLINKCONTRA'
    end
  end
  object dSTAX: TDataSource
    DataSet = tblTax
    Left = 826
    Top = 518
  end
  object dsBank: TDataSource
    DataSet = tblBank
    Left = 846
    Top = 524
  end
  object tblBank: TuniTable
    Connection = ZMainconnection
    TableName = 'Bank'
    IndexFieldNames = 'WAccountID'
    Left = 40
    Top = 112
    object tblBankWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblBankWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object tblBankWRECEIPTSID: TIntegerField
      FieldName = 'WRECEIPTSID'
    end
    object tblBankWPAYMENTSID: TIntegerField
      FieldName = 'WPAYMENTSID'
    end
    object tblBankWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblBankDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object qryDocHead: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'select  DocHead.WDocID, DocHead.SDocNo, DocHead.DDate,'
      '           DocHead.BRepeating,'
      '           Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE,'
      '           Account.SACCOUNTCODE,'
      
        '           Account.SDescription, DocHead.WMessage1ID, DocHead.WM' +
        'essage2ID,'
      '           DocHead.WMessage3ID,DocHead.FInvoiceDiscount,'
      
        '           DocHead.WDelAddress1ID, DocHead.WDelAddress2ID, DocHe' +
        'ad.WDelAddress3ID,'
      
        '           DocHead.WPostal1ID, DocHead.WPostal2ID, DocHead.WPost' +
        'al3ID, DocHead.WPostalCodeID,'
      '           DocHead.WDelCodeID, DocHead.WAccountID, '
      
        '           DocHead.WSalesmanID,DocHead.WCurrencyID,DocHead.WPaym' +
        'entTypeID,'
      '           DocHead.BPosted,DocHead.BPrinted,DocHead.WUserID,'
      
        '           DocHead.SReference,DocHead.DDueDate,DocHead.WReportin' +
        'gGroup1ID,DocHead.WReportingGroup2ID,DocHead.WTerms'
      'from    DocHead, Account'
      'where DocHead.WAccountID = Account.WAccountID'
      'and DocHead.WTypeID = 10'
      'order by DocHead.SDocNo')
    Params = <>
    Properties.Strings = (
      'select DocHead.WDocID, DocHead.SDocNo, DocHead.DDate,'
      '       Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE,'
      '       Account.SDescription,'
      '       Account.SACCOUNTCODE,'
      
        '       DocHead.WMessage1ID, DocHead.WMessage2ID, DocHead.FInvoic' +
        'eDiscount,DocHead.WMessage3ID,'
      
        '       DocHead.WDelAddress1ID, DocHead.WDelAddress2ID, DocHead.W' +
        'DelAddress3ID,'
      
        '       DocHead.WPostal1ID, DocHead.WPostal2ID, DocHead.WPostal3I' +
        'D, DocHead.WPostalCodeID,'
      
        '       DocHead.WDelCodeID, DocHead.WAccountID, Account.WAccountI' +
        'D,'
      
        '       DocHead.WSalesmanID,DocHead.WCurrencyID,DocHead.WPaymentT' +
        'ypeID,'
      ' DocHead.BRepeating ,DocHead.WSourceTYpeID,'
      '       DocHead.BPosted,DocHead.BPrinted,DocHead.WUserID,'
      
        '       DocHead.SReference,DocHead.DDueDate,DocHead.WReportingGro' +
        'up1ID,DocHead.WReportingGroup2ID,DocHead.WTerms'
      '  from dochead   where 1 = 0')
    Left = 290
    Top = 160
    object qryDocHeadWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object qryDocHeadSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qryDocHeadDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryDocHeadBREPEATING: TSmallintField
      FieldName = 'BREPEATING'
    end
    object qryDocHeadSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qryDocHeadSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qryDocHeadSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qryDocHeadSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryDocHeadWMESSAGE1ID: TIntegerField
      FieldName = 'WMESSAGE1ID'
    end
    object qryDocHeadWMESSAGE2ID: TIntegerField
      FieldName = 'WMESSAGE2ID'
    end
    object qryDocHeadWMESSAGE3ID: TIntegerField
      FieldName = 'WMESSAGE3ID'
    end
    object qryDocHeadFINVOICEDISCOUNT: TFloatField
      FieldName = 'FINVOICEDISCOUNT'
    end
    object qryDocHeadWDELADDRESS1ID: TIntegerField
      FieldName = 'WDELADDRESS1ID'
    end
    object qryDocHeadWDELADDRESS2ID: TIntegerField
      FieldName = 'WDELADDRESS2ID'
    end
    object qryDocHeadWDELADDRESS3ID: TIntegerField
      FieldName = 'WDELADDRESS3ID'
    end
    object qryDocHeadWPOSTAL1ID: TIntegerField
      FieldName = 'WPOSTAL1ID'
    end
    object qryDocHeadWPOSTAL2ID: TIntegerField
      FieldName = 'WPOSTAL2ID'
    end
    object qryDocHeadWPOSTAL3ID: TIntegerField
      FieldName = 'WPOSTAL3ID'
    end
    object qryDocHeadWPOSTALCODEID: TIntegerField
      FieldName = 'WPOSTALCODEID'
    end
    object qryDocHeadWDELCODEID: TIntegerField
      FieldName = 'WDELCODEID'
    end
    object qryDocHeadWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryDocHeadWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object qryDocHeadWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object qryDocHeadWPAYMENTTYPEID: TIntegerField
      FieldName = 'WPAYMENTTYPEID'
    end
    object qryDocHeadBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object qryDocHeadBPRINTED: TSmallintField
      FieldName = 'BPRINTED'
    end
    object qryDocHeadWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object qryDocHeadSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryDocHeadDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object qryDocHeadWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qryDocHeadWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qryDocHeadWTERMS: TIntegerField
      FieldName = 'WTERMS'
    end
  end
  object tblRepCells: TuniTable
    Connection = ZMainconnection
    TableName = 'Repcells'
    Left = 574
    Top = 396
    object tblRepCellsWREPORTID: TIntegerField
      FieldName = 'WREPORTID'
    end
    object tblRepCellsWCOLUMNID: TIntegerField
      FieldName = 'WCOLUMNID'
    end
    object tblRepCellsWROWID: TIntegerField
      FieldName = 'WROWID'
    end
    object tblRepCellsSVALUE: TStringField
      FieldName = 'SVALUE'
      Size = 30
    end
    object tblRepCellsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object dsRepCells: TDataSource
    DataSet = tblRepCells
    Left = 824
    Top = 504
  end
  object tblDocHeader: TuniTable
    Connection = ZMainconnection
    TableName = 'DocHead'
    Left = 40
    Top = 528
    object tblDocHeaderWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object tblDocHeaderSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object tblDocHeaderWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
    end
    object tblDocHeaderDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblDocHeaderDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object tblDocHeaderWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object tblDocHeaderWPAYMENTTYPEID: TIntegerField
      FieldName = 'WPAYMENTTYPEID'
    end
    object tblDocHeaderWPOSTAL1ID: TIntegerField
      FieldName = 'WPOSTAL1ID'
    end
    object tblDocHeaderWPOSTAL2ID: TIntegerField
      FieldName = 'WPOSTAL2ID'
    end
    object tblDocHeaderWPOSTAL3ID: TIntegerField
      FieldName = 'WPOSTAL3ID'
    end
    object tblDocHeaderWPOSCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSCOUNTRIES_ID'
    end
    object tblDocHeaderWPOSTALCODEID: TIntegerField
      FieldName = 'WPOSTALCODEID'
    end
    object tblDocHeaderWMESSAGE1ID: TIntegerField
      FieldName = 'WMESSAGE1ID'
    end
    object tblDocHeaderWMESSAGE2ID: TIntegerField
      FieldName = 'WMESSAGE2ID'
    end
    object tblDocHeaderWMESSAGE3ID: TIntegerField
      FieldName = 'WMESSAGE3ID'
    end
    object tblDocHeaderFINVOICEDISCOUNT: TFloatField
      FieldName = 'FINVOICEDISCOUNT'
    end
    object tblDocHeaderWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object tblDocHeaderSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblDocHeaderWDELADDRESS1ID: TIntegerField
      FieldName = 'WDELADDRESS1ID'
    end
    object tblDocHeaderWDELADDRESS2ID: TIntegerField
      FieldName = 'WDELADDRESS2ID'
    end
    object tblDocHeaderWDELADDRESS3ID: TIntegerField
      FieldName = 'WDELADDRESS3ID'
    end
    object tblDocHeaderWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object tblDocHeaderWDELCODEID: TIntegerField
      FieldName = 'WDELCODEID'
    end
    object tblDocHeaderBPRINTED: TSmallintField
      FieldName = 'BPRINTED'
    end
    object tblDocHeaderBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object tblDocHeaderWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblDocHeaderWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblDocHeaderWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object tblDocHeaderBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object tblDocHeaderWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblDocHeaderFDOCAMOUNT: TFloatField
      FieldName = 'FDOCAMOUNT'
    end
    object tblDocHeaderFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblDocHeaderBREPEATING: TSmallintField
      FieldName = 'BREPEATING'
    end
    object tblDocHeaderDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblDocHeaderWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object tblDocHeaderWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblDocHeaderWTERMS: TIntegerField
      FieldName = 'WTERMS'
    end
    object tblDocHeaderWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object tblDocHeaderDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object tblDocHeaderWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
  end
  object qrPrnDocLines: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'Select *  From Stock,DocLine Where Stock.WStockID=DocLine.WStock' +
        'ID')
    Params = <>
    Left = 376
    Top = 267
    object qrPrnDocLinesWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object qrPrnDocLinesSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object qrPrnDocLinesSBARCODENUMBER: TStringField
      FieldName = 'SBARCODENUMBER'
      Size = 25
    end
    object qrPrnDocLinesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qrPrnDocLinesWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qrPrnDocLinesWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qrPrnDocLinesWCOSTACCOUNTID: TIntegerField
      FieldName = 'WCOSTACCOUNTID'
    end
    object qrPrnDocLinesWINPUTTAXID: TIntegerField
      FieldName = 'WINPUTTAXID'
    end
    object qrPrnDocLinesWOUTPUTTAXID: TIntegerField
      FieldName = 'WOUTPUTTAXID'
    end
    object qrPrnDocLinesFOPENINGAVECOST: TFloatField
      FieldName = 'FOPENINGAVECOST'
    end
    object qrPrnDocLinesFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object qrPrnDocLinesFOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object qrPrnDocLinesFINVQTYONHAND: TFloatField
      FieldName = 'FINVQTYONHAND'
    end
    object qrPrnDocLinesFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object qrPrnDocLinesWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object qrPrnDocLinesBAPPLYINVOICEDISCOUNT: TSmallintField
      FieldName = 'BAPPLYINVOICEDISCOUNT'
    end
    object qrPrnDocLinesWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object qrPrnDocLinesFSELLINGPRICE1: TFloatField
      FieldName = 'FSELLINGPRICE1'
    end
    object qrPrnDocLinesFSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
    object qrPrnDocLinesFSELLINGPRICE3: TFloatField
      FieldName = 'FSELLINGPRICE3'
    end
    object qrPrnDocLinesFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object qrPrnDocLinesFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object qrPrnDocLinesWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object qrPrnDocLinesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object qrPrnDocLinesBAPPLYTAX: TSmallintField
      FieldName = 'BAPPLYTAX'
    end
    object qrPrnDocLinesWINPUTTAX2ID: TIntegerField
      FieldName = 'WINPUTTAX2ID'
    end
    object qrPrnDocLinesBTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object qrPrnDocLinesWSUPPLIER1ID: TIntegerField
      FieldName = 'WSUPPLIER1ID'
    end
    object qrPrnDocLinesWSUPPLIER2ID: TIntegerField
      FieldName = 'WSUPPLIER2ID'
    end
    object qrPrnDocLinesWSTOCKTYPEID: TIntegerField
      FieldName = 'WSTOCKTYPEID'
    end
    object qrPrnDocLinesWOUTPUTTAX2ID: TIntegerField
      FieldName = 'WOUTPUTTAX2ID'
    end
    object qrPrnDocLinesWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object qrPrnDocLinesBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object qrPrnDocLinesWPERENTID: TIntegerField
      FieldName = 'WPERENTID'
    end
    object qrPrnDocLinesWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object qrPrnDocLinesWFILENAMEID: TIntegerField
      FieldName = 'WFILENAMEID'
    end
    object qrPrnDocLinesSEXTRADESC: TStringField
      FieldName = 'SEXTRADESC'
      Size = 255
    end
    object qrPrnDocLinesWDOCLINEID: TIntegerField
      FieldName = 'WDOCLINEID'
    end
    object qrPrnDocLinesWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object qrPrnDocLinesWSTOCKID_1: TIntegerField
      FieldName = 'WSTOCKID_1'
    end
    object qrPrnDocLinesWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object qrPrnDocLinesWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object qrPrnDocLinesFQTYORDERED: TFloatField
      FieldName = 'FQTYORDERED'
    end
    object qrPrnDocLinesFQTYSHIPPED: TFloatField
      FieldName = 'FQTYSHIPPED'
    end
    object qrPrnDocLinesFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object qrPrnDocLinesFITEMDISCOUNT: TFloatField
      FieldName = 'FITEMDISCOUNT'
    end
    object qrPrnDocLinesWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object qrPrnDocLinesFEXCLUSIVEAMT: TFloatField
      FieldName = 'FEXCLUSIVEAMT'
    end
    object qrPrnDocLinesFINCLUSIVEAMT: TFloatField
      FieldName = 'FINCLUSIVEAMT'
    end
    object qrPrnDocLinesFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object qrPrnDocLinesDSYSDATE_1: TDateTimeField
      FieldName = 'DSYSDATE_1'
    end
    object qrPrnDocLinesSUNIT: TStringField
      FieldName = 'SUNIT'
      Size = 8
    end
    object qrPrnDocLinesSSTOCKCODE_1: TStringField
      FieldName = 'SSTOCKCODE_1'
      Size = 15
    end
    object qrPrnDocLinesWPROFILEID_1: TIntegerField
      FieldName = 'WPROFILEID_1'
    end
    object qrPrnDocLinesWSERIALNOID: TIntegerField
      FieldName = 'WSERIALNOID'
    end
  end
  object qrBalSheetAccount: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      
        'Select Account.WAccountID, Account.SMAINACCOUNTCODE, Account.SSu' +
        'bAccountCode, Account.WAccountTypeID, '
      
        'Account.SDescription, Account.WReportingGroup1ID, Account.WRepor' +
        'tingGroup2ID, Account.BSubAccounts, Account.BIncomeExpense, '
      
        'Account.SACCOUNTCODE, Groups.WParentGroup1ID, Groups.WParentGrou' +
        'p2ID, Groups.WSortNo'
      'From Account, Groups where 0 = 1')
    Params = <>
    Left = 800
    Top = 112
    object qrBalSheetAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qrBalSheetAccountSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qrBalSheetAccountSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qrBalSheetAccountWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object qrBalSheetAccountSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qrBalSheetAccountWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qrBalSheetAccountWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qrBalSheetAccountBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
    end
    object qrBalSheetAccountBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
    end
    object qrBalSheetAccountSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qrBalSheetAccountWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object qrBalSheetAccountWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object qrBalSheetAccountWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
  end
  object dsOItemsLinks: TDataSource
    DataSet = ZQOILinks
    Left = 828
    Top = 528
  end
  object tblOpReport: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLOpReport
    AfterInsert = tblOpReportAfterInsert
    SQL.Strings = (
      'Select * from OpReport')
    Params = <>
    Left = 282
    Top = 222
    object tblOpReportWOPTIONID: TIntegerField
      FieldName = 'WOPTIONID'
    end
    object tblOpReportSTROPTION: TStringField
      FieldName = 'STROPTION'
      Size = 25
    end
    object tblOpReportSOPTIONVALUE: TStringField
      FieldName = 'SOPTIONVALUE'
      Size = 35
    end
    object tblOpReportWOPTIONTYPEID: TIntegerField
      FieldName = 'WOPTIONTYPEID'
    end
  end
  object dsOpReport: TDataSource
    DataSet = tblOpReport
    Left = 770
    Top = 442
  end
  object tblTmpAgeAnal: TuniTable
    Connection = ZMainconnection
    TableName = 'TmpAgeAn'
    Left = 398
    Top = 220
    object tblTmpAgeAnalWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblTmpAgeAnalWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object tblTmpAgeAnalSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object tblTmpAgeAnalSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblTmpAgeAnalFCURRENT: TFloatField
      FieldName = 'FCURRENT'
    end
    object tblTmpAgeAnalF30DAYS: TFloatField
      FieldName = 'F30DAYS'
    end
    object tblTmpAgeAnalF60DAYS: TFloatField
      FieldName = 'F60DAYS'
    end
    object tblTmpAgeAnalF90DAYS: TFloatField
      FieldName = 'F90DAYS'
    end
    object tblTmpAgeAnalFBBF: TFloatField
      FieldName = 'FBBF'
    end
    object tblTmpAgeAnalFTOTAL: TFloatField
      FieldName = 'FTOTAL'
    end
  end
  object qryUpdateBatch: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT BatCon.WBatchID, BatCon.WUserID, BatCon.BPosted, '
      'BatTypes.WBatchTypeID, BatTypes.SDescription, Users.SUserName,'
      'Users.BOnline'
      'From Users,  BatCon,BatTypes'
      'Where (BatCon.WBatchTypeID= BatTypes.WBatchTypeID)'
      'And     (BatCon.WUserID=Users.WUserID)'
      'And     (BatCon.BPosted<>1)')
    Params = <>
    Left = 117
    Top = 110
    object qryUpdateBatchWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object qryUpdateBatchWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object qryUpdateBatchBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object qryUpdateBatchWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object qryUpdateBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object qryUpdateBatchSUSERNAME: TStringField
      FieldName = 'SUSERNAME'
    end
    object qryUpdateBatchBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
  end
  object dsUpdateBatch: TDataSource
    DataSet = qryUpdateBatch
    Left = 792
    Top = 506
  end
  object tblStockAd: TuniTable
    Connection = ZMainconnection
    OnCalcFields = tblStockAdCalcFields
    TableName = 'Stock'
    Left = 40
    Top = 616
    object tblStockAdWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object tblStockAdSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object tblStockAdSBARCODENUMBER: TStringField
      FieldName = 'SBARCODENUMBER'
      Size = 25
    end
    object tblStockAdSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblStockAdWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblStockAdWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblStockAdWCOSTACCOUNTID: TIntegerField
      FieldName = 'WCOSTACCOUNTID'
    end
    object tblStockAdWINPUTTAXID: TIntegerField
      FieldName = 'WINPUTTAXID'
    end
    object tblStockAdWOUTPUTTAXID: TIntegerField
      FieldName = 'WOUTPUTTAXID'
    end
    object tblStockAdFOPENINGAVECOST: TFloatField
      FieldName = 'FOPENINGAVECOST'
    end
    object tblStockAdFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object tblStockAdFOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object tblStockAdFINVQTYONHAND: TFloatField
      FieldName = 'FINVQTYONHAND'
    end
    object tblStockAdFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object tblStockAdWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object tblStockAdBAPPLYINVOICEDISCOUNT: TSmallintField
      FieldName = 'BAPPLYINVOICEDISCOUNT'
    end
    object tblStockAdWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object tblStockAdFSELLINGPRICE1: TFloatField
      FieldName = 'FSELLINGPRICE1'
    end
    object tblStockAdFSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
    object tblStockAdFSELLINGPRICE3: TFloatField
      FieldName = 'FSELLINGPRICE3'
    end
    object tblStockAdFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object tblStockAdFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object tblStockAdWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object tblStockAdDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblStockAdBAPPLYTAX: TSmallintField
      FieldName = 'BAPPLYTAX'
    end
    object tblStockAdWINPUTTAX2ID: TIntegerField
      FieldName = 'WINPUTTAX2ID'
    end
    object tblStockAdBTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object tblStockAdWSUPPLIER1ID: TIntegerField
      FieldName = 'WSUPPLIER1ID'
    end
    object tblStockAdWSUPPLIER2ID: TIntegerField
      FieldName = 'WSUPPLIER2ID'
    end
    object tblStockAdWSTOCKTYPEID: TIntegerField
      FieldName = 'WSTOCKTYPEID'
    end
    object tblStockAdWOUTPUTTAX2ID: TIntegerField
      FieldName = 'WOUTPUTTAX2ID'
    end
    object tblStockAdWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblStockAdBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblStockAdWPERENTID: TIntegerField
      FieldName = 'WPERENTID'
    end
    object tblStockAdWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object tblStockAdWFILENAMEID: TIntegerField
      FieldName = 'WFILENAMEID'
    end
    object tblStockAdSEXTRADESC: TStringField
      FieldName = 'SEXTRADESC'
      Size = 255
    end
    object tblStockAdSInputTax: TStringField
      FieldKind = fkCalculated
      FieldName = 'SInputTax'
      OnGetText = tblStockAdSInputTaxGetText
      Calculated = True
    end
    object tblStockAdSOutPutTax: TStringField
      FieldKind = fkCalculated
      FieldName = 'SOutPutTax'
      OnGetText = tblStockAdSOutPutTaxGetText
      Calculated = True
    end
    object tblStockAdSCostAccount: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCostAccount'
      OnGetText = tblStockAdSCostAccountGetText
      Calculated = True
    end
    object tblStockAdSSaleSACCOUNT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SSaleSACCOUNT'
      OnGetText = tblStockAdSSaleSACCOUNTGetText
      Calculated = True
    end
    object tblStockAdSStockAccount: TStringField
      FieldKind = fkCalculated
      FieldName = 'SStockAccount'
      OnGetText = tblStockAdSStockAccountGetText
      Calculated = True
    end
  end
  object daStockAd: TDataSource
    DataSet = tblStockAd
    Left = 822
    Top = 514
  end
  object tblOILinks: TuniTable
    Connection = ZMainconnection
    TableName = 'OILinks'
    Left = 50
    Top = 210
    object tblOILinksWOILINKSID: TIntegerField
      FieldName = 'WOILINKSID'
    end
    object tblOILinksDDOCDATE: TDateTimeField
      FieldName = 'DDOCDATE'
    end
    object tblOILinksSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object tblOILinksSLINKEDREFERENCE: TStringField
      FieldName = 'SLINKEDREFERENCE'
      Size = 15
    end
    object tblOILinksWFULLAMOUNT: TFloatField
      FieldName = 'WFULLAMOUNT'
    end
    object tblOILinksWOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'WOUTSTANDINGAMOUNT'
    end
    object tblOILinksWLINKEDAMOUNT: TFloatField
      FieldName = 'WLINKEDAMOUNT'
    end
    object tblOILinksDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblOILinksUNUSED1: TIntegerField
      FieldName = 'UNUSED1'
    end
    object tblOILinksWAMOUNTTRANSACTIONID: TIntegerField
      FieldName = 'WAMOUNTTRANSACTIONID'
    end
    object tblOILinksWLINKTRANSACTIONID: TIntegerField
      FieldName = 'WLINKTRANSACTIONID'
    end
    object tblOILinksWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblOILinksUNUSED2: TIntegerField
      FieldName = 'UNUSED2'
    end
    object tblOILinksWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object tblOILinksWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblOILinksWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblOILinksDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object tblCashFlow: TuniTable
    Connection = ZMainconnection
    TableName = 'FlowTmp'
    Left = 117
    Top = 88
    object tblCashFlowWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblCashFlowWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object tblCashFlowSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 32
    end
    object tblCashFlowWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
    end
    object tblCashFlowSCODE: TStringField
      FieldName = 'SCODE'
      Size = 7
    end
    object tblCashFlowFAMOUNT1: TFloatField
      FieldName = 'FAMOUNT1'
    end
    object tblCashFlowFAMOUNT2: TFloatField
      FieldName = 'FAMOUNT2'
    end
    object tblCashFlowFAMOUNT3: TFloatField
      FieldName = 'FAMOUNT3'
    end
    object tblCashFlowFAMOUNT4: TFloatField
      FieldName = 'FAMOUNT4'
    end
    object tblCashFlowFAMOUNT5: TFloatField
      FieldName = 'FAMOUNT5'
    end
    object tblCashFlowFAMOUNT6: TFloatField
      FieldName = 'FAMOUNT6'
    end
  end
  object tblMessage: TuniTable
    Connection = ZMainconnection
    TableName = 'MESSAGES'
    Left = 117
    Top = 220
    object tblMessageWMESSAGEID: TIntegerField
      FieldName = 'WMESSAGEID'
    end
    object tblMessageSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblMessageSEXTRADESCRIPTION: TStringField
      FieldName = 'SEXTRADESCRIPTION'
      Size = 255
    end
  end
  object tblSysParams: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLSysparams
    SQL.Strings = (
      'select * from SysParams where 1 = 0')
    Params = <>
    Sequence = ZSqSYSPARAMS
    SequenceField = 'WPARAMID'
    Left = 244
    Top = 416
    object tblSysParamsWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblSysParamsSPARAMNAME: TStringField
      FieldName = 'SPARAMNAME'
      Size = 25
    end
    object tblSysParamsSPARAMVALUE: TStringField
      FieldName = 'SPARAMVALUE'
      Size = 50
    end
    object tblSysParamsWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object tblSysParamsWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object tblSysParamsWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object tblSysParamsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblSysParamsWPARENTID: TIntegerField
      FieldName = 'WPARENTID'
    end
    object tblSysParamsWPARENTTYPEID: TIntegerField
      FieldName = 'WPARENTTYPEID'
    end
    object tblSysParamsBACTIVE: TSmallintField
      FieldName = 'BACTIVE'
    end
    object tblSysParamsWPARAMID: TIntegerField
      FieldName = 'WPARAMID'
    end
  end
  object tblBOMHead: TuniTable
    Connection = ZMainconnection
    TableName = 'MANUFACH'
    Left = 40
    Top = 478
    object tblBOMHeadWMFCDOCID: TIntegerField
      FieldName = 'WMFCDOCID'
    end
    object tblBOMHeadWMFCTYPEID: TIntegerField
      FieldName = 'WMFCTYPEID'
    end
    object tblBOMHeadSMFCCODE: TStringField
      FieldName = 'SMFCCODE'
    end
    object tblBOMHeadWPARENTID: TIntegerField
      FieldName = 'WPARENTID'
    end
    object tblBOMHeadSPICTURE: TStringField
      FieldName = 'SPICTURE'
    end
    object tblBOMHeadBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblBOMHeadSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblBOMHeadWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object tblBOMHeadWFINISHEDSTOCKID: TIntegerField
      FieldName = 'WFINISHEDSTOCKID'
    end
    object tblBOMHeadFPRICE1: TFloatField
      FieldName = 'FPRICE1'
    end
    object tblBOMHeadFPRICE2: TFloatField
      FieldName = 'FPRICE2'
    end
    object tblBOMHeadFPRICE3: TFloatField
      FieldName = 'FPRICE3'
    end
    object tblBOMHeadFUNUSED: TFloatField
      FieldName = 'FUNUSED'
    end
    object tblBOMHeadWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBOMHeadDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object tblBOMLines: TuniTable
    Connection = ZMainconnection
    TableName = 'ManufacD'
    Left = 40
    Top = 452
    object tblBOMLinesWMFCDOCID: TIntegerField
      FieldName = 'WMFCDOCID'
    end
    object tblBOMLinesWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object tblBOMLinesWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object tblBOMLinesSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
    end
    object tblBOMLinesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 40
    end
    object tblBOMLinesWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object tblBOMLinesFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object tblBOMLinesFVALUE: TFloatField
      FieldName = 'FVALUE'
    end
    object tblBOMLinesWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBOMLinesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object tblProfiles: TuniTable
    Connection = ZMainconnection
    TableName = 'Profiles'
    Left = 117
    Top = 192
    object tblProfilesWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblProfilesWPROFILETYPEID: TIntegerField
      FieldName = 'WPROFILETYPEID'
    end
    object tblProfilesWPARENTID: TIntegerField
      FieldName = 'WPARENTID'
    end
    object tblProfilesWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object tblProfilesWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object tblProfilesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblProfilesBACTIVE: TSmallintField
      FieldName = 'BACTIVE'
    end
    object tblProfilesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblProfilesWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
    object tblProfilesWSTATUS: TIntegerField
      FieldName = 'WSTATUS'
    end
  end
  object tblEmpMas: TuniTable
    Connection = ZMainconnection
    TableName = 'EmpMas'
    Left = 202
    Top = 226
    object tblEmpMasWEMPLOYEEID: TIntegerField
      FieldName = 'WEMPLOYEEID'
    end
    object tblEmpMasSEMPLOYEENUMBER: TStringField
      FieldName = 'SEMPLOYEENUMBER'
      Size = 15
    end
    object tblEmpMasSFIRSTNAME: TStringField
      FieldName = 'SFIRSTNAME'
    end
    object tblEmpMasSSURNAME: TStringField
      FieldName = 'SSURNAME'
    end
    object tblEmpMasSADDRESS1: TStringField
      FieldName = 'SADDRESS1'
      Size = 30
    end
    object tblEmpMasSADDRESS2: TStringField
      FieldName = 'SADDRESS2'
      Size = 30
    end
    object tblEmpMasSADDRESS3: TStringField
      FieldName = 'SADDRESS3'
      Size = 30
    end
    object tblEmpMasSPOSTCODE: TStringField
      FieldName = 'SPOSTCODE'
      Size = 15
    end
    object tblEmpMasSIDNUMBER: TStringField
      FieldName = 'SIDNUMBER'
    end
    object tblEmpMasSPASSPORTNUMBER: TStringField
      FieldName = 'SPASSPORTNUMBER'
    end
    object tblEmpMasSINCOMETAXREFNUMBER: TStringField
      FieldName = 'SINCOMETAXREFNUMBER'
      Size = 30
    end
    object tblEmpMasSDIRECTIVENUMBER: TStringField
      FieldName = 'SDIRECTIVENUMBER'
    end
    object tblEmpMasSBRANCH: TStringField
      FieldName = 'SBRANCH'
      Size = 30
    end
    object tblEmpMasDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
    end
    object tblEmpMasDTERMINATIONDATE: TDateTimeField
      FieldName = 'DTERMINATIONDATE'
    end
    object tblEmpMasBACTIVE: TSmallintField
      FieldName = 'BACTIVE'
    end
    object tblEmpMasDBIRTHDATE: TDateTimeField
      FieldName = 'DBIRTHDATE'
    end
    object tblEmpMasWIRPTYPE: TIntegerField
      FieldName = 'WIRPTYPE'
    end
    object tblEmpMasSREASON: TStringField
      FieldName = 'SREASON'
      Size = 30
    end
    object tblEmpMasWREPORTINGGROUP1: TIntegerField
      FieldName = 'WREPORTINGGROUP1'
    end
    object tblEmpMasWREPORTINGGROUP2: TIntegerField
      FieldName = 'WREPORTINGGROUP2'
    end
    object tblEmpMasWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblEmpMasWPAYMENTMETHODID: TIntegerField
      FieldName = 'WPAYMENTMETHODID'
    end
    object tblEmpMasSBANKNAME: TStringField
      FieldName = 'SBANKNAME'
    end
    object tblEmpMasSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object tblEmpMasSBANKBRANCH: TStringField
      FieldName = 'SBANKBRANCH'
    end
    object tblEmpMasFLEAVEALLOCATED: TFloatField
      FieldName = 'FLEAVEALLOCATED'
    end
    object tblEmpMasFLEAVETAKEN: TFloatField
      FieldName = 'FLEAVETAKEN'
    end
    object tblEmpMasSDATA1: TStringField
      FieldName = 'SDATA1'
    end
    object tblEmpMasSDATA2: TStringField
      FieldName = 'SDATA2'
    end
    object tblEmpMasSDATA3: TStringField
      FieldName = 'SDATA3'
    end
    object tblEmpMasWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblEmpMasDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object tblEmpSource: TuniTable
    Connection = ZMainconnection
    TableName = 'EmpSource'
    Left = 400
    Top = 410
    object tblEmpSourceWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object tblEmpSourceWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object tblEmpSourceSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
    end
    object tblEmpSourceWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblEmpSourceWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object tblEmpSourceBTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object tblEmpSourceBACTIVE: TSmallintField
      FieldName = 'BACTIVE'
    end
    object tblEmpSourceWPARENTSOURCEID: TIntegerField
      FieldName = 'WPARENTSOURCEID'
    end
    object tblEmpSourceSFORMULA: TStringField
      FieldName = 'SFORMULA'
      Size = 35
    end
    object tblEmpSourceWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblEmpSourceBFORINFO: TIntegerField
      FieldName = 'BFORINFO'
    end
    object tblEmpSourceWDRACCOUNTID: TIntegerField
      FieldName = 'WDRACCOUNTID'
    end
    object tblEmpSourceWCRACCOUNTID: TIntegerField
      FieldName = 'WCRACCOUNTID'
    end
    object tblEmpSourceDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object tblPayCon: TuniTable
    Connection = ZMainconnection
    TableName = 'PayCon'
    Left = 550
    Top = 274
    object tblPayConWPAYROLLID: TIntegerField
      FieldName = 'WPAYROLLID'
    end
    object tblPayConDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblPayConSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 15
    end
    object tblPayConBACTIVE: TSmallintField
      FieldName = 'BACTIVE'
    end
    object tblPayConBCURRENTYEAR: TSmallintField
      FieldName = 'BCURRENTYEAR'
    end
    object tblPayConWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblPayConDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object tblPayTransact: TuniTable
    Connection = ZMainconnection
    TableName = 'PayTrans'
    Left = 117
    Top = 62
    object tblPayTransactWPAYROLLID: TIntegerField
      FieldName = 'WPAYROLLID'
    end
    object tblPayTransactWEMPLOYEEID: TIntegerField
      FieldName = 'WEMPLOYEEID'
    end
    object tblPayTransactWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object tblPayTransactWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
    end
    object tblPayTransactFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblPayTransactFUNITS: TFloatField
      FieldName = 'FUNITS'
    end
    object tblPayTransactWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblPayTransactWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblPayTransactDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object tblBankDnl: TuniTable
    Connection = ZMainconnection
    TableName = 'DnlBanks'
    Left = 528
    Top = 604
    object tblBankDnlSTRANSID: TStringField
      FieldName = 'STRANSID'
      Size = 32
    end
    object tblBankDnlWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object tblBankDnlWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object tblBankDnlWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object tblBankDnlWTRANSTYPEID: TIntegerField
      FieldName = 'WTRANSTYPEID'
    end
    object tblBankDnlSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 15
    end
    object tblBankDnlDTRANSDATE: TDateTimeField
      FieldName = 'DTRANSDATE'
    end
    object tblBankDnlDPOSTEDDATE: TDateTimeField
      FieldName = 'DPOSTEDDATE'
    end
    object tblBankDnlFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblBankDnlSMEMO: TStringField
      FieldName = 'SMEMO'
      Size = 40
    end
    object tblBankDnlSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblBankDnlBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object tblBankDnlSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 40
    end
    object tblBankDnlWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblBankDnlWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblBankDnlWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object tblBankDnlWTCTRANSID: TIntegerField
      FieldName = 'WTCTRANSID'
    end
    object tblBankDnlWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBankDnlWAUTOMATCHID: TIntegerField
      FieldName = 'WAUTOMATCHID'
    end
    object tblBankDnlBUSEFORBATCH: TIntegerField
      FieldName = 'BUSEFORBATCH'
    end
    object tblBankDnlDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBankDnlWAMTSGN: TIntegerField
      FieldName = 'WAMTSGN'
    end
  end
  object tblLocations: TuniTable
    Connection = ZMainconnection
    TableName = 'Locations'
    Left = 40
    Top = 428
    object tblLocationsWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object tblLocationsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblLocationsSLOCCODE: TStringField
      FieldName = 'SLOCCODE'
      Size = 8
    end
    object tblLocationsWLOCATIONTYPEID: TIntegerField
      FieldName = 'WLOCATIONTYPEID'
    end
    object tblLocationsWPARENTID: TIntegerField
      FieldName = 'WPARENTID'
    end
    object tblLocationsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblLocationsWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
  end
  object tblAssetMas: TuniTable
    Connection = ZMainconnection
    TableName = 'AssetMas'
    Left = 117
    Top = 36
    object tblAssetMasWASSETID: TIntegerField
      FieldName = 'WASSETID'
    end
    object tblAssetMasSDESRIPTION: TStringField
      FieldName = 'SDESRIPTION'
      Size = 35
    end
    object tblAssetMasWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object tblAssetMasWGROUP1ID: TIntegerField
      FieldName = 'WGROUP1ID'
    end
    object tblAssetMasWGROUP2ID: TIntegerField
      FieldName = 'WGROUP2ID'
    end
    object tblAssetMasSASSETCODE: TStringField
      FieldName = 'SASSETCODE'
      Size = 15
    end
    object tblAssetMasSSUBASSETCODE: TStringField
      FieldName = 'SSUBASSETCODE'
      Size = 15
    end
    object tblAssetMasSSERIALNO: TStringField
      FieldName = 'SSERIALNO'
      Size = 25
    end
    object tblAssetMasDDEPSTART: TDateTimeField
      FieldName = 'DDEPSTART'
    end
    object tblAssetMasDDEPEND: TDateTimeField
      FieldName = 'DDEPEND'
    end
    object tblAssetMasDBUY: TDateTimeField
      FieldName = 'DBUY'
    end
    object tblAssetMasDASSETOUT: TDateTimeField
      FieldName = 'DASSETOUT'
    end
    object tblAssetMasWDEPTYPEID: TIntegerField
      FieldName = 'WDEPTYPEID'
    end
    object tblAssetMasFDEPRATE: TFloatField
      FieldName = 'FDEPRATE'
    end
    object tblAssetMasFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object tblAssetMasWTAXTYPE: TIntegerField
      FieldName = 'WTAXTYPE'
    end
    object tblAssetMasWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblAssetMasWSUPPLIERID: TIntegerField
      FieldName = 'WSUPPLIERID'
    end
    object tblAssetMasBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblAssetMasFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object tblAssetMasFPURPRICE: TFloatField
      FieldName = 'FPURPRICE'
    end
    object tblAssetMasFCAPTAXAMT: TFloatField
      FieldName = 'FCAPTAXAMT'
    end
    object tblAssetMasFMARKETVALUE: TFloatField
      FieldName = 'FMARKETVALUE'
    end
    object tblAssetMasFBOOKVALUE: TFloatField
      FieldName = 'FBOOKVALUE'
    end
    object tblAssetMasFUNSED1: TFloatField
      FieldName = 'FUNSED1'
    end
    object tblAssetMasFUNSED2: TFloatField
      FieldName = 'FUNSED2'
    end
    object tblAssetMasDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblAssetMasWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object qryGroups: TuniQuery
    Connection = ZMainconnection
    BeforePost = qryGroupsBeforePost
    SQL.Strings = (
      'Select *'
      'From Groups'
      'Order by WSortNo')
    Params = <>
    Left = 196
    Top = 556
    object qryGroupsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object qryGroupsWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object qryGroupsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object qryGroupsWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object qryGroupsWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object qryGroupsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object qryGroupsWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
  end
  object DtUpdate: TUniUpdateSql
    DeleteSQL.Strings = (
      'delete from Transact'
      'where'
      '  WTransactionID = :OLD_WTransactionID')
    InsertSQL.Strings = (
      'insert into Transact'
      '  (BUnused)'
      'values'
      '  (:BUnused)')
    ModifySQL.Strings = (
      'update Transact'
      'set'
      '  BUnused = :BUnused'
      'where'
      '  WTransactionID = :OLD_WTransactionID')
    Left = 866
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BUnused'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WTransactionID'
        ParamType = ptUnknown
      end>
  end
  object CtUpdate: TUniUpdateSql
    ModifySQL.Strings = (
      'update Transact'
      'set'
      '  BUnused = :BUnused'
      'where'
      '  WTransactionID = :OLD_WTransactionID')
    Left = 918
    Top = 618
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BUnused'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WTransactionID'
        ParamType = ptUnknown
      end>
  end
  object tblJobProject: TuniTable
    Connection = ZMainconnection
    TableName = 'JobProject'
    Left = 202
    Top = 14
    object tblJobProjectWJOBPROJECTID: TIntegerField
      FieldName = 'WJOBPROJECTID'
    end
    object tblJobProjectSJOBPROJECTCODE: TStringField
      FieldName = 'SJOBPROJECTCODE'
      Size = 10
    end
    object tblJobProjectSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblJobProjectDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
    end
    object tblJobProjectDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
    end
    object tblJobProjectWPARENTID: TIntegerField
      FieldName = 'WPARENTID'
    end
    object tblJobProjectWNOTEFILEID: TIntegerField
      FieldName = 'WNOTEFILEID'
    end
    object tblJobProjectBENABLED: TSmallintField
      FieldName = 'BENABLED'
    end
    object tblJobProjectWSTATUSID: TIntegerField
      FieldName = 'WSTATUSID'
    end
    object tblJobProjectWINBUDGETACCID: TIntegerField
      FieldName = 'WINBUDGETACCID'
    end
    object tblJobProjectWEXBUDGETACCID: TIntegerField
      FieldName = 'WEXBUDGETACCID'
    end
    object tblJobProjectWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblJobProjectWINFOSID: TIntegerField
      FieldName = 'WINFOSID'
    end
    object tblJobProjectWGROUP1ID: TIntegerField
      FieldName = 'WGROUP1ID'
    end
    object tblJobProjectDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblJobProjectWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblJobProjectWGROUP2ID: TIntegerField
      FieldName = 'WGROUP2ID'
    end
    object tblJobProjectWPROFBUDGETID: TIntegerField
      FieldName = 'WPROFBUDGETID'
    end
  end
  object qryBatchTypesList: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'Select WBatchTypeID,BCashBook,BatTypes.SDescription,'
      'WContraAccountID, BContraPerLine,'
      
        'BatTypes.DSysDate,(Account.SACCOUNTCODE||'#39'  '#39'||Account.SDescript' +
        'ion)   SContraName,'
      'WAccountID'
      'From BatTypes , Account  where'
      ''
      'BatTypes.WContraAccountID=Account.WAccountID')
    Params = <>
    Left = 562
    Top = 441
    object qryBatchTypesListWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object qryBatchTypesListBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object qryBatchTypesListSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object qryBatchTypesListWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object qryBatchTypesListBCONTRAPERLINE: TSmallintField
      FieldName = 'BCONTRAPERLINE'
    end
    object qryBatchTypesListDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object qryBatchTypesListSCONTRANAME: TStringField
      FieldName = 'SCONTRANAME'
      Size = 42
    end
    object qryBatchTypesListWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object CdsBankDnl: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'STransID'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'WLineTypeID'
        DataType = ftInteger
      end
      item
        Name = 'WSourceID'
        DataType = ftInteger
      end
      item
        Name = 'WBankID'
        DataType = ftInteger
      end
      item
        Name = 'WTransTypeID'
        DataType = ftInteger
      end
      item
        Name = 'SACCOUNTCODE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DTransDate'
        DataType = ftDateTime
      end
      item
        Name = 'DPostedDate'
        DataType = ftDateTime
      end
      item
        Name = 'FAmount'
        DataType = ftFloat
      end
      item
        Name = 'SMemo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SReference'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'BReconciled'
        DataType = ftSmallint
      end
      item
        Name = 'SDescription'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'WCurrencyID'
        DataType = ftInteger
      end
      item
        Name = 'WAccountID'
        DataType = ftInteger
      end
      item
        Name = 'WLineID'
        DataType = ftInteger
      end
      item
        Name = 'WTcTransID'
        DataType = ftInteger
      end
      item
        Name = 'WProfileID'
        DataType = ftInteger
      end
      item
        Name = 'WAutoMatchID'
        DataType = ftInteger
      end
      item
        Name = 'BUseForBatch'
        DataType = ftSmallint
      end
      item
        Name = 'DSysDate'
        DataType = ftDateTime
      end
      item
        Name = 'WAmtSgn'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 764
    Top = 20
    object CdsBankDnlSTransID: TStringField
      FieldName = 'STransID'
      Size = 32
    end
    object CdsBankDnlWLineTypeID: TIntegerField
      FieldName = 'WLineTypeID'
    end
    object CdsBankDnlWSourceID: TIntegerField
      FieldName = 'WSourceID'
    end
    object CdsBankDnlWBankID: TIntegerField
      FieldName = 'WBankID'
    end
    object CdsBankDnlWTransTypeID: TIntegerField
      FieldName = 'WTransTypeID'
    end
    object CdsBankDnlSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 15
    end
    object CdsBankDnlDTransDate: TDateTimeField
      FieldName = 'DTransDate'
    end
    object CdsBankDnlDPostedDate: TDateTimeField
      FieldName = 'DPostedDate'
    end
    object CdsBankDnlFAmount: TFloatField
      FieldName = 'FAmount'
    end
    object CdsBankDnlSMemo: TStringField
      FieldName = 'SMemo'
      Size = 40
    end
    object CdsBankDnlSReference: TStringField
      FieldName = 'SReference'
      Size = 15
    end
    object CdsBankDnlBReconciled: TSmallintField
      FieldName = 'BReconciled'
    end
    object CdsBankDnlSDescription: TStringField
      FieldName = 'SDescription'
      Size = 40
    end
    object CdsBankDnlWCurrencyID: TIntegerField
      FieldName = 'WCurrencyID'
    end
    object CdsBankDnlWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object CdsBankDnlWLineID: TIntegerField
      FieldName = 'WLineID'
    end
    object CdsBankDnlWTcTransID: TIntegerField
      FieldName = 'WTcTransID'
    end
    object CdsBankDnlWProfileID: TIntegerField
      FieldName = 'WProfileID'
    end
    object CdsBankDnlWAutoMatchID: TIntegerField
      FieldName = 'WAutoMatchID'
    end
    object CdsBankDnlBUseForBatch: TSmallintField
      FieldName = 'BUseForBatch'
    end
    object CdsBankDnlDSysDate: TDateTimeField
      FieldName = 'DSysDate'
    end
    object CdsBankDnlWAmtSgn: TIntegerField
      FieldName = 'WAmtSgn'
    end
  end
  object QryPosSalesReport: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT Groups.SDescription, SDocNo, DDate, FSellingPrice,'
      
        'FQtyShipped,Stock.SDescription As SDescription_1, SSTOCKCODE,WTy' +
        'peID, SACCOUNTCODE,'
      
        'Stock.WReportingGroup1ID, Stock.WReportingGroup2ID,FInclusiveAmt' +
        ',FExclusiveAmt'
      'FROM Groups, Stock, DocHead, DocLine, Account'
      'WHERE (Groups.WGroupID = DocHead.WSalesmanID)'
      'AND (DocHead.WaccountID = Account.WaccountID)'
      'AND (Stock.WStockID = DocLine.WStockID)'
      'AND (DocHead.WDocID = DocLine.WDocID)'
      'AND (Groups.WGroupTypeID = 31)'
      'AND (DocHead.WSourceTypeID=2)'
      'AND ((WTypeID = 10) OR (WTypeID = 11))'
      
        'ORDER BY Groups.SDescription,Stock.SDescription,DocHead.WTypeID ' +
        ', DocHead.DDate, SDocNo')
    Params = <>
    Left = 356
    Top = 168
    object QryPosSalesReportSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object QryPosSalesReportSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object QryPosSalesReportDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object QryPosSalesReportFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object QryPosSalesReportFQTYSHIPPED: TFloatField
      FieldName = 'FQTYSHIPPED'
    end
    object QryPosSalesReportSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 35
    end
    object QryPosSalesReportSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object QryPosSalesReportWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object QryPosSalesReportSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object QryPosSalesReportWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object QryPosSalesReportWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object QryPosSalesReportFINCLUSIVEAMT: TFloatField
      FieldName = 'FINCLUSIVEAMT'
    end
    object QryPosSalesReportFEXCLUSIVEAMT: TFloatField
      FieldName = 'FEXCLUSIVEAMT'
    end
  end
  object Unzipper: TVCLUnZip
    OnFilePercentDone = UnzipperFilePercentDone
    Left = 36
    Top = 66
  end
  object QryAccountList: TuniQuery
    Connection = ZMainconnection
    CachedUpdates = True
    SQL.Strings = (
      'Select * from Account')
    Params = <>
    Left = 464
    Top = 496
    object QryAccountListWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QryAccountListSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object QryAccountListSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object QryAccountListWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object QryAccountListSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object QryAccountListWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object QryAccountListWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object QryAccountListBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
    end
    object QryAccountListBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
    end
    object QryAccountListSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object QryAccountListDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object QryAccountListWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object QryAccountListBSelected: TIntegerField
      DefaultExpression = '0'
      FieldKind = fkCalculated
      FieldName = 'BSelected'
      Calculated = True
    end
  end
  object QBOM: TuniQuery
    Connection = ZMainconnection
    UpdateObject = USQLBom
    CachedUpdates = True
    AfterInsert = QBOMAfterInsert
    AfterPost = QBOMAfterPost
    AfterDelete = QBOMAfterPost
    SQL.Strings = (
      
        'Select BOM.*,Stock.SSTOCKCODE,SDescription from BOM,Stock where ' +
        'BOM.WLinkedStockID = Stock.WStockID')
    Params = <>
    Left = 40
    Top = 408
    object QBOMWBOMID: TIntegerField
      FieldName = 'WBOMID'
    end
    object QBOMWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object QBOMWLINKEDSTOCKID: TIntegerField
      FieldName = 'WLINKEDSTOCKID'
    end
    object QBOMFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object QBOMSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object QBOMSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
  end
  object USQLBom: TUniUpdateSql
    DeleteSQL.Strings = (
      'delete from BOM'
      'where'
      
        '  ((BOM.WBOMID is null and :OLD_WBOMID is null) or (BOM.WBOMID =' +
        ' :OLD_WBOMID))')
    InsertSQL.Strings = (
      'insert into BOM'
      '  (BOM.WBOMID, BOM.WSTOCKID, BOM.WLINKEDSTOCKID, BOM.FQTY)'
      'values'
      '  (:WBOMID, :WSTOCKID, :WLINKEDSTOCKID, :FQTY)')
    ModifySQL.Strings = (
      'update BOM set'
      '  BOM.WBOMID = :WBOMID,'
      '  BOM.WSTOCKID = :WSTOCKID,'
      '  BOM.WLINKEDSTOCKID = :WLINKEDSTOCKID,'
      '  BOM.FQTY = :FQTY'
      'where'
      
        '  ((BOM.WBOMID is null and :OLD_WBOMID is null) or (BOM.WBOMID =' +
        ' '
      ':OLD_WBOMID))')
    Left = 672
    Top = 616
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WBOMID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WStockId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLinkedStockID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FQty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WBomID'
        ParamType = ptUnknown
      end>
  end
  object SQLCreateTables: TUniUpdateSql
    DeleteSQL.Strings = (
      'drop TABLE addressPerAccount ;'
      'CREATE TABLE addressPerAccount ('
      '  WAddressPerAccountId autoinc,'
      '  WAccountId integer default 0,'
      '  WContactID integer  default 0)'
      ';'
      'drop TABLE Events ;'
      'CREATE TABLE Events('
      'RecordID autoinc'
      ',StartTime timestamp'
      ',EndTime timestamp'
      ',ResourceID integer'
      ',WContactID integer'
      ',WAccountID integer'
      ',Description char(255)'
      ',Notes char(255)'
      ',Category integer'
      ',AllDayEvent boolean'
      ',DingPath char(255)'
      ',AlarmSet boolean'
      ',AlarmAdvance integer'
      ',AlarmAdvanceType integer'
      ',SnoozeTime timestamp'
      ',RepeatCode integer'
      ',RepeatRangeEnd timestamp'
      ',CustomInterval integer'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100)'
      ')'
      ';'
      'drop TABLE Contacts ;'
      'CREATE TABLE Contacts('
      'RecordID autoinc'
      ',ResourceID integer'
      ',FirstName char(50)'
      ',LastName char(50)'
      ',Birthdate timestamp'
      ',Anniversary timestamp'
      ',Gender char(1)'
      ',Title char(50)'
      ',Company char(50)'
      ',Job_Position char(30)'
      ',Address char(100)'
      ',City char(50)'
      ',State char(25)'
      ',Zip char(10)'
      ',Country char(25)'
      ',Note char(255)'
      ',Phone1 char(25)'
      ',Phone2 char(25)'
      ',Phone3 char(25)'
      ',Phone4 char(25)'
      ',Phone5 char(25)'
      ',PhoneType1 integer'
      ',PhoneType2 integer'
      ',PhoneType3 integer'
      ',PhoneType4 integer'
      ',PhoneType5 integer'
      ',Category integer'
      ',EMail char(100)'
      ',Custom1 char(100)'
      ',Custom2 char(100)'
      ',Custom3 char(100)'
      ',Custom4 char(100)'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100)'
      ',DSysdate TimeStamp'
      ')'
      ';'
      'drop TABLE Tasks ;'
      'create Table Tasks ('
      'RecordID autoinc,'
      'ResourceID Integer,'
      'Complete Boolean,'
      'Description varchar(100),'
      'Details blob,'
      'CreatedOn timestamp,'
      'CompletedOn timestamp,'
      'Priority Integer,'
      'Category Integer,'
      'DueDate timestamp,'
      'UserField0 varchar(100),'
      'UserField1 varchar(100),'
      'UserField2 varchar(100),'
      'UserField3 varchar(100),'
      'UserField4 varchar(100),'
      'UserField5 varchar(100),'
      'UserField6 varchar(100),'
      'UserField7 varchar(100),'
      'UserField8 varchar(100),'
      'UserField9 varchar(100) )'
      ';'
      'drop TABLE Resources ;'
      'CREATE TABLE Resources('
      'ResourceID autoinc'
      ',Description char(255)'
      ',Notes char(255)'
      ',ImageIndex integer'
      ',ResourceActive boolean'
      ',UserField0 char(100)'
      ',UserField1 char(100)'
      ',UserField2 char(100)'
      ',UserField3 char(100)'
      ',UserField4 char(100)'
      ',UserField5 char(100)'
      ',UserField6 char(100)'
      ',UserField7 char(100)'
      ',UserField8 char(100)'
      ',UserField9 char(100)'
      ') ;'
      'drop TABLE TaskAction ;'
      'CREATE TABLE TaskAction('
      'TaskActionID autoinc,'
      'EventId integer,'
      'InvoiceID integer,'
      'AccountId Integer,'
      'WGroupId Integer,'
      'WTypeId Integer'
      ')'
      ';'
      'insert into resources'
      '  (Description, Notes, ImageIndex, ResourceActive)'
      'values'
      '  ('#39'Turbocash'#39', '#39'Main TC resource'#39', 0, true)'
      ''
      '')
    Left = 376
    Top = 608
  end
  object QTasks: TuniQuery
    Connection = ZMainconnection
    UpdateObject = USQLTasks
    CachedUpdates = True
    AfterPost = qGenSQLPostDelete
    AfterDelete = qGenSQLPostDelete
    SQL.Strings = (
      'Select * from tasks')
    Params = <>
    Sequence = ZSqTasks
    SequenceField = 'RECORDID'
    Left = 282
    Top = 617
    object QTasksRECORDID: TIntegerField
      FieldName = 'RECORDID'
    end
    object QTasksRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QTasksCOMPLETE: TSmallintField
      FieldName = 'COMPLETE'
    end
    object QTasksDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object QTasksDETAILS: TBlobField
      FieldName = 'DETAILS'
    end
    object QTasksCREATEDON: TDateTimeField
      FieldName = 'CREATEDON'
    end
    object QTasksCOMPLETEDON: TDateTimeField
      FieldName = 'COMPLETEDON'
    end
    object QTasksPRIORITY: TIntegerField
      FieldName = 'PRIORITY'
    end
    object QTasksCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object QTasksDUEDATE: TDateTimeField
      FieldName = 'DUEDATE'
    end
    object QTasksUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object QTasksUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object QTasksUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object QTasksUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object QTasksUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object QTasksUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object QTasksUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object QTasksUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object QTasksUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object QTasksUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
  end
  object USQLTasks: TUniUpdateSql
    DeleteSQL.Strings = (
      'delete from tasks'
      'where'
      '  RecordID = :OLD_RecordID')
    InsertSQL.Strings = (
      'insert into tasks'
      
        '  (ResourceID, Complete, Description, Details, CreatedOn, Comple' +
        'tedOn, '
      
        '   Priority, Category, DueDate, UserField0, UserField1, UserFiel' +
        'd2, UserField3, '
      
        '   UserField4, UserField5, UserField6, UserField7, UserField8, U' +
        'serField9)'
      'values'
      
        '  (:ResourceID, :Complete, :Description, :Details, :CreatedOn, :' +
        'CompletedOn, '
      
        '   :Priority, :Category, :DueDate, :UserField0, :UserField1, :Us' +
        'erField2, '
      
        '   :UserField3, :UserField4, :UserField5, :UserField6, :UserFiel' +
        'd7, :UserField8, '
      '   :UserField9)')
    ModifySQL.Strings = (
      'update tasks'
      'set'
      '  ResourceID = :ResourceID,'
      '  Complete = :Complete,'
      '  Description = :Description,'
      '  Details = :Details,'
      '  CreatedOn = :CreatedOn,'
      '  CompletedOn = :CompletedOn,'
      '  Priority = :Priority,'
      '  Category = :Category,'
      '  DueDate = :DueDate,'
      '  UserField0 = :UserField0,'
      '  UserField1 = :UserField1,'
      '  UserField2 = :UserField2,'
      '  UserField3 = :UserField3,'
      '  UserField4 = :UserField4,'
      '  UserField5 = :UserField5,'
      '  UserField6 = :UserField6,'
      '  UserField7 = :UserField7,'
      '  UserField8 = :UserField8,'
      '  UserField9 = :UserField9'
      'where'
      '  RecordID = :OLD_RecordID')
    Left = 376
    Top = 577
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ResourceID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Complete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CreatedOn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CompletedOn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Priority'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DueDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField6'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField7'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_RecordID'
        ParamType = ptUnknown
      end>
  end
  object USQLContacts: TUniUpdateSql
    DeleteSQL.Strings = (
      'delete from contacts'
      'where'
      '  RecordID = :OLD_RecordID')
    InsertSQL.Strings = (
      'insert into contacts'
      
        '  (ResourceID, FirstName, LastName, Birthdate, Anniversary, Titl' +
        'e, Company, '
      
        '   Job_Position, Address, City, State, Zip, Country, Note, Phone' +
        '1, Phone2, '
      
        '   Phone3, Phone4, Phone5, PhoneType1, PhoneType2, PhoneType3, P' +
        'honeType4, '
      
        '   PhoneType5, Category, EMail, Custom1, Custom2, Custom3, Custo' +
        'm4, UserField0, '
      
        '   UserField1, UserField2, UserField3, UserField4, UserField5, U' +
        'serField6, '
      '   UserField7, UserField8, UserField9)'
      'values'
      
        '  (:ResourceID, :FirstName, :LastName, :Birthdate, :Anniversary,' +
        ' :Title, '
      
        '   :Company, :Job_Position, :Address, :City, :State, :Zip, :Coun' +
        'try, :Note, '
      
        '   :Phone1, :Phone2, :Phone3, :Phone4, :Phone5, :PhoneType1, :Ph' +
        'oneType2, '
      
        '   :PhoneType3, :PhoneType4, :PhoneType5, :Category, :EMail, :Cu' +
        'stom1, '
      
        '   :Custom2, :Custom3, :Custom4, :UserField0, :UserField1, :User' +
        'Field2, '
      
        '   :UserField3, :UserField4, :UserField5, :UserField6, :UserFiel' +
        'd7, :UserField8, '
      '   :UserField9)')
    ModifySQL.Strings = (
      'update contacts'
      'set'
      '  ResourceID = :ResourceID,'
      '  FirstName = :FirstName,'
      '  LastName = :LastName,'
      '  Birthdate = :Birthdate,'
      '  Anniversary = :Anniversary,'
      '  Title = :Title,'
      '  Company = :Company,'
      '  Job_Position = :Job_Position,'
      '  Address = :Address,'
      '  City = :City,'
      '  State = :State,'
      '  Zip = :Zip,'
      '  Country = :Country,'
      '  Note = :Note,'
      '  Phone1 = :Phone1,'
      '  Phone2 = :Phone2,'
      '  Phone3 = :Phone3,'
      '  Phone4 = :Phone4,'
      '  Phone5 = :Phone5,'
      '  PhoneType1 = :PhoneType1,'
      '  PhoneType2 = :PhoneType2,'
      '  PhoneType3 = :PhoneType3,'
      '  PhoneType4 = :PhoneType4,'
      '  PhoneType5 = :PhoneType5,'
      '  Category = :Category,'
      '  EMail = :EMail,'
      '  Custom1 = :Custom1,'
      '  Custom2 = :Custom2,'
      '  Custom3 = :Custom3,'
      '  Custom4 = :Custom4,'
      '  UserField0 = :UserField0,'
      '  UserField1 = :UserField1,'
      '  UserField2 = :UserField2,'
      '  UserField3 = :UserField3,'
      '  UserField4 = :UserField4,'
      '  UserField5 = :UserField5,'
      '  UserField6 = :UserField6,'
      '  UserField7 = :UserField7,'
      '  UserField8 = :UserField8,'
      '  UserField9 = :UserField9'
      'where'
      '  RecordID = :OLD_RecordID')
    Left = 368
    Top = 561
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ResourceID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FirstName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LastName'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Birthdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Anniversary'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Company'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Position'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'City'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'State'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Zip'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Country'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Note'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PhoneType1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PhoneType2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PhoneType3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PhoneType4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PhoneType5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EMail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Custom1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Custom2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Custom3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Custom4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField6'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField7'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_RecordID'
        ParamType = ptUnknown
      end>
  end
  object QContacts: TuniQuery
    Connection = ZMainconnection
    UpdateObject = USQLContacts
    CachedUpdates = True
    AfterInsert = QContactsAfterInsert
    AfterPost = qGenSQLPostDelete
    AfterDelete = qGenSQLPostDelete
    SQL.Strings = (
      'Select * from contacts where RecordID =:ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Sequence = ZSqContacts
    SequenceField = 'RECORDID'
    Left = 234
    Top = 585
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QContactsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Origin = 'RECORDID'
    end
    object QContactsRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
      Origin = 'RESOURCEID'
    end
    object QContactsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Origin = 'FIRSTNAME'
      Size = 50
    end
    object QContactsLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Origin = 'LASTNAME'
      Size = 50
    end
    object QContactsBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
      Origin = 'BIRTHDATE'
    end
    object QContactsANNIVERSARY: TDateTimeField
      FieldName = 'ANNIVERSARY'
      Origin = 'ANNIVERSARY'
    end
    object QContactsGENDER: TStringField
      FieldName = 'GENDER'
      Origin = 'GENDER'
      Size = 1
    end
    object QContactsTITLE: TStringField
      FieldName = 'TITLE'
      Origin = 'TITLE'
      Size = 50
    end
    object QContactsCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 50
    end
    object QContactsJOB_POSITION: TStringField
      FieldName = 'JOB_POSITION'
      Origin = 'JOB_POSITION'
      Size = 30
    end
    object QContactsADDRESS: TStringField
      FieldName = 'ADDRESS'
      Origin = 'ADDRESS'
      Size = 100
    end
    object QContactsCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object QContactsSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
      Size = 25
    end
    object QContactsZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      Size = 10
    end
    object QContactsCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      Size = 25
    end
    object QContactsNOTE: TStringField
      FieldName = 'NOTE'
      Origin = 'NOTE'
      Size = 255
    end
    object QContactsPHONE1: TStringField
      FieldName = 'PHONE1'
      Origin = 'PHONE1'
      Size = 25
    end
    object QContactsPHONE2: TStringField
      FieldName = 'PHONE2'
      Origin = 'PHONE2'
      Size = 25
    end
    object QContactsPHONE3: TStringField
      FieldName = 'PHONE3'
      Origin = 'PHONE3'
      Size = 25
    end
    object QContactsPHONE4: TStringField
      FieldName = 'PHONE4'
      Origin = 'PHONE4'
      Size = 25
    end
    object QContactsPHONE5: TStringField
      FieldName = 'PHONE5'
      Origin = 'PHONE5'
      Size = 25
    end
    object QContactsPHONETYPE1: TIntegerField
      FieldName = 'PHONETYPE1'
      Origin = 'PHONETYPE1'
    end
    object QContactsPHONETYPE2: TIntegerField
      FieldName = 'PHONETYPE2'
      Origin = 'PHONETYPE2'
    end
    object QContactsPHONETYPE3: TIntegerField
      FieldName = 'PHONETYPE3'
      Origin = 'PHONETYPE3'
    end
    object QContactsPHONETYPE4: TIntegerField
      FieldName = 'PHONETYPE4'
      Origin = 'PHONETYPE4'
    end
    object QContactsPHONETYPE5: TIntegerField
      FieldName = 'PHONETYPE5'
      Origin = 'PHONETYPE5'
    end
    object QContactsCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
      Origin = 'CATEGORY'
    end
    object QContactsEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object QContactsCUSTOM1: TStringField
      FieldName = 'CUSTOM1'
      Origin = 'CUSTOM1'
      Size = 100
    end
    object QContactsCUSTOM2: TStringField
      FieldName = 'CUSTOM2'
      Origin = 'CUSTOM2'
      Size = 100
    end
    object QContactsCUSTOM3: TStringField
      FieldName = 'CUSTOM3'
      Origin = 'CUSTOM3'
      Size = 100
    end
    object QContactsCUSTOM4: TStringField
      FieldName = 'CUSTOM4'
      Origin = 'CUSTOM4'
      Size = 100
    end
    object QContactsUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Origin = 'USERFIELD0'
      Size = 100
    end
    object QContactsUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Origin = 'USERFIELD1'
      Size = 100
    end
    object QContactsUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Origin = 'USERFIELD2'
      Size = 100
    end
    object QContactsUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Origin = 'USERFIELD3'
      Size = 100
    end
    object QContactsUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Origin = 'USERFIELD4'
      Size = 100
    end
    object QContactsUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Origin = 'USERFIELD5'
      Size = 100
    end
    object QContactsUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Origin = 'USERFIELD6'
      Size = 100
    end
    object QContactsUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Origin = 'USERFIELD7'
      Size = 100
    end
    object QContactsUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Origin = 'USERFIELD8'
      Size = 100
    end
    object QContactsUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Origin = 'USERFIELD9'
      Size = 100
    end
    object QContactsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
      Origin = 'DSYSDATE'
    end
  end
  object QEvents: TuniQuery
    Connection = ZMainconnection
    UpdateObject = USQLEvents
    CachedUpdates = True
    AfterPost = qGenSQLPostDelete
    AfterDelete = qGenSQLPostDelete
    SQL.Strings = (
      'Select * from events')
    Params = <>
    Sequence = ZSqEvents
    SequenceField = 'RECORDID'
    Left = 282
    Top = 537
    object QEventsRECORDID: TIntegerField
      FieldName = 'RECORDID'
    end
    object QEventsSTARTTIME: TDateTimeField
      FieldName = 'STARTTIME'
    end
    object QEventsENDTIME: TDateTimeField
      FieldName = 'ENDTIME'
    end
    object QEventsRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QEventsWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object QEventsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QEventsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object QEventsNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object QEventsCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object QEventsALLDAYEVENT: TSmallintField
      FieldName = 'ALLDAYEVENT'
    end
    object QEventsDINGPATH: TStringField
      FieldName = 'DINGPATH'
      Size = 255
    end
    object QEventsALARMSET: TSmallintField
      FieldName = 'ALARMSET'
    end
    object QEventsALARMADVANCE: TIntegerField
      FieldName = 'ALARMADVANCE'
    end
    object QEventsALARMADVANCETYPE: TIntegerField
      FieldName = 'ALARMADVANCETYPE'
    end
    object QEventsSNOOZETIME: TDateTimeField
      FieldName = 'SNOOZETIME'
    end
    object QEventsREPEATCODE: TIntegerField
      FieldName = 'REPEATCODE'
    end
    object QEventsREPEATRANGEEND: TDateTimeField
      FieldName = 'REPEATRANGEEND'
    end
    object QEventsCUSTOMINTERVAL: TIntegerField
      FieldName = 'CUSTOMINTERVAL'
    end
    object QEventsUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object QEventsUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object QEventsUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object QEventsUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object QEventsUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object QEventsUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object QEventsUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object QEventsUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object QEventsUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object QEventsUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
  end
  object USQLEvents: TUniUpdateSql
    DeleteSQL.Strings = (
      'delete from events'
      'where'
      '  RecordID = :OLD_RecordID')
    InsertSQL.Strings = (
      'insert into events'
      
        '  (StartTime, EndTime, ResourceID, WContactID, WAccountID, Descr' +
        'iption, '
      
        '   Notes, Category, AllDayEvent, DingPath, AlarmSet, AlarmAdvanc' +
        'e, AlarmAdvanceType, '
      
        '   SnoozeTime, RepeatCode, RepeatRangeEnd, CustomInterval, UserF' +
        'ield0, '
      
        '   UserField1, UserField2, UserField3, UserField4, UserField5, U' +
        'serField6, '
      '   UserField7, UserField8, UserField9)'
      'values'
      
        '  (:StartTime, :EndTime, :ResourceID, :WContactID, :WAccountID, ' +
        ':Description, '
      
        '   :Notes, :Category, :AllDayEvent, :DingPath, :AlarmSet, :Alarm' +
        'Advance, '
      
        '   :AlarmAdvanceType, :SnoozeTime, :RepeatCode, :RepeatRangeEnd,' +
        ' :CustomInterval, '
      
        '   :UserField0, :UserField1, :UserField2, :UserField3, :UserFiel' +
        'd4, :UserField5, '
      '   :UserField6, :UserField7, :UserField8, :UserField9)')
    ModifySQL.Strings = (
      'update events'
      'set'
      '  StartTime = :StartTime,'
      '  EndTime = :EndTime,'
      '  ResourceID = :ResourceID,'
      '  WContactID = :WContactID,'
      '  WAccountID = :WAccountID,'
      '  Description = :Description,'
      '  Notes = :Notes,'
      '  Category = :Category,'
      '  AllDayEvent = :AllDayEvent,'
      '  DingPath = :DingPath,'
      '  AlarmSet = :AlarmSet,'
      '  AlarmAdvance = :AlarmAdvance,'
      '  AlarmAdvanceType = :AlarmAdvanceType,'
      '  SnoozeTime = :SnoozeTime,'
      '  RepeatCode = :RepeatCode,'
      '  RepeatRangeEnd = :RepeatRangeEnd,'
      '  CustomInterval = :CustomInterval,'
      '  UserField0 = :UserField0,'
      '  UserField1 = :UserField1,'
      '  UserField2 = :UserField2,'
      '  UserField3 = :UserField3,'
      '  UserField4 = :UserField4,'
      '  UserField5 = :UserField5,'
      '  UserField6 = :UserField6,'
      '  UserField7 = :UserField7,'
      '  UserField8 = :UserField8,'
      '  UserField9 = :UserField9'
      'where'
      '  RecordID = :OLD_RecordID')
    Left = 376
    Top = 537
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'StartTime'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EndTime'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ResourceID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WContactID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WAccountID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AllDayEvent'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DingPath'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AlarmSet'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AlarmAdvance'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AlarmAdvanceType'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SnoozeTime'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RepeatCode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RepeatRangeEnd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustomInterval'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField6'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField7'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_RecordID'
        ParamType = ptUnknown
      end>
  end
  object USQLResource: TUniUpdateSql
    DeleteSQL.Strings = (
      'delete from resources'
      'where'
      '  ResourceID = :OLD_ResourceID')
    InsertSQL.Strings = (
      'insert into resources'
      
        '  (Description, Notes, ImageIndex, ResourceActive, UserField0, U' +
        'serField1, '
      
        '   UserField2, UserField3, UserField4, UserField5, UserField6, U' +
        'serField7, '
      '   UserField8, UserField9)'
      'values'
      
        '  (:Description, :Notes, :ImageIndex, :ResourceActive, :UserFiel' +
        'd0, :UserField1, '
      
        '   :UserField2, :UserField3, :UserField4, :UserField5, :UserFiel' +
        'd6, :UserField7, '
      '   :UserField8, :UserField9)')
    ModifySQL.Strings = (
      'update resources'
      'set'
      '  Description = :Description,'
      '  Notes = :Notes,'
      '  ImageIndex = :ImageIndex,'
      '  ResourceActive = :ResourceActive,'
      '  UserField0 = :UserField0,'
      '  UserField1 = :UserField1,'
      '  UserField2 = :UserField2,'
      '  UserField3 = :UserField3,'
      '  UserField4 = :UserField4,'
      '  UserField5 = :UserField5,'
      '  UserField6 = :UserField6,'
      '  UserField7 = :UserField7,'
      '  UserField8 = :UserField8,'
      '  UserField9 = :UserField9'
      'where'
      '  ResourceID = :OLD_ResourceID')
    Left = 376
    Top = 505
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ImageIndex'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ResourceActive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField5'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField6'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField7'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField8'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UserField9'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ResourceID'
        ParamType = ptUnknown
      end>
  end
  object QResources: TuniQuery
    Connection = ZMainconnection
    UpdateObject = USQLResource
    CachedUpdates = True
    AfterPost = qGenSQLPostDelete
    AfterDelete = qGenSQLPostDelete
    SQL.Strings = (
      'Select * from resources')
    Params = <>
    Sequence = ZSqResource
    SequenceField = 'RESOURCEID'
    Left = 282
    Top = 545
    object QResourcesRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QResourcesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object QResourcesNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object QResourcesIMAGEINDEX: TIntegerField
      FieldName = 'IMAGEINDEX'
    end
    object QResourcesRESOURCEACTIVE: TSmallintField
      FieldName = 'RESOURCEACTIVE'
    end
    object QResourcesUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object QResourcesUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object QResourcesUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object QResourcesUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object QResourcesUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object QResourcesUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object QResourcesUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object QResourcesUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object QResourcesUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object QResourcesUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
  end
  object TblContacts: TuniTable
    Connection = ZMainconnection
    AfterInsert = TblContactsAfterInsert
    TableName = 'Contacts'
    Sequence = ZSqContacts
    SequenceField = 'RECORDID'
    Left = 754
    Top = 224
    object TblContactsRECORDID: TIntegerField
      AutoGenerateValue = arAutoInc
      DefaultExpression = '1'
      FieldName = 'RECORDID'
    end
    object TblContactsRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object TblContactsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object TblContactsLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object TblContactsBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
    end
    object TblContactsANNIVERSARY: TDateTimeField
      FieldName = 'ANNIVERSARY'
    end
    object TblContactsGENDER: TStringField
      FieldName = 'GENDER'
      Size = 1
    end
    object TblContactsTITLE: TStringField
      FieldName = 'TITLE'
      Size = 50
    end
    object TblContactsCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 50
    end
    object TblContactsJOB_POSITION: TStringField
      FieldName = 'JOB_POSITION'
      Size = 30
    end
    object TblContactsADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
    object TblContactsCITY: TStringField
      FieldName = 'CITY'
      Size = 50
    end
    object TblContactsSTATE: TStringField
      FieldName = 'STATE'
      Size = 25
    end
    object TblContactsZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object TblContactsCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 25
    end
    object TblContactsNOTE: TStringField
      FieldName = 'NOTE'
      Size = 255
    end
    object TblContactsPHONE1: TStringField
      FieldName = 'PHONE1'
      Size = 25
    end
    object TblContactsPHONE2: TStringField
      FieldName = 'PHONE2'
      Size = 25
    end
    object TblContactsPHONE3: TStringField
      FieldName = 'PHONE3'
      Size = 25
    end
    object TblContactsPHONE4: TStringField
      FieldName = 'PHONE4'
      Size = 25
    end
    object TblContactsPHONE5: TStringField
      FieldName = 'PHONE5'
      Size = 25
    end
    object TblContactsPHONETYPE1: TIntegerField
      FieldName = 'PHONETYPE1'
    end
    object TblContactsPHONETYPE2: TIntegerField
      FieldName = 'PHONETYPE2'
    end
    object TblContactsPHONETYPE3: TIntegerField
      FieldName = 'PHONETYPE3'
    end
    object TblContactsPHONETYPE4: TIntegerField
      FieldName = 'PHONETYPE4'
    end
    object TblContactsPHONETYPE5: TIntegerField
      FieldName = 'PHONETYPE5'
    end
    object TblContactsCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object TblContactsEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object TblContactsCUSTOM1: TStringField
      FieldName = 'CUSTOM1'
      Size = 100
    end
    object TblContactsCUSTOM2: TStringField
      FieldName = 'CUSTOM2'
      Size = 100
    end
    object TblContactsCUSTOM3: TStringField
      FieldName = 'CUSTOM3'
      Size = 100
    end
    object TblContactsCUSTOM4: TStringField
      FieldName = 'CUSTOM4'
      Size = 100
    end
    object TblContactsUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object TblContactsUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object TblContactsUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object TblContactsUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object TblContactsUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object TblContactsUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object TblContactsUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object TblContactsUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object TblContactsUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object TblContactsUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
    object TblContactsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object TblEvents: TuniTable
    Connection = ZMainconnection
    TableName = 'Events'
    Sequence = ZSqEvents
    SequenceField = 'RECORDID'
    Left = 810
    Top = 256
    object TblEventsRECORDID: TIntegerField
      FieldName = 'RECORDID'
    end
    object TblEventsSTARTTIME: TDateTimeField
      FieldName = 'STARTTIME'
    end
    object TblEventsENDTIME: TDateTimeField
      FieldName = 'ENDTIME'
    end
    object TblEventsRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object TblEventsWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object TblEventsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object TblEventsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object TblEventsNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object TblEventsCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object TblEventsALLDAYEVENT: TSmallintField
      FieldName = 'ALLDAYEVENT'
    end
    object TblEventsDINGPATH: TStringField
      FieldName = 'DINGPATH'
      Size = 255
    end
    object TblEventsALARMSET: TSmallintField
      FieldName = 'ALARMSET'
    end
    object TblEventsALARMADVANCE: TIntegerField
      FieldName = 'ALARMADVANCE'
    end
    object TblEventsALARMADVANCETYPE: TIntegerField
      FieldName = 'ALARMADVANCETYPE'
    end
    object TblEventsSNOOZETIME: TDateTimeField
      FieldName = 'SNOOZETIME'
    end
    object TblEventsREPEATCODE: TIntegerField
      FieldName = 'REPEATCODE'
    end
    object TblEventsREPEATRANGEEND: TDateTimeField
      FieldName = 'REPEATRANGEEND'
    end
    object TblEventsCUSTOMINTERVAL: TIntegerField
      FieldName = 'CUSTOMINTERVAL'
    end
    object TblEventsUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object TblEventsUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object TblEventsUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object TblEventsUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object TblEventsUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object TblEventsUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object TblEventsUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object TblEventsUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object TblEventsUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object TblEventsUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
  end
  object TblTasks: TuniTable
    Connection = ZMainconnection
    TableName = 'Tasks'
    Sequence = ZSqTasks
    SequenceField = 'RECORDID'
    Left = 818
    Top = 200
    object TblTasksRECORDID: TIntegerField
      FieldName = 'RECORDID'
    end
    object TblTasksRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object TblTasksCOMPLETE: TSmallintField
      FieldName = 'COMPLETE'
    end
    object TblTasksDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object TblTasksDETAILS: TBlobField
      FieldName = 'DETAILS'
    end
    object TblTasksCREATEDON: TDateTimeField
      FieldName = 'CREATEDON'
    end
    object TblTasksCOMPLETEDON: TDateTimeField
      FieldName = 'COMPLETEDON'
    end
    object TblTasksPRIORITY: TIntegerField
      FieldName = 'PRIORITY'
    end
    object TblTasksCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object TblTasksDUEDATE: TDateTimeField
      FieldName = 'DUEDATE'
    end
    object TblTasksUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object TblTasksUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object TblTasksUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object TblTasksUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object TblTasksUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object TblTasksUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object TblTasksUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object TblTasksUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object TblTasksUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object TblTasksUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
  end
  object TblResources: TuniTable
    Connection = ZMainconnection
    TableName = 'Resources'
    Sequence = ZSqResource
    SequenceField = 'RESOURCEID'
    Left = 768
    Top = 264
    object TblResourcesRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object TblResourcesDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object TblResourcesNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object TblResourcesIMAGEINDEX: TIntegerField
      FieldName = 'IMAGEINDEX'
    end
    object TblResourcesRESOURCEACTIVE: TSmallintField
      FieldName = 'RESOURCEACTIVE'
    end
    object TblResourcesUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object TblResourcesUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object TblResourcesUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object TblResourcesUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object TblResourcesUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object TblResourcesUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object TblResourcesUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object TblResourcesUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object TblResourcesUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object TblResourcesUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
  end
  object USQLadressPerAccount: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM AddressPerAccount'
      'WHERE'
      
        '  AddressPerAccount.WADDRESSPERACCOUNTID = :OLD_WADDRESSPERACCOU' +
        'NTID')
    InsertSQL.Strings = (
      'INSERT INTO AddressPerAccount'
      
        '  (AddressPerAccount.WADDRESSPERACCOUNTID, AddressPerAccount.WAC' +
        'COUNTID, '
      '   AddressPerAccount.WCONTACTID)'
      'VALUES'
      '  (:WADDRESSPERACCOUNTID, :WACCOUNTID, :WCONTACTID)')
    ModifySQL.Strings = (
      'UPDATE AddressPerAccount SET'
      '  AddressPerAccount.WADDRESSPERACCOUNTID = '
      ':WADDRESSPERACCOUNTID,'
      '  AddressPerAccount.WACCOUNTID = :WACCOUNTID,'
      '  AddressPerAccount.WCONTACTID = :WCONTACTID'
      'WHERE'
      '  AddressPerAccount.WADDRESSPERACCOUNTID = '
      ':OLD_WADDRESSPERACCOUNTID')
    Left = 552
    Top = 137
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WADDRESSPERACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WAccountId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WContactID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WAddressPerAccountId'
        ParamType = ptUnknown
      end>
  end
  object QadressPerAccount: TuniQuery
    Connection = ZMainconnection
    UpdateObject = USQLadressPerAccount
    CachedUpdates = True
    AfterPost = qGenSQLPostDelete
    AfterDelete = qGenSQLPostDelete
    SQL.Strings = (
      
        'Select * from contacts,AddressPerAccount where Contacts.RecordID' +
        ' = AddressPerAccount.WContactId and  AddressPerAccount.WaccountI' +
        'd = :ID')
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Sequence = ZSAddressPerAccount
    SequenceField = 'WADDRESSPERACCOUNTID'
    Left = 544
    Top = 105
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QadressPerAccountRECORDID: TIntegerField
      FieldName = 'RECORDID'
    end
    object QadressPerAccountRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QadressPerAccountFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object QadressPerAccountLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object QadressPerAccountBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
    end
    object QadressPerAccountANNIVERSARY: TDateTimeField
      FieldName = 'ANNIVERSARY'
    end
    object QadressPerAccountGENDER: TStringField
      FieldName = 'GENDER'
      Size = 1
    end
    object QadressPerAccountTITLE: TStringField
      FieldName = 'TITLE'
      Size = 50
    end
    object QadressPerAccountCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 50
    end
    object QadressPerAccountJOB_POSITION: TStringField
      FieldName = 'JOB_POSITION'
      Size = 30
    end
    object QadressPerAccountADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
    object QadressPerAccountCITY: TStringField
      FieldName = 'CITY'
      Size = 50
    end
    object QadressPerAccountSTATE: TStringField
      FieldName = 'STATE'
      Size = 25
    end
    object QadressPerAccountZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object QadressPerAccountCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 25
    end
    object QadressPerAccountNOTE: TStringField
      FieldName = 'NOTE'
      Size = 255
    end
    object QadressPerAccountPHONE1: TStringField
      FieldName = 'PHONE1'
      Size = 25
    end
    object QadressPerAccountPHONE2: TStringField
      FieldName = 'PHONE2'
      Size = 25
    end
    object QadressPerAccountPHONE3: TStringField
      FieldName = 'PHONE3'
      Size = 25
    end
    object QadressPerAccountPHONE4: TStringField
      FieldName = 'PHONE4'
      Size = 25
    end
    object QadressPerAccountPHONE5: TStringField
      FieldName = 'PHONE5'
      Size = 25
    end
    object QadressPerAccountPHONETYPE1: TIntegerField
      FieldName = 'PHONETYPE1'
    end
    object QadressPerAccountPHONETYPE2: TIntegerField
      FieldName = 'PHONETYPE2'
    end
    object QadressPerAccountPHONETYPE3: TIntegerField
      FieldName = 'PHONETYPE3'
    end
    object QadressPerAccountPHONETYPE4: TIntegerField
      FieldName = 'PHONETYPE4'
    end
    object QadressPerAccountPHONETYPE5: TIntegerField
      FieldName = 'PHONETYPE5'
    end
    object QadressPerAccountCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object QadressPerAccountEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object QadressPerAccountCUSTOM1: TStringField
      FieldName = 'CUSTOM1'
      Size = 100
    end
    object QadressPerAccountCUSTOM2: TStringField
      FieldName = 'CUSTOM2'
      Size = 100
    end
    object QadressPerAccountCUSTOM3: TStringField
      FieldName = 'CUSTOM3'
      Size = 100
    end
    object QadressPerAccountCUSTOM4: TStringField
      FieldName = 'CUSTOM4'
      Size = 100
    end
    object QadressPerAccountUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object QadressPerAccountUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object QadressPerAccountUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object QadressPerAccountUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object QadressPerAccountUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object QadressPerAccountUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object QadressPerAccountUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object QadressPerAccountUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object QadressPerAccountUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object QadressPerAccountUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
    object QadressPerAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object QadressPerAccountWADDRESSPERACCOUNTID: TIntegerField
      FieldName = 'WADDRESSPERACCOUNTID'
    end
    object QadressPerAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QadressPerAccountWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
  end
  object QTaskAction: TuniQuery
    Connection = ZMainconnection
    UpdateObject = USQLTaskAction
    CachedUpdates = True
    AfterPost = qGenSQLPostDelete
    AfterDelete = qGenSQLPostDelete
    SQL.Strings = (
      
        'SELECT taskaction.TaskActionID, taskaction.EventId, taskaction.I' +
        'nvoiceID, '
      'taskaction.AccountId, taskaction.WGroupId, taskaction.WTypeId,'
      ' Groups.SDescription, Dochead.SDocNo, Dochead.FDocAmount, '
      
        'Dochead.SReference, Groups.WGroupTypeID, Account.SDescription, A' +
        'ccount.SACCOUNTCODE'
      'FROM taskaction'
      '   LEFT OUTER JOIN Account'
      '   ON  (taskaction.AccountId = Account.WAccountID)  '
      '   LEFT OUTER JOIN DocHead'
      '   ON  (taskaction.InvoiceID = Dochead.WDocID)  '
      '   LEFT OUTER JOIN Groups'
      '   ON  (taskaction.WGroupId = Groups.WGroupID)  '
      'where EventId = :EventID')
    Params = <
      item
        DataType = ftInteger
        Name = 'EventID'
        ParamType = ptUnknown
      end>
    Sequence = ZSqTaskAction
    SequenceField = 'TASKACTIONID'
    Left = 816
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EventID'
        ParamType = ptUnknown
      end>
    object QTaskActionTASKACTIONID: TIntegerField
      FieldName = 'TASKACTIONID'
    end
    object QTaskActionEVENTID: TIntegerField
      FieldName = 'EVENTID'
    end
    object QTaskActionINVOICEID: TIntegerField
      FieldName = 'INVOICEID'
    end
    object QTaskActionACCOUNTID: TIntegerField
      FieldName = 'ACCOUNTID'
    end
    object QTaskActionWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object QTaskActionWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object QTaskActionSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object QTaskActionSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object QTaskActionFDOCAMOUNT: TFloatField
      FieldName = 'FDOCAMOUNT'
    end
    object QTaskActionSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QTaskActionWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object QTaskActionSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 35
    end
    object QTaskActionSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
  end
  object USQLTaskAction: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM taskaction'
      'WHERE'
      '  taskaction.TASKACTIONID = :OLD_TASKACTIONID')
    InsertSQL.Strings = (
      'INSERT INTO taskaction'
      
        '  (taskaction.TASKACTIONID, taskaction.EVENTID, taskaction.INVOI' +
        'CEID, taskaction.ACCOUNTID, '
      '   taskaction.WGROUPID, taskaction.WTYPEID)'
      'VALUES'
      
        '  (:TASKACTIONID, :EVENTID, :INVOICEID, :ACCOUNTID, :WGROUPID, :' +
        'WTYPEID)')
    ModifySQL.Strings = (
      'UPDATE taskaction SET'
      '  taskaction.TASKACTIONID = :TASKACTIONID,'
      '  taskaction.EVENTID = :EVENTID,'
      '  taskaction.INVOICEID = :INVOICEID,'
      '  taskaction.ACCOUNTID = :ACCOUNTID,'
      '  taskaction.WGROUPID = :WGROUPID,'
      '  taskaction.WTYPEID = :WTYPEID'
      'WHERE'
      '  taskaction.TASKACTIONID = :OLD_TASKACTIONID')
    Left = 888
    Top = 241
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TASKACTIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EventId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'InvoiceID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AccountId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WGroupId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTypeId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_TaskActionID'
        ParamType = ptUnknown
      end>
  end
  object ZMainconnection: TUniconnection
    Protocol = 'firebird-1.5'
    Database = 'C:\Turbocash\Books\HANDYMAN\books.FDB'
    User = 'sysdba'
    Password = 'masterkey'
    TransactIsolationLevel = tiReadCommitted
    Left = 40
    Top = 24
  end
  object TblReconBank: TuniQuery
    Connection = ZMainconnection
    SQL.Strings = (
      'SELECT * from BAT0T12')
    Params = <>
    Left = 384
    Top = 158
    object TblReconBankSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object TblReconBankSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 7
    end
    object TblReconBankSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object TblReconBankFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object TblReconBankFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object TblReconBankSTAX: TStringField
      FieldName = 'STAX'
      Size = 7
    end
    object TblReconBankDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object TblReconBankFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object TblReconBankSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 7
    end
    object TblReconBankFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object TblReconBankDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object TblReconBankBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object TblReconBankBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object TblReconBankWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object TblReconBankWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object TblReconBankFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object TblReconBankWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object TblReconBankWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object TblReconBankNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object TblReconBankSPROFILE: TStringField
      FieldName = 'SPROFILE'
      Size = 35
    end
    object TblReconBankSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      Size = 8
    end
    object TblReconBankSTAX2: TStringField
      FieldName = 'STAX2'
      Size = 8
    end
    object TblReconBankBLINKED: TSmallintField
      FieldName = 'BLINKED'
    end
    object TblReconBankDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object TblReconBankFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
  end
  object ZCalTotals: TuniQuery
    Connection = ZMainconnection
    AfterClose = qGenAfterClose
    Params = <>
    Left = 661
    Top = 16
  end
  object ZSQLMonitor1: TUniSQLMonitor
    AutoSave = True
    FileName = 'c:\log.txt'
    MaxTraceCount = 100
    Left = 352
    Top = 8
  end
  object ZQReportOpNextNum: TuniQuery
    Connection = ZMainconnection
    Params = <>
    Left = 664
    Top = 72
  end
  object ZSqContacts: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_CONTACTS_ID'
    Left = 880
    Top = 200
  end
  object ZSqEvents: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_EVENTS_ID'
    Left = 880
    Top = 152
  end
  object ZSqResource: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_RESOURCEID_ID'
    Left = 880
    Top = 120
  end
  object ZSqTaskAction: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_TASKACTION_ID'
    Left = 928
    Top = 152
  end
  object ZSqTasks: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_TASKS_ID'
    Left = 880
    Top = 64
  end
  object ZQGenBatches: TuniQuery
    Connection = ZMainconnection
    Params = <>
    Left = 584
    Top = 24
  end
  object ZSequence1: TZSequence
    Left = 928
    Top = 80
  end
  object ZSqSYSPARAMS: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_SYSPARAMS_ID'
    Left = 312
    Top = 360
  end
  object ZSAddressPerAccount: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_ADDRESSPERACCOUNT_ID'
    Left = 464
    Top = 104
  end
  object ZQMessage: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLMessage
    AfterInsert = ZQMessageAfterInsert
    SQL.Strings = (
      'Select * from messages where sdescription = :Desc')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Desc'
        ParamType = ptUnknown
      end>
    Left = 904
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Desc'
        ParamType = ptUnknown
      end>
    object ZQMessageWMESSAGEID: TIntegerField
      FieldName = 'WMESSAGEID'
      Required = True
    end
    object ZQMessageSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQMessageSEXTRADESCRIPTION: TStringField
      FieldName = 'SEXTRADESCRIPTION'
      Size = 255
    end
  end
  object ZUSQLMessage: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM messages'
      'WHERE'
      '  messages.WMESSAGEID = :OLD_WMESSAGEID')
    InsertSQL.Strings = (
      'INSERT INTO messages'
      '  (messages.WMESSAGEID, messages.SDESCRIPTION, '
      'messages.SEXTRADESCRIPTION)'
      'VALUES'
      '  (:WMESSAGEID, :SDESCRIPTION, :SEXTRADESCRIPTION)')
    ModifySQL.Strings = (
      'UPDATE messages SET'
      '  messages.WMESSAGEID = :WMESSAGEID,'
      '  messages.SDESCRIPTION = :SDESCRIPTION,'
      '  messages.SEXTRADESCRIPTION = :SEXTRADESCRIPTION'
      'WHERE'
      '  messages.WMESSAGEID = :OLD_WMESSAGEID')
    Left = 904
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WMESSAGEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SDESCRIPTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXTRADESCRIPTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WMESSAGEID'
        ParamType = ptUnknown
      end>
  end
  object ZQStock: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLStock
    SQL.Strings = (
      'select stock.*,'
      'Accintax.SAccountCode IntaxCode,'
      'Accintax.Sdescription IntaxDesc,'
      'intax.FRate IntaxRate,'
      'AccOutTax.SAccountCode outTaxCode,'
      'AccOutTax.Sdescription outTaxDesc,'
      'OutTax.FRate outTaxRate,'
      'COSAcc.SAccountCode COSAccCode,'
      'COSAcc.SDescription COSAccDesc,'
      'SalesAcc.SAccountCode SalesAccCode,'
      'SalesAcc.SDescription SalesAccDesc,'
      'StockAcc.SAccountCode StockAccCode,'
      'StockAcc.SDescription StockAccDesc'
      ' from '
      'stock '
      'left join Tax intax on(intax.WaccountId = stock.WInputtaxid) '
      'left join Tax OutTax on(OutTax.WaccountId = stock.WOutputtaxid) '
      
        'left join Account Accintax on(Accintax.WaccountId = stock.WInput' +
        'taxid) '
      
        'left join Account AccOutTax on(AccOutTax.WaccountId = stock.WOut' +
        'puttaxid) '
      
        'left join Account COSAcc on(COSAcc.WaccountId = stock.WCOSTACCOU' +
        'NTID) '
      
        'left join Account SalesAcc on(SalesAcc.WaccountId = stock.WSales' +
        'AccountId) '
      
        'left join Account StockAcc on(StockAcc.WaccountId = stock.WStock' +
        'AccountId) ')
    Params = <>
    Left = 904
    Top = 376
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
    object ZQStockINTAXCODE: TStringField
      FieldName = 'INTAXCODE'
      Size = 7
    end
    object ZQStockINTAXDESC: TStringField
      FieldName = 'INTAXDESC'
      Size = 35
    end
    object ZQStockINTAXRATE: TFloatField
      FieldName = 'INTAXRATE'
    end
    object ZQStockOUTTAXCODE: TStringField
      FieldName = 'OUTTAXCODE'
      Size = 7
    end
    object ZQStockOUTTAXDESC: TStringField
      FieldName = 'OUTTAXDESC'
      Size = 35
    end
    object ZQStockOUTTAXRATE: TFloatField
      FieldName = 'OUTTAXRATE'
    end
    object ZQStockCOSACCCODE: TStringField
      FieldName = 'COSACCCODE'
      Size = 7
    end
    object ZQStockCOSACCDESC: TStringField
      FieldName = 'COSACCDESC'
      Size = 35
    end
    object ZQStockSALESACCCODE: TStringField
      FieldName = 'SALESACCCODE'
      Size = 7
    end
    object ZQStockSALESACCDESC: TStringField
      FieldName = 'SALESACCDESC'
      Size = 35
    end
    object ZQStockSTOCKACCCODE: TStringField
      FieldName = 'STOCKACCCODE'
      Size = 7
    end
    object ZQStockSTOCKACCDESC: TStringField
      FieldName = 'STOCKACCDESC'
      Size = 35
    end
  end
  object ZUSQLStock: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM stock'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
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
      '   stock.WLOCATIONID, stock.WFILENAMEID, stock.SEXTRADESC)'
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
      '   :SEXTRADESC)')
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
      '  stock.SEXTRADESC = :SEXTRADESC'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    Left = 904
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WSTOCKID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SSTOCKCODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SBARCODENUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SDESCRIPTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WREPORTINGGROUP1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WREPORTINGGROUP2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WCOSTACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WINPUTTAXID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WOUTPUTTAXID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOPENINGAVECOST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FQTYONHAND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOPENINGQTY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINVQTYONHAND'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FREORDERQTY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSALESACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BAPPLYINVOICEDISCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSTOCKACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSELLINGPRICE1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSELLINGPRICE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSELLINGPRICE3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FUNITAVECOST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FUNITCOST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WUNITID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BAPPLYTAX'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WINPUTTAX2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BTAXABLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSUPPLIER1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSUPPLIER2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSTOCKTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WOUTPUTTAX2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPROFILEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BDISABLED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPERENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLOCATIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WFILENAMEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SEXTRADESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WSTOCKID'
        ParamType = ptUnknown
      end>
  end
  object ZQDocLine: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZSQLDocLine
    SQL.Strings = (
      'select * from docline'
      'left join account on (docline.WTaxId = Account.WaccountId)'
      'where docline.wdocid =:WdocId')
    Params = <
      item
        DataType = ftUnknown
        Name = 'WdocId'
        ParamType = ptUnknown
      end>
    Left = 832
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WdocId'
        ParamType = ptUnknown
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
    object ZQDocLineWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQDocLineSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQDocLineSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQDocLineSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQDocLineSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQDocLineWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQDocLineWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQDocLineWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQDocLineBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQDocLineBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQDocLineDSYSDATE_1: TDateTimeField
      FieldName = 'DSYSDATE_1'
    end
    object ZQDocLineWPROFILEID_1: TIntegerField
      FieldName = 'WPROFILEID_1'
    end
  end
  object ZSQLDocLine: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM docline'
      'WHERE'
      '  docline.WDOCLINEID = :OLD_WDOCLINEID AND'
      '  docline.WDOCID = :OLD_WDOCID')
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
      '   docline.WPROFILEID, docline.WSERIALNOID)'
      'VALUES'
      
        '  (:WDOCLINEID, :WDOCID, :WSTOCKID, :WLINETYPEID, :WDESCRIPTIONI' +
        'D, :FQTYORDERED, '
      
        '   :FQTYSHIPPED, :FSELLINGPRICE, :FITEMDISCOUNT, :WTAXID, :FEXCL' +
        'USIVEAMT, '
      
        '   :FINCLUSIVEAMT, :FTAXAMOUNT, :DSYSDATE, :SUNIT, :SSTOCKCODE, ' +
        ':WPROFILEID, '
      '   :WSERIALNOID)')
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
      '  docline.WSERIALNOID = :WSERIALNOID'
      'WHERE'
      '  docline.WDOCLINEID = :OLD_WDOCLINEID AND'
      '  docline.WDOCID = :OLD_WDOCID')
    Left = 832
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WDOCLINEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDOCID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSTOCKID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLINETYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDESCRIPTIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FQTYORDERED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FQTYSHIPPED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FSELLINGPRICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FITEMDISCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTAXID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FEXCLUSIVEAMT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINCLUSIVEAMT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FTAXAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUNIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SSTOCKCODE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPROFILEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSERIALNOID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WDOCLINEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WDOCID'
        ParamType = ptUnknown
      end>
  end
  object tblGlobal: TuniTable
    Connection = ZMainconnection
    TableName = 'global'
    Left = 112
    Top = 512
    object tblGlobalWNEWACCOUNTID: TIntegerField
      FieldName = 'WNEWACCOUNTID'
    end
    object tblGlobalWNEWBACKORDERID: TIntegerField
      FieldName = 'WNEWBACKORDERID'
    end
    object tblGlobalWNEWCONTACTID: TIntegerField
      FieldName = 'WNEWCONTACTID'
    end
    object tblGlobalWNEWBATCHTYPEID: TIntegerField
      FieldName = 'WNEWBATCHTYPEID'
    end
    object tblGlobalWNEWBATCHID: TIntegerField
      FieldName = 'WNEWBATCHID'
    end
    object tblGlobalWNEWGROUPID: TIntegerField
      FieldName = 'WNEWGROUPID'
    end
    object tblGlobalWNEWCURRENCYID: TIntegerField
      FieldName = 'WNEWCURRENCYID'
    end
    object tblGlobalWNEWDOCID: TIntegerField
      FieldName = 'WNEWDOCID'
    end
    object tblGlobalWNEWLABSPECSID: TIntegerField
      FieldName = 'WNEWLABSPECSID'
    end
    object tblGlobalWNEWREPORTID: TIntegerField
      FieldName = 'WNEWREPORTID'
    end
    object tblGlobalWNEWTRANSACTIONID: TIntegerField
      FieldName = 'WNEWTRANSACTIONID'
    end
    object tblGlobalWNEWSTOCKID: TIntegerField
      FieldName = 'WNEWSTOCKID'
    end
    object tblGlobalWNEWUNITID: TIntegerField
      FieldName = 'WNEWUNITID'
    end
    object tblGlobalWNEWUSERID: TIntegerField
      FieldName = 'WNEWUSERID'
    end
    object tblGlobalWNEWMESSAGEID: TIntegerField
      FieldName = 'WNEWMESSAGEID'
    end
    object tblGlobalWNEWSTOCKTRANSID: TIntegerField
      FieldName = 'WNEWSTOCKTRANSID'
    end
  end
  object ZQBatControl: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLBatCon
    AfterInsert = ZQBatControlAfterInsert
    SQL.Strings = (
      'select * from batcon')
    Params = <>
    Left = 704
    Top = 496
    object ZQBatControlWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQBatControlWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object ZQBatControlWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQBatControlSBATCHNUMBER: TStringField
      FieldName = 'SBATCHNUMBER'
      Size = 8
    end
    object ZQBatControlBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object ZQBatControlBIMPORTED: TSmallintField
      FieldName = 'BIMPORTED'
    end
    object ZQBatControlBDOCSOURCE: TSmallintField
      FieldName = 'BDOCSOURCE'
    end
    object ZQBatControlWLINECOUNT: TIntegerField
      FieldName = 'WLINECOUNT'
    end
    object ZQBatControlSFILENAME: TStringField
      FieldName = 'SFILENAME'
      Size = 16
    end
    object ZQBatControlWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQBatControlDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQBatControlWINITBATID: TIntegerField
      FieldName = 'WINITBATID'
    end
    object ZQBatControlSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object ZQBatControlSUNIQUEID: TStringField
      FieldName = 'SUNIQUEID'
      Size = 8
    end
  end
  object ZUSQLBatCon: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM batcon'
      'WHERE'
      '  batcon.WBATCHID = :OLD_WBATCHID')
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
    Left = 704
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WBATCHID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WUSERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WBATCHTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SBATCHNUMBER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BPOSTED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BIMPORTED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BDOCSOURCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLINECOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SFILENAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDOCID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WINITBATID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SALIAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SUNIQUEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WBATCHID'
        ParamType = ptUnknown
      end>
  end
  object ZQDocHead: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLDocHead
    SQL.Strings = (
      'select * from dochead')
    Params = <>
    Left = 464
    Top = 560
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
  end
  object ZUSQLDocHead: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM dochead'
      'WHERE'
      '  dochead.WDOCID = :OLD_WDOCID')
    InsertSQL.Strings = (
      'INSERT INTO dochead'
      
        '  (dochead.WDOCID, dochead.SDOCNO, dochead.WTYPEID, dochead.DDAT' +
        'E, dochead.DALLOCATEDDATE, '
      
        '   dochead.WACCOUNTID, dochead.WPAYMENTTYPEID, dochead.WPOSTAL1I' +
        'D, dochead.WPOSTAL2ID, '
      
        '   dochead.WPOSTAL3ID, dochead.WPOSTALCODEID, dochead.WMESSAGE1I' +
        'D, dochead.WMESSAGE2ID, '
      
        '   dochead.WMESSAGE3ID, dochead.FINVOICEDISCOUNT, dochead.WSALES' +
        'MANID, '
      
        '   dochead.SREFERENCE, dochead.WDELADDRESS1ID, dochead.WDELADDRE' +
        'SS2ID, '
      
        '   dochead.WDELADDRESS3ID, dochead.WDELCODEID, dochead.BPRINTED,' +
        ' dochead.BPOSTED, '
      
        '   dochead.WREPORTINGGROUP1ID, dochead.WREPORTINGGROUP2ID, doche' +
        'ad.WPAYMENTGROUPID, '
      
        '   dochead.BEXCLUSIVE, dochead.WCURRENCYID, dochead.FDOCAMOUNT, ' +
        'dochead.FTAXAMOUNT, '
      
        '   dochead.BREPEATING, dochead.DSYSDATE, dochead.WSOURCETYPEID, ' +
        'dochead.WPROFILEID, '
      
        '   dochead.WTERMS, dochead.WJOBCODEID, dochead.DDUEDATE, dochead' +
        '.WUSERID)'
      'VALUES'
      
        '  (:WDOCID, :SDOCNO, :WTYPEID, :DDATE, :DALLOCATEDDATE, :WACCOUN' +
        'TID, :WPAYMENTTYPEID, '
      
        '   :WPOSTAL1ID, :WPOSTAL2ID, :WPOSTAL3ID, :WPOSTALCODEID, :WMESS' +
        'AGE1ID, '
      
        '   :WMESSAGE2ID, :WMESSAGE3ID, :FINVOICEDISCOUNT, :WSALESMANID, ' +
        ':SREFERENCE, '
      
        '   :WDELADDRESS1ID, :WDELADDRESS2ID, :WDELADDRESS3ID, :WDELCODEI' +
        'D, :BPRINTED, '
      
        '   :BPOSTED, :WREPORTINGGROUP1ID, :WREPORTINGGROUP2ID, :WPAYMENT' +
        'GROUPID, '
      
        '   :BEXCLUSIVE, :WCURRENCYID, :FDOCAMOUNT, :FTAXAMOUNT, :BREPEAT' +
        'ING, :DSYSDATE, '
      
        '   :WSOURCETYPEID, :WPROFILEID, :WTERMS, :WJOBCODEID, :DDUEDATE,' +
        ' :WUSERID)')
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
    Left = 464
    Top = 608
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WDOCID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SDOCNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DALLOCATEDDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPAYMENTTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPOSTAL1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPOSTAL2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPOSTAL3ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPOSTALCODEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WMESSAGE1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WMESSAGE2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WMESSAGE3ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FINVOICEDISCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSALESMANID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SREFERENCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDELADDRESS1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDELADDRESS2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDELADDRESS3ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDELCODEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BPRINTED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BPOSTED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WREPORTINGGROUP1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WREPORTINGGROUP2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPAYMENTGROUPID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BEXCLUSIVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WCURRENCYID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FDOCAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FTAXAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BREPEATING'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSOURCETYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPROFILEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTERMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WJOBCODEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDUEDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WUSERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WDOCID'
        ParamType = ptUnknown
      end>
  end
  object ZUSQLTransAction: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM transact'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
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
      '   transact.WDOCID)'
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
        'P2ID, :WDOCID)')
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
      '  transact.WDOCID = :WDOCID'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    Left = 32
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WTRANSACTIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WBATCHID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WBATCHTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLINEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BCARRIEDFORWARD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BLASTYEAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BLINKSUSED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BMULTIPLEITEMS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPERIODID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WYEARID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SREFERENCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FTAXRATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTAXACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FTAXAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FOUTSTANDINGAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BRECONCILED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WBALANCINGACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDESCRIPTIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WCURRENCYID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FFOREXAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WUSERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UNUSED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BUNUSED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTAX2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FCURRENCYRATE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FTAXRATE2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FTAX2AMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WJOBCODEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPROFILEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BEXCLUSIVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLINKEDID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WREPORTINGGROUP1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WREPORTINGGROUP2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WDOCID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WTRANSACTIONID'
        ParamType = ptUnknown
      end>
  end
  object ZQTransAction: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLTransAction
    AfterInsert = ZQTransActionAfterInsert
    BeforePost = ZQTransActionBeforePost
    SQL.Strings = (
      'select * from transact')
    Params = <>
    Left = 64
    Top = 352
    object ZQTransActionWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQTransActionWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQTransActionWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQTransActionWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQTransActionBCARRIEDFORWARD: TSmallintField
      FieldName = 'BCARRIEDFORWARD'
    end
    object ZQTransActionBLASTYEAR: TSmallintField
      FieldName = 'BLASTYEAR'
    end
    object ZQTransActionBLINKSUSED: TSmallintField
      FieldName = 'BLINKSUSED'
    end
    object ZQTransActionBMULTIPLEITEMS: TSmallintField
      FieldName = 'BMULTIPLEITEMS'
    end
    object ZQTransActionWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTransActionDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQTransActionWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQTransActionSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQTransActionFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object ZQTransActionWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object ZQTransActionFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object ZQTransActionFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQTransActionFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object ZQTransActionBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object ZQTransActionWBALANCINGACCOUNTID: TIntegerField
      FieldName = 'WBALANCINGACCOUNTID'
    end
    object ZQTransActionWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object ZQTransActionWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQTransActionFFOREXAMOUNT: TFloatField
      FieldName = 'FFOREXAMOUNT'
    end
    object ZQTransActionWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQTransActionUNUSED: TIntegerField
      FieldName = 'UNUSED'
    end
    object ZQTransActionDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTransActionBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object ZQTransActionWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object ZQTransActionFCURRENCYRATE2: TFloatField
      FieldName = 'FCURRENCYRATE2'
    end
    object ZQTransActionFTAXRATE2: TFloatField
      FieldName = 'FTAXRATE2'
    end
    object ZQTransActionFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object ZQTransActionWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object ZQTransActionWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQTransActionBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQTransActionWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQTransActionWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQTransActionWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object ZQTransActionWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object ZQTransActionWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
  end
  object ZQOILinks: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLOIlinks
    SQL.Strings = (
      'select * from oilinks')
    Params = <>
    Sequence = ZSeqIOLinks
    SequenceField = 'WOILINKSID'
    Left = 48
    Top = 280
    object ZQOILinksWOILINKSID: TIntegerField
      FieldName = 'WOILINKSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
  object ZUSQLOIlinks: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM oilinks'
      'WHERE'
      '  oilinks.WOILINKSID = :OLD_WOILINKSID')
    InsertSQL.Strings = (
      'INSERT INTO oilinks'
      '  (oilinks.WOILINKSID, oilinks.DDOCDATE, oilinks.SREFERENCE, '
      'oilinks.SLINKEDREFERENCE, '
      '   oilinks.WFULLAMOUNT, oilinks.WOUTSTANDINGAMOUNT, '
      'oilinks.WLINKEDAMOUNT, '
      '   oilinks.DDATE, oilinks.UNUSED1, '
      'oilinks.WAMOUNTTRANSACTIONID, oilinks.WLINKTRANSACTIONID, '
      '   oilinks.WUSERID, oilinks.UNUSED2, oilinks.WBATCHID, '
      'oilinks.WACCOUNTID, '
      '   oilinks.WTAXID, oilinks.DSYSDATE)'
      'VALUES'
      '  (:WOILINKSID, :DDOCDATE, :SREFERENCE, :SLINKEDREFERENCE, '
      ':WFULLAMOUNT, '
      '   :WOUTSTANDINGAMOUNT, :WLINKEDAMOUNT, :DDATE, '
      ':UNUSED1, :WAMOUNTTRANSACTIONID, '
      '   :WLINKTRANSACTIONID, :WUSERID, :UNUSED2, :WBATCHID, '
      ':WACCOUNTID, :WTAXID, '
      '   :DSYSDATE)')
    ModifySQL.Strings = (
      'UPDATE oilinks SET'
      '  oilinks.WOILINKSID = :WOILINKSID,'
      '  oilinks.DDOCDATE = :DDOCDATE,'
      '  oilinks.SREFERENCE = :SREFERENCE,'
      '  oilinks.SLINKEDREFERENCE = :SLINKEDREFERENCE,'
      '  oilinks.WFULLAMOUNT = :WFULLAMOUNT,'
      '  oilinks.WOUTSTANDINGAMOUNT = :WOUTSTANDINGAMOUNT,'
      '  oilinks.WLINKEDAMOUNT = :WLINKEDAMOUNT,'
      '  oilinks.DDATE = :DDATE,'
      '  oilinks.UNUSED1 = :UNUSED1,'
      '  oilinks.WAMOUNTTRANSACTIONID = :WAMOUNTTRANSACTIONID,'
      '  oilinks.WLINKTRANSACTIONID = :WLINKTRANSACTIONID,'
      '  oilinks.WUSERID = :WUSERID,'
      '  oilinks.UNUSED2 = :UNUSED2,'
      '  oilinks.WBATCHID = :WBATCHID,'
      '  oilinks.WACCOUNTID = :WACCOUNTID,'
      '  oilinks.WTAXID = :WTAXID,'
      '  oilinks.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  oilinks.WOILINKSID = :OLD_WOILINKSID')
    Left = 88
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WOILINKSID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDOCDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SREFERENCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SLINKEDREFERENCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WFULLAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WOUTSTANDINGAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLINKEDAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UNUSED1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WAMOUNTTRANSACTIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WLINKTRANSACTIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WUSERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'UNUSED2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WBATCHID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTAXID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WOILINKSID'
        ParamType = ptUnknown
      end>
  end
  object ZSQLGenProccessor: TUniScript
    Params = <>
    Connection = ZMainconnection
    Delimiter = ';'
    OnError = ZSQLGenProccessorError
    Left = 424
    Top = 32
  end
  object qGenBatchId: TuniQuery
    Connection = ZMainconnection
    Params = <>
    Left = 776
    Top = 392
  end
  object ZSeqIOLinks: TZSequence
    Connection = ZMainconnection
    SequenceName = 'GEN_OILINKS_ID'
    Left = 16
    Top = 256
  end
  object QryTAccountDr: TuniQuery
    Connection = ZMainconnection
    OnCalcFields = QryTAccountCrCalcFields
    SQL.Strings = (
      'Select DDate,SReference, FAmount ,WAccountID,'
      'BReconciled, FOutStandingAmount, WtransactionID,WDescriptionID'
      'From Transact'
      'Where DDate>=:DtStart And DDate<=:DtEnd')
    Params = <
      item
        DataType = ftDate
        Name = 'DtStart'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'DtEnd'
        ParamType = ptUnknown
        Value = 0d
      end>
    Left = 492
    Top = 382
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtStart'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'DtEnd'
        ParamType = ptUnknown
        Value = 0d
      end>
    object QryTAccountDrDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object QryTAccountDrSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QryTAccountDrFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object QryTAccountDrWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QryTAccountDrBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object QryTAccountDrFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object QryTAccountDrWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object QryTAccountDrWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
  end
  object QryTAccountCr: TuniQuery
    Connection = ZMainconnection
    OnCalcFields = QryTAccountCrCalcFields
    SQL.Strings = (
      'Select DDate,SReference, FAmount ,WAccountID,'
      'BReconciled, FOutStandingAmount, WtransactionID,WDescriptionID'
      'From Transact'
      'Where DDate>=:DtStart And DDate<=:DtEnd')
    Params = <
      item
        DataType = ftDate
        Name = 'DtStart'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'DtEnd'
        ParamType = ptUnknown
        Value = 0d
      end>
    Left = 492
    Top = 434
    ParamData = <
      item
        DataType = ftDate
        Name = 'DtStart'
        ParamType = ptUnknown
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'DtEnd'
        ParamType = ptUnknown
        Value = 0d
      end>
    object QryTAccountCrDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object QryTAccountCrSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QryTAccountCrFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object QryTAccountCrWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QryTAccountCrBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object QryTAccountCrFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object QryTAccountCrWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object QryTAccountCrWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
  end
  object ZUQTotals: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM totals'
      'WHERE'
      '  totals.WACCOUNTID = :OLD_WACCOUNTID AND'
      '  totals.WPERIODID = :OLD_WPERIODID AND'
      '  totals.WYEARID = :OLD_WYEARID AND'
      '  totals.BACTUAL = :OLD_BACTUAL')
    InsertSQL.Strings = (
      'INSERT INTO totals'
      
        '  (totals.WACCOUNTID, totals.WPERIODID, totals.WYEARID, totals.B' +
        'ACTUAL, '
      '   totals.FAMOUNT, totals.DSYSDATE)'
      'VALUES'
      
        '  (:WACCOUNTID, :WPERIODID, :WYEARID, :BACTUAL, :FAMOUNT, :DSYSD' +
        'ATE)')
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
    Left = 576
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPERIODID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WYEARID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BACTUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FAMOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WACCOUNTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WPERIODID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WYEARID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_BACTUAL'
        ParamType = ptUnknown
      end>
  end
  object ZQTotals: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUQTotals
    SQL.Strings = (
      'Select * from totals')
    Params = <>
    Left = 584
    Top = 184
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
  object ZQGroups: TuniQuery
    Connection = ZMainconnection
    UpdateObject = ZUSQLGroups
    SQL.Strings = (
      'select * from groups')
    Params = <>
    Left = 536
    Top = 16
    object ZQGroupsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQGroupsWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object ZQGroupsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object ZQGroupsWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object ZQGroupsWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object ZQGroupsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQGroupsWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
  end
  object ZUSQLGroups: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM groups'
      'WHERE'
      '  groups.WGROUPID = :OLD_WGROUPID')
    InsertSQL.Strings = (
      'INSERT INTO groups'
      
        '  (groups.WGROUPID, groups.WGROUPTYPEID, groups.SDESCRIPTION, gr' +
        'oups.WPARENTGROUP2ID, '
      '   groups.WPARENTGROUP1ID, groups.DSYSDATE, groups.WSORTNO)'
      'VALUES'
      
        '  (:WGROUPID, :WGROUPTYPEID, :SDESCRIPTION, :WPARENTGROUP2ID, :W' +
        'PARENTGROUP1ID, '
      '   :DSYSDATE, :WSORTNO)')
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
    Left = 536
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WGROUPID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WGROUPTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SDESCRIPTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPARENTGROUP2ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPARENTGROUP1ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSORTNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WGROUPID'
        ParamType = ptUnknown
      end>
  end
  object ZUSQLOpReport: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM OpReport'
      'WHERE'
      '  OpReport.WOPTIONID = :OLD_WOPTIONID')
    InsertSQL.Strings = (
      'INSERT INTO OpReport'
      
        '  (OpReport.WOPTIONID, OpReport.STROPTION, OpReport.SOPTIONVALUE' +
        ', OpReport.WOPTIONTYPEID)'
      'VALUES'
      '  (:WOPTIONID, :STROPTION, :SOPTIONVALUE, :WOPTIONTYPEID)')
    ModifySQL.Strings = (
      'UPDATE OpReport SET'
      '  OpReport.WOPTIONID = :WOPTIONID,'
      '  OpReport.STROPTION = :STROPTION,'
      '  OpReport.SOPTIONVALUE = :SOPTIONVALUE,'
      '  OpReport.WOPTIONTYPEID = :WOPTIONTYPEID'
      'WHERE'
      '  OpReport.WOPTIONID = :OLD_WOPTIONID')
    Left = 280
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WOPTIONID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STROPTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOPTIONVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WOPTIONTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WOPTIONID'
        ParamType = ptUnknown
      end>
  end
  object ZUSQLSysparams: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM SysParams'
      'WHERE'
      '  SysParams.WPARAMID = :OLD_WPARAMID')
    InsertSQL.Strings = (
      'INSERT INTO SysParams'
      
        '  (SysParams.WPARAMID, SysParams.WUSERID, SysParams.SPARAMNAME, ' +
        'SysParams.SPARAMVALUE, '
      
        '   SysParams.WTYPEID, SysParams.WSOURCEID, SysParams.WSOURCETYPE' +
        'ID, SysParams.DSYSDATE, '
      
        '   SysParams.WPARENTID, SysParams.WPARENTTYPEID, SysParams.BACTI' +
        'VE)'
      'VALUES'
      
        '  (:WPARAMID, :WUSERID, :SPARAMNAME, :SPARAMVALUE, :WTYPEID, :WS' +
        'OURCEID, '
      
        '   :WSOURCETYPEID, :DSYSDATE, :WPARENTID, :WPARENTTYPEID, :BACTI' +
        'VE)')
    ModifySQL.Strings = (
      'UPDATE SysParams SET'
      '  SysParams.WPARAMID = :WPARAMID,'
      '  SysParams.WUSERID = :WUSERID,'
      '  SysParams.SPARAMNAME = :SPARAMNAME,'
      '  SysParams.SPARAMVALUE = :SPARAMVALUE,'
      '  SysParams.WTYPEID = :WTYPEID,'
      '  SysParams.WSOURCEID = :WSOURCEID,'
      '  SysParams.WSOURCETYPEID = :WSOURCETYPEID,'
      '  SysParams.DSYSDATE = :DSYSDATE,'
      '  SysParams.WPARENTID = :WPARENTID,'
      '  SysParams.WPARENTTYPEID = :WPARENTTYPEID,'
      '  SysParams.BACTIVE = :BACTIVE'
      'WHERE'
      '  SysParams.WPARAMID = :OLD_WPARAMID')
    Left = 304
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WPARAMID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WUSERID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SPARAMNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SPARAMVALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSOURCEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WSOURCETYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DSYSDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPARENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WPARENTTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BACTIVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WPARAMID'
        ParamType = ptUnknown
      end>
  end
  object ZUSQLTypes: TUniUpdateSql
    DeleteSQL.Strings = (
      'DELETE FROM TYPES'
      'WHERE'
      '  TYPES.WTYPEID = :OLD_WTYPEID')
    InsertSQL.Strings = (
      'INSERT INTO TYPES'
      '  (TYPES.WTYPEID, TYPES.SDESCRIPTION, TYPES.WTYPEPARENT)'
      'VALUES'
      '  (:WTYPEID, :SDESCRIPTION, :WTYPEPARENT)')
    ModifySQL.Strings = (
      'UPDATE TYPES SET'
      '  TYPES.WTYPEID = :WTYPEID,'
      '  TYPES.SDESCRIPTION = :SDESCRIPTION,'
      '  TYPES.WTYPEPARENT = :WTYPEPARENT'
      'WHERE'
      '  TYPES.WTYPEID = :OLD_WTYPEID')
    Left = 456
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WTYPEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SDESCRIPTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WTYPEPARENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_WTYPEID'
        ParamType = ptUnknown
      end>
  end
end
