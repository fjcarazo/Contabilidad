object frmTransfertTrans: TfrmTransfertTrans
  Left = 427
  Top = 347
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Transfer Transactions'
  ClientHeight = 332
  ClientWidth = 530
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 297
    Width = 530
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      530
      35)
    object BtnOk: TBitBtn
      Left = 328
      Top = 5
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
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
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancel: TBitBtn
      Left = 432
      Top = 5
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
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
      OnClick = BtnCancelClick
      OnKeyDown = BtnCancelKeyDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 62
      Top = 8
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Process'
    end
    object Label5: TLabel
      Left = 326
      Top = 8
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date'
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 4
      Width = 169
      Height = 21
      TabOrder = 0
      Text = 'Transfert Transactions'
      OnChange = ComboBox1Change
      OnKeyPress = ComboBox1KeyPress
      Items.Strings = (
        'Transfert Transactions'
        'Receive Payments')
    end
    object edtDate1: TcxDateEdit
      Left = 356
      Top = 4
      TabOrder = 1
      OnKeyPress = edtDate1KeyPress
      Width = 149
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 35
    Width = 530
    Height = 262
    ActivePage = RecPymt
    Align = alClient
    TabOrder = 2
    object Default: TTabSheet
      Caption = 'Default'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Shape6: TShape
        Left = 1
        Top = 1
        Width = 316
        Height = 193
        Brush.Color = clBtnFace
      end
      object Shape1: TShape
        Left = 320
        Top = 1
        Width = 197
        Height = 193
        Brush.Color = clBtnFace
      end
      object Label3: TLabel
        Left = 14
        Top = 11
        Width = 3
        Height = 13
      end
      object Label1: TLabel
        Left = 41
        Top = 52
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'From Account'
      end
      object LblFromDescription: TLabel
        Left = 112
        Top = 76
        Width = 90
        Height = 13
        Caption = 'LblFromDescription'
      end
      object Label2: TLabel
        Left = 52
        Top = 111
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'To Account'
      end
      object Shape3: TShape
        Left = 369
        Top = 109
        Width = 101
        Height = 21
      end
      object Label8: TLabel
        Left = 451
        Top = 113
        Width = 15
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0'
        Transparent = True
      end
      object Shape2: TShape
        Left = 367
        Top = 48
        Width = 101
        Height = 21
      end
      object Label7: TLabel
        Left = 449
        Top = 52
        Width = 15
        Height = 13
        Alignment = taRightJustify
        Caption = '0.0'
        Transparent = True
      end
      object Label6: TLabel
        Left = 376
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Current Balance'
        Transparent = True
      end
      object LblToDescription: TLabel
        Left = 112
        Top = 135
        Width = 80
        Height = 13
        Caption = 'LblToDescription'
      end
      object edtFromAccount: TEdit
        Left = 112
        Top = 48
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'edtFromAccount'
      end
      object edtToAccount: TEdit
        Left = 112
        Top = 108
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'edtToAccount'
      end
      object BitBtn3: TBitBtn
        Left = 233
        Top = 48
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
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn1: TBitBtn
        Left = 233
        Top = 108
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
        TabOrder = 3
        OnClick = BitBtn1Click
      end
    end
    object RecPymt: TTabSheet
      Caption = 'RecPymt'
      ImageIndex = 1
      TabVisible = False
      object Shape4: TShape
        Left = 4
        Top = 0
        Width = 323
        Height = 233
        Brush.Color = clBtnFace
      end
      object Shape5: TShape
        Left = 336
        Top = 0
        Width = 183
        Height = 233
        Brush.Color = clBtnFace
      end
      object Label9: TLabel
        Left = 43
        Top = 60
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Reference'
      end
      object Label10: TLabel
        Left = 19
        Top = 11
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Receiving From'
      end
      object Label11: TLabel
        Left = 40
        Top = 85
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Description'
      end
      object Label12: TLabel
        Left = 57
        Top = 110
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Amount'
      end
      object Label13: TLabel
        Left = 96
        Top = 36
        Width = 9
        Height = 13
        Caption = '...'
      end
      object Label14: TLabel
        Left = 362
        Top = 10
        Width = 13
        Height = 13
        Alignment = taRightJustify
        Caption = 'To'
      end
      object Label15: TLabel
        Left = 420
        Top = 71
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Current Balance'
      end
      object Label16: TLabel
        Left = 475
        Top = 97
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = '0.00'
        Transparent = True
      end
      object Label17: TLabel
        Left = 470
        Top = 139
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label18: TLabel
        Left = 457
        Top = 117
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Balance'
      end
      object Label19: TLabel
        Left = 40
        Top = 183
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Outstanding'
      end
      object Label20: TLabel
        Left = 103
        Top = 184
        Width = 21
        Height = 13
        Caption = '0.00'
        Transparent = True
      end
      object Label21: TLabel
        Left = 493
        Top = 34
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '..'
      end
      object Label22: TLabel
        Left = 71
        Top = 132
        Width = 22
        Height = 13
        Alignment = taRightJustify
        Caption = 'Alias'
      end
      object lpaymentmethode: TLabel
        Left = 14
        Top = 155
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = 'Payment method'
      end
      object Edit1: TEdit
        Left = 96
        Top = 57
        Width = 117
        Height = 21
        MaxLength = 8
        TabOrder = 0
        Text = 'Edit1'
        OnKeyPress = ComboBox1KeyPress
      end
      object Edit2: TEdit
        Left = 96
        Top = 82
        Width = 213
        Height = 21
        TabOrder = 1
        Text = 'Edit2'
        OnKeyPress = ComboBox1KeyPress
      end
      object Edit3: TEdit
        Left = 96
        Top = 107
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'Edit3'
        OnKeyPress = ComboBox1KeyPress
      end
      object CBPrintReciept: TCheckBox
        Left = 384
        Top = 156
        Width = 129
        Height = 17
        Caption = 'Print Reciept'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnKeyPress = ComboBox1KeyPress
      end
      object EAlias: TEdit
        Left = 96
        Top = 129
        Width = 205
        Height = 21
        MaxLength = 15
        TabOrder = 4
        Text = 'AutoPymt'
        OnKeyPress = ComboBox1KeyPress
      end
      object BitBtn2: TBitBtn
        Left = 120
        Top = 200
        Width = 75
        Height = 19
        Caption = '%'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 5
        OnClick = BitBtn2Click
      end
      object mpercent: TMaskEdit
        Left = 44
        Top = 200
        Width = 69
        Height = 21
        TabOrder = 6
        Text = '0.025'
      end
      object BitBtn4: TBitBtn
        Left = 204
        Top = 200
        Width = 75
        Height = 19
        Caption = '%#'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 7
        OnClick = BitBtn4Click
      end
      object cbxPymtMethod: TComboBox
        Left = 96
        Top = 152
        Width = 201
        Height = 21
        Style = csDropDownList
        TabOrder = 8
      end
      object edtAccFrom: TcxComboBox
        Left = 97
        Top = 11
        TabOrder = 9
        Text = 'edtAccFrom'
        Width = 220
      end
      object edtAccTo: TcxComboBox
        Left = 384
        Top = 12
        TabOrder = 10
        OnEnter = edtAccToEnter
        Width = 121
      end
    end
  end
  object tPRocess: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tPRocessTimer
    Left = 368
    Top = 101
  end
end
