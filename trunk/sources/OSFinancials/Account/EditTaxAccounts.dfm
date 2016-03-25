object fmEditTaxAccount: TfmEditTaxAccount
  Left = 85
  Top = 152
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Tax Accounts'
  ClientHeight = 304
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 188
    Top = 12
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = 'Account number'
  end
  object Label2: TLabel
    Left = 204
    Top = 54
    Width = 62
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sub Account'
  end
  object Label3: TLabel
    Left = 213
    Top = 78
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Description'
  end
  object Label4: TLabel
    Left = 179
    Top = 102
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = 'Reporting Group 1'
  end
  object Label5: TLabel
    Left = 179
    Top = 126
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = 'Reporting Group 2'
  end
  object DescLabel: TLabel
    Left = 276
    Top = 32
    Width = 193
    Height = 13
    AutoSize = False
  end
  object Label6: TLabel
    Left = 220
    Top = 151
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valid from'
  end
  object Label7: TLabel
    Left = 388
    Top = 151
    Width = 9
    Height = 13
    Alignment = taRightJustify
    Caption = 'to'
  end
  object Label8: TLabel
    Left = 211
    Top = 174
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Percentage'
  end
  object Label11: TLabel
    Left = 209
    Top = 199
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Use link tax'
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 270
    Width = 532
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnOk: TBitBtn
      Left = 323
      Top = 6
      Width = 96
      Height = 25
      Caption = 'OK'
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
      Left = 424
      Top = 6
      Width = 96
      Height = 25
      Caption = 'Cancel'
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
  end
  object edtMainAccount: TEdit
    Left = 276
    Top = 8
    Width = 69
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 2
    OnExit = edtMainAccountExit
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object edtSubAccount: TEdit
    Left = 276
    Top = 50
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 3
    OnExit = edtSubAccountExit
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object edtDescription: TEdit
    Left = 276
    Top = 74
    Width = 153
    Height = 21
    MaxLength = 35
    TabOrder = 4
    OnEnter = edtDescriptionEnter
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object dtFrom: TDateTimePicker
    Left = 276
    Top = 146
    Width = 101
    Height = 21
    Date = 0.680845254632004000
    Time = 0.680845254632004000
    TabOrder = 7
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object dtTo: TDateTimePicker
    Left = 404
    Top = 146
    Width = 93
    Height = 21
    Date = 0.681144675923861000
    Time = 0.681144675923861000
    TabOrder = 8
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object edtPercent: TEdit
    Left = 276
    Top = 170
    Width = 49
    Height = 21
    MaxLength = 6
    TabOrder = 9
    OnExit = edtPercentExit
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object CbxRepGroup1: TwwDBComboBox
    Left = 276
    Top = 98
    Width = 155
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
    TabOrder = 5
    UnboundDataType = wwDefault
    OnDropDown = CbxRepGroup1DropDown
    OnCloseUp = CbxRepGroup1CloseUp
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object CbxRepGroup2: TwwDBComboBox
    Left = 276
    Top = 122
    Width = 155
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
    TabOrder = 6
    UnboundDataType = wwDefault
    OnDropDown = CbxRepGroup1DropDown
    OnCloseUp = CbxRepGroup1CloseUp
    OnKeyDown = FormKeyDown
    OnKeyPress = edtMainAccountKeyPress
  end
  object fcMenu: TfcOutlookBar
    Left = 4
    Top = 2
    Width = 117
    Height = 191
    ActivePage = fcDelete
    Animation.Enabled = True
    Animation.Interval = 1
    Animation.Steps = 7
    AutoBold = False
    BevelOuter = bvNone
    BorderStyle = bsSingle
    ButtonSize = 20
    ButtonClassName = 'TfcShapeBtn'
    Layout = loVertical
    Options = [cboAutoCreateOutlookList]
    PanelAlignment = paDynamic
    ShowButtons = True
    TabOrder = 0
    TabStop = False
    OnKeyDown = FormKeyDown
    object fcNew: TfcShapeBtn
      Left = 0
      Top = 0
      Width = 113
      Height = 20
      Caption = 'New'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 0
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
    end
    object fcSearch: TfcShapeBtn
      Left = 0
      Top = 20
      Width = 113
      Height = 20
      Caption = 'Search'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 1
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcSearchClick
    end
    object fcDelete: TfcShapeBtn
      Left = 0
      Top = 40
      Width = 113
      Height = 20
      Caption = 'Delete'
      Color = clBtnFace
      DitherColor = clWhite
      Down = True
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 2
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcDeleteClick
    end
    object fcSave1: TfcShapeBtn
      Left = 0
      Top = 167
      Width = 113
      Height = 20
      Caption = 'Save'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 6
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcSave1Click
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 113
      Height = 0
      object fcSubNew: TfcOutlookList
        Left = 0
        Top = 0
        Width = 113
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clSilver
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <
          item
            ImageIndex = 0
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Account'
            OnClick = fcSubNewItems0Click
          end
          item
            ImageIndex = 0
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Sub Account'
            OnClick = fcSubNewItems1Click
          end>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 113
      Height = 0
      object fcOutlookBar1OutlookList2: TfcOutlookList
        Left = 0
        Top = 0
        Width = 113
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 60
      Width = 113
      Height = 107
      object fcOutlookBar1OutlookList3: TfcOutlookList
        Left = 0
        Top = 0
        Width = 113
        Height = 107
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
    object TfcOutlookPanel
      Left = 0
      Top = 0
      Width = 113
      Height = 0
      object fcOutlookBar1OutlookList4: TfcOutlookList
        Left = 0
        Top = 0
        Width = 113
        Height = 0
        Align = alClient
        BorderStyle = bsNone
        ClickStyle = csClick
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HotTrackStyle = hsIconHilite
        ItemHighlightColor = clBtnFace
        ItemHotTrackColor = clBtnShadow
        ItemLayout = blGlyphTop
        ItemShadowColor = clBtnText
        ItemSelectedDitherColor = clBtnHighlight
        Items = <>
        ItemSpacing = 20
        ItemsWidth = 0
        Layout = loVertical
        ScrollButtonsVisible = True
        ScrollInterval = 250
        Transparent = False
      end
    end
  end
  object CBUseTaxLink: TCheckBox
    Left = 278
    Top = 197
    Width = 17
    Height = 17
    TabOrder = 10
    OnClick = CBUseTaxLinkClick
  end
  object PLinkTaxes: TPanel
    Left = 0
    Top = 219
    Width = 521
    Height = 43
    BevelOuter = bvNone
    TabOrder = 11
    Visible = False
    object Label10: TLabel
      Left = 228
      Top = 4
      Width = 37
      Height = 13
      Caption = 'Link tax'
    end
    object Label9: TLabel
      Left = 220
      Top = 25
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contra tax'
    end
    object cbbLinkTaxId: TComboBox
      Left = 278
      Top = 0
      Width = 243
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object CBContraTax: TCheckBox
      Left = 278
      Top = 24
      Width = 17
      Height = 17
      TabOrder = 1
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 408
    Top = 32
  end
end
