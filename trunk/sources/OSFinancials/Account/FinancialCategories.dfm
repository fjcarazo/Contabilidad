object fmFinancialCategories: TfmFinancialCategories
  Left = 266
  Top = 190
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Financial Categories'
  ClientHeight = 540
  ClientWidth = 710
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
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    710
    540)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 506
    Width = 710
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnCancel: TBitBtn
      Left = 399
      Top = 6
      Width = 96
      Height = 25
      Caption = '&Close'
      TabOrder = 0
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
    object BitBtn1: TBitBtn
      Left = 293
      Top = 6
      Width = 96
      Height = 25
      Caption = '&Reset'
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F4E8E7E6D1D1D0C0BCB7D7
        CFC2F8F7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFB
        DCDCDCA9A298926F3299630298610198610196640ABBA06FF7F5F0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFCFBFBD5D5D59884639B63019A620199620198610298
        62029A62019A6302A47523EDE7DCFFFFFFFFFFFFFFFFFFFFFFFFE0DFDD9C8E75
        9E66039C6503B28A42E2D7C3FAF8F5F0EBE2B7A4839A660A9C6604D5C2A0FFFF
        FFFFFFFFFFFFFFFFFFFFC1C0BEA16B0DA06805BB9654FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE0D5C2D6CCBBFCFBFBFFFFFFFFFFFFFFFFFFFFFFFF9D8F76A56C08
        A57011F6F2ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDADADAA5977DDECF
        B4FFFFFFFFFFFFFFFFFF987D4DA9710BC09A55FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE1DFDDA29886AA700AA97211E6DBC7FFFFFFFFFFFF9B7C46AE740D
        CBAA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E2E0AAA397AD740FAE730DAE74
        0DAF7A1BEEE5D4FFFFFF9C855CB27910C19649FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF5F4F2B79E6F9D8252B17810B1770FC69F59D4B886FEFEFEABA293B77C12
        B47A11ECE1CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DFDDA19071B77C12B67F
        1EFBF9F6FFFFFFFFFFFFEBEAE8AC7F2DBB8014BD892CEAE1D1FFFFFFFFFFFFF8
        F7F6E0DFDCA8A091B98018BA7F14D3B682FFFFFFFFFFFFFFFFFFFFFFFFCEC7B9
        BA811ABD8216BB8117A38755A7997FA39377A58345BE8315BD8216C3923AFBF9
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD4C1BE8A2CC18518C18519C18518C1
        8519C18518C08418C89A47F5F0E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBF9F5DEC69ACFA65AC69335C8983FD4AE6AE3D1B2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object BtPanel: TPanel
    Left = 4
    Top = 3
    Width = 699
    Height = 71
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    DesignSize = (
      699
      71)
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 234
      Height = 13
      Caption = 'Select categories and allocate appropriate groups'
      OnClick = BitBtn1Click
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 18
      Width = 689
      Height = 47
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object sbAssests: TSpeedButton
        Left = 6
        Top = 12
        Width = 103
        Height = 27
        GroupIndex = 2
        Caption = '&Assets'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 33023
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sbAssestsClick
      end
      object sbCapital: TSpeedButton
        Left = 115
        Top = 12
        Width = 103
        Height = 27
        GroupIndex = 2
        Caption = '&Capital'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sbCapitalClick
      end
      object sbExpenses: TSpeedButton
        Left = 225
        Top = 12
        Width = 103
        Height = 27
        GroupIndex = 2
        Caption = '&Expenses'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sbExpensesClick
      end
      object sbLiabilities: TSpeedButton
        Left = 334
        Top = 12
        Width = 103
        Height = 27
        GroupIndex = 2
        Caption = '&Income'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sbLiabilitiesClick
      end
      object sbNexpenses: TSpeedButton
        Left = 444
        Top = 12
        Width = 103
        Height = 27
        GroupIndex = 2
        Caption = '&Liabilities'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16711808
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = sbNexpensesClick
      end
    end
  end
  object ListView1: TcxListView
    Left = 3
    Top = 73
    Width = 282
    Height = 432
    Anchors = [akLeft, akTop, akBottom]
    Columns = <
      item
        AutoSize = True
        Caption = 'Groups'
      end>
    HideSelection = False
    MultiSelect = True
    ParentShowHint = False
    ReadOnly = True
    RowSelect = True
    ShowHint = True
    SortType = stText
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = BtnAdd1Click
  end
  object BtnAdd1: TBitBtn
    Left = 292
    Top = 118
    Width = 96
    Height = 25
    Caption = '&Add'
    TabOrder = 3
    OnClick = BtnAdd1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF93753EC7B18BFCFBFAFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906B2D
      986101A17526DDCEB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF926D2D9B64029B65039A6402AF8B4AEEE6D8FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF936F2E
      9F66049F66049F66049F67049C6708C3A774F9F6F0FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF96702FA26905A16A07A26906A16A07A26905A1
      6A06A3721BD5C09CFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF987230
      A66D09A66D09A66D09A66D09A66D09A66D09A66D09A56C09AF8337E7DAC4FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF9B7432AA710BAA720CAA710BAA720CAA710BAA
      720CAA710BAA720CAA710BA86F0BBD9B5DF5EFE5FFFFFFFFFFFFFFFFFF9C7733
      AE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAB73
      0DC4A05FFFFFFFFFFFFFFFFFFFA07934B2780FB27910B2780FB27910B2780FB2
      7910B2780FB27910B0770FB7872FE5D4B6FFFFFFFFFFFFFFFFFFFFFFFFA27B35
      B67B11B67B11B67B11B67B11B67B11B67B11B57B11B47E1BD9BF90FDFCFAFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFA47D36B97F14B98015B97F14B98015B97E14B6
      7C12CEAA6AF7F2E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA67E37
      BD8116BD8116BD8116BA8015C69947EFE3CEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFA78038BF8418BE8317C08C2BE4D0AAFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1883D
      BF851DD8BA83FBF9F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFDEC496FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphRight
  end
  object BtnRem1: TBitBtn
    Left = 292
    Top = 154
    Width = 96
    Height = 25
    Caption = '&Remove'
    TabOrder = 4
    OnClick = BtnRem1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFDFCFCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAC7B18B93753EFCFBFBFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDCEB5A175
      26986101906B2DFCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFEEE6D8AF8B4A9A64029B65039B6402926D2DFCFBFBFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F0C3A7749C67089F67049F66049F66
      049F6604936F2EFCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED5C09CA3
      721BA16A06A26905A16A07A26906A16A07A2690596702FFCFBFBFFFFFFFFFFFF
      FFFFFFFFFFFFE7DAC4AF8337A56C09A66D09A66D09A66D09A66D09A66D09A66D
      09A66D09987230FCFCFBFFFFFFFFFFFFF5EFE5BD9B5DA86F0BAA710BAA720CAA
      710BAA720CAA710BAA720CAA710BAA720CAA710B9B7432FCFCFBFFFFFFFFFFFF
      C4A05FAB730DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE74
      0DAE740D9C7733FCFCFBFFFFFFFFFFFFFFFFFFE5D4B6B7872FB0770FB27910B2
      780FB27910B2780FB27910B2780FB27910B2780FA07934FCFCFBFFFFFFFFFFFF
      FFFFFFFFFFFFFDFCFAD9BF90B47E1BB57B11B67B11B67B11B67B11B67B11B67B
      11B67B11A27B35FCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F2E9CE
      AA6AB67C12B97E14B98015B97F14B98015B97F14A47D36FCFCFBFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE3CEC69947BA8015BD8116BD81
      16BD8116A67E37FCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE4D0AAC08C2BBE8317BF8418A78038FCFCFBFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9F5D8BA
      83BF851DB1883DFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EEE2DEC496FFFFFF}
  end
  object ListView2: TcxListView
    Left = 392
    Top = 77
    Width = 310
    Height = 424
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        AutoSize = True
        Caption = 'Selected'
      end>
    HideSelection = False
    MultiSelect = True
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    RowSelect = True
    ShowHint = True
    SortType = stText
    TabOrder = 5
    ViewStyle = vsReport
    OnDblClick = BtnRem1Click
  end
  object ImageList1: TImageList
    Left = 52
    Top = 333
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC00000000000000F000FF7F0000FF7F
      C000FFFFFFFFFFFF0000FFFFFFFFFFFF00000000000000000000FF7F00000000
      0000FFFFFFFFFFFF0000FFFFFFFFFFFF000000000000FFFF0000000000000000
      00010000FFFFFFFF00030800000004000007000006000000001F000004000800
      007F00000000000001FF5E200000000000000000000000000000000000000000
      000000000000}
  end
end
