object fmIntroScreen: TfmIntroScreen
  Left = 534
  Top = 306
  BorderStyle = bsNone
  ClientHeight = 33
  ClientWidth = 330
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge: TGauge
    Left = 0
    Top = 23
    Width = 330
    Height = 10
    Align = alBottom
    BorderStyle = bsNone
    Color = 10246741
    ForeColor = 50935
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Progress = 0
  end
  object Label1: TLabel
    Left = 141
    Top = 4
    Width = 58
    Height = 16
    Caption = 'Loading...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 313
    Height = 1
    AutoSize = True
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2
    OnTimer = Timer1Timer
    Left = 200
    Top = 8
  end
end
