inherited fmBackorderParams: TfmBackorderParams
  Left = 42
  Top = 246
  Width = 459
  Caption = 'Backorder'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 17
    Top = 78
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'From '
  end
  object Label4: TLabel [1]
    Left = 20
    Top = 101
    Width = 13
    Height = 13
    Alignment = taRightJustify
    Caption = 'To'
  end
  inherited PPrintoptions: TPanel
    Width = 451
  end
  inherited ButtonPanel: TPanel
    Width = 451
    inherited BtnOk: TBitBtn
      Left = 244
      OnClick = BtnOkClick
    end
    inherited BtnCancel: TBitBtn
      Left = 340
      OnClick = BtnCancelClick
    end
  end
  object dbedtFromAccount: TEdit
    Left = 46
    Top = 76
    Width = 172
    Height = 21
    TabStop = False
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 223
    Top = 76
    Width = 24
    Height = 19
    TabOrder = 3
    OnClick = BitBtn2Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000A56D39A56D39
      A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
      39A56D39A56D39A56D39A56D39A592ADA59EC6A56D39A56D39A56D39A56D39A5
      6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A582ADA59EDE
      AD82BDCEC3C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
      39A56D39A56D39A56D39A56D399CD3FFBD9EEFAD82BDC6B2BDA56D39A56D39A5
      6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
      A5CFF7B5A2F7A58EC6D6C3CEA56D39A56D39A56D39A56D39A56D39A56D39A56D
      39A56D39A56D39A56D39A56D39A56D39A56D39ADCFFFBDA2EFA582B5CEC3CEA5
      6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
      A56D39A56D39A5C3F7ADAEDEA5A2ADD6BEC6CEB2C6D6B2A5DEC3B5DEC3B5BDA2
      C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39C6A29CDE
      BE9CFFEFBDFFFFD6FFFFD6FFFFDEF7EFD6BDA2C6A56D39A56D39A56D39A56D39
      A56D39A56D39A56D39A56D39D6AE9CEFDFB5FFF3C6FFFFD6FFFFDEFFFFDEFFFF
      DEDECFBDBDA2C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39EFCFADFF
      EFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFFDEF7F3D6E7CFC6A56D39A56D39A56D39
      A56D39A56D39A56D39C6B2ADF7E3BDFFDFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFF
      DEF7F3D6F7E3C6A56D39A56D39A56D39A56D39A56D39A56D39CEB2ADF7E3BDFF
      E3B5FFE3BDFFFFC6FFFFD6FFFFDEFFFFD6FFFFCEF7E3C6A56D39A56D39A56D39
      A56D39A56D39A56D39A56D39F7DFC6FFEFCEFFE3C6FFE3B5FFEFBDFFF3C6F7F3
      C6FFEFC6F7CFB5A56D39A56D39A56D39A56D39A56D39A56D39A56D39DEBEB5FF
      FFDEFFFFDEFFE3BDF7DFB5F7E3B5FFEFBDDEC3A5C6A2C6A56D39A56D39A56D39
      A56D39A56D39A56D39A56D39A56D39DEC3BDF7F3D6FFEFCEFFEFC6F7E3BDE7C3
      A5D6C3BDA56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A5
      6D39A56D39A56D39D6B2A5D6B2ADBDA28CA56D39A56D39A56D39}
  end
  object dbedtToAccount: TEdit
    Left = 45
    Top = 100
    Width = 172
    Height = 21
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 100
    Width = 24
    Height = 19
    TabOrder = 5
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000A56D39A56D39
      A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
      39A56D39A56D39A56D39A56D39A592ADA59EC6A56D39A56D39A56D39A56D39A5
      6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A582ADA59EDE
      AD82BDCEC3C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
      39A56D39A56D39A56D39A56D399CD3FFBD9EEFAD82BDC6B2BDA56D39A56D39A5
      6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
      A5CFF7B5A2F7A58EC6D6C3CEA56D39A56D39A56D39A56D39A56D39A56D39A56D
      39A56D39A56D39A56D39A56D39A56D39A56D39ADCFFFBDA2EFA582B5CEC3CEA5
      6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
      A56D39A56D39A5C3F7ADAEDEA5A2ADD6BEC6CEB2C6D6B2A5DEC3B5DEC3B5BDA2
      C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39C6A29CDE
      BE9CFFEFBDFFFFD6FFFFD6FFFFDEF7EFD6BDA2C6A56D39A56D39A56D39A56D39
      A56D39A56D39A56D39A56D39D6AE9CEFDFB5FFF3C6FFFFD6FFFFDEFFFFDEFFFF
      DEDECFBDBDA2C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39EFCFADFF
      EFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFFDEF7F3D6E7CFC6A56D39A56D39A56D39
      A56D39A56D39A56D39C6B2ADF7E3BDFFDFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFF
      DEF7F3D6F7E3C6A56D39A56D39A56D39A56D39A56D39A56D39CEB2ADF7E3BDFF
      E3B5FFE3BDFFFFC6FFFFD6FFFFDEFFFFD6FFFFCEF7E3C6A56D39A56D39A56D39
      A56D39A56D39A56D39A56D39F7DFC6FFEFCEFFE3C6FFE3B5FFEFBDFFF3C6F7F3
      C6FFEFC6F7CFB5A56D39A56D39A56D39A56D39A56D39A56D39A56D39DEBEB5FF
      FFDEFFFFDEFFE3BDF7DFB5F7E3B5FFEFBDDEC3A5C6A2C6A56D39A56D39A56D39
      A56D39A56D39A56D39A56D39A56D39DEC3BDF7F3D6FFEFCEFFEFC6F7E3BDE7C3
      A5D6C3BDA56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A5
      6D39A56D39A56D39D6B2A5D6B2ADBDA28CA56D39A56D39A56D39}
  end
end
