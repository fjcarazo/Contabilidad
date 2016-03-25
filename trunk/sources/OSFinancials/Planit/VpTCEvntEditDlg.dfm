object DlgEventTCEdit: TDlgEventTCEdit
  Left = 281
  Top = 231
  Caption = 'Add / Edit Events'
  ClientHeight = 506
  ClientWidth = 697
  Color = clBtnFace
  Constraints.MinHeight = 378
  Constraints.MinWidth = 594
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 465
    Width = 697
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      697
      41)
    object ResourceNameLbl: TLabel
      Left = 8
      Top = 12
      Width = 385
      Height = 16
      AutoSize = False
      Caption = 'Resource Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OKBtn: TButton
      Left = 526
      Top = 8
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&OK'
      Default = True
      TabOrder = 0
      TabStop = False
      OnClick = OKBtnClick
    end
    object CancelBtn: TButton
      Left = 614
      Top = 8
      Width = 85
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancel'
      TabOrder = 1
      TabStop = False
      OnClick = CancelBtnClick
    end
  end
  object pgEvent: TPageControl
    Left = 0
    Top = 0
    Width = 697
    Height = 465
    ActivePage = tabEvent
    Align = alClient
    TabOrder = 1
    TabStop = False
    OnChange = pgEventChange
    object tabEvent: TTabSheet
      Caption = 'Event'
      DesignSize = (
        689
        437)
      object AppointmentGroupBox: TGroupBox
        Left = 0
        Top = 5
        Width = 692
        Height = 268
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Appointment'
        TabOrder = 0
        DesignSize = (
          692
          268)
        object DescriptionLbl: TLabel
          Left = 5
          Top = 25
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Description:'
        end
        object Bevel1: TBevel
          Left = 8
          Top = 124
          Width = 676
          Height = 2
          Anchors = [akLeft, akTop, akRight]
        end
        object Bevel2: TBevel
          Left = 8
          Top = 208
          Width = 676
          Height = 2
          Anchors = [akLeft, akTop, akRight]
        end
        object CategoryLbl: TLabel
          Left = 5
          Top = 49
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Category:'
        end
        object StartTimeLbl: TLabel
          Left = 47
          Top = 154
          Width = 59
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'StartTime:'
        end
        object EndTimeLbl: TLabel
          Left = 48
          Top = 178
          Width = 57
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'EndTime:'
        end
        object Image2: TImage
          Left = 352
          Top = 130
          Width = 18
          Height = 18
          Picture.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000001000
            0000100000000100040000000000800000000000000000000000100000001000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00888888888888888888888222228888888882222222228888282228888822
            2888222288888882228822288888888822882222888888888228222228888888
            8228888888888888888888888888888888882288888888222228822888888882
            2228822288888888222888222888882222288882222222228828888882222288
            8888}
          Transparent = True
        end
        object RecurringLbl: TLabel
          Left = 379
          Top = 135
          Width = 187
          Height = 13
          AutoSize = False
          Caption = 'Appointment Recurrence:'
        end
        object Bevel3: TBevel
          Left = 339
          Top = 134
          Width = 2
          Height = 76
        end
        object IntervalLbl: TLabel
          Left = 589
          Top = 135
          Width = 92
          Height = 13
          AutoSize = False
          Caption = 'Interval (days):'
        end
        object Image1: TImage
          Left = 11
          Top = 222
          Width = 23
          Height = 25
          Picture.Data = {
            07544269746D61707E010000424D7E0100000000000076000000280000001600
            0000160000000100040000000000080100000000000000000000100000001000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00878888888888888888887800887888888888888888878800888788888877
            8888887888008888888880000888888888008888880008888000888888008888
            708FF8F8F8880088880088887FFFFF8878787088880088888787F88887770888
            880088888878FF8878708888880088888877F88887708888880087778878FF88
            78708877780088888877F88887708888880088888878FF887870888888008888
            8877F888877088888800888888878F887808888888008888888878F880888888
            8800888887888788088878888800888878888877888887888800888788888870
            8888887888008878888888888888888788008888888888888888888888007888
            88888888888888888700}
          Transparent = True
        end
        object SpeedButton1: TSpeedButton
          Left = 325
          Top = 223
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888000888888888888080808888088888080880888088888080888808
            0888880880888808888800888008880888880888808088080000088880808808
            8888008880088808888888088088880808888880808888088088888808088088
            8808888880808088888888888800088888888888888888888888}
          OnClick = SpeedButton1Click
        end
        object imgClock: TImage
          Left = 8
          Top = 140
          Width = 48
          Height = 48
          Picture.Data = {
            07544269746D6170060E0000424D060E00000000000036000000280000002200
            0000220000000100180000000000D00D00000000000000000000000000000000
            0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400000000000000
            0000000000000000000000000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000000000000000
            00C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000000000000000
            0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0000000000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
            0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080808080808080808080
            808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4808080C0C0C0C0C0C0C0C0C0C0C0C080808080808080808080808080
            8080808080808080808080808080808080808080808080C0C0C0FFFFFFC0C0C0
            C0C0C0000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0C0C0C08080800000000000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808080808080
            8080808080FFFFFFC0C0C0C0C0C0000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            0000C8D0D4C8D0D4C8D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0808080808080
            000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF808080808080808080FFFFFFC0C0C0C0C0C0000000C8D0D4C8
            D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4808080C0C0C0C0C0C0C0C0C080
            8080808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080808080C0C0C0C0C0
            C0C0C0C0000000C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4808080C0C0
            C0C0C0C0808080808080000000FFFFFFFFFFFF000000000000FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF808080
            808080808080C0C0C0C0C0C0000000C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
            808080C0C0C0C0C0C0808080808080000000FFFFFFFFFFFFFFFFFFC0C0C00000
            00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FF
            FFFFFFFFFFFFFFFF808080808080808080C0C0C0C0C0C0000000C8D0D4C8D0D4
            0000C8D0D4C8D0D4808080C0C0C0C0C0C0808080000000FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C0C0C0C000
            0000C8D0D4C8D0D40000C8D0D4C8D0D4808080C0C0C0808080808080000000FF
            FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF8080808080
            80808080C0C0C0000000C8D0D4C8D0D40000C8D0D4808080C0C0C0C0C0C08080
            80000000FFFFFFFFFFFFC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
            FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF
            FFFFFFFFFFFF808080808080C0C0C0C0C0C0000000C8D0D40000C8D0D4808080
            C0C0C0C0C0C0808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C0C0C0C0000000C8D0D4
            0000C8D0D4808080C0C0C0C0C0C0808080000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C0C0
            C0C0000000C8D0D40000C8D0D4808080C0C0C0C0C0C0808080000000FFFFFF00
            0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
            000000000000000000000000000000FFFFFFFFFFFF000000000000FFFFFF8080
            80808080C0C0C0C0C0C0000000C8D0D40000C8D0D4808080C0C0C0C0C0C08080
            80000000FFFFFFC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0
            000000FFFFFF808080808080C0C0C0C0C0C0000000C8D0D40000C8D0D4808080
            C0C0C0C0C0C0808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C0C0C0C0000000C8D0D4
            0000C8D0D4808080C0C0C0C0C0C0808080000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C0C0
            C0C0000000C8D0D40000C8D0D4808080C0C0C0C0C0C0808080000000FFFFFFFF
            FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF8080
            80808080C0C0C0C0C0C0000000C8D0D40000C8D0D4C8D0D4808080C0C0C08080
            80808080000000FFFFFFC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF
            FFFFFF808080808080808080C0C0C0000000C8D0D4C8D0D40000C8D0D4C8D0D4
            808080C0C0C0C0C0C0808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF808080808080C0C0C0C0C0C0000000C8D0D4C8D0D4
            0000C8D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0808080000000FFFFFFFFFFFF
            FFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF000000000000FFFFFFFFFFFFFFFFFF808080808080C0C0C0C0C0C0C0C0C000
            0000C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4808080C0C0C0C0C0C080808080
            8080000000FFFFFFFFFFFFC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFFFFFFFF808080808080808080C0C0
            C0C0C0C0000000C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4808080C0C0
            C0C0C0C0FFFFFF808080808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080
            808080C0C0C0C0C0C0C0C0C0000000C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
            C8D0D4C8D0D4808080C0C0C0C0C0C0FFFFFF808080808080000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
            8080808080808080C0C0C0C0C0C0C0C0C0000000C8D0D4C8D0D4C8D0D4C8D0D4
            0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C0C0C0C0C0C0FFFFFF808080
            808080000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF808080808080808080808080C0C0C0C0C0C0C0C0C0808080C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080C0
            C0C0C0C0C0FFFFFFC0C0C0808080808080000000000000000000000000000000
            000000000000000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0808080C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080
            8080808080808080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080808080C0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0C0808080808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
            C0808080808080808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080808080808080808080808080
            808080808080808080C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000}
          Stretch = True
          Transparent = True
        end
        object RecurrenceEndsLbl: TLabel
          Left = 352
          Top = 179
          Width = 92
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Until:'
        end
        object LSaveAndReopen: TLabel
          Left = 448
          Top = 92
          Width = 225
          Height = 29
          AutoSize = False
          Caption = 'LSaveAndReopen'
          WordWrap = True
        end
        object LEAccount: TLabel
          Left = 4
          Top = 71
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Debtor:'
          Visible = False
        end
        object Label2: TLabel
          Left = 4
          Top = 95
          Width = 77
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Salesmen:'
        end
        object Label3: TLabel
          Left = 268
          Top = 96
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Processno:'
        end
        object LProject: TLabel
          Left = 328
          Top = 48
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Project'
        end
        object Location: TLabel
          Left = 320
          Top = 72
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Location'
        end
        object Lproduct: TLabel
          Left = 416
          Top = 228
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Product'
        end
        object DescriptionEdit: TEdit
          Left = 86
          Top = 21
          Width = 597
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'DescriptionEdit'
        end
        object AlarmSet: TCheckBox
          Left = 40
          Top = 226
          Width = 89
          Height = 17
          Caption = '&Reminder:'
          TabOrder = 11
          OnClick = AlarmSetClick
        end
        object StartTime: TComboBox
          Left = 231
          Top = 151
          Width = 93
          Height = 21
          TabOrder = 4
          OnChange = StartTimeChange
          OnDropDown = StartTimeDropDown
          OnExit = StartTimeExit
        end
        object EndTime: TComboBox
          Left = 231
          Top = 175
          Width = 93
          Height = 21
          TabOrder = 6
          OnChange = EndTimeChange
          OnDropDown = EndTimeDropDown
          OnExit = EndTimeExit
        end
        object Category: TComboBox
          Left = 87
          Top = 46
          Width = 182
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          TabOrder = 1
          OnChange = CategoryChange
          OnDrawItem = CategoryDrawItem
        end
        object RecurringType: TComboBox
          Left = 379
          Top = 151
          Width = 183
          Height = 21
          Style = csDropDownList
          TabOrder = 7
          OnChange = RecurringTypeChange
        end
        object IntervalUpDown: TUpDown
          Left = 654
          Top = 150
          Width = 19
          Height = 23
          Max = 32767
          TabOrder = 9
          OnClick = IntervalUpDownClick
        end
        object AlarmAdvType: TComboBox
          Left = 230
          Top = 224
          Width = 88
          Height = 21
          Style = csDropDownList
          TabOrder = 13
        end
        object AdvanceUpDown: TUpDown
          Left = 196
          Top = 223
          Width = 19
          Height = 23
          Min = 1
          Max = 120
          Position = 1
          TabOrder = 14
          OnClick = AdvanceUpDownClick
        end
        object AlarmAdvance: TMaskEdit
          Left = 133
          Top = 224
          Width = 65
          Height = 21
          TabOrder = 12
          OnChange = AlarmAdvanceChange
        end
        object CBAllDay: TCheckBox
          Left = 109
          Top = 133
          Width = 206
          Height = 17
          Caption = 'All Day Event'
          TabOrder = 2
          OnClick = CBAllDayClick
        end
        object StartDate: TVpDateEdit
          Left = 109
          Top = 151
          Width = 115
          Height = 21
          Epoch = 2000
          PopupCalColors.ActiveDay = clRed
          PopupCalColors.ColorScheme = cscalWindows
          PopupCalColors.DayNames = clMaroon
          PopupCalColors.Days = clBlack
          PopupCalColors.InactiveDays = clGray
          PopupCalColors.MonthAndYear = clBlue
          PopupCalColors.Weekend = clRed
          PopupCalColors.EventDays = clBlack
          PopupCalFont.Charset = DEFAULT_CHARSET
          PopupCalFont.Color = clWindowText
          PopupCalFont.Height = -11
          PopupCalFont.Name = 'MS Sans Serif'
          PopupCalFont.Style = []
          ReadOnly = False
          RequiredFields = [rfMonth, rfDay]
          TabOrder = 3
          TodayString = '/'
          WeekStarts = dtMonday
          OnChange = StartDateChange
        end
        object EndDate: TVpDateEdit
          Left = 109
          Top = 175
          Width = 115
          Height = 21
          Epoch = 2000
          PopupCalColors.ActiveDay = clRed
          PopupCalColors.ColorScheme = cscalWindows
          PopupCalColors.DayNames = clMaroon
          PopupCalColors.Days = clBlack
          PopupCalColors.InactiveDays = clGray
          PopupCalColors.MonthAndYear = clBlue
          PopupCalColors.Weekend = clRed
          PopupCalColors.EventDays = clBlack
          PopupCalFont.Charset = DEFAULT_CHARSET
          PopupCalFont.Color = clWindowText
          PopupCalFont.Height = -11
          PopupCalFont.Name = 'MS Sans Serif'
          PopupCalFont.Style = []
          ReadOnly = False
          RequiredFields = [rfMonth, rfDay]
          TabOrder = 5
          TodayString = '/'
          WeekStarts = dtMonday
          OnChange = EndDateChange
        end
        object edtUnusedPlaceholder: TEdit
          Left = 587
          Top = 151
          Width = 65
          Height = 21
          TabOrder = 8
          Text = 'Placeholder control'
          Visible = False
        end
        object RepeatUntil: TVpDateEdit
          Left = 447
          Top = 175
          Width = 115
          Height = 21
          Epoch = 2000
          PopupCalColors.ActiveDay = clRed
          PopupCalColors.ColorScheme = cscalWindows
          PopupCalColors.DayNames = clMaroon
          PopupCalColors.Days = clBlack
          PopupCalColors.InactiveDays = clGray
          PopupCalColors.MonthAndYear = clBlue
          PopupCalColors.Weekend = clRed
          PopupCalColors.EventDays = clBlack
          PopupCalFont.Charset = DEFAULT_CHARSET
          PopupCalFont.Color = clWindowText
          PopupCalFont.Height = -11
          PopupCalFont.Name = 'MS Sans Serif'
          PopupCalFont.Style = []
          ReadOnly = False
          RequiredFields = [rfMonth, rfDay]
          TabOrder = 10
          TodayString = '/'
        end
        object EAccount: TEdit
          Left = 86
          Top = 68
          Width = 225
          Height = 21
          TabOrder = 15
          OnEnter = EAccountEnter
        end
        object cbSalesmen: TComboBox
          Left = 88
          Top = 92
          Width = 177
          Height = 21
          Style = csDropDownList
          TabOrder = 16
          OnChange = cbSalesmenChange
        end
        object EQuote: TEdit
          Left = 324
          Top = 92
          Width = 121
          Height = 21
          TabOrder = 17
        end
        object cbProject: TComboBox
          Left = 364
          Top = 44
          Width = 318
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 18
          OnChange = cbProjectChange
        end
        object cbLocation: TComboBox
          Left = 364
          Top = 68
          Width = 318
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 19
        end
        object cbProduct: TComboBox
          Left = 456
          Top = 224
          Width = 214
          Height = 21
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 20
          OnChange = cbProjectChange
        end
      end
      object NotesMemo: TMemo
        Left = -1
        Top = 280
        Width = 695
        Height = 155
        Anchors = [akLeft, akTop, akRight, akBottom]
        ScrollBars = ssVertical
        TabOrder = 1
      end
    end
    object TSRepeatInvoice: TTabSheet
      Caption = 'Repeated invoices'
      ImageIndex = 1
      DesignSize = (
        689
        437)
      object LProcessList: TLabel
        Left = 154
        Top = 68
        Width = 53
        Height = 13
        Caption = 'Process list'
      end
      object LInvoiceDate: TLabel
        Left = 231
        Top = 68
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Invoice date'
      end
      object Label1: TLabel
        Left = 423
        Top = 8
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Message'
      end
      object Panel2: TPanel
        Left = 8
        Top = 8
        Width = 137
        Height = 313
        Color = clBtnShadow
        TabOrder = 0
        object BNew: TButton
          Left = 7
          Top = 10
          Width = 125
          Height = 25
          Caption = 'New'
          TabOrder = 0
          OnClick = BNewClick
        end
        object BEdit: TButton
          Left = 7
          Top = 42
          Width = 125
          Height = 25
          Caption = 'Edit'
          TabOrder = 1
          OnClick = BEditClick
        end
        object BDelete: TButton
          Left = 7
          Top = 74
          Width = 125
          Height = 25
          Caption = 'Delete'
          TabOrder = 2
          OnClick = BDeleteClick
        end
        object BProcessSelected: TButton
          Left = 7
          Top = 104
          Width = 125
          Height = 25
          Caption = 'Process selected'
          TabOrder = 3
          OnClick = BProcessSelectedClick
        end
        object BProcessAll: TButton
          Left = 7
          Top = 136
          Width = 125
          Height = 25
          Caption = 'Process All'
          TabOrder = 4
          OnClick = BProcessAllClick
        end
      end
      object DTInvoiceDate: TDateTimePicker
        Left = 296
        Top = 64
        Width = 113
        Height = 21
        Date = 38441.542061631900000000
        Time = 38441.542061631900000000
        MaxDate = 365245.000000000000000000
        MinDate = 2.000000000000000000
        TabOrder = 1
      end
      object DBGrid1: TDBGrid
        Left = 160
        Top = 88
        Width = 521
        Height = 330
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DSTaskAction
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGrid1ColEnter
        OnDblClick = DBGrid1DblClick
        OnKeyPress = DBGrid1KeyPress
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'SACCOUNTCODE'
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDOCNO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SREFERENCE'
            Visible = True
          end>
      end
      object EMessage1: TEdit
        Left = 472
        Top = 8
        Width = 185
        Height = 21
        MaxLength = 35
        TabOrder = 3
      end
      object EMessage2: TEdit
        Left = 472
        Top = 32
        Width = 185
        Height = 21
        MaxLength = 35
        TabOrder = 4
      end
      object EMessage3: TEdit
        Left = 472
        Top = 56
        Width = 185
        Height = 21
        MaxLength = 35
        TabOrder = 5
      end
    end
    object tsplugins: TTabSheet
      Caption = 'Plugins'
      ImageIndex = 2
    end
  end
  object FileDialog: TOpenDialog
    Left = 308
    Top = 183
  end
  object DSTaskAction: TDataSource
    DataSet = dmDatabase.QTaskAction
    Left = 496
    Top = 192
  end
end
