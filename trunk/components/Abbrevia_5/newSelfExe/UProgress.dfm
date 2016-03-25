object fmProgress: TfmProgress
  Left = 0
  Top = 0
  Caption = 'Progress'
  ClientHeight = 166
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    434
    166)
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 76
    Width = 418
    Height = 25
    MarqueeInterval = 1
    TabOrder = 0
  end
  object bStop: TBitBtn
    Left = 160
    Top = 124
    Width = 105
    Height = 34
    Caption = 'Abort'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = bStopClick
  end
  object mExtra: TMemo
    Left = 8
    Top = 8
    Width = 418
    Height = 57
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBtnFace
    TabOrder = 2
  end
end
