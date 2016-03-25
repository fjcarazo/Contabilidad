object fmBatchOptions: TfmBatchOptions
  Left = 660
  Top = 146
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Options for this batch'
  ClientHeight = 312
  ClientWidth = 502
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 278
    Width = 502
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    UseDockManager = False
    TabOrder = 0
    TabStop = True
    object LCashBook: TLabel
      Left = 6
      Top = 10
      Width = 55
      Height = 13
      Caption = 'LCashBook'
    end
    object BtnOk: TBitBtn
      Left = 268
      Top = 4
      Width = 105
      Height = 25
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
      ModalResult = 6
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnOkClick
    end
    object BtnCancel: TBitBtn
      Left = 384
      Top = 4
      Width = 103
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
      OnClick = btnCancelClick
    end
  end
  object PCMain: TPageControl
    Left = 0
    Top = 0
    Width = 502
    Height = 278
    ActivePage = TSAdvanced
    Align = alClient
    TabOrder = 1
    object TSStandard: TTabSheet
      Caption = 'Standard'
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 74
        Height = 13
        Caption = 'Contra Account'
      end
      object edtContraAccount: TEdit
        Left = 166
        Top = 12
        Width = 116
        Height = 21
        TabOrder = 0
        OnExit = edtContraAccountExit
        OnKeyPress = edtContraAccountKeyPress
      end
      object DBCheckBox1: TDBCheckBox
        Left = 8
        Top = 100
        Width = 170
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Contra Account per Line'
        DataField = 'BContraPerLine'
        DataSource = dmDatabase.dsBatchTypes
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnKeyPress = edtContraAccountKeyPress
      end
      object DBCheckBox2: TDBCheckBox
        Left = 8
        Top = 60
        Width = 170
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Increment Reference number ?'
        DataField = 'BIncrementRefNo'
        DataSource = dmDatabase.dsBatchTypes
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnKeyPress = edtContraAccountKeyPress
      end
      object DBCheckBox4: TDBCheckBox
        Left = 288
        Top = 100
        Width = 200
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Repeat Details ?'
        DataField = 'BRepeatDetails'
        DataSource = dmDatabase.dsBatchTypes
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnKeyPress = edtContraAccountKeyPress
      end
      object DBCheckBox5: TDBCheckBox
        Left = 8
        Top = 80
        Width = 170
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Consolidate Balancing'
        DataField = 'BConsolidateBalancing'
        DataSource = dmDatabase.dsBatchTypes
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnKeyPress = edtContraAccountKeyPress
      end
      object DBCheckBox3: TDBCheckBox
        Left = 288
        Top = 80
        Width = 200
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Inclusive mode ?'
        DataField = 'BInclusiveMode'
        DataSource = dmDatabase.dsBatchTypes
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnKeyPress = edtContraAccountKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 126
        Width = 481
        Height = 43
        Caption = 'Amount Entry'
        TabOrder = 8
        TabStop = True
        OnEnter = GroupBox1Enter
        OnExit = GroupBox1Exit
        object ItemIndex0: TRadioButton
          Left = 15
          Top = 16
          Width = 79
          Height = 17
          Caption = 'Allow Both'
          TabOrder = 0
          TabStop = True
          OnKeyPress = edtContraAccountKeyPress
        end
        object ItemIndex1: TRadioButton
          Left = 146
          Top = 16
          Width = 75
          Height = 17
          Caption = 'Debit'
          TabOrder = 1
          TabStop = True
          OnKeyPress = edtContraAccountKeyPress
        end
        object ItemIndex2: TRadioButton
          Left = 254
          Top = 16
          Width = 71
          Height = 17
          Caption = ' Credit'
          TabOrder = 2
          TabStop = True
          OnKeyPress = edtContraAccountKeyPress
        end
      end
      object CBNoTax: TCheckBox
        Left = 8
        Top = 40
        Width = 170
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Disable tax'
        TabOrder = 2
      end
      object BitBtn1: TBitBtn
        Left = 282
        Top = 12
        Width = 24
        Height = 19
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
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object cbOpeningbal: TCheckBox
        Left = 9
        Top = 176
        Width = 240
        Height = 20
        Caption = 'Openingbal this year'
        TabOrder = 9
      end
    end
    object TSAdvanced: TTabSheet
      Caption = 'Advanced'
      ImageIndex = 1
      object Ldefcostcenter: TLabel
        Left = 218
        Top = 108
        Width = 96
        Height = 13
        Caption = 'Default costcenter 1'
      end
      object CDAlwayBalance: TCheckBox
        Left = 8
        Top = 4
        Width = 170
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Always balance'
        TabOrder = 0
      end
      object RGAccountCodeType: TRadioGroup
        Left = 8
        Top = 127
        Width = 481
        Height = 50
        Caption = 'Account code lookup type'
        Columns = 3
        Items.Strings = (
          'All'
          'General ledgers'
          'Debitors'
          'Creditors'
          'Ledgers Special'
          'Openitems')
        TabOrder = 1
      end
      object RGContraAccountCodeType: TRadioGroup
        Left = 8
        Top = 190
        Width = 481
        Height = 50
        Caption = 'Contra account code lookup type'
        Columns = 3
        Items.Strings = (
          'All'
          'General ledgers'
          'Debitors'
          'Creditors'
          'Ledgers Special')
        TabOrder = 2
      end
      object CBRememberTax: TCheckBox
        Left = 216
        Top = 4
        Width = 264
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Remember tax on con.acc'
        TabOrder = 3
      end
      object CBNOOpenItemBatch: TCheckBox
        Left = 8
        Top = 24
        Width = 170
        Height = 16
        Alignment = taLeftJustify
        Caption = 'Not open item batch'
        TabOrder = 4
      end
      object CBRemeberContraOnAcc: TCheckBox
        Left = 216
        Top = 24
        Width = 264
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Remember contra on acc'
        TabOrder = 5
      end
      object CBAutoIncNum: TCheckBox
        Left = 8
        Top = 44
        Width = 170
        Height = 16
        Alignment = taLeftJustify
        Caption = 'Remember inc'
        TabOrder = 6
      end
      object CBUseSingleMode: TCheckBox
        Left = 216
        Top = 44
        Width = 264
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Single line mode'
        TabOrder = 7
      end
      object cbAutoAlias: TCheckBox
        Left = 8
        Top = 64
        Width = 170
        Height = 16
        Alignment = taLeftJustify
        Caption = 'Auto alias'
        TabOrder = 8
      end
      object cbCostCenter: TCheckBox
        Left = 216
        Top = 84
        Width = 264
        Height = 19
        Alignment = taLeftJustify
        Caption = 'Costcenters'
        TabOrder = 9
      end
      object cbProjects: TCheckBox
        Left = 216
        Top = 64
        Width = 264
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Projects'
        TabOrder = 10
      end
      object cbAccountLookupOnly: TCheckBox
        Left = 8
        Top = 84
        Width = 170
        Height = 16
        Alignment = taLeftJustify
        Caption = 'Only look in account for search'
        TabOrder = 11
      end
      object cbDefcost: TComboBox
        Left = 357
        Top = 104
        Width = 125
        Height = 21
        Style = csDropDownList
        TabOrder = 12
      end
    end
  end
end
