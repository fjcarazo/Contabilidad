object fmPosInvoiceInfo: TfmPosInvoiceInfo
  Left = 284
  Top = 232
  BorderStyle = bsDialog
  Caption = 'Select Customer'
  ClientHeight = 300
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape5: TShape
    Left = 208
    Top = 182
    Width = 203
    Height = 94
    Brush.Color = clBtnShadow
    Shape = stRoundRect
  end
  object Shape4: TShape
    Left = 2
    Top = 182
    Width = 203
    Height = 94
    Brush.Color = clBtnShadow
    Shape = stRoundRect
  end
  object Shape1: TShape
    Left = 4
    Top = 35
    Width = 203
    Height = 139
    Brush.Color = clBtnShadow
    Shape = stRoundRect
  end
  object Image2: TImage
    Left = 12
    Top = 39
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FFFFFFFFFF848484848484848484848484848484848484848484848484848484
      848484848484848484848484000000FFFFFFFFFFFF84848400FFFFC6C6C600FF
      FFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF848484000000FF
      FFFFFFFFFF84848400000000FFFFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF
      C6C6C600FFFF000000848484000000FFFFFFFFFFFF84848400FFFF00000000FF
      FFC6C6C600FFFF00000000FFFFC6C6C600FFFF00000000FFFF848484000000FF
      FFFFFFFFFF848484FFFFFF00FFFF00000000FFFF00000000FFFF00000000FFFF
      00000000FFFFC6C6C6848484000000FFFFFFFFFFFF84848400FFFFC6C6C600FF
      FF00000000FFFFC6C6C600FFFF00000000FFFFC6C6C600FFFF848484000000FF
      FFFFFFFFFF848484FFFFFF00FFFF00000000FFFFC6C6C600FFFFC6C6C600FFFF
      00000000FFFFC6C6C6848484000000FFFFFFFFFFFF84848400FFFF00000000FF
      FFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF00000000FFFF848484000000FF
      FFFFFFFFFF84848400000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
      FFFFFF00FFFF000000848484000000FFFFFFFFFFFF8484848484848484848484
      84848484848484848484848484848484848484848484848484848484FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF}
    Transparent = True
  end
  object Label14: TLabel
    Left = 32
    Top = 38
    Width = 85
    Height = 13
    Caption = 'Postal Address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape2: TShape
    Left = 208
    Top = 35
    Width = 203
    Height = 139
    Brush.Color = clBtnShadow
    Shape = stRoundRect
  end
  object Shape3: TShape
    Left = 0
    Top = 0
    Width = 419
    Height = 26
    Align = alTop
  end
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 47
    Height = 13
    Caption = 'Customer '
    Transparent = True
  end
  object lblCustName: TLabel
    Left = 225
    Top = 6
    Width = 59
    Height = 13
    Caption = 'lblCustName'
    Transparent = True
  end
  object Label15: TLabel
    Left = 241
    Top = 41
    Width = 96
    Height = 13
    Caption = 'Delivery Address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label19: TLabel
    Left = 32
    Top = 185
    Width = 51
    Height = 13
    Caption = 'Message'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label16: TLabel
    Left = 211
    Top = 201
    Width = 76
    Height = 13
    Caption = 'Current Balance'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label18: TLabel
    Left = 211
    Top = 225
    Width = 43
    Height = 13
    Caption = 'Available'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label17: TLabel
    Left = 211
    Top = 242
    Width = 51
    Height = 13
    Caption = 'Credit Limit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object ShdlblPostBal: TLabel
    Left = 302
    Top = 204
    Width = 91
    Height = 13
    AutoSize = False
    Caption = '           '
    Color = clBlack
    ParentColor = False
  end
  object ShdlblAvailable: TLabel
    Left = 302
    Top = 224
    Width = 91
    Height = 15
    AutoSize = False
    Caption = '                   '
    Color = clBlack
    ParentColor = False
  end
  object ShdlblCredLimit: TLabel
    Left = 302
    Top = 242
    Width = 91
    Height = 16
    AutoSize = False
    Caption = '                  '
    Color = clBlack
    ParentColor = False
  end
  object SpeedButton1: TSpeedButton
    Left = 189
    Top = 2
    Width = 23
    Height = 22
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FFFFFF7BF7F7
      7BF7F77BF7F77BF7F77BF7F77BF7F77BF7F77BF7F7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF7BF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      FF0000FF0000FF0000FF0000FF0000FFFFFF7BF7F7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF
      FFFF7BF7F7000000000000000000000000000000000000000000FFFFFFFF0000
      FF0000FF0000FF0000FF0000FF0000FFFFFF7BF7F7BD7B7BBD7B7BBD7B7BBD7B
      7BBD7B7BBD7B7B000000FFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF
      FFFF7BF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD7B7B000000FFFFFFFF0000
      FF0000FF0000FF0000FF0000FF0000FFFFFF7BF7F7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFBD7B7B000000FFFFFFFF0000FF0000FF0000FF0000FF0000FF0000FF
      FFFF7BF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD7B7B000000FFFFFFFF0000
      FF0000FF0000FF0000FFFFFF7BF7F77BF7F77BF7F7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFBD7B7B000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B
      F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD7B7B000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF7BF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFBD7B7B000000FFFFFFFFFFFFBD7B7BFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD7B7B000000FFFFFFFFFFFF
      BD7B7B7BF7F77BF7F77BF7F77BF7F77BF7F77BF7F77BF7F77BF7F77BF7F77BF7
      F77BF7F7BD7B7B000000FFFFFFFFFFFFBD7B7BFF000000F7007B00007B00007B
      00007B00007B0000000000000000000000000000000000000000FFFFFFFFFFFF
      BD7B7B0000F700F7F77B00007B00007B00007B00007B0000BD7B7B000000BD7B
      7BBD7B7B000000000000FFFFFFFFFFFFBD7B7BBD7B7BBD7B7BBD7B7BBD7B7BBD
      7B7BBD7B7BBD7B7BBD7B7BBD7B7BBD7B7BBD7B7BBD7B7B000000}
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 57
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 8
    Top = 78
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
  end
  object Edit3: TEdit
    Left = 8
    Top = 99
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 2
    OnKeyPress = Edit1KeyPress
  end
  object Edit4: TEdit
    Left = 8
    Top = 120
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 3
    OnKeyPress = Edit1KeyPress
  end
  object Edit9: TEdit
    Left = 6
    Top = 200
    Width = 195
    Height = 21
    TabStop = False
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 4
  end
  object Edit10: TEdit
    Left = 6
    Top = 221
    Width = 195
    Height = 21
    TabStop = False
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 5
  end
  object Edit11: TEdit
    Left = 6
    Top = 242
    Width = 195
    Height = 21
    TabStop = False
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 6
  end
  object Edit5: TEdit
    Left = 212
    Top = 58
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 7
    OnKeyPress = Edit1KeyPress
  end
  object Edit6: TEdit
    Left = 212
    Top = 79
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 8
    OnKeyPress = Edit1KeyPress
  end
  object Edit7: TEdit
    Left = 212
    Top = 100
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 9
    OnKeyPress = Edit1KeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 281
    Width = 419
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Press <ESC> to close'
  end
  object lblPostBal: TStaticText
    Left = 299
    Top = 201
    Width = 91
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = '0.00 '
    Color = clWhite
    ParentColor = False
    TabOrder = 11
  end
  object lblAvailable: TStaticText
    Left = 299
    Top = 223
    Width = 91
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = '0.00 '
    Color = clWhite
    ParentColor = False
    TabOrder = 12
  end
  object lblCredLimit: TStaticText
    Left = 299
    Top = 241
    Width = 91
    Height = 14
    Alignment = taRightJustify
    AutoSize = False
    BorderStyle = sbsSingle
    Caption = '0.00 '
    Color = clWhite
    ParentColor = False
    TabOrder = 13
  end
  object Edit8: TEdit
    Left = 212
    Top = 121
    Width = 195
    Height = 21
    AutoSize = False
    BorderStyle = bsNone
    TabOrder = 14
    OnKeyPress = Edit1KeyPress
  end
  object CBCountry: TComboBox
    Left = 7
    Top = 141
    Width = 197
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 15
  end
  object CBDelCountry: TComboBox
    Left = 211
    Top = 141
    Width = 197
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 16
  end
  object edtCustCode: TcxButtonEdit
    Left = 62
    Top = 3
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 17
    Text = 'edtCustCode'
    OnKeyPress = Edit1KeyPress
    Width = 121
  end
end
