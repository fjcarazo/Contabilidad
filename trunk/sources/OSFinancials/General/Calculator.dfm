object frmCalculator: TfrmCalculator
  Left = 269
  Top = 127
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calculator'
  ClientHeight = 251
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 36
    Top = 8
    Width = 260
    Height = 27
  end
  object ScrDisplay: TLabel
    Left = 56
    Top = 10
    Width = 238
    Height = 22
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblMem: TLabel
    Left = 37
    Top = 10
    Width = 19
    Height = 22
    AutoSize = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object btnMc: TBitBtn
    Left = 53
    Top = 87
    Width = 35
    Height = 31
    Caption = 'MC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TabStop = False
    OnClick = btnMcClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnMr: TBitBtn
    Left = 53
    Top = 122
    Width = 35
    Height = 31
    Caption = 'MR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = False
    OnClick = btnMrClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnTcm: TBitBtn
    Left = 53
    Top = 158
    Width = 35
    Height = 31
    Caption = 'TcM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TabStop = False
    OnClick = btnTcmClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnMp: TBitBtn
    Left = 53
    Top = 193
    Width = 35
    Height = 31
    Caption = 'M+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TabStop = False
    OnClick = btnMpClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn7: TBitBtn
    Left = 100
    Top = 87
    Width = 35
    Height = 31
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn4: TBitBtn
    Left = 99
    Top = 122
    Width = 35
    Height = 31
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn1: TBitBtn
    Left = 99
    Top = 158
    Width = 35
    Height = 31
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn0: TBitBtn
    Left = 99
    Top = 193
    Width = 35
    Height = 31
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn8: TBitBtn
    Left = 138
    Top = 87
    Width = 35
    Height = 31
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn5: TBitBtn
    Left = 138
    Top = 122
    Width = 35
    Height = 31
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn2: TBitBtn
    Left = 138
    Top = 158
    Width = 35
    Height = 31
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnpsms: TBitBtn
    Left = 138
    Top = 193
    Width = 35
    Height = 31
    Caption = '-/+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    TabStop = False
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn9: TBitBtn
    Left = 177
    Top = 87
    Width = 35
    Height = 31
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn6: TBitBtn
    Left = 177
    Top = 122
    Width = 35
    Height = 31
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btn3: TBitBtn
    Left = 178
    Top = 158
    Width = 35
    Height = 31
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnDot: TBitBtn
    Left = 177
    Top = 193
    Width = 35
    Height = 31
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnDiv: TBitBtn
    Left = 222
    Top = 87
    Width = 35
    Height = 31
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnTimes: TBitBtn
    Left = 222
    Top = 122
    Width = 35
    Height = 31
    Caption = '*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnMinus: TBitBtn
    Left = 222
    Top = 158
    Width = 35
    Height = 31
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnPlus: TBitBtn
    Left = 222
    Top = 193
    Width = 35
    Height = 31
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnSqrt: TBitBtn
    Left = 261
    Top = 87
    Width = 35
    Height = 31
    Hint = 'Keyboard equivalent= R'
    Caption = 'sqrt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    TabStop = False
    OnClick = BtnSqrtClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BitBtn22: TBitBtn
    Left = 261
    Top = 122
    Width = 35
    Height = 31
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    TabStop = False
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnInv: TBitBtn
    Left = 261
    Top = 158
    Width = 35
    Height = 31
    Hint = 'Keyboard equivalent= X'
    Caption = '1/x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    TabStop = False
    OnClick = BtnInvClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnEqual: TBitBtn
    Left = 261
    Top = 193
    Width = 35
    Height = 31
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    TabStop = False
    OnClick = BtnEqualClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnClear: TBitBtn
    Left = 168
    Top = 50
    Width = 63
    Height = 25
    Caption = 'CA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 24
    TabStop = False
    OnClick = BtnClearClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnTrans: TBitBtn
    Left = 233
    Top = 50
    Width = 63
    Height = 25
    Hint = 'Transafert Result to TurboCASH'
    Caption = 'Transfer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
    TabStop = False
    OnClick = BtnTransClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnBackSp: TBitBtn
    Left = 101
    Top = 50
    Width = 63
    Height = 25
    Caption = 'Backspace'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 26
    TabStop = False
    OnClick = BtnBackSpClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object btnOpP: TBitBtn
    Left = 5
    Top = 87
    Width = 35
    Height = 31
    Caption = '('
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnClp: TBitBtn
    Left = 5
    Top = 122
    Width = 35
    Height = 31
    Caption = ')'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 28
    TabStop = False
    OnClick = btn0Click
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnSum: TBitBtn
    Left = 5
    Top = 158
    Width = 35
    Height = 31
    Hint = 'Keyboard equivalent= S'
    Caption = 'Sum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 29
    TabStop = False
    OnClick = BtnSumClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnAvg: TBitBtn
    Left = 5
    Top = 193
    Width = 35
    Height = 31
    Hint = 'Keyboard equivalent= A'
    Caption = 'Avg'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 30
    TabStop = False
    OnClick = BtnAvgClick
    OnKeyPress = FormKeyPress
    OnKeyUp = FormKeyUp
  end
  object BtnFocus: TBitBtn
    Left = 0
    Top = 0
    Width = 1
    Height = 1
    Caption = 'BtnFocus'
    TabOrder = 31
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 232
    Width = 303
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Width = 150
      end
      item
        Alignment = taRightJustify
        Width = 20
      end>
  end
end
