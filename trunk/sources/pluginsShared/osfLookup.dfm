object osfLookup: TosfLookup
  Left = 675
  Top = 138
  BorderIcons = [biSystemMenu]
  Caption = 'osfLookup'
  ClientHeight = 651
  ClientWidth = 693
  Color = clBtnFace
  Constraints.MinHeight = 50
  Constraints.MinWidth = 100
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = DBGrdLookupKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 115
    Align = alTop
    TabOrder = 0
    DesignSize = (
      693
      115)
    object Label2: TLabel
      Left = 12
      Top = 76
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object CBField: TComboBox
      Left = 12
      Top = 8
      Width = 159
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      TabStop = False
      Items.Strings = (
        'Code'
        'Description'
        'Code, Description ')
    end
    object CBLogic: TComboBox
      Left = 12
      Top = 32
      Width = 159
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      TabStop = False
      Text = 'Empty'
      OnChange = CBLogicChange
      Items.Strings = (
        'Empty'
        'And'
        'Or')
    end
    object cbField2: TComboBox
      Left = 12
      Top = 56
      Width = 159
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      TabStop = False
      Visible = False
      Items.Strings = (
        'Code'
        'Description')
    end
    object ECode2: TEdit
      Left = 176
      Top = 56
      Width = 405
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 3
      Visible = False
      OnKeyPress = ECodeKeyPress
    end
    object ECode: TEdit
      Left = 176
      Top = 8
      Width = 405
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      TabOrder = 4
      OnKeyPress = ECodeKeyPress
    end
    object Bsearch: TButton
      Left = 595
      Top = 7
      Width = 97
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Search'
      TabOrder = 5
      OnClick = BsearchClick
    end
    object Button1: TButton
      Left = 595
      Top = 35
      Width = 97
      Height = 22
      Anchors = [akTop, akRight]
      Caption = 'Clear'
      TabOrder = 6
      TabStop = False
      OnClick = Button1Click
    end
    object cbAutogroup: TComboBox
      Left = 12
      Top = 89
      Width = 493
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      OnKeyDown = FormKeyDown
      OnKeyPress = ECodeKeyPress
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 632
    Width = 693
    Height = 19
    Panels = <
      item
        Width = 110
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 110
      end
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 80
      end
      item
        Width = 50
      end>
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 115
    Width = 693
    Height = 448
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
      OnDblClick = DBGrdLookupDblClick
      OnKeyDown = FormKeyDown
      OnKeyPress = DBGrdLookupKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DSGeneral
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 563
    Width = 693
    Height = 69
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      693
      69)
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 51
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Search by:'
      Transparent = True
    end
    object LSearch: TLabel
      Left = 152
      Top = 9
      Width = 3
      Height = 13
      Transparent = True
    end
    object cbCode: TCheckBox
      Tag = 10
      Left = 10
      Top = 27
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Code'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = cbCodeClick
    end
    object cbDescription: TCheckBox
      Tag = 11
      Left = 118
      Top = 27
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 1
      OnClick = cbCodeClick
    end
    object cbBarCode: TCheckBox
      Tag = 12
      Left = 232
      Top = 27
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Bar Code'
      TabOrder = 2
      OnClick = cbCodeClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 316
    Top = 244
    object Usefilter1: TMenuItem
      Caption = 'Use filter'
      OnClick = Usefilter1Click
    end
  end
  object tblAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select SACCOUNTCODE,SDescription,WAccountTypeID,WAccountID from ' +
        'v_Account account'
      
        'where Binactive = 0 and (BSubaccounts = 0 or BSubaccounts is nul' +
        'l)')
    AfterOpen = TblStockAfterOpen
    Left = 116
    Top = 224
  end
  object TblStock: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from stock')
    AfterOpen = TblStockAfterOpen
    AfterScroll = TblStockAfterScroll
    Left = 156
    Top = 184
  end
  object tblContacts: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from contacts')
    Left = 392
    Top = 212
  end
  object TblPeriods: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from periods')
    Left = 240
    Top = 188
  end
  object DSGeneral: TDataSource
    Left = 92
    Top = 184
  end
  object tblSysVars: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select WDebtorsControlID,  WCreditorsControlID,WRetainedIncomeID' +
        ' from sysvars')
    Left = 336
    Top = 148
  end
  object ZQTblGroup: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select WGROUPID, SDESCRIPTION  from groups where WGroupTypeID = ' +
        ':WGroupTypeID')
    Left = 24
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WGroupTypeID'
      end>
  end
  object TShowDetail: TTimer
    Enabled = False
    OnTimer = TShowDetailTimer
    Left = 228
    Top = 132
  end
  object ZQBatType: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from battypes')
    Left = 204
    Top = 256
  end
end
