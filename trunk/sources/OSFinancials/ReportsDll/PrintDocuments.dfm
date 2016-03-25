object fmPrintDocs: TfmPrintDocs
  Left = 157
  Top = 70
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Print Documents'
  ClientHeight = 503
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 430
    Width = 597
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object lbSearchBy: TLabel
      Left = 6
      Top = 4
      Width = 127
      Height = 13
      Caption = 'Search By Invoice Number'
    end
    object Label4: TLabel
      Left = 236
      Top = 2
      Width = 48
      Height = 13
      Alignment = taCenter
      Caption = 'Type Print'
    end
    object StBar: TStatusBar
      Left = 0
      Top = 54
      Width = 597
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 50
        end
        item
          Width = 50
        end>
    end
    object btSearch: TButton
      Left = 134
      Top = 19
      Width = 91
      Height = 25
      Caption = 'Search...'
      TabOrder = 4
      TabStop = False
      OnClick = btSearchClick
    end
    object ed: TEdit
      Left = 7
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = edChange
    end
    object edDate: TwwDBDateTimePicker
      Left = 7
      Top = 22
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 2
      OnChange = edDateChange
    end
    object BtnOk: TBitBtn
      Left = 388
      Top = 20
      Width = 95
      Height = 25
      Caption = '&Print'
      TabOrder = 0
      OnClick = btnOKClick
      OnKeyPress = FormKeyPress
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888000000000008888800000000000888808888888880
        80888088888888808088000000000000080800000000000008080888888AAA88
        00080888888AAA88000808888882228808080888888222880808000000000000
        0880000000000000088008888888888080800888888888808080800000000008
        08008000000000080800880FFFFFFFF08080880FFFFFFFF080808880FCCCCCF0
        00088880FCCCCCF000088880FFFFFFFF08888880FFFFFFFF088888880FCCCCCF
        088888880FCCCCCF088888880FFFFFFFF08888880FFFFFFFF088888880000000
        0088888880000000008888888888888888888888888888888888}
      NumGlyphs = 2
    end
    object BtnCancel: TBitBtn
      Left = 488
      Top = 20
      Width = 95
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyPress = FormKeyPress
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
    object ChkService: TwwDBComboBox
      Left = 235
      Top = 22
      Width = 109
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = False
      AllowClearKey = False
      DropDownCount = 8
      ItemHeight = 0
      Sorted = False
      TabOrder = 6
      UnboundDataType = wwDefault
    end
  end
  object Panel1: TPanel
    Left = 408
    Top = 0
    Width = 189
    Height = 430
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 8
      Top = 2
      Width = 169
      Height = 103
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 82
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Document Type'
      end
      object CbDocTypeNew: TComboBox
        Left = 11
        Top = 28
        Width = 150
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CbDocTypeNewChange
      end
      object cbUnPrinted: TCheckBox
        Left = 12
        Top = 56
        Width = 149
        Height = 17
        Caption = 'UnPrinted'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbUnPrintedClick
      end
      object cbUnposted: TCheckBox
        Left = 12
        Top = 78
        Width = 149
        Height = 17
        Caption = 'UnPosted'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbUnPrintedClick
      end
    end
    object Panel3: TPanel
      Left = 8
      Top = 106
      Width = 169
      Height = 130
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 41
        Width = 61
        Height = 13
        Caption = 'From Invoice'
      end
      object Label2: TLabel
        Left = 12
        Top = 86
        Width = 51
        Height = 13
        Caption = 'To Invoice'
      end
      object RbRange: TRadioButton
        Left = 12
        Top = 2
        Width = 141
        Height = 17
        Caption = 'From ... To'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RbRangeClick
      end
      object RbSelect: TRadioButton
        Left = 12
        Top = 22
        Width = 141
        Height = 17
        Caption = 'Selected'
        TabOrder = 1
        OnClick = RbSelectClick
      end
      object cboxFromInvoice: TwwDBLookupCombo
        Left = 12
        Top = 59
        Width = 149
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        LookupTable = dmDatabase.qryDocHead
        LookupField = 'SDocNo'
        DropDownWidth = 99
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnKeyPress = cboxFromInvoiceKeyPress
      end
      object cboxToInvoice: TwwDBLookupCombo
        Left = 12
        Top = 102
        Width = 149
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        LookupTable = dmDatabase.qryDocHead
        LookupField = 'SDocNo'
        DropDownWidth = 99
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnKeyPress = cboxFromInvoiceKeyPress
      end
    end
    object Panel4: TPanel
      Left = 8
      Top = 248
      Width = 169
      Height = 183
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      DesignSize = (
        169
        183)
      object DestLbl: TLabel
        Left = 84
        Top = 67
        Width = 74
        Height = 13
        Caption = 'Send report To:'
        FocusControl = cbDestination
      end
      object lblCopies: TLabel
        Left = 12
        Top = 120
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Copies :'
        Enabled = False
        FocusControl = edtCount
      end
      object Label20: TLabel
        Left = 111
        Top = 26
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
        Caption = 'Layout file'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object cbDestination: TComboBox
        Left = 14
        Top = 87
        Width = 147
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
      object edtCount: TEdit
        Left = 52
        Top = 118
        Width = 37
        Height = 21
        Enabled = False
        TabOrder = 1
        Text = '1'
        OnChange = edtCountChange
        OnKeyPress = cbDestinationKeyPress
      end
      object UpDown1: TUpDown
        Left = 88
        Top = 116
        Width = 16
        Height = 24
        Enabled = False
        Min = 1
        Max = 32767
        Position = 1
        TabOrder = 2
        OnClick = UpDown1Click
      end
      object Bitprn1: TBitBtn
        Left = 14
        Top = 146
        Width = 147
        Height = 25
        Caption = '&Printer Setup'
        TabOrder = 3
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
      object CBDocLayout: TComboBox
        Left = 14
        Top = 42
        Width = 145
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akBottom]
        ItemHeight = 13
        TabOrder = 4
      end
    end
  end
  object dbgInvoiceList: TwwDBGrid
    Left = 0
    Top = 0
    Width = 408
    Height = 430
    ControlInfoInDataset = False
    Selected.Strings = (
      'SDocNo'#9'10'#9'Invoice Number'#9'T'
      'DDate'#9'10'#9'Date'#9'T'
      'SACCOUNTCODE'#9'10'#9'Account'#9'F'
      'SDescription'#9'25'#9'Debtor'#9'T')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Ctl3D = False
    DataSource = dmDatabase.dsDocHead
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
    ParentCtl3D = False
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    UseTFields = False
    OnCalcCellColors = dbgInvoiceListCalcCellColors
    OnTitleButtonClick = dbgInvoiceListTitleButtonClick
    OnDblClick = dbgInvoiceListDblClick
    OnEnter = dbgInvoiceListEnter
    DragVertOffset = 0
  end
  object PnlPrg: TPanel
    Left = 40
    Top = 164
    Width = 283
    Height = 51
    BevelInner = bvRaised
    TabOrder = 3
    Visible = False
    object lblCount: TLabel
      Left = 10
      Top = 32
      Width = 266
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object prgBar: TProgressBar
      Left = 8
      Top = 8
      Width = 270
      Height = 16
      TabOrder = 0
    end
  end
end
