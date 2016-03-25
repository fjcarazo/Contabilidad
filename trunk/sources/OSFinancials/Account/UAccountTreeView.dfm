object AccountTreeView: TAccountTreeView
  Left = 186
  Top = 97
  BorderStyle = bsNone
  Caption = 'T Ledger viewer'
  ClientHeight = 688
  ClientWidth = 983
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
  object TVMain: TcxTreeView
    Left = 0
    Top = 165
    Width = 983
    Height = 482
    Align = alClient
    ParentFont = False
    PopupMenu = PopupMenu1
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Lucida Console'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    OnDblClick = TVMainDblClick
    AutoExpand = True
    Images = dmOsfResource.EnabledButtonImageList
    Indent = 51
    MultiSelectStyle = [msControlSelect, msShiftSelect]
    ReadOnly = True
    RowSelect = True
    OnCustomDrawItem = TVMainCustomDrawItem
  end
  object Panel2: TPanel
    Left = 0
    Top = 647
    Width = 983
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
      Width = 496
      Height = 39
      Align = alLeft
      TabOrder = 0
      object LText: TLabel
        Left = 330
        Top = 2
        Width = 3
        Height = 22
        Visible = False
      end
      object pbExp: TProgressBar
        Left = 11
        Top = 2
        Width = 218
        Height = 22
        Smooth = True
        TabOrder = 0
        Visible = False
      end
      object BStop: TBitBtn
        Left = 242
        Top = 2
        Width = 75
        Height = 22
        Caption = 'Stop'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 1
        Visible = False
        OnClick = BStopClick
      end
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 983
    Height = 165
    Align = alTop
    TabOrder = 2
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 809
      Height = 161
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = -1
      ExplicitTop = -4
      object LGroup: TLabel
        Left = 369
        Top = 12
        Width = 49
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Use group'
        ParentBiDiMode = False
      end
      object LReportType: TLabel
        Left = 542
        Top = 12
        Width = 55
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Report type'
        ParentBiDiMode = False
      end
      object Label5: TLabel
        Left = 542
        Top = 68
        Width = 57
        Height = 13
        Caption = 'Costgroup 1'
      end
      object Label1: TLabel
        Left = 542
        Top = 108
        Width = 57
        Height = 13
        Caption = 'Costgroup 1'
      end
      object BCreate: TBitBtn
        Left = 4
        Top = 25
        Width = 104
        Height = 25
        Caption = 'Create'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = BCreateClick
      end
      object dbcboxIncOpeningBalance: TCheckBox
        Left = 368
        Top = 88
        Width = 161
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Include Opening balans'
        TabOrder = 2
        OnClick = dbcboxIncOpeningBalanceClick
      end
      object BExport: TBitBtn
        Left = 4
        Top = 56
        Width = 104
        Height = 25
        Caption = 'Export'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = BExportClick
      end
      object CBBuget: TCheckBox
        Left = 542
        Top = 49
        Width = 166
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Buget'
        TabOrder = 4
        OnClick = CBBugetClick
      end
      object CBType: TComboBox
        Left = 542
        Top = 25
        Width = 165
        Height = 21
        Style = csDropDownList
        DropDownCount = 12
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
          'Column balans creditor D/C'
          'Std Column'
          'Budget vs actual'
          'This period vs lastyear period')
      end
      object CBHideNilBal: TCheckBox
        Left = 368
        Top = 49
        Width = 161
        Height = 17
        Alignment = taLeftJustify
        BiDiMode = bdLeftToRight
        Caption = 'Hide nil balance'
        ParentBiDiMode = False
        TabOrder = 0
        OnClick = CBHideNilBalClick
      end
      object CBGroup: TComboBox
        Left = 369
        Top = 26
        Width = 163
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = CBGroupChange
        Items.Strings = (
          'Group1'
          'Group2'
          'No group')
      end
      object cbIncDebtorsCreditors: TCheckBox
        Left = 368
        Top = 68
        Width = 161
        Height = 15
        Alignment = taLeftJustify
        Caption = 'Inc debtors creditors'
        TabOrder = 7
        OnClick = CBHideNilBalClick
      end
      object dbcboxOnlyOpeningBalance: TCheckBox
        Left = 368
        Top = 108
        Width = 161
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Only Opening balans'
        TabOrder = 8
        OnClick = dbcboxOnlyOpeningBalanceClick
      end
      object cbCostGroup1: TComboBox
        Left = 542
        Top = 84
        Width = 165
        Height = 21
        Style = csDropDownList
        TabOrder = 9
      end
      object BPrint: TBitBtn
        Left = 4
        Top = 90
        Width = 104
        Height = 25
        Caption = 'Print'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 10
        OnClick = BPrintClick
      end
      object cbcostgroup2: TComboBox
        Left = 542
        Top = 124
        Width = 165
        Height = 21
        Style = csDropDownList
        TabOrder = 11
      end
    end
  end
  object ZQTotalsAccounts: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'select  '
      'SAccountCode,'
      'SDescription,'
      'WAccountid,'
      'WAccountTypeId,'
      'WREPORTINGGROUP1ID,'
      'WREPORTINGGROUP2ID, '
      'BSUBACCOUNTS, '
      'BINCOMEEXPENSE, '
      'BOPENITEM, '
      'BINACTIVE, '
      'DSYSDATE,'
      'WLINKACCOUNT '
      '  from account  ')
    BeforeOpen = ZQTotalsAccountsBeforeOpen
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
    Left = 172
    Top = 204
  end
  object ZQDebtors: TUniQuery
    DataTypeMap = <>
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
      'Account.DSYSDATE'
      '  from account where Account.WAccountTypeID = 1')
    BeforeOpen = ZQTotalsAccountsBeforeOpen
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
  end
  object ZQCreditors: TUniQuery
    DataTypeMap = <>
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
      'Account.DSYSDATE '
      '  from account where Account.WAccountTypeID  = 2')
    BeforeOpen = ZQTotalsAccountsBeforeOpen
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
      OnClick = TMymainclick
    end
  end
  object ZQGetPeriods: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from periods where Wyearid in (1,2)'
      'order by WPeriodid')
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
  object ZQTotalsList: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select FAmount,WAccountid,WPeriodID from Totals where BActual = ' +
        '1')
    Left = 272
    Top = 352
  end
  object TSetToLastColumn: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TSetToLastColumnTimer
    Left = 144
    Top = 272
  end
  object ZQGen: TUniQuery
    DataTypeMap = <>
    Left = 12
    Top = 164
  end
  object ZQTrnBalance: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select FAmount,WAccountid,WPeriodID from Totals where BActual = ' +
        '1')
    Left = 116
    Top = 384
  end
  object sqlWithopeningbal: TSQLHOLDER
    SQL.Strings = (
      'SELECT account.WAccountId,'
      'SUM( transact.FAmount ) total'
      'FROM  account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId )'
      'WHERE  account.WAccountTypeID  not in(1,2)'
      ''
      '   AND  cast(transact.ddate as date) <= :todate1  <@SQL@>'
      
        'and (BLASTYEAR is null or BLASTYEAR = 0  or transact.ddate  <:it' +
        'odate1)'
      'and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0  )'
      
        'and (account.WAccountId <> <@PROFLOSS@> or  cast(transact.ddate ' +
        'as date) >= :ifromdate)'
      'GROUP BY account.WAccountId'
      'union'
      'SELECT account.WAccountId,'
      'SUM( transact.FAmount ) total'
      'FROM  account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  not in(1,2)'
      ''
      '   AND  cast(transact.ddate as date) <= :todate2 '
      '   and  cast(transact.ddate as date) >= :fromdate1'
      ' <@SQL@>'
      
        ' and (BLASTYEAR is null or BLASTYEAR = 0  or transact.ddate <:it' +
        'odate2)'
      'and  BINCOMEEXPENSE = 1'
      'and  account.Waccountid <> <@PROFLOSS@>'
      'GROUP BY account.WAccountId'
      'union'
      ''
      'SELECT <@DEB@>,'
      'SUM( transact.FAmount ) total'
      'FROM   account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId )'
      
        'WHERE  (account.WAccountTypeID  = 1 or account.WAccountid = <@DE' +
        'B@>)'
      ''
      ' AND  cast(transact.ddate as date) <= :todate3 <@SQL@>'
      ''
      
        'and (BLASTYEAR is null or BLASTYEAR = 0 or  transact.ddate  <:it' +
        'odate3)'
      ' union'
      ''
      'SELECT <@CRED@>,'
      'SUM( transact.FAmount ) total'
      'FROM   account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      
        'WHERE ( account.WAccountTypeID  = 2 or account.WAccountid = <@CR' +
        'ED@>)'
      '<@SQL@>'
      ''
      ' AND  cast(transact.ddate as date) <= :todate4'
      
        'and (BLASTYEAR is null or BLASTYEAR = 0 or transact.ddate <:itod' +
        'ate4)'
      ' union'
      ''
      ''
      ''
      ''
      'SELECT <@PROFLOSS@>,'
      
        'SUM( case when account.WAccountId = <@PROFLOSS@> then transact.F' +
        'Amount else -transact.FAmount end   ) total'
      'FROM   account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE ( cast(transact.ddate as date) <= :todate5 <@SQL@>'
      'and (account.BINCOMEEXPENSE is null or BINCOMEEXPENSE = 0 )'
      
        'and (BLASTYEAR is null or BLASTYEAR = 0 or transact.ddate  <:ito' +
        'date5) and account.WAccountId <>  <@PROFLOSS@>)'
      
        'or (transact.ddate  > :todate5 and  transact.ddate  <= :todate4 ' +
        ' and account.WAccountId =  <@PROFLOSS@> and  (BLASTYEAR is null ' +
        'or BLASTYEAR = 0))'
      ''
      '')
    Left = 452
    Top = 188
  end
  object sqlBetween: TSQLHOLDER
    SQL.Strings = (
      'SELECT account.WAccountId, '
      'SUM( transact.FAmount ) total'
      'FROM   account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  not in(1,2)'
      ''
      
        '      AND transact.ddate between :fromdate1 and dateAdd(-1 milli' +
        'second to cast(:todate1 as timestamp)  + 1  )'
      ''
      ''
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
      
        '      AND transact.ddate between :fromdate2 and dateAdd(-1 milli' +
        'second to cast(:todate2 as timestamp)  + 1  )'
      ' <@SQL@>'
      ' and (BLASTYEAR is null or BLASTYEAR = 0  )'
      'and ( BINCOMEEXPENSE = 1  )'
      'GROUP BY account.WAccountId'
      'union'
      ''
      'SELECT <@DEB@>,'
      'SUM( transact.FAmount ) total'
      'FROM   account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      
        'WHERE ( account.WAccountTypeID  = 1 or account.WAccountid = <@DE' +
        'B@>)  '
      
        '      AND transact.ddate between :fromdate3 and dateAdd(-1 milli' +
        'second to cast(:todate3 as timestamp)+1  )'
      ' <@SQL@>'
      ''
      'and (BLASTYEAR is null or BLASTYEAR = 0)'
      ' union'
      ''
      'SELECT <@CRED@>,'
      'SUM( transact.FAmount ) total'
      'FROM   account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      
        '  WHERE ( account.WAccountTypeID  = 2 or account.WAccountid = <@' +
        'CRED@>)'
      
        '      AND transact.ddate between :fromdate4 and dateAdd(-1 milli' +
        'second to cast(:todate4 as timestamp)  + 1  )'
      ' <@SQL@>'
      'and (BLASTYEAR is null or BLASTYEAR = 0)')
    Left = 456
    Top = 252
  end
  object sqlDebCredWithopen: TSQLHOLDER
    SQL.Strings = (
      'SELECT account.Waccountid,'
      'SUM( transact.FAmount ) total'
      'FROM account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId ) '
      'WHERE  account.WAccountTypeID  = 1'
      '      AND  cast(transact.ddate as date) <= :todate1 <@SQL@>'
      
        ' and (BLASTYEAR is null or BLASTYEAR = 0  or transact.ddate <:it' +
        'odate1)'
      ''
      'group by account.Waccountid'
      'having SUM( transact.FAmount ) <> 0'
      ' union'
      'SELECT account.Waccountid,'
      'SUM( transact.FAmount ) totall'
      'FROM  account'
      ' JOIN transact'
      '   ON  (account.WAccountId = transact.WAccountId) '
      'WHERE  account.WAccountTypeID  = 2'
      ''
      '      AND cast(transact.ddate as date) <= :todate2 <@SQL@>'
      
        'and (BLASTYEAR is null or BLASTYEAR = 0  or transact.ddate  <:it' +
        'odate2) '
      'group by account.Waccountid'
      'having SUM( transact.FAmount ) <> 0'
      '')
    Left = 592
    Top = 172
  end
  object sqldebcredPeriod: TSQLHOLDER
    SQL.Strings = (
      
        'SELECT account.Waccountid, SUM( transact.FAmount ) total FROM ac' +
        'count  JOIN transact    ON  (account.WAccountId = transact.WAcco' +
        'untId ) '
      
        'WHERE  account.WAccountTypeID  = 1       AND cast(transact.ddate' +
        ' as date) <= :todate1      AND  cast(transact.ddate as date) >= ' +
        ':fromdate1 <@SQL@>  and (BLASTYEAR is null or BLASTYEAR = 0  ) g' +
        'roup by account.Waccountid  having SUM( transact.FAmount ) <> 0 ' +
        ' union'
      
        'SELECT account.Waccountid, SUM( transact.FAmount ) total FROM ac' +
        'count  JOIN transact  ON  (account.WAccountId = transact.WAccoun' +
        'tId) '
      'WHERE  account.WAccountTypeID  = 2   AND '
      
        'cast(transact.ddate as date) <= :todate2 AND  cast(transact.ddat' +
        'e as date) >= :fromdate2 '
      '<@SQL@>  and (BLASTYEAR is null or BLASTYEAR = 0  ) '
      'group by account.Waccountid having SUM( transact.FAmount ) <> 0')
    Left = 612
    Top = 228
  end
  object ZQTrnDebCred: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select FAmount,WAccountid,WPeriodID from Totals where BActual = ' +
        '1')
    Left = 196
    Top = 356
  end
  object SQLHOLDER2: TSQLHOLDER
    Left = 580
    Top = 296
  end
end
