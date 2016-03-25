object fmPeriods: TfmPeriods
  Left = 0
  Top = 59
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Reporting Dates'
  ClientHeight = 503
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object xLabel1: TLabel
    Left = 192
    Top = 46
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object Label2: TLabel
    Left = 183
    Top = 14
    Width = 48
    Height = 13
    Alignment = taRightJustify
    Caption = 'Start Date'
  end
  object Label1: TLabel
    Left = 62
    Top = 12
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Number'
  end
  object xLabel2: TLabel
    Left = 192
    Top = 78
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel3: TLabel
    Left = 192
    Top = 110
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel4: TLabel
    Left = 192
    Top = 142
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel5: TLabel
    Left = 192
    Top = 174
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel6: TLabel
    Left = 192
    Top = 206
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel7: TLabel
    Left = 192
    Top = 238
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel8: TLabel
    Left = 192
    Top = 270
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel9: TLabel
    Left = 192
    Top = 302
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel10: TLabel
    Left = 192
    Top = 334
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel11: TLabel
    Left = 192
    Top = 366
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel12: TLabel
    Left = 192
    Top = 398
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object xLabel13: TLabel
    Left = 192
    Top = 434
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ends on'
  end
  object llastyear: TLabel
    Left = 560
    Top = 12
    Width = 43
    Height = 13
    Alignment = taRightJustify
    Caption = 'Last year'
  end
  object Shape1: TShape
    Left = 480
    Top = 40
    Width = 2
    Height = 405
  end
  object edtNoPeriods: TEdit
    Left = 104
    Top = 8
    Width = 41
    Height = 21
    MaxLength = 2
    TabOrder = 0
    OnExit = edtNoPeriodsExit
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtStartDate: TDateTimePicker
    Left = 238
    Top = 8
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 1
    OnExit = dtStartDateExit
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cboxLastYearPost: TCheckBox
    Left = 355
    Top = 11
    Width = 158
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Post to other year ?'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod1: TEdit
    Left = 24
    Top = 41
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 3
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod1: TDateTimePicker
    Left = 238
    Top = 41
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 4
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl1: TCheckBox
    Left = 495
    Top = 43
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 5
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod2: TEdit
    Left = 24
    Top = 73
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 6
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod2: TDateTimePicker
    Left = 238
    Top = 73
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 7
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl2: TCheckBox
    Left = 495
    Top = 75
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 8
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod3: TEdit
    Left = 24
    Top = 106
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 9
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod3: TDateTimePicker
    Left = 238
    Top = 106
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 10
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl3: TCheckBox
    Left = 495
    Top = 107
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 11
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod4: TEdit
    Left = 24
    Top = 138
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 12
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod4: TDateTimePicker
    Left = 238
    Top = 138
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 13
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl4: TCheckBox
    Left = 495
    Top = 139
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 14
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod5: TEdit
    Left = 24
    Top = 171
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 15
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod5: TDateTimePicker
    Left = 238
    Top = 171
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 16
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl5: TCheckBox
    Left = 495
    Top = 171
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 17
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod6: TEdit
    Left = 24
    Top = 203
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 18
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod6: TDateTimePicker
    Left = 238
    Top = 203
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 19
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl6: TCheckBox
    Left = 495
    Top = 203
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 20
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod7: TEdit
    Left = 24
    Top = 236
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 21
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod7: TDateTimePicker
    Left = 238
    Top = 236
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 22
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl7: TCheckBox
    Left = 495
    Top = 235
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 23
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod8: TEdit
    Left = 24
    Top = 268
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 24
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod8: TDateTimePicker
    Left = 238
    Top = 268
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 25
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl8: TCheckBox
    Left = 495
    Top = 267
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 26
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod9: TEdit
    Left = 24
    Top = 301
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 27
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod9: TDateTimePicker
    Left = 238
    Top = 301
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 28
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl9: TCheckBox
    Left = 495
    Top = 299
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 29
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod10: TEdit
    Left = 24
    Top = 333
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 30
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod10: TDateTimePicker
    Left = 238
    Top = 333
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 31
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl10: TCheckBox
    Left = 495
    Top = 331
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 32
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod11: TEdit
    Left = 24
    Top = 366
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 33
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod11: TDateTimePicker
    Left = 238
    Top = 366
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 34
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl11: TCheckBox
    Left = 495
    Top = 363
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 35
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod12: TEdit
    Left = 24
    Top = 398
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 36
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object dtPeriod12: TDateTimePicker
    Left = 238
    Top = 398
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 37
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPostl12: TCheckBox
    Left = 495
    Top = 395
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 38
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object edtPeriod13: TEdit
    Left = 24
    Top = 431
    Width = 120
    Height = 21
    MaxLength = 12
    TabOrder = 39
    OnKeyPress = FormKeyPress
  end
  object dtPeriod13: TDateTimePicker
    Left = 238
    Top = 431
    Width = 100
    Height = 21
    Date = 36070.000000000000000000
    Time = 36070.000000000000000000
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 40
    OnKeyPress = FormKeyPress
  end
  object cbPostl13: TCheckBox
    Left = 495
    Top = 427
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 41
    OnKeyPress = FormKeyPress
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 466
    Width = 645
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 42
    object BtnOk: TBitBtn
      Left = 411
      Top = 6
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
      Left = 528
      Top = 6
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
  object cbPost1: TCheckBox
    Left = 355
    Top = 43
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 43
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost2: TCheckBox
    Left = 355
    Top = 75
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 44
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost3: TCheckBox
    Left = 355
    Top = 107
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 45
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost4: TCheckBox
    Left = 355
    Top = 139
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 46
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost5: TCheckBox
    Left = 355
    Top = 171
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 47
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost6: TCheckBox
    Left = 355
    Top = 203
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 48
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost7: TCheckBox
    Left = 355
    Top = 235
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 49
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost8: TCheckBox
    Left = 355
    Top = 267
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 50
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost9: TCheckBox
    Left = 355
    Top = 299
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 51
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost10: TCheckBox
    Left = 355
    Top = 331
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 52
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost11: TCheckBox
    Left = 355
    Top = 363
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 53
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost12: TCheckBox
    Left = 355
    Top = 395
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 54
    OnKeyDown = FormKeyDown
    OnKeyPress = FormKeyPress
  end
  object cbPost13: TCheckBox
    Left = 355
    Top = 427
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Open for posting ?'
    Checked = True
    State = cbChecked
    TabOrder = 55
    OnKeyPress = FormKeyPress
  end
end
