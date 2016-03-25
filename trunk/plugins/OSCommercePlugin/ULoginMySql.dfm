object LoginMySql: TLoginMySql
  Left = 431
  Top = 275
  Width = 443
  Height = 323
  Caption = 'LoginMySql'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 72
    Width = 38
    Height = 13
    Caption = 'PHP Url'
  end
  object Label3: TLabel
    Left = 16
    Top = 112
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label4: TLabel
    Left = 144
    Top = 112
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 61
    Height = 13
    Caption = 'Date formaat'
  end
  object Label5: TLabel
    Left = 152
    Top = 32
    Width = 74
    Height = 13
    Caption = 'Datetime format'
  end
  object Label6: TLabel
    Left = 279
    Top = 32
    Width = 26
    Height = 13
    Caption = 'Prefix'
  end
  object Label7: TLabel
    Left = 280
    Top = 112
    Width = 47
    Height = 13
    Caption = 'Tax setup'
  end
  object Label8: TLabel
    Left = 279
    Top = 72
    Width = 44
    Height = 13
    Caption = 'Sql folder'
  end
  object EServername: TEdit
    Left = 16
    Top = 88
    Width = 257
    Height = 21
    TabOrder = 4
    Text = 'http://www.url.nl/turbocash.php'
  end
  object EUsername: TEdit
    Left = 16
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'root'
  end
  object EPassword: TEdit
    Left = 144
    Top = 128
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 0
    Top = 254
    Width = 435
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 14
    object Panel2: TPanel
      Left = 262
      Top = 0
      Width = 173
      Height = 35
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 82
        Top = 7
        Width = 75
        Height = 25
        Caption = 'OK'
        Default = True
        TabOrder = 0
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
        Left = 2
        Top = 7
        Width = 75
        Height = 25
        TabOrder = 1
        Kind = bkCancel
      end
    end
  end
  object CBRememberPassword: TCheckBox
    Left = 144
    Top = 152
    Width = 129
    Height = 17
    Caption = 'Remember Password'
    TabOrder = 9
  end
  object EDateFormat: TEdit
    Left = 16
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'EDateFormat'
    OnDblClick = EDateFormatDblClick
  end
  object EDateTimeFormat: TEdit
    Left = 152
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'EDateTimeFormat'
    OnDblClick = EDateTimeFormatDblClick
  end
  object Memo1: TMemo
    Left = 16
    Top = 184
    Width = 241
    Height = 65
    TabStop = False
    TabOrder = 10
  end
  object Button1: TButton
    Left = 264
    Top = 184
    Width = 89
    Height = 25
    Caption = 'Test Login SQL'
    TabOrder = 11
    OnClick = Button1Click
  end
  object CBConfigs: TComboBox
    Left = 16
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = CBConfigsChange
  end
  object BSaveConfig: TButton
    Left = 164
    Top = 8
    Width = 72
    Height = 22
    Caption = 'Save config'
    TabOrder = 12
    OnClick = BSaveConfigClick
  end
  object EPrefix: TEdit
    Left = 278
    Top = 45
    Width = 91
    Height = 21
    TabOrder = 3
  end
  object BDeleteConfig: TButton
    Left = 244
    Top = 8
    Width = 77
    Height = 22
    Caption = 'Delete config'
    TabOrder = 15
    TabStop = False
    OnClick = BDeleteConfigClick
  end
  object BSave: TButton
    Left = 328
    Top = 8
    Width = 71
    Height = 21
    Caption = 'Save'
    TabOrder = 13
    OnClick = BSaveClick
  end
  object CBTaxType: TComboBox
    Left = 280
    Top = 128
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 8
    Text = 'Exclusive (All items are exclusive tax)'
    Items.Strings = (
      'Exclusive (All items are exclusive tax)'
      
        'Inclusive (All items are inclusive and you dont use the OSC tax ' +
        'syystem)')
  end
  object Esqlfolder: TEdit
    Left = 280
    Top = 88
    Width = 145
    Height = 21
    TabOrder = 5
    Text = 'OSFOSCsql'
  end
end
