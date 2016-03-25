object fmPosReportOptions: TfmPosReportOptions
  Left = 299
  Top = 194
  Width = 475
  Height = 481
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Pos Report Options'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 413
    Width = 467
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      467
      34)
    object BtnOk: TBitBtn
      Left = 263
      Top = 6
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Ok'
      TabOrder = 0
      OnClick = BtnOkClick
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
    end
    object BtnCancel: TBitBtn
      Left = 361
      Top = 6
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = BtnCancelClick
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
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 413
    Align = alClient
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 1
      Top = 101
      Width = 465
      Height = 311
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DSCashup
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <
          item
            Links = <>
            SummaryItems = <
              item
                Format = '0'
                Kind = skSum
                FieldName = 'value1'
                Column = cxGrid1DBTableView1value1
              end>
          end
          item
            Links = <>
            SummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'value2'
                Column = cxGrid1DBTableView1value2
              end>
          end>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        object cxGrid1DBTableView1id: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          SortIndex = 0
          SortOrder = soAscending
          Width = 88
        end
        object cxGrid1DBTableView1user: TcxGridDBColumn
          DataBinding.FieldName = 'user'
          Visible = False
          GroupIndex = 0
          Width = 150
        end
        object cxGrid1DBTableView1cashname: TcxGridDBColumn
          Caption = 'Type'
          DataBinding.FieldName = 'cashname'
          Width = 150
        end
        object cxGrid1DBTableView1value1: TcxGridDBColumn
          Caption = 'count'
          DataBinding.FieldName = 'value1'
          Width = 100
        end
        object cxGrid1DBTableView1value2: TcxGridDBColumn
          Caption = 'Total'
          DataBinding.FieldName = 'value2'
          Width = 108
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 465
      Height = 100
      Align = alTop
      TabOrder = 1
      object BGReports: TGroupBox
        Left = 8
        Top = 8
        Width = 169
        Height = 85
        Caption = 'Reports'
        TabOrder = 0
        object Rpts0: TRadioButton
          Left = 10
          Top = 20
          Width = 113
          Height = 17
          Caption = 'Cashup Report'
          TabOrder = 0
        end
        object Rpts1: TRadioButton
          Left = 10
          Top = 48
          Width = 113
          Height = 17
          Caption = 'Sales Report'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
      end
      object bPrint: TBitBtn
        Left = 184
        Top = 12
        Width = 113
        Height = 25
        Caption = 'Print'
        TabOrder = 1
        OnClick = bPrintClick
      end
    end
  end
  object vtCashup: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'user'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'cashname'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'value1'
        DataType = ftFloat
      end
      item
        Name = 'value2'
        DataType = ftFloat
      end
      item
        Name = 'value3'
        DataType = ftFloat
      end>
    Left = 136
    Top = 201
    Data = {
      0300060002006964030000000000000004007573657201009600000000000800
      636173686E616D650100960000000000060076616C7565310600000000000000
      060076616C7565320600000000000000060076616C7565330600000000000000
      000000000000}
    object vtCashupid: TIntegerField
      FieldName = 'id'
    end
    object vtCashupuser: TStringField
      FieldName = 'user'
      Size = 150
    end
    object vtCashupcashname: TStringField
      FieldName = 'cashname'
      Size = 150
    end
    object vtCashupvalue1: TFloatField
      FieldName = 'value1'
    end
    object vtCashupvalue2: TFloatField
      FieldName = 'value2'
    end
    object vtCashupvalue3: TFloatField
      FieldName = 'value3'
    end
  end
  object DSCashup: TDataSource
    DataSet = vtCashup
    Left = 224
    Top = 233
  end
end
