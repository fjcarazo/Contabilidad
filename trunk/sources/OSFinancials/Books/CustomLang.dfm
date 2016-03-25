object fmCustomLang: TfmCustomLang
  Left = 430
  Top = 184
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Customize Languages'
  ClientHeight = 660
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 626
    Width = 1113
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    PopupMenu = PopupMenu1
    TabOrder = 0
    DesignSize = (
      1113
      34)
    object BtnClose: TBitBtn
      Left = 1015
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
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
      OnClick = BtnCloseClick
    end
    object btnDelete: TBitBtn
      Left = 919
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Delete'
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
      Visible = False
      OnClick = btnDeleteClick
    end
    object BExportToTab: TButton
      Left = 11
      Top = 3
      Width = 86
      Height = 25
      Hint = 'Tab delimites export'
      Caption = 'ExportToTab'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BExportToTabClick
    end
    object Button4: TButton
      Left = 104
      Top = 4
      Width = 97
      Height = 25
      Hint = 'Tab delimited import'
      Caption = 'ImportFromTab'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 350
    Width = 1113
    Height = 276
    Align = alBottom
    TabOrder = 1
    object Label5: TLabel
      Left = 1
      Top = 1
      Width = 1111
      Height = 17
      Align = alTop
      AutoSize = False
      Color = clBtnShadow
      ParentColor = False
      ExplicitWidth = 1119
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 18
      Width = 1111
      Height = 257
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Edit labels'
        DesignSize = (
          1103
          229)
        object Shape3: TShape
          Left = 8
          Top = 4
          Width = 657
          Height = 81
          Anchors = [akLeft, akTop, akRight, akBottom]
          Brush.Color = clBtnShadow
        end
        object Label3: TLabel
          Left = 16
          Top = 11
          Width = 79
          Height = 13
          Caption = 'Translation (Edit)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object dbedtEdit: TDBMemo
          Left = 16
          Top = 27
          Width = 644
          Height = 54
          Anchors = [akLeft, akTop, akRight, akBottom]
          BorderStyle = bsNone
          DataField = 'TRANSLATION'
          DataSource = dsCustLanguage
          TabOrder = 0
          WantReturns = False
          OnKeyUp = dbedtEditKeyUp
        end
        object Panel3: TPanel
          Left = 0
          Top = 88
          Width = 1103
          Height = 141
          Align = alBottom
          TabOrder = 1
          DesignSize = (
            1103
            141)
          object Label8: TLabel
            Left = 473
            Top = 19
            Width = 26
            Height = 13
            Caption = 'EMail'
            Transparent = True
          end
          object Label9: TLabel
            Left = 473
            Top = 55
            Width = 28
            Height = 13
            Caption = 'Name'
            Transparent = True
          end
          object Shape4: TShape
            Left = 8
            Top = 5
            Width = 1092
            Height = 136
            Anchors = [akLeft, akTop, akRight, akBottom]
            Brush.Color = clBtnShadow
            ExplicitWidth = 1100
          end
          object Edit3: TEdit
            Left = 24
            Top = 79
            Width = 237
            Height = 21
            TabOrder = 0
            OnChange = Edit3Change
          end
          object CBFindSame: TCheckBox
            Left = 24
            Top = 105
            Width = 147
            Height = 17
            Caption = 'Find unchanged'
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            OnClick = CBFindSameClick
          end
          object RadioGroup1: TRadioGroup
            Left = 24
            Top = 16
            Width = 161
            Height = 57
            Caption = 'Search in'
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'This language'
              'English')
            ParentColor = False
            ParentFont = False
            TabOrder = 2
            OnClick = RadioGroup1Click
          end
          object GroupBox1: TGroupBox
            Left = 270
            Top = 8
            Width = 193
            Height = 129
            Caption = 'Search and replace(exact text)'
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 3
            object Label7: TLabel
              Left = 8
              Top = 57
              Width = 57
              Height = 13
              Caption = 'replace with'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label6: TLabel
              Left = 8
              Top = 17
              Width = 49
              Height = 13
              Caption = 'Search for'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Button2: TButton
              Left = 8
              Top = 95
              Width = 169
              Height = 22
              Caption = 'Go'
              TabOrder = 0
              OnClick = Button2Click
            end
            object EReplaceWith: TEdit
              Left = 7
              Top = 71
              Width = 169
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object EReplace: TEdit
              Left = 7
              Top = 31
              Width = 170
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
          object Button1: TButton
            Left = 472
            Top = 96
            Width = 193
            Height = 33
            Caption = 'Email your language file to us'
            TabOrder = 4
            OnClick = Button1Click
          end
          object EYourname: TEdit
            Left = 472
            Top = 68
            Width = 121
            Height = 21
            TabOrder = 5
            Text = 'Yourname'
          end
          object EYourmail: TEdit
            Left = 472
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 6
            Text = 'Yourmail'
          end
          object cbFindChanged: TCheckBox
            Left = 24
            Top = 121
            Width = 147
            Height = 17
            Caption = 'Find changed'
            Color = clBtnShadow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 7
            OnClick = CBFindSameClick
          end
        end
        object Panel4: TPanel
          Left = 665
          Top = 0
          Width = 438
          Height = 88
          Align = alRight
          TabOrder = 2
          DesignSize = (
            438
            88)
          object Shape5: TShape
            Left = 9
            Top = 4
            Width = 315
            Height = 81
            Anchors = [akLeft, akTop, akRight, akBottom]
            Brush.Color = clBtnShadow
          end
          object Label2: TLabel
            Left = 18
            Top = 11
            Width = 77
            Height = 13
            Caption = 'Default (English)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object DBMemo1: TDBMemo
            Left = 15
            Top = 27
            Width = 304
            Height = 53
            BorderStyle = bsNone
            DataField = 'ENGTEXT'
            DataSource = dsCustLanguage
            TabOrder = 0
            WantReturns = False
            OnEnter = DBMemo1Enter
          end
        end
      end
      object TsTypes: TTabSheet
        Caption = 'Types'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid4: TcxGrid
          Left = 0
          Top = 0
          Width = 313
          Height = 229
          Align = alLeft
          TabOrder = 0
          object cxGrid4DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsTypes
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
            object cxGrid4DBTableView1WTYPEID: TcxGridDBColumn
              DataBinding.FieldName = 'WTYPEID'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGrid4DBTableView1SDESCRIPTION: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'SDESCRIPTION'
            end
            object cxGrid4DBTableView1WTYPEPARENT: TcxGridDBColumn
              DataBinding.FieldName = 'WTYPEPARENT'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object cxGrid4Level1: TcxGridLevel
            GridView = cxGrid4DBTableView1
          end
        end
        object cxGrid5: TcxGrid
          Left = 321
          Top = 0
          Width = 782
          Height = 229
          Align = alClient
          TabOrder = 1
          object cxGridDBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DataSource2
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            object cxGridDBColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'WACCOUNTID'
              Visible = False
            end
            object cxGridDBColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'WLANGUAGEID'
              Options.Editing = False
            end
            object cxGridDBColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'SDESCRIPTION'
            end
          end
          object cxGridDBCardView1: TcxGridDBCardView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DataSource1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            OptionsView.CardAutoWidth = True
            OptionsView.CellAutoHeight = True
            Styles.StyleSheet = dmQuantumGridDefs.GridCardViewStyleSheetWindowsStandard
            object cxGridDBCardViewRow1: TcxGridDBCardViewRow
              Caption = 'Language'
              DataBinding.FieldName = 'WLANGUAGEID'
              Options.Editing = False
              Position.BeginsLayer = True
            end
            object cxGridDBCardViewRow2: TcxGridDBCardViewRow
              Caption = 'Description'
              DataBinding.FieldName = 'SDESCRIPTION'
              Position.BeginsLayer = False
              Position.LineCount = 2
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBCardView1
          end
        end
        object cxSplitter3: TcxSplitter
          Left = 313
          Top = 0
          Width = 8
          Height = 229
          Control = cxGrid4
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Rest'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid2: TcxGrid
          Left = 586
          Top = 53
          Width = 517
          Height = 176
          Align = alRight
          TabOrder = 0
          object cxGrid2DBCardView1: TcxGridDBCardView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DataSource3
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            OptionsView.CardAutoWidth = True
            Styles.StyleSheet = dmQuantumGridDefs.GridCardViewStyleSheetWindowsStandard
            object cxGrid2DBCardView1WGROUPID: TcxGridDBCardViewRow
              DataBinding.FieldName = 'WGROUPID'
              Visible = False
              Position.BeginsLayer = True
              VisibleForCustomization = False
            end
            object cxGrid2DBCardView1WLANGUAGEID: TcxGridDBCardViewRow
              Caption = 'Language'
              DataBinding.FieldName = 'WLANGUAGEID'
              Options.Editing = False
              Position.BeginsLayer = True
            end
            object cxGrid2DBCardView1SDESCRIPTION: TcxGridDBCardViewRow
              Caption = 'Description'
              DataBinding.FieldName = 'SDESCRIPTION'
              Position.BeginsLayer = False
              Position.LineCount = 2
            end
            object cxGrid2DBCardView1WGROUPDESCID: TcxGridDBCardViewRow
              DataBinding.FieldName = 'WGROUPDESCID'
              Visible = False
              Position.BeginsLayer = True
              VisibleForCustomization = False
            end
          end
          object cxGrid2Level1: TcxGridLevel
            GridView = cxGrid2DBCardView1
          end
        end
        object cxSplitter2: TcxSplitter
          Left = 577
          Top = 53
          Width = 9
          Height = 176
          AlignSplitter = salRight
          Control = cxGrid2
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 53
          Align = alTop
          TabOrder = 2
          object Label10: TLabel
            Left = 4
            Top = 8
            Width = 132
            Height = 13
            Caption = 'Description of Zero account'
          end
          object Label11: TLabel
            Left = 336
            Top = 8
            Width = 107
            Height = 13
            Caption = 'Groups empty account'
          end
          object EDescofEmptyAccount: TEdit
            Left = 4
            Top = 20
            Width = 209
            Height = 21
            TabOrder = 0
            Text = 'EDescofEmptyAccount'
          end
          object Button3: TButton
            Left = 216
            Top = 16
            Width = 75
            Height = 25
            Caption = 'change'
            TabOrder = 1
            OnClick = Button3Click
          end
          object EDescofEmptyGroup: TEdit
            Left = 336
            Top = 24
            Width = 209
            Height = 21
            TabOrder = 2
            Text = 'EDescofEmptyAccount'
          end
          object Button5: TButton
            Left = 548
            Top = 20
            Width = 75
            Height = 25
            Caption = 'change'
            TabOrder = 3
            OnClick = Button5Click
          end
        end
        object cxGrid3: TcxGrid
          Left = 0
          Top = 53
          Width = 577
          Height = 176
          Align = alClient
          TabOrder = 3
          object cxGrid3DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DataSource2
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            object cxGrid3DBTableView1WACCOUNTID: TcxGridDBColumn
              DataBinding.FieldName = 'WACCOUNTID'
              Visible = False
            end
            object cxGrid3DBTableView1WLANGUAGEID: TcxGridDBColumn
              DataBinding.FieldName = 'WLANGUAGEID'
              Options.Editing = False
            end
            object cxGrid3DBTableView1SDESCRIPTION: TcxGridDBColumn
              DataBinding.FieldName = 'SDESCRIPTION'
            end
          end
          object cxGrid3DBCardView1: TcxGridDBCardView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DataSource2
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Inserting = False
            OptionsView.CardAutoWidth = True
            Styles.StyleSheet = dmQuantumGridDefs.GridCardViewStyleSheetWindowsStandard
            object cxGrid3DBCardView1WLANGUAGEID: TcxGridDBCardViewRow
              Caption = 'Language'
              DataBinding.FieldName = 'WLANGUAGEID'
              Options.Editing = False
              Position.BeginsLayer = True
            end
            object cxGrid3DBCardView1SDESCRIPTION: TcxGridDBCardViewRow
              Caption = 'Description'
              DataBinding.FieldName = 'SDESCRIPTION'
              Position.BeginsLayer = False
              Position.LineCount = 2
            end
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = cxGrid3DBCardView1
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1113
    Height = 41
    Align = alTop
    TabOrder = 2
    DesignSize = (
      1113
      41)
    object Shape2: TShape
      Left = 5
      Top = 4
      Width = 270
      Height = 31
      Brush.Color = clBtnShadow
      Shape = stRoundRect
    end
    object Label4: TLabel
      Left = 15
      Top = 12
      Width = 84
      Height = 13
      Caption = 'Select Language:'
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Shape1: TShape
      Left = 892
      Top = 4
      Width = 219
      Height = 31
      Anchors = [akTop, akRight]
      Brush.Color = clBtnShadow
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 280
      Top = 13
      Width = 134
      Height = 13
      Caption = '<- Use this as new language'
    end
    object DbcbSelect: TComboBox
      Left = 147
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = DbcbSelectChange
    end
    object bttCreat: TButton
      Left = 1033
      Top = 7
      Width = 73
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'Create'
      TabOrder = 1
      OnClick = bttCreatClick
    end
    object edtNewLang: TEdit
      Left = 898
      Top = 8
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 10
      TabOrder = 2
      Text = 'New Lang'
    end
    object BReloadUseCodePage: TButton
      Left = 455
      Top = 10
      Width = 127
      Height = 25
      Caption = 'reload usingcodepage'
      TabOrder = 3
      OnClick = BReloadUseCodePageClick
    end
    object ECodepage: TEdit
      Left = 597
      Top = 14
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '1253'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 1113
    Height = 295
    Align = alClient
    TabOrder = 3
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyPress = dbGridLanguageKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCustLanguage
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          FieldName = 'TRANSLATION'
          Column = cxGrid1DBTableView1TRANSLATION
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          FieldName = 'ID'
          Column = cxGrid1DBTableView1ID
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Options.Editing = False
        Width = 63
      end
      object cxGrid1DBTableView1TRANSLATION: TcxGridDBColumn
        DataBinding.FieldName = 'TRANSLATION'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 307
      end
      object cxGrid1DBTableView1ENGTEXT: TcxGridDBColumn
        DataBinding.FieldName = 'ENGTEXT'
        Options.Editing = False
        Width = 322
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 336
    Width = 1113
    Height = 14
    AlignSplitter = salBottom
    Control = Panel1
  end
  object dsCustLanguage: TDataSource
    DataSet = CDSTranslation
    Left = 94
    Top = 108
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Button55Click
    Left = 264
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Left = 481
    Top = 325
    object CheckAddAll1: TMenuItem
      Caption = 'CheckAddAll'
      OnClick = CheckAddAll1Click
    end
    object Findunchanged1: TMenuItem
      Caption = 'Find unchanged'
      OnClick = Findunchanged1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 72
    Top = 232
  end
  object SaveDialog1: TSaveDialog
    Left = 136
    Top = 216
  end
  object ZTypes: TUniTable
    TableName = 'Types'
    DataTypeMap = <>
    AfterInsert = ZTypesAfterInsert
    AfterScroll = ZTypesAfterScroll
    Left = 365
    Top = 232
    object ZTypesWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
    end
    object ZTypesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object ZTypesWTYPEPARENT: TIntegerField
      FieldName = 'WTYPEPARENT'
    end
  end
  object dsTypes: TDataSource
    DataSet = ZTypes
    Left = 477
    Top = 220
  end
  object ZQTypesTrns: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from types_translate where wtypeid = :WTYPEID')
    Left = 481
    Top = 271
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WTYPEID'
      end>
    object ZQTypesTrnsWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
    end
    object ZQTypesTrnsWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
      OnGetText = ZQTypesTrnsWLANGUAGEIDGetText
    end
    object ZQTypesTrnsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQTypesTrns
    Left = 260
    Top = 172
  end
  object ZQAccTrns: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from account_translate where waccountid = 0')
    AfterOpen = ZQAccTrnsAfterOpen
    Left = 473
    Top = 123
    object ZQAccTrnsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQAccTrnsWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
      OnGetText = ZQAccTrnsWLANGUAGEIDGetText
    end
    object ZQAccTrnsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 255
    end
  end
  object DataSource2: TDataSource
    DataSet = ZQAccTrns
    Left = 260
    Top = 228
  end
  object ZQGroupstrn: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from GROUPS_DESCRIPTIONS where wgroupid = 0')
    AfterOpen = ZQGroupstrnAfterOpen
    AfterInsert = ZQGroupstrnAfterInsert
    Left = 477
    Top = 171
    object ZQGroupstrnWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQGroupstrnWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
      OnGetText = ZQAccTrnsWLANGUAGEIDGetText
    end
    object ZQGroupstrnSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Required = True
      Size = 50
    end
    object ZQGroupstrnWGROUPDESCID: TIntegerField
      FieldName = 'WGROUPDESCID'
      Required = True
    end
  end
  object DataSource3: TDataSource
    DataSet = ZQGroupstrn
    Left = 336
    Top = 176
  end
  object CDSTranslation: TVirtualTable
    Active = True
    BeforeInsert = CDSTranslationBeforeInsert
    AfterInsert = CDSTranslationAfterInsert
    BeforePost = CDSTranslationBeforePost
    BeforeDelete = CDSTranslationBeforeDelete
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'TRANSLATION'
        DataType = ftWideString
        Size = 1500
      end
      item
        Name = 'ENGTEXT'
        DataType = ftWideString
        Size = 1500
      end>
    Left = 360
    Top = 104
    Data = {
      030003000200494403000000000000000B005452414E534C4154494F4E1800DC
      05000000000700454E47544558541800DC0500000000000000000000}
    object CDSTranslationID: TIntegerField
      FieldName = 'ID'
    end
    object CDSTranslationTRANSLATION: TWideStringField
      FieldName = 'TRANSLATION'
      Size = 1500
    end
    object CDSTranslationENGTEXT: TWideStringField
      FieldName = 'ENGTEXT'
      Size = 1500
    end
  end
end
