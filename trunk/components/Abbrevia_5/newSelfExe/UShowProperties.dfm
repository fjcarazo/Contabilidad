object fmProperties: TfmProperties
  Left = 0
  Top = 0
  Caption = 'osFinancials Backup File'
  ClientHeight = 371
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    392
    371)
  PixelsPerInch = 96
  TextHeight = 13
  object lCaption: TLabel
    Left = 24
    Top = 32
    Width = 39
    Height = 13
    Caption = 'lCaption'
  end
  object lExtractTo: TLabel
    Left = 24
    Top = 262
    Width = 48
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Extract to'
    ExplicitTop = 143
  end
  object bCancel: TButton
    Left = 24
    Top = 316
    Width = 97
    Height = 41
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
  end
  object bOk: TButton
    Left = 264
    Top = 316
    Width = 108
    Height = 41
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = bOkClick
  end
  object mExtra: TMemo
    Left = 24
    Top = 51
    Width = 348
    Height = 205
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 24
    Top = 281
    Width = 348
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    Text = 'Edit1'
  end
end
