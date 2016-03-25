object fmCreditorAgeAnalysisOptions: TfmCreditorAgeAnalysisOptions
  Left = 352
  Top = 100
  BorderStyle = bsSingle
  Caption = 'Creditor Age Analysis Options'
  ClientHeight = 348
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 314
    Width = 377
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnOk: TBitBtn
      Left = 177
      Top = 6
      Width = 95
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
    object BtnCancel: TBitBtn
      Left = 274
      Top = 6
      Width = 95
      Height = 25
      Cancel = True
      Caption = 'Cancel'
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 377
    Height = 245
    Align = alClient
    TabOrder = 1
    object Label5: TLabel
      Left = 170
      Top = 119
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date of ageing'
    end
    object Label6: TLabel
      Left = 216
      Top = 143
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'up to'
    end
    object Label7: TLabel
      Left = 173
      Top = 167
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object Label8: TLabel
      Left = 173
      Top = 191
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object Label9: TLabel
      Left = 173
      Top = 215
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object Label3: TLabel
      Left = 177
      Top = 13
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'From account'
    end
    object Label4: TLabel
      Left = 229
      Top = 37
      Width = 13
      Height = 13
      Alignment = taRightJustify
      Caption = 'To'
    end
    object Label2: TLabel
      Left = 163
      Top = 58
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Minimum amount'
    end
    object wwDBDateTimePickerAgeDate: TwwDBDateTimePicker
      Left = 247
      Top = 114
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DCreditorAgeCurrentDate'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 10
      OnChange = wwDBDateTimePickerAgeDateChange
    end
    object wwDBDateTimePickerCurrent: TwwDBDateTimePicker
      Left = 247
      Top = 138
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DCreditorAgeDateLimit1'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 12
    end
    object wwDBDateTimePicker30Days: TwwDBDateTimePicker
      Left = 247
      Top = 162
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DCreditorAgeDateLimit2'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 15
    end
    object wwDBDateTimePicker60Days: TwwDBDateTimePicker
      Left = 247
      Top = 186
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DCreditorAgeDateLimit3'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 18
    end
    object wwDBDateTimePicker90Days: TwwDBDateTimePicker
      Left = 247
      Top = 210
      Width = 89
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DCreditorAgeDateLimit4'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      ShowButton = True
      TabOrder = 21
    end
    object dbedtRangeName1: TDBEdit
      Left = 47
      Top = 138
      Width = 73
      Height = 21
      DataField = 'SCreditorAgeRangeName0'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 11
    end
    object dbedtRangeName2: TDBEdit
      Left = 47
      Top = 162
      Width = 73
      Height = 21
      DataField = 'SCreditorAgeRangeName1'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 13
    end
    object dbedtRangeName3: TDBEdit
      Left = 47
      Top = 186
      Width = 73
      Height = 21
      DataField = 'SCreditorAgeRangeName2'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 16
    end
    object dbedtRangeName4: TDBEdit
      Left = 47
      Top = 210
      Width = 73
      Height = 21
      DataField = 'SCreditorAgeRangeName3'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 19
    end
    object dbedtNoMonth1: TDBEdit
      Left = 119
      Top = 162
      Width = 17
      Height = 21
      DataField = 'WCreditorAgeMonth1'
      DataSource = dmDatabase.dsReportingOptions
      MaxLength = 2
      TabOrder = 14
      OnChange = wwDBDateTimePickerAgeDateChange
    end
    object dbedtNoMonth2: TDBEdit
      Left = 119
      Top = 186
      Width = 17
      Height = 21
      DataField = 'WCreditorAgeMonth2'
      DataSource = dmDatabase.dsReportingOptions
      MaxLength = 2
      TabOrder = 17
      OnChange = wwDBDateTimePickerAgeDateChange
    end
    object dbedtNoMonth3: TDBEdit
      Left = 119
      Top = 210
      Width = 17
      Height = 21
      DataField = 'WCreditorAgeMonth3'
      DataSource = dmDatabase.dsReportingOptions
      MaxLength = 2
      TabOrder = 20
      OnChange = wwDBDateTimePickerAgeDateChange
    end
    object dbedtFromAccount: TDBEdit
      Left = 247
      Top = 8
      Width = 98
      Height = 21
      TabStop = False
      DataField = 'SCreditorAgeFrom'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 0
    end
    object dbedtToAccount: TDBEdit
      Left = 247
      Top = 32
      Width = 98
      Height = 21
      TabStop = False
      DataField = 'SCreditorAgeTo'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 2
    end
    object dbedtMinAmount: TDBEdit
      Left = 247
      Top = 56
      Width = 98
      Height = 21
      DataField = 'FCREDITorAgeMinimumAmount'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 4
    end
    object dbcbDetail: TDBCheckBox
      Left = 16
      Top = 9
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show account details'
      DataField = 'BCreditorAgeAccountDetail'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbcbSort: TDBCheckBox
      Left = 16
      Top = 33
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Sort by name'
      DataField = 'BCreditorAgeSort'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbcbShowTransactions: TDBCheckBox
      Left = 16
      Top = 58
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show Transactions'
      DataField = 'BCreditorAgeShowTransac'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 7
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbcbZeroBal: TDBCheckBox
      Left = 16
      Top = 82
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Ignore Zero Balances'
      DataField = 'BCreditorAgeIgnoreZeroBal'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbcbOpenItem: TDBCheckBox
      Left = 16
      Top = 104
      Width = 137
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Use Open item'
      DataField = 'BCreditorAgeShowOpenItem'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 9
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object BitBtn2: TBitBtn
      Left = 344
      Top = 8
      Width = 24
      Height = 19
      TabOrder = 1
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
    object BitBtn3: TBitBtn
      Left = 344
      Top = 32
      Width = 24
      Height = 19
      TabOrder = 3
      OnClick = BitBtn3Click
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
    object CBShowAll: TCheckBox
      Left = 200
      Top = 88
      Width = 145
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show All'
      TabOrder = 22
    end
  end
  object TopPnl: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 69
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 74
      Height = 13
      Caption = 'Send report To:'
      FocusControl = cbDestination
    end
    object lblCopies: TLabel
      Left = 117
      Top = 42
      Width = 38
      Height = 13
      Caption = 'Copies :'
      Enabled = False
      FocusControl = edtCount
    end
    object cbDestination: TComboBox
      Left = 16
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
    object BitBtn1: TBitBtn
      Left = 210
      Top = 38
      Width = 133
      Height = 25
      Caption = '&Printer Setup'
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
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
      Left = 157
      Top = 40
      Width = 29
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '1'
      OnChange = edtCountChange
      OnKeyPress = edtCountKeyPress
    end
    object UpDown1: TUpDown
      Left = 186
      Top = 38
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
