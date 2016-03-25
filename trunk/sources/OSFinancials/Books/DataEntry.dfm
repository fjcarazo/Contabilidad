object fmDataEntry: TfmDataEntry
  Left = 264
  Top = 284
  BorderStyle = bsSizeToolWin
  Caption = 'System Parameters'
  ClientHeight = 430
  ClientWidth = 496
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 396
    Width = 496
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnOk: TBitBtn
      Left = 278
      Top = 5
      Width = 96
      Height = 25
      Caption = '&OK'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF84CA8454B757ADDBADFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81CA8152D47A72F4A53E
        B850FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8CD08C4BCD6D74F09777F08D63E69269BE6AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87CF864ACC6B6FEB9476EE8A77F08C72
        F19244C561FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CCC7B
        4BCE6F69E48B70E78573F19C74F39C72EF8865EA944DB651FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF95D7954ACE6E61DA7F68DE7D68E89742BD5044C55E70
        F19468E9824DD27497D297FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53C3575CD887
        5FD47362E39144BD4FFFFFFF79C97960E48E68E87D5FE6863DB84DFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7CD07C4ED27555D88047BE50FFFFFFFFFFFFFFFFFF40
        BE5067EC8F5BDF6F53DC815CBB5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDA9B
        91D690FFFFFFFFFFFFFFFFFFFFFFFF92D49252D87B5BE07351D96A44CA689CD5
        9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4EBC535BE3894ED55F4DD9733BB84DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FC25653DC7644CE554DD8
        7A4BB750FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8FD38F49D16F47D15F44CE5749D27471C471FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DC15F4DD87A43CD
        5547D26241C661A6D9A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF46BC4D4DD97A42CC524EDA7952BA56FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FBD
        4C4FDB7E49D37472C673FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC56A85CE85F1F7F1}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnOkClick
      OnKeyDown = FormKeyDown
    end
    object BtnCancel: TBitBtn
      Left = 383
      Top = 5
      Width = 96
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFF8383CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8181
        C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171C64D4DD03F3FB7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF3E3EAF4242C56B6BBBFFFFFFFFFFFFFFFFFF7272C7
        4E4ED16969E26969E94040B8FFFFFFFFFFFFFFFFFFFFFFFF3D3DB04E4ED84747
        D24444C96B6BBBFFFFFF8888D14949CD6060D96868DD7070E76C6CED4040B8FF
        FFFFFFFFFF3F3FB35252DC4444CE4242CC4747D24242C68181C4FFFFFF4343BD
        5E5EDE6868DE7070E77575EE6D6DEF4040B84141B65A5AE24D4DD54343CD4242
        CD4D4DD83D3DAFFFFFFFFFFFFFFFFFFF4444BE6464E47070E77676EE7777F16C
        6CEF6363E95A5ADE4C4CD44444CE4D4DD83D3DB0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4444BE6868E97575EE7777F07272EE6767E75A5ADE4D4DD54E4ED93E3E
        B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444BF6D6DEE7777F072
        72EE6767E75A5ADE5454DE3F3FB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4444C06D6DEE7777F07272EE6767E75A5ADE5454DE3C3CB6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444C16868EA7575EE7777F072
        72EE6767E75A5ADE4D4DD54E4EDA3C3CB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        4444C26464E57070E77676EE7777F16B6BEE6363E95A5ADE4C4CD44444CE4D4D
        D93C3CB6FFFFFFFFFFFFFFFFFF4444C45E5EDF6868DE7070E77575EE6C6CEF44
        44C04444BF5A5AE34D4DD54343CD4242CC4D4DD93C3CB6FFFFFF8888D74B4BD2
        6060D96868DD7070E76B6BED4545C2FFFFFFFFFFFF4343BE5353DE4444CE4242
        CC4848D34343CA8888CDFFFFFF7474D15151D76969E26868E94646C4FFFFFFFF
        FFFFFFFFFFFFFFFF4242BD4E4EDA4848D34545CE7777C8FFFFFFFFFFFFFFFFFF
        7474D14F4FD74646C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4242BD4343
        CC7878CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787D6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DD3FFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
    end
  end
  object rgDrCrFormat: TRadioGroup
    Left = 5
    Top = 6
    Width = 198
    Height = 80
    Caption = 'Report amounts with'
    Items.Strings = (
      '<>  for Credit'
      '+/-  for Debit/Credit'
      'D/C for Debit Credit')
    TabOrder = 1
    OnClick = rgDrCrFormatClick
  end
  object BGReportingDecimals: TGroupBox
    Left = 206
    Top = 7
    Width = 279
    Height = 222
    Caption = 'Reporting Decimals'
    TabOrder = 2
    object LAmount: TLabel
      Left = 170
      Top = 24
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Amount'
    end
    object LDocQty: TLabel
      Left = 115
      Top = 78
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Document Quantity'
    end
    object LCBUseCurSign: TLabel
      Left = 121
      Top = 176
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Use currency sign'
    end
    object LCDDutchStyleNumbersToText: TLabel
      Left = 97
      Top = 195
      Width = 109
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dutch way of text num.'
    end
    object LDocRow: TLabel
      Left = 137
      Top = 54
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Document row'
    end
    object LEDocRowDecimalsShow: TLabel
      Left = 87
      Top = 103
      Width = 119
      Height = 13
      Alignment = taRightJustify
      Caption = 'Document show Quantity'
    end
    object edtDecimal: TEdit
      Left = 210
      Top = 22
      Width = 51
      Height = 21
      TabOrder = 0
    end
    object edQuantity: TEdit
      Left = 210
      Top = 72
      Width = 51
      Height = 21
      TabOrder = 1
    end
    object CBUseCurSign: TCheckBox
      Left = 207
      Top = 174
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      TabOrder = 2
    end
    object CDDutchStyleNumbersToText: TCheckBox
      Left = 207
      Top = 193
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      TabOrder = 3
    end
    object EDocRowDecimals: TEdit
      Left = 210
      Top = 48
      Width = 51
      Height = 21
      TabOrder = 4
    end
    object EDocRowDecimalsShow: TEdit
      Left = 210
      Top = 97
      Width = 51
      Height = 21
      TabOrder = 5
    end
  end
  object RGDataStorage: TGroupBox
    Left = 4
    Top = 88
    Width = 199
    Height = 73
    Caption = 'Data Storage'
    TabOrder = 3
    object rbRealBtn: TRadioButton
      Left = 9
      Top = 18
      Width = 113
      Height = 17
      Caption = 'Real Numbers'
      TabOrder = 0
      OnClick = rbRealBtnClick
    end
    object RBFixDecimals: TRadioButton
      Left = 9
      Top = 39
      Width = 113
      Height = 17
      Caption = 'Fix Decimals'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object edtNbrDec: TEdit
      Left = 142
      Top = 34
      Width = 51
      Height = 21
      TabOrder = 2
      Text = '2'
    end
  end
  object RGSpeed: TGroupBox
    Left = 4
    Top = 162
    Width = 199
    Height = 63
    Caption = 'Speed'
    TabOrder = 4
    object LCBNoCalcBatch: TLabel
      Left = 90
      Top = 17
      Width = 85
      Height = 13
      Alignment = taRightJustify
      Caption = 'Do not calc batch'
    end
    object CBNoCalcBatch: TCheckBox
      Left = 176
      Top = 16
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      TabOrder = 0
    end
  end
  object RGSpecialSettings: TGroupBox
    Left = 8
    Top = 231
    Width = 473
    Height = 153
    Caption = 'Special settings'
    TabOrder = 5
    object LCBViewAllBankStatements: TLabel
      Left = 259
      Top = 15
      Width = 117
      Height = 13
      Alignment = taRightJustify
      Caption = 'View all bank statements'
    end
    object LShowCalander: TLabel
      Left = 102
      Top = 17
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Show calendar'
    end
    object LCBNOUnpostedMessage: TLabel
      Left = 72
      Top = 33
      Width = 101
      Height = 13
      Alignment = taRightJustify
      Caption = 'No warning unposted'
    end
    object LcbContraISRef: TLabel
      Left = 56
      Top = 49
      Width = 117
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contra ref as account ref'
    end
    object LcbStrictTaxRef: TLabel
      Left = 75
      Top = 65
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = 'Strict tax on account'
    end
    object LProjects: TLabel
      Left = 135
      Top = 81
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Projects'
    end
    object LLogLevel: TLabel
      Left = 328
      Top = 39
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Log level'
    end
    object Ldivsleder: TLabel
      Left = 20
      Top = 104
      Width = 91
      Height = 13
      Caption = 'General divs ledger'
    end
    object CBViewAllBankStatements: TCheckBox
      Left = 379
      Top = 13
      Width = 17
      Height = 17
      Alignment = taLeftJustify
      TabOrder = 0
    end
    object CBShoCalendar: TCheckBox
      Left = 175
      Top = 13
      Width = 17
      Height = 22
      Alignment = taLeftJustify
      TabOrder = 1
    end
    object CBNOWarningUnposted: TCheckBox
      Left = 175
      Top = 29
      Width = 17
      Height = 22
      Alignment = taLeftJustify
      TabOrder = 2
    end
    object cbContraISRef: TCheckBox
      Left = 175
      Top = 45
      Width = 17
      Height = 22
      Alignment = taLeftJustify
      TabOrder = 3
    end
    object cbStrictTaxRef: TCheckBox
      Left = 175
      Top = 61
      Width = 17
      Height = 22
      Alignment = taLeftJustify
      TabOrder = 4
    end
    object cbProjects: TCheckBox
      Left = 175
      Top = 77
      Width = 17
      Height = 21
      Alignment = taLeftJustify
      TabOrder = 5
    end
    object cbLogLevel: TComboBox
      Left = 377
      Top = 36
      Width = 81
      Height = 21
      Style = csDropDownList
      TabOrder = 6
      Items.Strings = (
        'Off'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7')
    end
    object eDivsLedger: TEdit
      Left = 20
      Top = 120
      Width = 225
      Height = 21
      TabOrder = 7
      Text = 'eDivsLedger'
    end
    object BBSales: TBitBtn
      Left = 246
      Top = 117
      Width = 24
      Height = 21
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      TabOrder = 8
      OnClick = BBSalesClick
    end
  end
end
