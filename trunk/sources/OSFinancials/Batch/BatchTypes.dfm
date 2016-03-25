object fmBatchTypes: TfmBatchTypes
  Left = 536
  Top = 234
  Caption = 'Batch Types'
  ClientHeight = 492
  ClientWidth = 878
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 878
    Height = 458
    Align = alClient
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 181
      Top = 1
      Width = 696
      Height = 456
      Align = alClient
      TabOrder = 2
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = sbEditClick
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = cxGrid1DBTableView1CellDblClick
        DataController.DataSource = DSBAtchTypes
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'SDESCRIPTION'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object pTranslate: TPanel
      Left = 181
      Top = 1
      Width = 696
      Height = 456
      Align = alClient
      TabOrder = 0
      Visible = False
      OnExit = pTranslateExit
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 1
        Top = 149
        Width = 694
        Height = 306
        Align = alClient
        DataSource = DataSource1
        PanelHeight = 102
        PanelWidth = 677
        TabOrder = 2
        object DBText1: TDBText
          Left = 12
          Top = 24
          Width = 65
          Height = 17
          DataField = 'WLANGUAGEID'
          DataSource = DataSource1
        end
        object DBEdit2: TDBEdit
          Left = 12
          Top = 44
          Width = 652
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SDESCRIPTION'
          DataSource = DataSource1
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 694
        Height = 148
        Align = alTop
        TabOrder = 1
        DesignSize = (
          694
          148)
        object Label1: TLabel
          Left = 12
          Top = 88
          Width = 53
          Height = 13
          Caption = 'Description'
          FocusControl = DBEdit1
        end
        object DBEdit1: TDBEdit
          Left = 12
          Top = 104
          Width = 680
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          DataField = 'SDESCRIPTION'
          DataSource = DSBAtchTypes
          ReadOnly = True
          TabOrder = 0
        end
        object DBNavigator1: TDBNavigator
          Left = 12
          Top = 50
          Width = 472
          Height = 37
          DataSource = DataSource1
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
          TabOrder = 1
        end
      end
      object BClose: TBitBtn
        Left = 16
        Top = 12
        Width = 93
        Height = 25
        Caption = 'Close'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BCloseClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 180
      Height = 456
      Align = alLeft
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 14
        Top = 120
        Width = 156
        Height = 25
        Caption = 'translations'
        OnClick = SpeedButton1Click
      end
      object sbEdit: TSpeedButton
        Left = 14
        Top = 84
        Width = 156
        Height = 25
        Caption = 'Edit'
        OnClick = sbEditClick
      end
      object sbDelete: TSpeedButton
        Left = 14
        Top = 48
        Width = 156
        Height = 25
        Caption = 'Delete'
        OnClick = sbDeleteClick
      end
      object sbAdd: TSpeedButton
        Left = 14
        Top = 16
        Width = 156
        Height = 25
        Caption = 'Add'
        OnClick = sbAddClick
      end
      object Memo1: TMemo
        Left = 12
        Top = 216
        Width = 153
        Height = 225
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clBtnFace
        TabOrder = 0
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 458
    Width = 878
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      878
      34)
    object BtnClose: TBitBtn
      Left = 777
      Top = 6
      Width = 99
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF84CA8454B757ADDBADFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81CA8152D47A72F4A53E
        B850FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8CD08C4BCD6D74F09777F08D63E69269BE6AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87CF864ACC6B6FEB9476EE8A77F08C72
        F19244C561FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CCC7B
        4BCE6F69E48B70E78573F19C74F39C72EF8865EA944DB651FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF95D7954ACE6E61DA7F68DE7D68E89742BD5044C55E70
        F19468E9824DD27497D297FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53C3575CD887
        5FD47362E39144BD4FFFFFFF79C97960E48E68E87D5FE6863DB84DFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7CD07C4ED27555D88047BE50FFFFFFFFFFFFFFFFFF40
        BE5067EC8F5BDF6F53DC815CBB5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDA9B
        91D690FFFFFFFFFFFFFFFFFFFFFFFF92D49252D87B5BE07351D96A44CA689CD5
        9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF4EBC535BE3894ED55F4DD9733BB84DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FC25653DC7644CE554DD8
        7A4BB750FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8FD38F49D16F47D15F44CE5749D27471C471FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DC15F4DD87A43CD
        5547D26241C661A6D9A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF46BC4D4DD97A42CC524EDA7952BA56FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3FBD
        4C4FDB7E49D37472C673FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC56A85CE85F1F7F1}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnCloseClick
      OnKeyDown = FormKeyDown
    end
  end
  object ZQTranslate: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select * from BATTYPES_TRANSLATE where WBATCHTYPEID =:WBATCHTYPE' +
        'ID')
    UpdateObject = ZUpdateSQL1
    Left = 428
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WBATCHTYPEID'
      end>
    object ZQTranslateWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQTranslateWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
      OnGetText = ZQTranslateWLANGUAGEIDGetText
    end
    object ZQTranslateSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 255
    end
  end
  object tblBatchTypes: TUniTable
    TableName = 'BatTypes'
    DataTypeMap = <>
    AfterInsert = tblBatchTypesAfterInsert
    AfterScroll = tblBatchTypesAfterScroll
    Left = 241
    Top = 228
    object tblBatchTypesWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object tblBatchTypesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object tblBatchTypesBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object tblBatchTypesWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object tblBatchTypesBCONTRAPERLINE: TSmallintField
      FieldName = 'BCONTRAPERLINE'
    end
    object tblBatchTypesBINCREMENTREFNO: TSmallintField
      FieldName = 'BINCREMENTREFNO'
    end
    object tblBatchTypesBREPEATDETAILS: TSmallintField
      FieldName = 'BREPEATDETAILS'
    end
    object tblBatchTypesBCONSOLIDATEBALANCING: TSmallintField
      FieldName = 'BCONSOLIDATEBALANCING'
    end
    object tblBatchTypesWDEBITCREDIT: TIntegerField
      FieldName = 'WDEBITCREDIT'
    end
    object tblBatchTypesWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object tblBatchTypesWDEFAULTTAXID: TIntegerField
      FieldName = 'WDEFAULTTAXID'
    end
    object tblBatchTypesBVIEWEXCLUSIVE: TSmallintField
      FieldName = 'BVIEWEXCLUSIVE'
    end
    object tblBatchTypesBLINKOI: TSmallintField
      FieldName = 'BLINKOI'
    end
    object tblBatchTypesBINCLUSIVEMODE: TSmallintField
      FieldName = 'BINCLUSIVEMODE'
    end
    object tblBatchTypesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object DSBAtchTypes: TDataSource
    DataSet = tblBatchTypes
    Left = 324
    Top = 192
  end
  object ZUpdateSQL1: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO BATTYPES_TRANSLATE'
      '  (WBATCHTYPEID, WLANGUAGEID, SDESCRIPTION)'
      'VALUES'
      '  (:WBATCHTYPEID, :WLANGUAGEID, :SDESCRIPTION)')
    DeleteSQL.Strings = (
      'DELETE FROM BATTYPES_TRANSLATE'
      'WHERE'
      '  BATTYPES_TRANSLATE.WBATCHTYPEID = :OLD_WBATCHTYPEID AND'
      '  BATTYPES_TRANSLATE.WLANGUAGEID = :OLD_WLANGUAGEID')
    ModifySQL.Strings = (
      'UPDATE BATTYPES_TRANSLATE SET'
      '  WBATCHTYPEID = :WBATCHTYPEID,'
      '  WLANGUAGEID = :WLANGUAGEID,'
      '  SDESCRIPTION = :SDESCRIPTION'
      'WHERE'
      '  BATTYPES_TRANSLATE.WBATCHTYPEID = :OLD_WBATCHTYPEID '
      'AND'
      '  BATTYPES_TRANSLATE.WLANGUAGEID = :OLD_WLANGUAGEID')
    Left = 376
    Top = 236
  end
  object DataSource1: TDataSource
    DataSet = ZQTranslate
    Left = 340
    Top = 252
  end
end
