object AccountTreeView2: TAccountTreeView2
  Left = 121
  Top = 231
  Width = 741
  Height = 511
  Caption = 'T Ledger viewer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TVMain: TTreeView
    Left = 0
    Top = 273
    Width = 733
    Height = 163
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Console'
    Font.Style = []
    HideSelection = False
    Images = DMTCCoreLink.ImageList1
    Indent = 19
    MultiSelect = True
    MultiSelectStyle = [msControlSelect, msShiftSelect]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    OnCustomDrawItem = TVMainCustomDrawItem
    OnDblClick = TVMainDblClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 436
    Width = 733
    Height = 41
    Align = alBottom
    TabOrder = 0
    object LProffitloss: TLabel
      Left = 600
      Top = 8
      Width = 51
      Height = 13
      Caption = 'LProffitloss'
    end
    object LLProffitloss: TLabel
      Left = 514
      Top = 8
      Width = 74
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Total proffit loss'
      ParentBiDiMode = False
    end
    object LlTotbal: TLabel
      Left = 530
      Top = 24
      Width = 58
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Total balans'
      ParentBiDiMode = False
    end
    object LTotalBalans: TLabel
      Left = 600
      Top = 24
      Width = 51
      Height = 13
      Caption = 'LProffitloss'
    end
    object ControlBar1: TControlBar
      Left = 1
      Top = 1
      Width = 464
      Height = 39
      Align = alLeft
      TabOrder = 0
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 733
    Height = 273
    Align = alTop
    TabOrder = 2
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 653
      Height = 269
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LGroup: TLabel
        Left = 221
        Top = 12
        Width = 49
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Use group'
        ParentBiDiMode = False
      end
      object LReportType: TLabel
        Left = 416
        Top = 12
        Width = 55
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Report type'
        ParentBiDiMode = False
      end
      object Label3: TLabel
        Left = 24
        Top = 12
        Width = 66
        Height = 13
        Caption = 'Vanaf periode'
      end
      object Label5: TLabel
        Left = 151
        Top = 140
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Costgroup 1'
      end
      object BCreate: TButton
        Left = 416
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Create'
        TabOrder = 5
        OnClick = BCreateClick
      end
      object dbcboxIncOpeningBalance: TCheckBox
        Left = 221
        Top = 97
        Width = 161
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Include Opening balans'
        TabOrder = 2
        OnClick = dbcboxIncOpeningBalanceClick
      end
      object BExport: TButton
        Left = 508
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Export'
        TabOrder = 6
        OnClick = BExportClick
      end
      object CBBuget: TCheckBox
        Left = 416
        Top = 67
        Width = 158
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Buget'
        TabOrder = 4
        OnClick = CBBugetClick
      end
      object CBType: TComboBox
        Left = 416
        Top = 29
        Width = 161
        Height = 21
        Style = csDropDownList
        DropDownCount = 9
        ItemHeight = 13
        TabOrder = 3
        OnChange = CBTypeChange
        Items.Strings = (
          'Trail balance'
          'Proffit Loss'
          'Balans'
          'Column balans'
          'Column balans debtor'
          'Column balans creditor'
          'Column balans D/C'
          'Column balans debtor D/C'
          'Column balans creditor D/C')
      end
      object CBHideNilBal: TCheckBox
        Left = 227
        Top = 56
        Width = 156
        Height = 17
        Alignment = taLeftJustify
        BiDiMode = bdRightToLeft
        Caption = 'Hide nil balance'
        ParentBiDiMode = False
        TabOrder = 0
        OnClick = CBHideNilBalClick
      end
      object CBGroup: TComboBox
        Left = 221
        Top = 30
        Width = 163
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBGroupChange
        Items.Strings = (
          'Group1'
          'Group2'
          'No group')
      end
      object cbIncDebtorsCreditors: TCheckBox
        Left = 228
        Top = 75
        Width = 155
        Height = 15
        Alignment = taLeftJustify
        Caption = 'Inc debtors creditors'
        TabOrder = 7
        OnClick = CBHideNilBalClick
      end
      object dbcboxOnlyOpeningBalance: TCheckBox
        Left = 221
        Top = 113
        Width = 161
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Only Opening balans'
        TabOrder = 8
        OnClick = dbcboxOnlyOpeningBalanceClick
      end
      object CBFromPeriode: TComboBox
        Left = 24
        Top = 32
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 9
      end
      object rgPEriode: TRadioGroup
        Left = 20
        Top = 60
        Width = 185
        Height = 69
        Caption = 'Periode'
        Items.Strings = (
          'Jaar'
          'Maand'
          'Kwartaal')
        TabOrder = 10
        OnClick = rgPEriodeClick
      end
      object cbCostGroup1: TComboBox
        Left = 220
        Top = 136
        Width = 165
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 11
      end
    end
  end
  object ZQTotalsAccounts: TuniQuery
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    BeforeOpen = ZQTotalsAccountsBeforeOpen
    SQL.Strings = (
      'select  '
      'Account.SAccountCode,'
      'Account.SDescription,'
      'Account.WAccountid,'
      'Account.WAccountTypeId,'
      'Account.WREPORTINGGROUP1ID,'
      'Account.WREPORTINGGROUP2ID, '
      'Account.BSUBACCOUNTS, '
      'Account.BINCOMEEXPENSE, '
      'Account.BOPENITEM, '
      'Account.BINACTIVE, '
      'Account.DSYSDATE,'
      'Account.WLINKACCOUNT '
      '  from account  ')
    Params = <>
    Left = 216
    Top = 220
    object ZQTotalsAccountsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQTotalsAccountsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQTotalsAccountsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTotalsAccountsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQTotalsAccountsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQTotalsAccountsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQTotalsAccountsBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQTotalsAccountsBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQTotalsAccountsBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQTotalsAccountsBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQTotalsAccountsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTotalsAccountsWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQTotalsAccounts
    Left = 184
    Top = 208
  end
  object ZQDebtors: TuniQuery
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    BeforeOpen = ZQTotalsAccountsBeforeOpen
    SQL.Strings = (
      'select  '
      'Account.SAccountCode,'
      'Account.SDescription,'
      'Account.WAccountid,'
      'Account.WAccountTypeId,'
      'Account.WREPORTINGGROUP1ID,'
      'Account.WREPORTINGGROUP2ID, '
      'Account.BSUBACCOUNTS, '
      'Account.BINCOMEEXPENSE, '
      'Account.BOPENITEM, '
      'Account.BINACTIVE, '
      'Account.DSYSDATE,'
      'Sum(Totals.FAmount) Totaal'
      
        '  from account join Totals on (account.Waccountid = totals.Wacco' +
        'untid) where (WPeriodId > 13 or WperiodId = 0)  and BActual = 1'
      'and Account.WAccountTypeID = 1'
      'group by Account.SAccountCode,'
      'Account.SDescription,'
      'Account.WAccountid,'
      'Account.WAccountTypeId,'
      'Account.WREPORTINGGROUP1ID,'
      'Account.WREPORTINGGROUP2ID, '
      'Account.BSUBACCOUNTS, '
      'Account.BINCOMEEXPENSE, '
      'Account.BOPENITEM, '
      'Account.BINACTIVE, '
      'Account.DSYSDATE'
      '')
    Params = <>
    Left = 276
    Top = 232
    object ZQDebtorsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQDebtorsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQDebtorsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQDebtorsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQDebtorsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQDebtorsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQDebtorsBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQDebtorsBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQDebtorsBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQDebtorsBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQDebtorsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQDebtorsTOTAAL: TFloatField
      FieldName = 'TOTAAL'
      ReadOnly = True
    end
  end
  object ZQCreditors: TuniQuery
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    BeforeOpen = ZQTotalsAccountsBeforeOpen
    SQL.Strings = (
      'select  '
      'Account.SAccountCode,'
      'Account.SDescription,'
      'Account.WAccountid,'
      'Account.WAccountTypeId,'
      'Account.WREPORTINGGROUP1ID,'
      'Account.WREPORTINGGROUP2ID, '
      'Account.BSUBACCOUNTS, '
      'Account.BINCOMEEXPENSE, '
      'Account.BOPENITEM, '
      'Account.BINACTIVE, '
      'Account.DSYSDATE,'
      'Sum(Totals.FAmount) Totaal'
      
        '  from account join Totals on (account.Waccountid = totals.Wacco' +
        'untid) where (WPeriodId > 13 or WperiodId = 0)  and BActual = 1'
      'and Account.WAccountTypeID  = 2'
      'group by Account.SAccountCode,'
      'Account.SDescription,'
      'Account.WAccountid,'
      'Account.WAccountTypeId,'
      'Account.WREPORTINGGROUP1ID,'
      'Account.WREPORTINGGROUP2ID, '
      'Account.BSUBACCOUNTS, '
      'Account.BINCOMEEXPENSE, '
      'Account.BOPENITEM, '
      'Account.BINACTIVE, '
      'Account.DSYSDATE'
      '')
    Params = <>
    Left = 304
    Top = 284
    object ZQCreditorsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQCreditorsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQCreditorsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQCreditorsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQCreditorsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQCreditorsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQCreditorsBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQCreditorsBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQCreditorsBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQCreditorsBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQCreditorsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQCreditorsTOTAAL: TFloatField
      FieldName = 'TOTAAL'
      ReadOnly = True
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'Export.txt'
    Filter = 'Text files|*.txt|CSV files|*.csv|All files|*.*'
    Left = 36
    Top = 217
  end
  object PopupMenu1: TPopupMenu
    Left = 376
    Top = 296
    object Showdetails1: TMenuItem
      Caption = 'Show details'
      OnClick = TVMainDblClick
    end
  end
  object ZQGetPeriods: TuniQuery
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from periods where Wyearid in (1,2)'
      'order by WPeriodid')
    Params = <>
    Left = 452
    Top = 312
    object ZQGetPeriodsDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
      Required = True
    end
    object ZQGetPeriodsDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
      Required = True
    end
    object ZQGetPeriodsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 12
    end
    object ZQGetPeriodsWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
  end
  object ZQTotalsList: TuniQuery
    SQL.Strings = (
      
        'Select FAmount,WAccountid,WPeriodID from Totals where BActual = ' +
        '1')
    Params = <>
    Left = 264
    Top = 348
  end
  object TSetToLastColumn: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TSetToLastColumnTimer
    Left = 144
    Top = 272
  end
  object ZQGen: TuniQuery
    Params = <>
    Left = 12
    Top = 164
  end
  object ZQTrnBalance: TuniQuery
    SQL.Strings = (
      
        'Select FAmount,WAccountid,WPeriodID from Totals where BActual = ' +
        '1')
    Params = <>
    Left = 120
    Top = 356
  end
  object sqlWithopeningbal: TSQLHOLDER
    SQL.Strings = (
      'SELECT account.WAccountId,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId )'
      'WHERE  account.WAccountTypeID  not in(1,2)'
      ''
      '   AND  transact.ddate <= :todate1 <@SQL@>'
      'and (BLASTYEAR is null or BLASTYEAR = 0  or ddate <:itodate1)'
      'and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0  )'
      'and  account.Waccountid <> <@PROFLOSS@>'
      'GROUP BY account.WAccountId'
      'union'
      'SELECT account.WAccountId, '
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  not in(1,2)'
      ''
      '   AND  transact.ddate <= :todate2 '
      '   and  transact.ddate >= :fromdate1'
      ' <@SQL@>'
      ' and (BLASTYEAR is null or BLASTYEAR = 0  or ddate <:itodate2)'
      'and  BINCOMEEXPENSE = 1'
      'and  account.Waccountid <> <@PROFLOSS@>'
      'GROUP BY account.WAccountId'
      'union'
      ''
      'SELECT <@DEB@>,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId )'
      'WHERE  account.WAccountTypeID  = 1'
      ''
      ' AND  transact.ddate <= :todate3 <@SQL@>'
      ''
      'and (BLASTYEAR is null or BLASTYEAR = 0 or ddate <:itodate3)'
      ' union'
      ''
      'SELECT <@CRED@>,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  = 2 <@SQL@>'
      ''
      ' AND  transact.ddate <= :todate4'
      'and (BLASTYEAR is null or BLASTYEAR = 0 or ddate <:itodate4)'
      ' union'
      'SELECT <@PROFLOSS@>,'
      'SUM( -transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  transact.ddate <= :todate5 <@SQL@>'
      'and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0 )'
      'and (BLASTYEAR is null or BLASTYEAR = 0 or ddate <:itodate5)'
      ' and account.WAccountId <> <@PROFLOSS@>')
    Left = 452
    Top = 188
  end
  object sqlBetween: TSQLHOLDER
    SQL.Strings = (
      'SELECT account.WAccountId, '
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  not in(1,2)'
      ''
      '      AND  transact.ddate <= :todate1 '
      '   and  transact.ddate >= :fromdate1'
      ' <@SQL@>'
      'and (BLASTYEAR is null or BLASTYEAR = 0  )'
      'and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0  )'
      'GROUP BY account.WAccountId'
      'union'
      'SELECT account.WAccountId, '
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  not in(1,2)'
      ''
      '   AND  transact.ddate <= :todate2 '
      '   and  transact.ddate >= :fromdate2'
      ' <@SQL@>'
      ' and (BLASTYEAR is null or BLASTYEAR = 0  )'
      'and ( BINCOMEEXPENSE = 1  )'
      'GROUP BY account.WAccountId'
      'union'
      ''
      'SELECT 2,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  = 1'
      ''
      '   AND  transact.ddate <= :todate3 '
      '   and  transact.ddate >= :fromdate3 <@SQL@>'
      ''
      'and (BLASTYEAR is null or BLASTYEAR = 0)'
      ' union'
      ''
      'SELECT 1,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  = 2 '
      ''
      '   AND  transact.ddate <= :todate4 '
      '   and  transact.ddate >= :fromdate4 <@SQL@>'
      'and (BLASTYEAR is null or BLASTYEAR = 0)'
      ' union'
      'SELECT 3,'
      'SUM( -transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE    transact.ddate <= :todate5 '
      '   and  transact.ddate >= :fromdate5 <@SQL@>'
      ' and account.WAccountId <> 3')
    Left = 452
    Top = 236
  end
  object sqlDebCredWithopen: TSQLHOLDER
    SQL.Strings = (
      'SELECT account.Waccountid,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  = 1'
      '      AND  transact.ddate <= :todate1'
      'group by account.Waccountid'
      'having SUM( transact.FAmount ) <> 0'
      ' union'
      'SELECT account.Waccountid,'
      'SUM( transact.FAmount ) totall'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId) '
      'WHERE  account.WAccountTypeID  = 2'
      ''
      '      AND  transact.ddate <= :todate2'
      'group by account.Waccountid'
      'having SUM( transact.FAmount ) <> 0')
    Left = 588
    Top = 172
  end
  object sqldebcredPeriod: TSQLHOLDER
    SQL.Strings = (
      'SELECT account.Waccountid,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  = 1'
      '      AND  transact.ddate <= :todate1'
      '      AND  transact.ddate >= :fromdate1'
      ''
      'group by account.Waccountid'
      'having SUM( transact.FAmount ) <> 0'
      ' union'
      'SELECT account.Waccountid,'
      'SUM( transact.FAmount ) totall'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId) '
      'WHERE  account.WAccountTypeID  = 2'
      ''
      '      AND  transact.ddate <= :todate2'
      'AND  transact.ddate >= :fromdate2'
      'group by account.Waccountid'
      'having SUM( transact.FAmount ) <> 0')
    Left = 612
    Top = 228
  end
  object ZQTrnDebCred: TuniQuery
    SQL.Strings = (
      
        'Select FAmount,WAccountid,WPeriodID from Totals where BActual = ' +
        '1')
    Params = <>
    Left = 196
    Top = 356
  end
end
