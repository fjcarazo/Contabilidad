object Form1: TForm1
  Left = 157
  Top = 208
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label2: TLabel
    Left = 14
    Top = 44
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 14
    Top = 82
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label4: TLabel
    Left = 14
    Top = 119
    Width = 31
    Height = 13
    Caption = 'Server'
  end
  object Label5: TLabel
    Left = 13
    Top = 154
    Width = 39
    Height = 13
    Caption = 'Protocol'
  end
  object Label6: TLabel
    Left = 222
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Label7: TLabel
    Left = 222
    Top = 44
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label8: TLabel
    Left = 222
    Top = 82
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label9: TLabel
    Left = 222
    Top = 119
    Width = 31
    Height = 13
    Caption = 'Server'
  end
  object Label10: TLabel
    Left = 221
    Top = 154
    Width = 39
    Height = 13
    Caption = 'Protocol'
  end
  object BitBtn1: TBitBtn
    Left = 148
    Top = 236
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
  end
  object EFromusername: TEdit
    Left = 12
    Top = 20
    Width = 173
    Height = 21
    TabOrder = 1
    Text = 'ETousername'
  end
  object EFromPass: TEdit
    Left = 12
    Top = 60
    Width = 173
    Height = 21
    TabOrder = 2
    Text = 'EToPass'
  end
  object EFromDb: TEdit
    Left = 12
    Top = 96
    Width = 173
    Height = 21
    TabOrder = 3
    Text = 'EToDb'
  end
  object EFromServer: TEdit
    Left = 12
    Top = 132
    Width = 173
    Height = 21
    TabOrder = 4
    Text = 'EToServer'
  end
  object cbToType: TComboBox
    Left = 12
    Top = 168
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Items.Strings = (
      'Interbase'
      'Oracle')
  end
  object Edit1: TEdit
    Left = 220
    Top = 20
    Width = 173
    Height = 21
    TabOrder = 6
    Text = 'EFromusername'
  end
  object Edit2: TEdit
    Left = 220
    Top = 60
    Width = 173
    Height = 21
    TabOrder = 7
    Text = 'EFromPass'
  end
  object Edit3: TEdit
    Left = 220
    Top = 96
    Width = 173
    Height = 21
    TabOrder = 8
    Text = 'EFromDb'
  end
  object Edit4: TEdit
    Left = 220
    Top = 132
    Width = 173
    Height = 21
    TabOrder = 9
    Text = 'EFromServer'
  end
  object cbFromType: TComboBox
    Left = 220
    Top = 168
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Items.Strings = (
      'Interbase'
      'Oracle')
  end
  object ZConnection1: TUniConnection
    DataTypeMap = <>
    Left = 468
    Top = 284
  end
  object ZConnection2: TUniConnection
    DataTypeMap = <>
    Left = 532
    Top = 240
  end
end
