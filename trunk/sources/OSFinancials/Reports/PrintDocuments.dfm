object fmPrintDocs: TfmPrintDocs
  Left = 179
  Top = 80
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Print Documents'
  ClientHeight = 503
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgInvoiceList: TwwDBGrid
    Left = 0
    Top = 0
    Width = 408
    Height = 430
    ControlInfoInDataset = False
    Selected.Strings = (
      'SDocNo'#9'10'#9'Invoice Number'#9'T'
      'DDate'#9'10'#9'Date'#9'T'
      'SACCOUNTCODE'#9'10'#9'Account'#9'F'
      'SDescription'#9'25'#9'Debtor'#9'T')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Ctl3D = False
    DataSource = dmDatabase.dsDocHead
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
    ParentCtl3D = False
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
    UseTFields = False
    OnCalcCellColors = dbgInvoiceListCalcCellColors
    OnTitleButtonClick = dbgInvoiceListTitleButtonClick
    OnDblClick = dbgInvoiceListDblClick
    OnEnter = dbgInvoiceListEnter
    DragVertOffset = 0
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 430
    Width = 597
    Height = 73
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object lbSearchBy: TLabel
      Left = 6
      Top = 4
      Width = 127
      Height = 13
      Caption = 'Search By Invoice Number'
    end
    object Label4: TLabel
      Left = 236
      Top = 2
      Width = 48
      Height = 13
      Alignment = taCenter
      Caption = 'Type Print'
    end
    object StBar: TStatusBar
      Left = 0
      Top = 54
      Width = 597
      Height = 19
      Panels = <
        item
          Width = 100
        end
        item
          Width = 50
        end
        item
          Width = 50
        end>
    end
    object btSearch: TButton
      Left = 134
      Top = 19
      Width = 91
      Height = 25
      Caption = 'Search...'
      TabOrder = 4
      TabStop = False
      OnClick = btSearchClick
    end
    object ed: TEdit
      Left = 7
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 3
      OnChange = edChange
    end
    object edDate: TwwDBDateTimePicker
      Left = 7
      Top = 22
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      MaxDate = 219148.000000000000000000
      MinDate = 2.000000000000000000
      ShowButton = True
      TabOrder = 2
      OnChange = edDateChange
    end
    object BtnOk: TBitBtn
      Left = 388
      Top = 20
      Width = 95
      Height = 25
      Caption = '&Print'
      TabOrder = 0
      OnClick = btnOKClick
      OnKeyPress = FormKeyPress
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000004141
        4100524E4D0053504E0052525200595554005F5A59005D5D5D0065605F006363
        6300696665006E6866006C6C6C00776D6700767373007777770082777300807E
        7D004573870042778E0073AAB50078AFB50079B1B7007BB2B8007DB3B9007EB5
        BB007FB5BC0064C2CF0068C5CF0075CCD50078CED60079CFD8004FC2EB0051C3
        EB0052C4EB0052C5ED0054C5ED005BC6ED005FC8EE005AC8F00077F1F6007FF5
        F600878787008F8D8B00998F8B009E928E009D948F0093919000989594009D9A
        99009D9D9D00A1959100A3989400A59A9600A19E9E00A89D9900A1A29400A5A3
        A200A9A7A700A7A2AB00A9A9A900AEAAAA00B5A9A600B2AFAF00B3B0AF00BCB3
        AF00B5B2B100B7B5B400B9B6B600BCB6B500C4B6B200C0BCBC0086C180002312
        A50082CFD50084CFD7008FCED50090CED50085D1D80093D0D80084CDEF0080F2
        F60089F5F60090F6F6009CF4F600A5F6F600C4C2C200C8C5C400CECCCC00D0CE
        CC00D7CFCE00D7D5D500E0D5D100EAE5E200ECE7E500F4F2F100F6F6F5000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF121212
        12121212121212FFFFFFFFFFFF12544F4D4D4D4C4C5512FFFFFFFFFFFF12524E
        4B4B4B4B4B5212FFFFFFFF343312281F1E1D1D1D1D29123334FF2E4610121B1C
        1C1C1C1C1C1C130D462E2E5C412C2C2C2C2C2C2C2C2C2C3E5C2E335D5D5D5D5D
        5D5D5D5D5D5D5D5D5D33345F5F57444444444344433F475F5F34345F5B0B0403
        03030302020308585F37375F5908010101010101010105565F373759440E0401
        010101010101053B493C34463E373A312A0E0B0807070A38483CFF33332E3C3B
        3B3B312E2E2B113334FFFFFFFF12191919191915151512FFFFFFFFFFFF125252
        52525252522912FFFFFFFFFFFF12121212121212121212FFFFFF}
    end
    object BtnCancel: TBitBtn
      Left = 488
      Top = 20
      Width = 95
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyPress = FormKeyPress
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
    object ChkService: TComboBox
      Left = 235
      Top = 22
      Width = 109
      Height = 21
      ItemHeight = 13
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 408
    Top = 0
    Width = 189
    Height = 430
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 8
      Top = 2
      Width = 169
      Height = 103
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 82
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Document Type'
      end
      object CbDocTypeNew: TComboBox
        Left = 11
        Top = 28
        Width = 150
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CbDocTypeNewChange
      end
      object cbUnPrinted: TCheckBox
        Left = 12
        Top = 56
        Width = 149
        Height = 17
        Caption = 'UnPrinted'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbUnPrintedClick
      end
      object cbUnposted: TCheckBox
        Left = 12
        Top = 78
        Width = 149
        Height = 17
        Caption = 'UnPosted'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbUnPrintedClick
      end
    end
    object Panel3: TPanel
      Left = 8
      Top = 106
      Width = 169
      Height = 130
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 41
        Width = 61
        Height = 13
        Caption = 'From Invoice'
      end
      object Label2: TLabel
        Left = 12
        Top = 86
        Width = 51
        Height = 13
        Caption = 'To Invoice'
      end
      object RbRange: TRadioButton
        Left = 12
        Top = 2
        Width = 141
        Height = 17
        Caption = 'From ... To'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RbRangeClick
      end
      object RbSelect: TRadioButton
        Left = 12
        Top = 22
        Width = 141
        Height = 17
        Caption = 'Selected'
        TabOrder = 1
        OnClick = RbSelectClick
      end
      object cboxFromInvoice: TwwDBLookupCombo
        Left = 12
        Top = 59
        Width = 149
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        LookupTable = dmDatabase.qryDocHead
        LookupField = 'SDocNo'
        DropDownWidth = 99
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnKeyPress = cboxFromInvoiceKeyPress
      end
      object cboxToInvoice: TwwDBLookupCombo
        Left = 12
        Top = 102
        Width = 149
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        LookupTable = dmDatabase.qryDocHead
        LookupField = 'SDocNo'
        DropDownWidth = 99
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnKeyPress = cboxFromInvoiceKeyPress
      end
    end
    object Panel4: TPanel
      Left = 8
      Top = 248
      Width = 169
      Height = 183
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      DesignSize = (
        169
        183)
      object DestLbl: TLabel
        Left = 84
        Top = 67
        Width = 74
        Height = 13
        Caption = 'Send report To:'
        FocusControl = cbDestination
      end
      object lblCopies: TLabel
        Left = 12
        Top = 120
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Copies :'
        Enabled = False
        FocusControl = edtCount
      end
      object Label20: TLabel
        Left = 111
        Top = 26
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
        Caption = 'Layout file'
        Color = clBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object cbDestination: TComboBox
        Left = 14
        Top = 87
        Width = 147
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbDestinationChange
        OnKeyPress = cbDestinationKeyPress
        Items.Strings = (
          'Screen'
          'Printer'
          'File'
          'E-mail')
      end
      object edtCount: TEdit
        Left = 52
        Top = 118
        Width = 37
        Height = 21
        Enabled = False
        TabOrder = 1
        Text = '1'
        OnChange = edtCountChange
        OnKeyPress = cbDestinationKeyPress
      end
      object UpDown1: TUpDown
        Left = 88
        Top = 116
        Width = 16
        Height = 24
        Enabled = False
        Min = 1
        Max = 32767
        Position = 1
        TabOrder = 2
        OnClick = UpDown1Click
      end
      object Bitprn1: TBitBtn
        Left = 14
        Top = 146
        Width = 147
        Height = 25
        Caption = '&Printer Setup'
        TabOrder = 3
        TabStop = False
        OnClick = Bitprn1Click
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000010000000000004141
          4100524E4D0053504E0052525200595554005F5A59005D5D5D0065605F006363
          6300696665006E6866006C6C6C00776D6700767373007777770082777300807E
          7D004573870042778E0073AAB50078AFB50079B1B7007BB2B8007DB3B9007EB5
          BB007FB5BC0064C2CF0068C5CF0075CCD50078CED60079CFD8004FC2EB0051C3
          EB0052C4EB0052C5ED0054C5ED005BC6ED005FC8EE005AC8F00077F1F6007FF5
          F600878787008F8D8B00998F8B009E928E009D948F0093919000989594009D9A
          99009D9D9D00A1959100A3989400A59A9600A19E9E00A89D9900A1A29400A5A3
          A200A9A7A700A7A2AB00A9A9A900AEAAAA00B5A9A600B2AFAF00B3B0AF00BCB3
          AF00B5B2B100B7B5B400B9B6B600BCB6B500C4B6B200C0BCBC0086C180002312
          A50082CFD50084CFD7008FCED50090CED50085D1D80093D0D80084CDEF0080F2
          F60089F5F60090F6F6009CF4F600A5F6F600C4C2C200C8C5C400CECCCC00D0CE
          CC00D7CFCE00D7D5D500E0D5D100EAE5E200ECE7E500F4F2F100F6F6F5000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00FFFFFF121212
          12121212121212FFFFFFFFFFFF12544F4D4D4D4C4C5512FFFFFFFFFFFF12524E
          4B4B4B4B4B5212FFFFFFFF343312281F1E1D1D1D1D29123334FF2E4610121B1C
          1C1C1C1C1C1C130D462E2E5C412C2C2C2C2C2C2C2C2C2C3E5C2E335D5D5D5D5D
          5D5D5D5D5D5D5D5D5D33345F5F57444444444344433F475F5F34345F5B0B0403
          03030302020308585F37375F5908010101010101010105565F373759440E0401
          010101010101053B493C34463E373A312A0E0B0807070A38483CFF33332E3C3B
          3B3B312E2E2B113334FFFFFFFF12191919191915151512FFFFFFFFFFFF125252
          52525252522912FFFFFFFFFFFF12121212121212121212FFFFFF}
      end
      object CBDocLayout: TComboBox
        Left = 14
        Top = 42
        Width = 145
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akBottom]
        ItemHeight = 13
        TabOrder = 4
      end
    end
  end
  object PnlPrg: TPanel
    Left = 40
    Top = 164
    Width = 283
    Height = 51
    BevelInner = bvRaised
    TabOrder = 3
    Visible = False
    object lblCount: TLabel
      Left = 10
      Top = 32
      Width = 266
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object prgBar: TProgressBar
      Left = 8
      Top = 8
      Width = 270
      Height = 16
      TabOrder = 0
    end
  end
end
