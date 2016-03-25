object fmScriptMain: TfmScriptMain
  Left = 128
  Top = 63
  Width = 530
  Height = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 332
    Width = 522
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 522
    Height = 332
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = Memo1Change
  end
  object Memo2: TMemo
    Left = 0
    Top = 335
    Width = 522
    Height = 77
    Align = alBottom
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 32
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
        OnClick = New1Click
      end
      object Open1: TMenuItem
        Caption = '&Open...'
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = '&Save'
        OnClick = Save1Click
      end
      object SaveAs1: TMenuItem
        Caption = 'Save &As...'
        OnClick = SaveAs1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Toosl1: TMenuItem
      Caption = '&Script'
      object Compile1: TMenuItem
        Caption = '&Run'
        ShortCut = 120
        OnClick = Compile1Click
      end
      object Stop1: TMenuItem
        Caption = '&Stop'
        ShortCut = 16497
        OnClick = Stop1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'tcs'
    FileName = '*.tcs'
    Filter = 'Turbo Cash Script (*.tcs)|*.tcs'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist]
    Left = 142
    Top = 32
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'tcs'
    FileName = '*.tcs'
    Filter = 'Turbo Cash Script (*.tcs)|*.tcs'
    Options = [ofHideReadOnly, ofPathMustExist]
    Left = 180
    Top = 32
  end
end
