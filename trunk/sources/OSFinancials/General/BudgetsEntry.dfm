object fmBudgetsEntry: TfmBudgetsEntry
  Left = 223
  Top = 156
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Period Budget'
  ClientHeight = 222
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 188
    Width = 455
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnOk: TBitBtn
      Left = 270
      Top = 6
      Width = 91
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = btnOkClick
      OnKeyDown = FormKeyDown
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BtnCancel: TBitBtn
      Left = 364
      Top = 6
      Width = 85
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BtnRestore: TBitBtn
      Left = 146
      Top = 6
      Width = 95
      Height = 25
      Caption = '&Restore'
      TabOrder = 2
      OnClick = BtnRestoreClick
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFFFFF333FFFFF3330000000033300000333377777777F337777
        7FF330EFEFEF03307333703337F3FFFF7F37733377F330F4444E033333333033
        37F777737F333333F7F33099999903333330703337F333337F33333777FF309F
        FFF903333330000337F333337F33333777733099999903333330003337F3FF3F
        7F333337773330F44E0003333330033337F7737773333337733330EFEF003333
        3330333337FFFF7733333337333330000003333333333333377777733333FFFF
        FFFF3333333333300000000333333F3333377777777F333303333330EFEFEF03
        33337F333337F3FFFF7F333003333330F4444E0333377F333337F777737F3300
        03333330EFEFEF0333777F333337F3FFFF7F300003333330F4444E0337777F33
        3337F777737F330703333330EFEFEF03337773333337F3FF3F7F330333333330
        F44E0003337FF333FF37F7737773330733370330EFEF00333377FFF77337FFFF
        7733333000003330000003333337777733377777733333333333333333333333
        33333333333333333333}
      NumGlyphs = 2
    end
    object BntPreview: TBitBtn
      Left = 16
      Top = 6
      Width = 97
      Height = 25
      Caption = '&Preview'
      TabOrder = 3
      OnClick = BntPreviewClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00B6B6B6B6B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B60000000000
        00000000000000B6B6B6000000000000000000000000B6B60000B600FFFFFFFF
        FFFFFFFFFFFF00B600B600FFFFFFFFFFFFFFFFFFFF00B6000000B600FFFFFFFF
        FFFFFF000000000000B600FFFFFFFFFFFFFF00000000000000B6B600FFFFFFFF
        FFFF006DB6B66D0000B600FFFFFFFFFFFF00B6B6B6B60000B6B6B600FFFFFFFF
        FF006DB6B61F6DFF00B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FF00B6B6B6B66DB600B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FF00B61FB6B66DB600B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FF006D1F1FB66DFF00B600FFFFFFFFFF00B6B6B6B6B6B600B6B6B600FFFFFFFF
        FFFF006DB6B66D00B6B600FFFFFFFFFFFF00B6B6B6B600B6B6B6B600FFFFFFFF
        FFFFFF00000000B6B6B600FFFFFFFFFFFFFF00000000B6B6B6B6B600FFFFFFFF
        FFFFFFFFFFFF00B6B6B600FFFFFFFFFFFFFFFFFFFF00B6B6B6B6B600FFFFFFFF
        FFFFFF00000000B6B6B600FFFFFFFFFFFFFF00000000B6B6B6B6B600FFFFFFFF
        FFFFFF00B600B6B6B6B600FFFFFFFFFFFFFF00B600B6B6B6B6B6B600FFFFFFFF
        FFFFFF0000B6B6B6B6B600FFFFFFFFFFFFFF0000B6B6B6B6B6B6B60000000000
        00000000B6B6B6B6B6B6000000000000000000B6B6B6B6B6B6B6}
      NumGlyphs = 2
    end
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 147
    Height = 188
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Account'
    end
    object Label2: TLabel
      Left = 18
      Top = 70
      Width = 72
      Height = 13
      Caption = 'Annual Amount'
    end
    object Label5: TLabel
      Left = 18
      Top = 126
      Width = 82
      Height = 13
      Caption = 'Opening Balance'
    end
    object edtAccount: TEdit
      Left = 14
      Top = 26
      Width = 103
      Height = 21
      TabOrder = 0
      OnEnter = edtAccountEnter
      OnExit = edtAccountExit
      OnKeyDown = FormKeyDown
    end
    object edtAnnual: TEdit
      Left = 16
      Top = 88
      Width = 105
      Height = 21
      TabOrder = 1
      OnKeyDown = FormKeyDown
      OnKeyPress = edtAnnualKeyPress
    end
    object Edit27: TEdit
      Left = 16
      Top = 144
      Width = 105
      Height = 21
      TabOrder = 2
      OnKeyDown = FormKeyDown
      OnKeyPress = edtAnnualKeyPress
    end
  end
  object TPanel
    Left = 147
    Top = 0
    Width = 308
    Height = 188
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 86
      Top = 4
      Width = 25
      Height = 13
      Caption = 'Debit'
    end
    object Label4: TLabel
      Left = 190
      Top = 4
      Width = 27
      Height = 13
      Caption = 'Credit'
    end
    object Period1: TLabel
      Left = 46
      Top = 24
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period1'
    end
    object Period2: TLabel
      Left = 46
      Top = 48
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period2'
    end
    object Period3: TLabel
      Left = 46
      Top = 72
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period3'
    end
    object Period4: TLabel
      Left = 46
      Top = 96
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period4'
    end
    object Period5: TLabel
      Left = 46
      Top = 120
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period5'
    end
    object Period6: TLabel
      Left = 46
      Top = 144
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period6'
    end
    object Period7: TLabel
      Left = 46
      Top = 168
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period7'
    end
    object Period8: TLabel
      Left = 46
      Top = 192
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period8'
    end
    object Period9: TLabel
      Left = 46
      Top = 216
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period9'
    end
    object Period10: TLabel
      Left = 40
      Top = 240
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period10'
    end
    object Period11: TLabel
      Left = 40
      Top = 264
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period11'
    end
    object Period12: TLabel
      Left = 40
      Top = 288
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period12'
    end
    object Period13: TLabel
      Left = 40
      Top = 312
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Period13'
    end
    object Edit1: TEdit
      Left = 86
      Top = 20
      Width = 89
      Height = 21
      TabOrder = 0
      OnExit = Edit1Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 190
      Top = 20
      Width = 89
      Height = 21
      TabOrder = 1
      OnExit = Edit2Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit3: TEdit
      Left = 86
      Top = 44
      Width = 89
      Height = 21
      TabOrder = 2
      OnExit = Edit3Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit4: TEdit
      Left = 190
      Top = 44
      Width = 89
      Height = 21
      TabOrder = 3
      OnExit = Edit4Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit5: TEdit
      Left = 86
      Top = 68
      Width = 89
      Height = 21
      TabOrder = 4
      OnExit = Edit5Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit6: TEdit
      Left = 190
      Top = 68
      Width = 89
      Height = 21
      TabOrder = 5
      OnExit = Edit6Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit7: TEdit
      Left = 86
      Top = 92
      Width = 89
      Height = 21
      TabOrder = 6
      OnExit = Edit7Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit8: TEdit
      Left = 190
      Top = 92
      Width = 89
      Height = 21
      TabOrder = 7
      OnExit = Edit8Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit9: TEdit
      Left = 86
      Top = 116
      Width = 89
      Height = 21
      TabOrder = 8
      OnExit = Edit9Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit10: TEdit
      Left = 190
      Top = 116
      Width = 89
      Height = 21
      TabOrder = 9
      OnExit = Edit10Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit11: TEdit
      Left = 86
      Top = 140
      Width = 89
      Height = 21
      TabOrder = 10
      OnExit = Edit11Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit12: TEdit
      Left = 190
      Top = 140
      Width = 89
      Height = 21
      TabOrder = 11
      OnExit = Edit12Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit13: TEdit
      Left = 86
      Top = 164
      Width = 89
      Height = 21
      TabOrder = 12
      OnExit = Edit13Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit14: TEdit
      Left = 190
      Top = 164
      Width = 89
      Height = 21
      TabOrder = 13
      OnExit = Edit14Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit15: TEdit
      Left = 86
      Top = 188
      Width = 89
      Height = 21
      TabOrder = 14
      OnExit = Edit15Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit16: TEdit
      Left = 190
      Top = 188
      Width = 89
      Height = 21
      TabOrder = 15
      OnExit = Edit16Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit17: TEdit
      Left = 86
      Top = 212
      Width = 89
      Height = 21
      TabOrder = 16
      OnExit = Edit17Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit18: TEdit
      Left = 190
      Top = 212
      Width = 89
      Height = 21
      TabOrder = 17
      OnExit = Edit18Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit19: TEdit
      Left = 86
      Top = 236
      Width = 89
      Height = 21
      TabOrder = 18
      OnExit = Edit19Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit20: TEdit
      Left = 190
      Top = 236
      Width = 89
      Height = 21
      TabOrder = 19
      OnExit = Edit20Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit21: TEdit
      Left = 86
      Top = 260
      Width = 89
      Height = 21
      TabOrder = 20
      OnExit = Edit21Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit22: TEdit
      Left = 190
      Top = 260
      Width = 89
      Height = 21
      TabOrder = 21
      OnExit = Edit22Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit23: TEdit
      Left = 86
      Top = 284
      Width = 89
      Height = 21
      TabOrder = 22
      OnExit = Edit23Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit24: TEdit
      Left = 190
      Top = 284
      Width = 89
      Height = 21
      TabOrder = 23
      OnExit = Edit24Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit25: TEdit
      Left = 86
      Top = 308
      Width = 89
      Height = 21
      TabOrder = 24
      OnExit = Edit25Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
    object Edit26: TEdit
      Left = 190
      Top = 308
      Width = 89
      Height = 21
      TabOrder = 25
      OnExit = Edit26Exit
      OnKeyDown = FormKeyDown
      OnKeyPress = Edit1KeyPress
    end
  end
end
