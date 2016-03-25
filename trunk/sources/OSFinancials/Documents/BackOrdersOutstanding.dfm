object fmBackOrdersOutstanding: TfmBackOrdersOutstanding
  Left = 229
  Top = 332
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'BackOrders Outstanding'
  ClientHeight = 398
  ClientWidth = 990
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 379
    Width = 990
    Height = 19
    Panels = <>
    ParentColor = True
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 345
    Width = 990
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      990
      34)
    object BtnOk: TBitBtn
      Left = 755
      Top = 6
      Width = 107
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&OK'
      Default = True
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
      Left = 875
      Top = 6
      Width = 107
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
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnCancelClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 990
    Height = 345
    ActivePage = tsDetail
    Align = alClient
    TabOrder = 2
    object tsBackorder: TTabSheet
      Caption = 'backorder'
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 982
        Height = 317
        Align = alClient
        TabOrder = 0
        object cxGrid2DBTableView1: TcxGridDBTableView
          OnKeyPress = BackOrdDBGridKeyPress
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid2DBTableView1WSTOCKID: TcxGridDBColumn
            DataBinding.FieldName = 'WSTOCKID'
            Options.Editing = False
            Width = 186
          end
          object cxGrid2DBTableView1SSOURCE: TcxGridDBColumn
            Caption = 'Source'
            DataBinding.FieldName = 'SSOURCE'
            Width = 123
          end
          object cxGrid2DBTableView1WUNITID: TcxGridDBColumn
            Caption = 'Unit'
            DataBinding.FieldName = 'WUNITID'
            RepositoryItem = UnitLookup
          end
          object cxGrid2DBTableView1QTYEXP: TcxGridDBColumn
            DataBinding.FieldName = 'QTYEXP'
            Options.Editing = False
            Width = 73
          end
          object cxGrid2DBTableView1FSELLINGPRICE: TcxGridDBColumn
            DataBinding.FieldName = 'FSELLINGPRICE'
            Options.Editing = False
            Width = 114
          end
          object cxGrid2DBTableView1FQTY: TcxGridDBColumn
            DataBinding.FieldName = 'FQTY'
            Options.Editing = False
          end
          object cxGrid2DBTableView1BSELECTED: TcxGridDBColumn
            DataBinding.FieldName = 'BSELECTED'
            RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
            Width = 93
          end
          object cxGrid2DBTableView1FDISCOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'FDISCOUNT'
            Options.Editing = False
            Width = 91
          end
          object cxGrid2DBTableView1FPRICE: TcxGridDBColumn
            DataBinding.FieldName = 'FPRICE'
            Options.Editing = False
            Width = 83
          end
          object cxGrid2DBTableView1WBACKORDERID: TcxGridDBColumn
            DataBinding.FieldName = 'WBACKORDERID'
            Visible = False
            VisibleForCustomization = False
            Width = 181
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
    object tsDetail: TTabSheet
      Caption = 'Detail'
      ImageIndex = 1
      DesignSize = (
        982
        317)
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 40
        Height = 13
        Caption = 'Account'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 42
        Width = 58
        Height = 13
        Caption = 'WSTOCKID'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 28
        Height = 13
        Caption = 'FQTY'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 8
        Top = 120
        Width = 69
        Height = 13
        Caption = 'QTYONHAND'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 336
        Top = 80
        Width = 83
        Height = 13
        Caption = 'FSELLINGPRICE'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 8
        Top = 160
        Width = 52
        Height = 13
        Caption = 'SSOURCE'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 480
        Top = 80
        Width = 62
        Height = 13
        Caption = 'FDISCOUNT'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 624
        Top = 80
        Width = 38
        Height = 13
        Caption = 'FPRICE'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 152
        Top = 120
        Width = 19
        Height = 13
        Caption = 'Unit'
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 18
        Width = 902
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'WACCOUNTID'
        DataSource = DataSource1
        ParentColor = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 56
        Width = 902
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'WSTOCKID'
        DataSource = DataSource1
        ParentColor = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 96
        Width = 134
        Height = 21
        BevelOuter = bvRaised
        BevelKind = bkFlat
        DataField = 'FQTY'
        DataSource = DataSource1
        TabOrder = 2
        OnKeyPress = DBEdit4KeyPress
      end
      object DBEdit4: TDBEdit
        Left = 8
        Top = 136
        Width = 132
        Height = 21
        BevelOuter = bvRaised
        BevelKind = bkFlat
        DataField = 'QTYONHAND'
        DataSource = DataSource1
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        OnKeyPress = DBEdit4KeyPress
      end
      object BitBtn1: TBitBtn
        Left = 916
        Top = 17
        Width = 24
        Height = 23
        Anchors = [akTop, akRight]
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
        TabOrder = 4
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 916
        Top = 55
        Width = 24
        Height = 23
        Anchors = [akTop, akRight]
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
        OnClick = BitBtn2Click
      end
      object DBEdit5: TDBEdit
        Left = 336
        Top = 96
        Width = 134
        Height = 21
        BevelOuter = bvRaised
        BevelKind = bkFlat
        DataField = 'FSELLINGPRICE'
        DataSource = DataSource1
        TabOrder = 6
        OnChange = DBEdit5Change
        OnKeyPress = DBEdit5KeyPress
      end
      object DBEdit6: TDBEdit
        Left = 8
        Top = 176
        Width = 524
        Height = 21
        DataField = 'SSOURCE'
        DataSource = DataSource1
        TabOrder = 7
        OnExit = DBEdit6Exit
      end
      object BRecalcSalePrice: TButton
        Left = 148
        Top = 93
        Width = 173
        Height = 21
        Caption = 'recalc selprice'
        TabOrder = 8
        OnClick = BRecalcSalePriceClick
      end
      object DBEdit7: TDBEdit
        Left = 480
        Top = 96
        Width = 134
        Height = 21
        BevelOuter = bvRaised
        BevelKind = bkFlat
        DataField = 'FDISCOUNT'
        DataSource = DataSource1
        TabOrder = 9
        OnChange = DBEdit7Change
        OnKeyPress = DBEdit5KeyPress
      end
      object DBEdit8: TDBEdit
        Left = 624
        Top = 96
        Width = 134
        Height = 21
        BevelInner = bvLowered
        BevelOuter = bvRaised
        BevelKind = bkFlat
        DataField = 'FPRICE'
        DataSource = DataSource1
        TabOrder = 10
        OnChange = DBEdit8Change
        OnKeyPress = DBEdit5KeyPress
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 152
        Top = 136
        RepositoryItem = UnitLookup
        DataBinding.DataField = 'WUNITID'
        DataBinding.DataSource = DataSource1
        Properties.ListColumns = <>
        TabOrder = 11
        Width = 173
      end
    end
    object tslist: TTabSheet
      Caption = 'list'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 982
        Height = 41
        Align = alTop
        TabOrder = 0
        object BCDelete: TButton
          Left = 220
          Top = 10
          Width = 96
          Height = 25
          Caption = 'Delete'
          TabOrder = 0
          OnClick = BCDeleteClick
        end
        object BCEdit: TButton
          Left = 114
          Top = 10
          Width = 96
          Height = 25
          Caption = 'Edit'
          TabOrder = 1
          OnClick = BCEditClick
        end
        object BCAdd: TButton
          Left = 10
          Top = 10
          Width = 96
          Height = 25
          Caption = 'Add'
          TabOrder = 2
          OnClick = BCAddClick
        end
        object brefresh: TButton
          Left = 330
          Top = 10
          Width = 96
          Height = 25
          Caption = 'refresh'
          TabOrder = 3
          OnClick = brefreshClick
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 41
        Width = 982
        Height = 276
        Align = alClient
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          OnDblClick = DBGrid1DblClick
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.Footer = True
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid1DBTableView1WBACKORDERID: TcxGridDBColumn
            DataBinding.FieldName = 'WBACKORDERID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn
            DataBinding.FieldName = 'WACCOUNTID'
            Width = 130
          end
          object cxGrid1DBTableView1WSTOCKID: TcxGridDBColumn
            DataBinding.FieldName = 'WSTOCKID'
            Width = 174
          end
          object cxGrid1DBTableView1WUNITID: TcxGridDBColumn
            Caption = 'Unit'
            DataBinding.FieldName = 'WUNITID'
            RepositoryItem = UnitLookup
          end
          object cxGrid1DBTableView1FQTY: TcxGridDBColumn
            DataBinding.FieldName = 'FQTY'
          end
          object cxGrid1DBTableView1FDISCOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'FDISCOUNT'
          end
          object cxGrid1DBTableView1QTYONHAND: TcxGridDBColumn
            DataBinding.FieldName = 'QTYONHAND'
          end
          object cxGrid1DBTableView1SSOURCE: TcxGridDBColumn
            DataBinding.FieldName = 'SSOURCE'
            Width = 102
          end
          object cxGrid1DBTableView1FSELLINGPRICE: TcxGridDBColumn
            DataBinding.FieldName = 'FSELLINGPRICE'
          end
          object cxGrid1DBTableView1FPRICE: TcxGridDBColumn
            DataBinding.FieldName = 'FPRICE'
          end
          object cxGrid1DBTableView1QTYEXP: TcxGridDBColumn
            DataBinding.FieldName = 'QTYEXP'
          end
          object cxGrid1DBTableView1BSELECTED: TcxGridDBColumn
            DataBinding.FieldName = 'BSELECTED'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DSYSDATE'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQBackorder
    Left = 300
    Top = 248
  end
  object ZQBackorder: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from BACKORD where WAccountID = :AccId')
    UpdateObject = ZUSQLBackorder
    AfterOpen = ZQBackorderAfterOpen
    AfterInsert = ZQBackorderAfterInsert
    OnCalcFields = ZQBackorderCalcFields
    Left = 44
    Top = 221
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AccId'
      end>
    object ZQBackorderWBACKORDERID: TIntegerField
      FieldName = 'WBACKORDERID'
      Required = True
    end
    object ZQBackorderWACCOUNTID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WACCOUNTID'
      Required = True
      OnGetText = ZQBackorderWACCOUNTIDGetText
    end
    object ZQBackorderWSTOCKID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WSTOCKID'
      Required = True
      OnGetText = ZQBackorderWSTOCKIDGetText
    end
    object ZQBackorderFQTY: TFloatField
      FieldName = 'FQTY'
      OnChange = ZQBackorderFQTYChange
    end
    object ZQBackorderFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
      DisplayFormat = '0.00'
    end
    object ZQBackorderBSELECTED: TSmallintField
      FieldName = 'BSELECTED'
    end
    object ZQBackorderDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQBackorderQTYONHAND: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTYONHAND'
      Calculated = True
    end
    object ZQBackorderSSOURCE: TStringField
      FieldName = 'SSOURCE'
      Size = 40
    end
    object ZQBackorderFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
      DisplayFormat = '0.####'
    end
    object ZQBackorderFPRICE: TFloatField
      FieldName = 'FPRICE'
      DisplayFormat = '0.00'
    end
    object ZQBackorderQTYEXP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QTYEXP'
      Calculated = True
    end
    object ZQBackorderWUNITID: TIntegerField
      FieldName = 'WUNITID'
      OnChange = ZQBackorderFQTYChange
    end
  end
  object ZUSQLBackorder: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO BACKORD'
      
        '  (WBACKORDERID, WACCOUNTID, WSTOCKID, FQTY, FSELLINGPRICE, BSEL' +
        'ECTED, DSYSDATE, SSOURCE, FDISCOUNT, FPRICE, WUNITID)'
      'VALUES'
      
        '  (:WBACKORDERID, :WACCOUNTID, :WSTOCKID, :FQTY, :FSELLINGPRICE,' +
        ' :BSELECTED, :DSYSDATE, :SSOURCE, :FDISCOUNT, :FPRICE, :WUNITID)')
    DeleteSQL.Strings = (
      'DELETE FROM BACKORD'
      'WHERE'
      '  WBACKORDERID = :Old_WBACKORDERID')
    ModifySQL.Strings = (
      'UPDATE BACKORD'
      'SET'
      
        '  WBACKORDERID = :WBACKORDERID, WACCOUNTID = :WACCOUNTID, WSTOCK' +
        'ID = :WSTOCKID, FQTY = :FQTY, FSELLINGPRICE = :FSELLINGPRICE, BS' +
        'ELECTED = :BSELECTED, DSYSDATE = :DSYSDATE, SSOURCE = :SSOURCE, ' +
        'FDISCOUNT = :FDISCOUNT, FPRICE = :FPRICE, WUNITID = :WUNITID'
      'WHERE'
      '  WBACKORDERID = :Old_WBACKORDERID')
    RefreshSQL.Strings = (
      
        'SELECT WBACKORDERID, WACCOUNTID, WSTOCKID, FQTY, FSELLINGPRICE, ' +
        'BSELECTED, DSYSDATE, SSOURCE, FDISCOUNT, FPRICE, WUNITID FROM BA' +
        'CKORD'
      'WHERE'
      '  WBACKORDERID = :WBACKORDERID')
    Left = 100
    Top = 276
  end
  object UniQUnit: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from unit  order by 2')
    Left = 364
    Top = 112
  end
  object cxEditRepository1: TcxEditRepository
    Left = 564
    Top = 152
    object UnitLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'WUNITID'
      Properties.ListColumns = <
        item
          Caption = 'Description'
          FieldName = 'SDESCRIPTION'
        end>
      Properties.ListSource = dsUnit
      Properties.ReadOnly = False
    end
  end
  object dsUnit: TDataSource
    DataSet = UniQUnit
    Left = 660
    Top = 160
  end
end
