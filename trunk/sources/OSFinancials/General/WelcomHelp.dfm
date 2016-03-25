object FrmWelcome: TFrmWelcome
  Left = 224
  Top = 146
  BorderStyle = bsToolWindow
  Caption = 'Welcome To osFinancials'
  ClientHeight = 439
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    767
    439)
  PixelsPerInch = 96
  TextHeight = 16
  object cbhide: TCheckBox
    Left = 52
    Top = 424
    Width = 13
    Height = 13
    Anchors = [akLeft, akBottom]
    Checked = True
    State = cbChecked
    TabOrder = 0
  end
  object stDisable: TStaticText
    Left = 72
    Top = 424
    Width = 66
    Height = 20
    Anchors = [akLeft, akBottom]
    Caption = 'stDisable'
    TabOrder = 1
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 767
    Height = 439
    Align = alClient
    TabOrder = 2
    ExplicitTop = -2
    ControlData = {
      4C000000464F00005F2D00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620E000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object GetUrlTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = GetUrlTimerTimer
    Left = 84
    Top = 40
  end
end
