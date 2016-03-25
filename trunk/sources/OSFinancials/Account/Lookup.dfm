object FmLookup: TFmLookup
  Left = 530
  Top = 221
  BorderIcons = [biSystemMenu]
  Caption = 'FmLookup'
  ClientHeight = 436
  ClientWidth = 627
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = DBGrdLookupKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 356
    Width = 627
    Height = 61
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      627
      61)
    object Label1: TLabel
      Left = 22
      Top = 11
      Width = 51
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Search by:'
      Transparent = True
    end
    object LLook: TLabel
      Left = 88
      Top = 11
      Width = 3
      Height = 13
      Transparent = True
    end
    object cbCode: TcxCheckBox
      Tag = 10
      Left = 26
      Top = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Code'
      State = cbsGrayed
      TabOrder = 0
      Transparent = True
      OnClick = cbCodeClick
      Width = 97
    end
    object cbDescription: TcxCheckBox
      Tag = 11
      Left = 134
      Top = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 1
      Transparent = True
      OnClick = cbCodeClick
      Width = 97
    end
    object cbBarCode: TcxCheckBox
      Tag = 12
      Left = 248
      Top = 30
      Anchors = [akLeft, akBottom]
      Caption = 'Bar Code'
      TabOrder = 2
      Transparent = True
      OnClick = cbCodeClick
      Width = 97
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 417
    Width = 627
    Height = 19
    Panels = <>
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 627
    Height = 356
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
      OnDblClick = DBGrdLookupDblClick
      OnKeyDown = FormKeyDown
      OnKeyPress = DBGrdLookupKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 72
    object Usefilter1: TMenuItem
      Caption = 'Use filter'
      OnClick = Usefilter1Click
    end
  end
  object ZQAccounts: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from v_account accounts')
    Left = 128
    Top = 56
  end
  object dsAccount: TDataSource
    DataSet = ZQAccounts
    Left = 64
    Top = 72
  end
end
