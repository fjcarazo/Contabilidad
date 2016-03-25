object GeneralEditAccount: TGeneralEditAccount
  Left = 174
  Top = 65
  Caption = 'General edit account'
  ClientHeight = 614
  ClientWidth = 1118
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 417
    Top = 91
    Width = 10
    Height = 523
    Align = alRight
    Color = clBtnShadow
    ParentColor = False
    ExplicitLeft = 343
    ExplicitHeight = 639
  end
  object PMainInfo: TPanel
    Left = 427
    Top = 91
    Width = 691
    Height = 523
    Align = alRight
    TabOrder = 0
    object PCGLType: TPageControl
      Left = 1
      Top = 1
      Width = 689
      Height = 521
      ActivePage = TSLedger
      Align = alClient
      TabOrder = 0
      object TSLedger: TTabSheet
        Caption = 'TSLedger'
        object Splitter2: TSplitter
          Left = 0
          Top = 219
          Width = 681
          Height = 11
          Cursor = crVSplit
          Align = alTop
          Color = clBtnShadow
          ParentColor = False
        end
        object PCAccountDetails: TPageControl
          Left = 0
          Top = 230
          Width = 681
          Height = 263
          ActivePage = tsBudget
          Align = alClient
          TabOrder = 0
          object tsBudget: TTabSheet
            Caption = 'New budget'
            ImageIndex = 4
            object cxGrid2: TcxGrid
              Left = 0
              Top = 117
              Width = 673
              Height = 118
              Align = alClient
              TabOrder = 0
              object cxGrid2DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                OnEditKeyPress = cxGrid2DBTableView1EditKeyPress
                DataController.DataSource = DSNewBudget
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FAMOUNT'
                    Column = cxGrid2DBTableView1FAMOUNT
                  end
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid2DBTableView1DDATE
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FAMOUNT'
                    Column = cxGrid2DBTableView1FAMOUNT
                  end
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid2DBTableView1DDATE
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsView.Footer = True
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid2DBTableView1WTRANSACTIONID: TcxGridDBColumn
                  DataBinding.FieldName = 'WTRANSACTIONID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid2DBTableView1DDATE: TcxGridDBColumn
                  Caption = 'Date'
                  DataBinding.FieldName = 'DDATE'
                  DateTimeGrouping = dtgByMonth
                  Width = 86
                end
                object cxGrid2DBTableView1FAMOUNT: TcxGridDBColumn
                  Caption = 'Amount'
                  DataBinding.FieldName = 'FAMOUNT'
                  RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                end
                object cxGrid2DBTableView1SREFERENCE: TcxGridDBColumn
                  Caption = 'Reference'
                  DataBinding.FieldName = 'SREFERENCE'
                end
                object cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn
                  Caption = 'Description'
                  DataBinding.FieldName = 'SDESCRIPTION'
                  Width = 160
                end
                object cxGrid2DBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn
                  Caption = 'Costgroup 1'
                  DataBinding.FieldName = 'WREPORTINGGROUP1ID'
                  PropertiesClassName = 'TcxImageComboBoxProperties'
                  Properties.Items = <>
                  Width = 124
                end
                object cxGrid2DBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn
                  Caption = 'Costgroup2'
                  DataBinding.FieldName = 'WREPORTINGGROUP2ID'
                  PropertiesClassName = 'TcxImageComboBoxProperties'
                  Properties.Items = <>
                  Width = 115
                end
                object cxGrid2DBTableView1WJOBCODEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WJOBCODEID'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.Alignment.Horz = taLeftJustify
                  Properties.DropDownAutoSize = True
                  Properties.DropDownSizeable = True
                  Properties.GridMode = True
                  Properties.ImmediatePost = True
                  Properties.KeyFieldNames = 'WJOBPROJECTID'
                  Properties.ListColumns = <
                    item
                      Caption = 'Description'
                      FieldName = 'SDESCRIPTION'
                    end>
                  Properties.ListSource = Dsproject
                end
                object cxGrid2DBTableView1DSYSDATE: TcxGridDBColumn
                  Caption = 'Changedate'
                  DataBinding.FieldName = 'DSYSDATE'
                  DateTimeGrouping = dtgRelativeToToday
                  Options.Editing = False
                end
              end
              object cxGrid2Level1: TcxGridLevel
                GridView = cxGrid2DBTableView1
              end
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 673
              Height = 117
              Align = alTop
              TabOrder = 1
              DesignSize = (
                673
                117)
              object LAmount: TLabel
                Left = 8
                Top = 0
                Width = 36
                Height = 13
                Caption = 'Amount'
              end
              object LPEriods: TLabel
                Left = 136
                Top = 0
                Width = 35
                Height = 13
                Caption = 'Periods'
              end
              object LYear: TLabel
                Left = 200
                Top = 0
                Width = 22
                Height = 13
                Caption = 'Year'
              end
              object DBNavigator2: TDBNavigator
                Left = 9
                Top = 68
                Width = 650
                Height = 41
                DataSource = DSNewBudget
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
              end
              object BSetPeriodBuget: TBitBtn
                Left = 8
                Top = 39
                Width = 253
                Height = 25
                Caption = 'Generate'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = BSetPeriodBugetClick
              end
              object EBudYear: TEdit
                Left = 200
                Top = 16
                Width = 61
                Height = 21
                TabOrder = 2
                Text = '2010'
              end
              object EPeriods: TEdit
                Left = 136
                Top = 16
                Width = 57
                Height = 21
                TabOrder = 3
                Text = '12'
              end
              object EBudget: TEdit
                Left = 8
                Top = 16
                Width = 121
                Height = 21
                TabOrder = 4
                Text = '0'
              end
            end
          end
          object tsTax: TTabSheet
            Caption = 'Tax'
            ImageIndex = 1
            DesignSize = (
              673
              235)
            object LUSeTaxLink: TLabel
              Left = 80
              Top = 39
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Use link tax'
            end
            object LPercentage: TLabel
              Left = 80
              Top = 14
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Percentage'
            end
            object Showtype: TLabel
              Left = 28
              Top = 108
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = 'Show tax in documens'
            end
            object PLinkTaxes: TPanel
              Left = 0
              Top = 59
              Width = 662
              Height = 43
              Anchors = [akLeft, akTop, akRight]
              BevelOuter = bvNone
              TabOrder = 0
              Visible = False
              DesignSize = (
                662
                43)
              object LLinkTax: TLabel
                Left = 95
                Top = 4
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Link tax'
              end
              object LContraTax: TLabel
                Left = 84
                Top = 25
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Contra tax'
              end
              object cbbLinkTaxId: TComboBox
                Left = 142
                Top = 0
                Width = 517
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                OnChange = EAccountMainChange
              end
              object CBContraTax: TCheckBox
                Left = 142
                Top = 24
                Width = 17
                Height = 17
                TabOrder = 1
                OnClick = EAccountMainChange
              end
            end
            object edtPercent: TEdit
              Left = 144
              Top = 10
              Width = 49
              Height = 21
              MaxLength = 6
              TabOrder = 1
              OnChange = EAccountMainChange
            end
            object CBUseTaxLink: TCheckBox
              Left = 144
              Top = 37
              Width = 17
              Height = 17
              TabOrder = 2
              OnClick = CBUseTaxLinkClick
            end
            object cbTaxShowType: TComboBox
              Left = 144
              Top = 104
              Width = 186
              Height = 21
              Style = csDropDownList
              TabOrder = 3
              OnChange = EAccountMainChange
              Items.Strings = (
                'All'
                'Sales/Debit'
                'Purchase/Credit'
                'Hide')
            end
          end
          object tsBank: TTabSheet
            Caption = 'Bank'
            ImageIndex = 2
            object LcbPayments: TLabel
              Left = 51
              Top = 14
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Payments'
              WordWrap = True
            end
            object LcbReceipts: TLabel
              Left = 55
              Top = 44
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Receipts'
              WordWrap = True
            end
            object cbPayments: TComboBox
              Left = 104
              Top = 11
              Width = 217
              Height = 21
              TabOrder = 0
              Text = 'cbPayments'
              OnChange = EAccountMainChange
            end
            object cbReceipts: TComboBox
              Left = 104
              Top = 41
              Width = 217
              Height = 21
              TabOrder = 1
              Text = 'cbReceipts'
              OnChange = EAccountMainChange
            end
          end
          object tslinks: TTabSheet
            BorderWidth = 5
            Caption = 'Links'
            ImageIndex = 3
            object DBNavigator1: TDBNavigator
              Left = 0
              Top = 0
              Width = 663
              Height = 39
              DataSource = dslinks
              Align = alTop
              TabOrder = 0
            end
            object cxGrid3: TcxGrid
              Left = 0
              Top = 39
              Width = 663
              Height = 186
              Align = alClient
              TabOrder = 1
              object cxGrid3DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dslinks
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid3DBTableView1WACCOUNTREFID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTREFID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid3DBTableView1SREFERENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SREFERENCE'
                end
                object cxGrid3DBTableView1WACCOUNTID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTID'
                  Visible = False
                  VisibleForCustomization = False
                end
              end
              object cxGrid3Level1: TcxGridLevel
                GridView = cxGrid3DBTableView1
              end
            end
          end
          object tsTranslations: TTabSheet
            Caption = 'Translations'
            ImageIndex = 4
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 673
              Height = 235
              Align = alClient
              TabOrder = 0
              object cxGrid1DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsTranslations
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid1DBTableView1WLANGUAGEID: TcxGridDBColumn
                  Caption = 'Language'
                  DataBinding.FieldName = 'SLANG'
                  Options.Editing = False
                  Width = 109
                end
                object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
                  Caption = 'Description'
                  DataBinding.FieldName = 'SDESCRIPTION'
                  Width = 562
                end
              end
              object cxGrid1Level1: TcxGridLevel
                GridView = cxGrid1DBTableView1
              end
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 681
          Height = 219
          Align = alTop
          TabOrder = 1
          DesignSize = (
            681
            219)
          object LAccountCode: TLabel
            Left = 132
            Top = 28
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Account'
          end
          object LEAccountName: TLabel
            Left = 103
            Top = 49
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Account name'
          end
          object LAccountType: TLabel
            Left = 148
            Top = 5
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Type'
          end
          object LGroup1: TLabel
            Left = 137
            Top = 76
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Group1'
          end
          object LGroup2: TLabel
            Left = 137
            Top = 100
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Group2'
          end
          object EAccountMain: TEdit
            Left = 176
            Top = 24
            Width = 105
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'EAccountMain'
            OnChange = EAccountMainChange
          end
          object EAccountName: TEdit
            Left = 176
            Top = 47
            Width = 493
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Constraints.MaxWidth = 500
            TabOrder = 1
            Text = 'EAccountName'
            OnChange = EAccountMainChange
          end
          object PAccounting: TPanel
            Left = 0
            Top = 120
            Width = 676
            Height = 96
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              676
              96)
            object LAccType: TLabel
              Left = 147
              Top = 4
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Type'
            end
            object LStatus: TLabel
              Left = 141
              Top = 28
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Status'
            end
            object LOpenItem: TLabel
              Left = 473
              Top = 28
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Openitem'
            end
            object LPosted: TLabel
              Left = 85
              Top = 75
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Transaction count'
            end
            object LcbLinkTaxAccount: TLabel
              Left = 134
              Top = 50
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Link tax'
            end
            object cbIncomeExpence: TComboBox
              Left = 176
              Top = 0
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemIndex = 0
              TabOrder = 0
              Text = 'Balans'
              OnChange = EAccountMainChange
              Items.Strings = (
                'Balans'
                'Income expence')
            end
            object ETransactions: TEdit
              Left = 176
              Top = 71
              Width = 121
              Height = 21
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 1
              Text = 'ETransactions'
            end
            object CBInActive: TComboBox
              Left = 176
              Top = 24
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 2
              OnChange = EAccountMainChange
              Items.Strings = (
                'Active'
                'Inactive')
            end
            object cbOpenItem: TComboBox
              Left = 525
              Top = 24
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 3
              OnChange = EAccountMainChange
              Items.Strings = (
                'No'
                'Yes')
            end
            object CBSubaccounts: TCheckBox
              Left = 452
              Top = 3
              Width = 217
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Sub accounts'
              TabOrder = 4
              OnClick = EAccountMainChange
            end
            object cbLinkTaxAccount: TComboBox
              Left = 176
              Top = 47
              Width = 494
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              Constraints.MaxWidth = 500
              TabOrder = 5
              OnChange = EAccountMainChange
            end
          end
          object BSaveAccount: TBitBtn
            Left = 556
            Top = 1
            Width = 113
            Height = 40
            Caption = 'Save'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 3
            OnClick = APostAccountExecute
          end
          object cbAccountType: TComboBox
            Left = 176
            Top = 1
            Width = 177
            Height = 21
            Style = csDropDownList
            TabOrder = 4
            OnChange = EAccountMainChange
            Items.Strings = (
              'General ledger'
              'Bank / cash'
              'Tax')
          end
          object EAccountSub: TEdit
            Left = 288
            Top = 24
            Width = 65
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Text = 'EAccount'
            OnChange = EAccountMainChange
          end
          object cbGroup1: TComboBox
            Left = 176
            Top = 72
            Width = 494
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            Constraints.MaxWidth = 500
            TabOrder = 6
            OnChange = EAccountMainChange
          end
          object cbGroup2: TComboBox
            Left = 176
            Top = 96
            Width = 494
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            Constraints.MaxWidth = 500
            TabOrder = 7
            OnChange = EAccountMainChange
          end
        end
      end
      object TSGroup: TTabSheet
        Caption = 'TSGroup'
        ImageIndex = 1
        object LGroupName: TLabel
          Left = 16
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Groupname'
        end
        object LFinCat: TLabel
          Left = 16
          Top = 48
          Width = 95
          Height = 13
          Caption = 'Financial Categories'
        end
        object EGroupname: TEdit
          Left = 16
          Top = 24
          Width = 249
          Height = 21
          TabOrder = 0
          Text = 'EGroupname'
          OnChange = EGroupnameChange
        end
        object CBFinCategory: TComboBox
          Left = 16
          Top = 64
          Width = 249
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          OnChange = CBFinCategoryChange
          Items.Strings = (
            'No category'
            'Assets'
            'Capital'
            'Expenses'
            'Income'
            'Liabilities')
        end
        object BitBtn1: TBitBtn
          Left = 269
          Top = 23
          Width = 75
          Height = 23
          Action = APostGroup
          Caption = 'Save'
          DoubleBuffered = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00EAEAEA00D2D2D200CCCCCC00E7E7E700FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C0C0
            C000706565006838380066191900654747005148480073737300B5B5B500F4F4
            F400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E7E7E00B97E
            7E00AA646400AE6364008F333300D4A3A400F3B8B800BB8181005A3B3B005D5D
            5D00A9A9A900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CDABAB00BD8C
            8C00D4999A00BE615600BD6C6C00DC938500CC8B8200E0B3B500F6C1C100CB93
            9300623E3E0063636300C1C1C100FF00FF00FF00FF00FF00FF00CFB2B200C69D
            9D00DDAAAB00BB6E6600BD737300E3A09000FFAE9600E5927900C38D8600D7AC
            AD00ECB6B600B67C7C004F3F3F008B8B8B00F4F4F400FF00FF00CFAEAE00C5A5
            A500F7CECE00B46A6000DA9B9C00EE9F8C00F8AA9800F3A89900FCB09E00E098
            8500C9989300D5A7A800DD9E9E007C4747006B6B6B00F3F3F300D3A9A900C09B
            9B00DBBBBD00B3706500DDACAD00F4A59700FCB4A800FDB6AC00F2B1A800EAB0
            A700F4BAAD00E6A79700B2807D00B961610073202000D4D4D400D2A2A200C596
            9600DEBEC000B2746800D7B3B400FBB3A900FEBEB700FDBCB600F3B7B200F2BC
            B600ECBEB700E0AFA800DB968B00CF898A00A7414100DBDBDB00D29C9C00CA91
            9100F6CBCC00AC766B00E4C8C900F8AFA800D98E8B00D1858200DF9E9B00EEBC
            B900E8B3B000DDA9A200D6918B00D285850097434300EDEDED00D29C9C00D390
            9000E9B1B300B3797200EACDCE00E9958F00BD666300B0535300AD5452007E24
            2300AD6E6E0095414100D3898100D78585007C4B4B00FF00FF00D49B9B00DA8D
            8D00E9A8A800B3797600E2C2C100E2867B00A94F4E00F7929200FA949400FF9C
            9C00C8939300D3868600AD555200DA8787007A676700FF00FF00D99A9A00E78F
            8F00FCAFAF00D3909000E5C7C700C0818100F3A6A600DC747400E17B7B00E47E
            7E00EA818100EE878700FE989800D36D6D008D888800FF00FF00DB909000EF8B
            8B00E58D8D00D98B8B00EDD2D200BE767600C8636300CB656500CD676700D26C
            6C00D56F6F00DB757500E07A7A00FB8D8D0085858500FF00FF00E3A2A200EFC1
            C100C7B3B3009F929200C58E8E00F6999900D26B6B00BD565600B7515100BD57
            5700C45E5E00C8626200CD676700E27979006E626200FF00FF00FDE6E600F6C0
            C000FBC0C000FFC1C100E7A9A900FAE2E2009E676700FFA8A800FF9F9F00F592
            9200E07D7D00CB5F5F00BB555500D169690090838300FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FFF3F300F9BBBB00A0707000AF989800BE66
            6600BA7B7B00FBC6C600FFD7D700FFEDED00FF00FF00FF00FF00}
          ParentDoubleBuffered = False
          TabOrder = 2
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1118
    Height = 65
    Align = alTop
    TabOrder = 1
    OnDblClick = Panel2DblClick
    object LSearchAccount: TLabel
      Left = 19
      Top = 36
      Width = 90
      Height = 13
      Caption = 'Account starts with'
    end
    object LSort: TLabel
      Left = 20
      Top = 12
      Width = 19
      Height = 13
      Caption = 'Sort'
    end
    object LFliterAccountDesc: TLabel
      Left = 299
      Top = 40
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Description'
    end
    object CBGroup: TComboBox
      Left = 121
      Top = 10
      Width = 163
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'Group1'
      OnChange = CBGroupChange
      Items.Strings = (
        'Group1'
        'Group2'
        'FinCat'
        'No group')
    end
    object EFilerAccount: TEdit
      Left = 120
      Top = 34
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnKeyPress = EFilerAccountKeyPress
    end
    object cbExpand: TCheckBox
      Left = 600
      Top = 37
      Width = 145
      Height = 17
      Caption = 'Expand after refresh'
      TabOrder = 2
    end
    object EDescription: TEdit
      Left = 360
      Top = 37
      Width = 161
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 3
      OnKeyPress = EFilerAccountKeyPress
    end
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 65
    Width = 1118
    Height = 26
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Spacing = 0
  end
  object TVMain: TcxTreeView
    Left = 0
    Top = 91
    Width = 417
    Height = 523
    Align = alClient
    DragMode = dmAutomatic
    ParentFont = False
    PopupMenu = pmTreeView
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Lucida Console'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    OnDragDrop = TVMainDragDrop
    OnDragOver = TVMainDragOver
    HideSelection = False
    Images = dmOsfResource.ImageList1
    ReadOnly = True
    StateImages = DMTCCoreLink.ImageList1
    OnChange = TVMainChange
    OnChanging = TVMainChanging
    OnEditing = TVMainEditing
  end
  object ZQTotalsAccounts: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select  '
      'Account.SAccountCode,'
      'Account.SDescription,'
      'Account.WAccountid,'
      'Account.WAccountTypeId,'
      'Account.WREPORTINGGROUP1ID,'
      'Account.WREPORTINGGROUP2ID, '
      'Account.BSUBACCOUNTS, '
      'Account.BINCOMEEXPENSE, '
      'Account.BOPENITEM, '
      'Account.BINACTIVE, '
      'Account.DSYSDATE,'
      'Account.WLINKACCOUNT,'
      'Account.WTAXACCOUNT,'
      'Sum(Totals.FAmount) Totaal'
      
        '  from account left join Totals on (account.Waccountid = totals.' +
        'Waccountid ) '
      'group by Account.SAccountCode,'
      'Account.SDescription,'
      'Account.WAccountid,'
      'Account.WAccountTypeId,'
      'Account.WREPORTINGGROUP1ID,'
      'Account.WREPORTINGGROUP2ID, '
      'Account.BSUBACCOUNTS, '
      'Account.BINCOMEEXPENSE, '
      'Account.BOPENITEM, '
      'Account.BINACTIVE, '
      'Account.DSYSDATE,'
      'Account.WLINKACCOUNT,'
      'Account.WTAXACCOUNT')
    BeforeOpen = ZQTotalsAccountsBeforeOpen
    Left = 184
    Top = 256
    object ZQTotalsAccountsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQTotalsAccountsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQTotalsAccountsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTotalsAccountsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQTotalsAccountsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object ZQTotalsAccountsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object ZQTotalsAccountsBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQTotalsAccountsBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQTotalsAccountsBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQTotalsAccountsBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQTotalsAccountsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTotalsAccountsTOTAAL: TFloatField
      FieldName = 'TOTAAL'
      ReadOnly = True
    end
    object ZQTotalsAccountsWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
    object ZQTotalsAccountsWTAXACCOUNT: TIntegerField
      FieldName = 'WTAXACCOUNT'
    end
  end
  object ZQHasTransactions: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select count(*) from transact where WAccountID = :Accountid')
    Left = 184
    Top = 209
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Accountid'
      end>
  end
  object ZQSetOFBookIsEmpty: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select first 1  * from transact')
    Left = 184
    Top = 305
  end
  object pmTreeView: TPopupMenu
    Images = dmOsfResource.ImageList1
    Left = 300
    Top = 140
    object Addgroup1: TMenuItem
      Action = AAddGroup
    end
    object Post: TMenuItem
      Action = APostGroup
    end
    object Deletegroup1: TMenuItem
      Action = ADeleteGroup
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object AMoveGroupUp1: TMenuItem
      Action = AMoveGroupUp
      SubMenuImages = DMTCCoreLink.ImageList1
    end
    object AMoveGroupDown1: TMenuItem
      Action = AMoveGroupDown
    end
    object Movetoleft1: TMenuItem
      Action = AMoveGroupLevelToLower
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Addaccount1: TMenuItem
      Action = AAddAccount
    end
    object AddSub1: TMenuItem
      Action = AAddSubAccount
    end
    object ADeleteAccount1: TMenuItem
      Action = ADeleteAccount
    end
    object Save1: TMenuItem
      Action = APostAccount
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Refresh1: TMenuItem
      Action = ARefresh
    end
    object Colapsall1: TMenuItem
      Action = AColaps
    end
    object Expandall1: TMenuItem
      Action = AExpand
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items.CaptionOptions = coNone
        Items = <
          item
            Action = ADeleteAccount
            Caption = 'De&lete'
            ImageIndex = 33
          end
          item
            Action = ADeleteGroup
            Caption = 'Dele&te'
            ImageIndex = 33
          end
          item
            Caption = '-'
          end
          item
            Action = AAddAccount
            Caption = 'A&dd'
            ImageIndex = 15
          end
          item
            Action = AAddGroup
            Caption = '&Add'
            ImageIndex = 16
          end
          item
            Caption = '-'
          end
          item
            Action = AMoveGroupUp
            Caption = '&Move up'
            ImageIndex = 31
          end
          item
            Action = AMoveGroupDown
            Caption = 'M&ove down'
            ImageIndex = 30
          end
          item
            Action = AMoveGroupLevelToLower
            Caption = 'Mo&ve to left'
            ImageIndex = 32
          end
          item
            Action = APostAccount
            Caption = '&Save'
            ImageIndex = 35
          end
          item
            Action = APostGroup
            Caption = 'Sav&e'
            ImageIndex = 35
          end
          item
            Caption = '-'
          end
          item
            Action = ARefresh
            Caption = '&Refresh'
            ImageIndex = 14
          end
          item
            Action = AExpand
            Caption = 'E&xpand all'
            ImageIndex = 38
          end
          item
            Action = AColaps
            Caption = '&Colaps all'
            ImageIndex = 37
          end
          item
            Action = AAddSubAccount
            Caption = 'Add S&ub'
            ImageIndex = 36
          end>
        ActionBar = ActionToolBar1
      end>
    Images = dmOsfResource.ImageList1
    Left = 184
    Top = 360
    StyleName = 'XP Style'
    object AAddAccount: TAction
      Category = 'account'
      Caption = 'Add'
      ImageIndex = 15
      OnExecute = AAddAccountExecute
    end
    object APostAccount: TAction
      Category = 'account'
      Caption = 'Save'
      ImageIndex = 35
      OnExecute = APostAccountExecute
    end
    object ADeleteAccount: TAction
      Category = 'account'
      Caption = 'Delete'
      ImageIndex = 33
      OnExecute = ADeleteAccountExecute
    end
    object AMoveGroupUp: TAction
      Category = 'Groups'
      Caption = 'Move up'
      ImageIndex = 31
      OnExecute = AMoveGroupUpExecute
    end
    object AMoveGroupDown: TAction
      Category = 'Groups'
      Caption = 'Move down'
      ImageIndex = 30
      OnExecute = AMoveGroupDownExecute
    end
    object AMoveGroupLevelToLower: TAction
      Category = 'Groups'
      Caption = 'Move to left'
      ImageIndex = 32
      OnExecute = AMoveGroupLevelToLowerExecute
    end
    object ADeleteGroup: TAction
      Category = 'Groups'
      Caption = 'Delete'
      ImageIndex = 33
      OnExecute = ADeleteGroupExecute
    end
    object AAddGroup: TAction
      Category = 'Groups'
      Caption = 'Add'
      ImageIndex = 16
      OnExecute = AAddGroupExecute
    end
    object APostGroup: TAction
      Category = 'Groups'
      Caption = 'Save'
      ImageIndex = 35
      OnExecute = APostGroupExecute
    end
    object ARefresh: TAction
      Category = 'General'
      Caption = 'Refresh'
      ImageIndex = 14
      OnExecute = ARefreshExecute
    end
    object AExpand: TAction
      Category = 'General'
      Caption = 'Expand all'
      ImageIndex = 38
      OnExecute = AExpandExecute
    end
    object AColaps: TAction
      Category = 'General'
      Caption = 'Colaps all'
      ImageIndex = 37
      OnExecute = AColapsExecute
    end
    object AAddSubAccount: TAction
      Category = 'account'
      Caption = 'Add Sub'
      ImageIndex = 36
    end
  end
  object dsSubAccounts: TDataSource
    Left = 614
    Top = 178
  end
  object ZQGen: TUniQuery
    DataTypeMap = <>
    Left = 184
    Top = 432
  end
  object ZQLinks: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from ACCOUNTREF where Waccountid  =  :waccountid ')
    CachedUpdates = True
    UpdateObject = ZUSQLLinks
    AfterInsert = ZQLinksAfterInsert
    AfterEdit = ZQLinksAfterEdit
    AfterDelete = ZQLinksAfterDelete
    Left = 433
    Top = 626
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'waccountid'
      end>
    object ZQLinksWACCOUNTREFID: TIntegerField
      FieldName = 'WACCOUNTREFID'
    end
    object ZQLinksSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object ZQLinksWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object ZUSQLLinks: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO ACCOUNTREF'
      
        '  (ACCOUNTREF.WACCOUNTREFID, ACCOUNTREF.SREFERENCE, ACCOUNTREF.W' +
        'ACCOUNTID)'
      'VALUES'
      '  (:WACCOUNTREFID, :SREFERENCE, :WACCOUNTID)')
    DeleteSQL.Strings = (
      'DELETE FROM ACCOUNTREF'
      'WHERE ACCOUNTREF.WACCOUNTREFID = :OLD_WACCOUNTREFID')
    ModifySQL.Strings = (
      'UPDATE ACCOUNTREF SET'
      '  ACCOUNTREF.WACCOUNTREFID = :WACCOUNTREFID,'
      '  ACCOUNTREF.SREFERENCE = :SREFERENCE,'
      '  ACCOUNTREF.WACCOUNTID = :WACCOUNTID'
      'WHERE ACCOUNTREF.WACCOUNTREFID = :OLD_WACCOUNTREFID')
    Left = 329
    Top = 614
  end
  object dslinks: TDataSource
    DataSet = ZQLinks
    Left = 393
    Top = 638
  end
  object ZQNewBudget: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from transact_budget where WAccountid = :WAccountid'
      'order by ddate')
    CachedUpdates = True
    UpdateObject = ZUSQLNEwbudget
    AfterOpen = ZQNewBudgetAfterOpen
    AfterInsert = ZQNewBudgetAfterInsert
    BeforePost = ZQNewBudgetBeforePost
    AfterScroll = ZQNewBudgetAfterScroll
    Left = 275
    Top = 570
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountid'
      end>
    object ZQNewBudgetWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQNewBudgetDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQNewBudgetSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQNewBudgetSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQNewBudgetFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object ZQNewBudgetWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQNewBudgetDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQNewBudgetWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object ZQNewBudgetBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQNewBudgetWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      OnGetText = ZQNewBudgetWREPORTINGGROUP1IDGetText
    end
    object ZQNewBudgetWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      OnGetText = ZQNewBudgetWREPORTINGGROUP1IDGetText
    end
    object ZQNewBudgetWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object DSNewBudget: TDataSource
    DataSet = ZQNewBudget
    Left = 368
    Top = 472
  end
  object ZUSQLNEwbudget: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO transact_budget'
      
        '  (transact_budget.WTRANSACTIONID, transact_budget.DDATE, transa' +
        'ct_budget.SREFERENCE, '
      
        '   transact_budget.SDESCRIPTION, transact_budget.FAMOUNT, transa' +
        'ct_budget.WUSERID, '
      
        '   transact_budget.DSYSDATE, transact_budget.WJOBCODEID, transac' +
        't_budget.BEXCLUSIVE, '
      
        '   transact_budget.WREPORTINGGROUP1ID, transact_budget.WREPORTIN' +
        'GGROUP2ID, '
      '   transact_budget.WACCOUNTID)'
      'VALUES'
      
        '  (:WTRANSACTIONID, :DDATE, :SREFERENCE, :SDESCRIPTION, :FAMOUNT' +
        ', :WUSERID, '
      
        '   :DSYSDATE, :WJOBCODEID, :BEXCLUSIVE, :WREPORTINGGROUP1ID, :WR' +
        'EPORTINGGROUP2ID, '
      '   :WACCOUNTID)')
    DeleteSQL.Strings = (
      'DELETE FROM transact_budget'
      'WHERE'
      '  transact_budget.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    ModifySQL.Strings = (
      'UPDATE transact_budget SET'
      '  transact_budget.WTRANSACTIONID = :WTRANSACTIONID,'
      '  transact_budget.DDATE = :DDATE,'
      '  transact_budget.SREFERENCE = :SREFERENCE,'
      '  transact_budget.SDESCRIPTION = :SDESCRIPTION,'
      '  transact_budget.FAMOUNT = :FAMOUNT,'
      '  transact_budget.WUSERID = :WUSERID,'
      '  transact_budget.DSYSDATE = :DSYSDATE,'
      '  transact_budget.WJOBCODEID = :WJOBCODEID,'
      '  transact_budget.BEXCLUSIVE = :BEXCLUSIVE,'
      '  transact_budget.WREPORTINGGROUP1ID = '
      ':WREPORTINGGROUP1ID,'
      '  transact_budget.WREPORTINGGROUP2ID = '
      ':WREPORTINGGROUP2ID,'
      '  transact_budget.WACCOUNTID = :WACCOUNTID'
      'WHERE'
      '  transact_budget.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    Left = 299
    Top = 486
  end
  object dsCostgroup2: TDataSource
    Left = 184
    Top = 612
  end
  object dsTranslations: TDataSource
    DataSet = ZQAccTranslation
    Left = 951
    Top = 124
  end
  object ZQAccTranslation: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'SELECT ac.*'
      'FROM ACCOUNT_TRANSLATE ac join '
      'groups  on  ac.WLANGUAGEID = groups.wgroupid'
      ' where  groups.WGROUPTYPEID = 1004'
      ' and ac.Waccountid = :Accid')
    Left = 115
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Accid'
      end>
    object ZQAccTranslationWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQAccTranslationWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
    end
    object ZQAccTranslationSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 255
    end
  end
  object Dsproject: TDataSource
    DataSet = qprojects
    Left = 304
    Top = 216
  end
  object qprojects: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'SELECT a.WJOBPROJECTID, trim(trim(a.SJOBPROJECTCODE) ||'#39' '#39' || a.' +
        'SDESCRIPTION)  sdescription'
      'FROM JOBPROJECT a where a.BENABLED = 1')
    Left = 296
    Top = 272
  end
end
