object fmPosPayments: TfmPosPayments
  Left = 174
  Top = 140
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Payments'
  ClientHeight = 347
  ClientWidth = 618
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 313
    Width = 618
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnOk: TBitBtn
      Left = 285
      Top = 6
      Width = 96
      Height = 25
      Caption = '&Next'
      TabOrder = 0
      OnClick = BtnOkClick
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
    object BtnCancel: TBitBtn
      Left = 389
      Top = 6
      Width = 96
      Height = 25
      Caption = '&Back'
      TabOrder = 1
      OnClick = BtnCancelClick
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
  end
  object gbPayAmt: TGroupBox
    Left = 0
    Top = 0
    Width = 305
    Height = 313
    Align = alLeft
    TabOrder = 0
    object Shape1: TShape
      Left = 151
      Top = 19
      Width = 142
      Height = 29
      Brush.Color = clBlack
    end
    object Label3: TLabel
      Left = 144
      Top = 112
      Width = 9
      Height = 16
      Caption = '&1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 144
      Top = 152
      Width = 9
      Height = 16
      Caption = '&2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 144
      Top = 232
      Width = 9
      Height = 16
      Caption = '&4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 144
      Top = 272
      Width = 9
      Height = 16
      Caption = '&5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 72
      Top = 20
      Width = 74
      Height = 16
      Alignment = taRightJustify
      Caption = 'Still to pay'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 92
      Top = 68
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Change'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape2: TShape
      Left = 151
      Top = 67
      Width = 143
      Height = 29
      Brush.Color = clBlack
    end
    object Label17: TLabel
      Left = 144
      Top = 192
      Width = 9
      Height = 16
      Caption = '&3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 91
      Top = 112
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'CASH'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 62
      Top = 152
      Width = 75
      Height = 16
      Alignment = taRightJustify
      Caption = 'CreditCard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 79
      Top = 192
      Width = 54
      Height = 16
      Alignment = taRightJustify
      Caption = 'Cheque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 80
      Top = 232
      Width = 56
      Height = 16
      Alignment = taRightJustify
      Caption = 'Account'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 78
      Top = 272
      Width = 58
      Height = 16
      Alignment = taRightJustify
      Caption = 'Voucher'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbltoPay: TStaticText
      Left = 152
      Top = 18
      Width = 142
      Height = 27
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00 '
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      Transparent = False
    end
    object lblChange: TStaticText
      Left = 152
      Top = 66
      Width = 143
      Height = 27
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0.00 '
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Transparent = False
    end
    object edtCash: TEdit
      Left = 152
      Top = 104
      Width = 144
      Height = 37
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 2
      Text = '0.00'
      OnDblClick = edtCashDblClick
      OnEnter = edtCashEnter
      OnExit = edtCashExit
      OnKeyPress = edtCashKeyPress
    end
    object edtCard: TEdit
      Left = 152
      Top = 144
      Width = 144
      Height = 37
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 3
      Text = '0.00'
      OnDblClick = edtCashDblClick
      OnEnter = edtCashEnter
      OnExit = edtCashExit
      OnKeyPress = edtCashKeyPress
    end
    object edtCheque: TEdit
      Left = 152
      Top = 184
      Width = 144
      Height = 37
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 4
      Text = '0.00'
      OnDblClick = edtCashDblClick
      OnEnter = edtCashEnter
      OnExit = edtCashExit
      OnKeyPress = edtCashKeyPress
    end
    object edtAccount: TEdit
      Left = 152
      Top = 224
      Width = 144
      Height = 37
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 5
      Text = '0.00'
      OnDblClick = edtCashDblClick
      OnEnter = edtCashEnter
      OnExit = edtCashExit
      OnKeyPress = edtCashKeyPress
    end
    object edtVouch: TEdit
      Left = 152
      Top = 264
      Width = 144
      Height = 37
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 6
      Text = '0.00'
      OnDblClick = edtCashDblClick
      OnEnter = edtCashEnter
      OnExit = edtCashExit
      OnKeyPress = edtCashKeyPress
    end
    object cbIgnoreDevice: TCheckBox
      Left = 47
      Top = 173
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Negeer Apparaat'
      TabOrder = 7
      Visible = False
    end
  end
  object PcDetails: TPageControl
    Left = 305
    Top = 0
    Width = 313
    Height = 313
    ActivePage = AccPage
    Align = alClient
    TabOrder = 1
    TabStop = False
    OnExit = PcDetailsExit
    object CashPage: TTabSheet
      TabVisible = False
      DesignSize = (
        305
        303)
      object Label7: TLabel
        Left = 8
        Top = 18
        Width = 44
        Height = 13
        Caption = 'Customer'
      end
      object Label8: TLabel
        Left = 60
        Top = 42
        Width = 32
        Height = 13
        Caption = 'Label8'
      end
      object Label9: TLabel
        Left = 60
        Top = 18
        Width = 32
        Height = 13
        Caption = 'Label9'
      end
      object LComment: TLabel
        Left = 8
        Top = 60
        Width = 44
        Height = 13
        Caption = 'Comment'
      end
      object MComment: TMemo
        Left = 6
        Top = 76
        Width = 295
        Height = 215
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
    end
    object CardPage: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object Label10: TLabel
        Left = 68
        Top = 20
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Card Number'
      end
      object Label11: TLabel
        Left = 68
        Top = 48
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Holder Name'
      end
      object Label12: TLabel
        Left = 81
        Top = 74
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Card Type'
      end
      object Label13: TLabel
        Left = 75
        Top = 103
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Expire Date'
      end
      object Edit1: TEdit
        Left = 134
        Top = 16
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
      end
      object Edit2: TEdit
        Left = 134
        Top = 45
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
      object Edit3: TEdit
        Left = 134
        Top = 72
        Width = 121
        Height = 21
        AutoSize = False
        TabOrder = 2
        OnKeyPress = Edit1KeyPress
      end
      object wwDBDateTimePicker1: TcxDateEdit
        Left = 134
        Top = 99
        TabOrder = 3
        OnKeyPress = wwDBDateTimePicker1KeyPress
        Width = 121
      end
    end
    object AccPage: TTabSheet
      ImageIndex = 2
      TabVisible = False
      object Label14: TLabel
        Left = 12
        Top = 12
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Charge to Account:'
      end
      object Label15: TLabel
        Left = 2
        Top = 40
        Width = 213
        Height = 85
        AutoSize = False
        Caption = 'Label15'
        WordWrap = True
      end
      object edtCustAcc: TcxComboBox
        Left = 108
        Top = 12
        TabOrder = 0
        OnEnter = edtCustAccDropDown
        OnKeyPress = edtCustAccKeyPress
        Width = 169
      end
    end
    object VouPage: TTabSheet
      Caption = 'VouPage'
      ImageIndex = 3
      TabVisible = False
      object Label16: TLabel
        Left = 6
        Top = 16
        Width = 95
        Height = 13
        Caption = 'Voucher Information'
      end
      object Edit5: TEdit
        Left = 4
        Top = 40
        Width = 207
        Height = 21
        AutoSize = False
        BorderStyle = bsNone
        TabOrder = 0
        OnKeyPress = Edit1KeyPress
      end
      object Edit6: TEdit
        Left = 4
        Top = 61
        Width = 207
        Height = 21
        AutoSize = False
        BorderStyle = bsNone
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
      object Edit7: TEdit
        Left = 4
        Top = 82
        Width = 207
        Height = 21
        AutoSize = False
        BorderStyle = bsNone
        TabOrder = 2
        OnKeyPress = Edit7KeyPress
      end
    end
    object tbsCheques: TTabSheet
      Caption = 'tbsCheques'
      ImageIndex = 4
      TabVisible = False
      object Label18: TLabel
        Left = 8
        Top = 55
        Width = 77
        Height = 13
        Caption = 'Cheque Number'
      end
      object Label19: TLabel
        Left = 8
        Top = 12
        Width = 96
        Height = 13
        Caption = 'Bank Account Code'
      end
      object Edit4: TEdit
        Left = 9
        Top = 70
        Width = 147
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit7KeyPress
      end
      object edtBankCode: TEdit
        Left = 9
        Top = 27
        Width = 144
        Height = 21
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
    end
  end
end
