object fmPaperSetup: TfmPaperSetup
  Left = 267
  Top = 134
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Dotmatrix Printer Paper Setup'
  ClientHeight = 278
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 2
    Top = 2
    Width = 351
    Height = 241
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 8
      Top = 52
      Width = 336
      Height = 69
      Caption = 'Margins'
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 15
        Width = 18
        Height = 13
        Caption = 'Left'
      end
      object Label2: TLabel
        Left = 12
        Top = 40
        Width = 19
        Height = 13
        Caption = 'Top'
      end
      object Label3: TLabel
        Left = 159
        Top = 15
        Width = 25
        Height = 13
        Caption = 'Right'
      end
      object Label4: TLabel
        Left = 159
        Top = 40
        Width = 33
        Height = 13
        Caption = 'Bottom'
      end
      object Label6: TLabel
        Left = 115
        Top = 18
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object Label7: TLabel
        Left = 115
        Top = 44
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object Label8: TLabel
        Left = 263
        Top = 18
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object Label9: TLabel
        Left = 263
        Top = 44
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object edtLeft: TEdit
        Left = 60
        Top = 15
        Width = 41
        Height = 21
        TabOrder = 0
        Text = 'edtLeft'
      end
      object UpDown1: TUpDown
        Left = 100
        Top = 15
        Width = 13
        Height = 20
        Max = 1000
        Position = 500
        TabOrder = 1
        OnClick = UpDown1Click
      end
      object edtTop: TEdit
        Left = 60
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
      end
      object UpDown2: TUpDown
        Left = 100
        Top = 40
        Width = 13
        Height = 20
        Max = 1000
        Position = 500
        TabOrder = 3
        OnClick = UpDown2Click
      end
      object edtRight: TEdit
        Left = 208
        Top = 15
        Width = 41
        Height = 21
        TabOrder = 4
        Text = 'Edit1'
      end
      object UpDown3: TUpDown
        Left = 248
        Top = 15
        Width = 13
        Height = 20
        Max = 1000
        Position = 500
        TabOrder = 5
        OnClick = UpDown3Click
      end
      object edtBottom: TEdit
        Left = 208
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 6
        Text = 'Edit1'
      end
      object UpDown4: TUpDown
        Left = 248
        Top = 40
        Width = 13
        Height = 20
        Max = 1000
        Position = 500
        TabOrder = 7
        OnClick = UpDown4Click
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 124
      Width = 337
      Height = 101
      Caption = 'Paper'
      TabOrder = 1
      object Label5: TLabel
        Left = 102
        Top = 42
        Width = 33
        Height = 13
        Caption = 'Length'
      end
      object Label10: TLabel
        Left = 104
        Top = 70
        Width = 28
        Height = 13
        Caption = 'Width'
      end
      object Label11: TLabel
        Left = 199
        Top = 42
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object Label12: TLabel
        Left = 201
        Top = 68
        Width = 16
        Height = 13
        Caption = 'mm'
      end
      object Label13: TLabel
        Left = 12
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Paper Type '
      end
      object Label14: TLabel
        Left = 238
        Top = 14
        Width = 63
        Height = 13
        Caption = 'Paper Quality'
      end
      object Label15: TLabel
        Left = 104
        Top = 16
        Width = 51
        Height = 13
        Caption = 'Paper Size'
      end
      object edtLength: TEdit
        Left = 145
        Top = 38
        Width = 41
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object UpDown5: TUpDown
        Left = 185
        Top = 38
        Width = 12
        Height = 20
        Max = 1000
        Position = 500
        TabOrder = 1
        OnClick = UpDown5Click
      end
      object edtWidth: TEdit
        Left = 146
        Top = 64
        Width = 41
        Height = 21
        TabOrder = 2
        Text = 'Edit1'
      end
      object UpDown6: TUpDown
        Left = 186
        Top = 64
        Width = 13
        Height = 20
        Max = 1000
        Position = 500
        TabOrder = 3
        OnClick = UpDown6Click
      end
      object rbDefault: TRadioButton
        Left = 12
        Top = 42
        Width = 69
        Height = 17
        Caption = 'Default'
        Checked = True
        TabOrder = 4
        TabStop = True
      end
      object rbCutom: TRadioButton
        Left = 12
        Top = 68
        Width = 69
        Height = 17
        Caption = 'Custom'
        TabOrder = 5
      end
      object cbQuality: TComboBox
        Left = 236
        Top = 38
        Width = 89
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 6
        Text = 'Draft'
        Items.Strings = (
          'Draft'
          'Letter')
      end
    end
    object rbRepType: TRadioGroup
      Left = 9
      Top = 9
      Width = 332
      Height = 39
      Caption = 'Reports Type'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Documents'
        'Statements'
        'Others')
      TabOrder = 2
      OnClick = rbRepTypeClick
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 244
    Width = 356
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn3: TBitBtn
      Left = 51
      Top = 5
      Width = 96
      Height = 25
      Caption = '&Reset'
      TabOrder = 0
      OnClick = BitBtn3Click
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 151
      Top = 5
      Width = 96
      Height = 25
      Caption = '&Apply'
      TabOrder = 1
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 251
      Top = 5
      Width = 96
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
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
end
