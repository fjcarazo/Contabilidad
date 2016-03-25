object fmBatchEntryBank: TfmBatchEntryBank
  Left = 623
  Top = 310
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Batch Entry'
  ClientHeight = 556
  ClientWidth = 905
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 905
    Height = 556
    ActivePage = tsEnter
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tsEnter: TTabSheet
      Caption = 'Enter'
      object Panel3: TPanel
        Left = 0
        Top = 119
        Width = 897
        Height = 409
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 89
          Width = 897
          Height = 320
          Align = alClient
          TabOrder = 1
          object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
            PopupMenu = PopupMenu1
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
            DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
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
            OptionsData.Deleting = False
            OptionsData.Inserting = False
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
              SortIndex = 0
              SortOrder = soAscending
              Width = 38
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SREFERENCE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SREFERENCE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGrid1DBBandedTableView1SREFERENCEPropertiesValidate
              Width = 67
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
              Width = 120
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
              Width = 62
              Position.BandIndex = 0
              Position.ColIndex = 28
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FAMOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FAMOUNT'
              RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
              Options.Editing = False
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
              Width = 63
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
              Width = 59
              Position.BandIndex = 0
              Position.ColIndex = 27
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
              Width = 78
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
              Width = 36
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
              SortIndex = 1
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
              OnGetDisplayText = cxGrid1DBBandedTableView1WTAXIDGetDisplayText
              Width = 55
              Position.BandIndex = 0
              Position.ColIndex = 25
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WCONTRAACCOUNTID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WCONTRAACCOUNTID'
              PropertiesClassName = 'TcxExtLookupComboBoxProperties'
              Properties.DropDownAutoSize = True
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownSizeable = True
              Properties.ListFieldItem = fmLookupgrids.ContraAccountDBTableView1SACCOUNTCODE
              RepositoryItem = fmLookupgrids.cbContraccount
              Visible = False
              VisibleForCustomization = False
              Width = 72
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WREPORTINGGROUP1ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WREPORTINGGROUP1ID'
              RepositoryItem = fmLookupgrids.cbGroup1
              Width = 46
              Position.BandIndex = 0
              Position.ColIndex = 23
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WREPORTINGGROUP2ID'
              RepositoryItem = fmLookupgrids.cbGroup2
              Width = 45
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
              Position.BandIndex = 0
              Position.ColIndex = 30
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1ISBALANCE: TcxGridDBBandedColumn
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
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 897
          Height = 89
          Align = alTop
          BorderStyle = bsSingle
          PopupMenu = PopupMenu1
          TabOrder = 0
          object lFind: TLabel
            Left = 1
            Top = 64
            Width = 891
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
            Width = 891
            Height = 63
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
              end
              item
                Column = 1
                Control = Label4
                Row = 2
              end
              item
                Column = 0
                Control = Label10
                Row = 2
              end
              item
                Column = 2
                Control = Label11
                Row = 2
              end
              item
                Column = 3
                Control = Label12
                Row = 2
              end
              item
                Column = 4
                Control = ltax
                Row = 2
              end>
            RowCollection = <
              item
                Value = 50.000000000000000000
              end
              item
                Value = 50.000000000000000000
              end
              item
                SizeStyle = ssAuto
              end>
            TabOrder = 0
            DesignSize = (
              891
              63)
            object Label3: TLabel
              Left = 1
              Top = 12
              Width = 205
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
              ExplicitLeft = 144
              ExplicitWidth = 62
            end
            object LContraAccount: TLabel
              Left = 206
              Top = 12
              Width = 205
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
              ExplicitLeft = 331
              ExplicitWidth = 80
            end
            object Label1: TLabel
              Left = 411
              Top = 12
              Width = 205
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
              ExplicitLeft = 529
              ExplicitWidth = 87
            end
            object Label2: TLabel
              Left = 616
              Top = 12
              Width = 123
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
              ExplicitLeft = 649
              ExplicitWidth = 90
            end
            object Label5: TLabel
              Left = 739
              Top = 12
              Width = 151
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
              ExplicitLeft = 807
              ExplicitWidth = 83
            end
            object lAlocatedTo: TLabel
              Left = 1
              Top = 25
              Width = 205
              Height = 24
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
              Left = 206
              Top = 25
              Width = 205
              Height = 24
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
              ExplicitLeft = 214
              ExplicitTop = 46
              ExplicitWidth = 207
              ExplicitHeight = 13
            end
            object LIncAmount: TLabel
              Left = 411
              Top = 25
              Width = 205
              Height = 24
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
              Left = 616
              Top = 25
              Width = 123
              Height = 24
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
              Left = 739
              Top = 25
              Width = 151
              Height = 24
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
              ExplicitLeft = 741
              ExplicitTop = 31
            end
            object Label4: TLabel
              Left = 307
              Top = 49
              Width = 3
              Height = 13
              Anchors = []
              ExplicitLeft = 304
            end
            object Label10: TLabel
              Left = 102
              Top = 49
              Width = 3
              Height = 13
              Anchors = []
              ExplicitLeft = 84
            end
            object Label11: TLabel
              Left = 512
              Top = 49
              Width = 3
              Height = 13
              Anchors = []
              ExplicitLeft = 492
            end
            object Label12: TLabel
              Left = 676
              Top = 49
              Width = 3
              Height = 13
              Anchors = []
              ExplicitLeft = 655
            end
            object ltax: TLabel
              Left = 739
              Top = 49
              Width = 151
              Height = 13
              Align = alClient
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 273
              ExplicitTop = 50
              ExplicitWidth = 3
            end
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 68
        Width = 897
        Height = 51
        Align = alTop
        TabOrder = 1
        DesignSize = (
          897
          51)
        object Label6: TLabel
          Left = 93
          Top = 8
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Last total'
        end
        object LTotalAccountLast: TLabel
          Left = 144
          Top = 8
          Width = 90
          Height = 13
          Caption = 'LTotalAccountLast'
        end
        object Label7: TLabel
          Left = 28
          Top = 24
          Width = 108
          Height = 13
          Alignment = taRightJustify
          Caption = 'Last entered statement'
        end
        object LEnterdStatement: TLabel
          Left = 144
          Top = 24
          Width = 85
          Height = 13
          Caption = 'LEnterdStatement'
        end
        object LLLDiverence: TLabel
          Left = 259
          Top = 8
          Width = 86
          Height = 24
          Alignment = taRightJustify
          Caption = 'Diverence'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LDiverence: TLabel
          Left = 355
          Top = 8
          Width = 86
          Height = 24
          Caption = 'Diverence'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TMemo
          Left = 472
          Top = 1
          Width = 432
          Height = 49
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ParentColor = True
          ReadOnly = True
          TabOrder = 0
        end
      end
      object TbarMain: TToolBar
        Left = 0
        Top = 0
        Width = 897
        Height = 68
        AutoSize = True
        ButtonHeight = 68
        ButtonWidth = 110
        Color = clBtnFace
        DrawingStyle = dsGradient
        Images = dmOsfResource.BatchEnabledButtons
        ParentColor = False
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
            Left = 7
            Top = 8
            Width = 80
            Height = 13
            Caption = '&Change the Alias'
          end
          object edtAlias: TEdit
            Left = 7
            Top = 26
            Width = 108
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            MaxLength = 15
            TabOrder = 0
            OnKeyDown = edtAliasKeyDown
          end
        end
        object TBDeleteLine: TToolButton
          Left = 117
          Top = 0
          Caption = 'Delete line'
          ImageIndex = 0
          OnClick = Deleteline1Click
        end
        object tlbtnInsert: TToolButton
          Left = 227
          Top = 0
          Hint = '^N : Insert'
          AutoSize = True
          Caption = '^N : Insert'
          ImageIndex = 1
          OnClick = tlbtnInsertClick
        end
        object tlbtnIncl: TToolButton
          Left = 287
          Top = 0
          AutoSize = True
          Caption = 'Incl'
          ImageIndex = 11
          OnClick = tlbtnExclClick
        end
        object tlbtnExcl: TToolButton
          Left = 342
          Top = 0
          AutoSize = True
          Caption = 'Excl'
          ImageIndex = 11
          OnClick = tlbtnExclClick
        end
        object tlbtnDelete: TToolButton
          Left = 397
          Top = 0
          Hint = '^D : Delete'
          AutoSize = True
          Caption = '^D : Delete statement'
          ImageIndex = 73
          OnClick = tlbtnDeleteClick
        end
        object tlbtnPost: TToolButton
          Left = 511
          Top = 0
          Hint = 'F6 : Contra'
          AutoSize = True
          Caption = 'F6 : Post'
          ImageIndex = 2
          OnClick = tlbtnPostClick
        end
        object tlbtnList: TToolButton
          Left = 566
          Top = 0
          Hint = 'F8 : Link'
          AutoSize = True
          Caption = 'F8 : List'
          ImageIndex = 3
          OnClick = tlbtnListClick
        end
        object tlbtnProcess: TToolButton
          Left = 621
          Top = 0
          Hint = 'F9 : Process'
          AutoSize = True
          Caption = 'F9 : Process'
          ImageIndex = 6
          OnClick = tlbtnProcessClick
        end
        object tlbtnSetup: TToolButton
          Left = 691
          Top = 0
          Hint = 'F10 : Setup'
          AutoSize = True
          Caption = 'F10 : Setup'
          ImageIndex = 7
          OnClick = tlbtnSetupClick
        end
        object TBBankImport: TToolButton
          Left = 757
          Top = 0
          Caption = 'Import bankstatement'
          ImageIndex = 69
          OnClick = TBBankImportClick
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
    Left = 216
    Top = 254
  end
  object ExportDialog: TSaveDialog
    DefaultExt = '*.csv'
    FileName = 'Export'
    Filter = 'Comma Delimited Batches|*.Csv|All Files|*.*'
    Left = 328
    Top = 290
  end
  object UpdateSQL1: TUniUpdateSQL
    Left = 540
    Top = 308
  end
  object QGen: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 664
    Top = 312
  end
  object PopupMenu2: TPopupMenu
    Left = 384
    Top = 312
    object Usefilter1: TMenuItem
      Caption = 'Use filter'
      OnClick = Usefilter1Click
    end
  end
  object QFindAccountOFDebtor: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from debtor where SBankAccountNumber = :Acc')
    Left = 656
    Top = 500
    ParamData = <
      item
        DataType = ftString
        Name = 'Acc'
      end>
    object QFindAccountOFDebtorWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
  end
  object QFindAccountOFCREDITor: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select WAccountID from creditor where SBankAccountNumber = :Acc')
    Left = 340
    Top = 380
    ParamData = <
      item
        DataType = ftString
        Name = 'Acc'
      end>
    object QFindAccountOFCREDITorWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 228
    Top = 316
    object Deleteline1: TMenuItem
      Caption = 'Delete line'
      OnClick = Deleteline1Click
    end
    object Updatebankaccount1: TMenuItem
      Caption = 'Update bank account'
      OnClick = Updatebankaccount1Click
    end
    object Lookupinvoice1: TMenuItem
      Caption = 'Lookup document'
      OnClick = fmInvoiceEntryGridLookupinvoice1Click
    end
    object Lookupdocwithamount1: TMenuItem
      Caption = 'Lookup doc with amount'
      OnClick = Lookupdocwithamount1Click
    end
    object Lookupdebtor1: TMenuItem
      Caption = 'Lookup debtor'
      OnClick = Lookupcreditor1Click
    end
    object Lookupcreditor1: TMenuItem
      Caption = 'Lookup creditor'
      OnClick = Lookupcreditor1Click
    end
    object Autolinkbankaccounts1: TMenuItem
      Caption = 'Auto link bank accounts'
      OnClick = Autolinkbankaccounts1Click
    end
    object Createnewinvoice1: TMenuItem
      Caption = 'Create new invoice from line'
      OnClick = Createnewinvoice1Click
    end
    object Gotodocument1: TMenuItem
      Caption = 'Goto document'
      OnClick = Gotodocument1Click
    end
    object Autolinkofall1: TMenuItem
      Caption = 'Auto link of all'
      OnClick = Autolinkofall1Click
    end
    object Showrefsforaccount1: TMenuItem
      Caption = 'Show refs for account'
      OnClick = Showrefsforaccount1Click
    end
    object LookupTransactions: TMenuItem
      Caption = 'Lookup transactions'
      OnClick = LookupTransactionsClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Plugins: TMenuItem
      Caption = 'Plugins'
    end
    object Paymentdiverence1: TMenuItem
      Caption = 'Payment diverence'
      OnClick = Paymentdiverence1Click
    end
    object Openitem1: TMenuItem
      Caption = 'Openitem'
      OnClick = Openitem1Click
    end
  end
  object ZQbankline: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 588
    Top = 24
  end
  object ZQBankRefs: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select SREFERENCE,WAccountid from accountref where SREFERENCE li' +
        'ke  '#39'#%'#39' ')
    Left = 628
    Top = 412
  end
  object zqBankActions: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select SREFERENCE,WAccountid from accountref where SREFERENCE li' +
        'ke  '#39'!%'#39' ')
    Left = 796
    Top = 316
  end
  object CdsBankDnl: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select first 1 * From DnlBanks')
    Left = 476
    Top = 417
    object CdsBankDnlSTRANSID: TStringField
      FieldName = 'STRANSID'
      Required = True
      FixedChar = True
      Size = 32
    end
    object CdsBankDnlWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object CdsBankDnlWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object CdsBankDnlWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object CdsBankDnlWTRANSTYPEID: TIntegerField
      FieldName = 'WTRANSTYPEID'
    end
    object CdsBankDnlSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      FixedChar = True
      Size = 40
    end
    object CdsBankDnlDTRANSDATE: TDateTimeField
      FieldName = 'DTRANSDATE'
    end
    object CdsBankDnlDPOSTEDDATE: TDateTimeField
      FieldName = 'DPOSTEDDATE'
    end
    object CdsBankDnlFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object CdsBankDnlSMEMO: TStringField
      FieldName = 'SMEMO'
      FixedChar = True
      Size = 40
    end
    object CdsBankDnlSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      FixedChar = True
      Size = 15
    end
    object CdsBankDnlBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object CdsBankDnlSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      FixedChar = True
      Size = 40
    end
    object CdsBankDnlWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object CdsBankDnlWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object CdsBankDnlWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object CdsBankDnlWTCTRANSID: TIntegerField
      FieldName = 'WTCTRANSID'
    end
    object CdsBankDnlWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object CdsBankDnlWAUTOMATCHID: TIntegerField
      FieldName = 'WAUTOMATCHID'
    end
    object CdsBankDnlBUSEFORBATCH: TIntegerField
      FieldName = 'BUSEFORBATCH'
    end
    object CdsBankDnlDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object CdsBankDnlWAMTSGN: TIntegerField
      FieldName = 'WAMTSGN'
    end
    object CdsBankDnlSEXTRADESCRIPTION: TStringField
      FieldName = 'SEXTRADESCRIPTION'
      FixedChar = True
      Size = 255
    end
  end
  object dsBatch: TDataSource
    DataSet = tblBatch
    Left = 48
    Top = 436
  end
  object tblBatch: TUniTable
    TableName = 'BAT0T2'
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    IndexFieldNames = 'WLineId Asc'
    BeforeOpen = tblBatchBeforeOpen
    AfterInsert = tblBatchAfterInsert
    BeforePost = tblBatchBeforePost
    AfterPost = tblBatchAfterPost
    BeforeDelete = tblBatchBeforeDelete
    AfterDelete = tblBatchAfterDelete
    AfterScroll = tblBatchAfterScroll
    OnCalcFields = tblBatchCalcFields
    Left = 80
    Top = 308
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
end
