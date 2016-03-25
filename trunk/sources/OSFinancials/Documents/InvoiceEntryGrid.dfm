object fmInvoiceEntryGrid: TfmInvoiceEntryGrid
  Left = 343
  Top = 224
  Caption = 'Invoice Entry'
  ClientHeight = 616
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = dbgridInvoiceKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 1013
    Height = 616
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object NBDocuments: TNotebook
      Tag = 9999
      Left = 0
      Top = 0
      Width = 1013
      Height = 616
      Align = alClient
      PageIndex = 1
      TabOrder = 1
      object TPage
        Left = 0
        Top = 0
        Caption = 'ListDoc'
        object Panel5: TPanel
          Left = 0
          Top = 566
          Width = 1013
          Height = 50
          Align = alBottom
          BevelOuter = bvNone
          Caption = '`'
          TabOrder = 0
          object Image1: TImage
            Left = 0
            Top = 0
            Width = 1013
            Height = 50
            Align = alClient
            Stretch = True
            ExplicitWidth = 1183
          end
          object BitBtnCancel: TBitBtn
            Left = 690
            Top = 10
            Width = 96
            Height = 25
            Cancel = True
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
            ModalResult = 2
            ParentDoubleBuffered = False
            TabOrder = 0
            OnKeyDown = FormKeyDown
            OnKeyPress = FormKeyPress
          end
          object BitBtn1: TBitBtn
            Left = 588
            Top = 10
            Width = 96
            Height = 25
            Caption = 'OK'
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
            ModalResult = 1
            ParentDoubleBuffered = False
            TabOrder = 1
            OnKeyDown = FormKeyDown
            OnKeyPress = FormKeyPress
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 1013
          Height = 566
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 143
            Height = 566
            Align = alLeft
            BevelOuter = bvNone
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            object Panel4: TPanel
              Left = 0
              Top = 85
              Width = 143
              Height = 481
              Align = alClient
              BevelOuter = bvNone
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              DesignSize = (
                143
                481)
              object lblPrnType: TLabel
                Left = 9
                Top = 210
                Width = 57
                Height = 13
                Anchors = [akTop, akRight]
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
                Left = 8
                Top = 251
                Width = 74
                Height = 13
                Anchors = [akTop, akRight]
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
                Left = 8
                Top = 289
                Width = 38
                Height = 13
                Anchors = [akTop, akRight]
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
                Left = 8
                Top = 172
                Width = 48
                Height = 13
                Anchors = [akTop, akRight]
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
              object BNew: TBitBtn
                Left = 8
                Top = 4
                Width = 130
                Height = 26
                Caption = 'New'
                DoubleBuffered = True
                NumGlyphs = 2
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = BNewClick
              end
              object BEdit: TBitBtn
                Left = 8
                Top = 31
                Width = 130
                Height = 26
                Caption = 'Edit'
                DoubleBuffered = True
                NumGlyphs = 2
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = BEditClick
              end
              object BPrint: TBitBtn
                Left = 8
                Top = 59
                Width = 130
                Height = 26
                Caption = 'Print'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 2
                OnClick = BPrintClick
              end
              object CBDocLayout2: TComboBox
                Left = 8
                Top = 227
                Width = 130
                Height = 21
                Style = csDropDownList
                Anchors = [akTop, akRight]
                TabOrder = 3
                OnDropDown = CBDocLayout2DropDown
              end
              object cbDestination: TComboBox
                Left = 8
                Top = 265
                Width = 130
                Height = 21
                Style = csDropDownList
                Anchors = [akTop, akRight]
                TabOrder = 4
                OnChange = cbDestinationChange
                OnKeyPress = cbDestinationKeyPress
                Items.Strings = (
                  'Screen'
                  'Printer'
                  'File'
                  'E-mail')
              end
              object edtCount: TEdit
                Left = 112
                Top = 292
                Width = 25
                Height = 19
                Anchors = [akTop, akRight]
                TabOrder = 5
                Text = '1'
                OnChange = edtCountChange
              end
              object UpDown1: TUpDown
                Left = 79
                Top = 290
                Width = 21
                Height = 21
                Anchors = [akTop, akRight]
                Min = 1
                Max = 32767
                Position = 1
                TabOrder = 6
                OnClick = UpDown1Click
              end
              object BitSetPrint: TBitBtn
                Left = 8
                Top = 314
                Width = 130
                Height = 25
                Anchors = [akTop, akRight]
                Caption = '&Printer Setup'
                DoubleBuffered = True
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
                ParentDoubleBuffered = False
                TabOrder = 7
                TabStop = False
                OnClick = BitSetPrintClick
              end
              object BProcess: TBitBtn
                Left = 8
                Top = 88
                Width = 130
                Height = 26
                Caption = 'Process'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 8
                OnClick = BProcessClick
              end
              object BDelete: TBitBtn
                Left = 8
                Top = 116
                Width = 130
                Height = 26
                Caption = 'Delete'
                DoubleBuffered = True
                NumGlyphs = 2
                ParentDoubleBuffered = False
                TabOrder = 9
                OnClick = BDeleteClick
              end
              object CBDocLayout: TComboBox
                Left = 8
                Top = 187
                Width = 130
                Height = 21
                Style = csDropDownList
                Anchors = [akTop, akRight]
                TabOrder = 10
                OnDropDown = CBDocLayoutDropDown
              end
              object BtnClose2: TBitBtn
                Left = 8
                Top = 144
                Width = 130
                Height = 26
                Caption = 'Close'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 11
                OnClick = BtnClose2Click
              end
              object Bexport: TBitBtn
                Left = 8
                Top = 349
                Width = 130
                Height = 25
                Anchors = [akTop, akRight]
                Caption = 'Export'
                DoubleBuffered = True
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFAEC3E0637C9FF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6ECF5386DB6496386B8B8B8DDDDDDFE
                  FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFD
                  4D7ABA205AAA617693C6C6C6B6B6B6D0D0D0F3F3F3FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFDCE3EE7497C92461B3235EAD687D98E2E2E2D7D7D7D9
                  D9D9E4E4E4E2E5E8F0F2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3267B12663B5
                  2B6CBF2663B2657894DEDEDED7D7D7E2E2E2FFFFFF84A0C4AFC0E3FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF396EB32F6DBB2D72C6296ABB697A92DCDCDCD5D5D5E0
                  E0E0FFFFFF8FA6D57AACB1E6F9E3FFFFFFFFFFFFFFFFFFFFFFFF4477B73573BE
                  3379CC3F689A797F89DDDDDDD5D5D5E0E0E0FFFFFF95BAB246B457CEEDCBFFFF
                  FFFFFFFFFFFFFFFFFFFF3F7AC23378C93579CA3E71B07A8595DCDCDCD5D5D5F7
                  F7F7BED7BF4BBE4C4AC14D71CA7581D28683D4898AD69089D58E437FC73477C7
                  337ACC3175C7657892DCDCDCE1E1E1ACCDAD30AF3335B63A3EB84349BE5052C3
                  5A5AC76366CC6F63C96B4683CA357BCB3980D2367AC8677992E5E5E5BBC9BB4A
                  B64B41B9452EB03232B3363BB74044BC4B4DC05457C55F5FC7664987CD3B82D2
                  3B83D5387BCA687A94DDDDDDDEE0DE9BC79B4EBB504EBC5145B94944BA4948BC
                  4D4EC0555AC5625DC4634D8ACF3D84D33C85D73A7ECD637691DDDDDDD7D7D7F8
                  F8F8AAD0AA4FBC4C53BF546BC66D75CC7876CC797BCF7F7CCE7F568CC84485CE
                  3B86D94A93DE869AAFDADADAD5D5D5E1E1E1FFFFFF92C2AB49B652CDEBCAFFFF
                  FFFFFFFFFFFFFFFFFFFF508ED3428BDB4B95DF91AEC6D2D2D2D3D3D3DCDCDCE8
                  E8E8FFFFFF9FB8E670B2A8DBF3D7FFFFFFFFFFFFFFFFFFFFFFFF4E90D84187D3
                  7D97AFB0B4BAACB4BDB4BCC5BDC5CDC6CDD6DBE1E880A6D1B9CFF3FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF5D98DA518FD1568BC74E88C94D88C84D87C84C87C74B
                  86C74A84C43F81CAC3D7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                ParentDoubleBuffered = False
                TabOrder = 12
                TabStop = False
                OnClick = BexportClick
              end
              object cbSimplelayout: TCheckBox
                Left = 12
                Top = 379
                Width = 125
                Height = 17
                Caption = 'Simpel layout'
                TabOrder = 13
                OnClick = cbSimplelayoutClick
              end
            end
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 143
              Height = 85
              Align = alTop
              TabOrder = 1
              object Label7: TLabel
                Left = 6
                Top = 6
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
              object cbDocTypenew: TComboBox
                Left = 8
                Top = 22
                Width = 128
                Height = 24
                Style = csDropDownList
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = cbDocTypenewChange
              end
            end
          end
          object Panel7: TPanel
            Left = 143
            Top = 0
            Width = 870
            Height = 566
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 870
              Height = 81
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LField: TLabel
                Left = 3
                Top = 6
                Width = 22
                Height = 13
                Caption = 'Field'
              end
              object LFilterValue: TLabel
                Left = 252
                Top = 4
                Width = 55
                Height = 13
                Caption = 'LFilterValue'
              end
              object CBFindColumn: TComboBox
                Left = 3
                Top = 21
                Width = 145
                Height = 21
                Style = csDropDownList
                TabOrder = 0
              end
              object CBOperatot: TComboBox
                Left = 174
                Top = 20
                Width = 57
                Height = 21
                Style = csDropDownList
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
                Left = 252
                Top = 20
                Width = 129
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 2
                OnKeyPress = EFilterValueKeyPress
              end
              object BFilter: TBitBtn
                Left = 388
                Top = 20
                Width = 67
                Height = 21
                Caption = 'Filter'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 3
                OnClick = BFilterClick
              end
              object BClear: TBitBtn
                Left = 458
                Top = 20
                Width = 65
                Height = 21
                Caption = 'Clear'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 4
                OnClick = BClearClick
              end
              object cbViewUnPosted2: TComboBox
                Left = 3
                Top = 43
                Width = 145
                Height = 21
                Style = csDropDownList
                TabOrder = 5
                OnChange = cbViewUnPostedClick
                Items.Strings = (
                  'Posted'
                  'Unposted'
                  'All'
                  'Confirmd')
              end
              object cbDoc1group: TComboBox
                Left = 252
                Top = 47
                Width = 272
                Height = 21
                Style = csDropDownList
                TabOrder = 6
              end
              object LimitRows: TcxSpinEdit
                Left = 534
                Top = 46
                Properties.MaxValue = 999999.000000000000000000
                Properties.MinValue = 1.000000000000000000
                Properties.SpinButtons.ShowFastButtons = True
                TabOrder = 7
                Value = 200
                Width = 125
              end
              object lLimitRows: TcxLabel
                Left = 534
                Top = 23
                Caption = 'limitrows'
              end
            end
            object cxlist: TcxGrid
              Left = 0
              Top = 81
              Width = 870
              Height = 485
              Align = alClient
              BorderWidth = 3
              TabOrder = 1
              object cxlistDBTable: TcxGridDBBandedTableView
                PopupMenu = PopupMenu2
                OnDblClick = BEditClick
                OnKeyDown = DBGSearchKeyDown
                OnKeyUp = DBGSearchKeyUp
                NavigatorButtons.ConfirmDelete = False
                OnCustomDrawCell = cxlistDBTableCustomDrawCell
                DataController.DataSource = DSDocHead
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'SDOCNO'
                    Column = cxlistDBTableSDOCNO
                  end
                  item
                    Kind = skSum
                    FieldName = 'FDOCAMOUNT'
                    Column = cxlistDBTableFDOCAMOUNT
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'SDOCNO'
                    Column = cxlistDBTableSDOCNO
                  end
                  item
                    Kind = skSum
                    FieldName = 'CALOPENAMOUNT'
                    Column = cxlistDBTableCALOPENAMOUNT
                  end
                  item
                    Kind = skSum
                    FieldName = 'FTAXAMOUNT'
                    Column = cxlistDBTableFTAXAMOUNT
                  end
                  item
                    Kind = skSum
                    FieldName = 'FDOCAMOUNT'
                    Column = cxlistDBTableFDOCAMOUNT
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'EXCAMOUNT'
                    Column = cxlistDBTableEXCAMOUNT
                  end>
                DataController.Summary.SummaryGroups = <
                  item
                    Links = <>
                    SummaryItems = <
                      item
                        Format = '0'
                        Kind = skCount
                        FieldName = 'SDOCNO'
                        Column = cxlistDBTableSDOCNO
                      end>
                  end>
                OptionsBehavior.DragDropText = True
                OptionsBehavior.FocusCellOnTab = True
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsCustomize.DataRowSizing = True
                OptionsCustomize.GroupRowSizing = True
                OptionsCustomize.BandsQuickCustomization = True
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.MultiSelect = True
                OptionsView.ShowEditButtons = gsebForFocusedRecord
                OptionsView.Footer = True
                OptionsView.FooterMultiSummaries = True
                OptionsView.GroupFooterMultiSummaries = True
                OptionsView.GroupFooters = gfAlwaysVisible
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
                Bands = <
                  item
                    FixedKind = fkLeft
                    Width = 388
                  end
                  item
                  end>
                object cxlistDBTableWDOCID: TcxGridDBBandedColumn
                  Caption = 'id'
                  DataBinding.FieldName = 'WDOCID'
                  Visible = False
                  Position.BandIndex = 0
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxlistDBTableSDOCNO: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SDOCNO'
                  Position.BandIndex = 0
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxlistDBTableDDATE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'DDATE'
                  DateTimeGrouping = dtgRelativeToToday
                  Options.CellMerging = True
                  Position.BandIndex = 0
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxlistDBTableDDUEDATE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'DDUEDATE'
                  DateTimeGrouping = dtgByDate
                  Options.CellMerging = True
                  Position.BandIndex = 1
                  Position.ColIndex = 0
                  Position.RowIndex = 0
                end
                object cxlistDBTableDALLOCATEDDATE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'DALLOCATEDDATE'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 1
                  Position.RowIndex = 0
                end
                object cxlistDBTableWACCOUNTID: TcxGridDBBandedColumn
                  Caption = 'Accid'
                  DataBinding.FieldName = 'WACCOUNTID'
                  Visible = False
                  Position.BandIndex = 1
                  Position.ColIndex = 2
                  Position.RowIndex = 0
                end
                object cxlistDBTableWPAYMENTTYPEID: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'WPAYMENTTYPEID'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxlistDBTableFINVOICEDISCOUNT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'FINVOICEDISCOUNT'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
                object cxlistDBTableBPRINTED: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'BPRINTED'
                  Options.CellMerging = True
                  Position.BandIndex = 1
                  Position.ColIndex = 5
                  Position.RowIndex = 0
                end
                object cxlistDBTableEXCAMOUNT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'EXCAMOUNT'
                  RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                  Position.BandIndex = 1
                  Position.ColIndex = 15
                  Position.RowIndex = 0
                end
                object cxlistDBTableFDOCAMOUNT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'FDOCAMOUNT'
                  RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                  Position.BandIndex = 1
                  Position.ColIndex = 7
                  Position.RowIndex = 0
                end
                object cxlistDBTableCALOPENAMOUNT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'CALOPENAMOUNT'
                  RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                  Position.BandIndex = 1
                  Position.ColIndex = 19
                  Position.RowIndex = 0
                end
                object cxlistDBTableFTAXAMOUNT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'FTAXAMOUNT'
                  RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                  Position.BandIndex = 1
                  Position.ColIndex = 8
                  Position.RowIndex = 0
                end
                object cxlistDBTableSREFERENCE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SREFERENCE'
                  Position.BandIndex = 1
                  Position.ColIndex = 9
                  Position.RowIndex = 0
                end
                object cxlistDBTableWSOURCETYPEID: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'WSOURCETYPEID'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 10
                  Position.RowIndex = 0
                end
                object cxlistDBTableSGROUP1DESC: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SGROUP1DESC'
                  Options.CellMerging = True
                  Position.BandIndex = 1
                  Position.ColIndex = 11
                  Position.RowIndex = 0
                end
                object cxlistDBTableSGROUP2DESC: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SGROUP2DESC'
                  Options.CellMerging = True
                  Position.BandIndex = 1
                  Position.ColIndex = 12
                  Position.RowIndex = 0
                end
                object cxlistDBTableSACCOUNTCODE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SACCOUNTCODE'
                  Options.CellMerging = True
                  Position.BandIndex = 1
                  Position.ColIndex = 13
                  Position.RowIndex = 0
                end
                object cxlistDBTableSACCOUNTDESCRIPTION: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SACCOUNTDESCRIPTION'
                  Position.BandIndex = 0
                  Position.ColIndex = 3
                  Position.RowIndex = 0
                end
                object cxlistDBTableSSALESMANDESCRIPTION: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'SSALESMANDESCRIPTION'
                  Options.CellMerging = True
                  Position.BandIndex = 1
                  Position.ColIndex = 14
                  Position.RowIndex = 0
                end
                object cxlistDBTableBPOSTED: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'BPOSTED'
                  PropertiesClassName = 'TcxImageComboBoxProperties'
                  Properties.Items = <>
                  Options.CellMerging = True
                  Position.BandIndex = 1
                  Position.ColIndex = 20
                  Position.RowIndex = 0
                end
                object cxlistDBTableOPENAMOUNT: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'OPENAMOUNT'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 16
                  Position.RowIndex = 0
                end
                object cxlistDBTableWGROUP1COLOR: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'WGROUP1COLOR'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 17
                  Position.RowIndex = 0
                end
                object cxlistDBTableWGROUP1TEXTCOLOR: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'WGROUP1TEXTCOLOR'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 18
                  Position.RowIndex = 0
                end
                object cxlistDBTableWACCOUNTTYPEID: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'WACCOUNTTYPEID'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 21
                  Position.RowIndex = 0
                end
                object cxlistDBTableBEXCLUSIVE: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'BEXCLUSIVE'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 1
                  Position.ColIndex = 6
                  Position.RowIndex = 0
                end
                object cxlistDBTableWREPORTINGGROUP2ID: TcxGridDBBandedColumn
                  DataBinding.FieldName = 'WREPORTINGGROUP2ID'
                  Visible = False
                  VisibleForCustomization = False
                  Position.BandIndex = 0
                  Position.ColIndex = 4
                  Position.RowIndex = 0
                end
              end
              object cxlistLevel1: TcxGridLevel
                GridView = cxlistDBTable
              end
            end
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'DocHead'
        object pnlDocLines: TPanel
          Left = 0
          Top = 246
          Width = 1013
          Height = 237
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            1013
            237)
          object PnlCopy: TPanel
            Left = 7
            Top = 120
            Width = 684
            Height = 154
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvLowered
            TabOrder = 2
            Visible = False
            OnExit = PnlCopyExit
            DesignSize = (
              684
              154)
            object BtnCopyCancel: TBitBtn
              Left = 492
              Top = 121
              Width = 85
              Height = 25
              Anchors = [akRight, akBottom]
              Cancel = True
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
              TabOrder = 0
              TabStop = False
              OnClick = BtnCopyCancelClick
            end
            object BtnCopyOk: TBitBtn
              Left = 588
              Top = 121
              Width = 85
              Height = 25
              Anchors = [akRight, akBottom]
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
              ParentDoubleBuffered = False
              TabOrder = 1
              OnClick = BtnCopyOkClick
            end
            object ECopyFilter: TEdit
              Left = 20
              Top = 121
              Width = 95
              Height = 21
              Anchors = [akLeft, akBottom]
              TabOrder = 2
            end
            object BCopyFilter: TBitBtn
              Left = 164
              Top = 121
              Width = 97
              Height = 25
              Anchors = [akLeft, akBottom]
              Caption = 'Filter'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 3
              OnClick = BCopyFilterClick
            end
            object CBOnlyThisDebtor: TCheckBox
              Left = 200
              Top = 101
              Width = 161
              Height = 17
              Alignment = taLeftJustify
              Anchors = [akLeft, akBottom]
              Caption = 'Only this debtor'
              Checked = True
              State = cbChecked
              TabOrder = 4
            end
            object CBAllDocuments: TCheckBox
              Left = 16
              Top = 101
              Width = 161
              Height = 16
              Alignment = taLeftJustify
              Anchors = [akLeft, akBottom]
              Caption = 'All documents'
              TabOrder = 5
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 0
              Top = 0
              Width = 145
              Height = 21
              DataField = 'WUNITID'
              DataSource = dsBatch
              DropDownWidth = 150
              KeyField = 'WUNITID'
              ListField = 'SDESCRIPTION'
              ListSource = dsUnit
              NullValueKey = 48
              TabOrder = 6
              Visible = False
              OnExit = DBLCBCostgroup1Exit
              OnKeyDown = DBLCBCostgroup1KeyDown
              OnKeyPress = DBLCBCostgroup2KeyPress
            end
            object grdCopy: TcxGrid
              Left = 167
              Top = 11
              Width = 379
              Height = 83
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 7
              object grdCopyDBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = DSDocHead
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.GroupByBox = False
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object grdCopyDBTableView1SDOCNO: TcxGridDBColumn
                  DataBinding.FieldName = 'SDOCNO'
                end
                object grdCopyDBTableView1SACCOUNTDESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'SACCOUNTDESCRIPTION'
                end
                object grdCopyDBTableView1DDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DDATE'
                end
                object grdCopyDBTableView1WDOCID: TcxGridDBColumn
                  DataBinding.FieldName = 'WDOCID'
                end
                object grdCopyDBTableView1SREFERENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SREFERENCE'
                end
                object grdCopyDBTableView1DDUEDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DDUEDATE'
                end
                object grdCopyDBTableView1DALLOCATEDDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DALLOCATEDDATE'
                end
                object grdCopyDBTableView1WACCOUNTID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTID'
                end
                object grdCopyDBTableView1WPAYMENTTYPEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WPAYMENTTYPEID'
                end
                object grdCopyDBTableView1FINVOICEDISCOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FINVOICEDISCOUNT'
                end
                object grdCopyDBTableView1BPRINTED: TcxGridDBColumn
                  DataBinding.FieldName = 'BPRINTED'
                end
                object grdCopyDBTableView1BEXCLUSIVE: TcxGridDBColumn
                  DataBinding.FieldName = 'BEXCLUSIVE'
                end
                object grdCopyDBTableView1FDOCAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FDOCAMOUNT'
                end
                object grdCopyDBTableView1FTAXAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FTAXAMOUNT'
                end
                object grdCopyDBTableView1WSOURCETYPEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WSOURCETYPEID'
                end
                object grdCopyDBTableView1SGROUP1DESC: TcxGridDBColumn
                  DataBinding.FieldName = 'SGROUP1DESC'
                end
                object grdCopyDBTableView1SGROUP2DESC: TcxGridDBColumn
                  DataBinding.FieldName = 'SGROUP2DESC'
                end
                object grdCopyDBTableView1SACCOUNTCODE: TcxGridDBColumn
                  DataBinding.FieldName = 'SACCOUNTCODE'
                end
                object grdCopyDBTableView1SSALESMANDESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'SSALESMANDESCRIPTION'
                end
                object grdCopyDBTableView1EXCAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'EXCAMOUNT'
                end
                object grdCopyDBTableView1OPENAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'OPENAMOUNT'
                end
                object grdCopyDBTableView1WGROUP1COLOR: TcxGridDBColumn
                  DataBinding.FieldName = 'WGROUP1COLOR'
                end
                object grdCopyDBTableView1WGROUP1TEXTCOLOR: TcxGridDBColumn
                  DataBinding.FieldName = 'WGROUP1TEXTCOLOR'
                end
                object grdCopyDBTableView1CALOPENAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'CALOPENAMOUNT'
                end
                object grdCopyDBTableView1BPOSTED: TcxGridDBColumn
                  DataBinding.FieldName = 'BPOSTED'
                end
                object grdCopyDBTableView1WACCOUNTTYPEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTTYPEID'
                end
                object grdCopyDBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WREPORTINGGROUP2ID'
                end
                object grdCopyDBTableView1DUMMMYEXPRES: TcxGridDBColumn
                  DataBinding.FieldName = 'DUMMMYEXPRES'
                end
              end
              object grdCopyLevel1: TcxGridLevel
                GridView = grdCopyDBTableView1
              end
            end
          end
          object PnlComment: TPanel
            Left = -52
            Top = 137
            Width = 732
            Height = 165
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelInner = bvLowered
            DragMode = dmAutomatic
            TabOrder = 3
            Visible = False
            OnEnter = PnlCommentEnter
            OnExit = PnlCommentExit
            DesignSize = (
              732
              165)
            object Label6: TLabel
              Left = 18
              Top = 6
              Width = 105
              Height = 13
              Caption = '&Comment Line Invoice'
              FocusControl = EdComment
            end
            object BtnCancel: TBitBtn
              Left = 611
              Top = 104
              Width = 106
              Height = 25
              Anchors = [akRight, akBottom]
              Cancel = True
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
              TabOrder = 2
              TabStop = False
              OnClick = BtnCancelClick
            end
            object BtnOk: TBitBtn
              Left = 611
              Top = 135
              Width = 106
              Height = 23
              Anchors = [akRight, akBottom]
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
              ParentDoubleBuffered = False
              TabOrder = 1
              OnClick = BtnOkClick
            end
            object EdComment: TMemo
              Left = 18
              Top = 21
              Width = 587
              Height = 137
              Anchors = [akLeft, akTop, akRight, akBottom]
              MaxLength = 290
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
            end
            object BRemFinder: TBitBtn
              Left = 611
              Top = 21
              Width = 106
              Height = 25
              Anchors = [akTop, akRight]
              Cancel = True
              Caption = 'lookup'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 3
              TabStop = False
              OnClick = BRemFinderClick
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 68
            Width = 1013
            Height = 169
            Align = alClient
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            OnExit = Panel3Exit
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 768
              Height = 169
              Align = alClient
              TabOrder = 4
              OnEnter = dbgridInvoiceEnter
              OnExit = dbgridInvoiceExit
              object cxGrid1DBTableView1: TcxGridDBTableView
                PopupMenu = PopupMenu1
                OnDblClick = dbgridInvoiceDblClick
                OnKeyDown = dbgridInvoiceKeyDown
                OnKeyPress = dbgridInvoiceKeyPress
                OnKeyUp = dbgridInvoiceKeyUp
                NavigatorButtons.ConfirmDelete = False
                OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
                OnEditKeyDown = cxGrid1DBTableView1EditKeyDown
                OnEditKeyPress = cxGrid1DBTableView1EditKeyPress
                OnFocusedItemChanged = cxGrid1DBTableView1FocusedItemChanged
                OnFocusedRecordChanged = cxGrid1DBTableView1FocusedRecordChanged
                DataController.DataSource = dsBatch
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.FocusCellOnTab = True
                OptionsBehavior.FocusFirstCellOnNewRecord = True
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsBehavior.FocusCellOnCycle = True
                OptionsBehavior.PullFocusing = True
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnMoving = False
                OptionsCustomize.ColumnSorting = False
                OptionsCustomize.DataRowSizing = True
                OptionsData.Appending = True
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SREFERENCE'
                  PropertiesClassName = 'TcxButtonEditProperties'
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = cxGrid1DBTableView1STAXPropertiesButtonClick
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                end
                object cxGrid1DBTableView1WLINEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WLINEID'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'SDESCRIPTION'
                  PropertiesClassName = 'TcxMemoProperties'
                  Properties.WantReturns = False
                  OnGetCellHint = cxGrid1DBTableView1SDESCRIPTIONGetCellHint
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  Width = 186
                end
                object cxGrid1DBTableView1SACCOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'SACCOUNT'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
                  OnGetProperties = cxGrid1DBTableView1SACCOUNTGetProperties
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  Width = 71
                end
                object cxGrid1DBTableView1SCONTRAACCOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'SCONTRAACCOUNT'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
                  OnGetProperties = cxGrid1DBTableView1SACCOUNTGetProperties
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  Width = 68
                end
                object cxGrid1DBTableView1WUNITID: TcxGridDBColumn
                  DataBinding.FieldName = 'WUNITID'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.ImmediatePost = True
                  Properties.KeyFieldNames = 'WUNITID'
                  Properties.ListColumns = <
                    item
                      FieldName = 'SDESCRIPTION'
                    end>
                  Properties.ListSource = dsUnit
                  Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                end
                object cxGrid1DBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WREPORTINGGROUP1ID'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.KeyFieldNames = 'WGROUPID'
                  Properties.ListColumns = <
                    item
                      FieldName = 'SFULLDESC'
                    end>
                  Properties.ListSource = dsCostGroup1
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                end
                object cxGrid1DBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WREPORTINGGROUP2ID'
                  PropertiesClassName = 'TcxLookupComboBoxProperties'
                  Properties.KeyFieldNames = 'WGROUPID'
                  Properties.ListColumns = <
                    item
                      FieldName = 'SFULLDESC'
                    end>
                  Properties.ListSource = dsCostGroup2
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                end
                object cxGrid1DBTableView1STAX: TcxGridDBColumn
                  DataBinding.FieldName = 'STAX'
                  PropertiesClassName = 'TcxButtonEditProperties'
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.ReadOnly = True
                  Properties.OnButtonClick = cxGrid1DBTableView1STAXPropertiesButtonClick
                  Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  Width = 122
                end
                object cxGrid1DBTableView1FDEBIT: TcxGridDBColumn
                  DataBinding.FieldName = 'FDEBIT'
                  PropertiesClassName = 'TcxButtonEditProperties'
                  Properties.Buttons = <
                    item
                      Default = True
                      Kind = bkEllipsis
                    end>
                  Properties.OnButtonClick = cxGrid1DBTableView1FDEBITPropertiesButtonClick
                  Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                end
                object cxGrid1DBTableView1FTAXAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FTAXAMOUNT'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DecimalPlaces = 8
                  Properties.DisplayFormat = '% ,0.###;% -,0.###'
                  Properties.EditFormat = '0.########'
                  Properties.OnValidate = cxGrid1DBTableView1FTAXAMOUNTPropertiesValidate
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                end
                object cxGrid1DBTableView1FCREDIT: TcxGridDBColumn
                  DataBinding.FieldName = 'FCREDIT'
                  PropertiesClassName = 'TcxTextEditProperties'
                  Properties.OnValidate = cxGrid1DBTableView1SACCOUNTPropertiesValidate
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                end
                object cxGrid1DBTableView1FAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FAMOUNT'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1WTAXID: TcxGridDBColumn
                  DataBinding.FieldName = 'WTAXID'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1BRECONCILED: TcxGridDBColumn
                  DataBinding.FieldName = 'BRECONCILED'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1FUNITQTY: TcxGridDBColumn
                  DataBinding.FieldName = 'FUNITQTY'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1BEXCLUSIVE: TcxGridDBColumn
                  DataBinding.FieldName = 'BEXCLUSIVE'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTID'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1FQTY: TcxGridDBColumn
                  DataBinding.FieldName = 'FQTY'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1WPROFILEID: TcxGridDBColumn
                  DataBinding.FieldName = 'WPROFILEID'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1WTAX2ID: TcxGridDBColumn
                  DataBinding.FieldName = 'WTAX2ID'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1SPROFILE: TcxGridDBColumn
                  DataBinding.FieldName = 'SPROFILE'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1SJOBCODE: TcxGridDBColumn
                  DataBinding.FieldName = 'SJOBCODE'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1STAX2: TcxGridDBColumn
                  DataBinding.FieldName = 'STAX2'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1BLINKED: TcxGridDBColumn
                  DataBinding.FieldName = 'BLINKED'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DSYSDATE'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1FTAX2AMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FTAX2AMOUNT'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1WLINKEDID: TcxGridDBColumn
                  DataBinding.FieldName = 'WLINKEDID'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1DPAYMENTDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DPAYMENTDATE'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1WDOCID: TcxGridDBColumn
                  DataBinding.FieldName = 'WDOCID'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
                object cxGrid1DBTableView1LONGTEXT: TcxGridDBColumn
                  DataBinding.FieldName = 'LONGTEXT'
                  Visible = False
                  Options.Filtering = False
                  Options.FilteringFilteredItemsList = False
                  Options.FilteringPopup = False
                  Options.Grouping = False
                  Options.Moving = False
                  Options.Sorting = False
                  VisibleForCustomization = False
                end
              end
              object cxGrid1Level1: TcxGridLevel
                GridView = cxGrid1DBTableView1
              end
            end
            object PriceList: TValueListEditor
              Left = 471
              Top = 38
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
              TabOrder = 0
              TitleCaptions.Strings = (
                'Price Name'
                'Value')
              Visible = False
              OnDblClick = PriceListDblClick
              OnExit = PriceListExit
              OnKeyDown = PriceListKeyDown
              OnKeyPress = PriceListKeyPress
              OnSelectCell = PriceListSelectCell
              ColWidths = (
                97
                79)
            end
            object PEditPrice: TPanel
              Left = 768
              Top = 0
              Width = 245
              Height = 169
              Align = alRight
              BevelOuter = bvNone
              BorderWidth = 10
              TabOrder = 2
              Visible = False
              object MOptions: TMemo
                Left = 10
                Top = 289
                Width = 225
                Height = 17
                Align = alClient
                TabOrder = 0
                Visible = False
              end
              object PEditPriceInner: TPanel
                Left = 10
                Top = 10
                Width = 225
                Height = 279
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                Visible = False
                object Label26: TLabel
                  Left = 8
                  Top = 80
                  Width = 33
                  Height = 13
                  Caption = 'Price 3'
                end
                object Label25: TLabel
                  Left = 8
                  Top = 56
                  Width = 33
                  Height = 13
                  Caption = 'Price 2'
                end
                object Label24: TLabel
                  Left = 8
                  Top = 32
                  Width = 33
                  Height = 13
                  Caption = 'Price 1'
                end
                object LEPricePurchase: TLabel
                  Left = 0
                  Top = 108
                  Width = 45
                  Height = 13
                  Caption = 'Purchase'
                end
                object BSavePriceChange: TBitBtn
                  Left = 84
                  Top = 125
                  Width = 123
                  Height = 25
                  Caption = 'Save'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 0
                  OnClick = BSavePriceChangeClick
                end
                object EPrice3: TEdit
                  Left = 56
                  Top = 76
                  Width = 81
                  Height = 21
                  TabOrder = 1
                  Text = 'EPrice3'
                  OnKeyPress = EPrice1KeyPress
                end
                object EPrice2: TEdit
                  Left = 56
                  Top = 52
                  Width = 81
                  Height = 21
                  TabOrder = 2
                  Text = 'EPrice2'
                  OnKeyPress = EPrice1KeyPress
                end
                object EPrice1: TEdit
                  Left = 56
                  Top = 28
                  Width = 81
                  Height = 21
                  TabOrder = 3
                  Text = 'EPrice1'
                  OnKeyPress = EPrice1KeyPress
                end
                object btnEnterIncExc: TBitBtn
                  Tag = 1
                  Left = 0
                  Top = 125
                  Width = 63
                  Height = 25
                  Caption = 'Inc'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 4
                  TabStop = False
                  OnClick = btnEnterIncExcClick
                end
                object ENewDescription: TEdit
                  Left = 0
                  Top = 0
                  Width = 221
                  Height = 21
                  TabOrder = 5
                  Text = 'ENewDescription'
                end
                object cbDefsupp: TCheckBox
                  Left = 144
                  Top = 28
                  Width = 71
                  Height = 17
                  Caption = 'def supp'
                  TabOrder = 6
                end
                object EPricePurchase: TEdit
                  Left = 56
                  Top = 104
                  Width = 81
                  Height = 21
                  TabOrder = 7
                  Text = 'EPrice3'
                  OnKeyPress = EPrice1KeyPress
                end
                object bStockPlugins: TBitBtn
                  Left = 143
                  Top = 56
                  Width = 82
                  Height = 25
                  Caption = 'Plugins'
                  DoubleBuffered = True
                  ParentDoubleBuffered = False
                  TabOrder = 8
                  OnClick = bStockPluginsClick
                end
                object PEXtraData: TPanel
                  Left = 0
                  Top = 164
                  Width = 225
                  Height = 115
                  Align = alBottom
                  TabOrder = 9
                  object Label31: TLabel
                    Left = 28
                    Top = 52
                    Width = 33
                    Height = 13
                    Caption = 'Trigger'
                  end
                  object Label30: TLabel
                    Left = 28
                    Top = 28
                    Width = 38
                    Height = 13
                    Caption = 'Reorder'
                  end
                  object Label29: TLabel
                    Left = 28
                    Top = 4
                    Width = 17
                    Height = 13
                    Caption = 'Min'
                  end
                  object Label32: TLabel
                    Left = 20
                    Top = 76
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '30 Days'
                  end
                  object Label33: TLabel
                    Left = 86
                    Top = 76
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '60 Days'
                  end
                  object Label34: TLabel
                    Left = 160
                    Top = 76
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '90 Days'
                  end
                  object Lsale30: TLabel
                    Left = 20
                    Top = 96
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '30 Days'
                  end
                  object Lsale60: TLabel
                    Left = 86
                    Top = 96
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '60 Days'
                  end
                  object Lsale90: TLabel
                    Left = 160
                    Top = 96
                    Width = 39
                    Height = 13
                    Alignment = taRightJustify
                    Caption = '90 Days'
                  end
                  object EEdiTrigg: TEdit
                    Left = 76
                    Top = 48
                    Width = 81
                    Height = 21
                    TabOrder = 0
                    Text = 'EPrice3'
                    OnKeyPress = EPrice1KeyPress
                  end
                  object EEdtMIN: TEdit
                    Left = 76
                    Top = 0
                    Width = 81
                    Height = 21
                    TabOrder = 1
                    Text = 'EPrice1'
                    OnKeyPress = EPrice1KeyPress
                  end
                  object EedtReord: TEdit
                    Left = 76
                    Top = 24
                    Width = 81
                    Height = 21
                    TabOrder = 2
                    Text = 'EPrice2'
                    OnKeyPress = EPrice1KeyPress
                  end
                end
                object bLabelPrint: TButton
                  Left = 143
                  Top = 87
                  Width = 82
                  Height = 25
                  Caption = 'Print-label'
                  TabOrder = 10
                  OnClick = bLabelPrintClick
                end
              end
            end
            object DBFreeLookup: TDBLookupComboBox
              Left = 540
              Top = 180
              Width = 145
              Height = 21
              DropDownWidth = 150
              KeyField = 'WGROUPID'
              ListField = 'SFULLDESC'
              ListSource = dsFreeLookup
              NullValueKey = 46
              TabOrder = 3
              Visible = False
              OnExit = DBLCBCostgroup1Exit
              OnKeyDown = DBLCBCostgroup1KeyDown
              OnKeyPress = DBLCBCostgroup2KeyPress
            end
            object PNewTotal: TPanel
              Left = 112
              Top = 30
              Width = 343
              Height = 36
              BevelInner = bvLowered
              TabOrder = 1
              Visible = False
              object LEnternewtotal: TLabel
                Left = 131
                Top = 12
                Width = 88
                Height = 13
                Alignment = taRightJustify
                Caption = 'Enter new inc total'
              end
              object ENewTotal: TEdit
                Left = 225
                Top = 8
                Width = 97
                Height = 21
                TabOrder = 0
                OnExit = ENewTotalExit
                OnKeyPress = ENewTotalKeyPress
              end
            end
          end
          object ToolBar1: TToolBar
            Left = 0
            Top = 0
            Width = 1013
            Height = 68
            AutoSize = True
            ButtonHeight = 68
            ButtonWidth = 92
            DisabledImages = dmOsfResource.BatchDisabledButtons
            DrawingStyle = dsGradient
            Images = dmOsfResource.BatchEnabledButtons
            ShowCaptions = True
            TabOrder = 0
            Transparent = True
            Wrapable = False
            object tbPlugins: TToolButton
              Left = 0
              Top = 0
              Caption = 'Plugins'
              DropdownMenu = pmPlugins
              ImageIndex = 3
              PopupMenu = pmPlugins
              Style = tbsDropDown
              OnClick = tbPluginsClick
            end
            object Thideshowitems: TToolButton
              Left = 105
              Top = 0
              Caption = 'Hide / show items'
              ImageIndex = 14
              OnClick = ThideshowitemsClick
            end
            object tlbtnDelete: TToolButton
              Left = 197
              Top = 0
              Hint = '^D : Delete'
              AutoSize = True
              Caption = '^D : Delete'
              ImageIndex = 0
              OnClick = tlbtnDeleteClick
            end
            object tlbtnInsert: TToolButton
              Left = 262
              Top = 0
              Hint = '^N : Insert'
              AutoSize = True
              Caption = '^N : Insert'
              ImageIndex = 1
              OnClick = tlbtnInsertClick
            end
            object tlbtnExclIncl: TToolButton
              Left = 322
              Top = 0
              Hint = 'F7 : Exclusive'
              AutoSize = True
              Caption = 'F7 : Exclusive'
              Grouped = True
              ImageIndex = 4
              Style = tbsCheck
              OnClick = tlbtnExclInclClick
            end
            object tlbtnIncl: TToolButton
              Left = 399
              Top = 0
              Caption = 'F7 : Inclusive'
              Down = True
              Grouped = True
              ImageIndex = 4
              Style = tbsCheck
              OnClick = tlbtnExclInclClick
            end
            object tlbtnDisc: TToolButton
              Left = 491
              Top = 0
              Hint = 'F8 : Discount'
              AutoSize = True
              Caption = 'F8 : Discount'
              ImageIndex = 17
              Style = tbsCheck
              OnClick = tlbtnDiscClick
            end
            object tlbtnComment: TToolButton
              Left = 565
              Top = 0
              Hint = 'F9 : Comment'
              AutoSize = True
              Caption = 'F9 : Comment'
              ImageIndex = 9
              OnClick = tlbtnCommentClick
            end
            object tlbtnDeleteInv: TToolButton
              Left = 641
              Top = 0
              Hint = 'F10 : Delete All'
              AutoSize = True
              Caption = 'F10 : Delete All'
              ImageIndex = 26
              OnClick = tlbtnDeleteInvClick
            end
            object TlbtnCopy: TToolButton
              Left = 724
              Top = 0
              AutoSize = True
              Caption = 'F11: Copy'
              ImageIndex = 11
              OnClick = TlbtnCopyClick
            end
            object tbBackorder: TToolButton
              Left = 783
              Top = 0
              Caption = 'Backorder'
              ImageIndex = 23
              OnClick = tbBackorderClick
            end
            object tbAddToBackorder: TToolButton
              Left = 875
              Top = 0
              Caption = 'Add to backorder'
              ImageIndex = 23
              OnClick = tbAddToBackorderClick
            end
          end
        end
        object PMAinData: TPanel
          Left = 0
          Top = 0
          Width = 1013
          Height = 238
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object PnlDocHeader: TPanel
            Left = 0
            Top = 75
            Width = 1013
            Height = 163
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            DesignSize = (
              1013
              163)
            object Label14: TLabel
              Left = 110
              Top = 8
              Width = 85
              Height = 13
              Caption = 'Postal Address'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Label19: TLabel
              Left = 467
              Top = 8
              Width = 51
              Height = 13
              Caption = 'Message'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object Image3: TImage
              Left = 268
              Top = 2
              Width = 19
              Height = 19
              AutoSize = True
              Picture.Data = {
                07544269746D6170DA050000424DDA0500000000000036000000280000001300
                0000130000000100200000000000A40500000000000000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E5CBCE00E6C9CC00E7D5
                D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00CDA2A100D29C9500DBAD9A00E1B59D00D3AF9700D5B4A200E9CFC500F0E5
                E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00CAA69C00CEA69000E6BA9E00FAC8A300F4C4
                9B00EFB89500E0B09500D0A59600D3ADA400E4C8C400EDDAD800FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DBAFA300ECC5
                9D00DBB09C00DDB1A400F7E3B700FBDDB400FBD4A600F8D1A200F5CCA000F2C4
                9E00F0C19A00E3B49C00DAB49700D1ABA300DBC2CB00FF00FF00FF00FF00FF00
                FF00FF00FF00DAB2A800F1D6AD00E3C6AB00D1A9A000F5E2C000F7EEC600FBEB
                BC00FBEBB700F6E1AB00FDD9A900FCD69F00FACB9E00F6C79C00D39C9400E0BC
                C600FF00FF00FF00FF00FF00FF00FF00FF00D8B6AA00F7E9C400FAF7C400F5E8
                BD00DDBAA200F7EFCD00F3FACD00FCFACE00FCF6C900FCF3C700FCEFC000F0DA
                B800D7B49B00D5AB9D00DEC2BF00FF00FF00FF00FF00FF00FF00FF00FF00D8B5
                B000F6E9C600FAFDCE00FDF8D500E4BEAC00DBC2B500FBFBE000FDFDDA00FDFB
                D300F6FACE00F9F8C800D9BDA900DDB79B00EAC19F00E5C7BC00FF00FF00FF00
                FF00FF00FF00FF00FF00DBB7AF00F9E8D500F7FDD900FDFBD700DAC5B700CD9F
                9A00E4C9BF00FAF9E900FCFCEC00F9EEDF00DCBFAE00E2C6AD00F8E5BC00F2DF
                B700E2CEBF00FF00FF00FF00FF00FF00FF00FF00FF00E0B8B000F2E9D300F3EA
                D100DACAB700CABBB700CCCCC900CAB7B600D9BBBB00E0C6C200D8BDB800CCA4
                9B00F2E2C400FAF8CD00E9E9BD00E2D1C500FF00FF00FF00FF00FF00FF00FF00
                FF00D3ADAF00DCBAB500C9B3BD00D3D0CC00ECF7F400F5FCFB00E0F9F600D4EA
                EB00CEDBE100C8DDE400CAC9CD00D8B4B100F2E0CE00F5E9C800E6CEC500FF00
                FF00FF00FF00FF00FF00FF00FF00CEA7AB00D99D9C00C6C0D900F5FDFC00FAFB
                F800FDFCF800F7FDFD00F2F8FD00EAFBFA00E8FDFA00E5FAFD00B8CCD000B6A8
                AB00EFD9C500E0D0CB00FF00FF00FF00FF00FF00FF00FF00FF00EED8DA00D5AC
                AE00BAC6DB00EFFEF500FCF9FA00F1F2F900DFEFF900D2EDF900D4E7F300D1D9
                E600BACBDD00AFC0D600A8A2B400CBA89F00DEC4C400FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00B5B5E30090B1E50078D2FB0078D3F80095D7
                F50097D2EA008FD1E80097C8E70094A9DD009AABE300A6A2CC00D3989A00E3BD
                C000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C8B5
                C0009BD5DF0091E4F60097E2FC0094DBFA008ED4F5008BD1EF008BCAEF009BB5
                DE00B4A4C300D7B9B400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00D1BFBF00B2C7C60091F5FD0099E2FC0095DD
                F80097D1ED00ABB2CC00C7B8BD00F2E2DF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2BD
                BF00A5CFD5009DE4EF009DDAE600BAB5C600D0ACBC00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00E4D4D700E0C9D000E8CAD000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00}
              Transparent = True
              OnDblClick = Image3DblClick
            end
            object Image2: TImage
              Left = 92
              Top = 3
              Width = 19
              Height = 19
              AutoSize = True
              Picture.Data = {
                07544269746D6170DA050000424DDA0500000000000036000000280000001300
                0000130000000100200000000000A40500000000000000000000000000000000
                0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E5CBCE00E6C9CC00E7D5
                D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00CDA2A100D29C9500DBAD9A00E1B59D00D3AF9700D5B4A200E9CFC500F0E5
                E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00CAA69C00CEA69000E6BA9E00FAC8A300F4C4
                9B00EFB89500E0B09500D0A59600D3ADA400E4C8C400EDDAD800FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DBAFA300ECC5
                9D00DBB09C00DDB1A400F7E3B700FBDDB400FBD4A600F8D1A200F5CCA000F2C4
                9E00F0C19A00E3B49C00DAB49700D1ABA300DBC2CB00FF00FF00FF00FF00FF00
                FF00FF00FF00DAB2A800F1D6AD00E3C6AB00D1A9A000F5E2C000F7EEC600FBEB
                BC00FBEBB700F6E1AB00FDD9A900FCD69F00FACB9E00F6C79C00D39C9400E0BC
                C600FF00FF00FF00FF00FF00FF00FF00FF00D8B6AA00F7E9C400FAF7C400F5E8
                BD00DDBAA200F7EFCD00F3FACD00FCFACE00FCF6C900FCF3C700FCEFC000F0DA
                B800D7B49B00D5AB9D00DEC2BF00FF00FF00FF00FF00FF00FF00FF00FF00D8B5
                B000F6E9C600FAFDCE00FDF8D500E4BEAC00DBC2B500FBFBE000FDFDDA00FDFB
                D300F6FACE00F9F8C800D9BDA900DDB79B00EAC19F00E5C7BC00FF00FF00FF00
                FF00FF00FF00FF00FF00DBB7AF00F9E8D500F7FDD900FDFBD700DAC5B700CD9F
                9A00E4C9BF00FAF9E900FCFCEC00F9EEDF00DCBFAE00E2C6AD00F8E5BC00F2DF
                B700E2CEBF00FF00FF00FF00FF00FF00FF00FF00FF00E0B8B000F2E9D300F3EA
                D100DACAB700CABBB700CCCCC900CAB7B600D9BBBB00E0C6C200D8BDB800CCA4
                9B00F2E2C400FAF8CD00E9E9BD00E2D1C500FF00FF00FF00FF00FF00FF00FF00
                FF00D3ADAF00DCBAB500C9B3BD00D3D0CC00ECF7F400F5FCFB00E0F9F600D4EA
                EB00CEDBE100C8DDE400CAC9CD00D8B4B100F2E0CE00F5E9C800E6CEC500FF00
                FF00FF00FF00FF00FF00FF00FF00CEA7AB00D99D9C00C6C0D900F5FDFC00FAFB
                F800FDFCF800F7FDFD00F2F8FD00EAFBFA00E8FDFA00E5FAFD00B8CCD000B6A8
                AB00EFD9C500E0D0CB00FF00FF00FF00FF00FF00FF00FF00FF00EED8DA00D5AC
                AE00BAC6DB00EFFEF500FCF9FA00F1F2F900DFEFF900D2EDF900D4E7F300D1D9
                E600BACBDD00AFC0D600A8A2B400CBA89F00DEC4C400FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00B5B5E30090B1E50078D2FB0078D3F80095D7
                F50097D2EA008FD1E80097C8E70094A9DD009AABE300A6A2CC00D3989A00E3BD
                C000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C8B5
                C0009BD5DF0091E4F60097E2FC0094DBFA008ED4F5008BD1EF008BCAEF009BB5
                DE00B4A4C300D7B9B400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00D1BFBF00B2C7C60091F5FD0099E2FC0095DD
                F80097D1ED00ABB2CC00C7B8BD00F2E2DF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2BD
                BF00A5CFD5009DE4EF009DDAE600BAB5C600D0ACBC00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00E4D4D700E0C9D000E8CAD000FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                FF00FF00FF00}
              Transparent = True
              OnDblClick = Image2DblClick
            end
            object LAddress1: TLabel
              Left = 41
              Top = 64
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'address 1'
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LAddress2: TLabel
              Left = 40
              Top = 84
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Address 2'
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LCompany: TLabel
              Left = 61
              Top = 26
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'comp'
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LContact: TLabel
              Left = 51
              Top = 44
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'contact'
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
            object LtaxRef: TLabel
              Left = 468
              Top = 84
              Width = 30
              Height = 13
              Caption = 'Taxref'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Bevel1: TBevel
              Left = 7
              Top = -3
              Width = 1395
              Height = 5
              Anchors = [akLeft, akTop, akRight]
              Shape = bsBottomLine
              ExplicitWidth = 1553
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
            object EDocEmailAddress: TEdit
              Left = 468
              Top = 118
              Width = 254
              Height = 21
              MaxLength = 120
              TabOrder = 19
            end
            object ECompany: TEdit
              Left = 92
              Top = 21
              Width = 171
              Height = 21
              MaxLength = 35
              PopupMenu = pmPasteFromClip
              TabOrder = 0
            end
            object EDelCompany: TEdit
              Left = 269
              Top = 21
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 7
            end
            object EMessage1: TEdit
              Left = 467
              Top = 21
              Width = 254
              Height = 21
              MaxLength = 35
              TabOrder = 14
            end
            object EContact: TComboBox
              Left = 92
              Top = 42
              Width = 171
              Height = 21
              TabOrder = 1
              OnChange = EContactChange
              OnDblClick = EContactDblClick
            end
            object EDelContact: TComboBox
              Left = 269
              Top = 42
              Width = 171
              Height = 21
              TabOrder = 8
              OnChange = EDelContactChange
              OnDblClick = EDelContactDblClick
            end
            object EMessage2: TEdit
              Left = 467
              Top = 42
              Width = 254
              Height = 21
              MaxLength = 35
              TabOrder = 15
            end
            object EPostal1: TEdit
              Left = 92
              Top = 61
              Width = 171
              Height = 21
              MaxLength = 35
              PopupMenu = pmPasteFromClip
              TabOrder = 2
            end
            object EDelAdr1: TEdit
              Left = 269
              Top = 61
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 9
            end
            object EMessage3: TEdit
              Left = 467
              Top = 63
              Width = 254
              Height = 21
              MaxLength = 35
              TabOrder = 16
            end
            object EPostal2: TEdit
              Left = 92
              Top = 80
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 3
            end
            object EDelAdr2: TEdit
              Left = 269
              Top = 80
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 10
            end
            object EPostal3: TEdit
              Left = 92
              Top = 99
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 4
            end
            object EDelAdr3: TEdit
              Left = 269
              Top = 99
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 11
            end
            object EPostalCode: TEdit
              Left = 92
              Top = 119
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 5
            end
            object EDelPostal: TEdit
              Left = 269
              Top = 119
              Width = 171
              Height = 21
              MaxLength = 35
              TabOrder = 12
            end
            object CBCountry: TComboBox
              Left = 92
              Top = 139
              Width = 171
              Height = 21
              Style = csDropDownList
              TabOrder = 6
            end
            object CBDelCountry: TComboBox
              Left = 269
              Top = 140
              Width = 171
              Height = 21
              Style = csDropDownList
              TabOrder = 13
            end
            object PExtra: TPanel
              Left = 735
              Top = 1
              Width = 234
              Height = 160
              BevelOuter = bvNone
              TabOrder = 20
              Visible = False
              DesignSize = (
                234
                160)
              object Lpaydiscount: TLabel
                Left = 12
                Top = 12
                Width = 141
                Height = 13
                Caption = 'Payment discount percentage'
              end
              object Lshipment: TLabel
                Left = 12
                Top = 56
                Width = 44
                Height = 13
                Caption = 'Shipment'
              end
              object lshipmentAmt: TLabel
                Left = 12
                Top = 97
                Width = 64
                Height = 13
                Caption = 'Shipment amt'
              end
              object EPaymentDiscount: TEdit
                Left = 12
                Top = 28
                Width = 213
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Text = '0'
                OnExit = EshipmentExit
                OnKeyPress = EPrice1KeyPress
              end
              object cbShipments: TComboBox
                Left = 12
                Top = 72
                Width = 217
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                OnChange = cbShipmentsChange
                OnDblClick = cbShipmentsDblClick
                OnExit = EshipmentExit
              end
              object Eshipment: TEdit
                Left = 12
                Top = 112
                Width = 217
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Text = '0'
                OnDblClick = cbShipmentsDblClick
                OnExit = EshipmentExit
                OnKeyPress = edtDiscountKeyPress
              end
            end
          end
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 1013
            Height = 75
            Align = alClient
            Alignment = taLeftJustify
            BevelOuter = bvNone
            TabOrder = 0
            object Label13: TLabel
              Left = 375
              Top = 2
              Width = 23
              Height = 13
              Caption = 'Date'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
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
              Font.Color = clBlack
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
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object lblRep2: TLabel
              Left = 144
              Top = 37
              Width = 55
              Height = 13
              Caption = 'RepGroup2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label3i: TLabel
              Left = 16
              Top = 37
              Width = 46
              Height = 13
              Caption = 'Salesman'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label21: TLabel
              Left = 375
              Top = 37
              Width = 46
              Height = 13
              Caption = 'Due Date'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LProject: TLabel
              Left = 516
              Top = 37
              Width = 33
              Height = 13
              Caption = 'Project'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
              Visible = False
            end
            object lstate: TLabel
              Left = 843
              Top = 15
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'State'
            end
            object edtOrderNumber: TEdit
              Left = 16
              Top = 15
              Width = 119
              Height = 21
              TabOrder = 0
              OnDblClick = edtOrderNumberDblClick
              OnExit = edtOrderNumberExit
            end
            object cbSalesman: TComboBox
              Left = 16
              Top = 51
              Width = 121
              Height = 21
              Style = csDropDownList
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
            end
            object CbxRepGroup2: TComboBox
              Left = 144
              Top = 51
              Width = 221
              Height = 21
              AutoDropDown = True
              Style = csDropDownList
              TabOrder = 3
            end
            object CbxRepGroup1: TComboBox
              Left = 144
              Top = 15
              Width = 221
              Height = 21
              AutoDropDown = True
              Style = csDropDownList
              TabOrder = 2
            end
            object cbProject: TComboBox
              Left = 516
              Top = 51
              Width = 221
              Height = 21
              Style = csDropDownList
              TabOrder = 5
              OnDropDown = cbProjectDropDown
            end
            object BPutOnAccount: TBitBtn
              Left = 515
              Top = 10
              Width = 221
              Height = 21
              Caption = 'Default'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 4
              TabStop = False
              OnClick = BPutOnAccountClick
            end
            object pCurrency: TPanel
              Left = 752
              Top = 36
              Width = 245
              Height = 38
              BevelOuter = bvNone
              TabOrder = 6
              object Label27: TLabel
                Left = 1
                Top = 1
                Width = 42
                Height = 13
                Caption = 'Currency'
              end
              object Label28: TLabel
                Left = 125
                Top = 1
                Width = 23
                Height = 13
                Caption = 'Rate'
              end
              object cbCurrency: TComboBox
                Left = 1
                Top = 15
                Width = 105
                Height = 21
                Style = csDropDownList
                TabOrder = 0
                OnChange = cbCurrencyChange
              end
              object cbRate: TEdit
                Left = 124
                Top = 15
                Width = 109
                Height = 21
                TabOrder = 1
                Text = 'cbRate'
                OnKeyPress = edtDiscountKeyPress
              end
            end
            object cbPosted: TComboBox
              Left = 877
              Top = 9
              Width = 108
              Height = 21
              Style = csDropDownList
              TabOrder = 7
              Items.Strings = (
                'Open'
                'Confirmd'
                'Posted')
            end
            object dtpDate: TcxDateEdit
              Left = 371
              Top = 15
              Properties.AutoSelect = False
              Properties.DateButtons = [btnToday]
              Properties.ShowTime = False
              Properties.WeekNumbers = True
              Properties.OnChange = dtpDateChange
              TabOrder = 8
              OnExit = dtpDateExit
              Width = 129
            end
            object dtpDuedate: TcxDateEdit
              Left = 371
              Top = 51
              Properties.AutoSelect = False
              Properties.DateButtons = [btnToday]
              Properties.SaveTime = False
              Properties.ShowTime = False
              Properties.WeekNumbers = True
              TabOrder = 9
              OnExit = dtpDuedateExit
              Width = 129
            end
          end
        end
        object Panel10: TPanel
          Left = 0
          Top = 483
          Width = 1013
          Height = 133
          Align = alBottom
          BevelOuter = bvNone
          PopupMenu = PMNextPrev
          TabOrder = 2
          object Label22: TLabel
            Left = 23
            Top = 35
            Width = 75
            Height = 13
            Caption = 'Invoice Number'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            Visible = False
          end
          object LFastlookup: TLabel
            Left = 21
            Top = 71
            Width = 207
            Height = 13
            Caption = 'Fast add item (stockcode / barcode / serial)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object BtnOkPrint: TBitBtn
            Left = 648
            Top = 74
            Width = 90
            Height = 25
            Cancel = True
            Caption = 'OK'
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
            OnClick = BtnOkPrintClick
            OnMouseDown = BtnOkPrintMouseDown
          end
          object BtnClose: TBitBtn
            Left = 544
            Top = 74
            Width = 90
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
            TabOrder = 1
            TabStop = False
            OnClick = BtnCloseClick
            OnMouseDown = BtnCloseMouseDown
          end
          object StatusBar: TStatusBar
            Left = 0
            Top = 109
            Width = 1013
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Panels = <
              item
                Text = 'xxxx'
                Width = 150
              end
              item
                Width = 0
              end>
            SizeGrip = False
            UseSystemFont = False
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 1013
            Height = 70
            Align = alTop
            BevelOuter = bvNone
            PopupMenu = PMNextPrev
            TabOrder = 3
            object Label2: TLabel
              Left = 531
              Top = 5
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Exclusive Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label4: TLabel
              Left = 541
              Top = 52
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Invoice Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label1: TLabel
              Left = 534
              Top = 37
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Discount'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label5: TLabel
              Left = 585
              Top = 21
              Width = 18
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tax'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label1i: TLabel
              Left = 20
              Top = 1
              Width = 32
              Height = 13
              Caption = 'Debtor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label17: TLabel
              Left = 237
              Top = 37
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Credit Limit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label18: TLabel
              Left = 245
              Top = 21
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Available'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label16: TLabel
              Left = 212
              Top = 5
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Current Balance'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LGross: TLabel
              Left = 417
              Top = 5
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Gross'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LNetto: TLabel
              Left = 418
              Top = 21
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Netto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LStdDiscount: TLabel
              Left = 229
              Top = 52
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Std discount'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label2i: TLabel
              Left = 21
              Top = 35
              Width = 32
              Height = 13
              Caption = 'Docno'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object LEndTotal: TLabel
              Left = 861
              Top = 36
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'End total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label10: TLabel
              Left = 396
              Top = 37
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'gross cost'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label23: TLabel
              Left = 390
              Top = 52
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'gross proffit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object lblInvAmt: TStaticText
              Left = 608
              Top = 52
              Width = 98
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
            end
            object cbInvoiceNumber: TComboBox
              Left = 20
              Top = 49
              Width = 150
              Height = 21
              Style = csDropDownList
              Color = clBtnFace
              Enabled = False
              TabOrder = 1
              Visible = False
              OnExit = cbInvoiceNumberExit
            end
            object edtAccountNumber: TEdit
              Left = 20
              Top = 15
              Width = 149
              Height = 21
              Color = clBtnFace
              Enabled = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 2
            end
            object lblCredLimit: TStaticText
              Left = 290
              Top = 37
              Width = 79
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00 '
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 3
            end
            object lblAvailable: TStaticText
              Left = 290
              Top = 21
              Width = 79
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00 '
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 4
            end
            object lblPostBal: TStaticText
              Left = 290
              Top = 5
              Width = 79
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00 '
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 5
            end
            object LNettoWeigth: TStaticText
              Left = 448
              Top = 21
              Width = 63
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 6
            end
            object LGrossWeigth: TStaticText
              Left = 448
              Top = 5
              Width = 63
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 7
            end
            object LblDiscount: TStaticText
              Left = 608
              Top = 37
              Width = 98
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 8
            end
            object LPaymentTotal: TStaticText
              Left = 712
              Top = 52
              Width = 85
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 9
              OnDblClick = LPaymentTotalDblClick
            end
            object lbDiscountperc: TStaticText
              Left = 290
              Top = 52
              Width = 79
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00 '
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 10
            end
            object EndTotal: TStaticText
              Left = 804
              Top = 52
              Width = 98
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 11
            end
            object stgrosscost: TStaticText
              Left = 448
              Top = 37
              Width = 63
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 12
            end
            object stGrossProfit: TStaticText
              Left = 448
              Top = 52
              Width = 63
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = '0.00'
              Color = clInactiveBorder
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 13
            end
            object LLPaymentTotal: TButton
              Left = 713
              Top = 31
              Width = 83
              Height = 20
              Caption = 'Payments'
              TabOrder = 14
              OnClick = LPaymentTotalDblClick
            end
          end
          object LblExcl: TStaticText
            Left = 608
            Top = 3
            Width = 98
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0.00'
            Color = clInactiveBorder
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 4
          end
          object LblTax: TStaticText
            Left = 608
            Top = 19
            Width = 98
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0.00'
            Color = clInactiveBorder
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 5
            OnDblClick = LblTaxDblClick
          end
          object EFastbarcodelookup: TEdit
            Left = 20
            Top = 86
            Width = 201
            Height = 21
            TabOrder = 6
            OnKeyPress = EFastbarcodelookupKeyPress
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 0
          Top = 238
          Width = 1013
          Height = 8
          HotZoneClassName = 'TcxXPTaskBarStyle'
          AlignSplitter = salTop
          AutoSnap = True
          Control = PMAinData
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'listnew'
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
    end
    object pnlDiscount: TPanel
      Left = 160
      Top = 458
      Width = 211
      Height = 36
      BevelInner = bvLowered
      TabOrder = 0
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
  object PopupMenu1: TPopupMenu
    Images = dmOsfResource.MenuImages
    Left = 296
    Top = 180
    object Entertotal1: TMenuItem
      Caption = 'Enter total'
      OnClick = Entertotal1Click
    end
    object Up1: TMenuItem
      Caption = 'Up'
      ImageIndex = 39
      ShortCut = 49237
      OnClick = Up1Click
    end
    object Down1: TMenuItem
      Caption = 'Down'
      ImageIndex = 40
      ShortCut = 49220
      OnClick = Down1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Sortonstockcode1: TMenuItem
      Caption = 'Sort on stockcode'
      ImageIndex = 50
      OnClick = Sortonstockcode1Click
    end
    object Link1: TMenuItem
      Caption = 'Link'
      OnClick = Link1Click
    end
  end
  object QDocHead: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'SELECT dochead.WDocID, '
      'dochead.SDocNo, cast(dochead.DDate as Date) DDate,'
      'cast(dochead.DDUEDATE as Date) DDUEDATE,'
      'dochead.DAllocatedDate, dochead.WAccountID, '
      
        'dochead.WPaymentTypeID, dochead.FInvoiceDiscount, dochead.BPrint' +
        'ed,'
      ' dochead.BExclusive,  dochead.FDocAmount  '
      '  ,  dochead.FTaxAmount  , '
      'dochead.BPOSTED,'
      'dochead.SReference, dochead.WSourceTypeID,'
      'Group1.SDescription SGroup1Desc, Group2.SDescription SGroup2Desc'
      ', Group1.WColor WGroup1Color,'
      'Group1.WTextColor WGroup1TextColor,'
      
        'Account.SAccountCode, Account.SDescription SAccountDescription, ' +
        'Account.WaccountTypeid,'
      'Salesman.SDescription SSalesManDescription '
      ',  (dochead.FDocAmount - dochead.FTaxAmount) ExcAmount'
      ', transact.FOutstandingAmount openamount '
      ', Mess1.SDescription as TRN_239_A,'
      'Mess2.SDescription as TRN_239_B,'
      'Mess3.SDescription as TRN_239_C,'
      'DelPostid1.SDescription as TRN_2049_2220,'
      'DelPostid2.SDescription as TRN_2049_2206,'
      'DelPostid3.SDescription as TRN_2049_2420,'
      'DelPostCode.SDescription as TRN_2049_190,'
      'DelCountry.COUNTRIES_NAME as TRN_2049_2388,'
      'Postid1.SDescription as TRN_2220,'
      'Postid2.SDescription as TRN_2206,'
      'Postid3.SDescription as TRN_2420,'
      'PostCode.SDescription as TRN_190,'
      'PostCountry.COUNTRIES_NAME as TRN_2388,'
      'postcomp.SDescription as TRN_1145_2279,'
      'postcontact.SDescription as TRN_1145_2415,'
      'DelComp.SDescription as TRN_2049_2279,'
      'DelContact.SDescription as TRN_2049_2415'
      ',dochead.WREPORTINGGROUP2ID'
      ' FROM dochead '
      ' '
      
        '  JOIN transact ON  (dochead.WOPENITEMTRANSACTID  = transact.WTr' +
        'ansactionid )'
      
        'LEFT OUTER JOIN Account Account ON  (dochead.WAccountID = Accoun' +
        't.WAccountID ) '
      
        'LEFT OUTER JOIN Groups Group1 ON  (dochead.WReportingGroup1ID = ' +
        'Group1.WGroupID)'
      
        'LEFT OUTER JOIN Groups Group2 ON  (dochead.WReportingGroup2ID = ' +
        'Group2.WGroupID) '
      
        'LEFT OUTER JOIN Groups Salesman ON  (dochead.WSalesmanID = Sales' +
        'man.WGroupID)'
      
        'left join Messages Postid1 on (dochead.WPostal1ID = Postid1.WMes' +
        'sageID)'
      
        'left join Messages Postid2 on (dochead.WPostal2ID = Postid2.WMes' +
        'sageID)'
      
        'left join Messages Postid3 on (dochead.WPostal3ID = Postid3.WMes' +
        'sageID)'
      
        'left join Messages Postcode on (dochead.WPostalCodeID = Postcode' +
        '.WMessageID)'
      
        'left join Messages DelPostid1 on (dochead.WDelAddress1ID = DelPo' +
        'stid1.WMessageID)'
      
        'left join Messages DelPostid2 on (dochead.WDelAddress2ID = DelPo' +
        'stid2.WMessageID)'
      
        'left join Messages DelPostid3 on (dochead.WDelAddress3ID = DelPo' +
        'stid3.WMessageID)'
      
        'left join Messages DelPostcode on (dochead.WDelCodeID = DelPostc' +
        'ode.WMessageID)'
      
        'left join Messages Mess1 on (dochead.WMessage1ID = Mess1.WMessag' +
        'eID)'
      
        'left join Messages Mess2 on (dochead.WMessage2ID = Mess2.WMessag' +
        'eID)'
      
        'left join Messages Mess3 on (dochead.WMessage3ID = Mess3.WMessag' +
        'eID)'
      ''
      
        'left join Messages postcomp on (dochead.WPOSTALNAME = postcomp.W' +
        'MessageID)'
      
        'left join Messages postcontact on (dochead.WPOSTALCONTACT = post' +
        'contact.WMessageID)'
      
        'left join Messages DelComp on (dochead.WDELNAME = DelComp.WMessa' +
        'geID)'
      
        'left join Messages DelContact on (dochead.WDELCONTACT = DelConta' +
        'ct.WMessageID)'
      ''
      
        'left OUTER join COUNTRIES DelCountry on (dochead.WDELCOUNTRIES_I' +
        'D = DelCountry.COUNTRIES_ID)'
      
        'left OUTER join COUNTRIES PostCountry on (dochead.WPOSCOUNTRIES_' +
        'ID = postCountry.COUNTRIES_ID)'
      'WHERE  dochead.SDocNo <> '#39#39)
    AfterOpen = QDocHeadAfterOpen
    AfterScroll = QDocHeadAfterScroll
    OnCalcFields = QDocHeadCalcFields
    Left = 512
    Top = 200
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
      OnGetText = QDocHeadSACCOUNTCODEGetText
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
    object QDocHeadWGROUP1COLOR: TIntegerField
      FieldName = 'WGROUP1COLOR'
    end
    object QDocHeadWGROUP1TEXTCOLOR: TIntegerField
      FieldName = 'WGROUP1TEXTCOLOR'
    end
    object QDocHeadCALOPENAMOUNT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CALOPENAMOUNT'
      DisplayFormat = '0.00'
      Calculated = True
    end
    object QDocHeadBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object QDocHeadWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object QDocHeadWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object QDocHeadDUMMMYEXPRES: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'DUMMMYEXPRES'
      Calculated = True
    end
  end
  object DSDocHead: TDataSource
    DataSet = QDocHead
    Left = 404
    Top = 172
  end
  object PopupMenu2: TPopupMenu
    OwnerDraw = True
    OnPopup = PopupMenu2Popup
    Left = 432
    Top = 244
    object Salesman1: TMenuItem
      Caption = 'Salesman'
    end
    object Setreportinggroup1: TMenuItem
      Caption = 'Set reportinggroup 1    '
      ImageIndex = 38
    end
    object Setreportinggroup2: TMenuItem
      Caption = 'Set reportinggroup 2'
      ImageIndex = 38
    end
    object Documents1: TMenuItem
      Caption = 'Documents'
      ImageIndex = 11
      object Copydocument1: TMenuItem
        Caption = 'Copy document'
        ImageIndex = 11
        OnClick = Copydocument1Click
      end
      object ConverttoInvoice1: TMenuItem
        Caption = 'Convert to Invoice'
        ImageIndex = 23
        OnClick = ConverttoInvoice1Click
      end
      object Invoicetoorderondefsupp11: TMenuItem
        Caption = 'Invoice to order on def supp 1'
        OnClick = Invoicetoorderondefsupp11Click
      end
      object Convertinvoicetopurchase1: TMenuItem
        Caption = 'Convert invoice to order'
        OnClick = Convertinvoicetopurchase1Click
      end
      object Convertdocumentstosingledocument1: TMenuItem
        Caption = 'Convert documents to single document'
        ImageIndex = 2
        OnClick = Convertdocumentstosingledocument1Click
      end
      object ConverttoCreditnote1: TMenuItem
        Caption = 'Convert to creditnote / returnnote'
        OnClick = ConverttoCreditnote1Click
      end
      object ReaplayITemsDicounts: TMenuItem
        Caption = 'Redo item discount on document.'
        OnClick = ReaplayITemsDicountsClick
      end
      object Changeaccount1: TMenuItem
        Caption = 'Change account'
        ImageIndex = 49
        OnClick = Changeaccount1Click
      end
      object EditAccount1: TMenuItem
        Caption = 'Edit Account'
        ImageIndex = 7
        OnClick = Editaccount1Click
      end
      object Setdate1: TMenuItem
        Caption = 'Set date'
        OnClick = Setdate1Click
      end
      object RecalcStockAvail: TMenuItem
        Caption = 'Recalculate stock available'
        OnClick = RecalcStockAvailClick
      end
      object Createpurchaseondefaultsupplier11: TMenuItem
        Caption = 'Create purchase on default supplier 1'
        OnClick = Createpurchaseondefaultsupplier11Click
      end
      object Createbackorderstodeliver1: TMenuItem
        Caption = 'Create backorders to deliver'
        OnClick = Createbackorderstodeliver1Click
      end
      object CopyDocTo1: TMenuItem
        Caption = 'Copy to'
        object ctOrder: TMenuItem
          Tag = 15
          Caption = 'Order'
          OnClick = CreateStockinfromdocuments1Click
        end
        object ctPurchase: TMenuItem
          Tag = 12
          Caption = 'Purchase'
          OnClick = CreateStockinfromdocuments1Click
        end
        object ctReturnnote: TMenuItem
          Tag = 13
          Caption = 'Returnnote'
          OnClick = CreateStockinfromdocuments1Click
        end
        object ctQuote: TMenuItem
          Tag = 14
          Caption = 'Quote'
          OnClick = CreateStockinfromdocuments1Click
        end
        object ctInvoice: TMenuItem
          Tag = 10
          Caption = 'Invoice'
          OnClick = CreateStockinfromdocuments1Click
        end
        object ctCreditnote: TMenuItem
          Tag = 11
          Caption = 'Credit note'
          OnClick = CreateStockinfromdocuments1Click
        end
        object ctStockin: TMenuItem
          Tag = 17
          Caption = 'Stock in'
          OnClick = CreateStockinfromdocuments1Click
        end
        object ctStockout: TMenuItem
          Tag = 16
          Caption = 'Stock out'
          OnClick = CreateStockinfromdocuments1Click
        end
      end
    end
    object Print1: TMenuItem
      Caption = 'Print'
      ImageIndex = 25
      object Printbarcodes1: TMenuItem
        Caption = 'Print barcodes'
        OnClick = Printbarcodes1Click
      end
      object Printlabel1: TMenuItem
        Caption = 'Print label'
        OnClick = Printlabel1Click
      end
    end
    object Extras1: TMenuItem
      Caption = 'Extras'
      object Export1: TMenuItem
        Caption = 'Export'
        OnClick = Export1Click
      end
      object Import1: TMenuItem
        Caption = 'Import'
        OnClick = Import1Click
      end
      object Totals1: TMenuItem
        Caption = 'Totals'
        OnClick = Totals1Click
      end
      object Showinfo1: TMenuItem
        Caption = 'Show info'
        OnClick = Showinfo1Click
      end
      object OpenOSCOmmercecustomerinbrowser1: TMenuItem
        Caption = 'Open OSCOmmerce customer in browser'
        OnClick = OpenOSCOmmercecustomerinbrowser1Click
      end
      object openOSCommerceorderinbrowser1: TMenuItem
        Caption = 'open OSCommerce order in browser'
        OnClick = openOSCommerceorderinbrowser1Click
      end
      object Openitem1: TMenuItem
        Caption = 'Openitem'
        OnClick = Openitem1Click
      end
    end
    object Plugins1: TMenuItem
      Caption = 'Plugins'
      ImageIndex = 53
    end
    object Massaction1: TMenuItem
      Caption = 'Plugins mass action'
      ImageIndex = 53
    end
    object URLPayment1: TMenuItem
      Caption = 'URL Payment'
      OnClick = URLPayment1Click
    end
    object Links1: TMenuItem
      Caption = 'Links'
    end
    object newdoctest1: TMenuItem
      Caption = 'new doc test'
      Visible = False
      OnClick = newdoctest1Click
    end
  end
  object PMNextPrev: TPopupMenu
    Images = dmOsfResource.MenuImages
    Left = 496
    Top = 372
    object CancelNext1: TMenuItem
      Caption = 'Cancel Next'
      OnClick = CancelNext1Click
    end
    object CancelPrev1: TMenuItem
      Caption = 'Cancel Prev'
      OnClick = CancelPrev1Click
    end
  end
  object pmPasteFromClip: TPopupMenu
    OnPopup = pmPasteFromClipPopup
    Left = 156
    Top = 288
    object Pastefromclipboard1: TMenuItem
      Caption = 'Paste from clipboard'
      ImageIndex = 17
      OnClick = Pastefromclipboard1Click
    end
    object Importfromtabfile1: TMenuItem
      Caption = 'Import from tab file'
      ImageIndex = 36
      OnClick = Importfromtabfile1Click
    end
  end
  object TUpdateDocuments: TTimer
    Enabled = False
    OnTimer = TUpdateDocumentsTimer
    Left = 249
    Top = 389
  end
  object tblBatch: TUniTable
    TableName = 'DOCBATCH_1_1'
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    BeforeOpen = tblBatchBeforeOpen
    BeforeInsert = tblBatchBeforeInsert
    AfterInsert = tblBatchAfterInsert
    BeforePost = tblBatchBeforePost
    AfterScroll = tblBatchAfterScroll
    OnCalcFields = tblBatchCalcFields
    Left = 260
    Top = 68
    object tblBatchWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object tblBatchSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      OnGetText = tblBatchSREFERENCEGetText
      Size = 15
    end
    object tblBatchSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 8
    end
    object tblBatchSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      OnGetText = tblBatchSDESCRIPTIONGetText
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
      OnGetText = tblBatchSTAXGetText
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
      OnChange = tblBatchSCONTRAACCOUNTChange
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
      OnGetText = tblBatchWCONTRAACCOUNTIDGetText
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
    object tblBatchFUNITQTY: TFloatField
      FieldName = 'FUNITQTY'
    end
    object tblBatchWUNITID: TIntegerField
      FieldName = 'WUNITID'
      OnChange = tblBatchWUNITIDChange
      OnGetText = tblBatchWUNITIDGetText
    end
    object tblBatchLONGTEXT: TStringField
      FieldKind = fkCalculated
      FieldName = 'LONGTEXT'
      Size = 2000
      Calculated = True
    end
  end
  object dsBatch: TDataSource
    DataSet = tblBatch
    Left = 350
    Top = 79
  end
  object tblBatchRefTotals: TUniTable
    TableName = 'BAT0T2'
    DataTypeMap = <>
    Left = 432
    Top = 87
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
  object ZQCostGroup2: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select WGroupid from v_groups  groups where WGroupId = 0'
      'union'
      'Select WGroupid from v_groups  groups where WGroupTypeID= 1003'
      'and (BDisable is null or BDisable = 0)')
    OnCalcFields = ZQCostGroup2CalcFields
    Left = 688
    Top = 497
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
  object ZQCostgroup1: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select WGroupid from v_groups groups where WGroupId = 0'
      'union'
      'Select WGroupid from v_groups groups where WGroupTypeID= 1002'
      'and (BDisable is null or BDisable = 0)')
    OnCalcFields = ZQCostgroup1CalcFields
    Left = 904
    Top = 474
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
    Left = 284
    Top = 274
  end
  object dsCostGroup2: TDataSource
    DataSet = ZQCostGroup2
    Left = 336
    Top = 222
  end
  object OpenDialog1: TOpenDialog
    FileName = 'export.txf'
    Filter = 'Txf |*.txf|CSV|*.csv|All files|*.*'
    Left = 105
    Top = 207
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txf'
    FileName = 'Export'
    Filter = 'Txf|*.txf|Csv|*.csv|All files|*.*'
    FilterIndex = 2
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 181
    Top = 219
  end
  object OpenDialog2: TOpenDialog
    Left = 361
    Top = 279
  end
  object pmPlugins: TPopupMenu
    Left = 169
    Top = 361
  end
  object ZQStockOptions: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select * from STOCKOPTIONS where WStockid =:WStockid and coalesc' +
        'e(STOCKOPTIONS.BENABLED,1) = 1')
    Left = 216
    Top = 369
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WStockid'
      end>
    object ZQStockOptionsWSTOCKOPTIONSID: TIntegerField
      FieldName = 'WSTOCKOPTIONSID'
      Required = True
    end
    object ZQStockOptionsWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE1ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE1ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE2ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE2ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE3ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE3ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE4ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE4ID'
    end
    object ZQStockOptionsWITEMOPTIONVALUE5ID: TIntegerField
      FieldName = 'WITEMOPTIONVALUE5ID'
    end
    object ZQStockOptionsFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
    end
    object ZQStockOptionsFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object ZQStockOptionsSBARCODE: TStringField
      FieldName = 'SBARCODE'
      Size = 25
    end
    object ZQStockOptionsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
    end
    object ZQStockOptionsFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object ZQStockOptionsFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object ZQStockOptionsFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object ZQStockOptionsFREORDERQTYTRIG: TFloatField
      FieldName = 'FREORDERQTYTRIG'
    end
  end
  object ZQUnit: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from unit')
    Left = 568
    Top = 183
    object ZQUnitSDESCRIPTION: TStringField
      DisplayWidth = 8
      FieldName = 'SDESCRIPTION'
      Size = 8
    end
    object ZQUnitWUNITID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WUNITID'
      Required = True
      Visible = False
    end
    object ZQUnitDSYSDATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DSYSDATE'
      Visible = False
    end
    object ZQUnitFUNITQTY: TFloatField
      DisplayWidth = 10
      FieldName = 'FUNITQTY'
      Visible = False
    end
  end
  object dsUnit: TDataSource
    DataSet = ZQUnit
    Left = 228
    Top = 179
  end
  object PopupMenu5: TPopupMenu
    Left = 94
    Top = 81
  end
  object pmStockPlugins: TPopupMenu
    OnPopup = pmStockPluginsPopup
    Left = 616
    Top = 414
  end
  object ZQFreeLookup: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select WGroupid from groups where WGroupId = 0'
      'union'
      'Select WGroupid from groups where WGroupTypeID= 1030'
      'and (BDisable is null or BDisable = 0)')
    OnCalcFields = ZQFreeLookupCalcFields
    Left = 488
    Top = 254
    object ZQFreeLookupSFULLDESC: TStringField
      DisplayLabel = 'SFULDESC'
      FieldKind = fkCalculated
      FieldName = 'SFULLDESC'
      Size = 255
      Calculated = True
    end
    object ZQFreeLookupWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
  end
  object dsFreeLookup: TDataSource
    DataSet = ZQFreeLookup
    Left = 312
    Top = 418
  end
  object EditLineTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = EditStockTimer
    Left = 448
    Top = 171
  end
  object TAddNew: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TAddNewTimer
    Left = 507
    Top = 104
  end
end
