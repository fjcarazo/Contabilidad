object fmDataIntegrityCheck: TfmDataIntegrityCheck
  Left = 337
  Top = 127
  Caption = 'Data Integrity Check'
  ClientHeight = 620
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stBar1: TStatusBar
    Left = 0
    Top = 599
    Width = 767
    Height = 21
    Panels = <>
    SimplePanel = True
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 560
    Width = 767
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BtnCheck: TBitBtn
      Left = 150
      Top = 6
      Width = 96
      Height = 25
      Caption = '&Check'
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
      OnClick = BtnCheckClick
      OnKeyPress = FormKeyPress
    end
    object BtnCancel: TBitBtn
      Left = 257
      Top = 6
      Width = 96
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
      OnKeyPress = FormKeyPress
    end
    object btnClose: TBitBtn
      Left = 364
      Top = 6
      Width = 96
      Height = 25
      Caption = '&Close'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E74747472
        7272707070767676A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA4A4A46565656666666969696767676464646262625C5C5C6B6B6BFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE5252525151515E5E5E8F8F8FB7
        B7B7AFAFAF7878784E4E4E4444445D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        5C5C5C3C3C3C626262CACACAF8F8F8FEFEFEFDFDFDF0F0F0A1A1A14242423232
        328B8B8BFFFFFFFFFFFFFFFFFFB6B6B63434343B3B3BB6B6B6FDFDFDFEFEFEFC
        FCFCFDFDFDFFFFFFF4F4F47C7C7C212121515151FFFFFFFFFFFFFFFFFF979797
        1F1F1F505050E2E2E2FBFBFBB7B7B78E8E8E9D9D9DECECECFEFEFEB6B6B62424
        24343434FFFFFFFFFFFFFFFFFF999999373737606060E7E7E7F6F6F67C7C7C22
        2222484848D8D8D8FEFEFEB9B9B93A3A3A4A4A4AFFFFFFFFFFFFFFFFFFB7B7B7
        878787898989C8C8C8F4F4F48F8F8F7272727A7A7AD7D7D7F7F7F79696966262
        62767676FFFFFFFFFFFFFFFFFFFFFFFF9090909B9B9B929292D7D7D78F8F8F8A
        8A8A868686CFCFCFBDBDBD7C7C7C717171909090FFFFFFFFFFFFFFFFFFFFFFFF
        AAAAAA9D9D9DA7A7A7A2A2A28D8D8D9C9C9C8E8E8EBCBCBC8686868383837C7C
        7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A1A19D9D9D9A9A9A8D8D8DAC
        ACAC949494B4B4B48585857E7E7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBFBFBFBFBFBF909090BABABA9D9D9DBFBFBFA8A8A8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191B6
        B6B69A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6BEBEBEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ModalResult = 1
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object BitBtn2: TBitBtn
      Left = 12
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Recalc totals'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object Bprint: TBitBtn
      Left = 476
      Top = 6
      Width = 105
      Height = 25
      Caption = 'Print'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = BprintClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 51
    Width = 767
    Height = 198
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 354
      Top = 19
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 354
      Top = 44
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label3: TLabel
      Left = 354
      Top = 71
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label4: TLabel
      Left = 354
      Top = 99
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label5: TLabel
      Left = 354
      Top = 126
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label6: TLabel
      Left = 354
      Top = 153
      Width = 32
      Height = 13
      Caption = 'Label1'
      Visible = False
    end
    object DataCheck1: TCheckBox
      Left = 14
      Top = 18
      Width = 330
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Files Corruption'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object DataCheck2: TCheckBox
      Left = 14
      Top = 43
      Width = 330
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Balances per Period'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object DataCheck3: TCheckBox
      Left = 14
      Top = 70
      Width = 330
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Count Accounts and Stock items'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object DataCheck5: TCheckBox
      Left = 14
      Top = 125
      Width = 330
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Outstanding  batches and Documents'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
    object DataCheck6: TCheckBox
      Left = 14
      Top = 152
      Width = 330
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Unposted Documents'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object DataCheck4: TCheckBox
      Left = 14
      Top = 98
      Width = 330
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Debtors and Creditors'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 51
    Align = alTop
    TabOrder = 3
    object LblT6: TLabel
      Left = 6
      Top = 4
      Width = 94
      Height = 13
      Caption = 'Select Set of Books'
    end
    object lblBooksDir: TLabel
      Left = 134
      Top = 4
      Width = 53
      Height = 13
      Caption = 'lblBooksDir'
    end
    object lblLst: TLabel
      Left = 14
      Top = 28
      Width = 42
      Height = 13
      Caption = 'From List'
    end
    object sbBrowse: TSpeedButton
      Left = 323
      Top = 18
      Width = 126
      Height = 25
      Caption = '&Browse'
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
      OnClick = sbBrowseClick
    end
    object cbBooks: TComboBox
      Left = 86
      Top = 22
      Width = 171
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = cbBooksChange
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 249
    Width = 767
    Height = 311
    Align = alClient
    TabOrder = 4
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsVtdata
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          FieldName = 'id'
          Column = cxGrid1DBTableView1id
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'amt1'
          Column = cxGrid1DBTableView1amt1
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'amt2'
          Column = cxGrid1DBTableView1amt2
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'amt3'
          Column = cxGrid1DBTableView1amt3
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          FieldName = 'id'
          Column = cxGrid1DBTableView1id
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'amt1'
          Column = cxGrid1DBTableView1amt1
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'amt2'
          Column = cxGrid1DBTableView1amt2
        end
        item
          Format = '0.00'
          Kind = skSum
          FieldName = 'amt3'
          Column = cxGrid1DBTableView1amt3
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Header = False
      Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
      object cxGrid1DBTableView1id: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        SortIndex = 0
        SortOrder = soAscending
      end
      object cxGrid1DBTableView1line1: TcxGridDBColumn
        DataBinding.FieldName = 'line1'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 500
      end
      object cxGrid1DBTableView1wtype: TcxGridDBColumn
        DataBinding.FieldName = 'wtype'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = 'Accounts'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = 'Openning Balances'
            Value = 1
          end
          item
            Description = 'Files'
            Value = 2
          end
          item
            Description = 'Trailbalance'
            Value = 3
          end
          item
            Description = 'Debtors creditors'
            Value = 4
          end
          item
            Description = 'Unposted batches'
            Value = 5
          end>
        Visible = False
        GroupIndex = 0
      end
      object cxGrid1DBTableView1amt1: TcxGridDBColumn
        DataBinding.FieldName = 'amt1'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
      end
      object cxGrid1DBTableView1amt2: TcxGridDBColumn
        DataBinding.FieldName = 'amt2'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
      end
      object cxGrid1DBTableView1amt3: TcxGridDBColumn
        DataBinding.FieldName = 'amt3'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 412
    Top = 204
  end
  object vtdata: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'line1'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'wtype'
        DataType = ftInteger
      end
      item
        Name = 'amt1'
        DataType = ftFloat
      end
      item
        Name = 'amt2'
        DataType = ftFloat
      end
      item
        Name = 'amt3'
        DataType = ftFloat
      end>
    Left = 124
    Top = 236
    Data = {
      0300060002006964030000000000000005006C696E65310100FF000000000005
      00777479706503000000000000000400616D743106000000000000000400616D
      743206000000000000000400616D74330600000000000000000000000000}
    object vtdataid: TIntegerField
      FieldName = 'id'
    end
    object vtdataline1: TStringField
      FieldName = 'line1'
      OnSetText = vtdataline1SetText
      Size = 255
    end
    object vtdatawtype: TIntegerField
      FieldName = 'wtype'
    end
    object vtdataamt1: TFloatField
      FieldName = 'amt1'
    end
    object vtdataamt2: TFloatField
      FieldName = 'amt2'
    end
    object vtdataamt3: TFloatField
      FieldName = 'amt3'
    end
  end
  object dsVtdata: TDataSource
    DataSet = vtdata
    Left = 244
    Top = 291
  end
end
