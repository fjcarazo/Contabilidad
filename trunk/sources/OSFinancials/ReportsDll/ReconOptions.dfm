object fmReconOptions: TfmReconOptions
  Left = 111
  Top = 128
  Width = 456
  Height = 403
  BorderIcons = [biSystemMenu]
  Caption = 'Bank Account Recon Options'
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 335
    Width = 448
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BtnCancel: TBitBtn
      Left = 329
      Top = 6
      Width = 96
      Height = 25
      Cancel = True
      Caption = 'Close'
      TabOrder = 0
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
    object BtnOk: TBitBtn
      Left = 226
      Top = 5
      Width = 96
      Height = 25
      Caption = '&Open'
      Default = True
      TabOrder = 1
      OnClick = btnOkClick
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 69
    Width = 448
    Height = 266
    Align = alClient
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 446
      Height = 120
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 96
        Top = 13
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bank Account'
      end
      object Label2: TLabel
        Left = 79
        Top = 37
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Include Items until'
      end
      object Label3: TLabel
        Left = 97
        Top = 61
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bank Balance'
      end
      object Label6: TLabel
        Left = 87
        Top = 83
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = 'Current balance'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 168
        Top = 8
        Width = 145
        Height = 21
        DataField = 'SReconBankAccount'
        DataSource = dmDatabase.dsReportingOptions
        KeyField = 'SDescription'
        ListField = 'SDescription'
        ListSource = dmDatabase.dSACCOUNT
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
        OnKeyDown = FormKeyDown
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object dbedtBankBal: TDBEdit
        Left = 168
        Top = 56
        Width = 105
        Height = 21
        DataField = 'FReconBankBalance'
        DataSource = dmDatabase.dsReportingOptions
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object dbdtUntilDate: TwwDBDateTimePicker
        Left = 168
        Top = 32
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        DataField = 'DReconUntil'
        DataSource = dmDatabase.dsReportingOptions
        Epoch = 1950
        ShowButton = True
        TabOrder = 2
        OnChange = dbdtUntilDateChange
        OnKeyDown = FormKeyDown
        OnKeyPress = DBLookupComboBox1KeyPress
      end
      object LCurBalance: TStaticText
        Left = 168
        Top = 80
        Width = 105
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        BevelKind = bkFlat
        Caption = 'LCurBalance'
        TabOrder = 3
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 121
      Width = 446
      Height = 144
      Align = alClient
      DataSource = DSBankBook
      Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'SReference'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DDate'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SDescription'
          Width = 213
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FAmount'
          Width = 66
          Visible = True
        end>
    end
  end
  object TopPnl: TPanel
    Left = 0
    Top = 0
    Width = 448
    Height = 69
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 0
    object DestLbl: TLabel
      Left = 16
      Top = 10
      Width = 74
      Height = 13
      Caption = 'Send report To:'
      FocusControl = cbDestination
    end
    object lblCopies: TLabel
      Left = 122
      Top = 40
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Copies :'
      Enabled = False
      FocusControl = edtCount
    end
    object cbDestination: TComboBox
      Left = 18
      Top = 38
      Width = 91
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
    object Bitprn1: TBitBtn
      Left = 222
      Top = 38
      Width = 107
      Height = 25
      Caption = '&Printer Setup'
      TabOrder = 1
      TabStop = False
      OnClick = Bitprn1Click
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000000000000000
        1F7C1F7C1F7C1F7C000018631863186318631863186318631863186300001863
        00001F7C1F7C0000000000000000000000000000000000000000000000000000
        186300001F7C0000186318631863186318631863E07FE07FE07F186318630000
        000000001F7C0000186318631863186318631863104210421042186318630000
        186300001F7C0000000000000000000000000000000000000000000000000000
        1863186300000000186318631863186318631863186318631863186300001863
        0000186300001F7C000000000000000000000000000000000000000018630000
        1863000000001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001863
        0000186300001F7C1F7C1F7C0000FF7F00000000000000000000FF7F00000000
        000000001F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00000000000000000000FF7F0000
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        00001F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
        00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object edtCount: TEdit
      Left = 162
      Top = 38
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '1'
      OnChange = edtCountChange
      OnKeyPress = cbDestinationKeyPress
    end
    object UpDown1: TUpDown
      Left = 199
      Top = 36
      Width = 16
      Height = 24
      Enabled = False
      Min = 1
      Max = 32767
      Position = 1
      TabOrder = 3
      OnClick = UpDown1Click
    end
  end
  object DSBankBook: TDataSource
    DataSet = QbankLastBooking
    Left = 96
    Top = 88
  end
  object QbankLastBooking: TuniQuery
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'SELECT Transact.SReference, Transact.DDate,Transactiondesc.SDesc' +
        'ription, Transact.FAmount'
      'FROM TransAct'
      '   INNER JOIN Messages Transactiondesc'
      '   ON  (Transact.WDescriptionID = Transactiondesc.WMessageID)  '
      'where Transact.WaccountId = :Account and Transact.DDate = :Date')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Account'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date'
        ParamType = ptUnknown
      end>
    Left = 360
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date'
        ParamType = ptUnknown
      end>
    object QbankLastBookingSReference: TStringField
      FieldName = 'SReference'
      Origin = 'REPMANTCCON."TransAct.DB".SReference'
      Size = 15
    end
    object QbankLastBookingDDate: TDateField
      FieldName = 'DDate'
      Origin = 'REPMANTCCON."TransAct.DB".DDate'
    end
    object QbankLastBookingSDescription: TStringField
      FieldName = 'SDescription'
      Origin = 'REPMANTCCON.MessagesSDescription'
      Size = 35
    end
    object QbankLastBookingFAmount: TFloatField
      FieldName = 'FAmount'
      Origin = 'REPMANTCCON."TransAct.DB".FAmount'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object QGetLastBookingsDate: TuniQuery
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'SELECT max(Transact.DDate) as maxdate FROM TransAct where Transa' +
        'ct.WAccountId = :Account')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Account'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account'
        ParamType = ptUnknown
      end>
    object QGetLastBookingsDatemaxdate: TDateField
      FieldName = 'maxdate'
      Origin = 'REPMANTCCON."TransAct.DB".DDate'
    end
  end
end
