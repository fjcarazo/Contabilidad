object fmReconOptions: TfmReconOptions
  Left = 274
  Top = 261
  BorderIcons = [biSystemMenu]
  Caption = 'Bank Account Recon Options'
  ClientHeight = 279
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 245
    Width = 444
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      444
      34)
    object BtnCancel: TBitBtn
      Left = 324
      Top = 6
      Width = 119
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Close'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFF8383CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8181
        C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171C64D4DD03F3FB7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF3E3EAF4242C56B6BBBFFFFFFFFFFFFFFFFFF7272C7
        4E4ED16969E26969E94040B8FFFFFFFFFFFFFFFFFFFFFFFF3D3DB04E4ED84747
        D24444C96B6BBBFFFFFF8888D14949CD6060D96868DD7070E76C6CED4040B8FF
        FFFFFFFFFF3F3FB35252DC4444CE4242CC4747D24242C68181C4FFFFFF4343BD
        5E5EDE6868DE7070E77575EE6D6DEF4040B84141B65A5AE24D4DD54343CD4242
        CD4D4DD83D3DAFFFFFFFFFFFFFFFFFFF4444BE6464E47070E77676EE7777F16C
        6CEF6363E95A5ADE4C4CD44444CE4D4DD83D3DB0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4444BE6868E97575EE7777F07272EE6767E75A5ADE4D4DD54E4ED93E3E
        B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444BF6D6DEE7777F072
        72EE6767E75A5ADE5454DE3F3FB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4444C06D6DEE7777F07272EE6767E75A5ADE5454DE3C3CB6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444C16868EA7575EE7777F072
        72EE6767E75A5ADE4D4DD54E4EDA3C3CB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        4444C26464E57070E77676EE7777F16B6BEE6363E95A5ADE4C4CD44444CE4D4D
        D93C3CB6FFFFFFFFFFFFFFFFFF4444C45E5EDF6868DE7070E77575EE6C6CEF44
        44C04444BF5A5AE34D4DD54343CD4242CC4D4DD93C3CB6FFFFFF8888D74B4BD2
        6060D96868DD7070E76B6BED4545C2FFFFFFFFFFFF4343BE5353DE4444CE4242
        CC4848D34343CA8888CDFFFFFF7474D15151D76969E26868E94646C4FFFFFFFF
        FFFFFFFFFFFFFFFF4242BD4E4EDA4848D34545CE7777C8FFFFFFFFFFFFFFFFFF
        7474D14F4FD74646C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4242BD4343
        CC7878CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787D6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DD3FFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
    end
    object BtnOk: TBitBtn
      Left = 212
      Top = 6
      Width = 106
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Open'
      Default = True
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF84CA8454B757ADDBADFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81CA8152D47A72F4A53E
        B850FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8CD08C4BCD6D74F09777F08D63E69269BE6AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87CF864ACC6B6FEB9476EE8A77F08C72
        F19244C561FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CCC7B
        4BCE6F69E48B70E78573F19C74F39C72EF8865EA944DB651FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF95D7954ACE6E61DA7F68DE7D68E89742BD5044C55E70
        F19468E9824DD27497D297FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53C3575CD887
        5FD47362E39144BD4FFFFFFF79C97960E48E68E87D5FE6863DB84DFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7CD07C4ED27555D88047BE50FFFFFFFFFFFFFFFFFF40
        BE5067EC8F5BDF6F53DC815CBB5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDA9B
        91D690FFFFFFFFFFFFFFFFFFFFFFFF92D49252D87B5BE07351D96A44CA689CD5
        9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4EBC535BE3894ED55F4DD9733BB84DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FC25653DC7644CE554DD8
        7A4BB750FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8FD38F49D16F47D15F44CE5749D27471C471FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DC15F4DD87A43CD
        5547D26241C661A6D9A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF46BC4D4DD97A42CC524EDA7952BA56FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FBD
        4C4FDB7E49D37472C673FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC56A85CE85F1F7F1}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnOkClick
    end
    object BRecon: TBitBtn
      Left = 100
      Top = 6
      Width = 108
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Recon'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF84CA8454B757ADDBADFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81CA8152D47A72F4A53E
        B850FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8CD08C4BCD6D74F09777F08D63E69269BE6AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87CF864ACC6B6FEB9476EE8A77F08C72
        F19244C561FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CCC7B
        4BCE6F69E48B70E78573F19C74F39C72EF8865EA944DB651FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF95D7954ACE6E61DA7F68DE7D68E89742BD5044C55E70
        F19468E9824DD27497D297FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53C3575CD887
        5FD47362E39144BD4FFFFFFF79C97960E48E68E87D5FE6863DB84DFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7CD07C4ED27555D88047BE50FFFFFFFFFFFFFFFFFF40
        BE5067EC8F5BDF6F53DC815CBB5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDA9B
        91D690FFFFFFFFFFFFFFFFFFFFFFFF92D49252D87B5BE07351D96A44CA689CD5
        9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4EBC535BE3894ED55F4DD9733BB84DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FC25653DC7644CE554DD8
        7A4BB750FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8FD38F49D16F47D15F44CE5749D27471C471FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DC15F4DD87A43CD
        5547D26241C661A6D9A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF46BC4D4DD97A42CC524EDA7952BA56FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FBD
        4C4FDB7E49D37472C673FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC56A85CE85F1F7F1}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnOkClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 444
    Height = 176
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 1
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 434
      Height = 120
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 96
        Top = 13
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bank Account'
      end
      object Label2: TLabel
        Left = 79
        Top = 37
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Include Items until'
      end
      object Label3: TLabel
        Left = 97
        Top = 81
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bank Balance'
      end
      object Label6: TLabel
        Left = 87
        Top = 59
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = 'Current balance'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 168
        Top = 8
        Width = 249
        Height = 21
        DataField = 'SReconBankAccount'
        DataSource = dmDatabase.dsReportingOptions
        KeyField = 'SDescription'
        ListField = 'SDescription'
        ListSource = DSAccount
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
        OnKeyDown = FormKeyDown
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object dbedtBankBal: TDBEdit
        Left = 168
        Top = 76
        Width = 105
        Height = 21
        DataField = 'FReconBankBalance'
        DataSource = dmDatabase.dsReportingOptions
        TabOrder = 1
        OnChange = dbedtBankBalChange
        OnKeyDown = FormKeyDown
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object LCurBalance: TStaticText
        Left = 168
        Top = 56
        Width = 105
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'LCurBalance'
        TabOrder = 2
      end
      object dbdtUntilDate: TcxDBDateEdit
        Left = 296
        Top = 32
        DataBinding.DataField = 'DReconUntil'
        DataBinding.DataSource = dmDatabase.dsReportingOptions
        Properties.OnEditValueChanged = dbdtUntilDateChange
        TabOrder = 3
        OnExit = dbdtUntilDateExit
        OnKeyDown = FormKeyDown
        OnKeyPress = DBLookupComboBox1KeyPress
        Width = 121
      end
      object dbdtFromDate: TcxDateEdit
        Left = 168
        Top = 32
        TabOrder = 4
        Width = 121
      end
    end
  end
  object TopPnl: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 69
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object DestLbl: TLabel
      Left = 16
      Top = 10
      Width = 74
      Height = 13
      Caption = 'Send report To:'
      FocusControl = cbDestination
    end
    object lblCopies: TLabel
      Left = 122
      Top = 40
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Copies :'
      Enabled = False
      FocusControl = edtCount
    end
    object cbDestination: TComboBox
      Left = 18
      Top = 38
      Width = 91
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbDestinationChange
      OnKeyPress = cbDestinationKeyPress
      Items.Strings = (
        'Screen'
        'Printer'
        'File'
        'E-mail')
    end
    object Bitprn1: TBitBtn
      Left = 226
      Top = 34
      Width = 183
      Height = 25
      Caption = '&Printer Setup'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000004141
        4100524E4D0053504E0052525200595554005F5A59005D5D5D0065605F006363
        6300696665006E6866006C6C6C00776D6700767373007777770082777300807E
        7D004573870042778E0073AAB50078AFB50079B1B7007BB2B8007DB3B9007EB5
        BB007FB5BC0064C2CF0068C5CF0075CCD50078CED60079CFD8004FC2EB0051C3
        EB0052C4EB0052C5ED0054C5ED005BC6ED005FC8EE005AC8F00077F1F6007FF5
        F600878787008F8D8B00998F8B009E928E009D948F0093919000989594009D9A
        99009D9D9D00A1959100A3989400A59A9600A19E9E00A89D9900A1A29400A5A3
        A200A9A7A700A7A2AB00A9A9A900AEAAAA00B5A9A600B2AFAF00B3B0AF00BCB3
        AF00B5B2B100B7B5B400B9B6B600BCB6B500C4B6B200C0BCBC0086C180002312
        A50082CFD50084CFD7008FCED50090CED50085D1D80093D0D80084CDEF0080F2
        F60089F5F60090F6F6009CF4F600A5F6F600C4C2C200C8C5C400CECCCC00D0CE
        CC00D7CFCE00D7D5D500E0D5D100EAE5E200ECE7E500F4F2F100F6F6F5000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF121212
        12121212121212FFFFFFFFFFFF12544F4D4D4D4C4C5512FFFFFFFFFFFF12524E
        4B4B4B4B4B5212FFFFFFFF343312281F1E1D1D1D1D29123334FF2E4610121B1C
        1C1C1C1C1C1C130D462E2E5C412C2C2C2C2C2C2C2C2C2C3E5C2E335D5D5D5D5D
        5D5D5D5D5D5D5D5D5D33345F5F57444444444344433F475F5F34345F5B0B0403
        03030302020308585F37375F5908010101010101010105565F373759440E0401
        010101010101053B493C34463E373A312A0E0B0807070A38483CFF33332E3C3B
        3B3B312E2E2B113334FFFFFFFF12191919191915151512FFFFFFFFFFFF125252
        52525252522912FFFFFFFFFFFF12121212121212121212FFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 1
      TabStop = False
      OnClick = Bitprn1Click
    end
    object edtCount: TEdit
      Left = 162
      Top = 38
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '1'
      OnChange = edtCountChange
      OnKeyPress = cbDestinationKeyPress
    end
    object UpDown1: TUpDown
      Left = 199
      Top = 36
      Width = 16
      Height = 24
      Enabled = False
      Min = 1
      Max = 32767
      Position = 1
      TabOrder = 3
      OnClick = UpDown1Click
    end
  end
  object DSBankBook: TDataSource
    DataSet = QbankLastBooking
    Left = 20
    Top = 52
  end
  object QbankLastBooking: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'SELECT first 100 Transact.SReference, cast(Transact.DDate as dat' +
        'e) DDate,Transactiondesc.SDescription, Transact.FAmount'
      'FROM TransAct'
      '   INNER JOIN Messages Transactiondesc'
      '   ON  (Transact.WDescriptionID = Transactiondesc.WMessageID)  '
      'where Transact.WAccountId = :Acc'
      'order by Transact.DDate Desc')
    FetchRows = 100
    Left = 356
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Acc'
      end>
    object QbankLastBookingSReference: TStringField
      FieldName = 'SReference'
      Origin = 'REPMANTCCON."TransAct.DB".SReference'
      Size = 15
    end
    object QbankLastBookingDDATE: TDateField
      FieldName = 'DDATE'
      ReadOnly = True
    end
    object QbankLastBookingSDescription: TStringField
      FieldName = 'SDescription'
      Origin = 'REPMANTCCON.MessagesSDescription'
      Size = 35
    end
    object QbankLastBookingFAmount: TFloatField
      FieldName = 'FAmount'
      Origin = 'REPMANTCCON."TransAct.DB".FAmount'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object DataSource1: TDataSource
    DataSet = dmDatabase.TblReconBank
    Left = 361
    Top = 170
  end
  object tblAccount: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from account where WAccountTypeID = 3')
    UpdateObject = ZUSQLAccount
    AutoCalcFields = False
    IndexFieldNames = 'SACCOUNTCODE Asc'
    Left = 32
    Top = 101
    object tblAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object tblAccountSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object tblAccountSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object tblAccountSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object tblAccountSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblAccountWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object tblAccountBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object tblAccountBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object tblAccountBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object tblAccountBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object tblAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblAccountWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblAccountWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
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
    Left = 29
    Top = 160
  end
  object DSAccount: TDataSource
    DataSet = tblAccount
    Left = 97
    Top = 174
  end
  object QGetLastBookingsDate: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'SELECT cast(max(Transact.DDate) as date) as maxdate,  transact.w' +
        'BatchTypeId '
      ' FROM TransAct , battypes '
      'where battypes.WBatchTypeId = transact.wBatchTypeId '
      'and battypes.BCashBook = 1'
      'and battypes.WContraAccountid =:Account'
      'group by transact.wBatchTypeId')
    Left = 52
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account'
      end>
    object QGetLastBookingsDateWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object QGetLastBookingsDateMAXDATE: TDateField
      FieldName = 'MAXDATE'
      ReadOnly = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    Left = 221
    Top = 186
  end
end
