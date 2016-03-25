object MainDataAccess: TMainDataAccess
  Left = 135
  Top = 179
  Width = 767
  Height = 620
  Caption = 'DataAccess osF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    759
    592)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object Lpassword: TLabel
    Left = 8
    Top = 48
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Server'
  end
  object Label2: TLabel
    Left = 8
    Top = 128
    Width = 21
    Height = 13
    Caption = 'data'
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 15
    Height = 13
    Caption = 'Sql'
  end
  object Label5: TLabel
    Left = 236
    Top = 4
    Width = 18
    Height = 13
    Caption = 'Log'
  end
  object MData: TMemo
    Left = 8
    Top = 184
    Width = 745
    Height = 363
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Euser: TEdit
    Left = 8
    Top = 20
    Width = 201
    Height = 21
    TabOrder = 1
    Text = 'sysdba'
  end
  object EPassword: TEdit
    Left = 8
    Top = 64
    Width = 197
    Height = 21
    TabOrder = 2
    Text = 'masterkey'
  end
  object EServer: TEdit
    Left = 8
    Top = 104
    Width = 193
    Height = 21
    TabOrder = 3
  end
  object Ebooks: TEdit
    Left = 8
    Top = 144
    Width = 668
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object BGo: TButton
    Left = 646
    Top = 559
    Width = 109
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Exec'
    TabOrder = 5
    OnClick = BGoClick
  end
  object BOpzoeken: TButton
    Left = 679
    Top = 144
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Opzoeken'
    TabOrder = 6
    OnClick = BOpzoekenClick
  end
  object Memo1: TMemo
    Left = 236
    Top = 20
    Width = 516
    Height = 109
    Anchors = [akLeft, akTop, akRight]
    ScrollBars = ssBoth
    TabOrder = 7
    WordWrap = False
  end
  object ZConnection1: TUniconnection
    Protocol = 'firebird-1.5'
    Left = 592
    Top = 24
  end
  object ZSQLProcessor1: TUniScript
    Params = <>
    Connection = ZConnection1
    DelimiterType = dtSetTerm
    Delimiter = ';'
    OnError = ZSQLProcessor1Error
    Left = 476
    Top = 24
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.fdb'
    Filter = 'Firebird|*.fdb|All|*.*'
    Left = 320
    Top = 44
  end
end
