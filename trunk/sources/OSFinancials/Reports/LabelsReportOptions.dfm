object fmLabelsReportOptions: TfmLabelsReportOptions
  Left = 279
  Top = 159
  Width = 533
  Height = 351
  Caption = 'Labels Report Options'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 276
    Width = 525
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnCancel: TBitBtn
      Left = 426
      Top = 8
      Width = 95
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
    object btnOk: TBitBtn
      Left = 328
      Top = 8
      Width = 95
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOkClick
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
  object TopPnl: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 69
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 1
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
      OnKeyPress = FormKeyPress
      Items.Strings = (
        'Screen'
        'Printer'
        'File'
        'E-mail')
    end
    object BitBtn1: TBitBtn
      Left = 222
      Top = 35
      Width = 130
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
      Left = 162
      Top = 38
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '1'
      OnChange = edtCountChange
      OnKeyPress = FormKeyPress
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
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 525
    Height = 207
    Align = alClient
    TabOrder = 2
    object Label3: TLabel
      Left = 61
      Top = 13
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sequence'
    end
    object Label4: TLabel
      Left = 94
      Top = 71
      Width = 13
      Height = 13
      Alignment = taRightJustify
      Caption = 'To'
    end
    object Label1: TLabel
      Left = 84
      Top = 43
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'From '
    end
    object Label2: TLabel
      Left = 66
      Top = 117
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Spec File'
    end
    object LCBTypeOfBarcode: TLabel
      Left = 355
      Top = 117
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Barcodetype'
    end
    object LQty: TLabel
      Left = 94
      Top = 148
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qty'
    end
    object LSellingPrice: TLabel
      Left = 56
      Top = 172
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sellingprice'
    end
    object dbcomboxSequence: TwwDBComboBox
      Left = 115
      Top = 12
      Width = 117
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DropDownCount = 8
      Frame.Transparent = True
      Frame.FocusStyle = efsFrameEtched
      Frame.MouseEnterSameAsFocus = True
      ItemHeight = 0
      Sorted = False
      TabOrder = 0
      UnboundDataType = wwDefault
      OnKeyDown = FormKeyDown
      OnKeyPress = FormKeyPress
    end
    object dbcbSpecFile: TwwDBComboBox
      Left = 115
      Top = 112
      Width = 117
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DropDownCount = 8
      Frame.Transparent = True
      Frame.FocusStyle = efsFrameEtched
      Frame.MouseEnterSameAsFocus = True
      ItemHeight = 0
      Sorted = False
      TabOrder = 6
      UnboundDataType = wwDefault
      OnKeyDown = FormKeyDown
      OnKeyPress = FormKeyPress
    end
    object dbedtFromAccount: TwwDBEdit
      Left = 115
      Top = 42
      Width = 190
      Height = 21
      TabStop = False
      Frame.Transparent = True
      Frame.FocusStyle = efsFrameEtched
      Frame.MouseEnterSameAsFocus = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyDown = FormKeyDown
      OnKeyPress = FormKeyPress
    end
    object dbedtToAccount: TwwDBEdit
      Left = 115
      Top = 68
      Width = 190
      Height = 21
      TabStop = False
      Frame.Transparent = True
      Frame.FocusStyle = efsFrameEtched
      Frame.MouseEnterSameAsFocus = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyDown = FormKeyDown
      OnKeyPress = FormKeyPress
    end
    object cbShowLines: TwwCheckBox
      Left = 341
      Top = 14
      Width = 166
      Height = 17
      DisableThemes = False
      AlwaysTransparent = False
      Frame.Transparent = True
      Frame.NonFocusStyle = efsFrameEtched
      ValueChecked = '1'
      ValueUnchecked = '0'
      DisplayValueChecked = '1'
      DisplayValueUnchecked = '0'
      NullAndBlankState = cbUnchecked
      Alignment = taLeftJustify
      Caption = 'Show Lines'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      OnKeyDown = FormKeyDown
      OnKeyPress = FormKeyPress
    end
    object CBTypeOfBarcode: TComboBox
      Left = 421
      Top = 112
      Width = 92
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 7
      Text = '39'
      Items.Strings = (
        '2_5_interleaved'
        '2_5_industrial'
        '2_5_matrix'
        '39'
        '39Extended'
        '128A'
        '128B'
        '128C'
        '93'
        '93Extended'
        'MSI'
        'PostNet'
        'Codabar'
        'EAN8'
        'EAN13')
    end
    object EFCount: TEdit
      Left = 115
      Top = 144
      Width = 117
      Height = 21
      TabOrder = 8
      Text = '1'
      OnExit = EFCountExit
    end
    object BitBtn2: TBitBtn
      Left = 304
      Top = 42
      Width = 24
      Height = 19
      TabOrder = 3
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
      Left = 305
      Top = 68
      Width = 24
      Height = 20
      TabOrder = 5
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
    object CBSellingPrice: TComboBox
      Left = 115
      Top = 169
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = 'Sellingprice 1'
      Items.Strings = (
        'Sellingprice 1'
        'Sellingprice 2'
        'Sellingprice 3')
    end
  end
end
