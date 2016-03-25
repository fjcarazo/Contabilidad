object fmUpdateInvoice: TfmUpdateInvoice
  Left = 435
  Top = 284
  Caption = 'Update Invoices'
  ClientHeight = 391
  ClientWidth = 709
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 566
    Height = 325
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Documents'
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 558
        Height = 297
        Align = alClient
        TabOrder = 0
        OnEnter = dbgInvoiceListEnter
        object cxGrid1DBTableView1: TcxGridDBTableView
          PopupMenu = PopupMenu1
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
          DataController.DataSource = dmDatabase.dsDocHead
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              FieldName = 'SDOCNO'
              Column = cxGrid1DBTableView1SDOCNO
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid1DBTableView1SDOCNO: TcxGridDBColumn
            DataBinding.FieldName = 'SDOCNO'
            Width = 107
          end
          object cxGrid1DBTableView1DDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DDATE'
            Width = 70
          end
          object cxGrid1DBTableView1SACCOUNTCODE: TcxGridDBColumn
            DataBinding.FieldName = 'SACCOUNTCODE'
            Width = 75
          end
          object cxGrid1DBTableView1BREPEATING: TcxGridDBColumn
            DataBinding.FieldName = 'BREPEATING'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SDESCRIPTION'
            Width = 190
          end
          object cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn
            DataBinding.FieldName = 'SREFERENCE'
            Width = 110
          end
          object cxGrid1DBTableView1SMAINACCOUNTCODE: TcxGridDBColumn
            DataBinding.FieldName = 'SMAINACCOUNTCODE'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1SSUBACCOUNTCODE: TcxGridDBColumn
            DataBinding.FieldName = 'SSUBACCOUNTCODE'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WMESSAGE1ID: TcxGridDBColumn
            DataBinding.FieldName = 'WMESSAGE1ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WMESSAGE2ID: TcxGridDBColumn
            DataBinding.FieldName = 'WMESSAGE2ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WMESSAGE3ID: TcxGridDBColumn
            DataBinding.FieldName = 'WMESSAGE3ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1FINVOICEDISCOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'FINVOICEDISCOUNT'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WDELADDRESS1ID: TcxGridDBColumn
            DataBinding.FieldName = 'WDELADDRESS1ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WDELADDRESS2ID: TcxGridDBColumn
            DataBinding.FieldName = 'WDELADDRESS2ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WDELADDRESS3ID: TcxGridDBColumn
            DataBinding.FieldName = 'WDELADDRESS3ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPOSTAL1ID: TcxGridDBColumn
            DataBinding.FieldName = 'WPOSTAL1ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPOSTAL2ID: TcxGridDBColumn
            DataBinding.FieldName = 'WPOSTAL2ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPOSTAL3ID: TcxGridDBColumn
            DataBinding.FieldName = 'WPOSTAL3ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPOSTALCODEID: TcxGridDBColumn
            DataBinding.FieldName = 'WPOSTALCODEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WDELCODEID: TcxGridDBColumn
            DataBinding.FieldName = 'WDELCODEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn
            DataBinding.FieldName = 'WACCOUNTID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WSALESMANID: TcxGridDBColumn
            DataBinding.FieldName = 'WSALESMANID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WCURRENCYID: TcxGridDBColumn
            DataBinding.FieldName = 'WCURRENCYID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPAYMENTTYPEID: TcxGridDBColumn
            DataBinding.FieldName = 'WPAYMENTTYPEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1BPOSTED: TcxGridDBColumn
            DataBinding.FieldName = 'BPOSTED'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1BPRINTED: TcxGridDBColumn
            DataBinding.FieldName = 'BPRINTED'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WUSERID: TcxGridDBColumn
            DataBinding.FieldName = 'WUSERID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1DDUEDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DDUEDATE'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn
            DataBinding.FieldName = 'WREPORTINGGROUP1ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn
            DataBinding.FieldName = 'WREPORTINGGROUP2ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WTERMS: TcxGridDBColumn
            DataBinding.FieldName = 'WTERMS'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPOSTALNAME: TcxGridDBColumn
            DataBinding.FieldName = 'WPOSTALNAME'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPOSTALCONTACT: TcxGridDBColumn
            DataBinding.FieldName = 'WPOSTALCONTACT'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WDELNAME: TcxGridDBColumn
            DataBinding.FieldName = 'WDELNAME'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WDELCONTACT: TcxGridDBColumn
            DataBinding.FieldName = 'WDELCONTACT'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WTAXNUMBER: TcxGridDBColumn
            DataBinding.FieldName = 'WTAXNUMBER'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Batches'
      ImageIndex = 1
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 558
        Height = 297
        Align = alClient
        TabOrder = 0
        OnEnter = dbgInvoiceListEnter
        object cxGrid2DBTableView1: TcxGridDBTableView
          PopupMenu = BatPopMenu
          OnDblClick = EditBatch1Click
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dmDatabase.dsUpdateBatch
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              FieldName = 'WBATCHID'
              Column = cxGrid2DBTableView1WBATCHID
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid2DBTableView1WBATCHID: TcxGridDBColumn
            DataBinding.FieldName = 'WBATCHID'
          end
          object cxGrid2DBTableView1WUSERID: TcxGridDBColumn
            DataBinding.FieldName = 'WUSERID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid2DBTableView1BPOSTED: TcxGridDBColumn
            DataBinding.FieldName = 'BPOSTED'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid2DBTableView1WBATCHTYPEID: TcxGridDBColumn
            DataBinding.FieldName = 'WBATCHTYPEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SDESCRIPTION'
            Width = 150
          end
          object cxGrid2DBTableView1SUSERNAME: TcxGridDBColumn
            DataBinding.FieldName = 'SUSERNAME'
          end
          object cxGrid2DBTableView1BONLINE: TcxGridDBColumn
            DataBinding.FieldName = 'BONLINE'
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 325
    Width = 709
    Height = 66
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lbSearchBy: TLabel
      Left = 8
      Top = 4
      Width = 127
      Height = 13
      Caption = 'Search By Invoice Number'
    end
    object StBar: TStatusBar
      Left = 0
      Top = 47
      Width = 709
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 50
        end
        item
          Width = 50
        end>
    end
    object BtnCancel: TBitBtn
      Left = 566
      Top = 16
      Width = 96
      Height = 25
      Cancel = True
      Caption = '&Close'
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
      OnClick = btnCancelClick
      OnKeyPress = FormKeyPress
    end
    object BtnOk: TBitBtn
      Left = 464
      Top = 16
      Width = 96
      Height = 25
      Caption = '&Update'
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
      OnClick = btnOKClick
      OnKeyPress = FormKeyPress
    end
    object btSearch: TButton
      Left = 134
      Top = 21
      Width = 99
      Height = 22
      Caption = 'Search...'
      TabOrder = 3
      TabStop = False
      OnClick = btSearchClick
    end
    object ed: TEdit
      Left = 7
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 4
      OnChange = edChange
    end
  end
  object Panel1: TPanel
    Left = 566
    Top = 0
    Width = 143
    Height = 325
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 4
      Top = 2
      Width = 133
      Height = 95
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 6
        Top = 8
        Width = 57
        Height = 13
        Caption = '&Select Type'
        FocusControl = CbDocTypeNew
      end
      object CbDocTypeNew: TComboBox
        Left = 8
        Top = 36
        Width = 113
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Invoice'
        OnChange = CbDocTypeNewChange
        Items.Strings = (
          'Invoice'
          'Credit Note'
          'Purchase'
          'Stock Return')
      end
      object cbPosted: TCheckBox
        Left = 10
        Top = 59
        Width = 97
        Height = 17
        Caption = '&Posted'
        TabOrder = 1
        OnClick = cbPostedClick
      end
      object CBSupressOpenitem: TCheckBox
        Left = 10
        Top = 77
        Width = 119
        Height = 15
        Caption = 'Supress openitem'
        TabOrder = 2
      end
    end
    object Panel3: TPanel
      Left = 4
      Top = 100
      Width = 133
      Height = 173
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label4: TLabel
        Left = 8
        Top = 6
        Width = 36
        Height = 13
        Caption = 'Options'
        FocusControl = Panel3
      end
      object Label1: TLabel
        Left = 8
        Top = 80
        Width = 61
        Height = 13
        Caption = 'From Invoice'
      end
      object Label2: TLabel
        Left = 8
        Top = 128
        Width = 51
        Height = 13
        Caption = 'To Invoice'
      end
      object RbRange: TRadioButton
        Left = 6
        Top = 30
        Width = 79
        Height = 17
        Caption = 'From ... To'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RbRangeClick
      end
      object RbSelect: TRadioButton
        Left = 6
        Top = 52
        Width = 97
        Height = 17
        Caption = 'Selected'
        TabOrder = 1
        OnClick = RbSelectClick
      end
      object cboxFromInvoice: TComboBox
        Left = 6
        Top = 98
        Width = 123
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnKeyPress = FormKeyPress
      end
      object cboxToInvoice: TComboBox
        Left = 6
        Top = 144
        Width = 123
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnKeyPress = FormKeyPress
      end
    end
    object PMultyUserDebug: TPanel
      Left = 2
      Top = 272
      Width = 135
      Height = 57
      TabOrder = 2
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 82
    Top = 82
    object SetFromoption1: TMenuItem
      Caption = 'Set as &From Option'
      ShortCut = 16454
      OnClick = SetFromoption1Click
    end
    object SetasToOption1: TMenuItem
      Caption = 'Set as &To Option'
      ShortCut = 16468
      OnClick = SetasToOption1Click
    end
    object Update1: TMenuItem
      Caption = '&Update'
      ShortCut = 16469
      OnClick = Update1Click
    end
  end
  object BatPopMenu: TPopupMenu
    Left = 272
    Top = 78
    object Update2: TMenuItem
      Caption = '&Update'
      OnClick = btnOKClick
    end
    object EditBatch1: TMenuItem
      Caption = '&Edit Batch'
      OnClick = EditBatch1Click
    end
    object DeleteBatch1: TMenuItem
      Caption = '&Delete Batch'
      OnClick = DeleteBatch1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 372
    Top = 120
  end
end
