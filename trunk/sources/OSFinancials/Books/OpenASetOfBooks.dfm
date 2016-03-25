object fmOpenASetOfBooks: TfmOpenASetOfBooks
  Left = 273
  Top = 237
  BorderIcons = [biSystemMenu]
  Caption = 'Set of books'
  ClientHeight = 439
  ClientWidth = 391
  Color = clBtnFace
  Constraints.MinHeight = 248
  Constraints.MinWidth = 206
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 366
    Width = 391
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnDblClick = ButtonPanelDblClick
    DesignSize = (
      391
      73)
    object LLook: TLabel
      Left = 0
      Top = 0
      Width = 391
      Height = 16
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 3
    end
    object BtnCancel: TBitBtn
      Left = 294
      Top = 43
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
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnClick = btnCancelClick
      OnKeyPress = FormKeyPress
    end
    object BtnOpen: TBitBtn
      Left = 188
      Top = 43
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Open'
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
      TabOrder = 1
      OnClick = btnOpenClick
      OnKeyPress = FormKeyPress
    end
    object cbAutoOpen: TcxCheckBox
      Left = 12
      Top = 20
      Caption = 'Auto open when starting osFinancials'
      TabOrder = 2
      Transparent = True
      Width = 205
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 391
    Height = 366
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 129
      Top = 0
      Width = 262
      Height = 366
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = btnOpenClick
        NavigatorButtons.ConfirmDelete = False
        OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
        DataController.DataSource = DSBooks
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skCount
            FieldName = 'bookname'
            Column = cxGrid1DBTableView1bookname
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.HeaderEndEllipsis = True
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        object cxGrid1DBTableView1bookname: TcxGridDBColumn
          DataBinding.FieldName = 'bookname'
          Width = 255
        end
        object cxGrid1DBTableView1database: TcxGridDBColumn
          DataBinding.FieldName = 'database'
          Visible = False
          VisibleForCustomization = False
        end
        object cxGrid1DBTableView1server: TcxGridDBColumn
          DataBinding.FieldName = 'server'
          Visible = False
          VisibleForCustomization = False
        end
        object cxGrid1DBTableView1id: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          Visible = False
          VisibleForCustomization = False
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object fcOutlookBar2: TPanel
      Left = 0
      Top = 0
      Width = 129
      Height = 366
      Align = alLeft
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        129
        366)
      object bbrowse: TSpeedButton
        Left = 12
        Top = 8
        Width = 105
        Height = 69
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Browse'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = ABrowseExecute
      end
      object BPurge: TSpeedButton
        Left = 12
        Top = 84
        Width = 105
        Height = 77
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Purge List'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = APurgeListExecute
      end
      object bprop: TSpeedButton
        Left = 12
        Top = 168
        Width = 105
        Height = 77
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Properties'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = APropertiesExecute
      end
      object badd: TSpeedButton
        Left = 12
        Top = 252
        Width = 105
        Height = 77
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Add'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Layout = blGlyphTop
        ParentFont = False
        OnClick = AAddExecute
      end
    end
  end
  object DSBooks: TDataSource
    DataSet = cdBooks
    Left = 45
    Top = 280
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 340
    object Purgeinvalide1: TMenuItem
      Caption = 'Purge invalide'
      OnClick = Purgeinvalide1Click
    end
    object Purgenonlocal1: TMenuItem
      Caption = 'Purge non local'
      OnClick = Purgenonlocal1Click
    end
  end
  object TDoOpen: TTimer
    Enabled = False
    Interval = 400
    OnTimer = TDoOpenTimer
    Left = 136
    Top = 284
  end
  object pmoptions: TPopupMenu
    Left = 124
    Top = 248
    object Findasetofbooks1: TMenuItem
      Caption = 'Find a set of books'
      OnClick = Findasetofbooks1Click
    end
    object Createanewsetofbooks1: TMenuItem
      Caption = 'Create a new set of books'
      OnClick = Createanewsetofbooks1Click
    end
  end
  object cdBooks: TVirtualTable
    Active = True
    IndexFieldNames = 'bookname CIS'
    FieldDefs = <
      item
        Name = 'bookname'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'database'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'server'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    Left = 304
    Top = 56
    Data = {
      030004000800626F6F6B6E616D65010014000000000008006461746162617365
      0100E8030000000006007365727665720100FA00000000000200696403000000
      00000000000000000000}
    object cdBooksbookname: TStringField
      DisplayLabel = 'Bookname'
      DisplayWidth = 50
      FieldName = 'bookname'
    end
    object cdBooksdatabase: TStringField
      FieldName = 'database'
      Visible = False
      Size = 1000
    end
    object cdBooksserver: TStringField
      FieldName = 'server'
      Visible = False
      Size = 250
    end
    object cdBooksid: TIntegerField
      FieldName = 'id'
      Visible = False
    end
  end
  object ActionList1: TActionList
    Images = fmMain.ilbandlarge
    Left = 272
    Top = 128
    object ABrowse: TAction
      Caption = 'Browse'
      ImageIndex = 4
      OnExecute = ABrowseExecute
    end
    object APurgeList: TAction
      Caption = 'Purge List'
      ImageIndex = 68
      OnExecute = APurgeListExecute
    end
    object AProperties: TAction
      Caption = 'Properties'
      ImageIndex = 29
      OnExecute = APropertiesExecute
    end
    object AAdd: TAction
      Caption = 'Add'
      ImageIndex = 67
      OnExecute = AAddExecute
    end
  end
end
