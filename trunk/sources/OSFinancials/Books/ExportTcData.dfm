object fmExportData: TfmExportData
  Left = 409
  Top = 283
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Export Data to File'
  ClientHeight = 431
  ClientWidth = 387
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 20
    Top = 88
    Width = 46
    Height = 13
    Caption = 'Export To'
  end
  object Label10: TLabel
    Left = 20
    Top = 114
    Width = 43
    Height = 13
    Caption = 'File Type'
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 397
    Width = 387
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      387
      34)
    object BtnOk: TBitBtn
      Left = 182
      Top = 7
      Width = 98
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Export'
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
      OnClick = BtnOkClick
    end
    object BtnCancel: TBitBtn
      Left = 286
      Top = 7
      Width = 98
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
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
      OnClick = BtnCancelClick
    end
  end
  object PageControl1: TPageControl
    Left = 13
    Top = 220
    Width = 336
    Height = 160
    ActivePage = AllAccounts
    TabOrder = 1
    object DocTab: TTabSheet
      Caption = 'DocTab'
      TabVisible = False
      object Label9: TLabel
        Left = 3
        Top = 3
        Width = 120
        Height = 13
        Caption = 'Include Documents since'
      end
      object BGRange: TGroupBox
        Left = 13
        Top = 22
        Width = 254
        Height = 121
        Caption = 'Range'
        TabOrder = 0
        object LFrom2: TLabel
          Left = 16
          Top = 24
          Width = 23
          Height = 13
          Caption = 'From'
        end
        object LTo2: TLabel
          Left = 16
          Top = 48
          Width = 13
          Height = 13
          Caption = 'To'
        end
        object dtDocExport: TcxDateEdit
          Left = 72
          Top = 22
          TabOrder = 0
          Width = 145
        end
        object dtDocExportTo: TcxDateEdit
          Left = 72
          Top = 46
          TabOrder = 1
          Width = 145
        end
      end
    end
    object AllAccounts: TTabSheet
      Caption = 'AllAccounts'
      ImageIndex = 3
      TabVisible = False
      object gbRanges: TGroupBox
        Left = 5
        Top = 4
        Width = 316
        Height = 140
        Caption = 'Range'
        TabOrder = 0
        object LFrom: TLabel
          Left = 8
          Top = 20
          Width = 23
          Height = 13
          Caption = 'From'
        end
        object LTo: TLabel
          Left = 10
          Top = 50
          Width = 13
          Height = 13
          Caption = 'To'
        end
        object lblDatePeriod: TLabel
          Left = 13
          Top = 80
          Width = 56
          Height = 13
          Caption = 'Date Period'
          Visible = False
        end
        object edtFrom: TEdit
          Left = 160
          Top = 14
          Width = 145
          Height = 21
          TabOrder = 0
          OnEnter = edtFromEnter
        end
        object edtTo: TEdit
          Left = 160
          Top = 40
          Width = 145
          Height = 21
          TabOrder = 1
          OnEnter = edtToEnter
        end
        object CheckBox1: TCheckBox
          Left = 294
          Top = 76
          Width = 13
          Height = 17
          Caption = 'CheckBox1'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbExportdocs: TCheckBox
          Left = 13
          Top = 99
          Width = 145
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Export docs'
          TabOrder = 3
        end
        object cbIncExport: TCheckBox
          Left = 13
          Top = 120
          Width = 145
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Increment Export'
          TabOrder = 4
        end
        object edtDatePeriod: TcxDateEdit
          Left = 161
          Top = 75
          TabOrder = 5
          Width = 125
        end
      end
    end
  end
  object OtherDir: TEdit
    Left = 156
    Top = 84
    Width = 193
    Height = 21
    TabOrder = 2
    Text = 'C:\TCash3'
  end
  object BitBtn1: TBitBtn
    Left = 351
    Top = 85
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
    TabOrder = 3
    TabStop = False
    OnClick = BitBtn3Click
  end
  object cbFileType: TComboBox
    Left = 156
    Top = 108
    Width = 193
    Height = 21
    Style = csDropDownList
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 4
    Items.Strings = (
      '( *.Xml )   Xml Database'
      '( *.Csv )   Comma Delimited File'
      '( *.Wk1)  Lotus SpreadSheet'
      '(*.XLS)    MS Excel SpreadSheet'
      '(*.TXF)    TurboCASH Exchange File'
      '(*.SLK)    SYLK SpreadSheet format'
      '(*.SXC)    Open Office SpreadSheet'
      '( *.txt )   Tab delimited')
  end
  object gbFiles: TGroupBox
    Left = 16
    Top = 138
    Width = 333
    Height = 75
    Caption = 'Export Files Name'
    TabOrder = 5
    object Label11: TLabel
      Left = 12
      Top = 26
      Width = 47
      Height = 13
      Caption = 'File Name'
    end
    object Label13: TLabel
      Left = 14
      Top = 50
      Width = 37
      Height = 13
      Caption = 'Log File'
    end
    object edtExportfile: TEdit
      Left = 162
      Top = 18
      Width = 151
      Height = 21
      TabOrder = 0
      Text = 'Exportfile'
    end
    object edtExportLog: TEdit
      Left = 162
      Top = 44
      Width = 151
      Height = 21
      TabOrder = 1
      Text = 'ExportLog'
    end
  end
  object tsindex: TcxPageControl
    Left = 0
    Top = 0
    Width = 387
    Height = 81
    ActivePage = cxdocs
    Align = alTop
    MultiLine = True
    Style = 2
    TabOrder = 6
    OnChange = tsindexChange
    ClientRectBottom = 81
    ClientRectRight = 387
    ClientRectTop = 23
    object cxdocs: TcxTabSheet
      Caption = 'cxdocs'
      ImageIndex = 0
    end
    object cxStock: TcxTabSheet
      Caption = 'cxStock'
      ImageIndex = 1
    end
    object cxdeb: TcxTabSheet
      Caption = 'cxdeb'
      ImageIndex = 2
    end
    object cxaccounts: TcxTabSheet
      Caption = 'cxaccounts'
      ImageIndex = 3
    end
    object cxcreditors: TcxTabSheet
      Caption = 'cxcreditors'
      ImageIndex = 4
    end
    object cxpostedbatch: TcxTabSheet
      Caption = 'cxpostedbatch'
      ImageIndex = 5
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 116
    Top = 96
  end
end
