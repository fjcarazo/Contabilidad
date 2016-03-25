object fmConfirmDocs: TfmConfirmDocs
  Left = 216
  Top = 139
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Confirm Quotes and Orders'
  ClientHeight = 529
  ClientWidth = 803
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 433
    Top = 0
    Width = 11
    Height = 529
  end
  object PnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 529
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'PnlLeft'
    TabOrder = 0
    object PnlSelectDbt: TPanel
      Left = 0
      Top = 0
      Width = 433
      Height = 430
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      Visible = False
      OnEnter = PnlSelectDbtEnter
      OnExit = PnlSelectDbtExit
      object cxGrid2: TcxGrid
        Left = 2
        Top = 2
        Width = 429
        Height = 426
        Align = alClient
        TabOrder = 0
        object cxGrid2DBTableView1: TcxGridDBTableView
          OnDblClick = cxGrid2DBTableView1DblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAccounts
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn
            DataBinding.FieldName = 'SACCOUNTCODE'
            Width = 88
          end
          object cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SDESCRIPTION'
            Width = 281
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
    object Pnlt: TPanel
      Left = 0
      Top = 430
      Width = 433
      Height = 99
      Align = alBottom
      TabOrder = 0
      DesignSize = (
        433
        99)
      object lbSearchBy: TLabel
        Left = 6
        Top = 8
        Width = 121
        Height = 13
        Alignment = taCenter
        Caption = 'Search By Quote Number'
      end
      object edDate: TcxDateEdit
        Left = 8
        Top = 25
        TabOrder = 6
        OnKeyUp = edDateKeyUp
        Width = 121
      end
      object ed: TEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 0
        OnKeyUp = edKeyUp
      end
      object btSearch: TBitBtn
        Left = 8
        Top = 64
        Width = 121
        Height = 25
        Caption = '&Search...'
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000000000001483
          EF001985EF003994F00019A1F6001AA6F50063ACD60067B2D80067B3F50069B8
          F40034C6F90031C9FC0038D8FD0079CADD004DF5FD00948F8F00969191009894
          93009C9797009E999900A19C9C00A49E9E00A6A19F00A6A2A100A8A3A300A8A4
          A100ACA6A300A8A4A400AFA9A900B0A9AA00B1ADAD00B6B1B100B9B5B500BCB7
          B700BEB8B900C1BDBD00C4BEBF00DBCFB500DACFB900D9D0BE00FEE1A400FEE2
          AA00FEE4AB00FEE3AD00FDE4AE00FEE7B500F3E1B900F2E2BE00FEE6B900FDE7
          BE00FFEABF0083C4F7008AC8F400C3C3C500C7C6C700C8C5C500CCC7C700C4C7
          CA00CDC9CA00CACACC00D2CECE00D9D2C700D7D2CC00D8D1CA00D5D1D100DDDA
          DA00DFDCDC00E1DEDE00F2E3C000F3E6C300FEE9C100FEE9C500F4E6C900FEEB
          CC00FEEFCD00F3E7D000FDEDD200F2E9DA00F1E9DD00FFF3DC00EDEAEA00EFEC
          EC00F0EDEE000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFF330203FFFFFFFFFFFFFFFFFFFFFFFF34050E0A03FFFFFFFFFF1B
          111017363B070E0C0B01FFFFFF141F23221F1D1406060D0B0508FFFF1741401E
          1411141E1C063C0609FFFF175040173F4E4E3F131B1E0639FFFFFF3B521B4B46
          464C4C4E131C1436FFFF205038272C2C3046494C3F141E14FFFF1B521E442C28
          2C3046494E11200FFFFF1B431E2F322D282C30464E142110FFFF203B2025494F
          2D282C313F1E2316FFFFFF1F381B454A462C2C48163C2038FFFFFF1B23231A25
          2F2E261B404314FFFFFFFFFF1B2338211E1E3850501BFFFFFFFFFFFFFF1B1F3B
          4350524017FFFFFFFFFFFFFFFFFFFF1F1B1B1F40FFFFFFFFFFFF}
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = btSearchClick
      end
      object BtnAdd: TBitBtn
        Left = 144
        Top = 64
        Width = 155
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Add Sel.'
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
        TabOrder = 2
        OnClick = BtnAddClick
      end
      object BtnDelete: TBitBtn
        Left = 314
        Top = 64
        Width = 106
        Height = 25
        Anchors = [akTop, akRight]
        Caption = '&Remove'
        DoubleBuffered = True
        Enabled = False
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
        TabOrder = 3
        OnClick = BtnDeleteClick
      end
      object RgDocType: TRadioGroup
        Left = 144
        Top = 8
        Width = 275
        Height = 33
        Anchors = [akTop, akRight]
        Caption = 'Document Type'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Quotes'
          'Orders')
        TabOrder = 4
        OnClick = RgDocTypeClick
      end
      object cbShowPosted: TCheckBox
        Left = 144
        Top = 44
        Width = 97
        Height = 17
        Caption = 'Show posted'
        TabOrder = 5
        OnClick = cbShowPostedClick
      end
    end
    object cxdocs: TcxGrid
      Left = 136
      Top = 116
      Width = 165
      Height = 238
      TabOrder = 2
      OnEnter = dbgInvoiceListEnter
      object cxdocsDBTableView1: TcxGridDBTableView
        OnDblClick = BtnAddClick
        OnKeyDown = FormKeyDown
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxdocsDBTableView1CustomDrawCell
        DataController.DataSource = dsDocHead
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        object cxdocsDBTableView1WDOCID: TcxGridDBColumn
          DataBinding.FieldName = 'WDOCID'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
        end
        object cxdocsDBTableView1SDOCNO: TcxGridDBColumn
          DataBinding.FieldName = 'SDOCNO'
          Options.Editing = False
          Width = 81
        end
        object cxdocsDBTableView1DDATE: TcxGridDBColumn
          DataBinding.FieldName = 'DDATE'
          Options.Editing = False
          Width = 91
        end
        object cxdocsDBTableView1SACCOUNTCODE: TcxGridDBColumn
          DataBinding.FieldName = 'SACCOUNTCODE'
          Options.Editing = False
        end
        object cxdocsDBTableView1SDESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'SDESCRIPTION'
          Options.Editing = False
          Width = 121
        end
        object cxdocsDBTableView1BREPEATING: TcxGridDBColumn
          DataBinding.FieldName = 'BREPEATING'
          RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
        end
        object cxdocsDBTableView1SREFERENCE: TcxGridDBColumn
          Caption = 'Reference'
          DataBinding.FieldName = 'SREFERENCE'
          Options.Editing = False
        end
      end
      object cxdocsLevel1: TcxGridLevel
        GridView = cxdocsDBTableView1
      end
    end
  end
  object Panel2: TPanel
    Left = 444
    Top = 0
    Width = 359
    Height = 529
    Align = alClient
    TabOrder = 1
    TabStop = True
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 357
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Quotes to Convert'
      ExplicitWidth = 86
    end
    object Panel3: TPanel
      Left = 1
      Top = 397
      Width = 357
      Height = 131
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label3: TLabel
        Left = 11
        Top = 8
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Select Date'
      end
      object Bevel1: TBevel
        Left = 2
        Top = 66
        Width = 189
        Height = 11
        Shape = bsBottomLine
      end
      object GenDate: TDateTimePicker
        Left = 138
        Top = 4
        Width = 82
        Height = 21
        Date = 36508.000000000000000000
        Time = 36508.000000000000000000
        MaxDate = 219148.000000000000000000
        MinDate = 2.000000000000000000
        TabOrder = 0
      end
      object BtnCancel: TBitBtn
        Left = 176
        Top = 96
        Width = 98
        Height = 25
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
        TabOrder = 1
      end
      object BtnGenerate: TBitBtn
        Left = 16
        Top = 96
        Width = 113
        Height = 25
        Caption = 'C&onvert'
        DoubleBuffered = True
        Enabled = False
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
        TabOrder = 2
        OnClick = BtnGenerateClick
      end
      object btnPubliPost: TBitBtn
        Left = 11
        Top = 45
        Width = 121
        Height = 25
        Caption = 'Selec&t Debtors'
        DoubleBuffered = True
        Enabled = False
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = btnPubliPostClick
      end
      object CBUseDocDate: TCheckBox
        Left = 11
        Top = 27
        Width = 141
        Height = 16
        Alignment = taLeftJustify
        Caption = 'Use doc date'
        TabOrder = 4
      end
    end
    object lvRepeating: TcxListView
      Left = 1
      Top = 14
      Width = 357
      Height = 383
      Align = alClient
      Columns = <
        item
          Caption = 'Quote No'
          Width = 70
        end
        item
          Caption = 'Debtor'
          Width = 81
        end
        item
          Caption = 'Date'
          Width = 70
        end
        item
          Caption = 'N'
          Width = 40
        end
        item
          Caption = 'From Debtor'
          Width = 100
        end
        item
          Caption = 'ToDebtor'
          Width = 100
        end>
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      SortType = stBoth
      Style.StyleController = dmQuantumGridDefs.cxEditStyleController1
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lvRepeatingColumnClick
      OnCompare = lvRepeatingCompare
      OnDblClick = btnPubliPostClick
      OnEnter = lvRepeatingEnter
      OnKeyUp = lvRepeatingKeyUp
      OnSelectItem = lvRepeatingSelectItem
    end
    object PnlPrg: TPanel
      Left = 10
      Top = 188
      Width = 185
      Height = 51
      BevelInner = bvRaised
      TabOrder = 2
      Visible = False
      object lblCount: TLabel
        Left = 14
        Top = 30
        Width = 165
        Height = 13
        Alignment = taCenter
        AutoSize = False
      end
      object prgBar: TProgressBar
        Left = 10
        Top = 10
        Width = 169
        Height = 16
        TabOrder = 0
      end
    end
  end
  object tblAccount: TUniTable
    TableName = 'Account'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    FilterSQL = 'WaccountTypeid = 1'
    AutoCalcFields = False
    IndexFieldNames = 'SACCOUNTCODE Asc'
    Left = 424
    Top = 157
    object tblAccountSACCOUNTCODE: TStringField
      DisplayWidth = 7
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object tblAccountSMAINACCOUNTCODE: TStringField
      DisplayWidth = 4
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object tblAccountSSUBACCOUNTCODE: TStringField
      DisplayWidth = 3
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object tblAccountSDESCRIPTION: TStringField
      DisplayWidth = 35
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object tblAccountWACCOUNTTYPEID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP1ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP2ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object tblAccountBSUBACCOUNTS: TSmallintField
      DisplayWidth = 10
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object tblAccountBOPENITEM: TSmallintField
      DisplayWidth = 10
      FieldName = 'BOPENITEM'
    end
    object tblAccountBINCOMEEXPENSE: TSmallintField
      DisplayWidth = 10
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object tblAccountBINACTIVE: TSmallintField
      DisplayWidth = 10
      FieldName = 'BINACTIVE'
    end
    object tblAccountDSYSDATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DSYSDATE'
    end
    object tblAccountWPROFILEID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WPROFILEID'
    end
    object tblAccountWTAXACCOUNT: TIntegerField
      DisplayWidth = 10
      FieldName = 'WTAXACCOUNT'
    end
    object tblAccountWLINKACCOUNT: TIntegerField
      DisplayWidth = 10
      FieldName = 'WLINKACCOUNT'
    end
    object tblAccountWACCOUNTID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WACCOUNTID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
  end
  object dsAccounts: TDataSource
    DataSet = tblAccount
    Left = 488
    Top = 89
  end
  object qryDocHead: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select  DocHead.WDocID, DocHead.SDocNo, DocHead.DDate,'
      '           DocHead.BRepeating,'
      '           Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE,'
      '           Account.SACCOUNTCODE,'
      
        '           Account.SDescription, DocHead.WMessage1ID, DocHead.WM' +
        'essage2ID,'
      '           DocHead.WMessage3ID,DocHead.FInvoiceDiscount,'
      
        '           DocHead.WDelAddress1ID, DocHead.WDelAddress2ID, DocHe' +
        'ad.WDelAddress3ID,'
      
        '           DocHead.WPostal1ID, DocHead.WPostal2ID, DocHead.WPost' +
        'al3ID, DocHead.WPostalCodeID,'
      '           DocHead.WDelCodeID, DocHead.WAccountID, '
      'DocHead.WPOSTALNAME ,'
      'DocHead.WPOSTALCONTACT ,'
      'DocHead.WDELNAME ,'
      'DocHead.WDELCONTACT ,'
      'DocHead.WTAXNUMBER ,'
      
        '           DocHead.WSalesmanID,DocHead.WCurrencyID,DocHead.WPaym' +
        'entTypeID,'
      '           DocHead.BPosted,DocHead.BPrinted,DocHead.WUserID,'
      
        '           DocHead.SReference,DocHead.DDueDate,DocHead.WReportin' +
        'gGroup1ID,DocHead.WReportingGroup2ID,DocHead.WTerms'
      'from    DocHead, Account'
      'where DocHead.WAccountID = Account.WAccountID'
      'and DocHead.WTypeID = 10'
      'order by DocHead.SDocNo')
    UpdateObject = UniUpdateSQL1
    Left = 178
    Top = 284
    object qryDocHeadWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object qryDocHeadSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qryDocHeadDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryDocHeadBREPEATING: TSmallintField
      FieldName = 'BREPEATING'
    end
    object qryDocHeadSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object qryDocHeadSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object qryDocHeadSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object qryDocHeadSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object qryDocHeadWMESSAGE1ID: TIntegerField
      FieldName = 'WMESSAGE1ID'
    end
    object qryDocHeadWMESSAGE2ID: TIntegerField
      FieldName = 'WMESSAGE2ID'
    end
    object qryDocHeadWMESSAGE3ID: TIntegerField
      FieldName = 'WMESSAGE3ID'
    end
    object qryDocHeadFINVOICEDISCOUNT: TFloatField
      FieldName = 'FINVOICEDISCOUNT'
    end
    object qryDocHeadWDELADDRESS1ID: TIntegerField
      FieldName = 'WDELADDRESS1ID'
    end
    object qryDocHeadWDELADDRESS2ID: TIntegerField
      FieldName = 'WDELADDRESS2ID'
    end
    object qryDocHeadWDELADDRESS3ID: TIntegerField
      FieldName = 'WDELADDRESS3ID'
    end
    object qryDocHeadWPOSTAL1ID: TIntegerField
      FieldName = 'WPOSTAL1ID'
    end
    object qryDocHeadWPOSTAL2ID: TIntegerField
      FieldName = 'WPOSTAL2ID'
    end
    object qryDocHeadWPOSTAL3ID: TIntegerField
      FieldName = 'WPOSTAL3ID'
    end
    object qryDocHeadWPOSTALCODEID: TIntegerField
      FieldName = 'WPOSTALCODEID'
    end
    object qryDocHeadWDELCODEID: TIntegerField
      FieldName = 'WDELCODEID'
    end
    object qryDocHeadWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object qryDocHeadWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object qryDocHeadWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object qryDocHeadWPAYMENTTYPEID: TIntegerField
      FieldName = 'WPAYMENTTYPEID'
    end
    object qryDocHeadBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object qryDocHeadBPRINTED: TSmallintField
      FieldName = 'BPRINTED'
    end
    object qryDocHeadWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object qryDocHeadSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object qryDocHeadDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object qryDocHeadWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qryDocHeadWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qryDocHeadWTERMS: TIntegerField
      FieldName = 'WTERMS'
    end
    object qryDocHeadWPOSTALNAME: TIntegerField
      FieldName = 'WPOSTALNAME'
    end
    object qryDocHeadWPOSTALCONTACT: TIntegerField
      FieldName = 'WPOSTALCONTACT'
    end
    object qryDocHeadWDELNAME: TIntegerField
      FieldName = 'WDELNAME'
    end
    object qryDocHeadWDELCONTACT: TIntegerField
      FieldName = 'WDELCONTACT'
    end
    object qryDocHeadWTAXNUMBER: TIntegerField
      FieldName = 'WTAXNUMBER'
    end
  end
  object UniUpdateSQL1: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOCHEAD'
      '  (BREPEATING)'
      'VALUES'
      '  (:BREPEATING)')
    DeleteSQL.Strings = (
      'DELETE FROM DOCHEAD'
      'WHERE'
      '  WDOCID = :Old_WDOCID')
    ModifySQL.Strings = (
      'UPDATE DOCHEAD'
      'SET'
      '  BREPEATING = :BREPEATING'
      'WHERE'
      '  WDOCID = :Old_WDOCID')
    RefreshSQL.Strings = (
      'SELECT BREPEATING FROM DOCHEAD'
      'WHERE'
      '  WDOCID = :WDOCID')
    Left = 224
    Top = 320
  end
  object dsDocHead: TDataSource
    DataSet = qryDocHead
    Left = 580
    Top = 296
  end
end
