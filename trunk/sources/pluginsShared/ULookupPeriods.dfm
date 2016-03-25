object FrameLookupPeriods: TFrameLookupPeriods
  Left = 0
  Top = 0
  Width = 247
  Height = 137
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 247
    Height = 137
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Periods'
      object Label3: TLabel
        Left = 4
        Top = 0
        Width = 30
        Height = 13
        Caption = 'period'
      end
      object rgPEriode: TRadioGroup
        Left = 4
        Top = 36
        Width = 229
        Height = 65
        Caption = 'Period'
        Columns = 2
        Items.Strings = (
          'Month'
          '2 months'
          '3 months'
          '4 months'
          '6 months'
          '1 year')
        TabOrder = 0
        OnClick = rgPEriodeClick
      end
      object CBFromPeriode: TComboBox
        Left = 4
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'FreeSelection'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LFromdate: TLabel
        Left = 8
        Top = 4
        Width = 46
        Height = 13
        Caption = 'Fromdate'
      end
      object lTodate: TLabel
        Left = 8
        Top = 44
        Width = 46
        Height = 13
        Caption = 'Fromdate'
      end
      object dtFromdate: TDateTimePicker
        Left = 8
        Top = 20
        Width = 125
        Height = 21
        Date = 40179.000000000000000000
        Time = 40179.000000000000000000
        TabOrder = 0
      end
      object dtTodate: TDateTimePicker
        Left = 8
        Top = 60
        Width = 125
        Height = 21
        Date = 40543.531243009260000000
        Time = 40543.531243009260000000
        TabOrder = 1
      end
    end
  end
  object ZQuery1: TUniQuery
    DataTypeMap = <>
    Left = 188
    Top = 20
  end
end
