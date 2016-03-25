object FLookupTrans: TFLookupTrans
  Left = 74
  Top = 148
  Width = 461
  Height = 407
  Caption = 'FLookupTrans'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  DesignSize = (
    453
    373)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 301
    Top = 23
    Width = 63
    Height = 22
    Anchors = [akTop, akRight]
    Caption = 'Search'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object lvITems: TListView
    Left = 28
    Top = 52
    Width = 408
    Height = 275
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Caption = 'Description'
        Width = 500
      end
      item
        Caption = 'English'
        Width = 500
      end>
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = lvITemsDblClick
    OnKeyPress = lvITemsKeyPress
  end
  object EFindText: TEdit
    Left = 28
    Top = 24
    Width = 265
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    OnKeyPress = EFindTextKeyPress
  end
  object Bok: TButton
    Left = 363
    Top = 338
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 3
  end
  object BAddTrn: TButton
    Left = 372
    Top = 24
    Width = 73
    Height = 21
    Caption = 'Add  as new'
    TabOrder = 4
    OnClick = BAddTrnClick
  end
end
