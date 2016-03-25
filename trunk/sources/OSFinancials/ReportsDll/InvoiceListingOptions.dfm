object fmInvoiceListingOptions: TfmInvoiceListingOptions
  Left = 220
  Top = 159
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Documents Listing Options'
  ClientHeight = 311
  ClientWidth = 416
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 277
    Width = 416
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnOk: TBitBtn
      Left = 222
      Top = 4
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
      Left = 319
      Top = 4
      Width = 95
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 416
    Height = 208
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 237
      Top = 17
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sequence'
    end
    object Label1: TLabel
      Left = 34
      Top = 16
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Document Type'
    end
    object dbcomboxSequence: TDBComboBox
      Left = 290
      Top = 15
      Width = 111
      Height = 21
      Style = csDropDownList
      DataField = 'SDocListSequence'
      DataSource = dmDatabase.dsReportingOptions
      ItemHeight = 13
      TabOrder = 1
      OnKeyDown = FormKeyDown
      OnKeyPress = dbcomboxOutputKeyPress
    end
    object CbDocType: TComboBox
      Left = 114
      Top = 14
      Width = 107
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Invoices'
      OnChange = CbDocTypeChange
      OnKeyPress = cbDestinationKeyPress
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 74
      Width = 401
      Height = 59
      Caption = 'Use Numbers'
      TabOrder = 2
      object Label3: TLabel
        Left = 63
        Top = 25
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'From  No'
      end
      object Label4: TLabel
        Left = 266
        Top = 26
        Width = 13
        Height = 13
        Alignment = taRightJustify
        Caption = 'To'
      end
      object dbedtFrom: TDBLookupComboBox
        Left = 113
        Top = 23
        Width = 107
        Height = 21
        DataField = 'SDocListFromNumber'
        DataSource = dmDatabase.dsReportingOptions
        KeyField = 'SDocNo'
        ListField = 'SDocNo'
        ListSource = dmDatabase.dsDocHeader
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = dbcomboxOutputKeyPress
      end
      object dbedtTo: TDBLookupComboBox
        Left = 284
        Top = 23
        Width = 111
        Height = 21
        DataField = 'SDocListToNumber'
        DataSource = dmDatabase.dsReportingOptions
        KeyField = 'SDocNo'
        ListField = 'SDocNo'
        ListSource = dmDatabase.dsDocHeader
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = cbDestinationKeyPress
      end
      object CheckBox1: TCheckBox
        Left = 4
        Top = 23
        Width = 17
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
        OnKeyPress = cbDestinationKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 6
      Top = 142
      Width = 401
      Height = 55
      Caption = 'Use Periods'
      TabOrder = 3
      object Label5: TLabel
        Left = 55
        Top = 23
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'From Date'
      end
      object Label6: TLabel
        Left = 241
        Top = 23
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'To Date'
      end
      object cboxUsePeriods: TCheckBox
        Left = 3
        Top = 21
        Width = 15
        Height = 17
        Alignment = taLeftJustify
        TabOrder = 0
        OnClick = cboxUsePeriodsClick
        OnKeyPress = cbDestinationKeyPress
      end
      object dbedtFromDate: TwwDBDateTimePicker
        Left = 110
        Top = 18
        Width = 107
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'DDocListFromDate'
        DataSource = dmDatabase.dsReportingOptions
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = dbcomboxOutputKeyPress
      end
      object dbedtToDate: TwwDBDateTimePicker
        Left = 284
        Top = 18
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'DDocListToDate'
        DataSource = dmDatabase.dsReportingOptions
        Epoch = 1950
        ShowButton = True
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = dbcomboxOutputKeyPress
      end
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 48
      Width = 209
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show Physical Address'
      TabOrder = 4
    end
  end
  object TopPnl: TPanel
    Left = 0
    Top = 0
    Width = 416
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
      Left = 130
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
      Left = 272
      Top = 36
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
      Left = 174
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
      Left = 211
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
