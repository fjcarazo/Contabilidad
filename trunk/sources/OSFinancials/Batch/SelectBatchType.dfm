object fmSelectBatchType: TfmSelectBatchType
  Left = 288
  Top = 263
  BorderIcons = [biSystemMenu]
  Caption = 'Batch Types'
  ClientHeight = 306
  ClientWidth = 453
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
  object ButtonPanel: TPanel
    Left = 0
    Top = 272
    Width = 453
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 274
    ExplicitWidth = 461
    DesignSize = (
      453
      34)
    object LAlias: TLabel
      Left = 10
      Top = 11
      Width = 3
      Height = 13
      Transparent = True
    end
    object BtnCancel: TBitBtn
      Left = 353
      Top = 6
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancel'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFF8383CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8181
        C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171C64D4DD03F3FB7FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF3E3EAF4242C56B6BBBFFFFFFFFFFFFFFFFFF7272C7
        4E4ED16969E26969E94040B8FFFFFFFFFFFFFFFFFFFFFFFF3D3DB04E4ED84747
        D24444C96B6BBBFFFFFF8888D14949CD6060D96868DD7070E76C6CED4040B8FF
        FFFFFFFFFF3F3FB35252DC4444CE4242CC4747D24242C68181C4FFFFFF4343BD
        5E5EDE6868DE7070E77575EE6D6DEF4040B84141B65A5AE24D4DD54343CD4242
        CD4D4DD83D3DAFFFFFFFFFFFFFFFFFFF4444BE6464E47070E77676EE7777F16C
        6CEF6363E95A5ADE4C4CD44444CE4D4DD83D3DB0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF4444BE6868E97575EE7777F07272EE6767E75A5ADE4D4DD54E4ED93E3E
        B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444BF6D6DEE7777F072
        72EE6767E75A5ADE5454DE3F3FB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4444C06D6DEE7777F07272EE6767E75A5ADE5454DE3C3CB6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4444C16868EA7575EE7777F072
        72EE6767E75A5ADE4D4DD54E4EDA3C3CB6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        4444C26464E57070E77676EE7777F16B6BEE6363E95A5ADE4C4CD44444CE4D4D
        D93C3CB6FFFFFFFFFFFFFFFFFF4444C45E5EDF6868DE7070E77575EE6C6CEF44
        44C04444BF5A5AE34D4DD54343CD4242CC4D4DD93C3CB6FFFFFF8888D74B4BD2
        6060D96868DD7070E76B6BED4545C2FFFFFFFFFFFF4343BE5353DE4444CE4242
        CC4848D34343CA8888CDFFFFFF7474D15151D76969E26868E94646C4FFFFFFFF
        FFFFFFFFFFFFFFFF4242BD4E4EDA4848D34545CE7777C8FFFFFFFFFFFFFFFFFF
        7474D14F4FD74646C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4242BD4343
        CC7878CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8787D6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DD3FFFFFFFFFFFFFFFFFF}
      ModalResult = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnCancelClick
      OnKeyPress = FormKeyPress
    end
    object BtnOpen: TBitBtn
      Left = 250
      Top = 6
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Open'
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
      TabOrder = 1
      OnClick = BtnOpenClick
      OnKeyPress = FormKeyPress
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 453
    Height = 272
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 461
    ExplicitHeight = 274
    object cxGrid1DBTableView1: TcxGridDBTableView
      PopupMenu = BatchPopup
      OnDblClick = BtnOpenClick
      OnKeyDown = FormKeyDown
      OnKeyPress = FormKeyPress
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
      OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
      object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SDESCRIPTION'
        Width = 135
      end
      object cxGrid1DBTableView1SCONTRANAME: TcxGridDBColumn
        DataBinding.FieldName = 'SCONTRANAME'
        Width = 167
      end
      object cxGrid1DBTableView1WCONTRAACCOUNTID: TcxGridDBColumn
        DataBinding.FieldName = 'WCONTRAACCOUNTID'
        Width = 157
      end
      object cxGrid1DBTableView1WBATCHTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'WBATCHTYPEID'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1BCASHBOOK: TcxGridDBColumn
        DataBinding.FieldName = 'BCASHBOOK'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1BCONTRAPERLINE: TcxGridDBColumn
        DataBinding.FieldName = 'BCONTRAPERLINE'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn
        DataBinding.FieldName = 'DSYSDATE'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn
        DataBinding.FieldName = 'WACCOUNTID'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = qryBatchTypesList
    Left = 22
    Top = 26
  end
  object BatchPopup: TPopupMenu
    Left = 192
    Top = 96
    object Print1: TMenuItem
      Caption = 'Print'
      OnClick = GeneralPopupmenuClick
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      OnClick = BtnOpenClick
    end
    object Balance1: TMenuItem
      Caption = 'Balance'
      OnClick = GeneralPopupmenuClick
    end
    object Post1: TMenuItem
      Caption = 'Post'
      OnClick = GeneralPopupmenuClick
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = GeneralPopupmenuClick
    end
    object Alias1: TMenuItem
      Caption = 'Alias'
      OnClick = GeneralPopupmenuClick
    end
    object Import1: TMenuItem
      Caption = 'Import'
      OnClick = GeneralPopupmenuClick
    end
    object Export1: TMenuItem
      Caption = 'Export'
      OnClick = GeneralPopupmenuClick
    end
    object Switch1: TMenuItem
      Caption = 'Switch'
      OnClick = GeneralPopupmenuClick
    end
    object PostedBatchesimport1: TMenuItem
      Caption = 'Posted Batches import'
      OnClick = GeneralPopupmenuClick
    end
    object Deletebalance1: TMenuItem
      Caption = 'Delete balance'
      OnClick = GeneralPopupmenuClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Trailbalance1: TMenuItem
      Caption = 'Trailbalance'
      OnClick = Trailbalance1Click
    end
    object Orderondate1: TMenuItem
      Caption = 'Order on date'
      OnClick = GeneralPopupmenuClick
    end
  end
  object qryBatchTypesList: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select WBatchTypeID,BCashBook,BatTypes.SDescription,'
      'WContraAccountID, BContraPerLine,'
      
        'BatTypes.DSysDate,(Account.SACCOUNTCODE||'#39'  '#39'||Account.SDescript' +
        'ion)   SContraName,'
      'WAccountID'
      'From v_BatTypes BatTypes , v_Account Account  where'
      ''
      'BatTypes.WContraAccountID=Account.WAccountID')
    Left = 370
    Top = 165
    object qryBatchTypesListWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object qryBatchTypesListBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object qryBatchTypesListSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object qryBatchTypesListWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object qryBatchTypesListBCONTRAPERLINE: TSmallintField
      FieldName = 'BCONTRAPERLINE'
    end
    object qryBatchTypesListDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object qryBatchTypesListSCONTRANAME: TStringField
      FieldName = 'SCONTRANAME'
      Size = 42
    end
    object qryBatchTypesListWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
end
