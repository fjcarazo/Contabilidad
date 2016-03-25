object fmPosInvoiceEntry: TfmPosInvoiceEntry
  Left = 122
  Top = 143
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'POS Invoice Entry'
  ClientHeight = 653
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 893
    Height = 653
    Align = alClient
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 0
      Top = 159
      Width = 889
      Height = 409
      Align = alClient
      TabOrder = 11
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        OnKeyPress = dbgrdPosEntryKeyPress
        OnKeyUp = dbgrdPosEntryKeyUp
        OnMouseMove = dbgrdPosEntryMouseMove
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dmDatabase.dsBatch
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        object cxGrid1DBTableView1WLINEID: TcxGridDBColumn
          DataBinding.FieldName = 'WLINEID'
          Options.Editing = False
          Options.Filtering = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Sorting = False
        end
        object cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn
          DataBinding.FieldName = 'SREFERENCE'
          PropertiesClassName = 'TcxButtonEditProperties'
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Properties.OnButtonClick = cxGrid1DBTableView1SREFERENCEPropertiesButtonClick
          Options.Filtering = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Sorting = False
        end
        object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'SDESCRIPTION'
          Options.Filtering = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Sorting = False
        end
        object cxGrid1DBTableView1SACCOUNT: TcxGridDBColumn
          DataBinding.FieldName = 'SACCOUNT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;,0.00-'
          Properties.EditFormat = '0.00#####; 0.00#####-'
          Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
          Options.Filtering = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Sorting = False
        end
        object cxGrid1DBTableView1FDEBIT: TcxGridDBColumn
          DataBinding.FieldName = 'FDEBIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.#####; 0.#####-'
          Properties.EditFormat = '0.#####; 0.#####-'
          Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
          Options.Filtering = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Sorting = False
        end
        object cxGrid1DBTableView1FCREDIT: TcxGridDBColumn
          DataBinding.FieldName = 'FCREDIT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '% 0.####;% 0.####-'
          Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
          Options.Filtering = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Sorting = False
        end
        object cxGrid1DBTableView1FAMOUNT: TcxGridDBColumn
          DataBinding.FieldName = 'FAMOUNT'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.00;,0.00-'
          Properties.EditFormat = '0.00;0.00-'
          Options.Editing = False
          Options.Filtering = False
          Options.GroupFooters = False
          Options.Grouping = False
          Options.Sorting = False
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 889
      Height = 74
      ButtonHeight = 68
      ButtonWidth = 76
      Caption = 'ToolBar1'
      DisabledImages = dmOsfResource.BatchDisabledButtons
      DrawingStyle = dsGradient
      Images = dmOsfResource.BatchEnabledButtons
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      OnMouseMove = dbgrdPosEntryMouseMove
      object tblSearch: TToolButton
        Left = 0
        Top = 0
        AutoSize = True
        Caption = 'F3: &Lookup'
        ImageIndex = 12
        OnClick = tblSearchClick
      end
      object tblDeleteLine: TToolButton
        Left = 65
        Top = 0
        AutoSize = True
        Caption = '^D: Delete'
        ImageIndex = 0
        OnClick = tblDeleteLineClick
      end
      object tblEdit: TToolButton
        Left = 127
        Top = 0
        AutoSize = True
        Caption = 'F2: Edit'
        ImageIndex = 31
        OnClick = tblEditClick
      end
      object tblCustomer: TToolButton
        Left = 182
        Top = 0
        AutoSize = True
        Caption = 'F5:&Customer'
        ImageIndex = 20
        OnClick = tblCustomerClick
      end
      object tlbFloat: TToolButton
        Left = 252
        Top = 0
        AutoSize = True
        Caption = 'F8: &Float'
        ImageIndex = 3
        OnClick = tlbFloatClick
      end
      object ToolButton7: TToolButton
        Left = 307
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tlbPayments: TToolButton
        Left = 315
        Top = 0
        AutoSize = True
        Caption = 'F9:&Payment'
        ImageIndex = 32
        OnClick = tlbPaymentsClick
      end
      object ToolButton8: TToolButton
        Left = 382
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object tlbDeleteAll: TToolButton
        Left = 390
        Top = 0
        AutoSize = True
        Caption = 'F10: Delete All'
        ImageIndex = 10
        OnClick = tlbDeleteAllClick
      end
      object tblProcess: TToolButton
        Left = 470
        Top = 0
        AutoSize = True
        Caption = '^P: Process'
        DropdownMenu = PopupMenu1
        ImageIndex = 6
        Style = tbsDropDown
        OnMouseMove = tblProcessMouseMove
      end
      object ToolButton3: TToolButton
        Left = 551
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object Invoice: TToolButton
        Left = 559
        Top = 0
        Caption = 'Invoice'
        ImageIndex = 33
        OnClick = InvoiceClick
      end
      object TSavelist: TToolButton
        Left = 635
        Top = 0
        Caption = 'Save/load'
        ImageIndex = 34
        OnClick = TSavelistClick
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 74
      Width = 889
      Height = 85
      Align = alTop
      Color = clBlack
      TabOrder = 1
      object PosLcd: TLCDLabel
        Left = 2
        Top = 2
        Width = 790
        Height = 81
        Caption = 'New invoice'
        DotMatrix = mat5x8
        PixelSize = pix2x2
        PixelSpacing = 1
        PixelWidth = 2
        PixelHeight = 2
        CharSpacing = 2
        LineSpacing = 2
        BorderSpace = 3
        TextLines = 3
        NoOfChars = 49
        BackGround = clBlack
        BorderStyle = frNone
        PixelOn = clLime
        PixelOff = 4737096
      end
    end
    object StatusBar: TStatusBar
      Left = 0
      Top = 630
      Width = 889
      Height = 19
      Panels = <
        item
          Width = 110
        end
        item
          Width = 200
        end
        item
          Width = 50
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 568
      Width = 889
      Height = 62
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        889
        62)
      object Shape2: TShape
        Left = 205
        Top = 0
        Width = 294
        Height = 26
      end
      object Shape1: TShape
        Left = 1
        Top = 0
        Width = 205
        Height = 26
      end
      object Label2: TLabel
        Left = 6
        Top = 7
        Width = 40
        Height = 13
        Caption = 'Barcode'
        Transparent = True
      end
      object Label1: TLabel
        Left = 210
        Top = 8
        Width = 47
        Height = 13
        Caption = 'Customer '
        Transparent = True
      end
      object lblCustName: TLabel
        Left = 262
        Top = 8
        Width = 59
        Height = 13
        Caption = 'lblCustName'
        Transparent = True
      end
      object Shape4: TShape
        Left = 499
        Top = 0
        Width = 402
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        ExplicitWidth = 392
      end
      object LSalesman: TLabel
        Left = 575
        Top = 27
        Width = 46
        Height = 13
        Caption = 'Salesman'
      end
      object PMultyUserDebug: TPanel
        Left = -96
        Top = 28
        Width = 649
        Height = 34
        TabOrder = 0
        object Label6: TLabel
          Left = 448
          Top = 8
          Width = 65
          Height = 13
          Caption = 'Interval in MS'
        end
        object Label7: TLabel
          Left = 200
          Top = 8
          Width = 125
          Height = 13
          Caption = 'Run till X invoice'#39's created'
        end
        object Label8: TLabel
          Left = 8
          Top = 8
          Width = 72
          Height = 13
          Caption = 'Barcode to use'
        end
        object Label9: TLabel
          Left = 368
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Current NR'
        end
        object NR: TLabel
          Left = 424
          Top = 8
          Width = 6
          Height = 13
          Caption = '0'
        end
        object BStartStop: TButton
          Left = 600
          Top = 5
          Width = 43
          Height = 25
          Caption = 'Start'
          TabOrder = 0
          OnClick = BStartStopClick
        end
        object ETimerInterval: TEdit
          Left = 560
          Top = 8
          Width = 33
          Height = 21
          TabOrder = 1
          Text = '5000'
        end
        object EMaxInvoices: TEdit
          Left = 328
          Top = 8
          Width = 33
          Height = 21
          TabOrder = 2
          Text = '1000'
        end
        object EBarcodeToUse: TEdit
          Left = 88
          Top = 8
          Width = 97
          Height = 21
          TabOrder = 3
          Text = '12345'
        end
      end
      object CBSalesMan: TComboBox
        Left = 575
        Top = 40
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = CBSalesManChange
      end
      object edtBarCode: TcxComboBox
        Left = 76
        Top = 4
        Properties.ImmediateDropDown = False
        Properties.IncrementalSearch = False
        Properties.Items.Strings = (
          ' ')
        Properties.OnPopup = tblSearchClick
        TabOrder = 2
        OnKeyPress = edtBarCodeKeyPress
        OnKeyUp = dtBarCodeKeyUp
        Width = 121
      end
    end
    object PnlFloat: TPanel
      Left = 48
      Top = 188
      Width = 509
      Height = 155
      TabOrder = 3
      Visible = False
      object Shape3: TShape
        Left = 4
        Top = 7
        Width = 499
        Height = 112
        Brush.Color = clBtnFace
        Pen.Style = psInsideFrame
      end
      object Label3: TLabel
        Left = 105
        Top = 66
        Width = 36
        Height = 13
        Caption = 'Amount'
      end
      object Label4: TLabel
        Left = 181
        Top = 66
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object Label5: TLabel
        Left = 8
        Top = 66
        Width = 50
        Height = 13
        Caption = 'Reference'
      end
      object LEAccountNr: TLabel
        Left = 361
        Top = 67
        Width = 40
        Height = 13
        Caption = 'Account'
        Visible = False
      end
      object Edit1: TEdit
        Left = 103
        Top = 84
        Width = 75
        Height = 21
        AutoSize = False
        TabOrder = 2
        Text = '0.00'
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 179
        Top = 84
        Width = 175
        Height = 21
        AutoSize = False
        TabOrder = 3
        OnKeyPress = Edit1KeyPress
      end
      object RGFloatMovement: TRadioGroup
        Left = 6
        Top = 8
        Width = 347
        Height = 47
        Caption = 'Float Movement'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '&In to the Drawer'
          '&Out of the Drawer')
        TabOrder = 0
      end
      object BtnOk: TBitBtn
        Left = 297
        Top = 122
        Width = 96
        Height = 25
        Caption = '&Ok'
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
        TabOrder = 4
        OnClick = BtnOkClick
        OnKeyDown = FormKeyDown
      end
      object BtnCancelFloat: TBitBtn
        Left = 400
        Top = 122
        Width = 96
        Height = 25
        Caption = 'Cancel'
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
        TabOrder = 5
        OnClick = BtnCancelFloatClick
        OnKeyDown = FormKeyDown
      end
      object Edit3: TEdit
        Left = 9
        Top = 84
        Width = 94
        Height = 21
        AutoSize = False
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
      object EAccountNr: TEdit
        Left = 360
        Top = 84
        Width = 73
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 6
        Visible = False
      end
      object CBAccountFromTo: TCheckBox
        Left = 360
        Top = 23
        Width = 129
        Height = 17
        Caption = 'To / from account'
        TabOrder = 7
        OnClick = CBAccountFromToClick
      end
      object BGetInvAmount: TButton
        Left = 361
        Top = 41
        Width = 107
        Height = 25
        Caption = 'Get invoice amount'
        TabOrder = 8
        OnClick = BGetInvAmountClick
      end
      object BAccountNr: TBitBtn
        Left = 433
        Top = 84
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
        TabOrder = 9
        Visible = False
        OnClick = BAccountNrClick
      end
    end
    object PPassword: TPanel
      Left = 168
      Top = 235
      Width = 225
      Height = 49
      TabOrder = 4
      Visible = False
      OnExit = PPasswordExit
      object Label10: TLabel
        Left = 8
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object EAdminPassword: TEdit
        Left = 8
        Top = 20
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 0
        OnKeyPress = EAdminPasswordKeyPress
      end
      object BOkpassword: TButton
        Left = 132
        Top = 19
        Width = 85
        Height = 22
        Caption = 'OK'
        TabOrder = 1
        OnClick = BOkpasswordClick
      end
    end
    object cbListSelect: TComboBox
      Left = 416
      Top = 159
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      Visible = False
    end
    object BSelectList: TButton
      Left = 560
      Top = 160
      Width = 25
      Height = 21
      Hint = 'Open'
      Caption = '>'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = False
      OnClick = BSelectListClick
    end
    object BDeleteList: TButton
      Left = 652
      Top = 160
      Width = 29
      Height = 21
      Hint = 'Delete'
      Caption = '-'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Visible = False
      OnClick = BDeleteListClick
    end
    object BRename: TButton
      Left = 620
      Top = 160
      Width = 25
      Height = 21
      Hint = 'Rename'
      Caption = '&&'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Visible = False
      OnClick = BRenameClick
    end
    object BCopy: TButton
      Left = 588
      Top = 160
      Width = 25
      Height = 21
      Hint = 'Copy'
      Caption = '#'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      Visible = False
      OnClick = BCopyClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 386
    Top = 408
    object CashUp2: TMenuItem
      Caption = '&Cash Up'
      ShortCut = 123
      OnClick = CashUp2Click
    end
    object ReprintLastInvoice1: TMenuItem
      Caption = '&Reprint Last Invoice'
      ShortCut = 16464
      OnClick = ReprintLastInvoice1Click
    end
    object CloseShift1: TMenuItem
      Caption = 'Cl&ose Shift'
      ShortCut = 16465
      OnClick = CloseShift1Click
    end
    object InclusiveExclusiveMode1: TMenuItem
      Caption = 'Incl/Excl Mode'
      ShortCut = 118
      Visible = False
    end
    object Report1: TMenuItem
      Caption = '&Report'
      ShortCut = 16466
      OnClick = Report1Click
    end
    object OpenDrawer1: TMenuItem
      Caption = '&Open Drawer'
      ShortCut = 16461
      OnClick = OpenDrawer1Click
    end
    object Recievepayemt1: TMenuItem
      Caption = 'Cash transaction'
      OnClick = tlbFloatClick
    end
    object Useweightdish1: TMenuItem
      Caption = '&Use weight dish'
      ShortCut = 122
      OnClick = Useweightdish1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 352
    Top = 308
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 48
    Top = 320
    object Adminoverride1: TMenuItem
      Caption = 'Admin override'
      OnClick = Adminoverride1Click
    end
  end
  object TimerSetPosDisplay: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerSetPosDisplayTimer
    Left = 608
    Top = 192
  end
  object TAutologout: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TAutologoutTimer
    Left = 616
    Top = 304
  end
  object ZQuery1: TUniQuery
    DataTypeMap = <>
    Left = 684
    Top = 300
  end
end
