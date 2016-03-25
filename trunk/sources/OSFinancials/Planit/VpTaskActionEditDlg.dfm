object FormTaskEditDlg: TFormTaskEditDlg
  Left = 440
  Top = 216
  Width = 332
  Height = 238
  Caption = 'Task action'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LType: TLabel
    Left = 8
    Top = 10
    Width = 24
    Height = 13
    Caption = 'Type'
  end
  object LEAccount: TLabel
    Left = 8
    Top = 53
    Width = 32
    Height = 13
    Caption = 'Debtor'
  end
  object LCBQuotes: TLabel
    Left = 8
    Top = 94
    Width = 35
    Height = 13
    Caption = 'Invoice'
  end
  object CBGroup: TComboBox
    Left = 8
    Top = 69
    Width = 193
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object CBType: TComboBox
    Left = 8
    Top = 26
    Width = 261
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'Copy invoice'
    OnChange = CBTypeChange
    Items.Strings = (
      'Copy invoice'
      'Copy invoice to group 1')
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 324
    Height = 59
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      324
      59)
    object OKBtn: TButton
      Left = 167
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = OKBtnClick
    end
    object CancelBtn: TButton
      Left = 245
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = CancelBtnClick
    end
  end
  object EAccount: TEdit
    Left = 8
    Top = 69
    Width = 261
    Height = 21
    TabOrder = 2
    OnEnter = EAccountEnter
  end
  object CBQuotes: TComboBox
    Left = 8
    Top = 109
    Width = 261
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
end
