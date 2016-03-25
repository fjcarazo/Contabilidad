object ContactTCEditForm: TContactTCEditForm
  Left = 299
  Top = 234
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'ContactEdit'
  ClientHeight = 481
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tsContacts: TPageControl
    Left = 0
    Top = 0
    Width = 496
    Height = 440
    ActivePage = tabMain
    Align = alClient
    TabOrder = 0
    OnChange = tsContactsChange
    object tabMain: TTabSheet
      Caption = '&Main'
      DesignSize = (
        488
        412)
      object NameLbl: TLabel
        Left = 76
        Top = 6
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Name'
        FocusControl = NameEdit
      end
      object AddrLbl: TLabel
        Left = 66
        Top = 190
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Address'
        FocusControl = AddressEdit
      end
      object CityLbl: TLabel
        Left = 87
        Top = 214
        Width = 17
        Height = 13
        Alignment = taRightJustify
        Caption = 'City'
        FocusControl = CityEdit
      end
      object StateLbl: TLabel
        Left = 79
        Top = 238
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'State'
        FocusControl = cboxState
      end
      object ZipLbl: TLabel
        Left = 61
        Top = 262
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Zip Code'
        FocusControl = ZipCodeEdit
      end
      object CountryLbl: TLabel
        Left = 68
        Top = 286
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Country'
        FocusControl = cboxCountry
      end
      object PositionLbl: TLabel
        Left = 67
        Top = 335
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Position'
        FocusControl = PositionEdit
      end
      object TitleLbl: TLabel
        Left = 84
        Top = 87
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'Title'
        FocusControl = TitleEdit
      end
      object CompanyLbl: TLabel
        Left = 60
        Top = 311
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Company'
        FocusControl = CompanyEdit
      end
      object CategoryLbl: TLabel
        Left = 62
        Top = 362
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Category'
        FocusControl = cboxCategory
      end
      object LLAstname: TLabel
        Left = 55
        Top = 62
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Last name'
        FocusControl = NameEdit
      end
      object Label1: TLabel
        Left = 66
        Top = 114
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Birthday'
      end
      object Label2: TLabel
        Left = 52
        Top = 140
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Specialday'
      end
      object Label3: TLabel
        Left = 68
        Top = 166
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Gender'
      end
      object Label12: TLabel
        Left = 74
        Top = 38
        Width = 29
        Height = 13
        Caption = 'Initials'
      end
      object NameEdit: TEdit
        Left = 108
        Top = 4
        Width = 305
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 0
        OnChange = ItemChanged
      end
      object AddressEdit: TEdit
        Left = 108
        Top = 188
        Width = 351
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 6
        OnChange = ItemChanged
      end
      object CityEdit: TEdit
        Left = 108
        Top = 212
        Width = 351
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 7
        OnChange = ItemChanged
      end
      object StateEdit: TEdit
        Left = 108
        Top = 236
        Width = 351
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 25
        TabOrder = 14
        OnChange = ItemChanged
      end
      object ZipCodeEdit: TEdit
        Left = 108
        Top = 260
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 15
        TabOrder = 9
        OnChange = ItemChanged
      end
      object PositionEdit: TEdit
        Left = 108
        Top = 333
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 12
        OnChange = ItemChanged
      end
      object TitleEdit: TEdit
        Left = 108
        Top = 85
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 2
        OnChange = ItemChanged
      end
      object CompanyEdit: TEdit
        Left = 108
        Top = 309
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 50
        TabOrder = 11
        OnChange = ItemChanged
      end
      object cboxCategory: TComboBox
        Left = 108
        Top = 360
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 13
      end
      object cboxState: TComboBox
        Left = 108
        Top = 236
        Width = 353
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 8
        Visible = False
      end
      object edtCountry: TEdit
        Left = 108
        Top = 284
        Width = 353
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
      end
      object cboxCountry: TComboBox
        Left = 108
        Top = 284
        Width = 353
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 10
        OnChange = cboxCountryChange
      end
      object LastNameEdit: TEdit
        Left = 108
        Top = 60
        Width = 305
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 100
        TabOrder = 1
        OnChange = ItemChanged
      end
      object EBirthDay: TVpDateEdit
        Left = 109
        Top = 111
        Width = 219
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
      end
      object ESpecialDay: TVpDateEdit
        Left = 109
        Top = 136
        Width = 219
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        TabOrder = 4
        TodayString = '/'
      end
      object cbGender: TComboBox
        Left = 108
        Top = 160
        Width = 217
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 5
        Items.Strings = (
          ''
          'Male'
          'Female')
      end
      object EFreeField10: TEdit
        Left = 108
        Top = 32
        Width = 236
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 16
        Text = 'EFreeField10'
      end
    end
    object tabContact: TTabSheet
      Caption = 'Con&tact'
      ImageIndex = 1
      DesignSize = (
        488
        412)
      object EMailLbl: TLabel
        Left = 91
        Top = 136
        Width = 40
        Height = 13
        Caption = 'EMailLbl'
      end
      object LTelephone1: TLabel
        Left = 8
        Top = 8
        Width = 57
        Height = 13
        Caption = 'Telephone1'
      end
      object LFax: TLabel
        Left = 8
        Top = 56
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object LTelephone2: TLabel
        Left = 8
        Top = 32
        Width = 57
        Height = 13
        Caption = 'Telephone2'
      end
      object Freefield1: TLabel
        Left = 288
        Top = 14
        Width = 46
        Height = 13
        Caption = 'Freefield1'
      end
      object Label4: TLabel
        Left = 288
        Top = 38
        Width = 46
        Height = 13
        Caption = 'Freefield2'
      end
      object Label5: TLabel
        Left = 288
        Top = 62
        Width = 46
        Height = 13
        Caption = 'Freefield3'
      end
      object Label6: TLabel
        Left = 288
        Top = 86
        Width = 46
        Height = 13
        Caption = 'Freefield4'
      end
      object Label7: TLabel
        Left = 288
        Top = 110
        Width = 46
        Height = 13
        Caption = 'Freefield5'
      end
      object Label8: TLabel
        Left = 288
        Top = 134
        Width = 46
        Height = 13
        Caption = 'Freefield6'
      end
      object Label9: TLabel
        Left = 288
        Top = 158
        Width = 46
        Height = 13
        Caption = 'Freefield7'
      end
      object Label10: TLabel
        Left = 288
        Top = 182
        Width = 46
        Height = 13
        Caption = 'Freefield8'
      end
      object Label11: TLabel
        Left = 288
        Top = 206
        Width = 46
        Height = 13
        Caption = 'Freefield9'
      end
      object cboxPhoneLbl4: TComboBox
        Left = 8
        Top = 80
        Width = 121
        Height = 21
        ItemHeight = 13
        TabOrder = 3
      end
      object Phone4Edit: TEdit
        Left = 136
        Top = 80
        Width = 121
        Height = 21
        MaxLength = 25
        TabOrder = 4
        OnChange = ItemChanged
      end
      object Phone3Edit: TEdit
        Left = 136
        Top = 56
        Width = 121
        Height = 21
        MaxLength = 25
        TabOrder = 2
        OnChange = ItemChanged
      end
      object Phone2Edit: TEdit
        Left = 136
        Top = 32
        Width = 121
        Height = 21
        MaxLength = 25
        TabOrder = 1
        OnChange = ItemChanged
      end
      object Phone1Edit: TEdit
        Left = 136
        Top = 8
        Width = 121
        Height = 21
        MaxLength = 25
        TabOrder = 0
        OnChange = ItemChanged
      end
      object cboxPhoneLbl5: TComboBox
        Left = 8
        Top = 104
        Width = 121
        Height = 21
        ItemHeight = 13
        TabOrder = 5
      end
      object Phone5Edit: TEdit
        Left = 136
        Top = 104
        Width = 121
        Height = 21
        MaxLength = 25
        TabOrder = 6
        OnChange = ItemChanged
      end
      object EMailEdit: TEdit
        Left = 136
        Top = 128
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object EFreeField1: TEdit
        Left = 336
        Top = 8
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        Text = 'EFreeField1'
      end
      object EFreeField2: TEdit
        Left = 336
        Top = 32
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        Text = 'EFreeField2'
      end
      object EFreeField3: TEdit
        Left = 336
        Top = 56
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
        Text = 'EFreeField3'
      end
      object EFreeField4: TEdit
        Left = 336
        Top = 80
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 11
        Text = 'EFreeField4'
      end
      object EFreeField5: TEdit
        Left = 336
        Top = 104
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
        Text = 'EFreeField5'
      end
      object EFreeField6: TEdit
        Left = 336
        Top = 128
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 13
        Text = 'EFreeField6'
      end
      object EFreeField7: TEdit
        Left = 336
        Top = 152
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 14
        Text = 'EFreeField7'
      end
      object EFreeField8: TEdit
        Left = 336
        Top = 176
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 15
        Text = 'EFreeField8'
      end
      object EFreeField9: TEdit
        Left = 336
        Top = 200
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 16
        Text = 'EFreeField9'
      end
    end
    object tabCustom: TTabSheet
      Caption = 'C&ustom'
      ImageIndex = 2
      TabVisible = False
      object CustomLbl1: TLabel
        Left = 8
        Top = 12
        Width = 55
        Height = 13
        Caption = 'CustomLbl1'
      end
      object CustomLbl2: TLabel
        Left = 8
        Top = 36
        Width = 55
        Height = 13
        Caption = 'CustomLbl2'
      end
      object CustomLbl3: TLabel
        Left = 8
        Top = 60
        Width = 55
        Height = 13
        Caption = 'CustomLbl3'
      end
      object CustomLbl4: TLabel
        Left = 8
        Top = 84
        Width = 55
        Height = 13
        Caption = 'CustomLbl4'
      end
      object Custom1Edit: TEdit
        Left = 80
        Top = 8
        Width = 121
        Height = 21
        MaxLength = 100
        TabOrder = 0
        OnChange = ItemChanged
      end
      object Custom2Edit: TEdit
        Left = 80
        Top = 32
        Width = 121
        Height = 21
        MaxLength = 100
        TabOrder = 1
        OnChange = ItemChanged
      end
      object Custom3Edit: TEdit
        Left = 80
        Top = 56
        Width = 121
        Height = 21
        MaxLength = 100
        TabOrder = 2
        OnChange = ItemChanged
      end
      object Custom4Edit: TEdit
        Left = 80
        Top = 80
        Width = 121
        Height = 21
        MaxLength = 100
        TabOrder = 3
        OnChange = ItemChanged
      end
    end
    object tabNotes: TTabSheet
      Caption = '&Notes'
      ImageIndex = 3
      DesignSize = (
        488
        412)
      object NoteEdit: TMemo
        Left = 8
        Top = 8
        Width = 472
        Height = 394
        Anchors = [akLeft, akTop, akRight, akBottom]
        MaxLength = 1024
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tsFreefields: TTabSheet
      Caption = 'Freefields'
      ImageIndex = 4
      TabVisible = False
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 440
    Width = 496
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      496
      41)
    object OKBtn: TButton
      Left = 341
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      TabOrder = 0
      TabStop = False
      OnClick = OKBtnClick
    end
    object CancelBtn: TButton
      Left = 420
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 1
      TabStop = False
      OnClick = CancelBtnClick
    end
  end
end
