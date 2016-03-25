object fmDebtorAgeAnalysisOptions: TfmDebtorAgeAnalysisOptions
  Left = 278
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Debtor Age Analysis'
  ClientHeight = 399
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 365
    Width = 410
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnCancel: TBitBtn
      Left = 306
      Top = 6
      Width = 96
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BtnOk: TBitBtn
      Left = 207
      Top = 6
      Width = 96
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = btnOkClick
      OnKeyDown = FormKeyDown
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 410
    Height = 296
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 201
      Top = 43
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'From account'
    end
    object Label4: TLabel
      Left = 253
      Top = 67
      Width = 13
      Height = 13
      Alignment = taRightJustify
      Caption = 'To'
    end
    object Label2: TLabel
      Left = 187
      Top = 88
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Minimum amount'
    end
    object Label5: TLabel
      Left = 209
      Top = 164
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date of ageing'
    end
    object Label6: TLabel
      Left = 255
      Top = 188
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'up to'
    end
    object Label7: TLabel
      Left = 212
      Top = 212
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object Label8: TLabel
      Left = 212
      Top = 236
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object Label9: TLabel
      Left = 212
      Top = 260
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object LRepGroup: TLabel
      Left = 188
      Top = 114
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Reporting Group'
    end
    object dbedtFromAccount: TDBEdit
      Left = 273
      Top = 35
      Width = 104
      Height = 21
      TabStop = False
      DataField = 'SDebtorAgeFrom'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 5
      OnKeyPress = FormKeyPress
    end
    object dbedtToAccount: TDBEdit
      Left = 273
      Top = 59
      Width = 104
      Height = 21
      TabStop = False
      DataField = 'SDebtorAgeTo'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 7
      OnKeyPress = FormKeyPress
    end
    object dbedtMinAmount: TDBEdit
      Left = 273
      Top = 83
      Width = 104
      Height = 21
      DataField = 'FDebtorAgeMinimumAmount'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 9
      OnKeyPress = FormKeyPress
    end
    object dbcbDetail: TDBCheckBox
      Left = 26
      Top = 5
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show account details'
      DataField = 'BDebtorAgeAccountdetail'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = FormKeyPress
    end
    object dbcbSort: TDBCheckBox
      Left = 26
      Top = 29
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Sort by name'
      DataField = 'BDebtorAgeSort'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = FormKeyPress
    end
    object dbcbShowTransactions: TDBCheckBox
      Left = 26
      Top = 53
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show Transactions'
      DataField = 'BDebtorAgeShowTransac'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = FormKeyPress
    end
    object dbcbZeroBal: TDBCheckBox
      Left = 26
      Top = 76
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ignore Zero Balances'
      DataField = 'BDebtorAgeIgnoreZeroBal'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePickerAgeDate: TwwDBDateTimePicker
      Left = 289
      Top = 156
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtorAgeCurrentDate'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 10
      OnChange = wwDBDateTimePickerAgeDateChange
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePickerCurrent: TwwDBDateTimePicker
      Left = 289
      Top = 180
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtorAgeDateLimit1'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 12
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePicker30Days: TwwDBDateTimePicker
      Left = 289
      Top = 204
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtorAgeDateLimit2'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 15
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePicker60Days: TwwDBDateTimePicker
      Left = 289
      Top = 228
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtorAgeDateLimit3'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 18
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePicker90Days: TwwDBDateTimePicker
      Left = 289
      Top = 252
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtorAgeDateLimit4'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 21
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName1: TDBEdit
      Left = 57
      Top = 180
      Width = 73
      Height = 21
      DataField = 'SDebtorAgeRangeName0'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 11
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName2: TDBEdit
      Left = 57
      Top = 204
      Width = 73
      Height = 21
      DataField = 'SDebtorAgeRangeName1'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 13
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName3: TDBEdit
      Left = 57
      Top = 228
      Width = 73
      Height = 21
      DataField = 'SDebtorAgeRangeName2'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 16
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName4: TDBEdit
      Left = 57
      Top = 252
      Width = 73
      Height = 21
      DataField = 'SDebtorAgeRangeName3'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 19
      OnKeyPress = FormKeyPress
    end
    object dbedtNoMonth1: TDBEdit
      Left = 129
      Top = 204
      Width = 17
      Height = 21
      DataField = 'WDebtorAgeMonth1'
      DataSource = dmDatabase.dsReportingOptions
      MaxLength = 2
      TabOrder = 14
      OnChange = wwDBDateTimePickerAgeDateChange
      OnKeyPress = FormKeyPress
    end
    object dbedtNoMonth2: TDBEdit
      Left = 129
      Top = 228
      Width = 17
      Height = 21
      DataField = 'WDebtorAgeMonth2'
      DataSource = dmDatabase.dsReportingOptions
      MaxLength = 2
      TabOrder = 17
      OnChange = wwDBDateTimePickerAgeDateChange
      OnKeyPress = FormKeyPress
    end
    object dbedtNoMonth3: TDBEdit
      Left = 129
      Top = 252
      Width = 17
      Height = 21
      DataField = 'WDebtorAgeMonth3'
      DataSource = dmDatabase.dsReportingOptions
      MaxLength = 2
      TabOrder = 20
      OnChange = wwDBDateTimePickerAgeDateChange
      OnKeyPress = FormKeyPress
    end
    object dbcbOpenItem: TDBCheckBox
      Left = 26
      Top = 100
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Use Open Item'
      DataField = 'BDebtorAgeShowOpenItem'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 4
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = FormKeyPress
    end
    object cdRepGoups: TComboBox
      Left = 274
      Top = 109
      Width = 103
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 22
      Text = 'None'
      Items.Strings = (
        'None'
        'Group1'
        'Group2')
    end
    object CBAllDebtors: TCheckBox
      Left = 208
      Top = 10
      Width = 170
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show all debtors'
      TabOrder = 23
    end
    object BitBtn1: TBitBtn
      Left = 377
      Top = 35
      Width = 24
      Height = 19
      TabOrder = 6
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000A56D39A56D39
        A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
        39A56D39A56D39A56D39A56D39A592ADA59EC6A56D39A56D39A56D39A56D39A5
        6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A582ADA59EDE
        AD82BDCEC3C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
        39A56D39A56D39A56D39A56D399CD3FFBD9EEFAD82BDC6B2BDA56D39A56D39A5
        6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
        A5CFF7B5A2F7A58EC6D6C3CEA56D39A56D39A56D39A56D39A56D39A56D39A56D
        39A56D39A56D39A56D39A56D39A56D39A56D39ADCFFFBDA2EFA582B5CEC3CEA5
        6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
        A56D39A56D39A5C3F7ADAEDEA5A2ADD6BEC6CEB2C6D6B2A5DEC3B5DEC3B5BDA2
        C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39C6A29CDE
        BE9CFFEFBDFFFFD6FFFFD6FFFFDEF7EFD6BDA2C6A56D39A56D39A56D39A56D39
        A56D39A56D39A56D39A56D39D6AE9CEFDFB5FFF3C6FFFFD6FFFFDEFFFFDEFFFF
        DEDECFBDBDA2C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39EFCFADFF
        EFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFFDEF7F3D6E7CFC6A56D39A56D39A56D39
        A56D39A56D39A56D39C6B2ADF7E3BDFFDFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFF
        DEF7F3D6F7E3C6A56D39A56D39A56D39A56D39A56D39A56D39CEB2ADF7E3BDFF
        E3B5FFE3BDFFFFC6FFFFD6FFFFDEFFFFD6FFFFCEF7E3C6A56D39A56D39A56D39
        A56D39A56D39A56D39A56D39F7DFC6FFEFCEFFE3C6FFE3B5FFEFBDFFF3C6F7F3
        C6FFEFC6F7CFB5A56D39A56D39A56D39A56D39A56D39A56D39A56D39DEBEB5FF
        FFDEFFFFDEFFE3BDF7DFB5F7E3B5FFEFBDDEC3A5C6A2C6A56D39A56D39A56D39
        A56D39A56D39A56D39A56D39A56D39DEC3BDF7F3D6FFEFCEFFEFC6F7E3BDE7C3
        A5D6C3BDA56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A5
        6D39A56D39A56D39D6B2A5D6B2ADBDA28CA56D39A56D39A56D39}
    end
    object BitBtn2: TBitBtn
      Left = 377
      Top = 60
      Width = 24
      Height = 19
      TabOrder = 8
      OnClick = BitBtn2Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000A56D39A56D39
        A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
        39A56D39A56D39A56D39A56D39A592ADA59EC6A56D39A56D39A56D39A56D39A5
        6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A582ADA59EDE
        AD82BDCEC3C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
        39A56D39A56D39A56D39A56D399CD3FFBD9EEFAD82BDC6B2BDA56D39A56D39A5
        6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
        A5CFF7B5A2F7A58EC6D6C3CEA56D39A56D39A56D39A56D39A56D39A56D39A56D
        39A56D39A56D39A56D39A56D39A56D39A56D39ADCFFFBDA2EFA582B5CEC3CEA5
        6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
        A56D39A56D39A5C3F7ADAEDEA5A2ADD6BEC6CEB2C6D6B2A5DEC3B5DEC3B5BDA2
        C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39C6A29CDE
        BE9CFFEFBDFFFFD6FFFFD6FFFFDEF7EFD6BDA2C6A56D39A56D39A56D39A56D39
        A56D39A56D39A56D39A56D39D6AE9CEFDFB5FFF3C6FFFFD6FFFFDEFFFFDEFFFF
        DEDECFBDBDA2C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39EFCFADFF
        EFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFFDEF7F3D6E7CFC6A56D39A56D39A56D39
        A56D39A56D39A56D39C6B2ADF7E3BDFFDFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFF
        DEF7F3D6F7E3C6A56D39A56D39A56D39A56D39A56D39A56D39CEB2ADF7E3BDFF
        E3B5FFE3BDFFFFC6FFFFD6FFFFDEFFFFD6FFFFCEF7E3C6A56D39A56D39A56D39
        A56D39A56D39A56D39A56D39F7DFC6FFEFCEFFE3C6FFE3B5FFEFBDFFF3C6F7F3
        C6FFEFC6F7CFB5A56D39A56D39A56D39A56D39A56D39A56D39A56D39DEBEB5FF
        FFDEFFFFDEFFE3BDF7DFB5F7E3B5FFEFBDDEC3A5C6A2C6A56D39A56D39A56D39
        A56D39A56D39A56D39A56D39A56D39DEC3BDF7F3D6FFEFCEFFEFC6F7E3BDE7C3
        A5D6C3BDA56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A5
        6D39A56D39A56D39D6B2A5D6B2ADBDA28CA56D39A56D39A56D39}
    end
  end
  object TopPnl: TPanel
    Left = 0
    Top = 0
    Width = 410
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
      ItemHeight = 13
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
      Left = 222
      Top = 38
      Width = 130
      Height = 25
      Caption = '&Printer Setup'
      TabOrder = 1
      TabStop = False
      OnClick = Bitprn1Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000000000000000
        1F7C1F7C1F7C1F7C000018631863186318631863186318631863186300001863
        00001F7C1F7C0000000000000000000000000000000000000000000000000000
        186300001F7C0000186318631863186318631863E07FE07FE07F186318630000
        000000001F7C0000186318631863186318631863104210421042186318630000
        186300001F7C0000000000000000000000000000000000000000000000000000
        1863186300000000186318631863186318631863186318631863186300001863
        0000186300001F7C000000000000000000000000000000000000000018630000
        1863000000001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001863
        0000186300001F7C1F7C1F7C0000FF7F00000000000000000000FF7F00000000
        000000001F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00000000000000000000FF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
        00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
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
end
