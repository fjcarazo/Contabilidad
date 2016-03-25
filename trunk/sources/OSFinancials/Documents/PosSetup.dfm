object fmPosSetup: TfmPosSetup
  Left = 199
  Top = 112
  BorderStyle = bsDialog
  Caption = 'POS Setup'
  ClientHeight = 572
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 642
    Height = 538
    ActivePage = tab1
    Align = alClient
    TabOrder = 0
    object tab1: TTabSheet
      Caption = 'tab1'
      DesignSize = (
        634
        510)
      object GroupBox1: TGroupBox
        Left = 3
        Top = 1
        Width = 627
        Height = 224
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Ledger'
        TabOrder = 0
        object Label6: TLabel
          Left = 87
          Top = 20
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sales Batch Entry'
        end
        object Label7: TLabel
          Left = 75
          Top = 100
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cash Sales Account'
        end
        object Label8: TLabel
          Left = 62
          Top = 124
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cash Transfer Account'
        end
        object Label9: TLabel
          Left = 112
          Top = 174
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Till Account '
        end
        object Label10: TLabel
          Left = 97
          Top = 198
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Max Cash in Till'
        end
        object Label11: TLabel
          Left = 254
          Top = 96
          Width = 163
          Height = 17
          AutoSize = False
          Color = clWhite
          ParentColor = False
        end
        object Label12: TLabel
          Left = 254
          Top = 122
          Width = 163
          Height = 17
          AutoSize = False
          Color = clWhite
          ParentColor = False
        end
        object Label13: TLabel
          Left = 254
          Top = 172
          Width = 163
          Height = 17
          AutoSize = False
          Color = clWhite
          ParentColor = False
        end
        object Label3: TLabel
          Left = 47
          Top = 69
          Width = 124
          Height = 13
          Alignment = taRightJustify
          Caption = 'Payment Description Entry'
        end
        object Label21: TLabel
          Left = 71
          Top = 44
          Width = 100
          Height = 13
          Alignment = taRightJustify
          Caption = 'Receipts Batch Entry'
        end
        object LedtChequeCtrlAccount: TLabel
          Left = 254
          Top = 148
          Width = 163
          Height = 17
          AutoSize = False
          Color = clWhite
          ParentColor = False
        end
        object Label35: TLabel
          Left = 92
          Top = 150
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cheque account'
        end
        object edtSaleSACCOUNT: TEdit
          Left = 179
          Top = 94
          Width = 69
          Height = 21
          AutoSize = False
          TabOrder = 3
          OnEnter = edtSaleSACCOUNTEnter
        end
        object edtPaidoutAccount: TEdit
          Left = 179
          Top = 120
          Width = 69
          Height = 21
          AutoSize = False
          TabOrder = 4
          OnEnter = edtPaidoutAccountEnter
        end
        object edtCashCtrlAccount: TEdit
          Left = 179
          Top = 169
          Width = 69
          Height = 21
          AutoSize = False
          TabOrder = 6
          OnEnter = edtCashCtrlAccountEnter
        end
        object Edit4: TEdit
          Left = 179
          Top = 194
          Width = 69
          Height = 21
          AutoSize = False
          TabOrder = 7
        end
        object cbBatchList: TComboBox
          Left = 179
          Top = 10
          Width = 184
          Height = 21
          TabOrder = 0
        end
        object edtDescr: TEdit
          Left = 178
          Top = 61
          Width = 183
          Height = 21
          AutoSize = False
          TabOrder = 2
        end
        object cbChqBatchList: TComboBox
          Left = 179
          Top = 34
          Width = 184
          Height = 21
          TabOrder = 1
        end
        object edtChequeCtrlAccount: TEdit
          Left = 179
          Top = 145
          Width = 69
          Height = 21
          AutoSize = False
          TabOrder = 5
          OnEnter = edtChequeCtrlAccountEnter
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 224
        Width = 628
        Height = 279
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Documents'
        TabOrder = 1
        object Label1: TLabel
          Left = 10
          Top = 26
          Width = 62
          Height = 13
          Caption = 'Next Number'
        end
        object Label31: TLabel
          Left = 156
          Top = 244
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = 'Round pos end amount'
        end
        object LEDiscountPassword: TLabel
          Left = 204
          Top = 220
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Discount PW'
        end
        object LEAutoLogoutTimer: TLabel
          Left = 120
          Top = 196
          Width = 147
          Height = 13
          Alignment = taRightJustify
          Caption = 'Auto logout in seconds (0 = off)'
        end
        object RadioButton1: TRadioButton
          Left = 8
          Top = 49
          Width = 169
          Height = 17
          Caption = '&Use POS Messages'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton2Click
        end
        object NextNo: TEdit
          Left = 180
          Top = 18
          Width = 69
          Height = 21
          TabOrder = 0
          Text = 'POS00001'
        end
        object RadioButton2: TRadioButton
          Left = 8
          Top = 75
          Width = 169
          Height = 17
          Caption = '&Use Invoice Messages'
          TabOrder = 2
          OnClick = RadioButton2Click
        end
        object Edit9: TEdit
          Left = 179
          Top = 47
          Width = 155
          Height = 21
          TabOrder = 3
        end
        object Edit10: TEdit
          Left = 179
          Top = 68
          Width = 155
          Height = 21
          TabOrder = 4
        end
        object Edit11: TEdit
          Left = 179
          Top = 89
          Width = 155
          Height = 21
          TabOrder = 5
        end
        object CheckBox8: TCheckBox
          Left = 8
          Top = 112
          Width = 217
          Height = 17
          Caption = 'Print Customer Details'
          TabOrder = 6
        end
        object CheckBox9: TCheckBox
          Left = 8
          Top = 128
          Width = 217
          Height = 17
          Caption = 'Print Delivery Address'
          TabOrder = 7
        end
        object CheckBox13: TCheckBox
          Left = 8
          Top = 144
          Width = 209
          Height = 17
          Caption = 'Print Payment Details'
          TabOrder = 8
        end
        object CBUseDebtorPricelevel: TCheckBox
          Left = 272
          Top = 112
          Width = 201
          Height = 17
          Caption = 'Use debtor sellingprice'
          TabOrder = 9
        end
        object CBPasswordDiscount: TCheckBox
          Left = 272
          Top = 128
          Width = 201
          Height = 17
          Caption = 'Use password for discount'
          TabOrder = 10
        end
        object EDiscountPassword: TEdit
          Left = 272
          Top = 217
          Width = 145
          Height = 21
          PasswordChar = '*'
          TabOrder = 11
        end
        object CBShowQtyOnhand: TCheckBox
          Left = 272
          Top = 144
          Width = 201
          Height = 17
          Caption = 'Show qty on hand'
          TabOrder = 12
        end
        object ERoundAmount: TEdit
          Left = 272
          Top = 240
          Width = 121
          Height = 21
          TabOrder = 13
          Text = '0'
        end
        object CBFastSwitchSalesMan: TCheckBox
          Left = 8
          Top = 235
          Width = 145
          Height = 17
          Caption = 'Fast switch sales man'
          TabOrder = 14
        end
        object EAutoLogoutTimer: TEdit
          Left = 272
          Top = 192
          Width = 121
          Height = 21
          TabOrder = 15
          Text = 'EAutoLogoutTimer'
        end
      end
    end
    object tab2: TTabSheet
      Caption = 'tab2'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox3: TGroupBox
        Left = 2
        Top = 0
        Width = 479
        Height = 79
        Caption = 'General'
        TabOrder = 0
        object Label2: TLabel
          Left = 262
          Top = 22
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Float Limit'
        end
        object Label15: TLabel
          Left = 44
          Top = 51
          Width = 117
          Height = 13
          Alignment = taRightJustify
          Caption = 'Default Payment Method'
          Visible = False
        end
        object Edit6: TEdit
          Left = 314
          Top = 18
          Width = 85
          Height = 21
          AutoSize = False
          TabOrder = 0
        end
        object CheckBox1: TCheckBox
          Left = 10
          Top = 22
          Width = 165
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Allow Cash Float'
          TabOrder = 1
        end
        object ComboBox2: TComboBox
          Left = 164
          Top = 48
          Width = 145
          Height = 21
          ItemIndex = 0
          TabOrder = 2
          Text = 'Cash'
          Visible = False
          Items.Strings = (
            'Cash'
            'Credit Card'
            'Account'
            'Voucher')
        end
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 82
        Width = 479
        Height = 249
        Caption = 'Entry Screen'
        TabOrder = 1
        object CheckBox12: TCheckBox
          Left = 11
          Top = 20
          Width = 313
          Height = 17
          Caption = 'Use Serial number Tracking'
          Enabled = False
          TabOrder = 0
        end
      end
    end
    object tab3: TTabSheet
      Caption = 'tab3'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PageControl2: TPageControl
        Left = 16
        Top = 16
        Width = 457
        Height = 385
        ActivePage = TabSheet3
        TabOrder = 0
        OnChange = PageControl2Change
        object TabSheet3: TTabSheet
          Caption = 'Drawer'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label30: TLabel
            Left = 220
            Top = 128
            Width = 63
            Height = 13
            Caption = 'Control String'
          end
          object gbdPort: TGroupBox
            Left = 6
            Top = 12
            Width = 207
            Height = 101
            Caption = 'Port'
            TabOrder = 0
            object Label16: TLabel
              Left = 15
              Top = 68
              Width = 59
              Height = 13
              Caption = 'Port Number'
            end
            object rbDwrPPort: TRadioButton
              Left = 12
              Top = 20
              Width = 135
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Parallel Port'
              Checked = True
              TabOrder = 0
              TabStop = True
            end
            object rbDwrSPort: TRadioButton
              Left = 12
              Top = 42
              Width = 135
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Serial Port'
              TabOrder = 1
            end
            object Edit7: TEdit
              Left = 134
              Top = 62
              Width = 21
              Height = 21
              TabOrder = 2
              Text = '1'
            end
          end
          object gbdParam: TGroupBox
            Left = 6
            Top = 120
            Width = 207
            Height = 121
            Caption = 'Serial Port Parameters'
            TabOrder = 1
            object Label17: TLabel
              Left = 72
              Top = 21
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Baud Rate'
            end
            object Label18: TLabel
              Left = 80
              Top = 43
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data Bits'
            end
            object Label19: TLabel
              Left = 81
              Top = 68
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Stop Bits'
            end
            object Label20: TLabel
              Left = 97
              Top = 94
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Parity'
            end
            object Edit8: TEdit
              Left = 130
              Top = 18
              Width = 65
              Height = 21
              TabOrder = 0
              Text = '9600'
            end
            object Edit12: TEdit
              Left = 130
              Top = 42
              Width = 65
              Height = 21
              TabOrder = 1
              Text = '8'
            end
            object Edit13: TEdit
              Left = 130
              Top = 66
              Width = 65
              Height = 21
              TabOrder = 2
              Text = '1'
            end
            object Edit14: TEdit
              Left = 130
              Top = 90
              Width = 65
              Height = 21
              TabOrder = 3
              Text = 'N'
            end
          end
          object CheckBox2: TCheckBox
            Left = 7
            Top = 247
            Width = 194
            Height = 17
            Caption = 'Drawer Connected'
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = CheckBox2Click
          end
          object gbdOpen: TGroupBox
            Left = 219
            Top = 13
            Width = 222
            Height = 100
            Caption = 'Open Cash Drawer For'
            TabOrder = 3
            object CheckBox3: TCheckBox
              Left = 14
              Top = 20
              Width = 155
              Height = 17
              Caption = 'Cheques'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object CheckBox4: TCheckBox
              Left = 14
              Top = 42
              Width = 155
              Height = 17
              Caption = 'Credit Cards'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object CheckBox5: TCheckBox
              Left = 14
              Top = 62
              Width = 155
              Height = 17
              Caption = 'Vouchers'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
          end
          object Button1: TButton
            Left = 304
            Top = 232
            Width = 95
            Height = 25
            Caption = '&Test'
            TabOrder = 4
            OnClick = Button1Click
          end
          object edtDrawerCtr: TComboBox
            Left = 220
            Top = 144
            Width = 145
            Height = 21
            ItemIndex = 0
            TabOrder = 5
            Text = '07'
            Items.Strings = (
              '07'
              '27+112+0+25+250')
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Pol Display'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label27: TLabel
            Left = 232
            Top = 16
            Width = 67
            Height = 13
            Caption = 'Test Message'
          end
          object GroupBox7: TGroupBox
            Left = 6
            Top = 12
            Width = 207
            Height = 101
            Caption = 'Port'
            TabOrder = 0
            object Label22: TLabel
              Left = 14
              Top = 65
              Width = 59
              Height = 13
              Caption = 'Port Number'
            end
            object RadioButton5: TRadioButton
              Left = 12
              Top = 20
              Width = 135
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Parallel Port'
              TabOrder = 0
            end
            object RadioButton6: TRadioButton
              Left = 12
              Top = 42
              Width = 135
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Serial Port'
              Checked = True
              TabOrder = 1
              TabStop = True
            end
            object Edit1: TEdit
              Left = 134
              Top = 62
              Width = 21
              Height = 21
              TabOrder = 2
              Text = '1'
            end
          end
          object GroupBox8: TGroupBox
            Left = 6
            Top = 120
            Width = 207
            Height = 121
            Caption = 'Serial Port Parameters'
            TabOrder = 1
            object Label23: TLabel
              Left = 72
              Top = 21
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Baud Rate'
            end
            object Label24: TLabel
              Left = 80
              Top = 43
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data Bits'
            end
            object Label25: TLabel
              Left = 81
              Top = 68
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Stop Bits'
            end
            object Label26: TLabel
              Left = 97
              Top = 94
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Parity'
            end
            object Edit2: TEdit
              Left = 130
              Top = 18
              Width = 65
              Height = 21
              TabOrder = 0
              Text = '9600'
            end
            object Edit3: TEdit
              Left = 130
              Top = 42
              Width = 65
              Height = 21
              TabOrder = 1
              Text = '8'
            end
            object Edit5: TEdit
              Left = 130
              Top = 66
              Width = 65
              Height = 21
              TabOrder = 2
              Text = '1'
            end
            object Edit15: TEdit
              Left = 130
              Top = 90
              Width = 65
              Height = 21
              TabOrder = 3
              Text = 'N'
            end
          end
          object Button3: TButton
            Left = 304
            Top = 232
            Width = 95
            Height = 25
            Caption = '&Test'
            TabOrder = 2
            OnClick = Button3Click
          end
          object CheckBox14: TCheckBox
            Left = 6
            Top = 248
            Width = 243
            Height = 17
            Caption = 'Pol Display Connected'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = CheckBox2Click
          end
          object Edit16: TEdit
            Left = 232
            Top = 32
            Width = 121
            Height = 21
            TabOrder = 4
            Text = 'Can you see this ??'
          end
          object CBPollDiplayType: TComboBox
            Left = 232
            Top = 64
            Width = 121
            Height = 21
            Style = csDropDownList
            TabOrder = 5
            Items.Strings = (
              'Default'
              '2 X 20 chars')
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Barcode Scanner'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object CheckBox10: TCheckBox
            Left = 6
            Top = 8
            Width = 347
            Height = 17
            Caption = 'Barcode Scanner Connected'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox2Click
          end
        end
        object TSWeightDish: TTabSheet
          Caption = 'weight dish'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label32: TLabel
            Left = 8
            Top = 32
            Width = 42
            Height = 13
            Caption = 'Com port'
          end
          object Label33: TLabel
            Left = 8
            Top = 88
            Width = 140
            Height = 13
            Caption = 'Return value from weight dish'
          end
          object CBWeightDishConnected: TCheckBox
            Left = 8
            Top = 8
            Width = 161
            Height = 17
            Caption = 'Weight dish connected'
            TabOrder = 0
          end
          object CBWeightDishCom: TComboBox
            Left = 8
            Top = 48
            Width = 145
            Height = 21
            ItemIndex = 0
            TabOrder = 1
            Text = 'COM1'
            Items.Strings = (
              'COM1'
              'COM2'
              'COM3')
          end
          object EWeightDishResult: TEdit
            Left = 8
            Top = 104
            Width = 145
            Height = 21
            TabOrder = 2
          end
          object BWeightDishtest: TButton
            Left = 153
            Top = 104
            Width = 75
            Height = 22
            Caption = 'Test'
            TabOrder = 3
            OnClick = BWeightDishtestClick
          end
        end
      end
    end
    object tab4: TTabSheet
      Caption = 'tab4'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label37: TLabel
        Left = 8
        Top = 120
        Width = 48
        Height = 13
        Caption = 'Layout file'
      end
      object Button2: TButton
        Left = 4
        Top = 341
        Width = 101
        Height = 25
        Caption = '&Test Printers'
        TabOrder = 0
        OnClick = Button2Click
      end
      object GroupBox9: TGroupBox
        Left = 2
        Top = -1
        Width = 479
        Height = 70
        Caption = 'Printers'
        TabOrder = 1
        object CheckBox6: TCheckBox
          Left = 10
          Top = 16
          Width = 199
          Height = 17
          Caption = 'Use First Printer'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CheckBox7: TCheckBox
          Left = 228
          Top = 16
          Width = 205
          Height = 17
          Caption = 'Use Second Printer'
          TabOrder = 1
        end
        object cbPrinter1: TComboBox
          Left = 6
          Top = 38
          Width = 195
          Height = 21
          TabOrder = 2
        end
        object cbPrinter2: TComboBox
          Left = 226
          Top = 38
          Width = 207
          Height = 21
          TabOrder = 3
        end
      end
      object PageControl1: TPageControl
        Left = 0
        Top = 140
        Width = 481
        Height = 197
        ActivePage = TabSheet2
        TabOrder = 2
        object TabSheet1: TTabSheet
          Caption = 'First Printer'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label4: TLabel
            Left = 4
            Top = 8
            Width = 55
            Height = 13
            Caption = 'Paper Type'
          end
          object Label29: TLabel
            Left = 4
            Top = 61
            Width = 88
            Height = 13
            Caption = 'Bottom Feed Lines'
          end
          object Label34: TLabel
            Left = 9
            Top = 128
            Width = 88
            Height = 13
            Caption = 'Papercut / endline'
          end
          object cbTypePrint1: TComboBox
            Left = 4
            Top = 30
            Width = 151
            Height = 21
            TabOrder = 0
          end
          object seFeed1: TSpinEdit
            Left = 4
            Top = 76
            Width = 49
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object EPapercut1: TEdit
            Left = 8
            Top = 144
            Width = 457
            Height = 21
            TabOrder = 2
            Text = 'EPapercut1'
          end
          object cbForceCutprn1: TCheckBox
            Left = 8
            Top = 104
            Width = 97
            Height = 17
            Caption = 'Force cut'
            TabOrder = 3
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Second Printer'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label14: TLabel
            Left = 4
            Top = 8
            Width = 55
            Height = 13
            Caption = 'Paper Type'
          end
          object Label28: TLabel
            Left = 4
            Top = 61
            Width = 88
            Height = 13
            Caption = 'Bottom Feed Lines'
          end
          object Label36: TLabel
            Left = 9
            Top = 128
            Width = 88
            Height = 13
            Caption = 'Papercut / endline'
          end
          object cbTypePrint2: TComboBox
            Left = 4
            Top = 30
            Width = 151
            Height = 21
            TabOrder = 0
          end
          object seFeed2: TSpinEdit
            Left = 4
            Top = 76
            Width = 49
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object EPapercut2: TEdit
            Left = 8
            Top = 144
            Width = 457
            Height = 21
            TabOrder = 2
            Text = 'EPapercut1'
          end
          object cbForceCutprn2: TCheckBox
            Left = 8
            Top = 104
            Width = 97
            Height = 17
            Caption = 'Force cut'
            TabOrder = 3
          end
        end
      end
      object cbprnComf: TCheckBox
        Left = 10
        Top = 80
        Width = 255
        Height = 17
        Caption = 'Comfirm printing'
        TabOrder = 3
      end
      object CBUseinvoice: TCheckBox
        Left = 10
        Top = 97
        Width = 255
        Height = 17
        Caption = 'Use invoice print'
        TabOrder = 4
      end
      object docLayout: TComboBox
        Left = 112
        Top = 115
        Width = 185
        Height = 21
        TabOrder = 5
        Text = 'docLayout'
      end
      object cbShoPReview: TCheckBox
        Left = 272
        Top = 96
        Width = 221
        Height = 17
        Caption = 'Show preview'
        TabOrder = 6
      end
    end
    object tab5: TTabSheet
      Caption = 'tab5'
      ImageIndex = 4
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label5: TLabel
        Left = 78
        Top = 70
        Width = 61
        Height = 13
        Caption = 'Input Screen'
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 538
    Width = 642
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      642
      34)
    object BtnOk: TBitBtn
      Left = 436
      Top = 2
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Ok'
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
      Left = 538
      Top = 2
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      DoubleBuffered = True
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
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnCancelClick
    end
  end
end
