object fmStockEntry: TfmStockEntry
  Left = 211
  Top = 281
  Width = 1020
  Height = 859
  HorzScrollBar.Range = 800
  VertScrollBar.Range = 500
  Caption = 'Stock'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 1012
    Height = 832
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 990
    ExplicitHeight = 830
    object PCStock: TPageControl
      Left = 145
      Top = 0
      Width = 863
      Height = 828
      ActivePage = TSDetail
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 841
      ExplicitHeight = 826
      object TSList: TTabSheet
        Caption = 'TSList'
        ExplicitWidth = 833
        ExplicitHeight = 798
        object Splitter1: TcxSplitter
          Left = 0
          Top = 177
          Width = 855
          Height = 8
          Cursor = crVSplit
          HotZoneClassName = 'TcxXPTaskBarStyle'
          AlignSplitter = salTop
          AutoSnap = True
          Control = PSearch
          Color = clBtnShadow
          ParentColor = False
          ExplicitWidth = 833
        end
        object AdvancedPanel: TPanel
          Left = 0
          Top = 185
          Width = 855
          Height = 615
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          OnClick = btnCancelClick
          OnExit = AdvancedPanelExit
          ExplicitWidth = 833
          ExplicitHeight = 613
          object Splitter33: TcxSplitter
            Left = 0
            Top = 383
            Width = 855
            Height = 8
            Cursor = crVSplit
            HotZoneClassName = 'TcxXPTaskBarStyle'
            AlignSplitter = salBottom
            AutoSnap = True
            Control = PnlAdjust
            Color = clBtnShadow
            ParentColor = False
            ExplicitTop = 381
            ExplicitWidth = 833
          end
          object pbPanel: TPanel
            Left = 30
            Top = 122
            Width = 363
            Height = 47
            TabOrder = 1
            Visible = False
            object lblMessages: TLabel
              Left = 6
              Top = 6
              Width = 58
              Height = 13
              Alignment = taCenter
              Caption = 'lblMessages'
            end
            object pb: TProgressBar
              Left = 6
              Top = 25
              Width = 347
              Height = 14
              TabOrder = 0
            end
          end
          object PnlAdjust: TPanel
            Left = 0
            Top = 391
            Width = 855
            Height = 224
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            TabStop = True
            Visible = False
            ExplicitTop = 389
            ExplicitWidth = 833
            object Bevel1: TBevel
              Left = 0
              Top = 217
              Width = 855
              Height = 7
              Align = alBottom
              Shape = bsBottomLine
              ExplicitWidth = 1008
            end
            object PCAdvanced: TPageControl
              Left = 0
              Top = 0
              Width = 855
              Height = 217
              ActivePage = TsAdvSetup
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 833
              object TSAdvImpExp: TTabSheet
                Caption = 'Import / export'
                ExplicitWidth = 825
                object edtFileName: TEdit
                  Left = 6
                  Top = 8
                  Width = 251
                  Height = 21
                  TabOrder = 0
                  Text = 'Stock.Wk1'
                end
                object btnTo: TBitBtn
                  Left = 259
                  Top = 8
                  Width = 22
                  Height = 21
                  DoubleBuffered = True
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
                    333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
                    300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
                    333337F373F773333333303330033333333337F3377333333333303333333333
                    333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
                    333337777F337F33333330330BB00333333337F373F773333333303330033333
                    333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
                    333377777F77377733330BBB0333333333337F337F33333333330BB003333333
                    333373F773333333333330033333333333333773333333333333}
                  NumGlyphs = 2
                  ParentDoubleBuffered = False
                  TabOrder = 1
                  OnClick = btnToClick
                end
                object cbFileFormat: TComboBox
                  Left = 8
                  Top = 34
                  Width = 273
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 2
                  Items.Strings = (
                    '(*.TXF) TurboCASH Exchange File'
                    '( *.Xml )   Xml Database'
                    '( *.Wk1)  Lotus SpreadSheet'
                    'Comma seperated values'
                    'Windows listseperator values'
                    'Tab delimited')
                end
                object bImport: TBitBtn
                  Left = 290
                  Top = 7
                  Width = 96
                  Height = 25
                  Caption = 'Import'
                  DoubleBuffered = True
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  ParentDoubleBuffered = False
                  TabOrder = 3
                  OnClick = bImportClick
                end
                object BExport: TBitBtn
                  Left = 290
                  Top = 55
                  Width = 96
                  Height = 25
                  Caption = 'Export'
                  DoubleBuffered = True
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  ParentDoubleBuffered = False
                  TabOrder = 4
                  OnClick = BExportClick
                end
                object cbEditExsit: TCheckBox
                  Left = 404
                  Top = 12
                  Width = 361
                  Height = 17
                  Caption = 'Only new items (no adjust)'
                  TabOrder = 5
                end
                object cbEnterIsNextRecord: TCheckBox
                  Left = 8
                  Top = 68
                  Width = 165
                  Height = 17
                  Caption = 'Enter is next record'
                  TabOrder = 6
                end
                object cbAutoDetailononerecord: TCheckBox
                  Left = 8
                  Top = 92
                  Width = 165
                  Height = 17
                  Caption = 'Auto detail on one record'
                  TabOrder = 7
                end
              end
              object TSExpAdjust: TTabSheet
                Caption = 'Adjust'
                ImageIndex = 2
                ExplicitWidth = 825
                object lblDateTrn: TLabel
                  Left = 115
                  Top = 71
                  Width = 23
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Date'
                  FocusControl = TransDte
                end
                object Label16: TLabel
                  Left = 192
                  Top = 17
                  Width = 12
                  Height = 16
                  Caption = '%'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object LSetprice: TLabel
                  Left = 441
                  Top = 4
                  Width = 45
                  Height = 13
                  Caption = 'Exclusive'
                end
                object edtPercent: TEdit
                  Left = 150
                  Top = 11
                  Width = 41
                  Height = 21
                  TabOrder = 0
                  Text = '000.00'
                  OnExit = edtPercentExit
                end
                object CheckBox1: TCheckBox
                  Left = 147
                  Top = 47
                  Width = 131
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Generate Transactions'
                  Checked = True
                  Enabled = False
                  State = cbChecked
                  TabOrder = 1
                  Visible = False
                end
                object TransDte: TDateTimePicker
                  Left = 148
                  Top = 67
                  Width = 129
                  Height = 21
                  Date = 36507.518306481500000000
                  Time = 36507.518306481500000000
                  TabOrder = 2
                  OnExit = TransDteExit
                end
                object cbUsePercent: TCheckBox
                  Left = 25
                  Top = 11
                  Width = 117
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Use Percentage'
                  Checked = True
                  State = cbChecked
                  TabOrder = 3
                end
                object BtnOk: TBitBtn
                  Left = 284
                  Top = 8
                  Width = 96
                  Height = 25
                  Caption = 'OK'
                  DoubleBuffered = True
                  Glyph.Data = {
                    DE010000424DDE01000000000000760000002800000024000000120000000100
                    0400000000006801000000000000000000001000000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    3333333333333333333333330000333333333333333333333333F33333333333
                    00003333344333333333333333388F3333333333000033334224333333333333
                    338338F3333333330000333422224333333333333833338F3333333300003342
                    222224333333333383333338F3333333000034222A22224333333338F338F333
                    8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                    33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                    0000333333333A222433333333333338F338F33300003333333333A222433333
                    333333338F338F33000033333333333A222433333333333338F338F300003333
                    33333333A222433333333333338F338F00003333333333333A22433333333333
                    3338F38F000033333333333333A223333333333333338F830000333333333333
                    333A333333333333333338330000333333333333333333333333333333333333
                    0000}
                  ParentDoubleBuffered = False
                  TabOrder = 4
                  OnClick = btnOkClick
                end
                object BSetSelPRiceTo: TBitBtn
                  Left = 548
                  Top = 18
                  Width = 257
                  Height = 25
                  Caption = '<- Set selected to this price'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 5
                  OnClick = BSetSelPRiceToClick
                end
                object EsetPrice1: TEdit
                  Left = 441
                  Top = 19
                  Width = 96
                  Height = 21
                  TabOrder = 6
                  Text = '0'
                  OnExit = edtSellingPrice1Exit
                  OnKeyPress = FormKeyPress
                end
                object EsetPrice2: TEdit
                  Left = 441
                  Top = 40
                  Width = 96
                  Height = 21
                  TabOrder = 7
                  Text = '0'
                  OnExit = edtSellingPrice2Exit
                  OnKeyPress = FormKeyPress
                end
                object EsetPrice3: TEdit
                  Left = 441
                  Top = 61
                  Width = 96
                  Height = 21
                  TabOrder = 8
                  Text = '0'
                  OnExit = edtSellingPrice3Exit
                  OnKeyPress = FormKeyPress
                end
              end
              object TsAdvSetup: TTabSheet
                Caption = 'Setup'
                ImageIndex = 2
                ExplicitWidth = 825
                object BSetupstock: TBitBtn
                  Left = 8
                  Top = 16
                  Width = 169
                  Height = 25
                  Caption = 'Setup stock'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 0
                  OnClick = BSetupstockClick
                end
                object BSetupGroups: TBitBtn
                  Left = 8
                  Top = 48
                  Width = 169
                  Height = 25
                  Caption = 'Setup groups'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 1
                  OnClick = BSetupGroupsClick
                end
                object cbNoCalcFields: TCheckBox
                  Left = 208
                  Top = 16
                  Width = 97
                  Height = 17
                  Caption = 'NoCalcFields'
                  TabOrder = 2
                end
              end
            end
          end
          object cxGrid1: TcxGrid
            Left = 0
            Top = 0
            Width = 855
            Height = 383
            Align = alClient
            TabOrder = 2
            ExplicitWidth = 833
            ExplicitHeight = 381
            object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
              PopupMenu = pmExtraActions
              OnDblClick = dbgAdStockEditDblClick
              OnKeyDown = dbgAdStockEditKeyDown
              OnKeyPress = dbgAdStockEditKeyPress
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = cxGrid1DBBandedTableView1CustomDrawCell
              DataController.DataSource = dsStock
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '0'
                  Kind = skCount
                  FieldName = 'SSTOCKCODE'
                  Column = cxGrid1DBBandedTableView1SSTOCKCODE
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0'
                  Kind = skCount
                  FieldName = 'SSTOCKCODE'
                  Column = cxGrid1DBBandedTableView1SSTOCKCODE
                end>
              DataController.Summary.SummaryGroups = <
                item
                  Links = <>
                  SummaryItems = <
                    item
                      Format = '0'
                      Kind = skCount
                      FieldName = 'SSTOCKCODE'
                      Column = cxGrid1DBBandedTableView1SSTOCKCODE
                    end>
                end>
              OptionsBehavior.AlwaysShowEditor = True
              OptionsBehavior.CopyCaptionsToClipboard = False
              OptionsBehavior.DragDropText = True
              OptionsBehavior.FocusCellOnTab = True
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsCustomize.DataRowSizing = True
              OptionsCustomize.GroupRowSizing = True
              OptionsCustomize.BandsQuickCustomization = True
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsSelection.MultiSelect = True
              OptionsView.ShowEditButtons = gsebForFocusedRecord
              OptionsView.Footer = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfAlwaysVisible
              OptionsView.Indicator = True
              Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
              Bands = <
                item
                  FixedKind = fkLeft
                  Width = 411
                end
                item
                end
                item
                  FixedKind = fkRight
                end>
              object cxGrid1DBBandedTableView1WSTOCKID: TcxGridDBBandedColumn
                Caption = 'id'
                DataBinding.FieldName = 'WSTOCKID'
                Visible = False
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SSTOCKCODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SSTOCKCODE'
                Options.Editing = False
                Options.Grouping = False
                Width = 131
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SDESCRIPTION'
                Width = 251
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SBARCODENUMBER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SBARCODENUMBER'
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1WREPORTINGGROUP1ID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'WREPORTINGGROUP1ID'
                RepositoryItem = osfStockGroup1
                OnGetProperties = cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'WREPORTINGGROUP2ID'
                RepositoryItem = osfStockGroup2
                OnGetProperties = cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FQTYONHAND: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FQTYONHAND'
                RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FREORDERQTY: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FREORDERQTY'
                RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1BAPPLYINVOICEDISCOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'BAPPLYINVOICEDISCOUNT'
                RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FSELLINGPRICE1: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FSELLINGPRICE1'
                RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FSELLINGPRICE2: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FSELLINGPRICE2'
                RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FSELLINGPRICE3: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FSELLINGPRICE3'
                RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                Position.BandIndex = 1
                Position.ColIndex = 8
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FUNITAVECOST: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FUNITAVECOST'
                RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                Position.BandIndex = 1
                Position.ColIndex = 9
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FUNITCOST: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FUNITCOST'
                RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                Position.BandIndex = 1
                Position.ColIndex = 10
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1WUNITID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'WUNITID'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Alignment.Horz = taLeftJustify
                Properties.Items = <>
                OnGetProperties = cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties
                Position.BandIndex = 1
                Position.ColIndex = 11
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1WINPUTTAX2ID: TcxGridDBBandedColumn
                Caption = 'taxclass'
                DataBinding.FieldName = 'WINPUTTAX2ID'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Alignment.Horz = taLeftJustify
                Properties.Items = <>
                OnGetProperties = cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties
                FooterAlignmentHorz = taLeftJustify
                GroupSummaryAlignment = taLeftJustify
                Position.BandIndex = 1
                Position.ColIndex = 12
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1WSTOCKTYPEID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'WSTOCKTYPEID'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Alignment.Horz = taLeftJustify
                Properties.Items = <>
                OnGetProperties = cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties
                Position.BandIndex = 1
                Position.ColIndex = 13
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1BDISABLED: TcxGridDBBandedColumn
                DataBinding.FieldName = 'BDISABLED'
                RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
                Position.BandIndex = 1
                Position.ColIndex = 14
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SEXTRADESC: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SEXTRADESC'
                Width = 243
                Position.BandIndex = 1
                Position.ColIndex = 15
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SInputTax: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SInputTax'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick
                Position.BandIndex = 1
                Position.ColIndex = 16
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SOutPutTax: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SOutPutTax'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Alignment.Horz = taLeftJustify
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick
                Position.BandIndex = 1
                Position.ColIndex = 17
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SCostAccount: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SCostAccount'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick
                Position.BandIndex = 1
                Position.ColIndex = 18
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SSaleSACCOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SSaleSACCOUNT'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick
                Position.BandIndex = 1
                Position.ColIndex = 19
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SStockAccount: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SStockAccount'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick
                Position.BandIndex = 1
                Position.ColIndex = 20
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FNETTOWEIGHT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FNETTOWEIGHT'
                RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                Position.BandIndex = 1
                Position.ColIndex = 21
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FGROSSWEIGHT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FGROSSWEIGHT'
                RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                Position.BandIndex = 1
                Position.ColIndex = 22
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FREORDERQTYTRIG: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FREORDERQTYTRIG'
                RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                Position.BandIndex = 1
                Position.ColIndex = 23
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SMANUFACTURER: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SMANUFACTURER'
                Position.BandIndex = 1
                Position.ColIndex = 24
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1FMINIMUMQTY: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FMINIMUMQTY'
                RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                Position.BandIndex = 1
                Position.ColIndex = 25
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SSTOCKCODESUP1: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SSTOCKCODESUP1'
                Position.BandIndex = 1
                Position.ColIndex = 26
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SSTOCKCODESUP2: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SSTOCKCODESUP2'
                Position.BandIndex = 1
                Position.ColIndex = 27
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SWSUPPLIER1ID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SWSUPPLIER1ID'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick
                Width = 237
                Position.BandIndex = 1
                Position.ColIndex = 28
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1SWSUPPLIER2ID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SWSUPPLIER2ID'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Default = True
                    Kind = bkEllipsis
                  end>
                Properties.OnButtonClick = cxGrid1DBBandedTableView1SInputTaxPropertiesButtonClick
                Width = 198
                Position.BandIndex = 1
                Position.ColIndex = 29
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1WDEFAULTCOSTGROUP1ID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'WDEFAULTCOSTGROUP1ID'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Alignment.Horz = taLeftJustify
                Properties.Items = <>
                OnGetProperties = cxGrid1DBBandedTableView1WREPORTINGGROUP1IDGetProperties
                Position.BandIndex = 1
                Position.ColIndex = 30
                Position.RowIndex = 0
              end
              object cxGrid1DBBandedTableView1DSYSDATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DSYSDATE'
                DateTimeGrouping = dtgRelativeToToday
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
            end
            object cxGrid1Level2: TcxGridLevel
              GridView = cxGrid1DBBandedTableView1
            end
          end
        end
        object PSearch: TPanel
          Left = 0
          Top = 0
          Width = 855
          Height = 177
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 833
        end
      end
      object TSDetail: TTabSheet
        Caption = 'TSDetail'
        ImageIndex = 1
        PopupMenu = PopupMenu1
        ExplicitWidth = 833
        ExplicitHeight = 798
        object pcDetails: TPageControl
          Left = 0
          Top = 153
          Width = 855
          Height = 647
          ActivePage = tsLinksale
          Align = alClient
          TabOrder = 0
          OnChange = pcDetailsChange
          ExplicitTop = 100
          ExplicitWidth = 833
          ExplicitHeight = 698
          object tsFullList: TTabSheet
            Caption = 'List view'
            ImageIndex = 9
            ExplicitWidth = 825
            ExplicitHeight = 670
            object ScrollBox3: TScrollBox
              Left = 0
              Top = 29
              Width = 847
              Height = 590
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 825
              ExplicitHeight = 641
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 847
              Height = 29
              Align = alTop
              TabOrder = 1
              ExplicitWidth = 825
              object cbGotoInput: TComboBox
                Left = 12
                Top = 4
                Width = 197
                Height = 21
                Style = csDropDownList
                TabOrder = 0
                OnChange = cbGotoInputChange
              end
            end
          end
          object tsSubdetail: TTabSheet
            Caption = 'subdetail'
            ImageIndex = 10
            ExplicitWidth = 825
            ExplicitHeight = 670
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 847
              Height = 619
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 825
              ExplicitHeight = 670
              DesignSize = (
                847
                619)
              object LPrefSup1: TLabel
                Left = 14
                Top = 179
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'Prefferd supplier 1'
              end
              object LPrefSup2: TLabel
                Left = 373
                Top = 179
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'Prefferd supplier 2'
              end
              object Label18: TLabel
                Left = 41
                Top = 200
                Width = 56
                Height = 13
                Alignment = taRightJustify
                Caption = 'Stock Code'
              end
              object Label19: TLabel
                Left = 401
                Top = 200
                Width = 56
                Height = 13
                Alignment = taRightJustify
                Caption = 'Stock Code'
              end
              object GroupBox3: TGroupBox
                Left = 6
                Top = -2
                Width = 855
                Height = 113
                Anchors = [akLeft, akTop, akRight]
                Caption = 'Inventory'
                Constraints.MinWidth = 652
                TabOrder = 0
                ExplicitWidth = 833
                DesignSize = (
                  855
                  113)
                object Label5: TLabel
                  Left = 26
                  Top = 24
                  Width = 47
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Bar Code '
                end
                object LExtraDesc: TLabel
                  Left = 284
                  Top = 8
                  Width = 50
                  Height = 13
                  Caption = 'Extra desc'
                end
                object Label17: TLabel
                  Left = 30
                  Top = 67
                  Width = 43
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Item type'
                end
                object Label3: TLabel
                  Left = 31
                  Top = 88
                  Width = 42
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Unit Size'
                end
                object Lmanufacturer: TLabel
                  Left = 11
                  Top = 45
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'manufacturer'
                end
                object edtBar: TEdit
                  Left = 81
                  Top = 21
                  Width = 197
                  Height = 21
                  CharCase = ecUpperCase
                  MaxLength = 30
                  TabOrder = 0
                  OnDblClick = edtBarDblClick
                  OnKeyPress = FormKeyPress
                end
                object MlongDesc: TMemo
                  Left = 284
                  Top = 22
                  Width = 490
                  Height = 83
                  Anchors = [akLeft, akTop, akRight]
                  Lines.Strings = (
                    'MlongDesc')
                  ScrollBars = ssBoth
                  TabOrder = 4
                  WordWrap = False
                  ExplicitWidth = 468
                end
                object CBStockType: TComboBox
                  Left = 81
                  Top = 63
                  Width = 196
                  Height = 21
                  Style = csDropDownList
                  DropDownCount = 11
                  TabOrder = 2
                  OnChange = CBStockTypeChange
                  Items.Strings = (
                    'Default'
                    'BOM'
                    'Sales'
                    'Purchase'
                    'Sales (No stock)'
                    'Purchase (No Stock)'
                    'Financial'
                    'Option item'
                    'Option item (No stock)'
                    'BOM Production'
                    'Linked items')
                end
                object cbSize: TComboBox
                  Left = 81
                  Top = 84
                  Width = 196
                  Height = 21
                  TabOrder = 3
                  OnCloseUp = CbxRepGroup1CloseUp
                  OnDropDown = CbxRepGroup1DropDown
                  OnKeyDown = FormKeyDown
                  OnKeyPress = FormKeyPress
                end
                object Emanufacturer: TEdit
                  Left = 81
                  Top = 42
                  Width = 197
                  Height = 21
                  MaxLength = 30
                  TabOrder = 1
                  OnKeyPress = FormKeyPress
                end
                object cbManufacturer: TComboBox
                  Left = 82
                  Top = 43
                  Width = 195
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 5
                  Visible = False
                end
              end
              object GroupBox5: TGroupBox
                Left = 6
                Top = 111
                Width = 832
                Height = 61
                Anchors = [akLeft, akTop, akRight]
                Caption = 'Reporting'
                Constraints.MinWidth = 228
                TabOrder = 1
                ExplicitWidth = 810
                DesignSize = (
                  832
                  61)
                object lblRep2: TLabel
                  Left = 101
                  Top = 33
                  Width = 87
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Reporting Group 2'
                end
                object lblRep1: TLabel
                  Left = 101
                  Top = 12
                  Width = 87
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Reporting Group 1'
                end
                object CbxRepGroup2: TComboBox
                  Left = 192
                  Top = 34
                  Width = 582
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  DropDownCount = 15
                  TabOrder = 1
                  OnCloseUp = CbxRepGroup1CloseUp
                  OnDropDown = CbxRepGroup1DropDown
                  OnKeyDown = FormKeyDown
                  OnKeyPress = FormKeyPress
                  ExplicitWidth = 560
                end
                object CbxRepGroup1: TComboBox
                  Left = 192
                  Top = 12
                  Width = 582
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  DropDownCount = 15
                  TabOrder = 0
                  OnCloseUp = CbxRepGroup1CloseUp
                  OnDropDown = CbxRepGroup1DropDown
                  OnKeyDown = FormKeyDown
                  OnKeyPress = FormKeyPress
                  ExplicitWidth = 560
                end
              end
              object ESupp1: TEdit
                Left = 104
                Top = 176
                Width = 227
                Height = 21
                ReadOnly = True
                TabOrder = 2
                Text = 'ESupp1'
              end
              object BSuppLier1: TBitBtn
                Left = 334
                Top = 177
                Width = 23
                Height = 20
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
                TabOrder = 3
                OnClick = BSuppLier1Click
              end
              object ESupp2: TEdit
                Left = 464
                Top = 176
                Width = 201
                Height = 21
                ReadOnly = True
                TabOrder = 4
                Text = 'ESupp2'
              end
              object BSuppLier2: TBitBtn
                Left = 667
                Top = 174
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
                TabOrder = 5
                OnClick = BSuppLier2Click
              end
              object ESup1stockCode: TEdit
                Left = 104
                Top = 197
                Width = 225
                Height = 21
                TabOrder = 6
                Text = 'ESup1stockCode'
              end
              object ESup2stockCode: TEdit
                Left = 464
                Top = 197
                Width = 201
                Height = 21
                TabOrder = 7
                Text = 'ESup1stockCode'
              end
            end
          end
          object TSAccounting: TTabSheet
            Caption = 'Accounting'
            ExplicitWidth = 825
            ExplicitHeight = 670
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 847
              Height = 619
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 825
              ExplicitHeight = 670
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 757
                Height = 281
                TabOrder = 0
                DesignSize = (
                  757
                  281)
                object Label28: TLabel
                  Left = 35
                  Top = 189
                  Width = 84
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Default costgroup'
                end
                object Ltaxclass: TLabel
                  Left = 80
                  Top = 6
                  Width = 42
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Taxclass'
                end
                object GroupBox2: TGroupBox
                  Left = 7
                  Top = 79
                  Width = 399
                  Height = 102
                  Caption = 'Ledger'
                  TabOrder = 0
                  object Label9: TLabel
                    Left = 42
                    Top = 12
                    Width = 69
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Sales Account'
                  end
                  object Label10: TLabel
                    Left = 49
                    Top = 33
                    Width = 62
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cost of Sales'
                  end
                  object Label11: TLabel
                    Left = 47
                    Top = 56
                    Width = 64
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Stock Control'
                  end
                  object Label15: TLabel
                    Left = 53
                    Top = 79
                    Width = 58
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Last Invoice'
                  end
                  object edtSales: TEdit
                    Left = 120
                    Top = 8
                    Width = 241
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 0
                    OnKeyPress = FormKeyPress
                  end
                  object edtCOS: TEdit
                    Left = 120
                    Top = 30
                    Width = 241
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 2
                    OnKeyPress = FormKeyPress
                  end
                  object edtStockControl: TEdit
                    Left = 120
                    Top = 52
                    Width = 241
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 4
                    OnKeyPress = FormKeyPress
                  end
                  object edtLastInvoice: TEdit
                    Left = 120
                    Top = 74
                    Width = 117
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 6
                    OnKeyPress = FormKeyPress
                  end
                  object BBSales: TBitBtn
                    Left = 362
                    Top = 9
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
                    TabOrder = 1
                    OnClick = BBSalesClick
                  end
                  object BBCOS: TBitBtn
                    Left = 362
                    Top = 31
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
                    TabOrder = 3
                    OnClick = BBCOSClick
                  end
                  object BBStockControl: TBitBtn
                    Left = 362
                    Top = 53
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
                    TabOrder = 5
                    OnClick = BBStockControlClick
                  end
                end
                object gbSellingprices: TGroupBox
                  Left = 412
                  Top = 0
                  Width = 337
                  Height = 91
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Prices'
                  TabOrder = 1
                  object LExcl: TLabel
                    Left = 109
                    Top = 13
                    Width = 45
                    Height = 13
                    Caption = 'Exclusive'
                  end
                  object lblPrice1: TLabel
                    Left = 43
                    Top = 32
                    Width = 58
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Selling Price'
                  end
                  object lblPrice2: TLabel
                    Left = 43
                    Top = 52
                    Width = 58
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Selling Price'
                  end
                  object lblPrice3: TLabel
                    Left = 43
                    Top = 72
                    Width = 58
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Selling Price'
                  end
                  object LIncl: TLabel
                    Left = 217
                    Top = 13
                    Width = 42
                    Height = 13
                    Caption = 'Inclusive'
                  end
                  object edtSellingPrice1: TEdit
                    Left = 109
                    Top = 28
                    Width = 96
                    Height = 21
                    TabOrder = 0
                    OnDblClick = edtSellingPrice1DblClick
                    OnExit = edtSellingPrice1Exit
                    OnKeyPress = FormKeyPress
                  end
                  object edtSellingPrice2: TEdit
                    Left = 109
                    Top = 48
                    Width = 96
                    Height = 21
                    TabOrder = 1
                    OnExit = edtSellingPrice2Exit
                    OnKeyPress = FormKeyPress
                  end
                  object edtSellingPrice3: TEdit
                    Left = 109
                    Top = 68
                    Width = 96
                    Height = 21
                    TabOrder = 2
                    OnExit = edtSellingPrice3Exit
                    OnKeyPress = FormKeyPress
                  end
                  object edtSellingPrice3Inc: TEdit
                    Left = 217
                    Top = 68
                    Width = 96
                    Height = 21
                    TabOrder = 5
                    OnExit = edtSellingPrice3IncExit
                    OnKeyPress = FormKeyPress
                  end
                  object edtSellingPrice2Inc: TEdit
                    Left = 217
                    Top = 48
                    Width = 96
                    Height = 21
                    TabOrder = 4
                    OnExit = edtSellingPrice2IncExit
                    OnKeyPress = FormKeyPress
                  end
                  object edtSellingPrice1Inc: TEdit
                    Left = 217
                    Top = 28
                    Width = 96
                    Height = 21
                    TabOrder = 3
                    OnExit = edtSellingPrice1IncExit
                    OnKeyPress = FormKeyPress
                  end
                end
                object GroupBox4: TGroupBox
                  Left = 7
                  Top = 21
                  Width = 399
                  Height = 60
                  Caption = 'Tax'
                  TabOrder = 2
                  object Label6: TLabel
                    Left = 69
                    Top = 14
                    Width = 45
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Input Tax'
                  end
                  object Label7: TLabel
                    Left = 61
                    Top = 35
                    Width = 53
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Output Tax'
                  end
                  object edtInput: TEdit
                    Left = 124
                    Top = 10
                    Width = 237
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 0
                    OnKeyPress = FormKeyPress
                  end
                  object BBInput: TBitBtn
                    Left = 362
                    Top = 10
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
                    TabOrder = 1
                    OnClick = BBInputClick
                  end
                  object edtOutput: TEdit
                    Left = 124
                    Top = 31
                    Width = 237
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 2
                    OnKeyPress = FormKeyPress
                  end
                  object BBOutput: TBitBtn
                    Left = 362
                    Top = 31
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
                    TabOrder = 3
                    OnClick = BBOutputClick
                  end
                end
                object GroupBox1: TGroupBox
                  Left = 7
                  Top = 207
                  Width = 399
                  Height = 60
                  Caption = 'Weight'
                  TabOrder = 3
                  TabStop = True
                  object LNettoWeigth: TLabel
                    Left = 46
                    Top = 15
                    Width = 60
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Netto weight'
                  end
                  object LGrossWeight: TLabel
                    Left = 41
                    Top = 36
                    Width = 61
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Gross weight'
                  end
                  object ENettoWeigth: TEdit
                    Left = 110
                    Top = 11
                    Width = 127
                    Height = 21
                    TabStop = False
                    TabOrder = 0
                    OnKeyPress = FormKeyPress
                  end
                  object EGrossWeigth: TEdit
                    Left = 110
                    Top = 32
                    Width = 127
                    Height = 21
                    TabStop = False
                    TabOrder = 1
                    OnKeyPress = FormKeyPress
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 412
                  Top = 91
                  Width = 335
                  Height = 178
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Values'
                  TabOrder = 4
                  object LAvgCost: TLabel
                    Left = 47
                    Top = 17
                    Width = 64
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Average Cost'
                  end
                  object LTotalCost: TLabel
                    Left = 64
                    Top = 38
                    Width = 47
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Total cost'
                  end
                  object LQtyOnhand: TLabel
                    Left = 30
                    Top = 57
                    Width = 81
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Quantity on hand'
                  end
                  object LLatestCost: TLabel
                    Left = 58
                    Top = 83
                    Width = 53
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Latest Cost'
                  end
                  object LCostpr: TLabel
                    Left = 244
                    Top = 66
                    Width = 68
                    Height = 13
                    Caption = 'Next costprice'
                  end
                  object Label8: TLabel
                    Left = 45
                    Top = 105
                    Width = 63
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Reorder level'
                  end
                  object LReorderat: TLabel
                    Left = 58
                    Top = 126
                    Width = 50
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Reorder at'
                  end
                  object LMinimum: TLabel
                    Left = 67
                    Top = 147
                    Width = 41
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Minimum'
                  end
                  object edtAveCost: TEdit
                    Left = 121
                    Top = 13
                    Width = 116
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 0
                    OnExit = edtAveCostExit
                    OnKeyPress = FormKeyPress
                  end
                  object edtTotalCost: TEdit
                    Left = 121
                    Top = 34
                    Width = 116
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 1
                    OnExit = edtTotalCostExit
                    OnKeyPress = FormKeyPress
                  end
                  object edtQtyonHand: TEdit
                    Left = 121
                    Top = 56
                    Width = 116
                    Height = 21
                    TabStop = False
                    ReadOnly = True
                    TabOrder = 2
                    OnExit = edtQtyonHandExit
                    OnKeyPress = FormKeyPress
                  end
                  object edtLatestCost: TEdit
                    Left = 121
                    Top = 79
                    Width = 116
                    Height = 21
                    TabOrder = 3
                    OnKeyPress = FormKeyPress
                  end
                  object EPrice: TEdit
                    Left = 244
                    Top = 80
                    Width = 80
                    Height = 21
                    ParentColor = True
                    ReadOnly = True
                    TabOrder = 4
                    Text = 'EPrice'
                  end
                  object edtReorder: TEdit
                    Left = 121
                    Top = 101
                    Width = 116
                    Height = 21
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 5
                    OnKeyPress = FormKeyPress
                  end
                  object EReorderAt: TEdit
                    Left = 121
                    Top = 122
                    Width = 116
                    Height = 21
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 6
                    OnKeyPress = FormKeyPress
                  end
                  object EMinimum: TEdit
                    Left = 121
                    Top = 143
                    Width = 116
                    Height = 21
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 7
                    OnKeyPress = FormKeyPress
                  end
                end
                object cbDeFaultcostgroup: TComboBox
                  Left = 127
                  Top = 186
                  Width = 265
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 5
                end
                object cbTaxclass: TComboBox
                  Left = 131
                  Top = 3
                  Width = 261
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 6
                  OnChange = cbTaxclassChange
                end
              end
            end
          end
          object tsBom: TTabSheet
            Caption = 'Bom'
            ImageIndex = 1
            ExplicitWidth = 825
            ExplicitHeight = 670
            object PBom: TPanel
              Left = 0
              Top = 0
              Width = 847
              Height = 619
              Align = alClient
              TabOrder = 0
              Visible = False
              ExplicitWidth = 825
              ExplicitHeight = 670
              object Panel9: TPanel
                Left = 1
                Top = 1
                Width = 845
                Height = 80
                Align = alTop
                TabOrder = 0
                ExplicitWidth = 823
                object LBomList: TLabel
                  Left = 10
                  Top = 52
                  Width = 39
                  Height = 13
                  Caption = 'BOM list'
                end
                object LTotalCostPrice: TLabel
                  Left = 372
                  Top = 52
                  Width = 75
                  Height = 13
                  Caption = 'LTotalCostPrice'
                end
                object LTotalPrice: TLabel
                  Left = 552
                  Top = 52
                  Width = 54
                  Height = 13
                  Caption = 'LTotalPrice'
                end
                object Button1: TBitBtn
                  Left = 7
                  Top = 10
                  Width = 96
                  Height = 25
                  Caption = 'Add'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 0
                  OnClick = Button1Click
                end
                object Button2: TBitBtn
                  Left = 113
                  Top = 10
                  Width = 96
                  Height = 25
                  Caption = 'Delete'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 1
                  OnClick = Button2Click
                end
                object BRecalcpercent: TBitBtn
                  Left = 464
                  Top = 10
                  Width = 169
                  Height = 25
                  Caption = 'recalc sales perc'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 2
                  OnClick = BRecalcpercentClick
                end
                object rgRecalcBase: TRadioGroup
                  Left = 260
                  Top = 5
                  Width = 186
                  Height = 46
                  Caption = 'Recalc base'
                  ItemIndex = 0
                  Items.Strings = (
                    'Costprice'
                    'Sales price')
                  TabOrder = 3
                end
              end
              object cxGrid5: TcxGrid
                Left = 1
                Top = 81
                Width = 845
                Height = 537
                Align = alClient
                TabOrder = 1
                ExplicitWidth = 823
                ExplicitHeight = 588
                object cxGrid5DBTableView1: TcxGridDBTableView
                  OnDblClick = DBGBomDblClick
                  NavigatorButtons.ConfirmDelete = False
                  DataController.DataSource = DSBom
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsData.Deleting = False
                  OptionsData.Inserting = False
                  OptionsView.Footer = True
                  Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                  object cxGrid5DBTableView1WBOMID: TcxGridDBColumn
                    DataBinding.FieldName = 'WBOMID'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxGrid5DBTableView1WSTOCKID: TcxGridDBColumn
                    DataBinding.FieldName = 'WSTOCKID'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxGrid5DBTableView1WLINKEDSTOCKID: TcxGridDBColumn
                    DataBinding.FieldName = 'WLINKEDSTOCKID'
                    Visible = False
                    VisibleForCustomization = False
                    Width = 148
                  end
                  object cxGrid5DBTableView1SSTOCKCODE: TcxGridDBColumn
                    DataBinding.FieldName = 'SSTOCKCODE'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxGrid5DBTableView1SDESCRIPTION: TcxGridDBColumn
                    DataBinding.FieldName = 'SDESCRIPTION'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxGrid5DBTableView1LSTOCKCODE: TcxGridDBColumn
                    DataBinding.FieldName = 'LSTOCKCODE'
                    Options.Editing = False
                    Width = 130
                  end
                  object cxGrid5DBTableView1LSTOCKDESC: TcxGridDBColumn
                    DataBinding.FieldName = 'LSTOCKDESC'
                    Options.Editing = False
                    Width = 199
                  end
                  object cxGrid5DBTableView1FQTY: TcxGridDBColumn
                    DataBinding.FieldName = 'FQTY'
                  end
                  object cxGrid5DBTableView1FPERCENTAGEOFSALE: TcxGridDBColumn
                    DataBinding.FieldName = 'FPERCENTAGEOFSALE'
                    Width = 116
                  end
                  object cxGrid5DBTableView1FUNITAVECOST: TcxGridDBColumn
                    DataBinding.FieldName = 'FUNITAVECOST'
                    Options.Editing = False
                    Width = 97
                  end
                  object cxGrid5DBTableView1FUNITCOST: TcxGridDBColumn
                    DataBinding.FieldName = 'FUNITCOST'
                    Options.Editing = False
                  end
                  object cxGrid5DBTableView1FQTYONHAND: TcxGridDBColumn
                    DataBinding.FieldName = 'FQTYONHAND'
                    Options.Editing = False
                  end
                  object cxGrid5DBTableView1FSELLINGPRICE2: TcxGridDBColumn
                    DataBinding.FieldName = 'FSELLINGPRICE2'
                    Options.Editing = False
                  end
                end
                object cxGrid5Level1: TcxGridLevel
                  GridView = cxGrid5DBTableView1
                end
              end
            end
          end
          object TSInvoices: TTabSheet
            BorderWidth = 5
            Caption = 'Invoices'
            ImageIndex = 2
            ExplicitWidth = 825
            ExplicitHeight = 670
            object cxGrid2: TcxGrid
              Left = 0
              Top = 0
              Width = 837
              Height = 609
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 815
              ExplicitHeight = 660
              object cxGrid2DBTableView1: TcxGridDBTableView
                OnDblClick = DBGDocumentsDblClick
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsDocs
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid2DBTableView1DDATE
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FEXCLUSIVEAMT'
                    Column = cxGrid2DBTableView1FEXCLUSIVEAMT
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid2DBTableView1DDATE
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FEXCLUSIVEAMT'
                    Column = cxGrid2DBTableView1FEXCLUSIVEAMT
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FINCLUSIVEAMT'
                    Column = cxGrid2DBTableView1FINCLUSIVEAMT
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FQTYSHIPPED'
                    Column = cxGrid2DBTableView1FQTYSHIPPED
                  end>
                DataController.Summary.SummaryGroups = <
                  item
                    Links = <>
                    SummaryItems = <
                      item
                        Format = '0'
                        Kind = skCount
                        FieldName = 'DDATE'
                        Column = cxGrid2DBTableView1DDATE
                      end
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FEXCLUSIVEAMT'
                        Column = cxGrid2DBTableView1FEXCLUSIVEAMT
                      end>
                  end>
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.Footer = True
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid2DBTableView1WDOCID: TcxGridDBColumn
                  DataBinding.FieldName = 'WDOCID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid2DBTableView1DDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DDATE'
                  DateTimeGrouping = dtgByMonth
                end
                object cxGrid2DBTableView1FQTYSHIPPED: TcxGridDBColumn
                  DataBinding.FieldName = 'FQTYSHIPPED'
                end
                object cxGrid2DBTableView1SDOCNO: TcxGridDBColumn
                  DataBinding.FieldName = 'SDOCNO'
                end
                object cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'SDESCRIPTION'
                  Width = 301
                end
                object cxGrid2DBTableView1FSELLINGPRICE: TcxGridDBColumn
                  DataBinding.FieldName = 'FSELLINGPRICE'
                end
                object cxGrid2DBTableView1FITEMDISCOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FITEMDISCOUNT'
                  Width = 94
                end
                object cxGrid2DBTableView1FEXCLUSIVEAMT: TcxGridDBColumn
                  DataBinding.FieldName = 'FEXCLUSIVEAMT'
                  Width = 96
                end
                object cxGrid2DBTableView1FINCLUSIVEAMT: TcxGridDBColumn
                  DataBinding.FieldName = 'FINCLUSIVEAMT'
                  Width = 103
                end
                object cxGrid2DBTableView1PRICEPERITEM: TcxGridDBColumn
                  DataBinding.FieldName = 'PRICEPERITEM'
                  Width = 89
                end
                object cxGrid2DBTableView1FUNITQTY: TcxGridDBColumn
                  DataBinding.FieldName = 'FUNITQTY'
                  Width = 79
                end
                object cxGrid2DBTableView1UNITDESC: TcxGridDBColumn
                  DataBinding.FieldName = 'UNITDESC'
                  Width = 89
                end
                object cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn
                  DataBinding.FieldName = 'SACCOUNTCODE'
                  Width = 101
                end
                object cxGrid2DBTableView1ACCDESC: TcxGridDBColumn
                  DataBinding.FieldName = 'ACCDESC'
                end
                object cxGrid2DBTableView1WTYPEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WTYPEID'
                end
                object cxGrid2DBTableView1BPOSTED: TcxGridDBColumn
                  DataBinding.FieldName = 'BPOSTED'
                end
              end
              object cxGrid2Level1: TcxGridLevel
                GridView = cxGrid2DBTableView1
              end
            end
          end
          object TSMovements: TTabSheet
            Caption = 'Movements'
            ImageIndex = 3
            ExplicitWidth = 825
            ExplicitHeight = 670
            object LopenQty: TLabel
              Left = 0
              Top = 0
              Width = 847
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'LopenQty'
              ExplicitWidth = 46
            end
            object cxGrid3: TcxGrid
              Left = 0
              Top = 13
              Width = 847
              Height = 606
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 825
              ExplicitHeight = 657
              object cxGrid3DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsStockTrans
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid3DBTableView1DDATE
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid3DBTableView1DDATE
                  end
                  item
                    Format = '0.########'
                    Kind = skSum
                    FieldName = 'FQTY'
                    Column = cxGrid3DBTableView1FQTY
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.Footer = True
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid3DBTableView1WSTOCKID: TcxGridDBColumn
                  DataBinding.FieldName = 'WSTOCKID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid3DBTableView1DDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DDATE'
                  DateTimeGrouping = dtgByMonth
                  Width = 93
                end
                object cxGrid3DBTableView1FQTY: TcxGridDBColumn
                  DataBinding.FieldName = 'FQTY'
                end
                object cxGrid3DBTableView1FCOSTPRICE: TcxGridDBColumn
                  DataBinding.FieldName = 'FCOSTPRICE'
                  Width = 111
                end
                object cxGrid3DBTableView1FSELLINGPRICE: TcxGridDBColumn
                  DataBinding.FieldName = 'FSELLINGPRICE'
                  Width = 112
                end
                object cxGrid3DBTableView1WLINEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WLINEID'
                  Width = 82
                end
                object cxGrid3DBTableView1SDOCNO: TcxGridDBColumn
                  DataBinding.FieldName = 'SDOCNO'
                  Width = 98
                end
                object cxGrid3DBTableView1SREFERENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SREFERENCE'
                  Width = 212
                end
                object cxGrid3DBTableView1SUSERNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'SUSERNAME'
                end
                object cxGrid3DBTableView1CUMMTOT: TcxGridDBColumn
                  DataBinding.FieldName = 'CUMMTOT'
                end
                object cxGrid3DBTableView1WSTOCKTRANSACTIONID: TcxGridDBColumn
                  Caption = 'id'
                  DataBinding.FieldName = 'WSTOCKTRANSACTIONID'
                end
                object cxGrid3DBTableView1BPOSTED: TcxGridDBColumn
                  DataBinding.FieldName = 'BPOSTED'
                end
                object cxGrid3DBTableView1WTYPEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WTYPEID'
                end
                object cxGrid3DBTableView1WSALESMANID: TcxGridDBColumn
                  DataBinding.FieldName = 'WSALESMANID'
                  Visible = False
                  VisibleForCustomization = False
                  Width = 124
                end
                object cxGrid3DBTableView1WDOCID: TcxGridDBColumn
                  DataBinding.FieldName = 'WDOCID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid3DBTableView1WDOCTYPEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WDOCTYPEID'
                  Visible = False
                  VisibleForCustomization = False
                  Width = 127
                end
                object cxGrid3DBTableView1WACCOUNTID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid3DBTableView1DSYSDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DSYSDATE'
                  Visible = False
                  VisibleForCustomization = False
                end
              end
              object cxGrid3Level1: TcxGridLevel
                GridView = cxGrid3DBTableView1
              end
            end
          end
          object tsExtra: TTabSheet
            Caption = 'Extra'
            ImageIndex = 4
            ExplicitWidth = 825
            ExplicitHeight = 670
            object Image1: TImage
              Left = 0
              Top = 41
              Width = 847
              Height = 578
              Align = alClient
              Proportional = True
              ExplicitLeft = 12
              ExplicitTop = 59
              ExplicitWidth = 957
              ExplicitHeight = 318
            end
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 847
              Height = 41
              Align = alTop
              TabOrder = 0
              ExplicitWidth = 825
              object BSelectImage: TBitBtn
                Left = 12
                Top = 4
                Width = 105
                Height = 25
                Caption = 'Select image'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = BSelectImageClick
              end
              object BDeleteimage: TBitBtn
                Left = 124
                Top = 4
                Width = 101
                Height = 25
                Caption = 'Delete image'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = BDeleteimageClick
              end
            end
          end
          object TSOptions: TTabSheet
            Caption = 'Options'
            ImageIndex = 5
            ExplicitWidth = 825
            ExplicitHeight = 670
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 185
              Height = 504
              Align = alLeft
              TabOrder = 0
              ExplicitHeight = 555
              object LLinkedOptions: TLabel
                Left = 20
                Top = 108
                Width = 69
                Height = 13
                Caption = 'Linked options'
              end
              object Label22: TLabel
                Left = 4
                Top = 120
                Width = 6
                Height = 13
                Caption = '1'
              end
              object Label23: TLabel
                Left = 4
                Top = 144
                Width = 6
                Height = 13
                Caption = '2'
              end
              object Label24: TLabel
                Left = 4
                Top = 168
                Width = 6
                Height = 13
                Caption = '3'
              end
              object Label25: TLabel
                Left = 4
                Top = 192
                Width = 6
                Height = 13
                Caption = '4'
              end
              object Label26: TLabel
                Left = 4
                Top = 216
                Width = 6
                Height = 13
                Caption = '5'
              end
              object DBLookupComboBox1: TDBLookupComboBox
                Left = 20
                Top = 124
                Width = 145
                Height = 21
                DataField = 'WITEMOPTION1ID'
                DataSource = dsZQDefoptions
                KeyField = 'WITEMOPTIONID'
                ListField = 'SDESCRIPTION'
                ListSource = dsZqoptions
                TabOrder = 0
              end
              object DBLookupComboBox2: TDBLookupComboBox
                Left = 20
                Top = 148
                Width = 145
                Height = 21
                DataField = 'WITEMOPTION2ID'
                DataSource = dsZQDefoptions
                KeyField = 'WITEMOPTIONID'
                ListField = 'SDESCRIPTION'
                ListSource = dsZqoptions
                TabOrder = 1
                OnKeyUp = DBLookupComboBox2KeyUp
              end
              object DBLookupComboBox3: TDBLookupComboBox
                Left = 20
                Top = 172
                Width = 145
                Height = 21
                DataField = 'WITEMOPTION3ID'
                DataSource = dsZQDefoptions
                KeyField = 'WITEMOPTIONID'
                ListField = 'SDESCRIPTION'
                ListSource = dsZqoptions
                TabOrder = 2
                OnKeyUp = DBLookupComboBox2KeyUp
              end
              object DBLookupComboBox4: TDBLookupComboBox
                Left = 20
                Top = 196
                Width = 145
                Height = 21
                DataField = 'WITEMOPTION4ID'
                DataSource = dsZQDefoptions
                KeyField = 'WITEMOPTIONID'
                ListField = 'SDESCRIPTION'
                ListSource = dsZqoptions
                TabOrder = 3
                OnKeyUp = DBLookupComboBox2KeyUp
              end
              object DBLookupComboBox5: TDBLookupComboBox
                Left = 20
                Top = 220
                Width = 145
                Height = 21
                DataField = 'WITEMOPTION5ID'
                DataSource = dsZQDefoptions
                KeyField = 'WITEMOPTIONID'
                ListField = 'SDESCRIPTION'
                ListSource = dsZqoptions
                TabOrder = 4
                OnKeyUp = DBLookupComboBox2KeyUp
              end
              object BGenOptions: TBitBtn
                Left = 11
                Top = 54
                Width = 163
                Height = 25
                Caption = 'generate'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 5
                OnClick = BGenOptionsClick
              end
              object cBViewAsTree: TDBCheckBox
                Left = 20
                Top = 248
                Width = 141
                Height = 17
                Caption = 'View as tree'
                DataField = 'WLOOKUPTYPE'
                DataSource = dsZQDefoptions
                TabOrder = 6
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object BRemoveOptions: TBitBtn
                Left = 10
                Top = 14
                Width = 163
                Height = 25
                Caption = 'remove'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 7
                OnClick = BRemoveOptionsClick
              end
            end
            object cxGrid4: TcxGrid
              Left = 185
              Top = 0
              Width = 662
              Height = 504
              Align = alClient
              PopupMenu = pmlinesactive
              TabOrder = 1
              ExplicitWidth = 640
              ExplicitHeight = 555
              object cxGrid4DBTableView1: TcxGridDBTableView
                PopupMenu = pmlinesactive
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsZQStockoptions
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0'
                    Kind = skSum
                    FieldName = 'EXPECTED'
                    Column = cxGrid4DBTableView1EXPECTED
                  end
                  item
                    Format = '0'
                    Kind = skSum
                    FieldName = 'FQTYONHAND'
                    Column = cxGrid4DBTableView1FQTYONHAND
                  end
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'WITEMOPTIONVALUE1ID'
                    Column = cxGrid4DBTableView1WITEMOPTIONVALUE1ID
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsSelection.MultiSelect = True
                OptionsView.Footer = True
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid4DBTableView1WSTOCKOPTIONSID: TcxGridDBColumn
                  DataBinding.FieldName = 'WSTOCKOPTIONSID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid4DBTableView1WSTOCKID: TcxGridDBColumn
                  DataBinding.FieldName = 'WSTOCKID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid4DBTableView1WITEMOPTIONVALUE2ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WITEMOPTIONVALUE2ID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid4DBTableView1WITEMOPTIONVALUE3ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WITEMOPTIONVALUE3ID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid4DBTableView1WITEMOPTIONVALUE4ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WITEMOPTIONVALUE4ID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid4DBTableView1WITEMOPTIONVALUE5ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WITEMOPTIONVALUE5ID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid4DBTableView1FEXTRAPRICE: TcxGridDBColumn
                  DataBinding.FieldName = 'FEXTRAPRICE'
                  RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                end
                object cxGrid4DBTableView1FEXTRAPRICE2: TcxGridDBColumn
                  DataBinding.FieldName = 'FEXTRAPRICE2'
                  RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                end
                object cxGrid4DBTableView1FEXTRAPRICE3: TcxGridDBColumn
                  DataBinding.FieldName = 'FEXTRAPRICE3'
                  RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                end
                object cxGrid4DBTableView1WITEMOPTIONVALUE1ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WITEMOPTIONVALUE1ID'
                  Options.Editing = False
                  Width = 146
                end
                object cxGrid4DBTableView1FQTYONHAND: TcxGridDBColumn
                  DataBinding.FieldName = 'FQTYONHAND'
                  RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                end
                object cxGrid4DBTableView1SBARCODE: TcxGridDBColumn
                  DataBinding.FieldName = 'SBARCODE'
                end
                object cxGrid4DBTableView1SREFERENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SREFERENCE'
                end
                object cxGrid4DBTableView1FUNITCOST: TcxGridDBColumn
                  DataBinding.FieldName = 'FUNITCOST'
                  RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                end
                object cxGrid4DBTableView1FUNITAVECOST: TcxGridDBColumn
                  DataBinding.FieldName = 'FUNITAVECOST'
                  RepositoryItem = dmQuantumGridDefs.osfCuWithHighDecimal
                end
                object cxGrid4DBTableView1FREORDERQTY: TcxGridDBColumn
                  DataBinding.FieldName = 'FREORDERQTY'
                  RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                end
                object cxGrid4DBTableView1FREORDERQTYTRIG: TcxGridDBColumn
                  DataBinding.FieldName = 'FREORDERQTYTRIG'
                  RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                end
                object cxGrid4DBTableView1EXPECTED: TcxGridDBColumn
                  DataBinding.FieldName = 'EXPECTED'
                  RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
                  Options.Editing = False
                end
                object cxGrid4DBTableView1BENABLED: TcxGridDBColumn
                  Caption = 'Enabled'
                  DataBinding.FieldName = 'BENABLED'
                  RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
                end
                object cxGrid4DBTableView1WBOXSIZE: TcxGridDBColumn
                  Caption = 'Boxsize'
                  DataBinding.FieldName = 'WBOXSIZE'
                end
              end
              object cxGrid4Level1: TcxGridLevel
                GridView = cxGrid4DBTableView1
              end
            end
            object poptfreefields: TPanel
              Left = 0
              Top = 512
              Width = 847
              Height = 107
              Align = alBottom
              TabOrder = 2
              ExplicitTop = 563
              ExplicitWidth = 825
            end
            object cxSplitter1: TcxSplitter
              Left = 0
              Top = 504
              Width = 847
              Height = 8
              Cursor = crVSplit
              HotZoneClassName = 'TcxXPTaskBarStyle'
              AlignSplitter = salBottom
              AutoSnap = True
              Control = ScrollBox2
              Color = clBtnShadow
              ParentColor = False
              ExplicitTop = 555
              ExplicitWidth = 825
            end
          end
          object tstranslations: TTabSheet
            Caption = 'descriptions'
            ImageIndex = 6
            ExplicitWidth = 825
            ExplicitHeight = 670
            object PTranslations: TPanel
              Tag = 99
              Left = 0
              Top = 0
              Width = 847
              Height = 619
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 825
              ExplicitHeight = 670
              object PLangText: TPanel
                Left = 0
                Top = 30
                Width = 847
                Height = 589
                Align = alClient
                TabOrder = 0
                ExplicitWidth = 825
                ExplicitHeight = 640
                object DBCtrlGrid1: TDBCtrlGrid
                  Left = 1
                  Top = 1
                  Width = 845
                  Height = 587
                  Align = alClient
                  AllowDelete = False
                  AllowInsert = False
                  DataSource = DSDescriptions
                  PanelHeight = 293
                  PanelWidth = 829
                  TabOrder = 0
                  RowCount = 2
                  SelectedColor = clActiveBorder
                  ExplicitWidth = 823
                  ExplicitHeight = 638
                  object LLangDescription: TLabel
                    Left = 0
                    Top = 0
                    Width = 829
                    Height = 13
                    Align = alTop
                    Caption = 'Description'
                    FocusControl = DBEdit1
                    ExplicitWidth = 53
                  end
                  object LLangText: TLabel
                    Left = 0
                    Top = 34
                    Width = 829
                    Height = 13
                    Align = alTop
                    Caption = 'Text'
                    GlowSize = 5
                    ExplicitWidth = 21
                  end
                  object DBText1: TDBText
                    Left = 140
                    Top = 0
                    Width = 69
                    Height = 13
                    DataField = 'LangLookup'
                    DataSource = DSDescriptions
                  end
                  object DBEdit1: TDBEdit
                    Left = 0
                    Top = 13
                    Width = 829
                    Height = 21
                    Align = alTop
                    DataField = 'SDESCRIPTION'
                    DataSource = DSDescriptions
                    TabOrder = 0
                    ExplicitWidth = 807
                  end
                  object DBMemo1: TDBMemo
                    Left = 0
                    Top = 47
                    Width = 829
                    Height = 246
                    Align = alClient
                    DataField = 'SEXTRADESCRIPTION'
                    DataSource = DSDescriptions
                    ParentShowHint = False
                    PopupMenu = PopupMenu1
                    ScrollBars = ssBoth
                    ShowHint = True
                    TabOrder = 1
                    OnDblClick = DBMemo1DblClick
                    ExplicitWidth = 807
                    ExplicitHeight = 272
                  end
                end
                object PEditOneLang: TPanel
                  Left = 12
                  Top = 262
                  Width = 845
                  Height = 293
                  TabOrder = 1
                  Visible = False
                  DesignSize = (
                    845
                    293)
                  object LLangText2: TLabel
                    Left = 8
                    Top = 62
                    Width = 21
                    Height = 13
                    Caption = 'Text'
                  end
                  object LLangDescription2: TLabel
                    Left = 8
                    Top = 25
                    Width = 53
                    Height = 13
                    Caption = 'Description'
                    FocusControl = DBEdit2
                  end
                  object DBText2: TDBText
                    Left = 141
                    Top = 26
                    Width = 69
                    Height = 13
                    DataField = 'LangLookup'
                    DataSource = DSDescriptions
                  end
                  object DBEdit2: TDBEdit
                    Left = 8
                    Top = 40
                    Width = 817
                    Height = 21
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SDESCRIPTION'
                    DataSource = DSDescriptions
                    TabOrder = 0
                  end
                end
              end
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 847
                Height = 30
                Align = alTop
                TabOrder = 1
                ExplicitWidth = 825
                object LLanguage: TLabel
                  Left = 12
                  Top = 8
                  Width = 48
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Language'
                  FocusControl = DBLookupComboBox6
                end
                object Label4: TLabel
                  Left = 564
                  Top = 12
                  Width = 27
                  Height = 13
                  Caption = 'Rows'
                end
                object DBLookupComboBox6: TDBLookupComboBox
                  Left = 64
                  Top = 4
                  Width = 274
                  Height = 21
                  DataField = 'LangLookup'
                  DataSource = DSDescriptions
                  ReadOnly = True
                  TabOrder = 0
                  Visible = False
                end
                object Blangfreefields: TBitBtn
                  Left = 348
                  Top = 4
                  Width = 117
                  Height = 21
                  Caption = 'Freefields'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 1
                  OnClick = BlangfreefieldsClick
                end
                object cbCurLang: TComboBox
                  Left = 64
                  Top = 4
                  Width = 273
                  Height = 21
                  Style = csDropDownList
                  TabOrder = 2
                  OnChange = cbCurLangChange
                end
                object cbDescqtyShow: TComboBox
                  Left = 508
                  Top = 4
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  ItemIndex = 1
                  TabOrder = 3
                  Text = '2'
                  OnChange = cbDescqtyShowChange
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5')
                end
              end
            end
          end
          object TSGroups: TTabSheet
            Caption = 'Multigroups'
            ImageIndex = 7
            ExplicitWidth = 825
            ExplicitHeight = 670
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 847
              Height = 619
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 825
              ExplicitHeight = 670
              object DBNavigator2: TDBNavigator
                Left = 1
                Top = 1
                Width = 845
                Height = 37
                DataSource = dsMultiGroup
                Align = alTop
                TabOrder = 0
                ExplicitWidth = 823
              end
              object cxGridmmgroup: TcxGrid
                Left = 1
                Top = 38
                Width = 845
                Height = 580
                Align = alClient
                TabOrder = 1
                ExplicitWidth = 823
                ExplicitHeight = 631
                object cxMultiGroupGrid: TcxGridDBTableView
                  NavigatorButtons.ConfirmDelete = False
                  DataController.DataSource = dsMultiGroup
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                  object cxMultiGroupGridWGROUPID: TcxGridDBColumn
                    DataBinding.FieldName = 'WGROUPID'
                    RepositoryItem = osfStockGroup1
                  end
                  object cxMultiGroupGridWSTOCKID: TcxGridDBColumn
                    DataBinding.FieldName = 'WSTOCKID'
                    Visible = False
                    VisibleForCustomization = False
                  end
                  object cxMultiGroupGridIMP_SOURCEID: TcxGridDBColumn
                    DataBinding.FieldName = 'IMP_SOURCEID'
                    Visible = False
                    VisibleForCustomization = False
                  end
                end
                object cxGridmmgroupLevel1: TcxGridLevel
                  GridView = cxMultiGroupGrid
                end
              end
            end
          end
          object tsBackorder: TTabSheet
            Caption = 'backorder'
            ImageIndex = 8
            ExplicitWidth = 825
            ExplicitHeight = 670
          end
          object tsLinksale: TTabSheet
            Caption = 'Linksale'
            ImageIndex = 11
            ExplicitWidth = 825
            ExplicitHeight = 670
            object panel7: TPanel
              Left = 0
              Top = 0
              Width = 847
              Height = 149
              Align = alTop
              TabOrder = 0
              ExplicitWidth = 825
              object Label12: TLabel
                Left = 8
                Top = 44
                Width = 29
                Height = 13
                Caption = 'Group'
              end
              object Label13: TLabel
                Left = 168
                Top = 44
                Width = 48
                Height = 13
                Caption = 'Groupitem'
              end
              object Label14: TLabel
                Left = 160
                Top = 100
                Width = 50
                Height = 13
                Caption = 'Extra price'
                FocusControl = DBEdit4
              end
              object Label20: TLabel
                Left = 8
                Top = 100
                Width = 44
                Height = 13
                Caption = 'Pricetype'
                FocusControl = DBEdit5
              end
              object Label21: TLabel
                Left = 308
                Top = 100
                Width = 27
                Height = 13
                Caption = 'Sortid'
                FocusControl = DBEdit6
              end
              object Label27: TLabel
                Left = 316
                Top = 44
                Width = 58
                Height = 13
                Caption = 'Linkedstock'
                FocusControl = DBEdit7
              end
              object DBNavigator1: TDBNavigator
                Left = 1
                Top = 1
                Width = 845
                Height = 40
                DataSource = dsLinkSale
                Align = alTop
                TabOrder = 0
                ExplicitWidth = 823
              end
              object DBEdit4: TDBEdit
                Left = 160
                Top = 116
                Width = 134
                Height = 21
                DataField = 'FEXTRAPRICE'
                DataSource = dsLinkSale
                TabOrder = 1
              end
              object DBEdit5: TDBEdit
                Left = 8
                Top = 116
                Width = 134
                Height = 21
                DataField = 'WPRICETYPE'
                DataSource = dsLinkSale
                TabOrder = 2
              end
              object DBEdit6: TDBEdit
                Left = 308
                Top = 116
                Width = 134
                Height = 21
                DataField = 'WSORTID'
                DataSource = dsLinkSale
                TabOrder = 3
              end
              object DBEdit7: TDBEdit
                Left = 316
                Top = 70
                Width = 281
                Height = 21
                DataField = 'WLINKSTOCKID'
                DataSource = dsLinkSale
                TabOrder = 4
              end
              object DBLookupComboBox7: TDBLookupComboBox
                Left = 8
                Top = 72
                Width = 145
                Height = 21
                DataField = 'WGROUPID'
                DataSource = dsLinkSale
                KeyField = 'WGROUPID'
                ListField = 'SDESCRIPTION'
                ListSource = DSlinkmaingroup
                TabOrder = 5
                OnExit = DBLookupComboBox7Exit
              end
              object DBLookupComboBox8: TDBLookupComboBox
                Left = 168
                Top = 70
                Width = 129
                Height = 21
                DataField = 'WGROUPITEMID'
                DataSource = dsLinkSale
                KeyField = 'WGROUPID'
                ListField = 'SDESCRIPTION'
                ListSource = DSLinkSubgroup
                TabOrder = 6
              end
              object Blookuplinkstock: TBitBtn
                Left = 598
                Top = 69
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
                TabOrder = 7
                OnClick = BlookuplinkstockClick
              end
              object BitBtn3: TBitBtn
                Left = 700
                Top = 64
                Width = 75
                Height = 25
                Caption = 'Example'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 8
                OnClick = BitBtn3Click
              end
            end
            object cxGrid6: TcxGrid
              Left = 0
              Top = 149
              Width = 847
              Height = 470
              Align = alClient
              TabOrder = 1
              ExplicitWidth = 825
              ExplicitHeight = 521
              object cxGrid6DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsLinkSale
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid6DBTableView1WGROUPID: TcxGridDBColumn
                  Caption = 'Group'
                  DataBinding.FieldName = 'WGROUPID'
                  Options.Editing = False
                  Width = 123
                end
                object cxGrid6DBTableView1WGROUPITEMID: TcxGridDBColumn
                  Caption = 'Item'
                  DataBinding.FieldName = 'WGROUPITEMID'
                  Options.Editing = False
                  Width = 160
                end
                object cxGrid6DBTableView1WLINKSTOCKID: TcxGridDBColumn
                  Caption = 'Linked stock'
                  DataBinding.FieldName = 'WLINKSTOCKID'
                  Options.Editing = False
                  Width = 93
                end
                object cxGrid6DBTableView1FEXTRAPRICE: TcxGridDBColumn
                  Caption = 'Extra price'
                  DataBinding.FieldName = 'FEXTRAPRICE'
                  Width = 127
                end
                object cxGrid6DBTableView1WPRICETYPE: TcxGridDBColumn
                  Caption = 'Price type'
                  DataBinding.FieldName = 'WPRICETYPE'
                  Options.Editing = False
                  Width = 107
                end
                object cxGrid6DBTableView1WSORTID: TcxGridDBColumn
                  Caption = 'Sort order'
                  DataBinding.FieldName = 'WSORTID'
                  Width = 92
                end
              end
              object cxGrid6Level1: TcxGridLevel
                GridView = cxGrid6DBTableView1
              end
            end
          end
        end
        object ScrollBox2: TScrollBox
          Left = 0
          Top = 0
          Width = 855
          Height = 145
          Align = alTop
          TabOrder = 1
          ExplicitWidth = 841
          object StandardPanel: TPanel
            Left = -20
            Top = -23
            Width = 869
            Height = 143
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            DesignSize = (
              869
              143)
            object LStockIncUnposted: TLabel
              Left = 46
              Top = 99
              Width = 104
              Height = 13
              Alignment = taRightJustify
              Caption = 'Inc unposted invoices'
            end
            object Label1: TLabel
              Left = 94
              Top = 45
              Width = 56
              Height = 15
              Alignment = taRightJustify
              Caption = 'Stock Code'
            end
            object SPChangeCode: TSpeedButton
              Left = 358
              Top = 43
              Width = 151
              Height = 21
              Caption = 'Change code'
              OnClick = SPChangeCodeClick
            end
            object Label2: TLabel
              Left = 97
              Top = 67
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Description'
            end
            object LCDDisabled: TLabel
              Left = 560
              Top = 4
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Disabled'
            end
            object LcboxInvDiscount: TLabel
              Left = 529
              Top = 63
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = 'Apply Invoice discount'
            end
            object EUnposted: TEdit
              Left = 158
              Top = 95
              Width = 396
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
              OnDblClick = EUnpostedDblClick
            end
            object edtStockCode: TEdit
              Left = 158
              Top = 42
              Width = 197
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 15
              PopupMenu = PopupMenu1
              TabOrder = 2
              OnExit = edtStockCodeExit
              OnKeyPress = FormKeyPress
            end
            object edtDescription: TEdit
              Left = 158
              Top = 67
              Width = 325
              Height = 21
              MaxLength = 35
              TabOrder = 3
              OnDblClick = edtDescriptionClick
              OnExit = edtDescriptionExit
              OnKeyPress = FormKeyPress
            end
            object CDDisabled: TCheckBox
              Left = 612
              Top = 2
              Width = 16
              Height = 17
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              TabOrder = 4
              OnKeyPress = FormKeyPress
            end
            object cboxInvDiscount: TCheckBox
              Left = 642
              Top = 62
              Width = 16
              Height = 17
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              TabOrder = 5
              OnKeyPress = FormKeyPress
            end
            object PChangeCode: TPanel
              Left = 358
              Top = 29
              Width = 220
              Height = 72
              ParentBackground = False
              ParentColor = True
              TabOrder = 0
              Visible = False
              OnExit = PChangeCodeExit
              object LNewStockCode: TLabel
                Left = 8
                Top = 4
                Width = 78
                Height = 13
                Caption = 'New stock code'
              end
              object ENewStockCode: TEdit
                Left = 8
                Top = 20
                Width = 197
                Height = 21
                TabOrder = 0
              end
              object BitBtn1: TBitBtn
                Left = 8
                Top = 44
                Width = 96
                Height = 25
                Caption = 'OK'
                Default = True
                DoubleBuffered = True
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333333333333333330000333333333333333333333333F33333333333
                  00003333344333333333333333388F3333333333000033334224333333333333
                  338338F3333333330000333422224333333333333833338F3333333300003342
                  222224333333333383333338F3333333000034222A22224333333338F338F333
                  8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
                  33333338F83338F338F33333000033A33333A222433333338333338F338F3333
                  0000333333333A222433333333333338F338F33300003333333333A222433333
                  333333338F338F33000033333333333A222433333333333338F338F300003333
                  33333333A222433333333333338F338F00003333333333333A22433333333333
                  3338F38F000033333333333333A223333333333333338F830000333333333333
                  333A333333333333333338330000333333333333333333333333333333333333
                  0000}
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = BitBtn1Click
              end
              object BitBtn2: TBitBtn
                Left = 112
                Top = 44
                Width = 96
                Height = 25
                Cancel = True
                Caption = 'Cancel'
                DoubleBuffered = True
                Glyph.Data = {
                  DE010000424DDE01000000000000760000002800000024000000120000000100
                  0400000000006801000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333333333000033338833333333333333333F333333333333
                  0000333911833333983333333388F333333F3333000033391118333911833333
                  38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
                  911118111118333338F3338F833338F3000033333911111111833333338F3338
                  3333F8330000333333911111183333333338F333333F83330000333333311111
                  8333333333338F3333383333000033333339111183333333333338F333833333
                  00003333339111118333333333333833338F3333000033333911181118333333
                  33338333338F333300003333911183911183333333383338F338F33300003333
                  9118333911183333338F33838F338F33000033333913333391113333338FF833
                  38F338F300003333333333333919333333388333338FFF830000333333333333
                  3333333333333333333888330000333333333333333333333333333333333333
                  0000}
                ParentDoubleBuffered = False
                TabOrder = 2
                OnClick = PChangeCodeExit
              end
            end
          end
        end
        object Splitter2: TcxSplitter
          Left = 0
          Top = 145
          Width = 855
          Height = 8
          Cursor = crVSplit
          HotZoneClassName = 'TcxXPTaskBarStyle'
          AlignSplitter = salTop
          AutoSnap = True
          Control = ScrollBox2
          Color = clBtnShadow
          ParentColor = False
          ExplicitTop = 92
          ExplicitWidth = 833
        end
      end
    end
    object PEditButtons: TPanel
      Left = 0
      Top = 0
      Width = 145
      Height = 828
      Align = alLeft
      TabOrder = 1
      ExplicitHeight = 826
      object LUpdatetype: TLabel
        Left = 12
        Top = 390
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Update type'
      end
      object ImTumb: TImage
        Left = 4
        Top = 440
        Width = 137
        Height = 133
        IncrementalDisplay = True
        Proportional = True
      end
      object BNew: TBitBtn
        Left = 8
        Top = 25
        Width = 123
        Height = 25
        Caption = 'New'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BNewClick
      end
      object BDelete: TBitBtn
        Left = 8
        Top = 56
        Width = 123
        Height = 25
        Caption = 'Delete'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BDeleteClick
      end
      object BEdit: TBitBtn
        Left = 8
        Top = 88
        Width = 123
        Height = 25
        Caption = 'Edit'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BEditClick
      end
      object BSave: TBitBtn
        Left = 8
        Top = 120
        Width = 123
        Height = 25
        Caption = 'Save'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = BSaveClick
      end
      object BCancel: TBitBtn
        Left = 8
        Top = 152
        Width = 123
        Height = 25
        Caption = 'Cancel'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = BCancelClick
      end
      object BAdvanced: TBitBtn
        Left = 8
        Top = 215
        Width = 123
        Height = 25
        Caption = 'Advanced'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = BAdvancedClick
      end
      object BCopy: TBitBtn
        Left = 8
        Top = 184
        Width = 123
        Height = 25
        Caption = 'Copy'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = BCopyClick
      end
      object CBReport: TComboBox
        Left = 8
        Top = 287
        Width = 126
        Height = 21
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 7
        OnDropDown = CBReportDropDown
        Items.Strings = (
          '1'
          '2'
          '3')
      end
      object BReport: TBitBtn
        Left = 8
        Top = 318
        Width = 123
        Height = 25
        Caption = 'Report'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 8
        OnClick = BReportClick
      end
      object cbBarcode: TCheckBox
        Left = 8
        Top = 348
        Width = 125
        Height = 17
        Caption = 'Use barcode printer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object cbUpdateType: TComboBox
        Left = 8
        Top = 408
        Width = 124
        Height = 21
        Style = csDropDownList
        DropDownCount = 9
        TabOrder = 10
        OnChange = cbUpdateTypeChange
        Items.Strings = (
          'All'
          'AvgCost'
          'QtyReorderAveCost'
          'QtyReorderOnHand'
          'Sellingprice'
          'QtyOnhand'
          'Barcode'
          'Descriptions'
          'Free selection')
      end
      object LimitRows: TcxSpinEdit
        Left = 8
        Top = 264
        Properties.MaxValue = 999999.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Properties.SpinButtons.ShowFastButtons = True
        TabOrder = 11
        Value = 200
        Width = 125
      end
      object lLimitRows: TcxLabel
        Left = 8
        Top = 248
        Caption = 'limitrows'
      end
      object cbSimplelayout: TCheckBox
        Left = 8
        Top = 370
        Width = 125
        Height = 17
        Caption = 'Simpel layout'
        TabOrder = 13
        OnClick = cbSimplelayoutClick
      end
    end
  end
  object DSBom: TDataSource
    DataSet = QBOM
    Left = 860
    Top = 360
  end
  object tblStockAd: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from stock')
    UpdateObject = USQLStock
    IndexFieldNames = 'SSTOCKCODE Asc'
    BeforeOpen = tblStockAdBeforeOpen
    AfterInsert = tblStockAdAfterInsert
    AfterEdit = tblStockAdAfterEdit
    BeforePost = tblStockAdBeforePost
    AfterPost = tblStockAdAfterPost
    AfterCancel = tblStockAdAfterCancel
    AfterDelete = tblStockAdAfterDelete
    AfterScroll = tblStockAdAfterScroll
    OnCalcFields = tblStockAdCalcFields
    Left = 264
    Top = 260
    object tblStockAdWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object tblStockAdSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object tblStockAdSBARCODENUMBER: TStringField
      FieldName = 'SBARCODENUMBER'
      Size = 25
    end
    object tblStockAdSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblStockAdWREPORTINGGROUP1ID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblStockAdWREPORTINGGROUP2ID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblStockAdWCOSTACCOUNTID: TIntegerField
      FieldName = 'WCOSTACCOUNTID'
    end
    object tblStockAdWINPUTTAXID: TIntegerField
      FieldName = 'WINPUTTAXID'
    end
    object tblStockAdWOUTPUTTAXID: TIntegerField
      FieldName = 'WOUTPUTTAXID'
    end
    object tblStockAdFOPENINGAVECOST: TFloatField
      FieldName = 'FOPENINGAVECOST'
    end
    object tblStockAdFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object tblStockAdFOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object tblStockAdFINVQTYONHAND: TFloatField
      FieldName = 'FINVQTYONHAND'
    end
    object tblStockAdFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object tblStockAdWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object tblStockAdBAPPLYINVOICEDISCOUNT: TSmallintField
      FieldName = 'BAPPLYINVOICEDISCOUNT'
    end
    object tblStockAdWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object tblStockAdFSELLINGPRICE1: TFloatField
      FieldName = 'FSELLINGPRICE1'
    end
    object tblStockAdFSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
    object tblStockAdFSELLINGPRICE3: TFloatField
      FieldName = 'FSELLINGPRICE3'
    end
    object tblStockAdFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object tblStockAdFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object tblStockAdWUNITID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WUNITID'
    end
    object tblStockAdDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblStockAdBAPPLYTAX: TSmallintField
      FieldName = 'BAPPLYTAX'
    end
    object tblStockAdWINPUTTAX2ID: TIntegerField
      FieldName = 'WINPUTTAX2ID'
    end
    object tblStockAdBTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object tblStockAdWSUPPLIER1ID: TIntegerField
      FieldName = 'WSUPPLIER1ID'
    end
    object tblStockAdWSUPPLIER2ID: TIntegerField
      FieldName = 'WSUPPLIER2ID'
    end
    object tblStockAdWSTOCKTYPEID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WSTOCKTYPEID'
    end
    object tblStockAdWOUTPUTTAX2ID: TIntegerField
      FieldName = 'WOUTPUTTAX2ID'
    end
    object tblStockAdWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblStockAdBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblStockAdWPERENTID: TIntegerField
      FieldName = 'WPERENTID'
    end
    object tblStockAdWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object tblStockAdWFILENAMEID: TIntegerField
      FieldName = 'WFILENAMEID'
    end
    object tblStockAdSEXTRADESC: TStringField
      FieldName = 'SEXTRADESC'
      Size = 255
    end
    object tblStockAdSInputTax: TStringField
      FieldKind = fkCalculated
      FieldName = 'SInputTax'
      Calculated = True
    end
    object tblStockAdSOutPutTax: TStringField
      FieldKind = fkCalculated
      FieldName = 'SOutPutTax'
      Calculated = True
    end
    object tblStockAdSCostAccount: TStringField
      FieldKind = fkCalculated
      FieldName = 'SCostAccount'
      Calculated = True
    end
    object tblStockAdSSaleSACCOUNT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SSaleSACCOUNT'
      Calculated = True
    end
    object tblStockAdSStockAccount: TStringField
      FieldKind = fkCalculated
      FieldName = 'SStockAccount'
      Calculated = True
    end
    object tblStockAdSEXTERNALID: TStringField
      FieldName = 'SEXTERNALID'
      Size = 200
    end
    object tblStockAdFNETTOWEIGHT: TFloatField
      FieldName = 'FNETTOWEIGHT'
    end
    object tblStockAdFGROSSWEIGHT: TFloatField
      FieldName = 'FGROSSWEIGHT'
    end
    object tblStockAdFREORDERQTYTRIG: TFloatField
      FieldName = 'FREORDERQTYTRIG'
    end
    object tblStockAdSMANUFACTURER: TStringField
      FieldName = 'SMANUFACTURER'
      Size = 35
    end
    object tblStockAdFMINIMUMQTY: TFloatField
      FieldName = 'FMINIMUMQTY'
    end
    object tblStockAdSSTOCKCODESUP1: TStringField
      FieldName = 'SSTOCKCODESUP1'
      Size = 30
    end
    object tblStockAdSSTOCKCODESUP2: TStringField
      FieldName = 'SSTOCKCODESUP2'
      Size = 30
    end
    object tblStockAdSWSUPPLIER1ID: TStringField
      FieldKind = fkCalculated
      FieldName = 'SWSUPPLIER1ID'
      Size = 50
      Calculated = True
    end
    object tblStockAdSWSUPPLIER2ID: TStringField
      FieldKind = fkCalculated
      FieldName = 'SWSUPPLIER2ID'
      Size = 50
      Calculated = True
    end
    object tblStockAdWDEFAULTCOSTGROUP1ID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WDEFAULTCOSTGROUP1ID'
    end
  end
  object QBOM: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select BOM.*,Stock.SSTOCKCODE,SDescription , Stock.FUnitAveCost,' +
        ' Stock.FUnitCost,Stock.FQtyOnhand,Stock.FSellingprice2 from BOM,' +
        'Stock where BOM.WLinkedStockID = Stock.WStockID')
    CachedUpdates = True
    UpdateObject = USQLBom
    AutoCalcFields = False
    BeforeInsert = QBOMBeforeInsert
    AfterInsert = QBOMAfterInsert
    AfterPost = QBOMAfterDelete
    AfterDelete = QBOMAfterDelete
    OnCalcFields = QBOMCalcFields
    Left = 480
    Top = 380
    object QBOMWBOMID: TIntegerField
      FieldName = 'WBOMID'
    end
    object QBOMWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object QBOMWLINKEDSTOCKID: TIntegerField
      FieldName = 'WLINKEDSTOCKID'
    end
    object QBOMFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object QBOMSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object QBOMSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object QBOMFPERCENTAGEOFSALE: TFloatField
      FieldName = 'FPERCENTAGEOFSALE'
    end
    object QBOMFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object QBOMFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object QBOMFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object QBOMLSTOCKCODE: TStringField
      FieldKind = fkCalculated
      FieldName = 'LSTOCKCODE'
      Size = 30
      Calculated = True
    end
    object QBOMLSTOCKDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'LSTOCKDESC'
      Size = 100
      Calculated = True
    end
    object QBOMFSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
  end
  object USQLBom: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO BOM'
      '  (BOM.WBOMID, BOM.WSTOCKID, BOM.WLINKEDSTOCKID, '
      'BOM.FQTY, BOM.FPERCENTAGEOFSALE)'
      'VALUES'
      '  (:WBOMID, :WSTOCKID, :WLINKEDSTOCKID, :FQTY, '
      ':FPERCENTAGEOFSALE)')
    DeleteSQL.Strings = (
      'DELETE FROM BOM'
      'WHERE'
      '  BOM.WBOMID = :OLD_WBOMID')
    ModifySQL.Strings = (
      'UPDATE BOM SET'
      '  BOM.WBOMID = :WBOMID,'
      '  BOM.WSTOCKID = :WSTOCKID,'
      '  BOM.WLINKEDSTOCKID = :WLINKEDSTOCKID,'
      '  BOM.FQTY = :FQTY,'
      '  BOM.FPERCENTAGEOFSALE = :FPERCENTAGEOFSALE'
      'WHERE'
      '  BOM.WBOMID = :OLD_WBOMID')
    Left = 460
    Top = 360
  end
  object USQLStock: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO stock'
      
        '  (stock.WSTOCKID, stock.SSTOCKCODE, stock.SBARCODENUMBER, stock' +
        '.SDESCRIPTION, '
      
        '   stock.WREPORTINGGROUP1ID, stock.WREPORTINGGROUP2ID, stock.WCO' +
        'STACCOUNTID, '
      
        '   stock.WINPUTTAXID, stock.WOUTPUTTAXID, stock.FOPENINGAVECOST,' +
        ' stock.FQTYONHAND, '
      
        '   stock.FOPENINGQTY, stock.FINVQTYONHAND, stock.FREORDERQTY, st' +
        'ock.WSALESACCOUNTID, '
      
        '   stock.BAPPLYINVOICEDISCOUNT, stock.WSTOCKACCOUNTID, stock.FSE' +
        'LLINGPRICE1, '
      
        '   stock.FSELLINGPRICE2, stock.FSELLINGPRICE3, stock.FUNITAVECOS' +
        'T, stock.FUNITCOST, '
      
        '   stock.WUNITID, stock.DSYSDATE, stock.BAPPLYTAX, stock.WINPUTT' +
        'AX2ID, '
      
        '   stock.BTAXABLE, stock.WSUPPLIER1ID, stock.WSUPPLIER2ID, stock' +
        '.WSTOCKTYPEID, '
      
        '   stock.WOUTPUTTAX2ID, stock.WPROFILEID, stock.BDISABLED, stock' +
        '.WPERENTID, '
      
        '   stock.WLOCATIONID, stock.WFILENAMEID, stock.SEXTRADESC, stock' +
        '.SEXTERNALID, '
      
        '   stock.FNETTOWEIGHT, stock.FGROSSWEIGHT, stock.FREORDERQTYTRIG' +
        ', stock.SMANUFACTURER, '
      
        '   stock.FMINIMUMQTY, stock.SSTOCKCODESUP1, stock.SSTOCKCODESUP2' +
        ', stock.WDEFAULTCOSTGROUP1ID)'
      'VALUES'
      
        '  (:WSTOCKID, :SSTOCKCODE, :SBARCODENUMBER, :SDESCRIPTION, :WREP' +
        'ORTINGGROUP1ID, '
      
        '   :WREPORTINGGROUP2ID, :WCOSTACCOUNTID, :WINPUTTAXID, :WOUTPUTT' +
        'AXID, :FOPENINGAVECOST, '
      
        '   :FQTYONHAND, :FOPENINGQTY, :FINVQTYONHAND, :FREORDERQTY, :WSA' +
        'LESACCOUNTID, '
      
        '   :BAPPLYINVOICEDISCOUNT, :WSTOCKACCOUNTID, :FSELLINGPRICE1, :F' +
        'SELLINGPRICE2, '
      
        '   :FSELLINGPRICE3, :FUNITAVECOST, :FUNITCOST, :WUNITID, :DSYSDA' +
        'TE, :BAPPLYTAX, '
      
        '   :WINPUTTAX2ID, :BTAXABLE, :WSUPPLIER1ID, :WSUPPLIER2ID, :WSTO' +
        'CKTYPEID, '
      
        '   :WOUTPUTTAX2ID, :WPROFILEID, :BDISABLED, :WPERENTID, :WLOCATI' +
        'ONID, :WFILENAMEID, '
      
        '   :SEXTRADESC, :SEXTERNALID, :FNETTOWEIGHT, :FGROSSWEIGHT, :FRE' +
        'ORDERQTYTRIG, '
      
        '   :SMANUFACTURER, :FMINIMUMQTY, :SSTOCKCODESUP1, :SSTOCKCODESUP' +
        '2, :WDEFAULTCOSTGROUP1ID)')
    DeleteSQL.Strings = (
      'DELETE FROM stock'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    ModifySQL.Strings = (
      'UPDATE stock SET'
      '  stock.WSTOCKID = :WSTOCKID,'
      '  stock.SSTOCKCODE = :SSTOCKCODE,'
      '  stock.SBARCODENUMBER = :SBARCODENUMBER,'
      '  stock.SDESCRIPTION = :SDESCRIPTION,'
      '  stock.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  stock.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  stock.WCOSTACCOUNTID = :WCOSTACCOUNTID,'
      '  stock.WINPUTTAXID = :WINPUTTAXID,'
      '  stock.WOUTPUTTAXID = :WOUTPUTTAXID,'
      '  stock.FOPENINGAVECOST = :FOPENINGAVECOST,'
      '  stock.FQTYONHAND = :FQTYONHAND,'
      '  stock.FOPENINGQTY = :FOPENINGQTY,'
      '  stock.FINVQTYONHAND = :FINVQTYONHAND,'
      '  stock.FREORDERQTY = :FREORDERQTY,'
      '  stock.WSALESACCOUNTID = :WSALESACCOUNTID,'
      '  stock.BAPPLYINVOICEDISCOUNT = :BAPPLYINVOICEDISCOUNT,'
      '  stock.WSTOCKACCOUNTID = :WSTOCKACCOUNTID,'
      '  stock.FSELLINGPRICE1 = :FSELLINGPRICE1,'
      '  stock.FSELLINGPRICE2 = :FSELLINGPRICE2,'
      '  stock.FSELLINGPRICE3 = :FSELLINGPRICE3,'
      '  stock.FUNITAVECOST = :FUNITAVECOST,'
      '  stock.FUNITCOST = :FUNITCOST,'
      '  stock.WUNITID = :WUNITID,'
      '  stock.DSYSDATE = :DSYSDATE,'
      '  stock.BAPPLYTAX = :BAPPLYTAX,'
      '  stock.WINPUTTAX2ID = :WINPUTTAX2ID,'
      '  stock.BTAXABLE = :BTAXABLE,'
      '  stock.WSUPPLIER1ID = :WSUPPLIER1ID,'
      '  stock.WSUPPLIER2ID = :WSUPPLIER2ID,'
      '  stock.WSTOCKTYPEID = :WSTOCKTYPEID,'
      '  stock.WOUTPUTTAX2ID = :WOUTPUTTAX2ID,'
      '  stock.WPROFILEID = :WPROFILEID,'
      '  stock.BDISABLED = :BDISABLED,'
      '  stock.WPERENTID = :WPERENTID,'
      '  stock.WLOCATIONID = :WLOCATIONID,'
      '  stock.WFILENAMEID = :WFILENAMEID,'
      '  stock.SEXTRADESC = :SEXTRADESC,'
      '  stock.SEXTERNALID = :SEXTERNALID,'
      '  stock.FNETTOWEIGHT = :FNETTOWEIGHT,'
      '  stock.FGROSSWEIGHT = :FGROSSWEIGHT,'
      '  stock.FREORDERQTYTRIG = :FREORDERQTYTRIG,'
      '  stock.SMANUFACTURER = :SMANUFACTURER,'
      '  stock.FMINIMUMQTY = :FMINIMUMQTY,'
      '  stock.SSTOCKCODESUP1 = :SSTOCKCODESUP1,'
      '  stock.SSTOCKCODESUP2 = :SSTOCKCODESUP2,'
      '  stock.WDEFAULTCOSTGROUP1ID = :WDEFAULTCOSTGROUP1ID'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    Left = 944
    Top = 372
  end
  object dsStock: TDataSource
    DataSet = tblStockAd
    Left = 552
    Top = 512
  end
  object ZQStockTrans: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select 1.0000 CUMMTOT,stocktrn.*,dochead.SDocno,dochead.sreferen' +
        'ce,users.SUSername,dochead.Bposted,dochead.Wtypeid from stocktrn' +
        ' left join dochead on stocktrn.WDOCID = dochead.WDOCID left join' +
        ' users on dochead.WUSerid = users.WUserid'
      'order by ddate,WSTOCKTRANSACTIONID')
    CachedUpdates = True
    UpdateObject = ZUSQLStockTrans
    AutoCalcFields = False
    BeforeOpen = ZQStockTransBeforeOpen
    BeforeInsert = ZQStockTransBeforeInsert
    BeforeEdit = ZQStockTransBeforeEdit
    Left = 568
    Top = 188
    object ZQStockTransWSTOCKTRANSACTIONID: TIntegerField
      FieldName = 'WSTOCKTRANSACTIONID'
      Required = True
    end
    object ZQStockTransWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockTransDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQStockTransWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object ZQStockTransWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQStockTransWDOCTYPEID: TIntegerField
      FieldName = 'WDOCTYPEID'
    end
    object ZQStockTransFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object ZQStockTransFCOSTPRICE: TFloatField
      FieldName = 'FCOSTPRICE'
    end
    object ZQStockTransFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object ZQStockTransWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQStockTransDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQStockTransWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object ZQStockTransSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object ZQStockTransSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 255
    end
    object ZQStockTransSUSERNAME: TStringField
      FieldName = 'SUSERNAME'
    end
    object ZQStockTransBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object ZQStockTransWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
      OnGetText = ZQDocsWTYPEIDGetText
    end
    object ZQStockTransCUMMTOT: TFloatField
      FieldName = 'CUMMTOT'
    end
  end
  object ZQDocs: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select docline.WDocid, docline.FQtyShipped,dochead.SDocno,dochea' +
        'd.ddate,messages.SDescription,'
      
        'FSELLINGPRICE, FITEMDISCOUNT, FEXCLUSIVEAMT, FINCLUSIVEAMT ,unit' +
        '.FUNITQTY,unit.SDESCRIPTION UNITDESC,Account.SACCOUNTCODE,ACCOUN' +
        'T.SDESCRIPTION ACCDESC,dochead.WTypeid,Dochead.Bposted'
      ' from docline '
      'join dochead on docline.wdocid = dochead.Wdocid '
      'join stock on docline.wstockid = stock.Wstockid'
      'join Account on account.Waccountid = dochead.Waccountid'
      
        'left join messages on docline.wdescriptionid = messages.Wmessage' +
        'id'
      
        'left join unit on docline.Sunit = cast(unit.WUNITID as varchar(2' +
        '0))'
      'where Docline.WStockId = :StockId'
      'union'
      
        'select docline.WDocid, docline.FQtyShipped,dochead.SDocno,dochea' +
        'd.ddate,messages.SDescription,'
      
        'FSELLINGPRICE, FITEMDISCOUNT, FEXCLUSIVEAMT, FINCLUSIVEAMT ,unit' +
        '.FUNITQTY,unit.SDESCRIPTION UNITDESC,Account.SACCOUNTCODE,ACCOUN' +
        'T.SDESCRIPTION ACCDESC,dochead.WTypeid,Dochead.Bposted'
      ' from DOCLINE_LINKED docline '
      'join dochead on docline.wdocid = dochead.Wdocid '
      'join stock on docline.wstockid = stock.Wstockid'
      'join Account on account.Waccountid = dochead.Waccountid'
      
        'left join messages on docline.wdescriptionid = messages.Wmessage' +
        'id'
      
        'left join unit on docline.Sunit = cast(unit.WUNITID as varchar(2' +
        '0))'
      'where Docline.WStockId = :StockId2'
      'order by 4 desc')
    OnCalcFields = ZQDocsCalcFields
    Left = 285
    Top = 335
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'StockId'
      end
      item
        DataType = ftUnknown
        Name = 'StockId2'
      end>
    object ZQDocsWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object ZQDocsFQTYSHIPPED: TFloatField
      FieldName = 'FQTYSHIPPED'
    end
    object ZQDocsSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object ZQDocsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQDocsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 65
    end
    object ZQDocsFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
      DisplayFormat = '0.00'
    end
    object ZQDocsFITEMDISCOUNT: TFloatField
      FieldName = 'FITEMDISCOUNT'
    end
    object ZQDocsFEXCLUSIVEAMT: TFloatField
      FieldName = 'FEXCLUSIVEAMT'
      DisplayFormat = '0.00'
    end
    object ZQDocsFINCLUSIVEAMT: TFloatField
      FieldName = 'FINCLUSIVEAMT'
      DisplayFormat = '0.00'
    end
    object ZQDocsPRICEPERITEM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRICEPERITEM'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object ZQDocsFUNITQTY: TFloatField
      FieldName = 'FUNITQTY'
    end
    object ZQDocsUNITDESC: TStringField
      FieldName = 'UNITDESC'
      Size = 8
    end
    object ZQDocsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQDocsACCDESC: TStringField
      FieldName = 'ACCDESC'
      Size = 64
    end
    object ZQDocsWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
      OnGetText = ZQDocsWTYPEIDGetText
    end
    object ZQDocsBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
  end
  object dsStockTrans: TDataSource
    DataSet = ZQStockTrans
    Left = 635
    Top = 582
  end
  object dsDocs: TDataSource
    DataSet = ZQDocs
    Left = 919
    Top = 578
  end
  object pmExtraActions: TPopupMenu
    OnPopup = pmExtraActionsPopup
    Left = 209
    Top = 342
    object Printsingleitem1: TMenuItem
      Caption = 'Print single item'
      OnClick = Printsingleitem1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      object PluginsCopyfrom1: TMenuItem
        Caption = 'Plugins Copy from'
      end
      object Pluginscopyto1: TMenuItem
        Caption = 'Plugins copy to'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object GenCopyFrom: TMenuItem
        Caption = 'Copy from / init action'
      end
      object GenCopyto: TMenuItem
        Caption = 'Preform on selected rows'
      end
      object CopyItem: TMenuItem
        Caption = 'Item'
        OnClick = BCopyClick
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Group1: TMenuItem
      Caption = 'Group1'
    end
    object Group2: TMenuItem
      Caption = 'Group2'
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object PluginsAction11: TMenuItem
      Caption = 'Plugins edit/view'
    end
    object Pluginsaction21: TMenuItem
      Caption = 'Plugins mass action'
    end
    object Openinbrowserfromimplink1: TMenuItem
      Caption = 'Open in browser from link'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object BDissemble: TMenuItem
      Caption = 'Dissemble'
      OnClick = BDissembleClick
    end
    object BAssemble: TMenuItem
      Caption = 'Assemble'
      OnClick = BAssembleClick
    end
    object Masscheck1: TMenuItem
      Caption = 'Mass check'
      OnClick = Masscheck1Click
    end
  end
  object OpenDialog1: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp;*.png)|*.jpg;*.jpeg;*.bmp;*.png|JPEG Ima' +
      'ge File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*' +
      '.bmp)|*.bmp|Png files (*.png)|*.png'
    Left = 854
    Top = 386
  end
  object ZQDefoptions: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from STOCKSETOPTIONS where WStockid = :WStockid')
    CachedUpdates = True
    UpdateObject = ZUSQLDefoptions
    AfterInsert = ZQDefoptionsAfterInsert
    Left = 646
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQDefoptionsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQDefoptionsWITEMOPTION1ID: TIntegerField
      FieldName = 'WITEMOPTION1ID'
    end
    object ZQDefoptionsWITEMOPTION2ID: TIntegerField
      FieldName = 'WITEMOPTION2ID'
    end
    object ZQDefoptionsWITEMOPTION3ID: TIntegerField
      FieldName = 'WITEMOPTION3ID'
    end
    object ZQDefoptionsWITEMOPTION4ID: TIntegerField
      FieldName = 'WITEMOPTION4ID'
    end
    object ZQDefoptionsWITEMOPTION5ID: TIntegerField
      FieldName = 'WITEMOPTION5ID'
    end
    object ZQDefoptionsWLEVEL: TIntegerField
      FieldName = 'WLEVEL'
    end
    object ZQDefoptionsWLOOKUPTYPE: TIntegerField
      FieldName = 'WLOOKUPTYPE'
    end
  end
  object ZQStockoptions: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from STOCKOPTIONS where WStockid = :WStockid')
    CachedUpdates = True
    UpdateObject = ZUSQLStockoptions
    AfterInsert = ZQStockoptionsAfterInsert
    BeforePost = ZQStockoptionsBeforePost
    BeforeScroll = ZQStockoptionsBeforeScroll
    AfterScroll = ZQStockoptionsAfterScroll
    OnCalcFields = ZQStockoptionsCalcFields
    Left = 694
    Top = 300
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQStockoptionsWSTOCKOPTIONSID: TIntegerField
      FieldName = 'WSTOCKOPTIONSID'
      Required = True
    end
    object ZQStockoptionsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQStockoptionsWITEMOPTIONVALUE1ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE1ID'
      OnGetText = ZQStockoptionsWITEMOPTIONVALUE1IDGetText
    end
    object ZQStockoptionsWITEMOPTIONVALUE2ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE2ID'
    end
    object ZQStockoptionsWITEMOPTIONVALUE3ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE3ID'
    end
    object ZQStockoptionsWITEMOPTIONVALUE4ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE4ID'
    end
    object ZQStockoptionsWITEMOPTIONVALUE5ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE5ID'
    end
    object ZQStockoptionsFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
    end
    object ZQStockoptionsFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object ZQStockoptionsSBARCODE: TStringField
      FieldName = 'SBARCODE'
      Size = 25
    end
    object ZQStockoptionsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
    end
    object ZQStockoptionsFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object ZQStockoptionsFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object ZQStockoptionsFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object ZQStockoptionsFREORDERQTYTRIG: TFloatField
      FieldName = 'FREORDERQTYTRIG'
    end
    object ZQStockoptionsEXPECTED: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EXPECTED'
      Calculated = True
    end
    object ZQStockoptionsFEXTRAPRICE2: TFloatField
      FieldName = 'FEXTRAPRICE2'
    end
    object ZQStockoptionsFEXTRAPRICE3: TFloatField
      FieldName = 'FEXTRAPRICE3'
    end
    object ZQStockoptionsBENABLED: TSmallintField
      FieldName = 'BENABLED'
    end
    object ZQStockoptionsWBOXSIZE: TIntegerField
      FieldName = 'WBOXSIZE'
    end
  end
  object ZUSQLDefoptions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCKSETOPTIONS'
      
        '  (STOCKSETOPTIONS.WSTOCKID, STOCKSETOPTIONS.WITEMOPTION1ID, STO' +
        'CKSETOPTIONS.WITEMOPTION2ID, '
      
        '   STOCKSETOPTIONS.WITEMOPTION3ID, STOCKSETOPTIONS.WITEMOPTION4I' +
        'D, STOCKSETOPTIONS.WITEMOPTION5ID, '
      '   STOCKSETOPTIONS.WLEVEL, STOCKSETOPTIONS.WLOOKUPTYPE)'
      'VALUES'
      
        '  (:WSTOCKID, :WITEMOPTION1ID, :WITEMOPTION2ID, :WITEMOPTION3ID,' +
        ' :WITEMOPTION4ID, '
      '   :WITEMOPTION5ID, :WLEVEL, :WLOOKUPTYPE)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCKSETOPTIONS'
      'WHERE'
      '  STOCKSETOPTIONS.WSTOCKID = :OLD_WSTOCKID')
    ModifySQL.Strings = (
      'UPDATE STOCKSETOPTIONS SET'
      '  STOCKSETOPTIONS.WSTOCKID = :WSTOCKID,'
      '  STOCKSETOPTIONS.WITEMOPTION1ID = :WITEMOPTION1ID,'
      '  STOCKSETOPTIONS.WITEMOPTION2ID = :WITEMOPTION2ID,'
      '  STOCKSETOPTIONS.WITEMOPTION3ID = :WITEMOPTION3ID,'
      '  STOCKSETOPTIONS.WITEMOPTION4ID = :WITEMOPTION4ID,'
      '  STOCKSETOPTIONS.WITEMOPTION5ID = :WITEMOPTION5ID,'
      '  STOCKSETOPTIONS.WLEVEL = :WLEVEL,'
      '  STOCKSETOPTIONS.WLOOKUPTYPE = :WLOOKUPTYPE'
      'WHERE'
      '  STOCKSETOPTIONS.WSTOCKID = :OLD_WSTOCKID')
    Left = 514
    Top = 248
  end
  object ZUSQLStockoptions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCKOPTIONS'
      
        '  (WSTOCKOPTIONSID, WSTOCKID, WITEMOPTIONVALUE1ID, WITEMOPTIONVA' +
        'LUE2ID, WITEMOPTIONVALUE3ID, WITEMOPTIONVALUE4ID, WITEMOPTIONVAL' +
        'UE5ID, FEXTRAPRICE, FQTYONHAND, SBARCODE, SREFERENCE, FUNITCOST,' +
        ' FREORDERQTY, FREORDERQTYTRIG, FUNITAVECOST, FEXTRAPRICE2, FEXTR' +
        'APRICE3, BENABLED, WBOXSIZE)'
      'VALUES'
      
        '  (:WSTOCKOPTIONSID, :WSTOCKID, :WITEMOPTIONVALUE1ID, :WITEMOPTI' +
        'ONVALUE2ID, :WITEMOPTIONVALUE3ID, :WITEMOPTIONVALUE4ID, :WITEMOP' +
        'TIONVALUE5ID, :FEXTRAPRICE, :FQTYONHAND, :SBARCODE, :SREFERENCE,' +
        ' :FUNITCOST, :FREORDERQTY, :FREORDERQTYTRIG, :FUNITAVECOST, :FEX' +
        'TRAPRICE2, :FEXTRAPRICE3, :BENABLED, :WBOXSIZE)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCKOPTIONS'
      'WHERE'
      '  WSTOCKOPTIONSID = :Old_WSTOCKOPTIONSID')
    ModifySQL.Strings = (
      'UPDATE STOCKOPTIONS'
      'SET'
      
        '  WSTOCKOPTIONSID = :WSTOCKOPTIONSID, WSTOCKID = :WSTOCKID, WITE' +
        'MOPTIONVALUE1ID = :WITEMOPTIONVALUE1ID, WITEMOPTIONVALUE2ID = :W' +
        'ITEMOPTIONVALUE2ID, WITEMOPTIONVALUE3ID = :WITEMOPTIONVALUE3ID, ' +
        'WITEMOPTIONVALUE4ID = :WITEMOPTIONVALUE4ID, WITEMOPTIONVALUE5ID ' +
        '= :WITEMOPTIONVALUE5ID, FEXTRAPRICE = :FEXTRAPRICE, FQTYONHAND =' +
        ' :FQTYONHAND, SBARCODE = :SBARCODE, SREFERENCE = :SREFERENCE, FU' +
        'NITCOST = :FUNITCOST, FREORDERQTY = :FREORDERQTY, FREORDERQTYTRI' +
        'G = :FREORDERQTYTRIG, FUNITAVECOST = :FUNITAVECOST, FEXTRAPRICE2' +
        ' = :FEXTRAPRICE2, FEXTRAPRICE3 = :FEXTRAPRICE3, BENABLED = :BENA' +
        'BLED, WBOXSIZE = :WBOXSIZE'
      'WHERE'
      '  WSTOCKOPTIONSID = :Old_WSTOCKOPTIONSID')
    RefreshSQL.Strings = (
      
        'SELECT WSTOCKOPTIONSID, WSTOCKID, WITEMOPTIONVALUE1ID, WITEMOPTI' +
        'ONVALUE2ID, WITEMOPTIONVALUE3ID, WITEMOPTIONVALUE4ID, WITEMOPTIO' +
        'NVALUE5ID, FEXTRAPRICE, FQTYONHAND, SBARCODE, SREFERENCE, FUNITC' +
        'OST, FREORDERQTY, FREORDERQTYTRIG, FUNITAVECOST, FEXTRAPRICE2, F' +
        'EXTRAPRICE3, BENABLED, WBOXSIZE FROM STOCKOPTIONS'
      'WHERE'
      '  WSTOCKOPTIONSID = :Old_WSTOCKOPTIONSID')
    Left = 778
    Top = 508
  end
  object dsZQDefoptions: TDataSource
    DataSet = ZQDefoptions
    Left = 372
    Top = 248
  end
  object ZQOptions: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from ITEMOPTIONS')
    Left = 326
    Top = 420
    object ZQOptionsWITEMOPTIONID: TIntegerField
      FieldName = 'WITEMOPTIONID'
      Required = True
    end
    object ZQOptionsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
  end
  object dsZqoptions: TDataSource
    DataSet = ZQOptions
    Left = 744
    Top = 564
  end
  object dsZQStockoptions: TDataSource
    DataSet = ZQStockoptions
    Left = 452
    Top = 220
  end
  object ZQDescriptions: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from STOCK_DESCRIPTIONS where WStockid =:WStockid'
      'order by WLANGUAGEID')
    CachedUpdates = True
    UpdateObject = ZUSQLDescriptions
    BeforeOpen = ZQDescriptionsBeforeOpen
    AfterInsert = ZQDescriptionsAfterInsert
    BeforePost = ZQDescriptionsBeforePost
    AfterScroll = ZQDescriptionsAfterScroll
    Left = 449
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQDescriptionsWSTOCKDESCID: TIntegerField
      FieldName = 'WSTOCKDESCID'
      Required = True
    end
    object ZQDescriptionsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQDescriptionsWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
    end
    object ZQDescriptionsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Required = True
      Size = 35
    end
    object ZQDescriptionsSEXTRADESCRIPTION: TBlobField
      FieldName = 'SEXTRADESCRIPTION'
    end
    object ZQDescriptionsLangLookup: TStringField
      FieldKind = fkLookup
      FieldName = 'LangLookup'
      LookupDataSet = ZQlookup
      LookupKeyFields = 'WGROUPID'
      LookupResultField = 'SDESCRIPTION'
      KeyFields = 'WLANGUAGEID'
      Lookup = True
    end
  end
  object ZUSQLDescriptions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCK_DESCRIPTIONS'
      
        '  (STOCK_DESCRIPTIONS.WSTOCKID, STOCK_DESCRIPTIONS.WLANGUAGEID, ' +
        'STOCK_DESCRIPTIONS.SDESCRIPTION, '
      
        '   STOCK_DESCRIPTIONS.SEXTRADESCRIPTION, STOCK_DESCRIPTIONS.WSTO' +
        'CKDESCID)'
      'VALUES'
      
        '  (:WSTOCKID, :WLANGUAGEID, :SDESCRIPTION, :SEXTRADESCRIPTION, :' +
        'WSTOCKDESCID)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCK_DESCRIPTIONS'
      'WHERE'
      '  STOCK_DESCRIPTIONS.WSTOCKDESCID = :OLD_WSTOCKDESCID')
    ModifySQL.Strings = (
      'UPDATE STOCK_DESCRIPTIONS SET'
      '  STOCK_DESCRIPTIONS.WSTOCKID = :WSTOCKID,'
      '  STOCK_DESCRIPTIONS.WLANGUAGEID = :WLANGUAGEID,'
      '  STOCK_DESCRIPTIONS.SDESCRIPTION = :SDESCRIPTION,'
      '  STOCK_DESCRIPTIONS.SEXTRADESCRIPTION = '
      ':SEXTRADESCRIPTION,'
      '  STOCK_DESCRIPTIONS.WSTOCKDESCID = :WSTOCKDESCID'
      'WHERE'
      '  STOCK_DESCRIPTIONS.WSTOCKDESCID = :OLD_WSTOCKDESCID')
    Left = 613
    Top = 173
  end
  object DSDescriptions: TDataSource
    DataSet = ZQDescriptions
    Left = 449
    Top = 469
  end
  object ZQlookup: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select WGroupId,SDescription from GROUPS where wgrouptypeid = 10' +
        '04 order by 2')
    Left = 597
    Top = 341
  end
  object ZQStockMultigroup: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from STOCK_MULTIGROUP where WStockid = :WStockid')
    CachedUpdates = True
    UpdateObject = ZUSQLMultigroup
    AfterInsert = ZQStockMultigroupAfterInsert
    Left = 248
    Top = 452
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQStockMultigroupWGROUPID: TIntegerField
      DisplayLabel = 'Group'
      DisplayWidth = 80
      FieldName = 'WGROUPID'
      Required = True
      OnGetText = ZQStockMultigroupWGROUPIDGetText
    end
    object ZQStockMultigroupWSTOCKID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WSTOCKID'
      Required = True
      Visible = False
    end
    object ZQStockMultigroupIMP_SOURCEID: TIntegerField
      DisplayWidth = 10
      FieldName = 'IMP_SOURCEID'
      Required = True
      Visible = False
    end
  end
  object ZUSQLMultigroup: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCK_MULTIGROUP'
      
        '  (STOCK_MULTIGROUP.WSTOCKID, STOCK_MULTIGROUP.WGROUPID, STOCK_M' +
        'ULTIGROUP.IMP_SOURCEID)'
      'VALUES'
      '  (:WSTOCKID, :WGROUPID, :IMP_SOURCEID)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCK_MULTIGROUP'
      'WHERE'
      '  STOCK_MULTIGROUP.WSTOCKID = :OLD_WSTOCKID AND'
      '  STOCK_MULTIGROUP.WGROUPID = :OLD_WGROUPID')
    ModifySQL.Strings = (
      'UPDATE STOCK_MULTIGROUP SET'
      '  STOCK_MULTIGROUP.WSTOCKID = :WSTOCKID,'
      '  STOCK_MULTIGROUP.WGROUPID = :WGROUPID,'
      '  STOCK_MULTIGROUP.IMP_SOURCEID = :IMP_SOURCEID'
      'WHERE'
      '  STOCK_MULTIGROUP.WSTOCKID = :OLD_WSTOCKID AND'
      '  STOCK_MULTIGROUP.WGROUPID = :OLD_WGROUPID')
    Left = 288
    Top = 404
  end
  object dsMultiGroup: TDataSource
    DataSet = ZQStockMultigroup
    Left = 668
    Top = 584
  end
  object ZUSQLStockTrans: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO stocktrn'
      
        '  (stocktrn.WSTOCKTRANSACTIONID, stocktrn.WSTOCKID, stocktrn.DDA' +
        'TE, stocktrn.WSALESMANID, '
      
        '   stocktrn.WDOCID, stocktrn.WDOCTYPEID, stocktrn.FQTY, stocktrn' +
        '.FCOSTPRICE, '
      
        '   stocktrn.FSELLINGPRICE, stocktrn.WACCOUNTID, stocktrn.DSYSDAT' +
        'E, stocktrn.WLINEID)'
      'VALUES'
      
        '  (:WSTOCKTRANSACTIONID, :WSTOCKID, :DDATE, :WSALESMANID, :WDOCI' +
        'D, :WDOCTYPEID, '
      
        '   :FQTY, :FCOSTPRICE, :FSELLINGPRICE, :WACCOUNTID, :DSYSDATE, :' +
        'WLINEID)')
    DeleteSQL.Strings = (
      'DELETE FROM stocktrn'
      'WHERE'
      '  stocktrn.WSTOCKTRANSACTIONID = :OLD_WSTOCKTRANSACTIONID')
    ModifySQL.Strings = (
      'UPDATE stocktrn SET'
      '  stocktrn.WSTOCKTRANSACTIONID = :WSTOCKTRANSACTIONID,'
      '  stocktrn.WSTOCKID = :WSTOCKID,'
      '  stocktrn.DDATE = :DDATE,'
      '  stocktrn.WSALESMANID = :WSALESMANID,'
      '  stocktrn.WDOCID = :WDOCID,'
      '  stocktrn.WDOCTYPEID = :WDOCTYPEID,'
      '  stocktrn.FQTY = :FQTY,'
      '  stocktrn.FCOSTPRICE = :FCOSTPRICE,'
      '  stocktrn.FSELLINGPRICE = :FSELLINGPRICE,'
      '  stocktrn.WACCOUNTID = :WACCOUNTID,'
      '  stocktrn.DSYSDATE = :DSYSDATE,'
      '  stocktrn.WLINEID = :WLINEID'
      'WHERE'
      '  stocktrn.WSTOCKTRANSACTIONID = '
      ':OLD_WSTOCKTRANSACTIONID')
    Left = 349
    Top = 293
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 194
    Top = 594
    object Next1: TMenuItem
      Caption = 'Next'
      OnClick = Next1Click
    end
    object Prev1: TMenuItem
      Caption = 'Prev'
      OnClick = Prev1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Postandnext1: TMenuItem
      Caption = 'Post and next'
      ShortCut = 24656
      OnClick = Postandnext1Click
    end
    object Postandprev1: TMenuItem
      Caption = 'Post and prev'
      ShortCut = 24658
      OnClick = Postandprev1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Cut1: TMenuItem
      Caption = 'Cut'
      ShortCut = 16472
      OnClick = Cut1Click
    end
    object Copy2: TMenuItem
      Caption = 'Copy'
      ShortCut = 16451
      OnClick = Copy2Click
    end
    object Paste1: TMenuItem
      Caption = 'Paste'
      ShortCut = 16470
      OnClick = Paste1Click
    end
    object Selectall1: TMenuItem
      Caption = 'Select all'
      ShortCut = 16449
      OnClick = Selectall1Click
    end
    object urlencode1: TMenuItem
      Caption = 'url encode'
      OnClick = urlencode1Click
    end
    object urldecode1: TMenuItem
      Caption = 'url decode'
      OnClick = urldecode1Click
    end
    object addgroup1: TMenuItem
      Caption = 'add group'
    end
  end
  object ZQGen: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 333
    Top = 389
  end
  object ZQLinkSale: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from STOCK_LINKEDSALE where wstockid = :wstockid'
      'order by Wsortid')
    CachedUpdates = True
    UpdateObject = ZUSQLinkSale
    AfterInsert = ZQLinkSaleAfterInsert
    AfterScroll = ZQLinkSaleAfterScroll
    Left = 417
    Top = 419
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'wstockid'
      end>
    object ZQLinkSaleWSTOCKLINKSALEID: TIntegerField
      FieldName = 'WSTOCKLINKSALEID'
      Required = True
    end
    object ZQLinkSaleWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQLinkSaleWGROUPID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WGROUPID'
      Required = True
      OnGetText = ZQLinkSaleWGROUPIDGetText
    end
    object ZQLinkSaleWGROUPITEMID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WGROUPITEMID'
      Required = True
      OnGetText = ZQLinkSaleWGROUPIDGetText
    end
    object ZQLinkSaleFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
      DisplayFormat = '0.00'
      EditFormat = '0.00######'
    end
    object ZQLinkSaleWPRICETYPE: TSmallintField
      FieldName = 'WPRICETYPE'
      OnGetText = ZQLinkSaleWPRICETYPEGetText
      OnSetText = ZQLinkSaleWPRICETYPESetText
    end
    object ZQLinkSaleWSORTID: TIntegerField
      FieldName = 'WSORTID'
    end
    object ZQLinkSaleWLINKSTOCKID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WLINKSTOCKID'
      OnGetText = ZQLinkSaleWLINKSTOCKIDGetText
    end
  end
  object ZUSQLinkSale: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO STOCK_LINKEDSALE'
      
        '  (STOCK_LINKEDSALE.WSTOCKLINKSALEID, STOCK_LINKEDSALE.WSTOCKID,' +
        ' STOCK_LINKEDSALE.WLINKSTOCKID, '
      
        '   STOCK_LINKEDSALE.WGROUPID, STOCK_LINKEDSALE.WGROUPITEMID, STO' +
        'CK_LINKEDSALE.FEXTRAPRICE, '
      '   STOCK_LINKEDSALE.WPRICETYPE, STOCK_LINKEDSALE.WSORTID)'
      'VALUES'
      
        '  (:WSTOCKLINKSALEID, :WSTOCKID, :WLINKSTOCKID, :WGROUPID, :WGRO' +
        'UPITEMID, '
      '   :FEXTRAPRICE, :WPRICETYPE, :WSORTID)')
    DeleteSQL.Strings = (
      'DELETE FROM STOCK_LINKEDSALE'
      'WHERE'
      '  STOCK_LINKEDSALE.WSTOCKLINKSALEID = :OLD_WSTOCKLINKSALEID')
    ModifySQL.Strings = (
      'UPDATE STOCK_LINKEDSALE SET'
      '  STOCK_LINKEDSALE.WSTOCKLINKSALEID = :WSTOCKLINKSALEID,'
      '  STOCK_LINKEDSALE.WSTOCKID = :WSTOCKID,'
      '  STOCK_LINKEDSALE.WLINKSTOCKID = :WLINKSTOCKID,'
      '  STOCK_LINKEDSALE.WGROUPID = :WGROUPID,'
      '  STOCK_LINKEDSALE.WGROUPITEMID = :WGROUPITEMID,'
      '  STOCK_LINKEDSALE.FEXTRAPRICE = :FEXTRAPRICE,'
      '  STOCK_LINKEDSALE.WPRICETYPE = :WPRICETYPE,'
      '  STOCK_LINKEDSALE.WSORTID = :WSORTID'
      'WHERE'
      '  STOCK_LINKEDSALE.WSTOCKLINKSALEID = '
      ':OLD_WSTOCKLINKSALEID')
    Left = 657
    Top = 207
  end
  object dsLinkSale: TDataSource
    DataSet = ZQLinkSale
    Left = 220
    Top = 508
  end
  object ZQLinkmaingroup: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select * from groups where WgroupTypeid = 2000 and Wparentgroup2' +
        'id = 0')
    Left = 345
    Top = 367
    object ZQLinkmaingroupWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQLinkmaingroupWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object ZQLinkmaingroupSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object ZQLinkmaingroupWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object ZQLinkmaingroupWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object ZQLinkmaingroupDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQLinkmaingroupWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
    object ZQLinkmaingroupBDISABLE: TSmallintField
      FieldName = 'BDISABLE'
    end
    object ZQLinkmaingroupWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQLinkmaingroupWTEXTCOLOR: TIntegerField
      FieldName = 'WTEXTCOLOR'
    end
  end
  object ZQLinksubGroup: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select * from groups where WgroupTypeid = 2000 and Wparentgroup2' +
        'id = :WGROUPID')
    MasterSource = dsLinkSale
    Left = 229
    Top = 295
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WGROUPID'
      end>
    object ZQLinksubGroupWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQLinksubGroupWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object ZQLinksubGroupSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object ZQLinksubGroupWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object ZQLinksubGroupWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object ZQLinksubGroupDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQLinksubGroupWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
    object ZQLinksubGroupBDISABLE: TSmallintField
      FieldName = 'BDISABLE'
    end
    object ZQLinksubGroupWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQLinksubGroupWTEXTCOLOR: TIntegerField
      FieldName = 'WTEXTCOLOR'
    end
  end
  object DSlinkmaingroup: TDataSource
    DataSet = ZQLinkmaingroup
    Left = 440
    Top = 572
  end
  object DSLinkSubgroup: TDataSource
    DataSet = ZQLinksubGroup
    Left = 932
    Top = 276
  end
  object TshowTumb: TTimer
    Enabled = False
    OnTimer = TshowTumbTimer
    Left = 48
    Top = 476
  end
  object OpenDialog2: TOpenDialog
    Left = 397
    Top = 229
  end
  object cxEditRepository1: TcxEditRepository
    Left = 269
    Top = 311
    object osfStockGroup1: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.Items = <>
    end
    object osfStockGroup2: TcxEditRepositoryImageComboBoxItem
      Properties.Alignment.Horz = taLeftJustify
      Properties.Items = <>
    end
    object cxEditRepository1ImageComboBoxItem1: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <>
    end
  end
  object pmlinesactive: TPopupMenu
    Left = 920
    Top = 480
    object Active1: TMenuItem
      Caption = 'Active'
      OnClick = Active1Click
    end
    object Inactive1: TMenuItem
      Caption = 'Inactive'
      OnClick = Inactive1Click
    end
  end
end
