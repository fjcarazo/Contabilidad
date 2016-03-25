object fmOpenLink: TfmOpenLink
  Left = 217
  Top = 141
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'c'
  ClientHeight = 569
  ClientWidth = 931
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 931
    Height = 569
    ActivePage = tsList
    Align = alClient
    TabOrder = 0
    OnChanging = pcMainChanging
    object tsDetail: TTabSheet
      Caption = 'tsDetail'
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 923
        Height = 133
        Align = alTop
        TabOrder = 0
        object PnlBar: TPanel
          Left = 1
          Top = 67
          Width = 921
          Height = 65
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object ToolBar: TToolBar
            Left = 0
            Top = 0
            Width = 921
            Height = 65
            Align = alClient
            AutoSize = True
            ButtonHeight = 68
            ButtonWidth = 76
            Caption = 'ToolBar'
            DisabledImages = dmOsfResource.BatchDisabledButtons
            DrawingStyle = dsGradient
            Images = dmOsfResource.BatchEnabledButtons
            ShowCaptions = True
            TabOrder = 0
            Transparent = True
            object BtnClear: TToolButton
              Left = 0
              Top = 0
              AutoSize = True
              Caption = 'F6 : Clear links'
              ImageIndex = 72
              OnClick = BtnClearClick
            end
            object BtnBBF: TToolButton
              Left = 80
              Top = 0
              AutoSize = True
              Caption = 'F7 : Gen BB/F'
              ImageIndex = 23
              OnClick = btnBBFClick
            end
            object BtnUnlink: TToolButton
              Left = 160
              Top = 0
              AutoSize = True
              Caption = 'F8 : Unlink'
              ImageIndex = 71
              Style = tbsCheck
              OnClick = BtnUnlinkClick
            end
            object ToolButton1: TToolButton
              Left = 222
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 20
              Style = tbsSeparator
            end
            object ToolButton2: TToolButton
              Left = 230
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 20
              Style = tbsSeparator
            end
            object ToolButton3: TToolButton
              Left = 238
              Top = 0
              AutoSize = True
              Caption = 'Process'
              ImageIndex = 71
              OnClick = ToolButton3Click
            end
            object ToolButton5: TToolButton
              Left = 293
              Top = 0
              Width = 8
              Caption = 'ToolButton5'
              ImageIndex = 8
              Style = tbsSeparator
            end
            object tbnStatmt: TToolButton
              Left = 301
              Top = 0
              AutoSize = True
              Caption = 'Statement'
              ImageIndex = 68
              Style = tbsCheck
              OnClick = tbnStatmtClick
            end
            object ToolButton4: TToolButton
              Left = 360
              Top = 0
              Caption = 'Close'
              ImageIndex = 34
              OnClick = ToolButton4Click
            end
            object BtnExportDetails: TToolButton
              Left = 436
              Top = 0
              Caption = 'Export'
              ImageIndex = 2
              OnClick = BtnExportDetailsClick
            end
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 921
          Height = 66
          Align = alTop
          TabOrder = 1
          DesignSize = (
            921
            66)
          object Shape3: TShape
            Left = 4
            Top = 6
            Width = 1234
            Height = 53
            Anchors = [akLeft, akRight, akBottom]
            Brush.Color = clGray
            Shape = stRoundRect
            ExplicitWidth = 1427
          end
          object lblAccountDesc: TLabel
            Left = 191
            Top = 19
            Width = 75
            Height = 13
            Anchors = []
            Caption = 'lblAccountDesc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
            ExplicitLeft = 239
          end
          object Label1: TLabel
            Left = 14
            Top = 19
            Width = 40
            Height = 13
            Anchors = [akLeft, akRight, akBottom]
            Caption = 'Account'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object LExtraData: TLabel
            Left = 15
            Top = 37
            Width = 40
            Height = 13
            Anchors = [akLeft, akRight, akBottom]
            Caption = 'Account'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object edtAccount: TEdit
            Left = 74
            Top = 18
            Width = 91
            Height = 16
            Anchors = [akLeft, akBottom]
            BevelOuter = bvNone
            BorderStyle = bsNone
            ReadOnly = True
            TabOrder = 0
            OnKeyDown = edtAccountKeyDown
            OnKeyUp = edtAccountKeyUp
          end
        end
      end
      object PanelUnlink: TPanel
        Left = 91
        Top = 195
        Width = 410
        Height = 186
        TabOrder = 3
        Visible = False
        OnExit = PanelUnlinkExit
        object Bevel1: TBevel
          Left = 20
          Top = 62
          Width = 269
          Height = 115
        end
        object lblFrDt: TLabel
          Left = 28
          Top = 74
          Width = 49
          Height = 13
          Caption = 'From Date'
        end
        object Label4: TLabel
          Left = 28
          Top = 100
          Width = 42
          Height = 13
          Caption = 'To Date:'
        end
        object edtDateFrom: TcxDateEdit
          Left = 106
          Top = 71
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 0
          Width = 121
        end
        object BitBtnOk: TBitBtn
          Left = 296
          Top = 124
          Width = 105
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
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = BitBtnOkClick
        end
        object BitBtnClose: TBitBtn
          Left = 296
          Top = 156
          Width = 105
          Height = 25
          Caption = 'Close'
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
          TabOrder = 3
          OnClick = BitBtnCloseClick
        end
        object MyCaptionBar: TStaticText
          Left = 1
          Top = 1
          Width = 408
          Height = 17
          Align = alTop
          BorderStyle = sbsSunken
          Caption = 'Clear links options'
          Color = clActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clCaptionText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          OnMouseDown = MyCaptionBarMouseDown
        end
        object cbDDebit: TCheckBox
          Left = 30
          Top = 148
          Width = 123
          Height = 17
          Caption = 'By Debit Dates'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cbDCredit: TCheckBox
          Left = 159
          Top = 148
          Width = 127
          Height = 17
          Caption = 'By Credit Dates'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object cbAllLinks: TCheckBox
          Left = 20
          Top = 28
          Width = 161
          Height = 17
          Caption = 'Clear All Links'
          TabOrder = 7
          OnClick = cbAllLinksClick
        end
        object cbBBFDate: TCheckBox
          Left = 30
          Top = 130
          Width = 123
          Height = 17
          Caption = 'Use Start Date'
          TabOrder = 8
          Visible = False
          OnClick = cbBBFDateClick
        end
        object edtDateTo: TcxDateEdit
          Left = 106
          Top = 97
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 121
        end
        object CBUseRef: TCheckBox
          Left = 159
          Top = 130
          Width = 122
          Height = 17
          Caption = 'Use reference'
          TabOrder = 9
          Visible = False
        end
        object cbGenBFOnAllAccount: TCheckBox
          Left = 204
          Top = 32
          Width = 185
          Height = 17
          Caption = 'All accounts (Only on advice)'
          TabOrder = 10
        end
        object cbJustExactAmounts: TCheckBox
          Left = 300
          Top = 64
          Width = 98
          Height = 33
          Caption = 'Exact amounts'
          TabOrder = 11
          WordWrap = True
        end
      end
      object ButtonPanel: TPanel
        Left = 0
        Top = 435
        Width = 923
        Height = 106
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 4
        DesignSize = (
          923
          106)
        object Shape1: TShape
          Left = 677
          Top = 2
          Width = 206
          Height = 101
          Anchors = [akRight, akBottom]
          Brush.Color = clBlack
          Shape = stRoundRect
          ExplicitTop = 34
        end
        object Shape2: TShape
          Left = 678
          Top = 1
          Width = 208
          Height = 100
          Anchors = [akRight, akBottom]
          Brush.Color = clSilver
          Shape = stRoundRect
          ExplicitTop = 33
        end
        object lblLedger: TLabel
          Left = 795
          Top = 51
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = '0.00'
          Transparent = True
          ExplicitTop = 83
        end
        object lblOut: TLabel
          Left = 795
          Top = 22
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = '0.00'
          Transparent = True
          ExplicitTop = 54
        end
        object lblAmt: TLabel
          Left = 795
          Top = 7
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = '0.00'
          Transparent = True
          ExplicitTop = 39
        end
        object lblMs1: TLabel
          Left = 688
          Top = 9
          Width = 96
          Height = 13
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Total Amount'
          Transparent = True
          ExplicitTop = 41
        end
        object lblMs3: TLabel
          Left = 688
          Top = 50
          Width = 96
          Height = 13
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Total Ledger'
          Transparent = True
          ExplicitTop = 82
        end
        object lblMs5: TLabel
          Left = 688
          Top = 81
          Width = 103
          Height = 13
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Difference/OutStand.'
          Transparent = True
          ExplicitTop = 113
        end
        object lblMs2: TLabel
          Left = 688
          Top = 23
          Width = 96
          Height = 13
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Total OutStanding'
          Transparent = True
          ExplicitTop = 55
        end
        object lblDiffAmt: TLabel
          Left = 795
          Top = 65
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = '0.00'
          Transparent = True
          ExplicitTop = 97
        end
        object lblDiffOut: TLabel
          Left = 795
          Top = 81
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = '0.00'
          Transparent = True
          ExplicitTop = 113
        end
        object lblMs4: TLabel
          Left = 688
          Top = 65
          Width = 96
          Height = 13
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Difference/Amount'
          Transparent = True
          ExplicitTop = 97
        end
        object SearchPanel: TPanel
          Left = 16
          Top = 3
          Width = 345
          Height = 46
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          OnDblClick = SearchPanelDblClick
          object edtAmtRef: TEdit
            Left = 80
            Top = 10
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            OnChange = edtAmtRefChange
            OnKeyDown = edtAmtRefKeyDown
            OnKeyPress = edtDateKeyPress
          end
          object btnApply: TBitBtn
            Left = 216
            Top = 8
            Width = 113
            Height = 25
            Caption = '&Apply'
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
            OnClick = btnApplyClick
          end
        end
        object BitBtn1: TBitBtn
          Left = 1130
          Top = 74
          Width = 105
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Close'
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
          OnClick = ToolButton4Click
        end
        object cbFindInvalideDetail: TComboBox
          Left = 16
          Top = 54
          Width = 245
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = cbFindInvalideDetailClick
          Items.Strings = (
            'Non'
            'Invalid trn'
            'Linked 2 X'
            'Overlinked'
            'Has new links')
        end
        object cbFilter: TCheckBox
          Left = 16
          Top = 74
          Width = 237
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Filter'
          TabOrder = 3
          OnClick = cbFilterClick
        end
      end
      object PnlStatement: TPanel
        Left = 130
        Top = 218
        Width = 787
        Height = 391
        Caption = 'PnlStatement'
        TabOrder = 1
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 785
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label5: TLabel
            Left = 318
            Top = 6
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Current Date '
          end
          object Label7: TLabel
            Left = 24
            Top = 6
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Include Item Since'
          end
          object edtCurDate: TcxDateEdit
            Left = 384
            Top = 2
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnValidate = edtSincePropertiesValidate
            TabOrder = 0
            Width = 105
          end
          object edtSince: TcxDateEdit
            Left = 124
            Top = 1
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnValidate = edtSincePropertiesValidate
            TabOrder = 1
            Width = 105
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 372
          Width = 785
          Height = 18
          Align = alBottom
          TabOrder = 1
          object Label3: TLabel
            Left = 4
            Top = 3
            Width = 78
            Height = 13
            Caption = 'Over 90 Days'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl90: TLabel
            Left = 131
            Top = 3
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'lbl90'
          end
          object Label6: TLabel
            Left = 165
            Top = 3
            Width = 47
            Height = 13
            Caption = '60 Days'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl60: TLabel
            Left = 264
            Top = 3
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Label5'
          end
          object Bevel2: TBevel
            Left = 159
            Top = -6
            Width = 2
            Height = 46
          end
          object Label8: TLabel
            Left = 307
            Top = 3
            Width = 47
            Height = 13
            Caption = '30 Days'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl30: TLabel
            Left = 397
            Top = 3
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Label5'
          end
          object Label10: TLabel
            Left = 441
            Top = 3
            Width = 42
            Height = 13
            Caption = 'Current'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCur: TLabel
            Left = 540
            Top = 3
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Label5'
          end
          object Bevel3: TBevel
            Left = 301
            Top = -12
            Width = 2
            Height = 46
          end
          object Bevel4: TBevel
            Left = 431
            Top = -20
            Width = 2
            Height = 46
          end
          object Bevel5: TBevel
            Left = 577
            Top = -28
            Width = 2
            Height = 46
          end
          object Label9: TLabel
            Left = 584
            Top = 2
            Width = 24
            Height = 13
            Caption = 'Due'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDue: TLabel
            Left = 682
            Top = 3
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Label5'
          end
        end
        object cxGrid1: TcxGrid
          Left = 1
          Top = 25
          Width = 785
          Height = 347
          Align = alClient
          TabOrder = 2
          object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsMasterhist
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'FAMOUNT'
                Column = cxGrid1DBBandedTableView1FAMOUNT
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0'
                Kind = skCount
                FieldName = 'DDATE'
                Column = cxGrid1DBBandedTableView1DDATE
              end
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'FAMOUNT'
                Column = cxGrid1DBBandedTableView1FAMOUNT
              end
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'FOUTSTANDINGAMOUNT'
                Column = cxGrid1DBBandedTableView1FOUTSTANDINGAMOUNT
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsCustomize.BandsQuickCustomization = True
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.CellAutoHeight = True
            OptionsView.Footer = True
            OptionsView.Indicator = True
            Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
            Bands = <
              item
              end
              item
                Width = 249
              end>
            object cxGrid1DBBandedTableView1DDATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DDATE'
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SREFERENCE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SREFERENCE'
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FAMOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FAMOUNT'
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WACCOUNTID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WACCOUNTID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1BRECONCILED: TcxGridDBBandedColumn
              DataBinding.FieldName = 'BRECONCILED'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn
              Caption = 'Outstanding'
              DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
              Width = 122
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WTRANSACTIONID: TcxGridDBBandedColumn
              Caption = 'id'
              DataBinding.FieldName = 'WTRANSACTIONID'
              Visible = False
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WDESCRIPTIONID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WDESCRIPTIONID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 0
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SALIAS: TcxGridDBBandedColumn
              Caption = 'Alias'
              DataBinding.FieldName = 'SALIAS'
              Width = 127
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDESCRIPTION'
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
          end
          object cxGrid1DBBandedTableView2: TcxGridDBBandedTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsDetailHist
            DataController.DetailKeyFieldNames = 'WTRANSACTIONID'
            DataController.KeyFieldNames = 'LINKTRN'
            DataController.MasterKeyFieldNames = 'WTRANSACTIONID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                FieldName = 'FAMOUNT'
                Column = cxGrid1DBBandedTableView2FAMOUNT
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsCustomize.BandsQuickCustomization = True
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.Navigator = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            OptionsView.BandHeaders = False
            Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
            Bands = <
              item
                Width = 337
              end
              item
              end>
            object cxGrid1DBBandedTableView2DDATE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DDATE'
              Width = 82
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2SREFERENCE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SREFERENCE'
              Width = 126
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2FAMOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FAMOUNT'
              Width = 74
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2WACCOUNTID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WACCOUNTID'
              Visible = False
              VisibleForCustomization = False
              Width = 74
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2BRECONCILED: TcxGridDBBandedColumn
              DataBinding.FieldName = 'BRECONCILED'
              Visible = False
              VisibleForCustomization = False
              Width = 74
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
              Visible = False
              VisibleForCustomization = False
              Width = 74
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2WTRANSACTIONID: TcxGridDBBandedColumn
              Caption = 'id'
              DataBinding.FieldName = 'WTRANSACTIONID'
              Visible = False
              Width = 74
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2WDESCRIPTIONID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WDESCRIPTIONID'
              Visible = False
              VisibleForCustomization = False
              Width = 74
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2SALIAS: TcxGridDBBandedColumn
              Caption = 'Alias'
              DataBinding.FieldName = 'SALIAS'
              Width = 109
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView2SDESCRIPTION: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDESCRIPTION'
              Width = 228
              Position.BandIndex = 0
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBBandedTableView1
            object cxGrid1Level2: TcxGridLevel
              GridView = cxGrid1DBBandedTableView2
            end
          end
        end
      end
      object PnlPlain: TPanel
        Left = 249
        Top = 140
        Width = 704
        Height = 400
        BevelOuter = bvNone
        TabOrder = 2
        object Splitter1: TSplitter
          Left = 0
          Top = 196
          Width = 704
          Height = 4
          Cursor = crVSplit
          Align = alBottom
          ExplicitTop = 218
        end
        object pnlRight: TPanel
          Left = 0
          Top = 200
          Width = 704
          Height = 200
          Align = alBottom
          TabOrder = 1
          object Panel2: TPanel
            Left = 1
            Top = 1
            Width = 702
            Height = 15
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Credits'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cxCredits: TcxGrid
            Left = 1
            Top = 16
            Width = 702
            Height = 183
            Align = alClient
            TabOrder = 1
            object cxCreditsDBBandedTableView1: TcxGridDBBandedTableView
              DragMode = dmAutomatic
              PopupMenu = PopupMenu1
              OnDragDrop = cxDebitsDBBandedTableView1DragDrop
              OnDragOver = cxDebitsDBBandedTableView1DragOver
              OnKeyDown = wwdbgDebitsKeyDown
              OnKeyPress = wwdbgDebitsKeyPress
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = cxCreditsDBBandedTableView1CustomDrawCell
              DataController.DataSource = dswwqryOpenCredits
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FOUTSTANDINGAMOUNT'
                  Column = cxCreditsDBBandedTableView1FOUTSTANDINGAMOUNT
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.00'
                  FieldName = 'BUNUSED'
                  Column = cxCreditsDBBandedTableView1BUNUSED
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FAMOUNT'
                  Column = cxCreditsDBBandedTableView1FAMOUNT
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FOUTSTANDINGAMOUNT'
                  Column = cxCreditsDBBandedTableView1FOUTSTANDINGAMOUNT
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.DragFocusing = dfDragDrop
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsCustomize.DataRowSizing = True
              OptionsCustomize.GroupRowSizing = True
              OptionsCustomize.BandsQuickCustomization = True
              OptionsCustomize.ColumnVertSizing = False
              OptionsSelection.InvertSelect = False
              OptionsSelection.MultiSelect = True
              OptionsSelection.CellMultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupByBox = False
              Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
              Bands = <
                item
                end
                item
                end>
              object cxCreditsDBBandedTableView1WTRANSACTIONID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'WTRANSACTIONID'
                Visible = False
                Options.Editing = False
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 1
              end
              object cxCreditsDBBandedTableView1SREFERENCE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SREFERENCE'
                Options.Editing = False
                Width = 128
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxCreditsDBBandedTableView1DDATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DDATE'
                Options.Editing = False
                Options.CellMerging = True
                Width = 98
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxCreditsDBBandedTableView1FAMOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FAMOUNT'
                RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                Options.Editing = False
                Width = 93
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxCreditsDBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
                RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                Options.Editing = False
                Width = 94
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxCreditsDBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SDESCRIPTION'
                Options.Editing = False
                Width = 330
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxCreditsDBBandedTableView1BUNUSED: TcxGridDBBandedColumn
                DataBinding.FieldName = 'BUNUSED'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = '1'
                Properties.ValueUnchecked = '0'
                Properties.OnEditValueChanged = cxCreditsDBBandedTableView1BUNUSEDPropertiesEditValueChanged
                Width = 93
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxCreditsDBBandedTableView1ISLINKED: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ISLINKED'
                Visible = False
                Options.Editing = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
            end
            object cxCreditsLevel1: TcxGridLevel
              GridView = cxCreditsDBBandedTableView1
            end
          end
        end
        object pnlLeft: TPanel
          Left = 0
          Top = 0
          Width = 704
          Height = 196
          Align = alClient
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 702
            Height = 15
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Debits'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cxDebits: TcxGrid
            Left = 1
            Top = 16
            Width = 702
            Height = 179
            Align = alClient
            TabOrder = 1
            object cxDebitsDBBandedTableView1: TcxGridDBBandedTableView
              DragMode = dmAutomatic
              PopupMenu = PopupMenu1
              OnDragDrop = cxDebitsDBBandedTableView1DragDrop
              OnDragOver = cxDebitsDBBandedTableView1DragOver
              OnKeyDown = wwdbgDebitsKeyDown
              OnKeyPress = wwdbgDebitsKeyPress
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = cxDebitsDBBandedTableView1CustomDrawCell
              DataController.DataSource = dswwqryOpenDebits
              DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FOUTSTANDINGAMOUNT'
                  Column = cxDebitsDBBandedTableView1FOUTSTANDINGAMOUNT
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.00'
                  FieldName = 'BUNUSED'
                  Column = cxDebitsDBBandedTableView1BUNUSED
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FAMOUNT'
                  Column = cxDebitsDBBandedTableView1FAMOUNT
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FOUTSTANDINGAMOUNT'
                  Column = cxDebitsDBBandedTableView1FOUTSTANDINGAMOUNT
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsBehavior.DragFocusing = dfDragDrop
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsCustomize.DataRowSizing = True
              OptionsCustomize.GroupRowSizing = True
              OptionsCustomize.BandsQuickCustomization = True
              OptionsCustomize.ColumnVertSizing = False
              OptionsSelection.InvertSelect = False
              OptionsSelection.MultiSelect = True
              OptionsSelection.CellMultiSelect = True
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.FooterMultiSummaries = True
              OptionsView.GroupByBox = False
              Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
              Bands = <
                item
                end
                item
                end>
              object cxDebitsDBBandedTableView1WTRANSACTIONID: TcxGridDBBandedColumn
                Caption = 'trn'
                DataBinding.FieldName = 'WTRANSACTIONID'
                Visible = False
                Options.Editing = False
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxDebitsDBBandedTableView1SREFERENCE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SREFERENCE'
                Options.Editing = False
                Width = 128
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxDebitsDBBandedTableView1DDATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DDATE'
                Options.Editing = False
                Options.CellMerging = True
                Width = 102
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxDebitsDBBandedTableView1FAMOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FAMOUNT'
                RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                Options.Editing = False
                Width = 93
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxDebitsDBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
                RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                Options.Editing = False
                Width = 92
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxDebitsDBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SDESCRIPTION'
                Options.Editing = False
                Width = 328
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxDebitsDBBandedTableView1BUNUSED: TcxGridDBBandedColumn
                DataBinding.FieldName = 'BUNUSED'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                Properties.ValueChecked = 1
                Properties.ValueUnchecked = 0
                Properties.OnEditValueChanged = cxDebitsDBBandedTableView1BUNUSEDPropertiesEditValueChanged
                Width = 93
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxDebitsDBBandedTableView1ISLINKED: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ISLINKED'
                Visible = False
                VisibleForCustomization = False
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
            end
            object cxDebitsLevel1: TcxGridLevel
              GridView = cxDebitsDBBandedTableView1
            end
          end
        end
      end
    end
    object tsList: TTabSheet
      Caption = 'tsList'
      ImageIndex = 1
      object pcLijst: TPageControl
        Left = 0
        Top = 0
        Width = 923
        Height = 541
        ActivePage = tsTransactions
        Align = alClient
        TabOrder = 0
        OnChange = pcLijstChange
        object tsTotals: TTabSheet
          Caption = 'Totals'
          object PSearch: TPanel
            Left = 0
            Top = 0
            Width = 915
            Height = 73
            Align = alTop
            TabOrder = 0
            ExplicitTop = -6
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
              Width = 57
              Height = 13
              Caption = 'Filterwaarde'
            end
            object CBFindColumn: TComboBox
              Left = 9
              Top = 20
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              Items.Strings = (
                ''
                'Accountcode'
                'Description'
                'Type'
                'Total transaction'
                'Total open')
            end
            object CBOperatot: TComboBox
              Left = 180
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
              Left = 258
              Top = 20
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
              OnKeyPress = EFilterValueKeyPress
            end
            object BFilter: TButton
              Left = 390
              Top = 20
              Width = 81
              Height = 21
              Caption = 'Filter'
              TabOrder = 3
              OnClick = BFilterClick
            end
            object BClear: TButton
              Left = 480
              Top = 20
              Width = 81
              Height = 21
              Caption = 'Clear'
              TabOrder = 4
              OnClick = BClearClick
            end
            object cbAccountType: TCheckListBox
              Left = 9
              Top = 46
              Width = 425
              Height = 19
              Columns = 3
              ItemHeight = 13
              Items.Strings = (
                'Ledger'
                'Debtor'
                'Creditor')
              TabOrder = 5
            end
            object cbShowColors: TCheckBox
              Left = 445
              Top = 47
              Width = 140
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Show colors'
              Checked = True
              State = cbChecked
              TabOrder = 6
              OnClick = cbShowColorsClick
            end
            object cbFindInvalide: TCheckBox
              Left = 624
              Top = 48
              Width = 137
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Find invalide'
              TabOrder = 7
              OnClick = cbFindInvalideClick
            end
            object BExportTotal: TButton
              Left = 568
              Top = 20
              Width = 81
              Height = 21
              Caption = 'Export'
              TabOrder = 8
              OnClick = BExportTotalClick
            end
            object btnRemoveFaults: TBitBtn
              Left = 655
              Top = 19
              Width = 98
              Height = 21
              Caption = 'Remove fault links'
              DoubleBuffered = True
              ParentDoubleBuffered = False
              TabOrder = 9
              Visible = False
              OnClick = btnRemoveFaultsClick
            end
            object LimitRowst: TcxSpinEdit
              Left = 774
              Top = 46
              Properties.MaxValue = 999999.000000000000000000
              Properties.MinValue = 1.000000000000000000
              Properties.SpinButtons.ShowFastButtons = True
              TabOrder = 10
              Value = 200
              Width = 125
            end
            object lLimitRowst: TcxLabel
              Left = 774
              Top = 23
              Caption = 'limitrows'
            end
          end
          object cxTotals: TcxGrid
            Left = 0
            Top = 73
            Width = 915
            Height = 440
            Align = alClient
            TabOrder = 1
            object cxTotalsDBTableView1: TcxGridDBTableView
              PopupMenu = PopupMenu3
              OnDblClick = DBGSearchDblClick
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = cxTotalsDBTableView1CustomDrawCell
              DataController.DataSource = dsZAccountList
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'TOTALOPEN'
                  Column = cxTotalsDBTableView1TOTALOPEN
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'TOTALTRANS'
                  Column = cxTotalsDBTableView1TOTALTRANS
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'TOTALOPEN'
                  Column = cxTotalsDBTableView1TOTALOPEN
                end
                item
                  Format = '0'
                  Kind = skCount
                  FieldName = 'SACCOUNTCODE'
                  Column = cxTotalsDBTableView1SACCOUNTCODE
                end>
              DataController.Summary.SummaryGroups = <
                item
                  Links = <>
                  SummaryItems = <
                    item
                      Kind = skCount
                      FieldName = 'SACCOUNTCODE'
                      Column = cxTotalsDBTableView1SACCOUNTCODE
                    end>
                end>
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.Footer = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.Indicator = True
              Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
              object cxTotalsDBTableView1SACCOUNTCODE: TcxGridDBColumn
                DataBinding.FieldName = 'SACCOUNTCODE'
                Width = 134
              end
              object cxTotalsDBTableView1SDESCRIPTION: TcxGridDBColumn
                DataBinding.FieldName = 'SDESCRIPTION'
                Width = 234
              end
              object cxTotalsDBTableView1WACCOUNTTYPEID: TcxGridDBColumn
                DataBinding.FieldName = 'WACCOUNTTYPEID'
                Options.CellMerging = True
                Width = 157
              end
              object cxTotalsDBTableView1TOTALTRANS: TcxGridDBColumn
                DataBinding.FieldName = 'TOTALTRANS'
                RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                Width = 138
              end
              object cxTotalsDBTableView1TOTALOPEN: TcxGridDBColumn
                DataBinding.FieldName = 'TOTALOPEN'
                RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
                Width = 167
              end
              object cxTotalsDBTableView1WACCOUNTID: TcxGridDBColumn
                DataBinding.FieldName = 'WACCOUNTID'
                Visible = False
                VisibleForCustomization = False
              end
              object cxTotalsDBTableView1CHECKSTATUS: TcxGridDBColumn
                DataBinding.FieldName = 'CHECKSTATUS'
                Visible = False
                VisibleForCustomization = False
              end
            end
            object cxTotalsLevel1: TcxGridLevel
              GridView = cxTotalsDBTableView1
            end
          end
        end
        object tsTransactions: TTabSheet
          Caption = 'Transactions'
          ImageIndex = 1
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 915
            Height = 73
            Align = alTop
            TabOrder = 0
            ExplicitTop = -6
            object LFieldTrans: TLabel
              Left = 9
              Top = 4
              Width = 22
              Height = 13
              Caption = 'Field'
            end
            object LFilterValueTrans: TLabel
              Left = 258
              Top = 4
              Width = 57
              Height = 13
              Caption = 'Filterwaarde'
            end
            object CBFindColumnTrans: TComboBox
              Left = 9
              Top = 20
              Width = 145
              Height = 21
              Style = csDropDownList
              TabOrder = 0
              Items.Strings = (
                ''
                'Accountcode'
                'Description'
                'Reference'
                'Trans description'
                'Transaction'
                'Open'
                'Paymentdate'
                'Trans date'
                'Type')
            end
            object CBOperatotTrans: TComboBox
              Left = 180
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
            object EFilterValueTrans: TEdit
              Left = 258
              Top = 20
              Width = 129
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 2
              OnKeyPress = EFilterValueTransKeyPress
            end
            object BFilterTrans: TButton
              Left = 393
              Top = 19
              Width = 81
              Height = 21
              Caption = 'Filter'
              TabOrder = 3
              OnClick = BFilterTransClick
            end
            object BClearTrans: TButton
              Left = 480
              Top = 20
              Width = 81
              Height = 21
              Caption = 'Clear'
              TabOrder = 4
              OnClick = BClearTransClick
            end
            object cbAccountTypeTrans: TCheckListBox
              Left = 9
              Top = 46
              Width = 425
              Height = 19
              Columns = 3
              ItemHeight = 13
              Items.Strings = (
                'Ledger'
                'Debtor'
                'Creditor')
              TabOrder = 5
            end
            object cbOpenOnly: TCheckBox
              Left = 467
              Top = 46
              Width = 203
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Open transactions only'
              Checked = True
              State = cbChecked
              TabOrder = 6
            end
            object BExporttrans: TButton
              Left = 572
              Top = 20
              Width = 81
              Height = 21
              Caption = 'Export'
              TabOrder = 7
              OnClick = BExporttransClick
            end
            object Button1: TButton
              Left = 692
              Top = 20
              Width = 81
              Height = 21
              Caption = 'group'
              PopupMenu = PopupMenu5
              TabOrder = 8
              OnClick = Button1Click
            end
            object lLimitRows: TcxLabel
              Left = 774
              Top = 23
              Caption = 'limitrows'
            end
            object LimitRows: TcxSpinEdit
              Left = 774
              Top = 46
              Properties.MaxValue = 999999.000000000000000000
              Properties.MinValue = 1.000000000000000000
              Properties.SpinButtons.ShowFastButtons = True
              TabOrder = 10
              Value = 1000
              Width = 125
            end
          end
          object cxTrans: TcxGrid
            Left = 0
            Top = 73
            Width = 915
            Height = 440
            Align = alClient
            TabOrder = 1
            object cxTransDBTableView: TcxGridDBTableView
              PopupMenu = PopupMenu2
              OnDblClick = DBGSearchTransDblClick
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = cxTransDBTableViewCustomDrawCell
              DataController.DataSource = dsTransList
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'TOTALOPEN'
                  Column = cxTransDBTableViewTOTALOPEN
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'TOTALTRANS'
                  Column = cxTransDBTableViewTOTALTRANS
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'TOTALOPEN'
                  Column = cxTransDBTableViewTOTALOPEN
                end
                item
                  Format = '0'
                  Kind = skCount
                  FieldName = 'SACCOUNTCODE'
                  Column = cxTransDBTableViewSACCOUNTCODE
                end>
              DataController.Summary.SummaryGroups = <
                item
                  Links = <>
                  SummaryItems = <
                    item
                      Kind = skCount
                      FieldName = 'SACCOUNTCODE'
                      Column = cxTransDBTableViewSACCOUNTCODE
                    end>
                end>
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.ColumnAutoWidth = True
              OptionsView.Footer = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.Indicator = True
              Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
              object cxTransDBTableViewSACCOUNTCODE: TcxGridDBColumn
                DataBinding.FieldName = 'SACCOUNTCODE'
                Options.CellMerging = True
                Width = 115
              end
              object cxTransDBTableViewSACCOUNTDESCRIPTION: TcxGridDBColumn
                DataBinding.FieldName = 'SACCOUNTDESCRIPTION'
                Options.CellMerging = True
                Width = 160
              end
              object cxTransDBTableViewSREFERENCE: TcxGridDBColumn
                DataBinding.FieldName = 'SREFERENCE'
                Width = 103
              end
              object cxTransDBTableViewSDESCRIPTION: TcxGridDBColumn
                DataBinding.FieldName = 'SDESCRIPTION'
                Width = 170
              end
              object cxTransDBTableViewTOTALTRANS: TcxGridDBColumn
                DataBinding.FieldName = 'TOTALTRANS'
                Width = 80
              end
              object cxTransDBTableViewTOTALOPEN: TcxGridDBColumn
                DataBinding.FieldName = 'TOTALOPEN'
                Width = 81
              end
              object cxTransDBTableViewDPAYMENTDATE: TcxGridDBColumn
                DataBinding.FieldName = 'DPAYMENTDATE'
                DateTimeGrouping = dtgByMonth
                Options.CellMerging = True
                Width = 82
              end
              object cxTransDBTableViewDDATE: TcxGridDBColumn
                DataBinding.FieldName = 'DDATE'
                DateTimeGrouping = dtgRelativeToToday
                Options.CellMerging = True
                Width = 81
              end
              object cxTransDBTableViewWACCOUNTTYPEID: TcxGridDBColumn
                DataBinding.FieldName = 'WACCOUNTTYPEID'
                Options.CellMerging = True
                Width = 80
              end
              object cxTransDBTableViewWACCOUNTID: TcxGridDBColumn
                DataBinding.FieldName = 'WACCOUNTID'
                Visible = False
                VisibleForCustomization = False
              end
              object cxTransDBTableViewWTRANSACTIONID: TcxGridDBColumn
                DataBinding.FieldName = 'WTRANSACTIONID'
                Visible = False
                VisibleForCustomization = False
              end
            end
            object cxTransLevel1: TcxGridLevel
              GridView = cxTransDBTableView
            end
          end
        end
        object tsTempLinkedoff: TTabSheet
          Caption = 'Unposted links'
          ImageIndex = 2
          object cxUnposted: TcxGrid
            Left = 0
            Top = 0
            Width = 915
            Height = 513
            Align = alClient
            TabOrder = 0
            object cxUnpostedDBBandedTableView1: TcxGridDBBandedTableView
              PopupMenu = PopupMenu4
              OnDblClick = DBGSearchDblClick
              NavigatorButtons.ConfirmDelete = False
              OnCustomDrawCell = cxTotalsDBTableView1CustomDrawCell
              DataController.DataSource = dsUnprocessedLinks
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FOUTSTANDINGAMOUNT'
                  Column = cxUnpostedDBBandedTableView1FOUTSTANDINGAMOUNT
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Format = '0'
                  Kind = skCount
                  Column = cxUnpostedDBBandedTableView1SACCOUNTCODE
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FAMOUNT'
                  Column = cxUnpostedDBBandedTableView1FAMOUNT
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FAMOUNT_1'
                  Column = cxUnpostedDBBandedTableView1FAMOUNT_1
                end
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FOUTSTANDINGAMOUNT'
                  Column = cxUnpostedDBBandedTableView1FOUTSTANDINGAMOUNT
                end>
              DataController.Summary.SummaryGroups = <
                item
                  Links = <>
                  SummaryItems = <
                    item
                      Format = '0.00'
                      Kind = skSum
                      FieldName = 'FOUTSTANDINGAMOUNT'
                      Column = cxUnpostedDBBandedTableView1FOUTSTANDINGAMOUNT
                    end>
                end>
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.InvertSelect = False
              OptionsSelection.MultiSelect = True
              OptionsSelection.CellMultiSelect = True
              OptionsView.Footer = True
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.Indicator = True
              Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
              Bands = <
                item
                  Width = 283
                end
                item
                end>
              object cxUnpostedDBBandedTableView1SACCOUNTCODE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SACCOUNTCODE'
                Width = 105
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1SDESCRIPTION_1: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SDESCRIPTION_1'
                Width = 167
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1SREFERENCE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SREFERENCE'
                Width = 90
                Position.BandIndex = 1
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SDESCRIPTION'
                Width = 249
                Position.BandIndex = 1
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1FAMOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FAMOUNT'
                Width = 102
                Position.BandIndex = 1
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1FOUTSTANDINGAMOUNT: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
                Width = 129
                Position.BandIndex = 1
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1DPAYMENTDATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DPAYMENTDATE'
                Width = 126
                Position.BandIndex = 1
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1DDATE: TcxGridDBBandedColumn
                DataBinding.FieldName = 'DDATE'
                Width = 107
                Position.BandIndex = 1
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1FAMOUNT_1: TcxGridDBBandedColumn
                DataBinding.FieldName = 'FAMOUNT_1'
                Width = 106
                Position.BandIndex = 1
                Position.ColIndex = 6
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1SALIAS: TcxGridDBBandedColumn
                DataBinding.FieldName = 'SALIAS'
                Width = 153
                Position.BandIndex = 1
                Position.ColIndex = 7
                Position.RowIndex = 0
              end
              object cxUnpostedDBBandedTableView1WACCOUNTTYPEID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'WACCOUNTTYPEID'
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
            end
            object cxUnpostedLevel1: TcxGridLevel
              GridView = cxUnpostedDBBandedTableView1
            end
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 130
    Top = 208
    object UnlinkTransaction1: TMenuItem
      Caption = 'Unlink Transaction'
      OnClick = UnlinkTransaction1Click
    end
    object RPymt: TMenuItem
      Caption = 'Receive Payment'
      OnClick = RPymtClick
    end
    object Reprinttransactions1: TMenuItem
      Caption = 'Reprint transactions'
    end
    object Checkselected1: TMenuItem
      Caption = 'Check selected'
      OnClick = Checkselected1Click
    end
    object Uncheckselected1: TMenuItem
      Caption = 'Uncheck selected'
      OnClick = Uncheckselected1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Undolastlink1: TMenuItem
      Caption = 'Undo last link'
      OnClick = Undolastlink1Click
    end
    object Unlinktilvalide1: TMenuItem
      Caption = 'Unlink till valide'
      OnClick = Unlinktilvalide1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Linkdebto1or2cred1: TMenuItem
      Caption = 'Auto link Debit to 1..3 Credit'
      OnClick = Finddebin2crforalldeb1Click
    end
    object Autolinkcredto13deb: TMenuItem
      Caption = 'Auto link Credit to 1..3 Debit'
      OnClick = Finddebin2crforalldeb1Click
    end
    object Debitpercentmatch1: TMenuItem
      Caption = 'Debit percent match'
      OnClick = Debitpercentmatch1Click
    end
    object Autolink1debXcreds1: TMenuItem
      Caption = 'Autolink 1 Debit to 1.. X Credits (slow)'
      OnClick = Autolink1debXcreds1Click
    end
    object Autopaymentdebitsforpercentageofgross1: TMenuItem
      Caption = 'Auto payment debits for percentage of gross'
      Visible = False
      OnClick = Autopaymentdebitsforpercentageofgross1Click
    end
  end
  object DsStmtMain: TDataSource
    DataSet = dmDatabase.QryTAccountDr
    Left = 34
    Top = 288
  end
  object DsLinkedDoc: TDataSource
    DataSet = dmDatabase.QryTAccountCr
    Left = 65530
    Top = 290
  end
  object ZQAccountList: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select sum(a.FAmount) TotalTrans,Sum(a.FOutstandingAmount) Total' +
        'Open,b.WAccountId,b.WAccountTypeId,b.SAccountCode ,b.SDescriptio' +
        'n from Account b left join Transact a on b.waccountid = a.Waccou' +
        'ntid where b.BOPENITEM = 1 and 1 = 0'
      
        'group by b.SAccountCode ,b.SDescription,b.WAccountTypeId,b.WAcco' +
        'untId')
    BeforeOpen = ZQAccountListBeforeOpen
    OnCalcFields = ZQAccountListCalcFields
    OnFilterRecord = ZQAccountListFilterRecord
    Left = 51
    Top = 489
    object ZQAccountListSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Origin = 'b.SAccountCode'
      Size = 7
    end
    object ZQAccountListSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Origin = 'b.SDescription'
      Size = 35
    end
    object ZQAccountListWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Origin = 'b.WAccountTypeId'
      Required = True
    end
    object ZQAccountListTOTALTRANS: TFloatField
      FieldName = 'TOTALTRANS'
      Origin = 'sum(a.FAmount)'
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ZQAccountListTOTALOPEN: TFloatField
      FieldName = 'TOTALOPEN'
      Origin = 'Sum(a.FOutstandingAmount) '
      ReadOnly = True
      DisplayFormat = '0.00'
    end
    object ZQAccountListWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Origin = 'b.WAccountId'
      Required = True
    end
    object ZQAccountListCHECKSTATUS: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CHECKSTATUS'
      Calculated = True
    end
  end
  object dsZAccountList: TDataSource
    DataSet = ZQAccountList
    Left = 171
    Top = 241
  end
  object zQHasTrans: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select Count(*) from transact where WAccountid =:accid')
    Left = 117
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'accid'
      end>
  end
  object ZQTranslist: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select b.SAccountCode ,b.SDescription SAccountDescription,a.SRef' +
        'erence,c.Sdescription, a.FAmount TotalTrans,'
      
        'a.FOutstandingAmount TotalOpen,cast(a.DPaymentDate as Date) DPay' +
        'mentDate,cast(a.ddate as Date) DDate,b.WAccountTypeId,b.WAccount' +
        'Id ,WTRANSACTIONID '
      'from Account b '
      'join Transact a on b.waccountid = a.Waccountid '
      'join messages c on c.WMessageID = a.WDescriptionID '
      'where b.BOPENITEM = 1 and a.FOutstandingAmount <> 0')
    BeforeOpen = ZQTranslistBeforeOpen
    Left = 27
    Top = 193
    object ZQTranslistSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Origin = 'b.SACCOUNTCODE'
      Size = 7
    end
    object ZQTranslistSACCOUNTDESCRIPTION: TStringField
      FieldName = 'SACCOUNTDESCRIPTION'
      Origin = 'b.SDescription'
      Size = 35
    end
    object ZQTranslistSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Origin = 'a.SReference'
      Size = 15
    end
    object ZQTranslistSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Origin = 'c.SDESCRIPTION'
      Size = 35
    end
    object ZQTranslistTOTALTRANS: TFloatField
      FieldName = 'TOTALTRANS'
      Origin = 'a.FAmount'
      Required = True
    end
    object ZQTranslistTOTALOPEN: TFloatField
      FieldName = 'TOTALOPEN'
      Origin = 'a.FOutstandingAmount'
    end
    object ZQTranslistDPAYMENTDATE: TDateField
      FieldName = 'DPAYMENTDATE'
      Origin = 'cast(a.DPaymentDate as Date)'
      ReadOnly = True
    end
    object ZQTranslistDDATE: TDateField
      FieldName = 'DDATE'
      Origin = 'cast(a.ddate as Date)'
      ReadOnly = True
    end
    object ZQTranslistWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Origin = 'b.WAccountTypeId'
      Required = True
    end
    object ZQTranslistWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTranslistWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
  end
  object dsTransList: TDataSource
    DataSet = ZQTranslist
    Left = 97
    Top = 268
  end
  object zQMasterHist: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select a.DDate,a.SReference, a.FAmount ,a.WAccountID,'
      
        ' a.BReconciled, a.FOutStandingAmount,a.WtransactionID,A.WDescrip' +
        'tionID,BatCon.SAlias'
      ' ,messages.SDescription '
      
        ' From TRANSACT a left join Batcon on (Batcon.WbatchID= a.WBatchI' +
        'd)'
      ' left join Account b on (a.WAccountID = b.Waccountid)'
      ' left join messages on (messages.WMessageId = a.WDescriptionId) '
      
        'Where a.DDate>=:DtStart And a.DDate<=:dtEndDate and  a.WAccountI' +
        'D =:WAccountid')
    Left = 206
    Top = 603
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DtStart'
      end
      item
        DataType = ftUnknown
        Name = 'dtEndDate'
      end
      item
        DataType = ftUnknown
        Name = 'WAccountid'
      end>
    object zQMasterHistDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object zQMasterHistSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object zQMasterHistFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
      DisplayFormat = '0.00'
    end
    object zQMasterHistWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object zQMasterHistBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object zQMasterHistFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object zQMasterHistWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object zQMasterHistWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object zQMasterHistSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object zQMasterHistSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
  end
  object zQDetailHist: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select c.WAMOUNTTRANSACTIONID linktrn,a.DDate,a.SReference, c.WL' +
        'inkedAmount  FAmount ,a.WAccountID,'
      
        ' a.BReconciled, a.FOutStandingAmount,a.WtransactionID,A.WDescrip' +
        'tionID,BatCon.SAlias'
      ' ,messages.SDescription '
      
        ' From TRANSACT a left join Batcon on (Batcon.WbatchID= a.WBatchI' +
        'd)'
      ' left join Account b on (a.WAccountID = b.Waccountid)'
      ' left join messages on (messages.WMessageId = a.WDescriptionId)'
      'join OILINKS c on a.Wtransactionid = c.WLINKTRANSACTIONID'
      'Where a.WAccountID =:WAccountid and '
      'exists ( Select  *'
      ' From TRANSACT x   '
      
        'Where c.WAMOUNTTRANSACTIONID = x.WtransactionID and x.DDate>=:Dt' +
        'Start And x.DDate<=:dtEndDate and  x.WAccountID =:WAccountid1'
      ')'
      'UNION'
      
        'Select c.WLINKTRANSACTIONID,a.DDate,a.SReference, c.WLinkedAmoun' +
        't  FAmount ,a.WAccountID,'
      
        ' a.BReconciled, a.FOutStandingAmount,a.WtransactionID,A.WDescrip' +
        'tionID,BatCon.SAlias'
      ' ,messages.SDescription '
      
        ' From TRANSACT a left join Batcon on (Batcon.WbatchID= a.WBatchI' +
        'd)'
      ' left join Account b on (a.WAccountID = b.Waccountid)'
      ' left join messages on (messages.WMessageId = a.WDescriptionId)'
      'join OILINKS c on a.Wtransactionid = c.WAMOUNTTRANSACTIONID'
      'Where a.WAccountID =:WAccountid2 and '
      'exists (select  *'
      ' From TRANSACT x    '
      
        'Where c.WLINKTRANSACTIONID = x.WtransactionID and x.DDate>=:DtSt' +
        'art2 And x.DDate<=:dtEndDate2 and  x.WAccountID =:WAccountid3'
      ')')
    Left = 358
    Top = 643
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountid'
      end
      item
        DataType = ftUnknown
        Name = 'DtStart'
      end
      item
        DataType = ftUnknown
        Name = 'dtEndDate'
      end
      item
        DataType = ftUnknown
        Name = 'WAccountid1'
      end
      item
        DataType = ftUnknown
        Name = 'WAccountid2'
      end
      item
        DataType = ftUnknown
        Name = 'DtStart2'
      end
      item
        DataType = ftUnknown
        Name = 'dtEndDate2'
      end
      item
        DataType = ftUnknown
        Name = 'WAccountid3'
      end>
    object zQDetailHistDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object zQDetailHistSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object zQDetailHistFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      DisplayFormat = '0.00'
    end
    object zQDetailHistWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object zQDetailHistBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object zQDetailHistFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object zQDetailHistWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object zQDetailHistWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object zQDetailHistSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object zQDetailHistSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object zQDetailHistLINKTRN: TIntegerField
      FieldName = 'LINKTRN'
    end
  end
  object dsMasterhist: TDataSource
    DataSet = zQMasterHist
    Left = 138
    Top = 263
  end
  object dsDetailHist: TDataSource
    DataSet = zQDetailHist
    Left = 126
    Top = 251
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'Export'
    Filter = 'Text files|*.txt|CSV files|*.csv|All files|*.*'
    Left = 556
    Top = 533
  end
  object wwqryOpenDebits: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingA' +
        'mount,'
      '             Messages.SDescription,BUnused'
      'FROM Transact,Messages'
      'WHERE (WAccountID = :Account) '
      'AND (FOutstandingAmount > 0)'
      'And (Transact.WDescriptionID=Messages.WMessageID)'
      'ORDER BY Transact.DDate')
    CachedUpdates = True
    UpdateObject = DtUpdate
    BeforeOpen = wwqryOpenDebitsBeforeOpen
    AfterOpen = wwqryOpenDebitsAfterScroll
    AfterScroll = wwqryOpenDebitsAfterScroll
    OnCalcFields = wwqryOpenDebitsCalcFields
    OnFilterRecord = wwqryOpenDebitsFilterRecord
    Left = 688
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account'
      end>
    object wwqryOpenDebitsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object wwqryOpenDebitsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object wwqryOpenDebitsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object wwqryOpenDebitsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      DisplayFormat = '0.00'
    end
    object wwqryOpenDebitsFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
      DisplayFormat = '0.00'
    end
    object wwqryOpenDebitsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object wwqryOpenDebitsBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object wwqryOpenDebitsISLINKED: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ISLINKED'
      Calculated = True
    end
  end
  object wwqryOpenCredits: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingA' +
        'mount,'
      '             Messages.SDescription, BUnused'
      'FROM Transact,Messages'
      'WHERE (WAccountID = :Account) '
      'AND (FOutstandingAmount < 0)'
      'And (Transact.WDescriptionID=Messages.WMessageID)'
      'ORDER BY Transact.DDate;')
    CachedUpdates = True
    UpdateObject = CtUpdate
    BeforeOpen = wwqryOpenCreditsBeforeOpen
    AfterOpen = wwqryOpenCreditsAfterScroll
    AfterScroll = wwqryOpenCreditsAfterScroll
    OnCalcFields = wwqryOpenCreditsCalcFields
    OnFilterRecord = wwqryOpenCreditsFilterRecord
    Left = 630
    Top = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account'
      end>
    object wwqryOpenCreditsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object wwqryOpenCreditsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object wwqryOpenCreditsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object wwqryOpenCreditsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      DisplayFormat = '0.00'
    end
    object wwqryOpenCreditsFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
      DisplayFormat = '0.00'
    end
    object wwqryOpenCreditsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object wwqryOpenCreditsBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object wwqryOpenCreditsISLINKED: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ISLINKED'
      Calculated = True
    end
  end
  object dswwqryOpenCredits: TDataSource
    DataSet = wwqryOpenCredits
    Left = 500
    Top = 388
  end
  object dswwqryOpenDebits: TDataSource
    DataSet = wwqryOpenDebits
    Left = 740
    Top = 240
  end
  object CtUpdate: TUniUpdateSQL
    ModifySQL.Strings = (
      'update Transact'
      'set'
      '  BUnused = :BUnused'
      'where'
      '  WTransactionID = :OLD_WTransactionID')
    Left = 442
    Top = 270
  end
  object DtUpdate: TUniUpdateSQL
    ModifySQL.Strings = (
      'update Transact'
      'set'
      '  BUnused = :BUnused'
      'where'
      '  WTransactionID = :OLD_WTransactionID')
    Left = 470
    Top = 196
  end
  object TUpdate: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TUpdateTimer
    Left = 132
    Top = 287
  end
  object PopupMenu2: TPopupMenu
    Left = 136
    Top = 352
    object Adjustpaymentdate1: TMenuItem
      Caption = 'Adjust payment date'
      OnClick = Adjustpaymentdate1Click
    end
    object Recievepayment1: TMenuItem
      Caption = 'Recieve payment'
      OnClick = Recievepayment1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 224
    Top = 176
    object Autoreversetillvalide1: TMenuItem
      Caption = 'Auto reverse invalide last action'
      OnClick = Autoreversetillvalide1Click
    end
    object Automatchexactamounts1: TMenuItem
      Caption = 'Auto match exact amounts'
      OnClick = Automatchexactamounts1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Autoreversetillvalideslow1: TMenuItem
      Caption = 'Autoreverse till valide (slow)'
      OnClick = Autoreversetillvalideslow1Click
    end
    object Automatch1debittoXcreditslow1: TMenuItem
      Caption = 'Auto match 1 debit to X credit (slow)'
      OnClick = Automatch1debittoXcreditslow1Click
    end
  end
  object ZQAccountData: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'SELECT debtor.SDELIVERY1 ,debtor.SDELIVERY2,debtor.SDELIVERY3, d' +
        'ebtor.SDELIVERYCODE,dc.COUNTRIES_NAME delcountry,pc.COUNTRIES_NA' +
        'ME poscountry, account.SDescription, account.SAccountCode, SPost' +
        'al1, '
      '  SPostal2,SPostal3, SPostalCode, STelephone1, STelephone2, '
      '  SFax, SEmail, SBranchCode, SBankAccountNumber, '
      
        '  DLastActivity, SReference, WDueDays,account.WAccountID,Firstna' +
        'me , LastName, Groups1.SDescription GroupDesc1,Groups1.WSortNo G' +
        'roupSort1, Groups2.SDescription GroupDesc2, Groups2.WSortNo Grou' +
        'pSort2'
      ',Groups1.WColor,Groups1.WTextColor,'
      'account.WReportingGroup2ID'
      ''
      ''
      ''
      
        '  FROM debtor JOIN account ON  (debtor.WAccountID = account.WAcc' +
        'ountID) left OUTER JOIN Contacts Contacts '
      '    ON  (debtor.WContactID = Contacts.RecordID) '
      
        '    left JOIN Groups Groups2 ON  (account.WReportingGroup2ID = G' +
        'roups2.WGroupID) '
      
        '    left JOIN Groups Groups1 ON  (account.WReportingGroup1ID = G' +
        'roups1.WGroupID) '
      
        '    left JOIN COUNTRIES pc on pc.COUNTRIES_ID = debtor.WPOSTCOUN' +
        'TRIES_ID'
      
        '    left JOIN COUNTRIES dc on dc.COUNTRIES_ID = debtor.WDELCOUNT' +
        'RIES_ID'
      '    where WAccountTypeId = 1   and account.Waccountid =:ACC1'
      'union'
      
        'SELECT creditor.SDELIVERY1 ,creditor.SDELIVERY2,creditor.SDELIVE' +
        'RY3, creditor.SDELIVERYCODE,dc.COUNTRIES_NAME delcountry,pc.COUN' +
        'TRIES_NAME poscountry, account.SDescription, account.SAccountCod' +
        'e, SPostal1, '
      '  SPostal2,SPostal3, SPostalCode, STelephone1, STelephone2, '
      '  SFax, SEmail, SBranchCode, SBankAccountNumber, '
      
        '  DLastActivity, SReference, WDueDays,account.WAccountID,firstna' +
        'me, LastName, Groups1.SDescription GroupDesc1,Groups1.WSortNo Gr' +
        'oupSort1, Groups2.SDescription GroupDesc2, Groups2.WSortNo Group' +
        'Sort2'
      ',Groups1.WColor,Groups1.WTextColor'
      ',account.WReportingGroup2ID'
      ''
      ''
      
        '  FROM creditor JOIN account ON  (creditor.WAccountID = account.' +
        'WAccountID) left OUTER JOIN Contacts Contacts '
      '    ON  (creditor.WContactID = Contacts.RecordID) '
      
        '    left JOIN Groups Groups2 ON  (account.WReportingGroup2ID = G' +
        'roups2.WGroupID) '
      
        '    left JOIN Groups Groups1 ON  (account.WReportingGroup1ID = G' +
        'roups1.WGroupID) '
      
        '    left JOIN COUNTRIES pc on pc.COUNTRIES_ID = creditor.WPOSTCO' +
        'UNTRIES_ID'
      
        '    left JOIN COUNTRIES dc on dc.COUNTRIES_ID = creditor.WDELCOU' +
        'NTRIES_ID'
      '    where WAccountTypeId = 2   and account.Waccountid =:ACC2')
    Left = 356
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ACC1'
      end
      item
        DataType = ftUnknown
        Name = 'ACC2'
      end>
    object ZQAccountDataSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 84
    end
    object ZQAccountDataSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object ZQAccountDataSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object ZQAccountDataSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object ZQAccountDataDELCOUNTRY: TStringField
      FieldName = 'DELCOUNTRY'
      Required = True
      Size = 64
    end
    object ZQAccountDataPOSCOUNTRY: TStringField
      FieldName = 'POSCOUNTRY'
      Required = True
      Size = 64
    end
    object ZQAccountDataSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object ZQAccountDataSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQAccountDataSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 64
    end
    object ZQAccountDataSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object ZQAccountDataSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object ZQAccountDataSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object ZQAccountDataSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object ZQAccountDataSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object ZQAccountDataSFAX: TStringField
      FieldName = 'SFAX'
    end
    object ZQAccountDataSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object ZQAccountDataSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object ZQAccountDataSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object ZQAccountDataDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object ZQAccountDataSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
    end
    object ZQAccountDataWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object ZQAccountDataWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQAccountDataFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object ZQAccountDataLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object ZQAccountDataGROUPDESC1: TStringField
      FieldName = 'GROUPDESC1'
      Size = 90
    end
    object ZQAccountDataGROUPSORT1: TIntegerField
      FieldName = 'GROUPSORT1'
    end
    object ZQAccountDataGROUPDESC2: TStringField
      FieldName = 'GROUPDESC2'
      Size = 90
    end
    object ZQAccountDataGROUPSORT2: TIntegerField
      FieldName = 'GROUPSORT2'
    end
    object ZQAccountDataWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQAccountDataWTEXTCOLOR: TIntegerField
      FieldName = 'WTEXTCOLOR'
    end
    object ZQAccountDataWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
  end
  object ZQUnprocessedLinks: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select * from transact  a join oilinkspre b on a.Wtransactionid ' +
        '= b.Wtransactionid'
      'left JOIN MESSAGES c ON (a.WDESCRIPTIONID = c.WMESSAGEID) '
      'join account e on a.waccountid = e.Waccountid'
      'join batcon d on b.WBATCHID = d.WBATCHID')
    Left = 128
    Top = 440
    object ZQUnprocessedLinksWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQUnprocessedLinksWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQUnprocessedLinksWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQUnprocessedLinksWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQUnprocessedLinksBCARRIEDFORWARD: TSmallintField
      FieldName = 'BCARRIEDFORWARD'
    end
    object ZQUnprocessedLinksBLASTYEAR: TSmallintField
      FieldName = 'BLASTYEAR'
    end
    object ZQUnprocessedLinksBLINKSUSED: TSmallintField
      FieldName = 'BLINKSUSED'
    end
    object ZQUnprocessedLinksBMULTIPLEITEMS: TSmallintField
      FieldName = 'BMULTIPLEITEMS'
    end
    object ZQUnprocessedLinksWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQUnprocessedLinksDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQUnprocessedLinksWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQUnprocessedLinksWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object ZQUnprocessedLinksSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQUnprocessedLinksFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object ZQUnprocessedLinksWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object ZQUnprocessedLinksFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object ZQUnprocessedLinksFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQUnprocessedLinksFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object ZQUnprocessedLinksBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object ZQUnprocessedLinksWBALANCINGACCOUNTID: TIntegerField
      FieldName = 'WBALANCINGACCOUNTID'
    end
    object ZQUnprocessedLinksWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object ZQUnprocessedLinksWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQUnprocessedLinksFFOREXAMOUNT: TFloatField
      FieldName = 'FFOREXAMOUNT'
    end
    object ZQUnprocessedLinksWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQUnprocessedLinksUNUSED: TIntegerField
      FieldName = 'UNUSED'
    end
    object ZQUnprocessedLinksDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQUnprocessedLinksBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object ZQUnprocessedLinksWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object ZQUnprocessedLinksFCURRENCYRATE2: TFloatField
      FieldName = 'FCURRENCYRATE2'
    end
    object ZQUnprocessedLinksFTAXRATE2: TFloatField
      FieldName = 'FTAXRATE2'
    end
    object ZQUnprocessedLinksFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object ZQUnprocessedLinksWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object ZQUnprocessedLinksWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQUnprocessedLinksBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQUnprocessedLinksWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object ZQUnprocessedLinksWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQUnprocessedLinksWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQUnprocessedLinksWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQUnprocessedLinksDPAYMENTDATE: TDateTimeField
      FieldName = 'DPAYMENTDATE'
    end
    object ZQUnprocessedLinksWREMITTANCECOUNT: TIntegerField
      FieldName = 'WREMITTANCECOUNT'
    end
    object ZQUnprocessedLinksWPAYMENTTYPE: TIntegerField
      FieldName = 'WPAYMENTTYPE'
    end
    object ZQUnprocessedLinksWBATCHID_1: TIntegerField
      FieldName = 'WBATCHID_1'
      Required = True
    end
    object ZQUnprocessedLinksWLINEID_1: TIntegerField
      FieldName = 'WLINEID_1'
      Required = True
    end
    object ZQUnprocessedLinksWBATCHTYPEID_1: TIntegerField
      FieldName = 'WBATCHTYPEID_1'
      Required = True
    end
    object ZQUnprocessedLinksWTRANSACTIONID_1: TIntegerField
      FieldName = 'WTRANSACTIONID_1'
      Required = True
    end
    object ZQUnprocessedLinksFAMOUNT_1: TFloatField
      FieldName = 'FAMOUNT_1'
    end
    object ZQUnprocessedLinksWMESSAGEID: TIntegerField
      FieldName = 'WMESSAGEID'
      Required = True
    end
    object ZQUnprocessedLinksSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object ZQUnprocessedLinksSEXTRADESCRIPTION: TStringField
      FieldName = 'SEXTRADESCRIPTION'
      Size = 255
    end
    object ZQUnprocessedLinksWBATCHID_2: TIntegerField
      FieldName = 'WBATCHID_2'
      Required = True
    end
    object ZQUnprocessedLinksWUSERID_1: TIntegerField
      FieldName = 'WUSERID_1'
      Required = True
    end
    object ZQUnprocessedLinksWBATCHTYPEID_2: TIntegerField
      FieldName = 'WBATCHTYPEID_2'
      Required = True
    end
    object ZQUnprocessedLinksSBATCHNUMBER: TStringField
      FieldName = 'SBATCHNUMBER'
      Size = 8
    end
    object ZQUnprocessedLinksBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object ZQUnprocessedLinksBIMPORTED: TSmallintField
      FieldName = 'BIMPORTED'
    end
    object ZQUnprocessedLinksBDOCSOURCE: TSmallintField
      FieldName = 'BDOCSOURCE'
    end
    object ZQUnprocessedLinksWLINECOUNT: TIntegerField
      FieldName = 'WLINECOUNT'
    end
    object ZQUnprocessedLinksSFILENAME: TStringField
      FieldName = 'SFILENAME'
      Size = 16
    end
    object ZQUnprocessedLinksWDOCID_1: TIntegerField
      FieldName = 'WDOCID_1'
    end
    object ZQUnprocessedLinksDSYSDATE_1: TDateTimeField
      FieldName = 'DSYSDATE_1'
    end
    object ZQUnprocessedLinksWINITBATID: TIntegerField
      FieldName = 'WINITBATID'
    end
    object ZQUnprocessedLinksSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object ZQUnprocessedLinksSUNIQUEID: TStringField
      FieldName = 'SUNIQUEID'
      Size = 8
    end
    object ZQUnprocessedLinksSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQUnprocessedLinksSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 64
    end
    object ZQUnprocessedLinksWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
  end
  object dsUnprocessedLinks: TDataSource
    DataSet = ZQUnprocessedLinks
    Left = 368
    Top = 176
  end
  object PopupMenu4: TPopupMenu
    Left = 764
    Top = 240
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object ZQTransAction: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from transact')
    UpdateObject = ZUSQLTransAction
    Left = 668
    Top = 400
    object ZQTransActionWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQTransActionWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQTransActionWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQTransActionWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQTransActionBCARRIEDFORWARD: TSmallintField
      FieldName = 'BCARRIEDFORWARD'
    end
    object ZQTransActionBLASTYEAR: TSmallintField
      FieldName = 'BLASTYEAR'
    end
    object ZQTransActionBLINKSUSED: TSmallintField
      FieldName = 'BLINKSUSED'
    end
    object ZQTransActionBMULTIPLEITEMS: TSmallintField
      FieldName = 'BMULTIPLEITEMS'
    end
    object ZQTransActionWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQTransActionDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQTransActionWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQTransActionSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQTransActionFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object ZQTransActionWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object ZQTransActionFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object ZQTransActionFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQTransActionFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object ZQTransActionBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object ZQTransActionWBALANCINGACCOUNTID: TIntegerField
      FieldName = 'WBALANCINGACCOUNTID'
    end
    object ZQTransActionWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object ZQTransActionWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQTransActionFFOREXAMOUNT: TFloatField
      FieldName = 'FFOREXAMOUNT'
    end
    object ZQTransActionWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQTransActionUNUSED: TIntegerField
      FieldName = 'UNUSED'
    end
    object ZQTransActionDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQTransActionBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object ZQTransActionWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object ZQTransActionFCURRENCYRATE2: TFloatField
      FieldName = 'FCURRENCYRATE2'
    end
    object ZQTransActionFTAXRATE2: TFloatField
      FieldName = 'FTAXRATE2'
    end
    object ZQTransActionFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object ZQTransActionWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object ZQTransActionWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQTransActionBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQTransActionWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQTransActionWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQTransActionWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object ZQTransActionWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object ZQTransActionWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
  end
  object ZUSQLTransAction: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO transact'
      
        '  (transact.WTRANSACTIONID, transact.WBATCHID, transact.WBATCHTY' +
        'PEID, transact.WLINEID, '
      
        '   transact.BCARRIEDFORWARD, transact.BLASTYEAR, transact.BLINKS' +
        'USED, transact.BMULTIPLEITEMS, '
      
        '   transact.WACCOUNTID, transact.DDATE, transact.WPERIODID, tran' +
        'sact.WYEARID, '
      
        '   transact.SREFERENCE, transact.FTAXRATE, transact.WTAXACCOUNTI' +
        'D, transact.FAMOUNT, '
      
        '   transact.FTAXAMOUNT, transact.FOUTSTANDINGAMOUNT, transact.BR' +
        'ECONCILED, '
      
        '   transact.WBALANCINGACCOUNTID, transact.WDESCRIPTIONID, transa' +
        'ct.WCURRENCYID, '
      
        '   transact.FFOREXAMOUNT, transact.WUSERID, transact.UNUSED, tra' +
        'nsact.DSYSDATE, '
      
        '   transact.BUNUSED, transact.WTAX2ID, transact.FCURRENCYRATE2, ' +
        'transact.FTAXRATE2, '
      
        '   transact.FTAX2AMOUNT, transact.WJOBCODEID, transact.WPROFILEI' +
        'D, transact.BEXCLUSIVE, '
      
        '   transact.WLINKEDID, transact.WREPORTINGGROUP1ID, transact.WRE' +
        'PORTINGGROUP2ID, '
      '   transact.WDOCID)'
      'VALUES'
      
        '  (:WTRANSACTIONID, :WBATCHID, :WBATCHTYPEID, :WLINEID, :BCARRIE' +
        'DFORWARD, '
      
        '   :BLASTYEAR, :BLINKSUSED, :BMULTIPLEITEMS, :WACCOUNTID, :DDATE' +
        ', :WPERIODID, '
      
        '   :WYEARID, :SREFERENCE, :FTAXRATE, :WTAXACCOUNTID, :FAMOUNT, :' +
        'FTAXAMOUNT, '
      
        '   :FOUTSTANDINGAMOUNT, :BRECONCILED, :WBALANCINGACCOUNTID, :WDE' +
        'SCRIPTIONID, '
      
        '   :WCURRENCYID, :FFOREXAMOUNT, :WUSERID, :UNUSED, :DSYSDATE, :B' +
        'UNUSED, '
      
        '   :WTAX2ID, :FCURRENCYRATE2, :FTAXRATE2, :FTAX2AMOUNT, :WJOBCOD' +
        'EID, :WPROFILEID, '
      
        '   :BEXCLUSIVE, :WLINKEDID, :WREPORTINGGROUP1ID, :WREPORTINGGROU' +
        'P2ID, :WDOCID)')
    DeleteSQL.Strings = (
      'DELETE FROM transact'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    ModifySQL.Strings = (
      'UPDATE transact SET'
      '  transact.WTRANSACTIONID = :WTRANSACTIONID,'
      '  transact.WBATCHID = :WBATCHID,'
      '  transact.WBATCHTYPEID = :WBATCHTYPEID,'
      '  transact.WLINEID = :WLINEID,'
      '  transact.BCARRIEDFORWARD = :BCARRIEDFORWARD,'
      '  transact.BLASTYEAR = :BLASTYEAR,'
      '  transact.BLINKSUSED = :BLINKSUSED,'
      '  transact.BMULTIPLEITEMS = :BMULTIPLEITEMS,'
      '  transact.WACCOUNTID = :WACCOUNTID,'
      '  transact.DDATE = :DDATE,'
      '  transact.WPERIODID = :WPERIODID,'
      '  transact.WYEARID = :WYEARID,'
      '  transact.SREFERENCE = :SREFERENCE,'
      '  transact.FTAXRATE = :FTAXRATE,'
      '  transact.WTAXACCOUNTID = :WTAXACCOUNTID,'
      '  transact.FAMOUNT = :FAMOUNT,'
      '  transact.FTAXAMOUNT = :FTAXAMOUNT,'
      '  transact.FOUTSTANDINGAMOUNT = :FOUTSTANDINGAMOUNT,'
      '  transact.BRECONCILED = :BRECONCILED,'
      '  transact.WBALANCINGACCOUNTID = :WBALANCINGACCOUNTID,'
      '  transact.WDESCRIPTIONID = :WDESCRIPTIONID,'
      '  transact.WCURRENCYID = :WCURRENCYID,'
      '  transact.FFOREXAMOUNT = :FFOREXAMOUNT,'
      '  transact.WUSERID = :WUSERID,'
      '  transact.UNUSED = :UNUSED,'
      '  transact.DSYSDATE = :DSYSDATE,'
      '  transact.BUNUSED = :BUNUSED,'
      '  transact.WTAX2ID = :WTAX2ID,'
      '  transact.FCURRENCYRATE2 = :FCURRENCYRATE2,'
      '  transact.FTAXRATE2 = :FTAXRATE2,'
      '  transact.FTAX2AMOUNT = :FTAX2AMOUNT,'
      '  transact.WJOBCODEID = :WJOBCODEID,'
      '  transact.WPROFILEID = :WPROFILEID,'
      '  transact.BEXCLUSIVE = :BEXCLUSIVE,'
      '  transact.WLINKEDID = :WLINKEDID,'
      '  transact.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  transact.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  transact.WDOCID = :WDOCID'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    Left = 668
    Top = 452
  end
  object qGen: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    Left = 601
    Top = 368
  end
  object ZUSQLOIlinks: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO oilinks'
      '  (oilinks.WOILINKSID, oilinks.DDOCDATE, oilinks.SREFERENCE, '
      'oilinks.SLINKEDREFERENCE, '
      '   oilinks.WFULLAMOUNT, oilinks.WOUTSTANDINGAMOUNT, '
      'oilinks.WLINKEDAMOUNT, '
      '   oilinks.DDATE, oilinks.UNUSED1, '
      'oilinks.WAMOUNTTRANSACTIONID, oilinks.WLINKTRANSACTIONID, '
      '   oilinks.WUSERID, oilinks.UNUSED2, oilinks.WBATCHID, '
      'oilinks.WACCOUNTID, '
      '   oilinks.WTAXID, oilinks.DSYSDATE)'
      'VALUES'
      '  (:WOILINKSID, :DDOCDATE, :SREFERENCE, :SLINKEDREFERENCE, '
      ':WFULLAMOUNT, '
      '   :WOUTSTANDINGAMOUNT, :WLINKEDAMOUNT, :DDATE, '
      ':UNUSED1, :WAMOUNTTRANSACTIONID, '
      '   :WLINKTRANSACTIONID, :WUSERID, :UNUSED2, :WBATCHID, '
      ':WACCOUNTID, :WTAXID, '
      '   :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM oilinks'
      'WHERE'
      '  oilinks.WOILINKSID = :OLD_WOILINKSID')
    ModifySQL.Strings = (
      'UPDATE oilinks SET'
      '  oilinks.WOILINKSID = :WOILINKSID,'
      '  oilinks.DDOCDATE = :DDOCDATE,'
      '  oilinks.SREFERENCE = :SREFERENCE,'
      '  oilinks.SLINKEDREFERENCE = :SLINKEDREFERENCE,'
      '  oilinks.WFULLAMOUNT = :WFULLAMOUNT,'
      '  oilinks.WOUTSTANDINGAMOUNT = :WOUTSTANDINGAMOUNT,'
      '  oilinks.WLINKEDAMOUNT = :WLINKEDAMOUNT,'
      '  oilinks.DDATE = :DDATE,'
      '  oilinks.UNUSED1 = :UNUSED1,'
      '  oilinks.WAMOUNTTRANSACTIONID = :WAMOUNTTRANSACTIONID,'
      '  oilinks.WLINKTRANSACTIONID = :WLINKTRANSACTIONID,'
      '  oilinks.WUSERID = :WUSERID,'
      '  oilinks.UNUSED2 = :UNUSED2,'
      '  oilinks.WBATCHID = :WBATCHID,'
      '  oilinks.WACCOUNTID = :WACCOUNTID,'
      '  oilinks.WTAXID = :WTAXID,'
      '  oilinks.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  oilinks.WOILINKSID = :OLD_WOILINKSID')
    Left = 784
    Top = 456
  end
  object ZQOILinks: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select OILinks.*,Messages.* from OILinks  join transact on OILin' +
        'ks.WAmountTransactionId = '
      
        'transact.WtransactionID join messages on (transact.WDescriptionI' +
        'd = Messages.WMessageId)')
    UpdateObject = ZUSQLOIlinks
    AfterInsert = ZQOILinksAfterInsert
    Left = 776
    Top = 412
    object ZQOILinksWOILINKSID: TIntegerField
      FieldName = 'WOILINKSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ZQOILinksDDOCDATE: TDateTimeField
      FieldName = 'DDOCDATE'
    end
    object ZQOILinksSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object ZQOILinksSLINKEDREFERENCE: TStringField
      FieldName = 'SLINKEDREFERENCE'
      Size = 15
    end
    object ZQOILinksWFULLAMOUNT: TFloatField
      FieldName = 'WFULLAMOUNT'
    end
    object ZQOILinksWOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'WOUTSTANDINGAMOUNT'
    end
    object ZQOILinksWLINKEDAMOUNT: TFloatField
      FieldName = 'WLINKEDAMOUNT'
    end
    object ZQOILinksDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQOILinksUNUSED1: TIntegerField
      FieldName = 'UNUSED1'
    end
    object ZQOILinksWAMOUNTTRANSACTIONID: TIntegerField
      FieldName = 'WAMOUNTTRANSACTIONID'
    end
    object ZQOILinksWLINKTRANSACTIONID: TIntegerField
      FieldName = 'WLINKTRANSACTIONID'
    end
    object ZQOILinksWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQOILinksUNUSED2: TIntegerField
      FieldName = 'UNUSED2'
    end
    object ZQOILinksWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object ZQOILinksWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQOILinksWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object ZQOILinksDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQOILinksSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
  end
  object tblBankDnl: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from dnlbanks')
    Left = 508
    Top = 452
    object tblBankDnlSTRANSID: TStringField
      FieldName = 'STRANSID'
      Size = 32
    end
    object tblBankDnlWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object tblBankDnlWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object tblBankDnlWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object tblBankDnlWTRANSTYPEID: TIntegerField
      FieldName = 'WTRANSTYPEID'
    end
    object tblBankDnlSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 15
    end
    object tblBankDnlDTRANSDATE: TDateTimeField
      FieldName = 'DTRANSDATE'
    end
    object tblBankDnlDPOSTEDDATE: TDateTimeField
      FieldName = 'DPOSTEDDATE'
    end
    object tblBankDnlFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object tblBankDnlSMEMO: TStringField
      FieldName = 'SMEMO'
      Size = 40
    end
    object tblBankDnlSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblBankDnlBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object tblBankDnlSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 40
    end
    object tblBankDnlWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblBankDnlWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object tblBankDnlWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object tblBankDnlWTCTRANSID: TIntegerField
      FieldName = 'WTCTRANSID'
    end
    object tblBankDnlWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblBankDnlWAUTOMATCHID: TIntegerField
      FieldName = 'WAUTOMATCHID'
    end
    object tblBankDnlBUSEFORBATCH: TIntegerField
      FieldName = 'BUSEFORBATCH'
    end
    object tblBankDnlDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBankDnlWAMTSGN: TIntegerField
      FieldName = 'WAMTSGN'
    end
    object tblBankDnlSEXTRADESCRIPTION: TStringField
      FieldName = 'SEXTRADESCRIPTION'
      Size = 255
    end
  end
  object PopupMenu5: TPopupMenu
    Left = 680
    Top = 232
    object Month1: TMenuItem
      Caption = 'Month'
      OnClick = Month1Click
    end
    object Fromtoday1: TMenuItem
      Caption = 'From today'
      OnClick = Fromtoday1Click
    end
    object Bydate1: TMenuItem
      Caption = 'By date'
      OnClick = Bydate1Click
    end
    object Byyear1: TMenuItem
      Caption = 'By year'
      OnClick = Byyear1Click
    end
  end
end
