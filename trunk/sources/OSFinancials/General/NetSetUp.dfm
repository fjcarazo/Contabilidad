object fmNetSetUp: TfmNetSetUp
  Left = 217
  Top = 214
  Caption = 'Internet Setup'
  ClientHeight = 492
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 455
    Width = 528
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BtnOk: TBitBtn
      Left = 325
      Top = 8
      Width = 96
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
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancel: TBitBtn
      Left = 425
      Top = 8
      Width = 96
      Height = 25
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
      ModalResult = 1
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnCancelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 257
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      528
      257)
    object Label6: TLabel
      Left = 8
      Top = 28
      Width = 78
      Height = 13
      Caption = 'E-Mail Account :'
    end
    object Label7: TLabel
      Left = 46
      Top = 52
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Server Name'
    end
    object lblUserMail: TLabel
      Left = 72
      Top = 84
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'User ID'
    end
    object LEmailAddress: TLabel
      Left = 38
      Top = 139
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-Mail Address'
    end
    object LOutgoingMail: TLabel
      Left = 324
      Top = 4
      Width = 198
      Height = 13
      Caption = 'Outgoing Mail server identification (SMTP)'
    end
    object tcxShape: TShape
      Left = 8
      Top = 19
      Width = 524
      Height = 4
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clNavy
      Pen.Color = clCream
    end
    object Shape1: TShape
      Left = 8
      Top = 217
      Width = 524
      Height = 4
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clNavy
      Pen.Color = clCream
    end
    object LDefaultText: TLabel
      Left = 53
      Top = 170
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Default text'
    end
    object Label10: TLabel
      Left = 62
      Top = 108
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Password'
    end
    object TestMailSvr: TBitBtn
      Left = 394
      Top = 46
      Width = 119
      Height = 25
      Caption = '&Test Mail Server'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = TestMailSvrClick
    end
    object edtMailAddress: TcxDBMaskEdit
      Left = 116
      Top = 136
      DataBinding.DataField = 'UserEmail'
      DataBinding.DataSource = dmDatabase.dsUser
      TabOrder = 1
      Width = 261
    end
    object edtEmailServer: TcxTextEdit
      Left = 116
      Top = 48
      TabOrder = 2
      Text = 'edtEmailServer'
      Width = 261
    end
    object edtUserID: TcxTextEdit
      Left = 116
      Top = 76
      TabOrder = 3
      Text = 'cxTextEdit1'
      Width = 261
    end
    object edtPass: TcxTextEdit
      Left = 116
      Top = 104
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 4
      Text = 'cxTextEdit1'
      Width = 261
    end
    object EDefaultText: TcxTextEdit
      Left = 116
      Top = 168
      TabOrder = 5
      Text = 'cxTextEdit1'
      Width = 261
    end
  end
  object LogMemo: TcxMemo
    Left = 0
    Top = 257
    TabStop = False
    Align = alClient
    Lines.Strings = (
      'LogMemo')
    ParentFont = False
    Style.Color = clMenuText
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Lucida Console'
    Style.Font.Style = []
    Style.TextColor = clWindow
    Style.IsFontAssigned = True
    TabOrder = 2
    OnEnter = LogMemoEnter
    Height = 198
    Width = 528
  end
end
