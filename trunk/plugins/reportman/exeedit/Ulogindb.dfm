object fmLoginDB: TfmLoginDB
  Left = 530
  Top = 308
  Caption = 'fmLoginDB'
  ClientHeight = 363
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    510
    363)
  PixelsPerInch = 96
  TextHeight = 13
  object pcmainsetup: TPageControl
    Left = 12
    Top = 12
    Width = 489
    Height = 297
    ActivePage = tsdatabase
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tsdatabase: TTabSheet
      Caption = 'Database'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Username'
      end
      object Label2: TLabel
        Left = 8
        Top = 48
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object Label3: TLabel
        Left = 8
        Top = 88
        Width = 46
        Height = 13
        Caption = 'Database'
      end
      object Label4: TLabel
        Left = 8
        Top = 128
        Width = 31
        Height = 13
        Caption = 'Server'
      end
      object Label5: TLabel
        Left = 8
        Top = 208
        Width = 39
        Height = 13
        Caption = 'Protocol'
      end
      object Label12: TLabel
        Left = 8
        Top = 168
        Width = 19
        Height = 13
        Caption = 'Port'
      end
      object EUsername: TEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'sysdba'
      end
      object EPassword: TEdit
        Left = 8
        Top = 64
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'masterkey'
      end
      object EDatabase: TEdit
        Left = 8
        Top = 101
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'E:\osfinancials\books\VOORBEELD_A_2010\books.fdb'
      end
      object EServer: TEdit
        Left = 8
        Top = 144
        Width = 121
        Height = 21
        TabOrder = 3
        Text = '127.0.0.1'
      end
      object cbProtocol: TComboBox
        Left = 8
        Top = 224
        Width = 161
        Height = 21
        TabOrder = 4
        Items.Strings = (
          'InterBase'
          'oracle'
          'mysql')
      end
      object EPort: TEdit
        Left = 8
        Top = 184
        Width = 121
        Height = 21
        TabOrder = 5
        Text = '0'
      end
    end
    object tslog: TTabSheet
      Caption = 'Log'
      ImageIndex = 2
      TabVisible = False
      DesignSize = (
        481
        269)
      object MLog: TMemo
        Left = 4
        Top = 5
        Width = 471
        Height = 256
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
  end
  object btnOpen: TBitBtn
    Left = 12
    Top = 316
    Width = 75
    Height = 25
    Caption = 'Edit'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btnOpenClick
  end
end
