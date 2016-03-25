object fmInvoiceHistory: TfmInvoiceHistory
  Left = 314
  Top = 155
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Invoice History'
  ClientHeight = 522
  ClientWidth = 919
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
    Left = 489
    Top = 0
    Height = 522
    ExplicitHeight = 515
  end
  object PnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 522
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      489
      522)
    object PnlSelectDbt: TPanel
      Left = 0
      Top = 1
      Width = 484
      Height = 432
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvLowered
      TabOrder = 1
      Visible = False
      OnExit = PnlSelectDbtExit
      DesignSize = (
        484
        432)
      object Label2: TLabel
        Left = 344
        Top = 24
        Width = 23
        Height = 13
        Anchors = [akTop, akRight]
        Caption = '&From'
      end
      object Label4: TLabel
        Left = 348
        Top = 82
        Width = 13
        Height = 13
        Caption = '&To'
      end
      object Label3: TLabel
        Left = 12
        Top = 259
        Width = 56
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Select Date'
      end
      object Bevel2: TBevel
        Left = 8
        Top = 229
        Width = 441
        Height = 165
        Anchors = [akLeft, akBottom]
      end
      object Label5: TLabel
        Left = 16
        Top = 241
        Width = 52
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Apply to All'
      end
      object Label6: TLabel
        Left = 10
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Apply to selection'
      end
      object btnCancelDbt: TBitBtn
        Left = 348
        Top = 400
        Width = 101
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Cancel'
        DoubleBuffered = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = btnCancelDbtClick
      end
      object btnOkDbt: TBitBtn
        Left = 240
        Top = 400
        Width = 101
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'OK'
        DoubleBuffered = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = btnOkDbtClick
      end
      object edtFromAcc: TEdit
        Left = 344
        Top = 44
        Width = 101
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 2
        Text = 'edtFromAcc'
        OnEnter = BedtFromAccClick
      end
      object edtToAcc: TEdit
        Left = 344
        Top = 100
        Width = 101
        Height = 21
        TabStop = False
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 3
        Text = 'edtToAcc'
        OnEnter = BedtToAccClick
      end
      object Edit1: TEdit
        Left = 13
        Top = 309
        Width = 153
        Height = 21
        Anchors = [akLeft, akBottom]
        AutoSize = False
        TabOrder = 4
      end
      object cbNewMessg: TCheckBox
        Left = 14
        Top = 285
        Width = 163
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Replace Message By'
        TabOrder = 5
      end
      object Edit2: TEdit
        Left = 13
        Top = 331
        Width = 153
        Height = 21
        Anchors = [akLeft, akBottom]
        AutoSize = False
        TabOrder = 6
      end
      object Edit3: TEdit
        Left = 13
        Top = 353
        Width = 154
        Height = 21
        Anchors = [akLeft, akBottom]
        AutoSize = False
        TabOrder = 7
      end
      object cbAddCmt: TCheckBox
        Left = 188
        Top = 281
        Width = 205
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Add this Comment line'
        TabOrder = 8
      end
      object Memo1: TMemo
        Left = 188
        Top = 305
        Width = 245
        Height = 71
        Anchors = [akLeft, akBottom]
        TabOrder = 9
      end
      object GenDate: TDateTimePicker
        Left = 84
        Top = 255
        Width = 82
        Height = 21
        Anchors = [akLeft, akBottom]
        Date = 36508.000000000000000000
        Time = 36508.000000000000000000
        MaxDate = 365245.000000000000000000
        MinDate = 2.000000000000000000
        TabOrder = 10
      end
      object CheckBox1: TCheckBox
        Left = 188
        Top = 257
        Width = 213
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Set New Invoice as Repeating'
        TabOrder = 11
      end
      object cxGrid2: TcxGrid
        Left = 12
        Top = 24
        Width = 325
        Height = 189
        TabOrder = 12
        object cxGrid2DBTableView1: TcxGridDBTableView
          OnKeyPress = wwDBGrid1KeyPress
          NavigatorButtons.ConfirmDelete = False
          OnCellClick = cxGrid2DBTableView1CellClick
          DataController.DataSource = dsAccounts
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn
            DataBinding.FieldName = 'SACCOUNTCODE'
            Width = 113
          end
          object cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SDESCRIPTION'
            Width = 192
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
    object NoName: TPanel
      Left = 0
      Top = 434
      Width = 489
      Height = 88
      Align = alBottom
      TabOrder = 0
      object lbSearchBy: TLabel
        Left = 6
        Top = 8
        Width = 127
        Height = 13
        Alignment = taCenter
        Caption = 'Search By Invoice Number'
      end
      object ed: TEdit
        Left = 8
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object btSearch: TBitBtn
        Left = 10
        Top = 56
        Width = 119
        Height = 25
        Caption = 'Search...'
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
      object BtnAddAll: TBitBtn
        Left = 168
        Top = 22
        Width = 137
        Height = 25
        Caption = 'Add All'
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
        OnClick = BtnAddAllClick
      end
      object BtnAdd: TBitBtn
        Left = 168
        Top = 56
        Width = 137
        Height = 25
        Caption = 'Add Sel.'
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
        TabOrder = 3
        OnClick = BtnAddClick
      end
      object BtnDelete: TBitBtn
        Left = 328
        Top = 56
        Width = 105
        Height = 25
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
        TabOrder = 4
        OnClick = BtnDeleteClick
      end
      object edDate: TcxDateEdit
        Left = 8
        Top = 24
        TabOrder = 5
        Width = 121
      end
    end
    object cxGrid1: TcxGrid
      Left = 24
      Top = 28
      Width = 153
      Height = 149
      TabOrder = 2
      object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
        DataController.DataSource = dsDocHead
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsCustomize.BandsQuickCustomization = True
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
        Bands = <
          item
            FixedKind = fkLeft
            Width = 176
          end
          item
          end>
        object cxGrid1DBBandedTableView1WDOCID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WDOCID'
          Visible = False
          Options.Editing = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1SDOCNO: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SDOCNO'
          Options.Editing = False
          Width = 113
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1DDATE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DDATE'
          Options.Editing = False
          Width = 90
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1BREPEATING: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BREPEATING'
          RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
          Width = 63
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1SMAINACCOUNTCODE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SMAINACCOUNTCODE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1SSUBACCOUNTCODE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SSUBACCOUNTCODE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1SACCOUNTCODE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SACCOUNTCODE'
          Options.Editing = False
          Width = 83
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SDESCRIPTION'
          Options.Editing = False
          Position.BandIndex = 1
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WMESSAGE1ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WMESSAGE1ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WMESSAGE2ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WMESSAGE2ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WMESSAGE3ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WMESSAGE3ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1FINVOICEDISCOUNT: TcxGridDBBandedColumn
          DataBinding.FieldName = 'FINVOICEDISCOUNT'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WDELADDRESS1ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WDELADDRESS1ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WDELADDRESS2ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WDELADDRESS2ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WDELADDRESS3ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WDELADDRESS3ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WPOSTAL1ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WPOSTAL1ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 12
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WPOSTAL2ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WPOSTAL2ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 13
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WPOSTAL3ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WPOSTAL3ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 14
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WPOSTALCODEID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WPOSTALCODEID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 15
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WDELCODEID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WDELCODEID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 16
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WACCOUNTID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WACCOUNTID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 17
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WSALESMANID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WSALESMANID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 18
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WCURRENCYID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WCURRENCYID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 19
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WPAYMENTTYPEID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WPAYMENTTYPEID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 20
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1BPOSTED: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BPOSTED'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 21
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1BPRINTED: TcxGridDBBandedColumn
          DataBinding.FieldName = 'BPRINTED'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 22
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WUSERID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WUSERID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 23
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1SREFERENCE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SREFERENCE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 24
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1DDUEDATE: TcxGridDBBandedColumn
          DataBinding.FieldName = 'DDUEDATE'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 25
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WREPORTINGGROUP1ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WREPORTINGGROUP1ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 26
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WREPORTINGGROUP2ID'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 27
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WTERMS: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WTERMS'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 28
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WPOSTALNAME: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WPOSTALNAME'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 29
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WPOSTALCONTACT: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WPOSTALCONTACT'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 30
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WDELNAME: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WDELNAME'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 31
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WDELCONTACT: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WDELCONTACT'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 32
          Position.RowIndex = 0
        end
        object cxGrid1DBBandedTableView1WTAXNUMBER: TcxGridDBBandedColumn
          DataBinding.FieldName = 'WTAXNUMBER'
          Visible = False
          VisibleForCustomization = False
          Position.BandIndex = 0
          Position.ColIndex = 33
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBBandedTableView1
      end
    end
  end
  object Panel2: TPanel
    Left = 492
    Top = 0
    Width = 427
    Height = 522
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 359
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 425
      Height = 13
      Align = alTop
      Alignment = taCenter
      Caption = 'Invoices to Repeat'
      ExplicitWidth = 90
    end
    object Panel3: TPanel
      Left = 1
      Top = 446
      Width = 425
      Height = 75
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 357
      object Bevel1: TBevel
        Left = 0
        Top = 28
        Width = 189
        Height = 11
        Shape = bsBottomLine
      end
      object BtnCancel: TBitBtn
        Left = 144
        Top = 46
        Width = 97
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
        TabOrder = 0
      end
      object BtnGenerate: TBitBtn
        Left = 14
        Top = 45
        Width = 109
        Height = 25
        Caption = 'Generate'
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
        TabOrder = 1
        OnClick = BtnGenerateClick
      end
      object btnPubliPost: TBitBtn
        Left = 14
        Top = 4
        Width = 108
        Height = 25
        Caption = '&Options'
        DoubleBuffered = True
        Enabled = False
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = btnPubliPostClick
      end
    end
    object lvRepeating: TcxListView
      Left = 1
      Top = 14
      Width = 425
      Height = 432
      Align = alClient
      Columns = <
        item
          Caption = 'Invoice No'
          Width = 65
        end
        item
          Caption = 'Debtor'
          Width = 70
        end
        item
          Caption = 'Date'
        end
        item
          Caption = 'N'
          Width = 30
        end
        item
          Caption = 'From Debtor'
        end
        item
          Caption = 'ToDebtor'
        end>
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      SortType = stBoth
      TabOrder = 1
      ViewStyle = vsReport
      OnDblClick = btnPubliPostClick
      OnEnter = lvRepeatingEnter
      OnSelectItem = lvRepeatingSelectItem
      ExplicitWidth = 357
    end
    object PnlPrg: TPanel
      Left = 108
      Top = 250
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
    Left = 94
    Top = 352
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
  object dsDocHead: TDataSource
    DataSet = qryDocHead
    Left = 268
    Top = 272
  end
  object tblAccount: TUniTable
    TableName = 'Account'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    FilterSQL = 'WaccountTypeid = 1'
    AutoCalcFields = False
    IndexFieldNames = 'SACCOUNTCODE Asc'
    Left = 356
    Top = 189
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
  object UniUpdateSQL1: TUniUpdateSQL
    ModifySQL.Strings = (
      'UPDATE DOCHEAD'
      'SET'
      
        '  WDOCID = :WDOCID, SDOCNO = :SDOCNO, DDATE = :DDATE, WACCOUNTID' +
        ' = :WACCOUNTID, WPAYMENTTYPEID = :WPAYMENTTYPEID, WPOSTAL1ID = :' +
        'WPOSTAL1ID, WPOSTAL2ID = :WPOSTAL2ID, WPOSTAL3ID = :WPOSTAL3ID, ' +
        'WPOSTALCODEID = :WPOSTALCODEID, WMESSAGE1ID = :WMESSAGE1ID, WMES' +
        'SAGE2ID = :WMESSAGE2ID, WMESSAGE3ID = :WMESSAGE3ID, FINVOICEDISC' +
        'OUNT = :FINVOICEDISCOUNT, WSALESMANID = :WSALESMANID, SREFERENCE' +
        ' = :SREFERENCE, WDELADDRESS1ID = :WDELADDRESS1ID, WDELADDRESS2ID' +
        ' = :WDELADDRESS2ID, WDELADDRESS3ID = :WDELADDRESS3ID, WDELCODEID' +
        ' = :WDELCODEID, BPRINTED = :BPRINTED, BPOSTED = :BPOSTED, WREPOR' +
        'TINGGROUP1ID = :WREPORTINGGROUP1ID, WREPORTINGGROUP2ID = :WREPOR' +
        'TINGGROUP2ID, WCURRENCYID = :WCURRENCYID, BREPEATING = :BREPEATI' +
        'NG, WTERMS = :WTERMS, DDUEDATE = :DDUEDATE, WUSERID = :WUSERID, ' +
        'WPOSTALNAME = :WPOSTALNAME, WPOSTALCONTACT = :WPOSTALCONTACT, WD' +
        'ELNAME = :WDELNAME, WDELCONTACT = :WDELCONTACT, WTAXNUMBER = :WT' +
        'AXNUMBER'
      'WHERE'
      '  WDOCID = :Old_WDOCID')
    Left = 136
    Top = 376
  end
  object dsAccounts: TDataSource
    DataSet = tblAccount
    Left = 420
    Top = 121
  end
end
