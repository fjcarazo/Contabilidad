object fmZipBackupRestore: TfmZipBackupRestore
  Left = 139
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Backup/Restore'
  ClientHeight = 566
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainLeftPnl: TPanel
    Left = 93
    Top = 0
    Width = 651
    Height = 458
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TopPanel: TPanel
      Left = 0
      Top = 0
      Width = 651
      Height = 284
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        651
        284)
      object lvSetofBooks: TcxListView
        Left = 59
        Top = 4
        Width = 555
        Height = 184
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColumnClick = False
        Columns = <
          item
            Caption = 'Set of Books Name'
            Width = 175
          end
          item
            AutoSize = True
            Caption = 'Location'
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SortType = stBoth
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvSetofBooksSelectItem
      end
      object T3FileListBox: TFileListBox
        Left = 64
        Top = 94
        Width = 135
        Height = 94
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
      object LedPnl: TPanel
        Left = 7
        Top = 8
        Width = 19
        Height = 16
        BevelOuter = bvNone
        TabOrder = 2
        object RedLed: TImage
          Left = 0
          Top = 0
          Width = 17
          Height = 17
          Picture.Data = {
            07544269746D6170AA030000424DAA0300000000000036000000280000001100
            000011000000010018000000000074030000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF70709030305F0F0F4000004010104F30305F707090FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF2F2F5F00004000005000
            006000006000005F0000500000402F2F5FFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFF10105F00006F00009000009000009000008000006F00006F00
            006000005F10104FFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF2F2F7000009F0F0F
            AF0000A00000A00000A000009F00009000008000006F00006F00005F2F2F50FF
            FFFFFFFFFF00FFFFFF70709F0000900F0FBF0F0FBF0F0FBF0F0FBF0F0FBF0F0F
            AF0F0FAF00009F00009000006F00006F000040707090FFFFFF00FFFFFF30309F
            1010BF1010CF1F1FCF1F1FCF1F1FCF1F1FCF1010BF1010BF0F0FB00000A00000
            9000008000005030305FFFFFFF00FFFFFF1F1FAF1010D02020D02020DF3030E0
            3030E02F2FDF2020D01F1FCF1010BF0F0FB00000A000009000006F10104FFFFF
            FF00FFFFFF1010BF1F1FE03030EF3030EF3F3FE03F3FE03F3FE03030E02F2FDF
            2020D01010BF0F0FB000009F00008000004FFFFFFF00FFFFFF2020D02F2FEF3F
            3FEF4040F04F4FFF5050F04F4FF04040EF3F3FE02F2FDF1F1FCF1010BF0F0FAF
            000090101050FFFFFF00FFFFFF3F3FE02F2FFF4040F05050FF6F6FFF6F6FFF60
            60FF5050FF4F4FF03F3FE02F2FDF1F1FCF0F0FB000008030306FFFFFFF00FFFF
            FF7070CF2F2FFF4F4FFF6060FF8F8FFFAFAFFF8F8FFF6060FF5050F04040EF30
            30E01F1FD01010BF00006F70709FFFFFFF00FFFFFFFFFFFF4040F04040F06060
            FF8F8FFFAFAFFF9F9FFF6F6FFF5050FF4040F03030E02020D00F0FB02F2F8FFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFF3F3FFF5050FF6F6FFF8080FF7070FF6060
            FF5050FF4040F03030EF1F1FD01F1FA0FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF4F4FF04F4FFF5F5FFF5F5FFF5050FF4F4FFF3030F01F1FE03030
            BFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080DF
            4F4FF04040F03F3FFF3030F04040E07070CFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          Transparent = True
        end
        object GreenLed: TImage
          Left = 0
          Top = -1
          Width = 17
          Height = 18
          Picture.Data = {
            07544269746D6170DE030000424DDE0300000000000036000000280000001100
            0000120000000100180000000000A8030000C40E0000C40E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF809080305030104010003F00104010305030708F70FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF2F5F2F003F00004F0000
            6000006000006000004000003F002F502FFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFF105F10007000008F00008F00008000007000006F0000600000
            6000004F00104010FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF2F702F00900000A0
            000FA00F0FA00F0F9F0F009000008F00007000006F00006000004F002F4F2FFF
            FFFFFFFFFF00FFFFFF80A08000900010BF1010BF1010BF101FBF1F10B01010AF
            100FA00F009000008000006F00006000003F00809080FFFFFF00FFFFFF309F30
            0FC00F10CF1020CF201FD01F20CF2020CF201FC01F1FBF1F10AF100F9F0F008F
            00006F00004F00305030FFFFFF00FFFFFF1FAF1F1FD01F20DF202FE02F30DF30
            30E03030DF302FD02F20CF201FBF1F10AF100F9F0F008000006F00104010FFFF
            FF00FFFFFF10CF101FDF1F2FEF2F3FEF3F40EF4040EF4040EF403FE03F30DF30
            2FD02F1FC01F10AF100F9F0F008000004000FFFFFF00FFFFFF20DF202FF02F40
            EF404FFF4F50FF505FF05F50F0504FEF4F40EF4030DF3020CF201FBF1F0FA00F
            008F00104F10FFFFFF00FFFFFF3FE03F2FFF2F40FF4050FF506FFF6F70FF706F
            FF6F5FF05F4FEF4F3FE03F2FD02F1FC01F10B010007000306030FFFFFF00FFFF
            FF80D0802FFF2F4FFF4F60FF608FFF8FAFFFAF90FF906FFF6F50F05040EF4030
            E03020CF2010BF10006000709F70FFFFFF00FFFFFFFFFFFF40EF4040FF4060FF
            608FFF8FAFFFAF9FFF9F70FF705FFF5F40F04030E03020DF2010B0102F8F2FFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFF3FF03F50FF506FFF6F70FF7070FF7060FF
            6050FF5040F0402FEF2F1FD01F1F9F1FFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF4FEF4F40FF405FFF5F5FFF5F50FF5040FF4030FF301FDF1F30BF
            30FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FDF8F
            4FEF4F3FF03F30FF3030FF303FE03F80C080FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00}
          Transparent = True
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 184
        Width = 651
        Height = 100
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object lblCapFrom: TLabel
          Left = 48
          Top = 47
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Backup from '
        end
        object lblCapTo: TLabel
          Left = 55
          Top = 72
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Backup To '
        end
        object Gauge1: TGauge
          Left = 527
          Top = 20
          Width = 46
          Height = 14
          BackColor = clBtnFace
          BorderStyle = bsNone
          ForeColor = clNavy
          Progress = 0
          Visible = False
        end
        object Label1: TLabel
          Left = 64
          Top = 23
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'File Name'
        end
        object LcbMail: TLabel
          Left = 441
          Top = 20
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Email Backup'
        end
        object LCBSelfExtract: TLabel
          Left = 420
          Top = 47
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Self extracting exe'
        end
        object lblFrom: TEdit
          Left = 122
          Top = 47
          Width = 111
          Height = 13
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object lblTo: TEdit
          Left = 122
          Top = 66
          Width = 158
          Height = 21
          TabOrder = 1
        end
        object btnTo: TBitBtn
          Left = 260
          Top = 67
          Width = 20
          Height = 19
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
            333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
            300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
            333337F373F773333333303330033333333337F3377333333333303333333333
            333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
            333337777F337F33333330330BB00333333337F373F773333333303330033333
            333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
            333377777F77377733330BBB0333333333337F337F33333333330BB003333333
            333373F773333333333330033333333333333773333333333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = btnToClick
        end
        object cbMail: TCheckBox
          Left = 512
          Top = 20
          Width = 21
          Height = 17
          TabOrder = 3
        end
        object edtFileName: TEdit
          Left = 122
          Top = 20
          Width = 159
          Height = 21
          TabOrder = 4
          Text = 'osFinancials'
        end
        object BitBtn1: TBitBtn
          Left = 260
          Top = 20
          Width = 20
          Height = 19
          DoubleBuffered = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
            333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
            300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
            333337F373F773333333303330033333333337F3377333333333303333333333
            333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
            333337777F337F33333330330BB00333333337F373F773333333303330033333
            333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
            333377777F77377733330BBB0333333333337F337F33333333330BB003333333
            333373F773333333333330033333333333333773333333333333}
          NumGlyphs = 2
          ParentDoubleBuffered = False
          TabOrder = 5
          OnClick = BitBtn1Click
        end
        object CBSelfExtract: TCheckBox
          Left = 512
          Top = 45
          Width = 20
          Height = 17
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object cbBackupReports: TCheckBox
          Left = 287
          Top = 20
          Width = 138
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Backup reports'
          TabOrder = 7
        end
        object cbUniDump: TCheckBox
          Left = 408
          Top = 70
          Width = 117
          Height = 15
          Alignment = taLeftJustify
          Caption = 'uni dump'
          TabOrder = 8
        end
      end
    end
    object BottPnl: TPanel
      Left = 0
      Top = 284
      Width = 651
      Height = 174
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 651
        Height = 174
        Cursor = crArrow
        Align = alClient
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'Waiting to run ...')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        OnEnter = Memo1Enter
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 494
    Width = 744
    Height = 21
    Panels = <
      item
        Width = 100
      end
      item
        Style = psOwnerDraw
        Width = 50
      end
      item
        Style = psOwnerDraw
        Width = 270
      end
      item
        Width = 50
      end>
    OnDrawPanel = StatusBarDrawPanel
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 93
    Height = 458
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = 9079551
    TabOrder = 0
    object Bevel1: TBevel
      Left = 5
      Top = 150
      Width = 78
      Height = 3
    end
    object ToolBar1: TToolBar
      Left = 8
      Top = 4
      Width = 80
      Height = 141
      Align = alNone
      ButtonHeight = 68
      ButtonWidth = 55
      Caption = 'ToolBar1'
      Images = dmOsfResource.BatchEnabledButtons
      ShowCaptions = True
      TabOrder = 0
      Transparent = True
      object sbBackup: TToolButton
        Left = 0
        Top = 0
        Caption = 'Backup'
        Down = True
        Grouped = True
        ImageIndex = 28
        Wrap = True
        Style = tbsCheck
        OnClick = sbBackupClick
      end
      object sbRestore: TToolButton
        Left = 0
        Top = 68
        Caption = 'Restore'
        Grouped = True
        ImageIndex = 27
        Wrap = True
        Style = tbsCheck
        OnClick = sbBackupClick
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 458
    Width = 744
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnClose: TBitBtn
      Left = 534
      Top = 5
      Width = 96
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
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnExec: TBitBtn
      Left = 335
      Top = 5
      Width = 96
      Height = 25
      Caption = '&Execute'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnExecClick
    end
    object BtnStop: TBitBtn
      Left = 435
      Top = 5
      Width = 96
      Height = 25
      Caption = '&Stop'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BtnStopClick
    end
  end
  object AbProgressBar1: TAbProgressBar
    Left = 0
    Top = 515
    Width = 744
    Height = 17
    Align = alBottom
    TabOrder = 4
  end
  object AbProgressBar2: TAbProgressBar
    Left = 0
    Top = 532
    Width = 744
    Height = 17
    Align = alBottom
    TabOrder = 5
  end
  object AbProgressBar3: TAbProgressBar
    Left = 0
    Top = 549
    Width = 744
    Height = 17
    Align = alBottom
    TabOrder = 6
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Exe|*.exe|Zip|*.zip|all|*.zip;*.exe;*.sql|Sql dump|*.sql'
    FilterIndex = 3
    Left = 294
    Top = 89
  end
  object UniDump1: TUniDump
    OnBackupProgress = UniDump1BackupProgress
    Connection = dmDatabase.ZMainconnection
    Options.AddDrop = False
    Options.QuoteNames = True
    Left = 534
    Top = 29
  end
  object UniConnection1: TUniConnection
    DataTypeMap = <>
    Options.KeepDesignConnected = False
    LoginPrompt = False
    Left = 466
    Top = 21
  end
  object UniQuery1: TUniQuery
    DataTypeMap = <>
    Connection = UniConnection1
    Left = 542
    Top = 97
  end
  object UniTransaction1: TUniTransaction
    DefaultConnection = UniConnection1
    IsolationLevel = ilRepeatableRead
    DefaultCloseAction = taCommit
    Left = 398
    Top = 25
  end
  object UniScript1: TUniScript
    BeforeExecute = UniScript1BeforeExecute
    OnError = UniScript1Error
    Connection = UniConnection1
    Left = 322
    Top = 33
  end
  object AbZipKit1: TAbZipKit
    ArchiveProgressMeter = AbProgressBar2
    ArchiveSaveProgressMeter = AbProgressBar1
    AutoSave = False
    DOSMode = False
    ExtractOptions = [eoCreateDirs, eoRestorePath]
    ItemProgressMeter = AbProgressBar3
    OnArchiveProgress = AbZipKit1ArchiveProgress
    OnArchiveItemProgress = AbZipKit1ArchiveItemProgress
    StoreOptions = [soStripDrive, soRemoveDots, soRecurse, soReplace]
    Left = 518
    Top = 153
  end
  object AbMakeSelfExe1: TAbMakeSelfExe
    StubExe = 'E:\osfinancials\zipstub.exe'
    Left = 406
    Top = 129
  end
end
