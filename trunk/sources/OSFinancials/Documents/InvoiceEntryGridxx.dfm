object fmInvoiceEntryGrid: TfmInvoiceEntryGrid
  Left = 204
  Top = 277
  Width = 763
  Height = 676
  Caption = 'Invoice Entry'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 755
    Height = 648
    Align = alClient
    TabOrder = 0
    object NBDocuments: TNotebook
      Tag = 9999
      Left = 0
      Top = 0
      Width = 749
      Height = 644
      Color = clAppWorkSpace
      ParentColor = False
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'ListDoc'
        object Panel5: TPanel
          Left = 0
          Top = 594
          Width = 749
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          Caption = '`'
          TabOrder = 0
          object Image1: TImage
            Left = 0
            Top = 0
            Width = 749
            Height = 50
            Align = alClient
            Stretch = True
          end
          object BitBtnCancel: TBitBtn
            Left = 690
            Top = 10
            Width = 96
            Height = 25
            Cancel = True
            Caption = 'Cancel'
            ModalResult = 2
            TabOrder = 0
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
            Left = 588
            Top = 10
            Width = 96
            Height = 25
            Caption = 'OK'
            ModalResult = 1
            TabOrder = 1
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
          object PMultyUserDebug: TPanel
            Left = 3
            Top = 5
            Width = 461
            Height = 40
            TabOrder = 2
            object Label8: TLabel
              Left = 296
              Top = 3
              Width = 65
              Height = 13
              Caption = 'Interval in MS'
            end
            object Label9: TLabel
              Left = 8
              Top = 3
              Width = 125
              Height = 13
              Caption = 'Run till X invoice'#39's created'
            end
            object Label11: TLabel
              Left = 176
              Top = 3
              Width = 53
              Height = 13
              Caption = 'Current NR'
            end
            object NR: TLabel
              Left = 232
              Top = 3
              Width = 6
              Height = 13
              Caption = '0'
            end
            object BStartStop: TButton
              Left = 408
              Top = 4
              Width = 43
              Height = 19
              Caption = 'Start'
              TabOrder = 0
            end
            object ETimerInterval: TEdit
              Left = 368
              Top = 3
              Width = 33
              Height = 21
              TabOrder = 1
              Text = '5000'
            end
            object EMaxInvoices: TEdit
              Left = 136
              Top = 2
              Width = 33
              Height = 21
              TabOrder = 2
              Text = '1000'
            end
            object CheckBox1: TCheckBox
              Left = 8
              Top = 19
              Width = 185
              Height = 17
              Caption = 'CreateDebtorCreditor'
              TabOrder = 3
            end
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 749
          Height = 594
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 3
          Caption = '`'
          Color = clGray
          TabOrder = 1
          object Panel2: TPanel
            Left = 3
            Top = 3
            Width = 143
            Height = 588
            Align = alLeft
            BevelOuter = bvNone
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            object Label7: TLabel
              Left = 6
              Top = 13
              Width = 49
              Height = 13
              Caption = 'Document'
              Color = clActiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBtnText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object cbDocTypenew: TwwDBComboBox
              Left = 5
              Top = 29
              Width = 130
              Height = 19
              ShowButton = True
              Style = csDropDownList
              MapList = False
              AllowClearKey = False
              DropDownCount = 8
              ItemHeight = 0
              Sorted = False
              TabOrder = 0
              UnboundDataType = wwDefault
            end
            object Panel4: TPanel
              Left = 0
              Top = 71
              Width = 146
              Height = 426
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              DesignSize = (
                146
                426)
              object lblPrnType: TLabel
                Left = 4
                Top = 360
                Width = 57
                Height = 13
                Anchors = [akLeft, akBottom]
                Caption = 'Layout file 2'
                Color = clBlue
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBtnText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object DestLbl: TLabel
                Left = 5
                Top = 241
                Width = 74
                Height = 13
                Anchors = [akLeft, akBottom]
                Caption = 'Send report To:'
                Color = clBlue
                FocusControl = cbDestination
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBtnText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object lblCopies: TLabel
                Left = 98
                Top = 285
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Anchors = [akLeft, akBottom]
                Caption = 'Copies :'
                Color = clBlue
                FocusControl = edtCount
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBtnText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object Label20: TLabel
                Left = 6
                Top = 199
                Width = 48
                Height = 13
                Anchors = [akLeft, akBottom]
                Caption = 'Layout file'
                Color = clBlue
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBtnText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object BNew: TButton
                Left = 4
                Top = 0
                Width = 130
                Height = 23
                Caption = 'New'
                TabOrder = 0
                OnClick = BNewClick
              end
              object BEdit: TButton
                Left = 4
                Top = 30
                Width = 130
                Height = 26
                Caption = 'Edit'
                TabOrder = 1
                OnClick = BEditClick
              end
              object BPrint: TButton
                Left = 4
                Top = 62
                Width = 130
                Height = 26
                Caption = 'Print'
                TabOrder = 2
                OnClick = BPrintClick
              end
              object CBDocLayout2: TComboBox
                Left = 3
                Top = 378
                Width = 130
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akBottom]
                ItemHeight = 13
                TabOrder = 3
              end
              object cbDestination: TComboBox
                Left = 5
                Top = 259
                Width = 130
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akBottom]
                ItemHeight = 13
                TabOrder = 4
                Items.Strings = (
                  'Screen'
                  'Printer'
                  'File'
                  'E-mail')
              end
              object edtCount: TEdit
                Left = 88
                Top = 307
                Width = 33
                Height = 19
                Anchors = [akLeft, akBottom]
                TabOrder = 5
                Text = '1'
              end
              object UpDown1: TUpDown
                Left = 73
                Top = 307
                Width = 16
                Height = 19
                Anchors = [akLeft, akBottom]
                Min = 1
                Max = 32767
                Position = 1
                TabOrder = 6
              end
              object BitSetPrint: TBitBtn
                Left = 5
                Top = 330
                Width = 130
                Height = 25
                Anchors = [akLeft, akBottom]
                Caption = '&Printer Setup'
                TabOrder = 7
                TabStop = False
                OnClick = BitSetPrintClick
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  0800000000000001000000000000000000000001000000010000000000004141
                  4100524E4D0053504E0052525200595554005F5A59005D5D5D0065605F006363
                  6300696665006E6866006C6C6C00776D6700767373007777770082777300807E
                  7D004573870042778E0073AAB50078AFB50079B1B7007BB2B8007DB3B9007EB5
                  BB007FB5BC0064C2CF0068C5CF0075CCD50078CED60079CFD8004FC2EB0051C3
                  EB0052C4EB0052C5ED0054C5ED005BC6ED005FC8EE005AC8F00077F1F6007FF5
                  F600878787008F8D8B00998F8B009E928E009D948F0093919000989594009D9A
                  99009D9D9D00A1959100A3989400A59A9600A19E9E00A89D9900A1A29400A5A3
                  A200A9A7A700A7A2AB00A9A9A900AEAAAA00B5A9A600B2AFAF00B3B0AF00BCB3
                  AF00B5B2B100B7B5B400B9B6B600BCB6B500C4B6B200C0BCBC0086C180002312
                  A50082CFD50084CFD7008FCED50090CED50085D1D80093D0D80084CDEF0080F2
                  F60089F5F60090F6F6009CF4F600A5F6F600C4C2C200C8C5C400CECCCC00D0CE
                  CC00D7CFCE00D7D5D500E0D5D100EAE5E200ECE7E500F4F2F100F6F6F5000000
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
                  00000000000000000000000000000000000000000000FFFFFF00FFFFFF121212
                  12121212121212FFFFFFFFFFFF12544F4D4D4D4C4C5512FFFFFFFFFFFF12524E
                  4B4B4B4B4B5212FFFFFFFF343312281F1E1D1D1D1D29123334FF2E4610121B1C
                  1C1C1C1C1C1C130D462E2E5C412C2C2C2C2C2C2C2C2C2C3E5C2E335D5D5D5D5D
                  5D5D5D5D5D5D5D5D5D33345F5F57444444444344433F475F5F34345F5B0B0403
                  03030302020308585F37375F5908010101010101010105565F373759440E0401
                  010101010101053B493C34463E373A312A0E0B0807070A38483CFF33332E3C3B
                  3B3B312E2E2B113334FFFFFFFF12191919191915151512FFFFFFFFFFFF125252
                  52525252522912FFFFFFFFFFFF12121212121212121212FFFFFF}
              end
              object BProcess: TButton
                Left = 4
                Top = 95
                Width = 130
                Height = 26
                Caption = 'Process'
                TabOrder = 8
                OnClick = BProcessClick
              end
              object BDelete: TButton
                Left = 4
                Top = 126
                Width = 130
                Height = 26
                Caption = 'Delete'
                TabOrder = 9
                OnClick = BDeleteClick
              end
              object CBDocLayout: TComboBox
                Left = 6
                Top = 217
                Width = 128
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akBottom]
                ItemHeight = 13
                TabOrder = 10
              end
              object BtnClose2: TButton
                Left = 4
                Top = 158
                Width = 130
                Height = 26
                Caption = 'Close'
                TabOrder = 11
                OnClick = BtnClose2Click
              end
            end
          end
          object Panel7: TPanel
            Left = 146
            Top = 3
            Width = 600
            Height = 588
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel7'
            Color = clAppWorkSpace
            TabOrder = 1
            object DBGSearch: TDBGrid
              Left = 0
              Top = 71
              Width = 600
              Height = 517
              Align = alClient
              DataSource = DSDocHead
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              PopupMenu = PopupMenu2
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'SACCOUNTCODE'
                  Title.Caption = 'Account code'
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SACCOUNTDESCRIPTION'
                  Title.Caption = 'Account Description'
                  Width = 158
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SDOCNO'
                  Title.Caption = 'DocNo'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SREFERENCE'
                  Title.Caption = 'Reference'
                  Width = 86
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FDOCAMOUNT'
                  Title.Caption = 'DocAmount'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXCAMOUNT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FTAXAMOUNT'
                  Title.Caption = 'TaxAmount'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DDATE'
                  Title.Caption = 'Date'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SGROUP1DESC'
                  Title.Caption = 'Group1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SGROUP2DESC'
                  Title.Caption = 'Group2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SSALESMANDESCRIPTION'
                  Title.Caption = 'Salesman'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BPRINTED'
                  Title.Caption = 'Printed'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OPENAMOUNT'
                  Title.Caption = 'Openamount'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DDUEDATE'
                  Title.Caption = 'Duedate'
                  Visible = True
                end>
            end
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 600
              Height = 71
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 1
              object LField: TLabel
                Left = 9
                Top = 4
                Width = 22
                Height = 13
                Caption = 'Field'
              end
              object LFilterValue: TLabel
                Left = 258
                Top = 4
                Width = 55
                Height = 13
                Caption = 'LFilterValue'
              end
              object CBFindColumn: TComboBox
                Left = 9
                Top = 20
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 0
              end
              object CBOperatot: TComboBox
                Left = 180
                Top = 20
                Width = 57
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 1
                Text = 'Like'
                Items.Strings = (
                  'Like'
                  '='
                  '<'
                  '>'
                  '<='
                  '>='
                  '<>')
              end
              object EFilterValue: TEdit
                Left = 258
                Top = 20
                Width = 129
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
              end
              object BFilter: TButton
                Left = 390
                Top = 20
                Width = 67
                Height = 21
                Caption = 'Filter'
                TabOrder = 3
                OnClick = BFilterClick
              end
              object BClear: TButton
                Left = 464
                Top = 20
                Width = 65
                Height = 21
                Caption = 'Clear'
                TabOrder = 4
                OnClick = BClearClick
              end
              object cbViewUnPosted2: TComboBox
                Left = 9
                Top = 42
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 5
                Text = 'Posted'
                Items.Strings = (
                  'Posted'
                  'Unposted'
                  'All')
              end
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DocHead'
        object Splitter1: TSplitter
          Left = 0
          Top = 249
          Width = 749
          Height = 5
          Cursor = crVSplit
          Align = alTop
        end
        object pnlDocLines: TPanel
          Left = 0
          Top = 254
          Width = 749
          Height = 256
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel3: TPanel
            Left = 0
            Top = 74
            Width = 749
            Height = 182
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              749
              182)
            object dbgridInvoice: TwwDBGrid
              Left = 0
              Top = 0
              Width = 749
              Height = 182
              DisableThemes = True
              DisableThemesInTitle = True
              LineStyle = glsSingle
              ControlInfoInDataset = False
              Selected.Strings = (
                'SReference'#9'20'#9'Item No'#9'F'
                'SDescription'#9'26'#9'Description'#9'F'
                'SACCOUNT'#9'10'#9'Order'#9'F'
                'SCONTRAACCOUNT'#9'10'#9'Ship'#9'F'
                'WREPORTINGGROUP1ID'#9'13'#9'Costgroup1'#9'F'
                'WREPORTINGGROUP2ID'#9'13'#9'Costgroup2'#9'F'
                'STAX'#9'8'#9'Tax'#9'T'
                'FDEBIT'#9'10'#9'Excl Amt'
                'FTaxAmount'#9'10'#9'Disc %'
                'FCREDIT'#9'10'#9'Incl Amt')
              MemoAttributes = [mSizeable, mWordWrap, mGridShow]
              IniAttributes.Delimiter = ';'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsBatch
              EditCalculated = True
              KeyOptions = [dgEnterToTab, dgAllowInsert]
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint, dgFixedResizable, dgFixedEditable]
              PopupMenu = PopupMenu1
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 1
              TitleButtons = False
              UseTFields = False
              LineColors.DataColor = clGray
              LineColors.ShadowColor = clBtnHighlight
              FooterColor = clBackground
              FooterCellColor = clBackground
              object dbgridInvoiceIButton: TwwIButton
                Left = 0
                Top = 0
                Width = 11
                Height = 18
                AllowAllUp = True
              end
            end
            object PnlCopy: TPanel
              Left = 122
              Top = 25
              Width = 731
              Height = 198
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelInner = bvLowered
              TabOrder = 2
              Visible = False
              DesignSize = (
                731
                198)
              object BtnCopyCancel: TBitBtn
                Left = 542
                Top = 162
                Width = 85
                Height = 25
                Anchors = [akRight, akBottom]
                Cancel = True
                Caption = 'Cancel'
                TabOrder = 0
                TabStop = False
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
              object BtnCopyOk: TBitBtn
                Left = 636
                Top = 162
                Width = 85
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = '&OK'
                TabOrder = 1
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
              object grdCopy: TwwDBGrid
                Left = 10
                Top = 8
                Width = 707
                Height = 144
                ControlInfoInDataset = False
                Selected.Strings = (
                  'SDocNo'#9'15'#9'Invoice Number'#9'F'
                  'DDate'#9'10'#9'Date'#9'F'
                  'SDescription'#9'20'#9'Debtor'#9'F'
                  'WDocID'#9'0'#9'WdocID'#9'F'
                  'SReference'#9'15'#9'Reference'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataSource = dmDatabase.dsDocHead
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                TabOrder = 2
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                TitleLines = 1
                TitleButtons = True
                UseTFields = False
              end
              object ECopyFilter: TEdit
                Left = 11
                Top = 161
                Width = 95
                Height = 21
                Anchors = [akLeft, akBottom]
                TabOrder = 3
              end
              object BCopyFilter: TButton
                Left = 329
                Top = 162
                Width = 97
                Height = 25
                Anchors = [akLeft, akBottom]
                Caption = 'Filter'
                TabOrder = 4
              end
              object CBOnlyThisDebtor: TCheckBox
                Left = 136
                Top = 155
                Width = 161
                Height = 21
                Alignment = taLeftJustify
                Anchors = [akLeft, akBottom]
                Caption = 'Only this debtor'
                Checked = True
                State = cbChecked
                TabOrder = 5
              end
              object CBAllDocuments: TCheckBox
                Left = 136
                Top = 171
                Width = 161
                Height = 21
                Alignment = taLeftJustify
                Anchors = [akLeft, akBottom]
                Caption = 'All documents'
                TabOrder = 6
              end
            end
            object PnlComment: TPanel
              Left = 33
              Top = 21
              Width = 729
              Height = 192
              Anchors = [akLeft, akTop, akRight, akBottom]
              BevelInner = bvLowered
              DragMode = dmAutomatic
              TabOrder = 1
              Visible = False
              DesignSize = (
                729
                192)
              object Label6: TLabel
                Left = 18
                Top = 6
                Width = 105
                Height = 13
                Caption = '&Comment Line Invoice'
                FocusControl = EdComment
              end
              object BtnCancel: TBitBtn
                Left = 535
                Top = 162
                Width = 86
                Height = 25
                Anchors = [akRight, akBottom]
                Cancel = True
                Caption = 'Cancel'
                TabOrder = 2
                TabStop = False
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
              object BtnOk: TBitBtn
                Left = 630
                Top = 163
                Width = 87
                Height = 23
                Anchors = [akRight, akBottom]
                Caption = '&OK'
                TabOrder = 1
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
              object EdComment: TRichEdit
                Left = 18
                Top = 20
                Width = 694
                Height = 128
                Anchors = [akLeft, akTop, akRight, akBottom]
                Lines.Strings = (
                  '')
                MaxLength = 290
                ScrollBars = ssBoth
                TabOrder = 0
                WordWrap = False
              end
            end
            object PriceList: TValueListEditor
              Left = 356
              Top = 26
              Width = 182
              Height = 67
              TabStop = False
              Color = clMoneyGreen
              DefaultRowHeight = 15
              Options = [goVertLine, goDrawFocusSelected, goColSizing, goThumbTracking]
              ScrollBars = ssNone
              Strings.Strings = (
                'Selling Price 1=0.00'
                'Selling Price 2=0.00'
                'Selling Price 3=0.00')
              TabOrder = 3
              TitleCaptions.Strings = (
                'Price Name'
                'Value')
              Visible = False
              ColWidths = (
                97
                79)
            end
            object PNewTotal: TPanel
              Left = 192
              Top = 46
              Width = 211
              Height = 36
              BevelInner = bvLowered
              TabOrder = 4
              Visible = False
              object Label10: TLabel
                Left = 7
                Top = 12
                Width = 88
                Height = 13
                Alignment = taRightJustify
                Caption = 'Enter new inc total'
              end
              object ENewTotal: TEdit
                Left = 101
                Top = 8
                Width = 97
                Height = 21
                TabOrder = 0
              end
            end
            object DBLCBCostgroup1: TDBLookupComboBox
              Left = 624
              Top = 56
              Width = 145
              Height = 21
              DataField = 'WREPORTINGGROUP1ID'
              DataSource = dsBatch
              DropDownWidth = 150
              KeyField = 'WGROUPID'
              ListField = 'SFULLDESC'
              ListSource = dsCostGroup1
              NullValueKey = 48
              TabOrder = 5
              Visible = False
            end
            object DBLCBCostgroup2: TDBLookupComboBox
              Left = 624
              Top = 24
              Width = 145
              Height = 21
              DataField = 'WREPORTINGGROUP2ID'
              DataSource = dsBatch
              DropDownWidth = 150
              KeyField = 'WGROUPID'
              ListField = 'SFULLDESC'
              ListSource = dsCostGroup2
              NullValueKey = 48
              TabOrder = 6
              Visible = False
            end
          end
          object ScrollBox2: TScrollBox
            Left = 0
            Top = 0
            Width = 749
            Height = 74
            Align = alTop
            TabOrder = 1
            object ToolBar1: TToolBar
              Left = 4
              Top = 0
              Width = 573
              Height = 68
              Align = alNone
              AutoSize = True
              ButtonHeight = 68
              ButtonWidth = 79
              Caption = '`'
              EdgeBorders = []
              Flat = True
              Images = fmMain.BatchEnabledButtons
              ShowCaptions = True
              TabOrder = 0
              Transparent = True
              Wrapable = False
              object tlbtnDelete: TToolButton
                Left = 0
                Top = 0
                Hint = '^D : Delete'
                AutoSize = True
                Caption = '^D : Delete'
                ImageIndex = 0
              end
              object tlbtnInsert: TToolButton
                Left = 65
                Top = 0
                Hint = '^N : Insert'
                AutoSize = True
                Caption = '^N : Insert'
                ImageIndex = 1
              end
              object tlbtnExclIncl: TToolButton
                Left = 125
                Top = 0
                Hint = 'F7 : Exclusive'
                AutoSize = True
                Caption = 'F7 : Exclusive'
                Grouped = True
                ImageIndex = 4
                Style = tbsCheck
              end
              object tlbtnIncl: TToolButton
                Left = 202
                Top = 0
                Caption = 'F7 : Inclusive'
                Down = True
                Grouped = True
                ImageIndex = 4
                Style = tbsCheck
              end
              object tlbtnDisc: TToolButton
                Left = 281
                Top = 0
                Hint = 'F8 : Discount'
                AutoSize = True
                Caption = 'F8 : Discount'
                ImageIndex = 17
                Style = tbsCheck
              end
              object tlbtnComment: TToolButton
                Left = 355
                Top = 0
                Hint = 'F9 : Comment'
                AutoSize = True
                Caption = 'F9 : Comment'
                ImageIndex = 9
              end
              object tlbtnDeleteInv: TToolButton
                Left = 431
                Top = 0
                Hint = 'F10 : Delete All'
                AutoSize = True
                Caption = 'F10 : Delete All'
                ImageIndex = 10
              end
              object TlbtnCopy: TToolButton
                Left = 514
                Top = 0
                AutoSize = True
                Caption = 'F11: Copy'
                ImageIndex = 11
              end
            end
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 510
          Width = 749
          Height = 134
          Align = alBottom
          BevelOuter = bvNone
          Color = clBtnShadow
          PopupMenu = PMNextPrev
          TabOrder = 1
          object BtnOkPrint: TBitBtn
            Left = 636
            Top = 84
            Width = 90
            Height = 23
            Cancel = True
            Caption = 'OK'
            TabOrder = 0
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
          object BtnClose: TBitBtn
            Left = 478
            Top = 84
            Width = 90
            Height = 23
            Caption = 'Cancel'
            TabOrder = 1
            TabStop = False
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
          object StatusBar: TStatusBar
            Left = 0
            Top = 110
            Width = 749
            Height = 24
            Panels = <
              item
                Text = 'xxxx'
                Width = 150
              end
              item
                Width = 0
              end>
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 749
            Height = 80
            Align = alTop
            BevelOuter = bvNone
            Color = clBtnShadow
            PopupMenu = PMNextPrev
            TabOrder = 3
            object Label2: TLabel
              Left = 512
              Top = 12
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Exclusive Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label4: TLabel
              Left = 522
              Top = 60
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Invoice Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label1: TLabel
              Left = 515
              Top = 44
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Discount'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LblTax: TLabel
              Left = 591
              Top = 28
              Width = 95
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LblExcl: TLabel
              Left = 591
              Top = 12
              Width = 95
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LblDiscount: TLabel
              Left = 590
              Top = 44
              Width = 96
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label5: TLabel
              Left = 566
              Top = 28
              Width = 18
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tax'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label1i: TLabel
              Left = 20
              Top = 4
              Width = 32
              Height = 13
              Caption = 'Debtor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label2i: TLabel
              Left = 20
              Top = 38
              Width = 75
              Height = 13
              Caption = 'Invoice Number'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label17: TLabel
              Left = 204
              Top = 45
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Credit Limit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label18: TLabel
              Left = 212
              Top = 29
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Available'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label16: TLabel
              Left = 180
              Top = 13
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Current Balance'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label24: TLabel
              Left = 373
              Top = 12
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Gross'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label25: TLabel
              Left = 372
              Top = 28
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Netto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LNettoWeigth: TLabel
              Left = 404
              Top = 28
              Width = 95
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LGrossWeigth: TLabel
              Left = 404
              Top = 12
              Width = 95
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object lblInvAmt: TStaticText
              Left = 588
              Top = 60
              Width = 98
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = '0.00'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 0
            end
            object cbInvoiceNumber: TComboBox
              Left = 20
              Top = 51
              Width = 150
              Height = 21
              Style = csDropDownList
              Enabled = False
              ItemHeight = 13
              TabOrder = 1
            end
            object edtAccountNumber: TEdit
              Left = 20
              Top = 17
              Width = 149
              Height = 21
              Enabled = False
              ReadOnly = True
              TabOrder = 2
            end
            object lblCredLimit: TStaticText
              Left = 260
              Top = 45
              Width = 91
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = '0.00 '
              Color = clWhite
              ParentColor = False
              TabOrder = 3
            end
            object lblAvailable: TStaticText
              Left = 260
              Top = 29
              Width = 91
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = '0.00 '
              Color = clWhite
              ParentColor = False
              TabOrder = 4
            end
            object lblPostBal: TStaticText
              Left = 260
              Top = 13
              Width = 91
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = '0.00 '
              Color = clWhite
              ParentColor = False
              TabOrder = 5
            end
          end
        end
        object ScrollBox3: TScrollBox
          Left = 0
          Top = 0
          Width = 749
          Height = 249
          Align = alTop
          AutoSize = True
          BevelInner = bvNone
          BevelOuter = bvNone
          Constraints.MinHeight = 249
          TabOrder = 2
          object PMAinData: TPanel
            Left = 0
            Top = 0
            Width = 745
            Height = 243
            Align = alTop
            BevelOuter = bvNone
            PopupMenu = PMNextPrev
            TabOrder = 0
            object PnlDocHeader: TPanel
              Left = 0
              Top = 75
              Width = 745
              Height = 168
              Align = alBottom
              BevelOuter = bvNone
              Color = clBtnShadow
              TabOrder = 1
              DesignSize = (
                745
                168)
              object Label14: TLabel
                Left = 110
                Top = 8
                Width = 85
                Height = 13
                Caption = 'Postal Address'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object Label15: TLabel
                Left = 287
                Top = 8
                Width = 96
                Height = 13
                Caption = 'Delivery Address'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object Bevel1: TBevel
                Left = 7
                Top = -2
                Width = 855
                Height = 5
                Anchors = [akLeft, akTop, akRight]
                Shape = bsBottomLine
              end
              object Label19: TLabel
                Left = 467
                Top = 8
                Width = 51
                Height = 13
                Caption = 'Message'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = True
              end
              object Image3: TImage
                Left = 269
                Top = 8
                Width = 16
                Height = 16
                AutoSize = True
                Picture.Data = {
                  07544269746D617036030000424D360300000000000036000000280000001000
                  0000100000000100180000000000000300000000000000000000000000000000
                  0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
                  00000000000000000000000000000000000000000000000000000000000000FF
                  FFFFFFFFFF848484848484848484848484848484848484848484848484848484
                  848484848484848484848484000000FFFFFFFFFFFF84848400FFFFC6C6C600FF
                  FFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF848484000000FF
                  FFFFFFFFFF84848400000000FFFFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF
                  C6C6C600FFFF000000848484000000FFFFFFFFFFFF84848400FFFF00000000FF
                  FFC6C6C600FFFF00000000FFFFC6C6C600FFFF00000000FFFF848484000000FF
                  FFFFFFFFFF848484FFFFFF00FFFF00000000FFFF00000000FFFF00000000FFFF
                  00000000FFFFC6C6C6848484000000FFFFFFFFFFFF84848400FFFFC6C6C600FF
                  FF00000000FFFFC6C6C600FFFF00000000FFFFC6C6C600FFFF848484000000FF
                  FFFFFFFFFF848484FFFFFF00FFFF00000000FFFFC6C6C600FFFFC6C6C600FFFF
                  00000000FFFFC6C6C6848484000000FFFFFFFFFFFF84848400FFFF00000000FF
                  FFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF00000000FFFF848484000000FF
                  FFFFFFFFFF84848400000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
                  FFFFFF00FFFF000000848484000000FFFFFFFFFFFF8484848484848484848484
                  84848484848484848484848484848484848484848484848484848484FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF}
                Transparent = True
              end
              object Image2: TImage
                Left = 92
                Top = 8
                Width = 16
                Height = 16
                AutoSize = True
                Picture.Data = {
                  07544269746D617036030000424D360300000000000036000000280000001000
                  0000100000000100180000000000000300000000000000000000000000000000
                  0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
                  00000000000000000000000000000000000000000000000000000000000000FF
                  FFFFFFFFFF848484848484848484848484848484848484848484848484848484
                  848484848484848484848484000000FFFFFFFFFFFF84848400FFFFC6C6C600FF
                  FFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF848484000000FF
                  FFFFFFFFFF84848400000000FFFFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF
                  C6C6C600FFFF000000848484000000FFFFFFFFFFFF84848400FFFF00000000FF
                  FFC6C6C600FFFF00000000FFFFC6C6C600FFFF00000000FFFF848484000000FF
                  FFFFFFFFFF848484FFFFFF00FFFF00000000FFFF00000000FFFF00000000FFFF
                  00000000FFFFC6C6C6848484000000FFFFFFFFFFFF84848400FFFFC6C6C600FF
                  FF00000000FFFFC6C6C600FFFF00000000FFFFC6C6C600FFFF848484000000FF
                  FFFFFFFFFF848484FFFFFF00FFFF00000000FFFFC6C6C600FFFFC6C6C600FFFF
                  00000000FFFFC6C6C6848484000000FFFFFFFFFFFF84848400FFFF00000000FF
                  FFC6C6C600FFFFC6C6C600FFFFC6C6C600FFFF00000000FFFF848484000000FF
                  FFFFFFFFFF84848400000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
                  FFFFFF00FFFF000000848484000000FFFFFFFFFFFF8484848484848484848484
                  84848484848484848484848484848484848484848484848484848484FFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFF}
                Transparent = True
              end
              object LAddress1: TLabel
                Left = 41
                Top = 63
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'address 1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LAddress2: TLabel
                Left = 40
                Top = 83
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Address 2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LAddress3: TLabel
                Left = 40
                Top = 103
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Address 3'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LPostal: TLabel
                Left = 58
                Top = 122
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Postal'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LCountry: TLabel
                Left = 51
                Top = 142
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Country'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LCompany: TLabel
                Left = 61
                Top = 28
                Width = 26
                Height = 13
                Alignment = taRightJustify
                Caption = 'comp'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object LContact: TLabel
                Left = 51
                Top = 46
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'contact'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object Label22: TLabel
                Left = 468
                Top = 86
                Width = 30
                Height = 13
                Caption = 'Taxref'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object EDelCompany: TEdit
                Left = 269
                Top = 23
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 7
              end
              object EDelContact: TComboBox
                Left = 269
                Top = 44
                Width = 171
                Height = 21
                ItemHeight = 13
                TabOrder = 8
              end
              object ECompany: TEdit
                Left = 92
                Top = 22
                Width = 171
                Height = 21
                MaxLength = 35
                PopupMenu = PopupMenu3
                TabOrder = 0
              end
              object EContact: TComboBox
                Left = 92
                Top = 44
                Width = 171
                Height = 21
                ItemHeight = 13
                TabOrder = 1
              end
              object EDelAdr1: TEdit
                Left = 269
                Top = 61
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 9
              end
              object EDelAdr2: TEdit
                Left = 269
                Top = 80
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 10
              end
              object EDelAdr3: TEdit
                Left = 269
                Top = 99
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 11
              end
              object EDelPostal: TEdit
                Left = 269
                Top = 118
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 12
              end
              object CBDelCountry: TComboBox
                Left = 269
                Top = 140
                Width = 171
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 13
              end
              object EPostal1: TEdit
                Left = 92
                Top = 61
                Width = 171
                Height = 21
                MaxLength = 35
                PopupMenu = PopupMenu3
                TabOrder = 2
              end
              object EPostal2: TEdit
                Left = 92
                Top = 80
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 3
              end
              object EPostal3: TEdit
                Left = 92
                Top = 99
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 4
              end
              object EPostalCode: TEdit
                Left = 92
                Top = 118
                Width = 171
                Height = 21
                MaxLength = 35
                TabOrder = 5
              end
              object EMessage3: TEdit
                Left = 467
                Top = 60
                Width = 254
                Height = 21
                MaxLength = 35
                TabOrder = 16
              end
              object EMessage2: TEdit
                Left = 467
                Top = 41
                Width = 254
                Height = 21
                MaxLength = 35
                TabOrder = 15
              end
              object EMessage1: TEdit
                Left = 467
                Top = 22
                Width = 254
                Height = 21
                MaxLength = 35
                TabOrder = 14
              end
              object CBCountry: TComboBox
                Left = 92
                Top = 139
                Width = 171
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 6
              end
              object ESExtraDesc: TEdit
                Left = 468
                Top = 140
                Width = 254
                Height = 21
                MaxLength = 35
                TabOrder = 18
              end
              object ETaxCode: TEdit
                Left = 468
                Top = 98
                Width = 254
                Height = 21
                MaxLength = 35
                TabOrder = 17
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 745
              Height = 75
              Align = alClient
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Color = clBtnShadow
              TabOrder = 0
              object Label13: TLabel
                Left = 375
                Top = 2
                Width = 23
                Height = 13
                Caption = 'Date'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label12: TLabel
                Left = 16
                Top = 2
                Width = 66
                Height = 13
                Caption = 'Order Number'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object lblRep1: TLabel
                Left = 144
                Top = 2
                Width = 55
                Height = 13
                Caption = 'RepGroup1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object lblRep2: TLabel
                Left = 144
                Top = 36
                Width = 55
                Height = 13
                Caption = 'RepGroup2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label3i: TLabel
                Left = 16
                Top = 36
                Width = 46
                Height = 13
                Caption = 'Salesman'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object Label21: TLabel
                Left = 375
                Top = 36
                Width = 46
                Height = 13
                Caption = 'Due Date'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
              end
              object LProject: TLabel
                Left = 512
                Top = 36
                Width = 33
                Height = 13
                Caption = 'Project'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                Visible = False
              end
              object dtpDate: TwwDBDateTimePicker
                Left = 375
                Top = 15
                Width = 122
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Epoch = 1950
                ShowButton = True
                TabOrder = 4
              end
              object edtOrderNumber: TEdit
                Left = 16
                Top = 15
                Width = 119
                Height = 21
                TabOrder = 0
              end
              object cbSalesman: TComboBox
                Left = 16
                Top = 49
                Width = 121
                Height = 21
                Style = csDropDownList
                Ctl3D = False
                ItemHeight = 13
                ParentCtl3D = False
                TabOrder = 1
              end
              object CbxRepGroup2: TwwDBComboBox
                Left = 144
                Top = 49
                Width = 221
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = False
                AllowClearKey = True
                AutoDropDown = True
                AutoSize = False
                ButtonStyle = cbsEllipsis
                DropDownCount = 8
                ItemHeight = 0
                Sorted = False
                TabOrder = 3
                UnboundDataType = wwDefault
              end
              object CbxRepGroup1: TwwDBComboBox
                Left = 144
                Top = 15
                Width = 221
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = False
                AllowClearKey = True
                AutoDropDown = True
                AutoSize = False
                ButtonStyle = cbsEllipsis
                DropDownCount = 8
                ItemHeight = 0
                Sorted = False
                TabOrder = 2
                UnboundDataType = wwDefault
              end
              object dtpDuedate: TwwDBDateTimePicker
                Left = 375
                Top = 49
                Width = 126
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                Epoch = 1950
                ShowButton = True
                TabOrder = 5
              end
              object cbProject: TComboBox
                Left = 512
                Top = 49
                Width = 225
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                TabOrder = 6
              end
              object BPutOnAccount: TButton
                Left = 515
                Top = 12
                Width = 221
                Height = 21
                Caption = 'Default'
                TabOrder = 7
              end
            end
          end
        end
      end
    end
    object pnlDiscount: TPanel
      Left = 236
      Top = 174
      Width = 211
      Height = 36
      BevelInner = bvLowered
      TabOrder = 1
      Visible = False
      object Label3: TLabel
        Left = 36
        Top = 12
        Width = 102
        Height = 13
        Alignment = taRightJustify
        Caption = 'Enter overall discount'
      end
      object edtDiscount: TEdit
        Left = 144
        Top = 8
        Width = 57
        Height = 21
        TabOrder = 0
        OnExit = edtDiscountExit
        OnKeyPress = edtDiscountKeyPress
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 636
    Top = 312
  end
  object PopupMenu1: TPopupMenu
    Left = 404
    Top = 220
    object Entertotal1: TMenuItem
      Caption = 'Enter total'
      OnClick = Entertotal1Click
    end
  end
  object QDocHead: TuniQuery
    Connection = dmDatabase.ZMainconnection
    AfterScroll = QDocHeadAfterScroll
    SQL.Strings = (
      'SELECT dochead.WDocID, '
      'dochead.SDocNo, cast(dochead.DDate as Date) DDate,'
      'cast(dochead.DDUEDATE as Date) DDUEDATE,'
      'dochead.DAllocatedDate, dochead.WAccountID, '
      
        'dochead.WPaymentTypeID, dochead.FInvoiceDiscount, dochead.BPrint' +
        'ed,'
      ' dochead.BExclusive,  dochead.FDocAmount  FDocAmount'
      '  ,  dochead.FTaxAmount  FTaxAmount, '
      'dochead.SReference, dochead.WSourceTypeID,'
      'Group1.SDescription SGroup1Desc, Group2.SDescription '
      
        'SGroup2Desc, Account.SAccountCode, Account.SDescription SAccount' +
        'Description, '
      'Salesman.SDescription SSalesManDescription '
      ',  (dochead.FDocAmount - dochead.FTaxAmount) ExcAmount'
      ', transact.FOutstandingAmount openamount '
      ' FROM dochead '
      
        'LEFT OUTER JOIN transact ON  (dochead.WDocId = transact.Wdocid a' +
        'nd transact.WAccountId = dochead.WaccountID)'
      
        'LEFT OUTER JOIN Account Account ON  (dochead.WAccountID = Accoun' +
        't.WAccountID) '
      
        'LEFT OUTER JOIN Groups Group1 ON  (dochead.WReportingGroup1ID = ' +
        'Group1.WGroupID)'
      
        'LEFT OUTER JOIN Groups Group2 ON  (dochead.WReportingGroup2ID = ' +
        'Group2.WGroupID) '
      
        'LEFT OUTER JOIN Groups Salesman ON  (dochead.WSalesmanID = Sales' +
        'man.WGroupID)'
      'WHERE  dochead.SDocNo <> '#39#39' and WBalancingAccountID is null')
    Params = <>
    Left = 360
    Top = 344
    object QDocHeadWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object QDocHeadSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object QDocHeadDDATE: TDateField
      FieldName = 'DDATE'
      ReadOnly = True
    end
    object QDocHeadDDUEDATE: TDateField
      FieldName = 'DDUEDATE'
      ReadOnly = True
    end
    object QDocHeadDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object QDocHeadWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object QDocHeadWPAYMENTTYPEID: TIntegerField
      FieldName = 'WPAYMENTTYPEID'
    end
    object QDocHeadFINVOICEDISCOUNT: TFloatField
      FieldName = 'FINVOICEDISCOUNT'
    end
    object QDocHeadBPRINTED: TSmallintField
      FieldName = 'BPRINTED'
    end
    object QDocHeadBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object QDocHeadFDOCAMOUNT: TFloatField
      FieldName = 'FDOCAMOUNT'
    end
    object QDocHeadFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object QDocHeadSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QDocHeadWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object QDocHeadSGROUP1DESC: TStringField
      FieldName = 'SGROUP1DESC'
      Size = 30
    end
    object QDocHeadSGROUP2DESC: TStringField
      FieldName = 'SGROUP2DESC'
      Size = 30
    end
    object QDocHeadSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object QDocHeadSACCOUNTDESCRIPTION: TStringField
      FieldName = 'SACCOUNTDESCRIPTION'
      Size = 35
    end
    object QDocHeadSSALESMANDESCRIPTION: TStringField
      FieldName = 'SSALESMANDESCRIPTION'
      Size = 30
    end
    object QDocHeadEXCAMOUNT: TFloatField
      FieldName = 'EXCAMOUNT'
      ReadOnly = True
    end
    object QDocHeadOPENAMOUNT: TFloatField
      FieldName = 'OPENAMOUNT'
      OnGetText = QDocHeadOPENAMOUNTGetText
    end
  end
  object DSDocHead: TDataSource
    DataSet = QDocHead
    Left = 596
    Top = 276
  end
  object PopupMenu2: TPopupMenu
    OwnerDraw = True
    OnPopup = PopupMenu2Popup
    Left = 556
    Top = 336
    object Copydocument1: TMenuItem
      Caption = 'Copy document'
      OnClick = Copydocument1Click
    end
    object Convertinvoicetopurchase1: TMenuItem
      Caption = 'Convert invoice to order'
      OnClick = Convertinvoicetopurchase1Click
    end
    object ConverttoInvoice1: TMenuItem
      Caption = 'Convert to Invoice'
      OnClick = ConverttoInvoice1Click
    end
    object Changeaccount1: TMenuItem
      Caption = 'Change account'
      OnClick = Changeaccount1Click
    end
    object Printbarcodes1: TMenuItem
      Caption = 'Print barcodes'
      OnClick = Printbarcodes1Click
    end
    object Printlabel1: TMenuItem
      Caption = 'Print label'
      OnClick = Printlabel1Click
    end
    object Openitem1: TMenuItem
      Caption = 'Openitem'
      OnClick = Openitem1Click
    end
    object Setreportinggroup1: TMenuItem
      Caption = 'Set reportinggroup 1'
    end
    object Setreportinggroup2: TMenuItem
      Caption = 'Set reportinggroup 2'
    end
    object openOSCommerceorderinbrowser1: TMenuItem
      Caption = 'open OSCommerce order in browser'
      OnClick = openOSCommerceorderinbrowser1Click
    end
    object OpenOSCOmmercecustomerinbrowser1: TMenuItem
      Caption = 'Open OSCOmmerce customer in browser'
      OnClick = OpenOSCOmmercecustomerinbrowser1Click
    end
    object RecalcStockAvail: TMenuItem
      Caption = 'Recalculate stock available'
      OnClick = RecalcStockAvailClick
    end
    object Convertdocumentstosingledocument1: TMenuItem
      Caption = 'Convert documents to single document'
      OnClick = Convertdocumentstosingledocument1Click
    end
    object Createpurchaseondefaultsupplier11: TMenuItem
      Caption = 'Create purchase on default supplier 1'
      OnClick = Createpurchaseondefaultsupplier11Click
    end
    object Showinfo1: TMenuItem
      Caption = 'Show info'
      OnClick = Showinfo1Click
    end
    object ConverttoCreditnote1: TMenuItem
      Caption = 'Convert to creditnote / returnnote'
      OnClick = ConverttoCreditnote1Click
    end
    object Setdate1: TMenuItem
      Caption = 'Set date'
      OnClick = Setdate1Click
    end
    object Export1: TMenuItem
      Caption = 'Export'
      OnClick = Export1Click
    end
    object Import1: TMenuItem
      Caption = 'Import'
      OnClick = Import1Click
    end
    object EditAccount1: TMenuItem
      Caption = 'Edit Account'
      OnClick = Editaccount1Click
    end
  end
  object PMNextPrev: TPopupMenu
    Left = 448
    Top = 376
    object CancelNext1: TMenuItem
      Caption = 'Cancel Next'
      OnClick = CancelNext1Click
    end
    object CancelPrev1: TMenuItem
      Caption = 'Cancel Prev'
      OnClick = CancelPrev1Click
    end
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 500
    Top = 228
    object Pastefromclipboard1: TMenuItem
      Caption = 'Paste from clipboard'
      OnClick = Pastefromclipboard1Click
    end
    object Importfromtabfile1: TMenuItem
      Caption = 'Import from tab file'
      OnClick = Importfromtabfile1Click
    end
  end
  object TUpdateDocuments: TTimer
    Enabled = False
    OnTimer = TUpdateDocumentsTimer
    Left = 293
    Top = 381
  end
  object tblBatch: TuniTable
    Connection = dmDatabase.ZMainconnection
    BeforeOpen = tblBatchBeforeOpen
    BeforePost = tblBatchBeforePost
    TableName = 'BAT0T2'
    IndexFieldNames = 'WLineId'
    Left = 520
    Top = 376
    object tblBatchWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object tblBatchSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblBatchSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 8
    end
    object tblBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblBatchFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object tblBatchFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblBatchSTAX: TStringField
      FieldName = 'STAX'
      Size = 8
    end
    object tblBatchDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblBatchFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object tblBatchSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 8
    end
    object tblBatchFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblBatchDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object tblBatchBRECONCILED: TIntegerField
      FieldName = 'BRECONCILED'
    end
    object tblBatchBEXCLUSIVE: TIntegerField
      FieldName = 'BEXCLUSIVE'
    end
    object tblBatchWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblBatchFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object tblBatchWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBatchWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object tblBatchNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object tblBatchSPROFILE: TStringField
      FieldName = 'SPROFILE'
      Size = 35
    end
    object tblBatchSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      Size = 8
    end
    object tblBatchSTAX2: TStringField
      FieldName = 'STAX2'
      Size = 8
    end
    object tblBatchBLINKED: TIntegerField
      FieldName = 'BLINKED'
    end
    object tblBatchDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBatchFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object tblBatchWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblBatchWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object tblBatchWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      OnGetText = tblBatchWREPORTINGGROUP1IDGetText
    end
    object tblBatchWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      OnGetText = tblBatchWREPORTINGGROUP1IDGetText
    end
    object tblBatchWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object tblBatchDPAYMENTDATE: TDateTimeField
      FieldName = 'DPAYMENTDATE'
    end
    object tblBatchWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
  end
  object dsBatch: TDataSource
    DataSet = tblBatch
    Left = 622
    Top = 371
  end
  object tblBatchRefTotals: TuniTable
    BeforeOpen = tblBatchBeforeOpen
    TableName = 'BAT0T2'
    Left = 516
    Top = 339
    object tblBatchRefTotalsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblBatchRefTotalsSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 7
    end
    object tblBatchRefTotalsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblBatchRefTotalsFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object tblBatchRefTotalsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblBatchRefTotalsSTAX: TStringField
      FieldName = 'STAX'
      Size = 7
    end
    object tblBatchRefTotalsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblBatchRefTotalsFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object tblBatchRefTotalsSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 7
    end
    object tblBatchRefTotalsFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblBatchRefTotalsDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object tblBatchRefTotalsBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object tblBatchRefTotalsBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object tblBatchRefTotalsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblBatchRefTotalsWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object tblBatchRefTotalsFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object tblBatchRefTotalsWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBatchRefTotalsWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object tblBatchRefTotalsNOTUSED: TFloatField
      FieldName = 'NOTUSED'
    end
    object tblBatchRefTotalsSPROFILE: TStringField
      FieldName = 'SPROFILE'
      Size = 35
    end
    object tblBatchRefTotalsSJOBCODE: TStringField
      FieldName = 'SJOBCODE'
      Size = 8
    end
    object tblBatchRefTotalsSTAX2: TStringField
      FieldName = 'STAX2'
      Size = 8
    end
    object tblBatchRefTotalsBLINKED: TSmallintField
      FieldName = 'BLINKED'
    end
    object tblBatchRefTotalsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBatchRefTotalsFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object tblBatchRefTotalsWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object tblBatchRefTotalsWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object tblBatchRefTotalsWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object tblBatchRefTotalsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblBatchRefTotalsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
  end
  object ZQCostGroup2: TuniQuery
    Connection = dmDatabase.ZMainconnection
    OnCalcFields = ZQCostGroup2CalcFields
    SQL.Strings = (
      'Select WGroupid from groups where WGroupId = 0'
      'union'
      'Select WGroupid from groups where WGroupTypeID= 1003'
      'and (BDisable is null or BDisable = 0)')
    Params = <>
    Left = 672
    Top = 381
    object ZQCostGroup2WGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQCostGroup2SFULLDESC: TStringField
      FieldKind = fkCalculated
      FieldName = 'SFULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object ZQCostgroup1: TuniQuery
    Connection = dmDatabase.ZMainconnection
    OnCalcFields = ZQCostgroup1CalcFields
    SQL.Strings = (
      'Select WGroupid from groups where WGroupId = 0'
      'union'
      'Select WGroupid from groups where WGroupTypeID= 1002'
      'and (BDisable is null or BDisable = 0)')
    Params = <>
    Left = 760
    Top = 382
    object ZQCostgroup1WGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQCostgroup1SFULLDESC: TStringField
      DisplayLabel = 'SFULDESC'
      FieldKind = fkCalculated
      FieldName = 'SFULLDESC'
      Size = 255
      Calculated = True
    end
  end
  object dsCostGroup1: TDataSource
    DataSet = ZQCostgroup1
    Left = 328
    Top = 398
  end
  object dsCostGroup2: TDataSource
    DataSet = ZQCostGroup2
    Left = 400
    Top = 438
  end
  object OpenDialog1: TOpenDialog
    FileName = '*.txf'
    Filter = '*.txf'
    Left = 93
    Top = 343
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txf'
    Filter = '*.txf'
    Left = 89
    Top = 403
  end
  object OpenDialog2: TOpenDialog
    Left = 153
    Top = 431
  end
  object CustomizeDlg1: TCustomizeDlg
    StayOnTop = False
    Left = 544
    Top = 212
  end
end
