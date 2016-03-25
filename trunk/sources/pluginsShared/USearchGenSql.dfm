object GenSearchSqlFrom: TGenSearchSqlFrom
  Left = 102
  Top = 194
  Caption = 'Search'
  ClientHeight = 347
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 65
    Align = alTop
    TabOrder = 0
    DesignSize = (
      709
      65)
    object BSearch: TButton
      Left = 533
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Search'
      TabOrder = 2
      OnClick = BSearchClick
    end
    object cbParams: TComboBox
      Left = 33
      Top = 20
      Width = 153
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbParamsChange
    end
    object EParams: TEdit
      Left = 208
      Top = 20
      Width = 289
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = EParamsChange
      OnKeyPress = EParamsKeyPress
    end
  end
  object PBotom: TPanel
    Left = 0
    Top = 314
    Width = 709
    Height = 33
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      709
      33)
    object btnok: TBitBtn
      Left = 473
      Top = 4
      Width = 109
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'ok'
      DoubleBuffered = True
      ModalResult = 1
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object btncancel: TBitBtn
      Left = 589
      Top = 4
      Width = 119
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'cancel'
      DoubleBuffered = True
      ModalResult = 2
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 709
    Height = 249
    Align = alClient
    DataSource = dsSearch
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
  end
  object ZQSearch: TUniQuery
    DataTypeMap = <>
    Left = 156
    Top = 96
  end
  object dsSearch: TDataSource
    DataSet = ZQSearch
    Left = 252
    Top = 112
  end
end
