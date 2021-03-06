object fmDebtorStatementOptions: TfmDebtorStatementOptions
  Left = 99
  Top = 91
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Debtor Statements'
  ClientHeight = 383
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 350
    Width = 413
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnCancel: TBitBtn
      Left = 292
      Top = 6
      Width = 118
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
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
    end
    object BtnOk: TBitBtn
      Left = 168
      Top = 6
      Width = 117
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = btnOkClick
      OnKeyDown = FormKeyDown
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
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 413
    Height = 281
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 12
      Top = 16
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'From account'
    end
    object Label4: TLabel
      Left = 215
      Top = 16
      Width = 13
      Height = 13
      Alignment = taRightJustify
      Caption = 'To'
    end
    object Label2: TLabel
      Left = 20
      Top = 132
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Minimum amount'
    end
    object Label5: TLabel
      Left = 196
      Top = 130
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date of statements'
    end
    object Label6: TLabel
      Left = 261
      Top = 155
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'up to'
    end
    object Label7: TLabel
      Left = 218
      Top = 181
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object Label8: TLabel
      Left = 218
      Top = 205
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object Label9: TLabel
      Left = 218
      Top = 229
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'month(s) up to'
    end
    object lblCurrent: TLabel
      Left = 292
      Top = 152
      Width = 91
      Height = 13
      AutoSize = False
      Caption = '.'
    end
    object Shape1: TShape
      Left = 9
      Top = 120
      Width = 393
      Height = 1
    end
    object dbedtFromAccount: TDBEdit
      Left = 80
      Top = 11
      Width = 105
      Height = 21
      TabStop = False
      DataField = 'SDebtStatementFromAcc'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 0
      OnKeyPress = FormKeyPress
    end
    object dbedtToAccount: TDBEdit
      Left = 234
      Top = 11
      Width = 89
      Height = 21
      TabStop = False
      DataField = 'SDebtStatementToAcc'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 2
      OnKeyPress = FormKeyPress
    end
    object dbedtMinAmount: TDBEdit
      Left = 106
      Top = 127
      Width = 73
      Height = 21
      DataField = 'FDebtStatementMinAmount'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 4
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePickerStatementDate: TwwDBDateTimePicker
      Left = 292
      Top = 125
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtStatementDateLimit1'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      MaxDate = 219148.000000000000000000
      MinDate = 2.000000000000000000
      ShowButton = True
      TabOrder = 6
      OnChange = wwDBDateTimePickerStatementDateChange
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePicker30Days: TwwDBDateTimePicker
      Left = 292
      Top = 173
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtStatementDateLimit2'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      MaxDate = 219148.000000000000000000
      MinDate = 2.000000000000000000
      ShowButton = True
      TabOrder = 10
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePicker60Days: TwwDBDateTimePicker
      Left = 292
      Top = 197
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtStatementDateLimit3'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      MaxDate = 219148.000000000000000000
      MinDate = 2.000000000000000000
      ShowButton = True
      TabOrder = 13
      OnKeyPress = FormKeyPress
    end
    object wwDBDateTimePicker90Days: TwwDBDateTimePicker
      Left = 292
      Top = 221
      Width = 109
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'DDebtStatementDateLimit4'
      DataSource = dmDatabase.dsReportingOptions
      Epoch = 1950
      MaxDate = 219148.000000000000000000
      MinDate = 2.000000000000000000
      ShowButton = True
      TabOrder = 16
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName1: TDBEdit
      Left = 106
      Top = 157
      Width = 73
      Height = 21
      DataField = 'SDebtStatementAgeName0'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 7
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName2: TDBEdit
      Left = 106
      Top = 181
      Width = 73
      Height = 21
      DataField = 'SDebtStatementAgeName1'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 8
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName3: TDBEdit
      Left = 106
      Top = 205
      Width = 73
      Height = 21
      DataField = 'SDebtStatementAgeName2'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 11
      OnKeyPress = FormKeyPress
    end
    object dbedtRangeName4: TDBEdit
      Left = 106
      Top = 229
      Width = 73
      Height = 21
      DataField = 'SDebtStatementAgeName3'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 14
      OnKeyPress = FormKeyPress
    end
    object dbcbOpenItem: TDBCheckBox
      Left = 10
      Top = 67
      Width = 199
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Use Open Item'
      DataField = 'BDebtStatementOpenItem'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 20
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = FormKeyPress
    end
    object dbcbShowTaxSeperate: TDBCheckBox
      Left = 10
      Top = 93
      Width = 199
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show Tax Seperate'
      DataField = 'BDebtStatementTaxSeperate'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 18
      ValueChecked = '1'
      ValueUnchecked = '0'
      Visible = False
      OnKeyPress = FormKeyPress
    end
    object dbedtNoMonth1: TDBEdit
      Left = 179
      Top = 181
      Width = 17
      Height = 21
      DataField = 'WDebtStatementMonth1'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 9
      OnChange = wwDBDateTimePickerStatementDateChange
      OnKeyPress = FormKeyPress
    end
    object dbedtNoMonth2: TDBEdit
      Left = 179
      Top = 205
      Width = 17
      Height = 21
      DataField = 'WDebtStatementMonth2'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 12
      OnChange = wwDBDateTimePickerStatementDateChange
      OnKeyPress = FormKeyPress
    end
    object dbedtNoMonth3: TDBEdit
      Left = 179
      Top = 229
      Width = 17
      Height = 21
      DataField = 'WDebtStatementMonth3'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 15
      OnChange = wwDBDateTimePickerStatementDateChange
      OnKeyPress = FormKeyPress
    end
    object dbcbShowTaxTrans: TDBCheckBox
      Left = 222
      Top = 93
      Width = 176
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show Tax Transaction'
      DataField = 'BDebtStatementTaxTransact'
      DataSource = dmDatabase.dsReportingOptions
      TabOrder = 17
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnKeyPress = FormKeyPress
    end
    object PrgPnl: TPanel
      Left = 8
      Top = 254
      Width = 393
      Height = 16
      TabOrder = 21
      Visible = False
      object Gauge1: TGauge
        Left = 92
        Top = 1
        Width = 293
        Height = 13
        Progress = 0
      end
      object Label1: TLabel
        Left = 4
        Top = 1
        Width = 76
        Height = 13
        Caption = 'Prepering E-mail'
      end
    end
    object CBSortbyName: TCheckBox
      Left = 222
      Top = 67
      Width = 176
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Sort By Name'
      TabOrder = 5
    end
    object cbContact: TCheckBox
      Left = 222
      Top = 39
      Width = 176
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Show Contact Person'
      TabOrder = 19
    end
    object BitBtn1: TBitBtn
      Left = 185
      Top = 11
      Width = 24
      Height = 19
      TabOrder = 1
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
      Left = 323
      Top = 11
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
  end
  object TopPnl: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 69
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object DestLbl: TLabel
      Left = 16
      Top = 10
      Width = 74
      Height = 13
      Caption = 'Send report To:'
      FocusControl = cbDestination
    end
    object lblCopies: TLabel
      Left = 122
      Top = 40
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Copies :'
      Enabled = False
      FocusControl = edtCount
    end
    object cbDestination: TComboBox
      Left = 18
      Top = 38
      Width = 91
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbDestinationChange
      OnKeyPress = cbDestinationKeyPress
      Items.Strings = (
        'Screen'
        'Printer'
        'File'
        'E-mail')
    end
    object Bitprn1: TBitBtn
      Left = 222
      Top = 35
      Width = 130
      Height = 25
      Caption = '&Printer Setup'
      TabOrder = 1
      TabStop = False
      OnClick = Bitprn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000004141
        4100524E4D0053504E0052525200595554005F5A59005D5D5D0065605F006363
        6300696665006E6866006C6C6C00776D6700767373007777770082777300807E
        7D004573870042778E0073AAB50078AFB50079B1B7007BB2B8007DB3B9007EB5
        BB007FB5BC0064C2CF0068C5CF0075CCD50078CED60079CFD8004FC2EB0051C3
        EB0052C4EB0052C5ED0054C5ED005BC6ED005FC8EE005AC8F00077F1F6007FF5
        F600878787008F8D8B00998F8B009E928E009D948F0093919000989594009D9A
        99009D9D9D00A1959100A3989400A59A9600A19E9E00A89D9900A1A29400A5A3
        A200A9A7A700A7A2AB00A9A9A900AEAAAA00B5A9A600B2AFAF00B3B0AF00BCB3
        AF00B5B2B100B7B5B400B9B6B600BCB6B500C4B6B200C0BCBC0086C180002312
        A50082CFD50084CFD7008FCED50090CED50085D1D80093D0D80084CDEF0080F2
        F60089F5F60090F6F6009CF4F600A5F6F600C4C2C200C8C5C400CECCCC00D0CE
        CC00D7CFCE00D7D5D500E0D5D100EAE5E200ECE7E500F4F2F100F6F6F5000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF121212
        12121212121212FFFFFFFFFFFF12544F4D4D4D4C4C5512FFFFFFFFFFFF12524E
        4B4B4B4B4B5212FFFFFFFF343312281F1E1D1D1D1D29123334FF2E4610121B1C
        1C1C1C1C1C1C130D462E2E5C412C2C2C2C2C2C2C2C2C2C3E5C2E335D5D5D5D5D
        5D5D5D5D5D5D5D5D5D33345F5F57444444444344433F475F5F34345F5B0B0403
        03030302020308585F37375F5908010101010101010105565F373759440E0401
        010101010101053B493C34463E373A312A0E0B0807070A38483CFF33332E3C3B
        3B3B312E2E2B113334FFFFFFFF12191919191915151512FFFFFFFFFFFF125252
        52525252522912FFFFFFFFFFFF12121212121212121212FFFFFF}
    end
    object edtCount: TEdit
      Left = 162
      Top = 38
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '1'
      OnChange = edtCountChange
      OnKeyPress = cbDestinationKeyPress
    end
    object UpDown1: TUpDown
      Left = 199
      Top = 36
      Width = 16
      Height = 24
      Enabled = False
      Min = 1
      Max = 32767
      Position = 1
      TabOrder = 3
      OnClick = UpDown1Click
    end
  end
end
