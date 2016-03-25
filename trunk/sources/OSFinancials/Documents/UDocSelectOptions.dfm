object DocSelectOptions: TDocSelectOptions
  Left = 453
  Top = 250
  Caption = 'Options'
  ClientHeight = 384
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 0
    Top = 0
    Width = 680
    Height = 17
    Align = alTop
    DataField = 'SDESCRIPTION'
    DataSource = DataSource2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 688
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 350
    Width = 680
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      680
      34)
    object BtnOk: TBitBtn
      Left = 489
      Top = 4
      Width = 95
      Height = 29
      Anchors = [akTop, akRight]
      Caption = '&OK'
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
      OnClick = BtnOkClick
    end
    object BtnCancel: TBitBtn
      Left = 586
      Top = 4
      Width = 95
      Height = 29
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
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnCancelClick
    end
    object Qtyonhand: TMemo
      Left = 0
      Top = 0
      Width = 468
      Height = 34
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clBtnFace
      TabOrder = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 17
    Width = 680
    Height = 333
    ActivePage = tsGridview
    Align = alClient
    TabOrder = 1
    object tsGridview: TTabSheet
      Caption = 'Gridview'
      object cxoptions: TcxGrid
        Left = 0
        Top = 0
        Width = 672
        Height = 305
        Align = alClient
        TabOrder = 0
        object cxoptionsDBTableView1: TcxGridDBTableView
          OnDblClick = DBGrid1DblClick
          OnKeyPress = DBGrid1KeyPress
          OnMouseUp = DBGrid1MouseUp
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = cxoptionsDBTableView1CustomDrawCell
          OnInitEdit = cxoptionsDBTableView1InitEdit
          DataController.DataSource = dsGridOptions
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.ImmediateEditor = False
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        end
        object cxoptionsLevel1: TcxGridLevel
          GridView = cxoptionsDBTableView1
        end
      end
    end
    object tsTreeview: TTabSheet
      Caption = 'Treeview'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 182
        Width = 672
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 184
        ExplicitWidth = 680
      end
      object TreeView1: TcxTreeView
        Left = 0
        Top = 0
        Width = 508
        Height = 182
        Align = alClient
        TabOrder = 1
        HideSelection = False
        RowSelect = True
        OnChange = TreeView1Change
      end
      object PDetail: TPanel
        Left = 508
        Top = 0
        Width = 164
        Height = 182
        Align = alRight
        TabOrder = 0
        object LQty: TLabel
          Left = 12
          Top = 8
          Width = 39
          Height = 13
          Caption = 'Quantity'
          FocusControl = DBEdit1
        end
        object LExtraPrice: TLabel
          Left = 12
          Top = 44
          Width = 50
          Height = 13
          Caption = 'Extra price'
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 12
          Top = 20
          Width = 134
          Height = 21
          DataField = 'FQTY'
          DataSource = dsOptions
          TabOrder = 0
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit2: TDBEdit
          Left = 12
          Top = 56
          Width = 134
          Height = 21
          DataField = 'FEXTRAPRICE'
          DataSource = dsOptions
          TabOrder = 1
          OnKeyPress = DBEdit1KeyPress
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 185
        Width = 672
        Height = 120
        Align = alBottom
        DataSource = dsOptions
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid2DblClick
        OnKeyPress = DBGrid2KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'WDOCLINEOPTIONSID'
            Title.Caption = 'Option'
            Width = 389
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FQTY'
            Title.Caption = 'Qty'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FEXTRAPRICE'
            Title.Caption = 'Price'
            Width = 125
            Visible = True
          end>
      end
    end
    object TSOptionView: TTabSheet
      Caption = 'OptionView'
      ImageIndex = 2
      DesignSize = (
        672
        305)
      object LPrice2: TLabel
        Left = 12
        Top = 4
        Width = 24
        Height = 13
        Caption = 'Price'
        FocusControl = DBEdit3
      end
      object Lqty2: TLabel
        Left = 525
        Top = 4
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Qty'
        FocusControl = dbQty2
      end
      object DBEdit3: TDBEdit
        Left = 52
        Top = 0
        Width = 134
        Height = 21
        DataField = 'FEXTRAPRICE'
        DataSource = dsOptions
        TabOrder = 0
      end
      object dbQty2: TDBEdit
        Left = 549
        Top = 0
        Width = 81
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'FQTY'
        DataSource = dsOptions
        TabOrder = 1
        OnDblClick = dbQty2DblClick
      end
    end
  end
  object ZQOptions: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from   DOCLINEOPTIONS where WDocid =:WDocid'
      'order by WITEMOPTIONVALUE1ID, WITEMOPTIONVALUE2ID,'
      ' WITEMOPTIONVALUE3ID, WITEMOPTIONVALUE4ID,'
      ' WITEMOPTIONVALUE5ID')
    CachedUpdates = True
    UpdateObject = ZUSQLOptions
    AfterInsert = ZQOptionsAfterInsert
    Left = 208
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WDocid'
      end>
    object ZQOptionsWDOCLINEOPTIONSID: TIntegerField
      FieldName = 'WDOCLINEOPTIONSID'
      Required = True
      OnGetText = ZQOptionsWITEMOPTIONVALUE1IDGetText
    end
    object ZQOptionsWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQOptionsWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object ZQOptionsWITEMOPTIONVALUE1ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE1ID'
    end
    object ZQOptionsWITEMOPTIONVALUE2ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE2ID'
    end
    object ZQOptionsWITEMOPTIONVALUE3ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE3ID'
    end
    object ZQOptionsWITEMOPTIONVALUE4ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE4ID'
    end
    object ZQOptionsWITEMOPTIONVALUE5ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE5ID'
    end
    object ZQOptionsFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
      OnGetText = ZQOptionsFEXTRAPRICEGetText
      OnSetText = ZQOptionsFEXTRAPRICESetText
      DisplayFormat = '0.00'
    end
    object ZQOptionsFQTY: TFloatField
      FieldName = 'FQTY'
      OnSetText = ZQOptionsFQTYSetText
    end
    object ZQOptionsWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
  end
  object ZUSQLOptions: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOCLINEOPTIONS'
      
        '  (DOCLINEOPTIONS.WDOCLINEOPTIONSID, DOCLINEOPTIONS.WDOCID, DOCL' +
        'INEOPTIONS.WLINEID, '
      
        '   DOCLINEOPTIONS.WITEMOPTIONVALUE1ID, DOCLINEOPTIONS.WITEMOPTIO' +
        'NVALUE2ID, '
      
        '   DOCLINEOPTIONS.WITEMOPTIONVALUE3ID, DOCLINEOPTIONS.WITEMOPTIO' +
        'NVALUE4ID, '
      
        '   DOCLINEOPTIONS.WITEMOPTIONVALUE5ID, DOCLINEOPTIONS.FEXTRAPRIC' +
        'E, DOCLINEOPTIONS.FQTY, '
      '   DOCLINEOPTIONS.WDESCRIPTIONID)'
      'VALUES'
      
        '  (:WDOCLINEOPTIONSID, :WDOCID, :WLINEID, :WITEMOPTIONVALUE1ID, ' +
        ':WITEMOPTIONVALUE2ID, '
      
        '   :WITEMOPTIONVALUE3ID, :WITEMOPTIONVALUE4ID, :WITEMOPTIONVALUE' +
        '5ID, :FEXTRAPRICE, '
      '   :FQTY, :WDESCRIPTIONID)')
    DeleteSQL.Strings = (
      'DELETE FROM DOCLINEOPTIONS'
      'WHERE'
      '  DOCLINEOPTIONS.WDOCLINEOPTIONSID = :OLD_WDOCLINEOPTIONSID')
    ModifySQL.Strings = (
      'UPDATE DOCLINEOPTIONS SET'
      '  DOCLINEOPTIONS.WDOCLINEOPTIONSID = '
      ':WDOCLINEOPTIONSID,'
      '  DOCLINEOPTIONS.WDOCID = :WDOCID,'
      '  DOCLINEOPTIONS.WLINEID = :WLINEID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE1ID = '
      ':WITEMOPTIONVALUE1ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE2ID = '
      ':WITEMOPTIONVALUE2ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE3ID = '
      ':WITEMOPTIONVALUE3ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE4ID = '
      ':WITEMOPTIONVALUE4ID,'
      '  DOCLINEOPTIONS.WITEMOPTIONVALUE5ID = '
      ':WITEMOPTIONVALUE5ID,'
      '  DOCLINEOPTIONS.FEXTRAPRICE = :FEXTRAPRICE,'
      '  DOCLINEOPTIONS.FQTY = :FQTY,'
      '  DOCLINEOPTIONS.WDESCRIPTIONID = :WDESCRIPTIONID'
      'WHERE'
      '  DOCLINEOPTIONS.WDOCLINEOPTIONSID = '
      ':OLD_WDOCLINEOPTIONSID')
    Left = 392
    Top = 72
  end
  object ZQStockOptions: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select * from STOCKOPTIONS where WStockid =:WStockid and coalesc' +
        'e(STOCKOPTIONS.BENABLED,1) = 1')
    Left = 468
    Top = 84
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQStockOptionsWSTOCKOPTIONSID: TIntegerField
      FieldName = 'WSTOCKOPTIONSID'
      Required = True
    end
    object ZQStockOptionsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE1ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE1ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE2ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE2ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE3ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE3ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE4ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE4ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE5ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE5ID'
    end
    object ZQStockOptionsFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
    end
    object ZQStockOptionsFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object ZQStockOptionsSBARCODE: TStringField
      FieldName = 'SBARCODE'
      Size = 25
    end
    object ZQStockOptionsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
    end
    object ZQStockOptionsFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object ZQStockOptionsFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object ZQStockOptionsFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object ZQStockOptionsFREORDERQTYTRIG: TFloatField
      FieldName = 'FREORDERQTYTRIG'
    end
    object ZQStockOptionsFEXTRAPRICE2: TFloatField
      FieldName = 'FEXTRAPRICE2'
    end
    object ZQStockOptionsFEXTRAPRICE3: TFloatField
      FieldName = 'FEXTRAPRICE3'
    end
  end
  object dsGridOptions: TDataSource
    Left = 404
    Top = 136
  end
  object dsOptions: TDataSource
    DataSet = ZQOptions
    Left = 372
    Top = 208
  end
  object ZQSelDestinct: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'select * from STOCKOPTIONS where WStockid =:WStockid and coalesc' +
        'e(STOCKOPTIONS.BENABLED,1) = 1')
    Left = 224
    Top = 260
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
  end
  object ZQStockDef: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select a.*,b.WStockTypeID,b.SDescription from STOCKSETOPTIONS a ' +
        'join stock b on ( a.WStockid = b.WStockid ) where a.WStockid =:W' +
        'Stockid')
    Left = 488
    Top = 140
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQStockDefWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockDefWITEMOPTION1ID: TIntegerField
      FieldName = 'WITEMOPTION1ID'
    end
    object ZQStockDefWITEMOPTION2ID: TIntegerField
      FieldName = 'WITEMOPTION2ID'
    end
    object ZQStockDefWITEMOPTION3ID: TIntegerField
      FieldName = 'WITEMOPTION3ID'
    end
    object ZQStockDefWITEMOPTION4ID: TIntegerField
      FieldName = 'WITEMOPTION4ID'
    end
    object ZQStockDefWITEMOPTION5ID: TIntegerField
      FieldName = 'WITEMOPTION5ID'
    end
    object ZQStockDefWLEVEL: TIntegerField
      FieldName = 'WLEVEL'
    end
    object ZQStockDefWSTOCKTYPEID: TIntegerField
      FieldName = 'WSTOCKTYPEID'
    end
    object ZQStockDefWLOOKUPTYPE: TIntegerField
      FieldName = 'WLOOKUPTYPE'
    end
    object ZQStockDefSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 60
    end
  end
  object DataSource2: TDataSource
    DataSet = ZQStockDef
    Left = 412
    Top = 220
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 196
    Top = 129
    object price1: TMenuItem
      OnClick = price1Click
    end
    object price2: TMenuItem
    end
    object price3: TMenuItem
    end
  end
  object cxEditRepository1: TcxEditRepository
    Left = 268
    Top = 81
    object pricecombo: TcxEditRepositoryComboBoxItem
      Properties.Items.Strings = (
        '1'
        '2'
        '3')
    end
  end
end
