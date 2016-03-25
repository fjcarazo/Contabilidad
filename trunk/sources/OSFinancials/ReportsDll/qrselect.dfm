object frmReportsPrint: TfrmReportsPrint
  Left = 266
  Top = 142
  BorderStyle = bsDialog
  Caption = 'Select the printer'
  ClientHeight = 231
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 190
    Width = 416
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Btncancel: TBitBtn
      Left = 313
      Top = 6
      Width = 95
      Height = 25
      TabOrder = 0
      Kind = bkCancel
    end
    object btnOk: TBitBtn
      Left = 213
      Top = 6
      Width = 95
      Height = 25
      TabOrder = 1
      OnClick = btnOkClick
      Kind = bkOK
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 6
    Width = 406
    Height = 91
    Caption = 'Printer'
    TabOrder = 1
    object Label5: TLabel
      Left = 14
      Top = 18
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = '&Name'
      FocusControl = cbPrinters
    end
    object Label1: TLabel
      Left = 10
      Top = 70
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object cbPrinters: TComboBox
      Left = 48
      Top = 15
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbPrintersChange
    end
    object Button1: TButton
      Left = 294
      Top = 12
      Width = 107
      Height = 25
      Caption = '&Properties'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 295
      Top = 44
      Width = 106
      Height = 25
      Caption = 'P&age Setup'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 99
    Width = 229
    Height = 88
    Caption = 'Print Range'
    TabOrder = 2
    object Label2: TLabel
      Left = 75
      Top = 61
      Width = 23
      Height = 13
      BiDiMode = bdRightToLeft
      Caption = '&from:'
      FocusControl = FromEdt
      ParentBiDiMode = False
    end
    object Label3: TLabel
      Left = 161
      Top = 61
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = '&to:'
      FocusControl = ToEdt
    end
    object AllPagesRb: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = '&All pages'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = AllPagesRbClick
    end
    object RangeRb: TRadioButton
      Left = 8
      Top = 61
      Width = 59
      Height = 17
      Caption = 'Pages'
      TabOrder = 1
      OnClick = AllPagesRbClick
    end
    object FromEdt: TEdit
      Left = 106
      Top = 59
      Width = 33
      Height = 21
      Enabled = False
      TabOrder = 2
      OnChange = FromEdtChange
    end
    object ToEdt: TEdit
      Left = 180
      Top = 59
      Width = 33
      Height = 21
      Enabled = False
      TabOrder = 3
      OnChange = FromEdtChange
    end
    object rbCurrent: TRadioButton
      Left = 8
      Top = 38
      Width = 113
      Height = 17
      Caption = 'Current'
      TabOrder = 4
      OnClick = rbCurrentClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 236
    Top = 99
    Width = 173
    Height = 87
    Caption = 'Copies'
    TabOrder = 3
    object Label4: TLabel
      Left = 22
      Top = 24
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Number of &copies:'
      FocusControl = CopiesSe
    end
    object CopiesSe: TSpinEdit
      Left = 116
      Top = 21
      Width = 49
      Height = 22
      MaxValue = 99
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
  end
end
