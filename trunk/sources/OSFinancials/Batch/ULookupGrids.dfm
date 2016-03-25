object fmLookupgrids: TfmLookupgrids
  Left = 340
  Top = 172
  Caption = 'fmLookupgrids'
  ClientHeight = 475
  ClientWidth = 897
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ContraAccount: TcxGrid
    Left = 332
    Top = 8
    Width = 273
    Height = 200
    TabOrder = 0
    object ContraAccountDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsContrAccount
      DataController.KeyFieldNames = 'WACCOUNTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          FieldName = 'SACCOUNTCODE'
          Column = ContraAccountDBTableView1SACCOUNTCODE
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnFilterRecord = ContraAccountDBTableView1DataControllerFilterRecord
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ContraAccountDBTableView1WACCOUNTID: TcxGridDBColumn
        DataBinding.FieldName = 'WACCOUNTID'
        Visible = False
        VisibleForCustomization = False
      end
      object ContraAccountDBTableView1SACCOUNTCODE: TcxGridDBColumn
        DataBinding.FieldName = 'SACCOUNTCODE'
        Width = 72
      end
      object ContraAccountDBTableView1SDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SDESCRIPTION'
        Width = 176
      end
    end
    object ContraAccountLevel1: TcxGridLevel
      GridView = ContraAccountDBTableView1
    end
  end
  object Jobcode: TcxGrid
    Left = 24
    Top = 256
    Width = 273
    Height = 200
    TabOrder = 1
    object JobcodeDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsJobcost
      DataController.KeyFieldNames = 'WJOBPROJECTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DataController.OnFilterRecord = JobcodeDBTableView1DataControllerFilterRecord
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object JobcodeDBTableView1WJOBPROJECTID: TcxGridDBColumn
        DataBinding.FieldName = 'WJOBPROJECTID'
        Visible = False
        VisibleForCustomization = False
      end
      object JobcodeDBTableView1SJOBPROJECTCODE: TcxGridDBColumn
        DataBinding.FieldName = 'SJOBPROJECTCODE'
        Width = 93
      end
      object JobcodeDBTableView1SDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SDESCRIPTION'
      end
    end
    object JobcodeLevel1: TcxGridLevel
      GridView = JobcodeDBTableView1
    end
  end
  object Account: TcxGrid
    Left = 28
    Top = 8
    Width = 273
    Height = 200
    TabOrder = 2
    object AccountDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsaccount
      DataController.KeyFieldNames = 'WACCOUNTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          FieldName = 'SACCOUNTCODE'
          Column = AccountDBTableView1SACCOUNTCODE
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnFilterRecord = AccountDBTableView1DataControllerFilterRecord
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object AccountDBTableView1WACCOUNTID: TcxGridDBColumn
        DataBinding.FieldName = 'WACCOUNTID'
        Visible = False
        VisibleForCustomization = False
      end
      object AccountDBTableView1SACCOUNTCODE: TcxGridDBColumn
        DataBinding.FieldName = 'SACCOUNTCODE'
        Width = 81
      end
      object AccountDBTableView1SDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SDESCRIPTION'
        Width = 167
      end
      object AccountDBTableView1CALC_INLIST: TcxGridDBColumn
        DataBinding.FieldName = 'CALC_INLIST'
        Visible = False
        VisibleForCustomization = False
      end
      object AccountDBTableView1OPENITEM: TcxGridDBColumn
        Caption = 'Open'
        DataBinding.FieldName = 'OPENITEM'
        Visible = False
      end
    end
    object AccountLevel1: TcxGridLevel
      GridView = AccountDBTableView1
    end
  end
  object Tax: TcxGrid
    Left = 332
    Top = 244
    Width = 273
    Height = 200
    TabOrder = 3
    object TaxDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTax
      DataController.KeyFieldNames = 'WACCOUNTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          FieldName = 'SACCOUNTCODE'
          Column = TaxDBTableView1SACCOUNTCODE
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnFilterRecord = TaxDBTableView1DataControllerFilterRecord
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object TaxDBTableView1WACCOUNTID: TcxGridDBColumn
        DataBinding.FieldName = 'WACCOUNTID'
        Visible = False
        VisibleForCustomization = False
      end
      object TaxDBTableView1SACCOUNTCODE: TcxGridDBColumn
        DataBinding.FieldName = 'SACCOUNTCODE'
        Width = 71
      end
      object TaxDBTableView1SDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SDESCRIPTION'
        Width = 177
      end
    end
    object TaxLevel1: TcxGridLevel
      GridView = TaxDBTableView1
    end
  end
  object group1: TcxGrid
    Left = 608
    Top = 12
    Width = 273
    Height = 200
    TabOrder = 4
    object group1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGroup1
      DataController.KeyFieldNames = 'WGROUPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          FieldName = 'SFULLDESC'
          Column = group1DBTableView1SFULLDESC
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnFilterRecord = group1DBTableView1DataControllerFilterRecord
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object group1DBTableView1WGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'WGROUPID'
        Visible = False
        VisibleForCustomization = False
      end
      object group1DBTableView1SFULLDESC: TcxGridDBColumn
        DataBinding.FieldName = 'SFULLDESC'
      end
    end
    object group1Level1: TcxGridLevel
      GridView = group1DBTableView1
    end
  end
  object group2: TcxGrid
    Left = 612
    Top = 252
    Width = 273
    Height = 200
    TabOrder = 5
    object group2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGroup2
      DataController.KeyFieldNames = 'WGROUPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          FieldName = 'SFULLDESC'
          Column = group2DBTableView1SFULLDESC
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnFilterRecord = group2DBTableView1DataControllerFilterRecord
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object group2DBTableView1WGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'WGROUPID'
        Visible = False
        VisibleForCustomization = False
      end
      object group2DBTableView1SFULLDESC: TcxGridDBColumn
        DataBinding.FieldName = 'SFULLDESC'
      end
    end
    object group2Level1: TcxGridLevel
      GridView = group2DBTableView1
    end
  end
  object TblAccount: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select * from v_account ACCOUNT where binactive = 0 and (bsubacc' +
        'ounts = 0 or bsubaccounts is null)')
    ReadOnly = True
    AfterOpen = TblAccountAfterOpen
    Left = 208
    Top = 54
  end
  object ZQCostgroup1: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select WGroupid from v_groups groups where WGroupId = 0'
      'union'
      'Select WGroupid from v_groups groups where WGroupTypeID= 1002'
      'and (BDisable is null or BDisable = 0)')
    ReadOnly = True
    OnCalcFields = ZQCostgroup1CalcFields
    Left = 100
    Top = 198
    object ZQCostgroup1WGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQCostgroup1SFULLDESC: TStringField
      DisplayLabel = 'SFULDESC'
      FieldKind = fkCalculated
      FieldName = 'SFULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object ZQCostGroup2: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select WGroupid from v_groups groups where WGroupId = 0'
      'union'
      'Select WGroupid from v_groups groups where WGroupTypeID= 1003'
      'and (BDisable is null or BDisable = 0)')
    ReadOnly = True
    OnCalcFields = ZQCostGroup2CalcFields
    Left = 36
    Top = 197
    object ZQCostGroup2WGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQCostGroup2SFULLDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SFULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object ZQProjects: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'SELECT WJOBPROJECTID, SJOBPROJECTCODE , SDESCRIPTION '
      'FROM JOBPROJECT where BENABLED =1'
      'union'
      'SELECT 0, '#39#39','#39#39
      'FROM RDB$DATABASE')
    Left = 228
    Top = 214
    object ZQProjectsWJOBPROJECTID: TIntegerField
      FieldName = 'WJOBPROJECTID'
      Required = True
    end
    object ZQProjectsSJOBPROJECTCODE: TStringField
      FieldName = 'SJOBPROJECTCODE'
      FixedChar = True
      Size = 10
    end
    object ZQProjectsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      FixedChar = True
      Size = 35
    end
  end
  object zqContrAccount: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select * from v_account ACCOUNT where binactive = 0 and (bsubacc' +
        'ounts = 0 or bsubaccounts is null)')
    ReadOnly = True
    AfterOpen = TblAccountAfterOpen
    Left = 332
    Top = 218
  end
  object zqTax: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select * from v_account ACCOUNT where binactive = 0 and (bsubacc' +
        'ounts = 0 or bsubaccounts is null)')
    ReadOnly = True
    Left = 412
    Top = 182
  end
  object dsaccount: TDataSource
    DataSet = TblAccount
    Left = 432
    Top = 60
  end
  object dsContrAccount: TDataSource
    DataSet = zqContrAccount
    Left = 512
    Top = 68
  end
  object dsTax: TDataSource
    DataSet = zqTax
    Left = 600
    Top = 68
  end
  object dsGroup1: TDataSource
    DataSet = ZQCostgroup1
    Left = 480
    Top = 212
  end
  object dsGroup2: TDataSource
    DataSet = ZQCostGroup2
    Left = 564
    Top = 200
  end
  object dsJobcost: TDataSource
    DataSet = ZQProjects
    Left = 620
    Top = 208
  end
  object cxEditRepository1: TcxEditRepository
    Left = 816
    Top = 52
    object cbAccount: TcxEditRepositoryExtLookupComboBoxItem
      Properties.AutoSearchOnPopup = False
      Properties.AutoSelect = False
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.View = AccountDBTableView1
      Properties.KeyFieldNames = 'WACCOUNTID'
      Properties.ListFieldItem = AccountDBTableView1SACCOUNTCODE
      Properties.PostPopupValueOnTab = True
      Properties.OnCloseUp = cbAccountPropertiesCloseUp
      Properties.OnInitPopup = cbAccountPropertiesInitPopup
    end
    object cbContraccount: TcxEditRepositoryExtLookupComboBoxItem
      Properties.AutoSearchOnPopup = False
      Properties.AutoSelect = False
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.View = ContraAccountDBTableView1
      Properties.KeyFieldNames = 'WACCOUNTID'
      Properties.ListFieldItem = ContraAccountDBTableView1SACCOUNTCODE
      Properties.PostPopupValueOnTab = True
      Properties.OnCloseUp = cbAccountPropertiesCloseUp
      Properties.OnInitPopup = cbAccountPropertiesInitPopup
    end
    object cbGroup1: TcxEditRepositoryExtLookupComboBoxItem
      Properties.AutoSearchOnPopup = False
      Properties.AutoSelect = False
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.View = group1DBTableView1
      Properties.KeyFieldNames = 'WGROUPID'
      Properties.ListFieldItem = group1DBTableView1SFULLDESC
      Properties.PostPopupValueOnTab = True
      Properties.OnCloseUp = cbAccountPropertiesCloseUp
      Properties.OnInitPopup = cbAccountPropertiesInitPopup
    end
    object cbGroup2: TcxEditRepositoryExtLookupComboBoxItem
      Properties.AutoSearchOnPopup = False
      Properties.AutoSelect = False
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.View = group2DBTableView1
      Properties.KeyFieldNames = 'WGROUPID'
      Properties.ListFieldItem = group2DBTableView1SFULLDESC
      Properties.PostPopupValueOnTab = True
      Properties.OnCloseUp = cbAccountPropertiesCloseUp
      Properties.OnInitPopup = cbAccountPropertiesInitPopup
    end
    object cbJobcode: TcxEditRepositoryExtLookupComboBoxItem
      Properties.AutoSearchOnPopup = False
      Properties.AutoSelect = False
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.View = JobcodeDBTableView1
      Properties.KeyFieldNames = 'WJOBPROJECTID'
      Properties.ListFieldItem = JobcodeDBTableView1SJOBPROJECTCODE
      Properties.PostPopupValueOnTab = True
      Properties.OnCloseUp = cbAccountPropertiesCloseUp
      Properties.OnInitPopup = cbAccountPropertiesInitPopup
    end
    object cbTax: TcxEditRepositoryExtLookupComboBoxItem
      Properties.AutoSearchOnPopup = False
      Properties.AutoSelect = False
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownSizeable = True
      Properties.HideSelection = False
      Properties.ImmediatePost = True
      Properties.View = TaxDBTableView1
      Properties.KeyFieldNames = 'WACCOUNTID'
      Properties.ListFieldItem = TaxDBTableView1SACCOUNTCODE
      Properties.PostPopupValueOnTab = True
      Properties.OnCloseUp = cbAccountPropertiesCloseUp
      Properties.OnInitPopup = cbAccountPropertiesInitPopup
    end
  end
  object TblInList: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select * from v_account ACCOUNT where binactive = 0 and (bsubacc' +
        'ounts = 0 or bsubaccounts is null)')
    ReadOnly = True
    Left = 128
    Top = 46
    object IntegerField1: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'SACCOUNTCODE'
      OnGetText = TblAccountSACCOUNTCODEGetText
      Size = 7
    end
    object StringField2: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object StringField3: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object IntegerField2: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object SmallintField3: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object SmallintField4: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object IntegerField5: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object IntegerField6: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
    object IntegerField7: TIntegerField
      FieldName = 'WTAXACCOUNT'
    end
  end
end
