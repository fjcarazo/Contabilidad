inherited fmBalanceSheetOptions: TfmBalanceSheetOptions
  Left = 285
  Top = 150
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = 'Balance Sheet Options'
  ClientHeight = 226
  ClientWidth = 460
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PPrintoptions: TPanel
    Width = 460
    TabOrder = 2
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 57
    Width = 460
    Height = 135
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 80
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'From'
    end
    object Label2: TLabel
      Left = 273
      Top = 80
      Width = 9
      Height = 13
      Alignment = taRightJustify
      Caption = 'to'
    end
    object Label3: TLabel
      Left = 12
      Top = 49
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sequence'
    end
    object Label4: TLabel
      Left = 223
      Top = 20
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Which Year'
    end
    object dbcboxShowSubAccounts: TCheckBox
      Left = 16
      Top = 106
      Width = 193
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Display Sub-Accounts'
      TabOrder = 5
      OnKeyDown = FormKeyDown
      OnKeyPress = edtFromDateKeyPress
    end
    object dbcboxIncNilBal: TCheckBox
      Left = 285
      Top = 106
      Width = 164
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Include Nil Balances'
      TabOrder = 6
      OnKeyDown = FormKeyDown
      OnKeyPress = edtFromDateKeyPress
    end
    object dbcomboxSequence: TComboBox
      Left = 67
      Top = 47
      Width = 142
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnKeyDown = FormKeyDown
      OnKeyPress = edtFromDateKeyPress
      Items.Strings = (
        'Account Number'
        'Account Decription')
    end
    object edtFromDate: TEdit
      Left = 67
      Top = 77
      Width = 118
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
      Text = 'edtFromDate'
      OnKeyDown = FormKeyDown
      OnKeyPress = edtFromDateKeyPress
    end
    object edtToDate: TEdit
      Left = 287
      Top = 77
      Width = 138
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
      Text = 'edtToDate'
      OnKeyDown = FormKeyDown
      OnKeyPress = edtFromDateKeyPress
    end
    object BitBtn1: TBitBtn
      Left = 186
      Top = 77
      Width = 24
      Height = 19
      TabOrder = 2
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
    object BitBtn2: TBitBtn
      Left = 422
      Top = 77
      Width = 24
      Height = 19
      TabOrder = 4
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
    object dbcomboxWhichYear: TComboBox
      Left = 286
      Top = 14
      Width = 163
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnChange = dbcomboxWhichYearChange
      Items.Strings = (
        'This Year'
        'Last Year')
    end
  end
  inherited ButtonPanel: TPanel
    Top = 192
    Width = 460
    inherited BtnOk: TBitBtn
      OnClick = BtnOkClick
    end
    inherited BtnCancel: TBitBtn
      OnClick = BtnCancelClick
    end
  end
end
