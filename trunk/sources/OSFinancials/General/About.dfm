object fmAbout: TfmAbout
  Left = 384
  Top = 197
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'About osFinancials'
  ClientHeight = 642
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    502
    642)
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TBitBtn
    Left = 390
    Top = 607
    Width = 103
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF84CA8454B757ADDBADFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81CA8152D47A72F4A53E
      B850FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF8CD08C4BCD6D74F09777F08D63E69269BE6AFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87CF864ACC6B6FEB9476EE8A77F08C72
      F19244C561FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CCC7B
      4BCE6F69E48B70E78573F19C74F39C72EF8865EA944DB651FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF95D7954ACE6E61DA7F68DE7D68E89742BD5044C55E70
      F19468E9824DD27497D297FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53C3575CD887
      5FD47362E39144BD4FFFFFFF79C97960E48E68E87D5FE6863DB84DFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF7CD07C4ED27555D88047BE50FFFFFFFFFFFFFFFFFF40
      BE5067EC8F5BDF6F53DC815CBB5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDA9B
      91D690FFFFFFFFFFFFFFFFFFFFFFFF92D49252D87B5BE07351D96A44CA689CD5
      9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF4EBC535BE3894ED55F4DD9733BB84DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FC25653DC7644CE554DD8
      7A4BB750FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF8FD38F49D16F47D15F44CE5749D27471C471FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DC15F4DD87A43CD
      5547D26241C661A6D9A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF46BC4D4DD97A42CC524EDA7952BA56FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FBD
      4C4FDB7E49D37472C673FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC56A85CE85F1F7F1}
    ModalResult = 1
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = OKButtonClick
    ExplicitLeft = 341
    ExplicitTop = 327
  end
  object Panel1: TPanel
    Left = 2
    Top = 3
    Width = 496
    Height = 598
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    ExplicitWidth = 447
    ExplicitHeight = 318
    DesignSize = (
      496
      598)
    object ProductName2: TLabel
      Left = 7
      Top = 4
      Width = 118
      Height = 24
      Caption = 'osFinancials'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object ProductName: TLabel
      Left = 10
      Top = 7
      Width = 118
      Height = 24
      Caption = 'osFinancials'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object Version: TLabel
      Left = 16
      Top = 36
      Width = 63
      Height = 13
      Caption = 'Version xxxxx'
      IsControl = True
    end
    object Copyright: TLabel
      Left = 16
      Top = 60
      Width = 58
      Height = 13
      Caption = 'GPL licence'
      IsControl = True
    end
    object LDate: TLabel
      Left = 16
      Top = 86
      Width = 66
      Height = 13
      Caption = '01 - 02 - 2006'
    end
    object Bevel1: TBevel
      Left = 8
      Top = 134
      Width = 210
      Height = 10
      Shape = bsBottomLine
    end
    object Label3: TLabel
      Left = 16
      Top = 120
      Width = 125
      Height = 13
      Cursor = crHandPoint
      Caption = 'http://www.osfinacials.org'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label3Click
    end
    object LblWinVer: TLabel
      Left = 60
      Top = 148
      Width = 135
      Height = 13
      AutoSize = False
      Caption = 'LblWinVer'
    end
    object Label2: TLabel
      Left = 14
      Top = 146
      Width = 43
      Height = 13
      Caption = 'System : '
    end
    object Label4: TLabel
      Left = 16
      Top = 168
      Width = 28
      Height = 13
      Caption = 'User: '
    end
    object LblOsUser: TLabel
      Left = 60
      Top = 168
      Width = 135
      Height = 13
      AutoSize = False
      Caption = 'LblWinVer'
    end
    object Label5: TLabel
      Left = 16
      Top = 106
      Width = 28
      Height = 13
      Caption = 'User: '
    end
    object SystemInfo: TMemo
      Left = 16
      Top = 192
      Width = 475
      Height = 145
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'SystemInfo')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 17
      Top = 343
      Width = 474
      Height = 241
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'Special Thanks to'
        '*Free Barcode Component'
        '*DCPcrypt David Barton '
        '*TLCDLabel  Amitron Electronics  Peter Czidlina'
        '*Fast Memory   http://fastmm.sourceforge.net'
        '*Reportman Toni Martir'
        '*TurboPower Visual PlanIt '
        '*TurboPower abbrevia http://tpabbrevia.sourceforge.net/'
        ''
        'Closedsource'
        
          '*Quantumgrid http://www.devexpress.com/products/vcl/exquantumgri' +
          'd/'
        '*Unidac http://www.devart.com/unidac/'
        ''
        'Compiled by Delphidreams Pieter Valentijn')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end
