object fmBatchEntry: TfmBatchEntry
  Left = 325
  Top = 155
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Batch Entry'
  ClientHeight = 544
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 939
    Height = 544
    ActivePage = tsEnter
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tsEnter: TTabSheet
      Caption = 'Enter'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 931
        Height = 516
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 154
          Width = 931
          Height = 362
          Align = alClient
          TabOrder = 1
          object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
            PopupMenu = PopupMenu2
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = cxGrid1DBBandedTableView1CustomDrawCell
            OnEditing = cxGrid1DBBandedTableView1Editing
            OnEditKeyDown = cxGrid1DBBandedTableView1EditKeyDown
            OnEditKeyPress = cxGrid1DBBandedTableView1EditKeyPress
            OnEditValueChanged = cxGrid1DBBandedTableView1EditValueChanged
            OnFocusedItemChanged = cxGrid1DBBandedTableView1FocusedItemChanged
            OnFocusedRecordChanged = cxGrid1DBBandedTableView1FocusedRecordChanged
            OnInitEditValue = cxGrid1DBBandedTableView1InitEditValue
            DataController.DataSource = dsBatch
            DataController.KeyFieldNames = 'WLINEID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'FDEBIT'
                Column = cxGrid1DBBandedTableView1FDEBIT
              end
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'FCREDIT'
                Column = cxGrid1DBBandedTableView1FCREDIT
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Appending = True
            OptionsSelection.MultiSelect = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.FooterAutoHeight = True
            OptionsView.FooterMultiSummaries = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            OptionsView.BandHeaders = False
            Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
            Bands = <
              item
                Width = 571
              end>
            object cxGrid1DBBandedTableView1WLINEID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WLINEID'
              Options.Editing = False
              SortIndex = 1
              SortOrder = soAscending
              Width = 55
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SREFERENCE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SREFERENCE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGrid1DBBandedTableView1SREFERENCEPropertiesValidate
              Width = 63
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SACCOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SACCOUNT'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDESCRIPTION'
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 113
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FDEBIT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FDEBIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 6
              Properties.DisplayFormat = ' #,##0.00; #,##0.00-'
              Properties.EditFormat = '0.00; -0.00'
              Properties.OnValidate = cxGrid1DBBandedTableView1FDEBITPropertiesValidate
              Options.Sorting = False
              Width = 59
              Position.BandIndex = 0
              Position.ColIndex = 27
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FAMOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FAMOUNT'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 26
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1STAX: TcxGridDBBandedColumn
              DataBinding.FieldName = 'STAX'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1DDATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DDATE'
              PropertiesClassName = 'TcxDateEditProperties'
              Properties.SaveTime = False
              Width = 59
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FCREDIT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FCREDIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.DecimalPlaces = 6
              Properties.DisplayFormat = ' #,##0.00; #,##0.00-'
              Properties.EditFormat = '0.00; -0.00'
              Properties.OnValidate = cxGrid1DBBandedTableView1FDEBITPropertiesValidate
              Options.Sorting = False
              Width = 64
              Position.BandIndex = 0
              Position.ColIndex = 28
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SCONTRAACCOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SCONTRAACCOUNT'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FTAXAMOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FTAXAMOUNT'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 29
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1DALLOCATEDDATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DALLOCATEDDATE'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1BRECONCILED: TcxGridDBBandedColumn
              DataBinding.FieldName = 'BRECONCILED'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1BEXCLUSIVE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'BEXCLUSIVE'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = -1
              Position.ColIndex = -1
              Position.RowIndex = -1
            end
            object cxGrid1DBBandedTableView1WACCOUNTID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WACCOUNTID'
              RepositoryItem = fmLookupgrids.cbAccount
              OnGetDisplayText = cxGrid1DBBandedTableView1WACCOUNTIDGetDisplayText
              Width = 71
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FQTY: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FQTY'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WPROFILEID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WPROFILEID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WTAX2ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WTAX2ID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 13
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1NOTUSED: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NOTUSED'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 14
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SPROFILE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SPROFILE'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 15
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SJOBCODE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SJOBCODE'
              RepositoryItem = fmLookupgrids.cbJobcode
              Width = 33
              Position.BandIndex = 0
              Position.ColIndex = 22
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1STAX2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'STAX2'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 16
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1BLINKED: TcxGridDBBandedColumn
              DataBinding.FieldName = 'BLINKED'
              Visible = False
              SortIndex = 0
              SortOrder = soDescending
              VisibleForCustomization = False
              Position.BandIndex = -1
              Position.ColIndex = -1
              Position.RowIndex = -1
            end
            object cxGrid1DBBandedTableView1DSYSDATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DSYSDATE'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 17
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FTAX2AMOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FTAX2AMOUNT'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 18
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WTAXID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WTAXID'
              RepositoryItem = fmLookupgrids.cbTax
              OnGetDisplayText = cxGrid1DBBandedTableView1WCONTRAACCOUNTIDGetDisplayText
              Width = 51
              Position.BandIndex = 0
              Position.ColIndex = 25
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WCONTRAACCOUNTID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WCONTRAACCOUNTID'
              RepositoryItem = fmLookupgrids.cbContraccount
              OnGetDisplayText = cxGrid1DBBandedTableView1WCONTRAACCOUNTIDGetDisplayText
              Width = 68
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WREPORTINGGROUP1ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WREPORTINGGROUP1ID'
              RepositoryItem = fmLookupgrids.cbGroup1
              Width = 44
              Position.BandIndex = 0
              Position.ColIndex = 23
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WREPORTINGGROUP2ID'
              RepositoryItem = fmLookupgrids.cbGroup2
              Width = 42
              Position.BandIndex = 0
              Position.ColIndex = 24
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WLINKEDID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WLINKEDID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 19
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1DPAYMENTDATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DPAYMENTDATE'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 20
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WDOCID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WDOCID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 21
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn
              Caption = 'x'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Default = True
                  Kind = bkEllipsis
                end>
              Properties.OnButtonClick = cxGrid1DBBandedTableView1Column1PropertiesButtonClick
              Options.Sorting = False
              Width = 51
              Position.BandIndex = 0
              Position.ColIndex = 30
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1ISBALANCE: TcxGridDBBandedColumn
              Caption = 'Balance'
              DataBinding.FieldName = 'ISBALANCE'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 31
              Position.RowIndex = 0
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBBandedTableView1
          end
        end
        object PnlRpBatch: TPanel
          Left = 174
          Top = 234
          Width = 375
          Height = 183
          BevelInner = bvLowered
          TabOrder = 0
          Visible = False
          OnEnter = PnlRpBatchEnter
          OnExit = PnlRpBatchExit
          object Label7: TLabel
            Left = 86
            Top = 4
            Width = 197
            Height = 13
            Caption = 'Enter month and Year to repeat entries  to'
            WordWrap = True
          end
          object lblMonth: TLabel
            Left = 220
            Top = 32
            Width = 30
            Height = 13
            Caption = '&Period'
          end
          object Label8: TLabel
            Left = 16
            Top = 30
            Width = 22
            Height = 13
            Caption = '&Year'
          end
          object Label9: TLabel
            Left = 16
            Top = 90
            Width = 109
            Height = 13
            Caption = 'Add this to descriptions'
          end
          object Label16: TLabel
            Left = 218
            Top = 90
            Width = 75
            Height = 13
            Caption = 'New Reference'
          end
          object RpbtCancel: TBitBtn
            Left = 264
            Top = 144
            Width = 97
            Height = 25
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
            TabOrder = 7
            TabStop = False
            OnClick = RpbtCancelClick
            OnKeyPress = RpbtCancelKeyPress
          end
          object RpbtOk: TBitBtn
            Left = 160
            Top = 144
            Width = 97
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
            TabOrder = 5
            OnClick = RpbtOkClick
            OnKeyPress = RpbtOkKeyPress
          end
          object Rien: TPanel
            Left = 6
            Top = 93
            Width = 277
            Height = 0
            UseDockManager = False
            TabOrder = 6
            TabStop = True
            OnEnter = RienEnter
          end
          object LbYear: TListBox
            Left = 14
            Top = 48
            Width = 187
            Height = 33
            ItemHeight = 13
            Items.Strings = (
              'Last Year'
              'This Year')
            TabOrder = 0
            OnKeyPress = LbYearKeyPress
          end
          object edtPeriod: TEdit
            Left = 218
            Top = 48
            Width = 109
            Height = 21
            TabStop = False
            ReadOnly = True
            TabOrder = 1
          end
          object edtAddDesc: TEdit
            Left = 14
            Top = 108
            Width = 187
            Height = 21
            TabOrder = 3
            OnKeyPress = LbYearKeyPress
          end
          object edtNewRef: TEdit
            Left = 218
            Top = 108
            Width = 121
            Height = 21
            TabOrder = 4
          end
          object BitBtn2: TBitBtn
            Left = 325
            Top = 49
            Width = 24
            Height = 19
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
            TabOrder = 2
            OnClick = BitBtn2Click
          end
        end
        object TbarMain: TToolBar
          Left = 0
          Top = 0
          Width = 931
          Height = 68
          AutoSize = True
          ButtonHeight = 68
          ButtonWidth = 73
          DrawingStyle = dsGradient
          Images = dmOsfResource.BatchEnabledButtons
          ShowCaptions = True
          TabOrder = 2
          Transparent = True
          object PnlAlias: TPanel
            Left = 0
            Top = 0
            Width = 117
            Height = 68
            BevelOuter = bvNone
            TabOrder = 0
            OnExit = PnlAliasExit
            DesignSize = (
              117
              68)
            object Label15: TLabel
              Left = 9
              Top = 8
              Width = 80
              Height = 13
              Caption = '&Change the Alias'
            end
            object edtAlias: TEdit
              Left = 8
              Top = 34
              Width = 107
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 15
              TabOrder = 0
              OnKeyDown = edtAliasKeyDown
            end
          end
          object tlbtnDelete: TToolButton
            Left = 117
            Top = 0
            Hint = '^D : Delete'
            AutoSize = True
            Caption = '^D : Delete'
            ImageIndex = 0
            OnClick = tlbtnDeleteClick
          end
          object tlbtnInsert: TToolButton
            Left = 182
            Top = 0
            Hint = '^N : Insert'
            AutoSize = True
            Caption = '^N : Insert'
            ImageIndex = 1
            OnClick = tlbtnInsertClick
          end
          object tlbtnBalance: TToolButton
            Left = 242
            Top = 0
            Hint = 'F5 : Allocate'
            AutoSize = True
            Caption = 'F5 : Balance'
            ImageIndex = 18
            OnClick = tlbtnBalanceClick
          end
          object tlbtnPost: TToolButton
            Left = 313
            Top = 0
            Hint = 'F6 : Contra'
            AutoSize = True
            Caption = 'F6 : Post'
            ImageIndex = 2
            OnClick = tlbtnPostClick
          end
          object tlbtnExclIncl: TToolButton
            Left = 368
            Top = 0
            Hint = 'F7 : Exclusive'
            AutoSize = True
            Caption = 'F7 : Exclusive'
            Grouped = True
            ImageIndex = 4
            Style = tbsCheck
            OnClick = tlbtnExclInclClick
          end
          object tlbtnincl: TToolButton
            Left = 445
            Top = 0
            Caption = 'F7 : Inclusive'
            Grouped = True
            ImageIndex = 8
            Style = tbsCheck
            OnClick = tlbtnExclInclClick
          end
          object tlbtnList: TToolButton
            Left = 518
            Top = 0
            Hint = 'F8 : Link'
            AutoSize = True
            Caption = 'F8 : List'
            ImageIndex = 3
            OnClick = tlbtnListClick
          end
          object tlbtnProcess: TToolButton
            Left = 573
            Top = 0
            Hint = 'F9 : Process'
            AutoSize = True
            Caption = 'F9 : Process'
            ImageIndex = 6
            OnClick = tlbtnProcessClick
          end
          object tlbtnSetup: TToolButton
            Left = 643
            Top = 0
            Hint = 'F10 : Setup'
            AutoSize = True
            Caption = 'F10 : Setup'
            ImageIndex = 7
            OnClick = tlbtnSetupClick
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 68
          Width = 931
          Height = 86
          Align = alTop
          BorderStyle = bsSingle
          TabOrder = 3
          object lFind: TLabel
            Left = 1
            Top = 61
            Width = 925
            Height = 20
            Align = alBottom
            Alignment = taCenter
            Anchors = [akRight, akBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 6
          end
          object GridPanel1: TGridPanel
            Left = 1
            Top = 1
            Width = 925
            Height = 60
            Align = alClient
            ColumnCollection = <
              item
                Value = 23.148148148148150000
              end
              item
                Value = 23.148148148148150000
              end
              item
                Value = 23.148148148148150000
              end
              item
                Value = 13.888888888888890000
              end
              item
                Value = 16.666666666666660000
              end>
            ControlCollection = <
              item
                Column = 0
                Control = Label3
                Row = 0
              end
              item
                Column = 1
                Control = LContraAccount
                Row = 0
              end
              item
                Column = 2
                Control = Label1
                Row = 0
              end
              item
                Column = 3
                Control = Label2
                Row = 0
              end
              item
                Column = 4
                Control = Label5
                Row = 0
              end
              item
                Column = 0
                Control = lAlocatedTo
                Row = 1
              end
              item
                Column = 1
                Control = Lcontraaccountcode
                Row = 1
              end
              item
                Column = 2
                Control = LIncAmount
                Row = 1
              end
              item
                Column = 3
                Control = lExclAmount
                Row = 1
              end
              item
                Column = 4
                Control = LRefTotal
                Row = 1
              end>
            RowCollection = <
              item
                Value = 50.000000000000000000
              end
              item
                Value = 50.000000000000000000
              end>
            TabOrder = 0
            object Label3: TLabel
              Left = 1
              Top = 17
              Width = 213
              Height = 13
              Align = alBottom
              Alignment = taRightJustify
              Caption = 'Allocated to :'
              Color = clWindowText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              ExplicitLeft = 152
              ExplicitWidth = 62
            end
            object LContraAccount: TLabel
              Left = 214
              Top = 17
              Width = 213
              Height = 13
              Align = alBottom
              Alignment = taRightJustify
              Caption = 'Contra Account :'
              Color = clWindowText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              ExplicitLeft = 347
              ExplicitWidth = 80
            end
            object Label1: TLabel
              Left = 427
              Top = 17
              Width = 213
              Height = 13
              Align = alBottom
              Alignment = taRightJustify
              Caption = 'Inclusive Amount :'
              Color = clWindowText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              ExplicitLeft = 553
              ExplicitWidth = 87
            end
            object Label2: TLabel
              Left = 640
              Top = 17
              Width = 128
              Height = 13
              Align = alBottom
              Alignment = taRightJustify
              Caption = 'Exclusive Amount :'
              Color = clWindowText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              ExplicitLeft = 678
              ExplicitWidth = 90
            end
            object Label5: TLabel
              Left = 768
              Top = 17
              Width = 156
              Height = 13
              Align = alBottom
              Alignment = taRightJustify
              Caption = 'Reference Total :'
              Color = clWindowText
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
              ExplicitLeft = 841
              ExplicitWidth = 83
            end
            object lAlocatedTo: TLabel
              Left = 1
              Top = 30
              Width = 213
              Height = 29
              Align = alClient
              Alignment = taRightJustify
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              WordWrap = True
              ExplicitTop = 46
              ExplicitWidth = 207
              ExplicitHeight = 13
            end
            object Lcontraaccountcode: TLabel
              Left = 214
              Top = 30
              Width = 213
              Height = 29
              Align = alClient
              Alignment = taRightJustify
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              WordWrap = True
              ExplicitTop = 46
              ExplicitWidth = 207
              ExplicitHeight = 13
            end
            object LIncAmount: TLabel
              Left = 427
              Top = 30
              Width = 213
              Height = 29
              Align = alClient
              Alignment = taRightJustify
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              ExplicitLeft = 472
              ExplicitTop = 46
              ExplicitWidth = 168
              ExplicitHeight = 13
            end
            object lExclAmount: TLabel
              Left = 640
              Top = 30
              Width = 128
              Height = 29
              Align = alClient
              Alignment = taRightJustify
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              ExplicitLeft = 664
              ExplicitTop = 46
              ExplicitWidth = 104
              ExplicitHeight = 13
            end
            object LRefTotal: TLabel
              Left = 768
              Top = 30
              Width = 156
              Height = 29
              Align = alClient
              Alignment = taRightJustify
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
              ExplicitLeft = 816
              ExplicitTop = 46
              ExplicitWidth = 108
              ExplicitHeight = 13
            end
          end
        end
      end
    end
    object tsPosted: TTabSheet
      Caption = 'Posted'
      ImageIndex = 1
    end
  end
  object ImportDialog: TOpenDialog
    DefaultExt = '*.csv'
    Filter = 
      'Comma Delimited Batches|*.csv|TurboCash 2.03 Batches|*.Del|All F' +
      'iles|*.*'
    Left = 412
    Top = 458
  end
  object ExportDialog: TSaveDialog
    DefaultExt = '*.csv'
    FileName = 'Export'
    Filter = 'Comma Delimited Batches|*.Csv|Txf File |*.Txf|All|*.*'
    Left = 404
    Top = 406
  end
  object xTblRpBatch: TUniTable
    TableName = 'BAT0T2'
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    ReadOnly = True
    Left = 272
    Top = 464
    object xTblRpBatchSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object xTblRpBatchSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 7
    end
    object xTblRpBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object xTblRpBatchFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object xTblRpBatchFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object xTblRpBatchSTAX: TStringField
      FieldName = 'STAX'
      Size = 7
    end
    object xTblRpBatchDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object xTblRpBatchFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object xTblRpBatchSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 7
    end
    object xTblRpBatchFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object xTblRpBatchDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object xTblRpBatchBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object xTblRpBatchBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object xTblRpBatchWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object xTblRpBatchWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object xTblRpBatchFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object xTblRpBatchWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object xTblRpBatchWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object xTblRpBatchNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object xTblRpBatchSPROFILE: TStringField
      FieldName = 'SPROFILE'
      Size = 35
    end
    object xTblRpBatchSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      Size = 8
    end
    object xTblRpBatchSTAX2: TStringField
      FieldName = 'STAX2'
      Size = 8
    end
    object xTblRpBatchBLINKED: TSmallintField
      FieldName = 'BLINKED'
    end
    object xTblRpBatchDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object xTblRpBatchFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object xTblRpBatchWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object xTblRpBatchWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object xTblRpBatchWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object xTblRpBatchWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object xTblRpBatchWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object xTblRpBatchDPAYMENTDATE: TDateTimeField
      FieldName = 'DPAYMENTDATE'
    end
    object xTblRpBatchWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 376
    Top = 260
    object Lookupdocument1: TMenuItem
      Caption = 'Lookup document'
      OnClick = Lookupdocument1Click
    end
    object Lookupdocwithammount1: TMenuItem
      Caption = 'Lookup doc with amount'
      OnClick = Lookupdocwithammount1Click
    end
    object Lookupdebtor1: TMenuItem
      Caption = 'Lookup debtor'
      OnClick = Lookupdebtor1Click
    end
    object Lookupcreditor1: TMenuItem
      Caption = 'Lookup creditor'
      OnClick = Lookupdebtor1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      object GenCopyFrom: TMenuItem
        Caption = 'Init'
      end
      object GenCopyto: TMenuItem
        Caption = 'Preform'
      end
    end
    object Lookuptransactions1: TMenuItem
      Caption = 'Lookup transactions'
      OnClick = Lookuptransactions1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Plugins: TMenuItem
      Caption = 'Plugins'
    end
    object createaccount1: TMenuItem
      Caption = 'create account'
      OnClick = createaccount1Click
    end
  end
  object QGen: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 344
    Top = 408
  end
  object tblBatch: TUniTable
    TableName = 'BAT0T2'
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    IndexFieldNames = 'WLineId Asc'
    BeforeOpen = tblBatchBeforeOpen
    BeforeClose = tblBatchBeforeClose
    AfterInsert = tblBatchAfterInsert
    BeforePost = tblBatchBeforePost
    AfterPost = tblBatchAfterPost
    AfterDelete = tblBatchAfterDelete
    AfterScroll = tblBatchAfterScroll
    OnCalcFields = tblBatchCalcFields
    Left = 96
    Top = 252
    object tblBatchWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object tblBatchSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      FixedChar = True
      Size = 15
    end
    object tblBatchSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      FixedChar = True
      Size = 8
    end
    object tblBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      FixedChar = True
      Size = 64
    end
    object tblBatchFDEBIT: TFloatField
      FieldName = 'FDEBIT'
      OnValidate = tblBatchWACCOUNTIDValidate
    end
    object tblBatchFCREDIT: TFloatField
      FieldName = 'FCREDIT'
      OnValidate = tblBatchWACCOUNTIDValidate
    end
    object tblBatchFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblBatchSTAX: TStringField
      FieldName = 'STAX'
      FixedChar = True
      Size = 8
    end
    object tblBatchWTAXID: TIntegerField
      FieldName = 'WTAXID'
      OnValidate = tblBatchWTAXIDValidate
    end
    object tblBatchDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblBatchSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      FixedChar = True
      Size = 8
    end
    object tblBatchWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
      OnValidate = tblBatchWCONTRAACCOUNTIDValidate
    end
    object tblBatchFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblBatchDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object tblBatchBRECONCILED: TIntegerField
      FieldName = 'BRECONCILED'
    end
    object tblBatchBEXCLUSIVE: TIntegerField
      FieldName = 'BEXCLUSIVE'
    end
    object tblBatchWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      OnValidate = tblBatchWACCOUNTIDValidate
    end
    object tblBatchFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object tblBatchWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBatchWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object tblBatchNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object tblBatchSPROFILE: TStringField
      FieldName = 'SPROFILE'
      FixedChar = True
      Size = 35
    end
    object tblBatchSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      FixedChar = True
      Size = 8
    end
    object tblBatchSTAX2: TStringField
      FieldName = 'STAX2'
      FixedChar = True
      Size = 8
    end
    object tblBatchBLINKED: TIntegerField
      FieldName = 'BLINKED'
    end
    object tblBatchDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBatchFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object tblBatchWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object tblBatchWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblBatchWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblBatchDPAYMENTDATE: TDateTimeField
      FieldName = 'DPAYMENTDATE'
    end
    object tblBatchWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object tblBatchISBALANCE: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'ISBALANCE'
      Calculated = True
    end
  end
  object dsBatch: TDataSource
    DataSet = tblBatch
    Left = 272
    Top = 412
  end
  object qGenBatchId: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 92
    Top = 384
  end
end
