object fmDataIntegrityCheck: TfmDataIntegrityCheck
  Left = 237
  Top = 132
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Data Integrity Check'
  ClientHeight = 307
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stBar1: TStatusBar
    Left = 0
    Top = 286
    Width = 465
    Height = 21
    Panels = <>
    SimplePanel = True
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 237
    Width = 465
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BtnCheck: TBitBtn
      Left = 130
      Top = 14
      Width = 96
      Height = 25
      Caption = '&Check'
      TabOrder = 0
      OnClick = BtnCheckClick
      OnKeyPress = FormKeyPress
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
      Left = 237
      Top = 14
      Width = 96
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
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
    object btnClose: TBitBtn
      Left = 344
      Top = 14
      Width = 96
      Height = 25
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 51
    Width = 304
    Height = 186
    Align = alClient
    TabOrder = 2
    object Label1: TLabel
      Left = 247
      Top = 18
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 247
      Top = 46
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label3: TLabel
      Left = 247
      Top = 73
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label4: TLabel
      Left = 247
      Top = 101
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label5: TLabel
      Left = 247
      Top = 128
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label6: TLabel
      Left = 247
      Top = 156
      Width = 32
      Height = 13
      Caption = 'Label1'
      Visible = False
    end
    object DataCheck1: TCheckBox
      Left = 26
      Top = 18
      Width = 209
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Files Corruption'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object DataCheck2: TCheckBox
      Left = 26
      Top = 43
      Width = 209
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Balances per Period'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object DataCheck3: TCheckBox
      Left = 26
      Top = 70
      Width = 209
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Count Accounts and Stock items'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object DataCheck5: TCheckBox
      Left = 26
      Top = 125
      Width = 209
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Outstanding  batches and Documents'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
    object DataCheck6: TCheckBox
      Left = 26
      Top = 152
      Width = 209
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Unposted Documents'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object DataCheck4: TCheckBox
      Left = 26
      Top = 98
      Width = 209
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Debtors and Creditors'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 5
    end
  end
  object pnlDroit: TPanel
    Left = 304
    Top = 51
    Width = 161
    Height = 186
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object TopPnl: TPanel
      Left = 0
      Top = 0
      Width = 161
      Height = 186
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
      object DestLbl: TLabel
        Left = 14
        Top = 6
        Width = 74
        Height = 13
        Caption = 'Send report To:'
        FocusControl = cbDestination
      end
      object lblCopies: TLabel
        Left = 18
        Top = 67
        Width = 38
        Height = 13
        Caption = 'Copies :'
        Enabled = False
        FocusControl = edtCount
      end
      object cbDestination: TComboBox
        Left = 16
        Top = 34
        Width = 95
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
        Left = 18
        Top = 98
        Width = 135
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
        Left = 58
        Top = 65
        Width = 37
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = '1'
        OnChange = edtCountChange
        OnKeyPress = cbDestinationKeyPress
      end
      object UpDown1: TUpDown
        Left = 95
        Top = 63
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 51
    Align = alTop
    TabOrder = 4
    object LblT6: TLabel
      Left = 6
      Top = 4
      Width = 94
      Height = 13
      Caption = 'Select Set of Books'
    end
    object lblBooksDir: TLabel
      Left = 134
      Top = 4
      Width = 53
      Height = 13
      Caption = 'lblBooksDir'
    end
    object lblLst: TLabel
      Left = 14
      Top = 28
      Width = 42
      Height = 13
      Caption = 'From List'
    end
    object sbBrowse: TSpeedButton
      Left = 311
      Top = 18
      Width = 106
      Height = 25
      Caption = '&Browse'
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00B6B6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B60000000000
        00000000000000B6B6B6000000000000000000000000B6B60000B600FFFFFFFF
        FFFFFFFFFFFF00B600B600FFFFFFFFFFFFFFFFFFFF00B6000000B600FFFFFFFF
        FFFFFF000000000000B600FFFFFFFFFFFFFF00000000000000B6B600FFFFFFFF
        FFFF006DB6B66D0000B600FFFFFFFFFFFF00B6B6B6B60000B6B6B600FFFFFFFF
        FF006DB6B61F6DFF00B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FF00B6B6B6B66DB600B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FF00B61FB6B66DB600B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FF006D1F1FB66DFF00B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FFFF006DB6B66D00B6B600FFFFFFFFFFFF00B6B6B6B600B6B6B6B600FFFFFFFF
        FFFFFF00000000B6B6B600FFFFFFFFFFFFFF00000000B6B6B6B6B600FFFFFFFF
        FFFFFFFFFFFF00B6B6B600FFFFFFFFFFFFFFFFFFFF00B6B6B6B6B600FFFFFFFF
        FFFFFF00000000B6B6B600FFFFFFFFFFFFFF00000000B6B6B6B6B600FFFFFFFF
        FFFFFF00B600B6B6B6B600FFFFFFFFFFFFFF00B600B6B6B6B6B6B600FFFFFFFF
        FFFFFF0000B6B6B6B6B600FFFFFFFFFFFFFF0000B6B6B6B6B6B6B60000000000
        00000000B6B6B6B6B6B6000000000000000000B6B6B6B6B6B6B6}
      NumGlyphs = 2
      OnClick = sbBrowseClick
    end
    object cbBooks: TComboBox
      Left = 86
      Top = 22
      Width = 171
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbBooksChange
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 8
    Top = 116
  end
end
