object FSelectSearch: TFSelectSearch
  Left = 80
  Top = 145
  Width = 391
  Height = 440
  Caption = 'Search type'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  DesignSize = (
    383
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 16
    Top = 28
    Width = 350
    Height = 325
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object Bok: TButton
    Left = 293
    Top = 363
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    TabOrder = 1
  end
  object ZQGetList: TuniQuery
    SQL.Strings = (
      'SELECT distinct(SSEARCHFORM)'
      'FROM OSF_EDIT_FORM where SMASTERTABLE = :MASTERTABLE')
    Params = <
      item
        DataType = ftUnknown
        Name = 'MASTERTABLE'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MASTERTABLE'
        ParamType = ptUnknown
      end>
  end
end
