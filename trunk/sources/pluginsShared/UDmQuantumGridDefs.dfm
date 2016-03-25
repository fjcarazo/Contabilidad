object dmQuantumGridDefs: TdmQuantumGridDefs
  OldCreateOrder = False
  Left = 573
  Top = 357
  Height = 241
  Width = 663
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 36
    PixelsPerInch = 96
    object cxFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13822463
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxGroupByBox: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13822463
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxBackground: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxContentOdd: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15395562
      TextColor = clBlack
    end
    object cxContentEven: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxgroup: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 13160660
    end
    object cxInavtive: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxSelection: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object GridTableViewStyleSheetWindowsStandard: TcxGridTableViewStyleSheet
      Caption = 'Windows Standard'
      Styles.Background = cxBackground
      Styles.Content = cxBackground
      Styles.ContentEven = cxContentEven
      Styles.ContentOdd = cxContentOdd
      Styles.Inactive = cxInavtive
      Styles.Selection = cxSelection
      Styles.Footer = cxFooter
      Styles.Group = cxgroup
      Styles.GroupByBox = cxGroupByBox
      Styles.Header = cxHeader
      Styles.Indicator = cxHeader
      Styles.Preview = cxBackground
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetWindowsStandard: TcxGridBandedTableViewStyleSheet
      Caption = 'Windows Standard'
      Styles.Background = cxBackground
      Styles.Content = cxBackground
      Styles.ContentEven = cxContentEven
      Styles.ContentOdd = cxContentOdd
      Styles.Inactive = cxInavtive
      Styles.Selection = cxSelection
      Styles.Footer = cxFooter
      Styles.Group = cxgroup
      Styles.GroupByBox = cxGroupByBox
      Styles.Header = cxHeader
      Styles.Indicator = cxHeader
      Styles.Preview = cxBackground
      Styles.BandHeader = cxHeader
      BuiltIn = True
    end
    object GridCardViewStyleSheetWindowsStandard: TcxGridCardViewStyleSheet
      Caption = 'Windows Standard'
      Styles.Content = cxContentEven
      Styles.ContentEven = cxContentEven
      Styles.ContentOdd = cxContentOdd
      Styles.Inactive = cxInavtive
      Styles.Selection = cxSelection
      Styles.CaptionRow = cxHeader
      Styles.CardBorder = cxBackground
      Styles.RowCaption = cxHeader
      BuiltIn = True
    end
  end
  object cxEditRepository1: TcxEditRepository
    Left = 192
    Top = 36
    object osfDBCheckbox: TcxEditRepositoryCheckBoxItem
      Properties.Alignment = taLeftJustify
      Properties.ValueChecked = '1'
      Properties.ValueUnchecked = '0'
    end
    object osfTypePeriod: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Day'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Week'
          Value = 1
        end
        item
          Description = 'Month'
          Value = 2
        end
        item
          Description = 'Quarter'
          Value = 3
        end
        item
          Description = 'Half year'
          Value = 4
        end
        item
          Description = 'Year'
          Value = 5
        end>
    end
    object osfCalcEdit: TcxEditRepositoryCalcItem
    end
    object osFcurrencyEdit: TcxEditRepositoryCurrencyItem
      Properties.DisplayFormat = ' ,0.00; ,0.00-'
      Properties.EditFormat = '0.00;-0.00'
      Properties.UseThousandSeparator = True
    end
    object osfCuWithHighDecimal: TcxEditRepositoryCurrencyItem
      Properties.DecimalPlaces = 8
      Properties.DisplayFormat = ' ,0.00#######; - ,0.00#######'
      Properties.EditFormat = '0.00#######; - 0.00#######'
    end
    object osfQtyWithHighDecimals: TcxEditRepositoryCurrencyItem
      Properties.DecimalPlaces = 8
      Properties.DisplayFormat = ' ,0.#########; - ,0.#########'
      Properties.EditFormat = '0.#########; - 0.#########'
    end
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    Left = 304
    Top = 40
  end
  object cxEditStyleController1: TcxEditStyleController
    Left = 424
    Top = 44
    PixelsPerInch = 96
  end
  object cxHintStyleController1: TcxHintStyleController
    HintStyle.Animate = cxhaSlideDownward
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'MS Sans Serif'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'MS Sans Serif'
    HintStyle.Font.Style = []
    HintStyle.Rounded = True
    Left = 524
    Top = 40
  end
  object cxDefaultEditStyleController1: TcxDefaultEditStyleController
    Left = 404
    Top = 104
    PixelsPerInch = 96
  end
end
