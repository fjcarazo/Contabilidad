object fmEditGLAccount: TfmEditGLAccount
  Left = 119
  Top = 89
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Edit GL Account'
  ClientHeight = 256
  ClientWidth = 435
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
    Left = 163
    Top = 11
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = 'Account number'
  end
  object Label2: TLabel
    Left = 179
    Top = 56
    Width = 62
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sub Account'
  end
  object Label3: TLabel
    Left = 188
    Top = 84
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Description'
  end
  object Label4: TLabel
    Left = 154
    Top = 113
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = 'Reporting Group 1'
  end
  object Label5: TLabel
    Left = 154
    Top = 143
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = 'Reporting Group 2'
  end
  object DescLabel: TLabel
    Left = 248
    Top = 32
    Width = 183
    Height = 13
    AutoSize = False
  end
  object LcbIncExp: TLabel
    Left = 154
    Top = 165
    Width = 87
    Height = 13
    Alignment = taRightJustify
    Caption = 'Income / Expense'
  end
  object Label6: TLabel
    Left = 203
    Top = 182
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'Inactive'
  end
  object Label7: TLabel
    Left = 196
    Top = 199
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'Openitem'
  end
  object edtMainAccount: TEdit
    Left = 248
    Top = 6
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 6
    TabOrder = 1
    OnExit = edtMainAccountExit
    OnKeyDown = FormKeyDown
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object edtSubAccount: TEdit
    Left = 248
    Top = 51
    Width = 49
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 2
    OnExit = edtSubAccountExit
    OnKeyDown = FormKeyDown
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 223
    Width = 435
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object btnOk: TBitBtn
      Left = 232
      Top = 4
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
      Left = 336
      Top = 4
      Width = 96
      Height = 25
      Caption = '&Close'
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
  object edtDescription: TEdit
    Left = 248
    Top = 79
    Width = 153
    Height = 21
    MaxLength = 35
    TabOrder = 3
    OnEnter = edtDescriptionEnter
    OnKeyDown = FormKeyDown
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object cbIncExp: TCheckBox
    Left = 250
    Top = 163
    Width = 14
    Height = 17
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 6
    OnKeyDown = FormKeyDown
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object CbxRepGroup1: TwwDBComboBox
    Left = 248
    Top = 108
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
    TabOrder = 4
    UnboundDataType = wwDefault
    OnDropDown = CbxRepGroup1DropDown
    OnCloseUp = CbxRepGroup1CloseUp
    OnKeyDown = FormKeyDown
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object CbxRepGroup2: TwwDBComboBox
    Left = 248
    Top = 138
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
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object fcMenu: TfcOutlookBar
    Left = 4
    Top = 2
    Width = 117
    Height = 185
    ActivePage = fcSearch
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
    object fcNew: TfcShapeBtn
      Left = 0
      Top = 0
      Width = 113
      Height = 20
      Caption = 'New'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      ParentClipping = True
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
      Down = True
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = True
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 1
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcSearchClick
    end
    object fcDelete: TfcShapeBtn
      Left = 0
      Top = 141
      Width = 113
      Height = 20
      Caption = 'Delete'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = True
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 2
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcDeleteClick
    end
    object fcMenu1: TfcShapeBtn
      Left = 0
      Top = 161
      Width = 113
      Height = 20
      Caption = 'Save'
      Color = clBtnFace
      DitherColor = clWhite
      GroupIndex = 1
      NumGlyphs = 0
      ParentClipping = True
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 6
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = fcMenu1Click
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
            Action = Action1
            ImageIndex = 0
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Account'
          end
          item
            Action = Action2
            ImageIndex = 0
            Selected = False
            Separation = 10
            Tag = 0
            Text = 'Sub-account'
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
      Top = 40
      Width = 113
      Height = 101
      object fcOutlookBar1OutlookList2: TfcOutlookList
        Left = 0
        Top = 0
        Width = 113
        Height = 101
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
      object fcOutlookBar1OutlookList3: TfcOutlookList
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
  object CBInActive: TCheckBox
    Left = 250
    Top = 180
    Width = 14
    Height = 17
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 8
    OnKeyDown = FormKeyDown
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object CBOpenitem: TCheckBox
    Left = 250
    Top = 197
    Width = 14
    Height = 17
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 9
    OnKeyDown = FormKeyDown
    OnKeyPress = dbedtDescriptionKeyPress
  end
  object ActionList1: TActionList
    Left = 392
    object Action1: TAction
      Caption = 'Account'
      ShortCut = 113
      OnExecute = Action1Execute
    end
    object Action2: TAction
      Caption = 'Sub-account'
      ShortCut = 114
      OnExecute = Action2Execute
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 384
    Top = 40
  end
end
