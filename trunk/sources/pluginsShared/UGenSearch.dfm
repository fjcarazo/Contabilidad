object GenSearch: TGenSearch
  Left = 191
  Top = 191
  Caption = 'Search'
  ClientHeight = 511
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 209
    Width = 581
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 589
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 212
    Width = 581
    Height = 258
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 470
    Width = 581
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      581
      41)
    object BClose: TBitBtn
      Left = 481
      Top = 8
      Width = 99
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      DoubleBuffered = True
      ModalResult = 1
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object PSearch: TPanel
    Left = 0
    Top = 0
    Width = 581
    Height = 209
    Align = alTop
    TabOrder = 2
  end
  object ZQGenSearch: TUniQuery
    DataTypeMap = <>
    Left = 108
    Top = 148
  end
  object DataSource1: TDataSource
    DataSet = ZQGenSearch
    Left = 152
    Top = 308
  end
end
