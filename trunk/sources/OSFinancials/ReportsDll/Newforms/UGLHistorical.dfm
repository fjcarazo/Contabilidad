inherited fmGLHistorical: TfmGLHistorical
  Caption = 'Historical'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 64
    Width = 22
    Height = 13
    Caption = 'Year'
  end
  object Label2: TLabel [1]
    Left = 23
    Top = 104
    Width = 47
    Height = 13
    Caption = 'From date'
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 148
    Width = 37
    Height = 13
    Caption = 'To date'
  end
  object Label4: TLabel [3]
    Left = 240
    Top = 104
    Width = 55
    Height = 13
    Caption = 'Report type'
  end
  inherited ButtonPanel: TPanel
    inherited BtnOk: TBitBtn
      OnClick = BtnOkClick
    end
    inherited BtnCancel: TBitBtn
      OnClick = BtnCancelClick
    end
  end
  object cbyear: TComboBox
    Left = 24
    Top = 80
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = cbyearChange
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 120
    Width = 186
    Height = 21
    Date = 40187.699530520830000000
    Time = 40187.699530520830000000
    TabOrder = 3
  end
  object DateTimePicker2: TDateTimePicker
    Left = 24
    Top = 164
    Width = 186
    Height = 21
    Date = 40187.699562534720000000
    Time = 40187.699562534720000000
    TabOrder = 4
  end
  object dbcbShowDetails: TCheckBox
    Left = 240
    Top = 81
    Width = 189
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Show nil balance'
    TabOrder = 5
  end
  object cbRepType: TComboBox
    Left = 240
    Top = 120
    Width = 189
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    Items.Strings = (
      'Trail balance'
      'Profit Loss'
      'Balance')
  end
  object ZQGetLowDate: TuniQuery
    SQL.Strings = (
      'select min(ddate) from transact')
    Params = <>
    Left = 40
    Top = 204
  end
end
