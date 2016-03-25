object fmDebtor: TfmDebtor
  Left = 38
  Top = 139
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Debtor Accounts'
  ClientHeight = 589
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label24: TLabel
    Left = 453
    Top = 83
    Width = 17
    Height = 13
    Alignment = taRightJustify
    Caption = 'BIC'
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 1008
    Height = 589
    Align = alClient
    TabOrder = 0
    object PEditButtons: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 585
      Align = alLeft
      TabOrder = 1
      object lLook: TLabel
        Left = 19
        Top = 368
        Width = 3
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object BNew: TBitBtn
        Left = 13
        Top = 24
        Width = 119
        Height = 25
        Caption = 'New'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BNewClick
      end
      object BDelete: TBitBtn
        Left = 13
        Top = 56
        Width = 119
        Height = 25
        Caption = 'Delete'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BDeleteClick
      end
      object BEdit: TBitBtn
        Left = 13
        Top = 88
        Width = 119
        Height = 25
        Caption = 'Edit'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BEditClick
      end
      object BSave: TBitBtn
        Left = 13
        Top = 120
        Width = 119
        Height = 25
        Caption = 'Save'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = btnOkClick
      end
      object BCancel: TBitBtn
        Left = 13
        Top = 152
        Width = 119
        Height = 25
        Caption = 'Cancel'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 4
        OnClick = BSearchClick
      end
      object BtnOpen: TBitBtn
        Left = 13
        Top = 184
        Width = 119
        Height = 25
        Caption = 'Open'
        DoubleBuffered = True
        NumGlyphs = 2
        ParentDoubleBuffered = False
        TabOrder = 5
        Visible = False
        OnClick = BtnOpenClick
      end
      object BExport: TBitBtn
        Left = 16
        Top = 264
        Width = 113
        Height = 25
        Caption = 'Export'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 6
        OnClick = BExportClick
      end
    end
    object Notebook1: TNotebook
      Left = 153
      Top = 0
      Width = 851
      Height = 585
      Align = alClient
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Edit'
        object pgconDebtor: TPageControl
          Left = 0
          Top = 249
          Width = 851
          Height = 305
          ActivePage = tSACCOUNT
          Align = alClient
          TabOrder = 1
          OnChange = pgconDebtorChange
          object tsStatement: TTabSheet
            Caption = 'Statements'
            object Label9: TLabel
              Left = 32
              Top = 19
              Width = 78
              Height = 13
              Alignment = taRightJustify
              Caption = 'Delivery address'
            end
            object Label10: TLabel
              Left = 57
              Top = 43
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Postalcode'
            end
            object Label3: TLabel
              Left = 74
              Top = 115
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Country'
            end
            object LEFreeField1: TLabel
              Left = 61
              Top = 195
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Free field1'
            end
            object LEFreeField2: TLabel
              Left = 61
              Top = 219
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Free field2'
            end
            object LEFreeField3: TLabel
              Left = 61
              Top = 243
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Free field3'
            end
            object Shape2: TShape
              Left = 22
              Top = 153
              Width = 665
              Height = 1
            end
            object LMEssage: TLabel
              Left = 67
              Top = 170
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Message'
            end
            object LInvLayout: TLabel
              Left = 380
              Top = 19
              Width = 66
              Height = 13
              Caption = 'Invoice layout'
            end
            object LCreditLayout: TLabel
              Left = 380
              Top = 43
              Width = 79
              Height = 13
              Caption = 'Creditnota layout'
            end
            object LQuoteLayout: TLabel
              Left = 380
              Top = 67
              Width = 60
              Height = 13
              Caption = 'Quote layout'
            end
            object LDCity: TLabel
              Left = 93
              Top = 67
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'City'
            end
            object LDState: TLabel
              Left = 83
              Top = 91
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'State'
            end
            object Label1: TLabel
              Left = 380
              Top = 115
              Width = 103
              Height = 13
              Caption = 'Send documents type'
            end
            object edtDelAddress1: TcxTextEdit
              Left = 120
              Top = 16
              TabOrder = 0
              OnDblClick = edtDelAddress1DblClick
              OnKeyPress = FormKeyPress
              Width = 169
            end
            object edtDelAddress2: TcxTextEdit
              Left = 120
              Top = 64
              TabOrder = 2
              OnKeyPress = FormKeyPress
              Width = 169
            end
            object edtDelAddress3: TcxTextEdit
              Left = 120
              Top = 88
              TabOrder = 3
              OnKeyPress = FormKeyPress
              Width = 169
            end
            object edtStateMessage: TcxTextEdit
              Left = 120
              Top = 167
              TabOrder = 5
              Width = 307
            end
            object CBDelCountry: TComboBox
              Left = 120
              Top = 112
              Width = 171
              Height = 21
              Style = csDropDownList
              TabOrder = 4
            end
            object EFreeField1: TcxTextEdit
              Left = 120
              Top = 192
              TabOrder = 6
              Width = 307
            end
            object EFreeField2: TcxTextEdit
              Left = 120
              Top = 216
              TabOrder = 7
              Width = 307
            end
            object EFreeField3: TcxTextEdit
              Left = 120
              Top = 240
              TabOrder = 8
              OnKeyPress = FormKeyPress
              Width = 307
            end
            object eDelCode: TcxTextEdit
              Left = 120
              Top = 40
              TabOrder = 1
              Width = 169
            end
            object CBdocLayoutInv: TComboBox
              Left = 488
              Top = 15
              Width = 173
              Height = 21
              Style = csDropDownList
              TabOrder = 9
            end
            object CBdocLayoutCreditNote: TComboBox
              Left = 488
              Top = 43
              Width = 173
              Height = 21
              Style = csDropDownList
              TabOrder = 10
            end
            object CBdocLayoutQuote: TComboBox
              Left = 488
              Top = 71
              Width = 173
              Height = 21
              Style = csDropDownList
              TabOrder = 11
            end
            object cbTransmissionType: TComboBox
              Left = 489
              Top = 111
              Width = 173
              Height = 21
              Style = csDropDownList
              TabOrder = 12
              Items.Strings = (
                'Print document'
                'Print document and send email'
                'Send email')
            end
          end
          object tSACCOUNT: TTabSheet
            Caption = 'Accounting Information'
            object Label13: TLabel
              Left = 76
              Top = 83
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Credit Limit'
            end
            object Label14: TLabel
              Left = 54
              Top = 107
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Charge Amount'
            end
            object Label16: TLabel
              Left = 38
              Top = 128
              Width = 89
              Height = 13
              Alignment = taRightJustify
              Caption = 'Customer Discount'
            end
            object Label17: TLabel
              Left = 185
              Top = 128
              Width = 8
              Height = 13
              Caption = '%'
            end
            object Label18: TLabel
              Left = 34
              Top = 155
              Width = 93
              Height = 26
              Alignment = taRightJustify
              Caption = 'Monthly Interest on overdue amounts'
              WordWrap = True
            end
            object Label19: TLabel
              Left = 185
              Top = 167
              Width = 8
              Height = 13
              Caption = '%'
            end
            object Label20: TLabel
              Left = 69
              Top = 195
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Selling Price'
            end
            object LBankAccountNR: TLabel
              Left = 391
              Top = 34
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bank account nr'
            end
            object LBankAccountType: TLabel
              Left = 380
              Top = 10
              Width = 90
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bank account type'
            end
            object LcbOpenItem: TLabel
              Left = 35
              Top = 34
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Open Item Account'
            end
            object LcbDisabled: TLabel
              Left = 43
              Top = 10
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Account Disabled'
            end
            object LDueDays: TLabel
              Left = 82
              Top = 58
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Due days'
            end
            object LEUseDefaultAccount: TLabel
              Left = 502
              Top = 155
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Default account'
              Visible = False
            end
            object LCBUseDefaultAccount: TLabel
              Left = 374
              Top = 171
              Width = 96
              Height = 13
              Alignment = taRightJustify
              Caption = 'Use default account'
            end
            object LCBUseDefaultTax: TLabel
              Left = 399
              Top = 209
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Use default tax'
            end
            object LEUseDefaultTax: TLabel
              Left = 500
              Top = 192
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Default tax'
              Visible = False
            end
            object LBankName: TLabel
              Left = 416
              Top = 58
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bank name'
            end
            object LMEssage2: TLabel
              Left = 427
              Top = 238
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Message'
            end
            object Label23: TLabel
              Left = 453
              Top = 83
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'BIC'
            end
            object Label25: TLabel
              Left = 445
              Top = 110
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'IBAN'
            end
            object Label26: TLabel
              Left = 660
              Top = 11
              Width = 43
              Height = 13
              Caption = 'signature'
            end
            object Label27: TLabel
              Left = 660
              Top = 57
              Width = 69
              Height = 13
              Caption = 'Signature date'
            end
            object cbDisabled: TCheckBox
              Left = 136
              Top = 8
              Width = 41
              Height = 17
              TabOrder = 0
              OnKeyPress = FormKeyPress
            end
            object cbOpenItem: TCheckBox
              Left = 136
              Top = 32
              Width = 49
              Height = 17
              TabOrder = 1
              OnKeyPress = FormKeyPress
            end
            object edtDiscount: TcxTextEdit
              Left = 136
              Top = 125
              TabOrder = 3
              OnExit = edtDiscountExit
              OnKeyPress = FormKeyPress
              Width = 41
            end
            object edtInterest: TcxTextEdit
              Left = 136
              Top = 163
              TabOrder = 4
              OnExit = edtInterestExit
              OnKeyPress = FormKeyPress
              Width = 41
            end
            object cbSellingPriceChoice: TComboBox
              Left = 136
              Top = 192
              Width = 129
              Height = 21
              TabOrder = 5
              Text = 'Selling Price1'
              OnKeyPress = FormKeyPress
              Items.Strings = (
                'Selling Price1'
                'Selling Price2'
                'Selling Price3')
            end
            object EBankAccountNr: TcxTextEdit
              Left = 476
              Top = 32
              TabOrder = 7
              OnExit = EBankAccountNrExit
              Width = 148
            end
            object CBAccountType: TComboBox
              Left = 476
              Top = 8
              Width = 148
              Height = 21
              ItemIndex = 0
              MaxLength = 10
              TabOrder = 6
              Text = '11 Proof'
              Items.Strings = (
                '11 Proof'
                'Arbitrair')
            end
            object EDueDays: TcxTextEdit
              Left = 136
              Top = 56
              TabOrder = 2
              OnKeyPress = FormKeyPress
              Width = 81
            end
            object EUseDefaultAccount: TcxTextEdit
              Left = 500
              Top = 168
              TabOrder = 11
              Visible = False
              OnEnter = EUseDefaultAccountEnter
              Width = 125
            end
            object CBUseDefaultAccount: TCheckBox
              Left = 476
              Top = 170
              Width = 21
              Height = 17
              TabOrder = 9
              OnClick = CBUseDefaultAccountClick
            end
            object CBUseDefaultTax: TCheckBox
              Left = 476
              Top = 206
              Width = 21
              Height = 17
              TabOrder = 10
              OnClick = CBUseDefaultTaxClick
            end
            object EUseDefaultTax: TcxTextEdit
              Left = 500
              Top = 206
              TabOrder = 12
              Visible = False
              OnEnter = EUseDefaultTaxEnter
              Width = 125
            end
            object EBankname: TcxTextEdit
              Left = 476
              Top = 56
              TabOrder = 8
              OnExit = EBankAccountNrExit
              Width = 148
            end
            object EBankname2: TcxTextEdit
              Left = 476
              Top = 80
              TabOrder = 13
              OnExit = EBankAccountNrExit
              Width = 148
            end
            object edtStateMessage2: TcxTextEdit
              Left = 476
              Top = 235
              TabOrder = 14
              Width = 185
            end
            object edtCredLimit: TcxCalcEdit
              Left = 136
              Top = 80
              EditValue = 0.000000000000000000
              TabOrder = 15
              OnKeyPress = FormKeyPress
              Width = 97
            end
            object edtChargeAmount: TcxCalcEdit
              Left = 136
              Top = 104
              EditValue = 0.000000000000000000
              TabOrder = 16
              OnKeyPress = FormKeyPress
              Width = 97
            end
            object edSBANKACCOUNTNAME: TcxTextEdit
              Left = 476
              Top = 107
              TabOrder = 17
              OnExit = EBankAccountNrExit
              Width = 148
            end
            object sigtext: TcxTextEdit
              Left = 660
              Top = 30
              TabOrder = 18
              OnExit = EBankAccountNrExit
              Width = 148
            end
            object sigdate: TcxDateEdit
              Left = 660
              Top = 76
              TabOrder = 19
              Width = 149
            end
          end
          object TSContacts: TTabSheet
            Caption = 'Contacts'
            ImageIndex = 3
            object cxGrid7: TcxGrid
              Left = 0
              Top = 49
              Width = 843
              Height = 228
              Align = alClient
              TabOrder = 0
              object cxGrid7DBTableView1: TcxGridDBTableView
                OnDblClick = BCEditClick
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = DSContactLink
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Appending = True
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid7DBTableView1FIRSTNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'FIRSTNAME'
                  Width = 120
                end
                object cxGrid7DBTableView1LASTNAME: TcxGridDBColumn
                  DataBinding.FieldName = 'LASTNAME'
                  Width = 119
                end
                object cxGrid7DBTableView1TITLE: TcxGridDBColumn
                  DataBinding.FieldName = 'TITLE'
                  Width = 84
                end
                object cxGrid7DBTableView1ADDRESS: TcxGridDBColumn
                  DataBinding.FieldName = 'ADDRESS'
                  Width = 97
                end
                object cxGrid7DBTableView1CITY: TcxGridDBColumn
                  DataBinding.FieldName = 'CITY'
                  Width = 131
                end
                object cxGrid7DBTableView1STATE: TcxGridDBColumn
                  DataBinding.FieldName = 'STATE'
                end
                object cxGrid7DBTableView1PHONE1: TcxGridDBColumn
                  DataBinding.FieldName = 'PHONE1'
                end
                object cxGrid7DBTableView1PHONE2: TcxGridDBColumn
                  DataBinding.FieldName = 'PHONE2'
                end
                object cxGrid7DBTableView1PHONE3: TcxGridDBColumn
                  DataBinding.FieldName = 'PHONE3'
                end
                object cxGrid7DBTableView1EMAIL: TcxGridDBColumn
                  DataBinding.FieldName = 'EMAIL'
                end
              end
              object cxGrid7Level1: TcxGridLevel
                GridView = cxGrid7DBTableView1
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 843
              Height = 49
              Align = alTop
              TabOrder = 1
              object BCAdd: TBitBtn
                Left = 10
                Top = 10
                Width = 96
                Height = 25
                Caption = 'Add'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = BCAddClick
              end
              object BCEdit: TBitBtn
                Left = 114
                Top = 10
                Width = 96
                Height = 25
                Caption = 'Edit'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = BCEditClick
              end
              object BCDelete: TBitBtn
                Left = 220
                Top = 10
                Width = 96
                Height = 25
                Caption = 'Delete'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 2
                OnClick = BCDeleteClick
              end
              object BCFind: TBitBtn
                Left = 324
                Top = 10
                Width = 96
                Height = 25
                Caption = 'Find'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 3
                OnClick = BCAddClick
              end
              object CBAutoCopyContactInfo: TCheckBox
                Left = 464
                Top = 16
                Width = 121
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Auto copy info'
                TabOrder = 4
              end
            end
          end
          object TSAppointments: TTabSheet
            Caption = 'Appointments'
            ImageIndex = 4
            object cxGrid2: TcxGrid
              Left = 0
              Top = 0
              Width = 843
              Height = 277
              Align = alClient
              TabOrder = 0
              object cxGrid2DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                OnCustomDrawCell = cxGrid2DBTableView1CustomDrawCell
                DataController.DataSource = DSAppointments
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'STARTTIME'
                    Column = cxGrid2DBTableView1STARTTIME
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'STARTTIME'
                    Column = cxGrid2DBTableView1STARTTIME
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.Footer = True
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid2DBTableView1STARTTIME: TcxGridDBColumn
                  DataBinding.FieldName = 'STARTTIME'
                  DateTimeGrouping = dtgByMonth
                end
                object cxGrid2DBTableView1ENDTIME: TcxGridDBColumn
                  DataBinding.FieldName = 'ENDTIME'
                  DateTimeGrouping = dtgByDate
                end
                object cxGrid2DBTableView1DESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'DESCRIPTION'
                  Width = 194
                end
                object cxGrid2DBTableView1NOTES: TcxGridDBColumn
                  DataBinding.FieldName = 'NOTES'
                  Width = 262
                end
                object cxGrid2DBTableView1USERFIELD0: TcxGridDBColumn
                  DataBinding.FieldName = 'USERFIELD0'
                  Width = 164
                end
                object cxGrid2DBTableView1USERFIELD5: TcxGridDBColumn
                  DataBinding.FieldName = 'USERFIELD5'
                  Width = 231
                end
                object cxGrid2DBTableView1CATEGORY: TcxGridDBColumn
                  DataBinding.FieldName = 'CATEGORY'
                  Visible = False
                  VisibleForCustomization = False
                end
              end
              object cxGrid2Level1: TcxGridLevel
                GridView = cxGrid2DBTableView1
              end
            end
          end
          object TSInvoicesQuotes: TTabSheet
            Caption = 'Documents'
            ImageIndex = 5
            object Panel7: TPanel
              Left = 686
              Top = 0
              Width = 157
              Height = 277
              Align = alRight
              TabOrder = 0
              DesignSize = (
                157
                277)
              object lblCopies: TLabel
                Left = 88
                Top = 127
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Anchors = [akTop, akRight]
                Caption = 'Copies :'
                Color = clBlue
                FocusControl = edtCount
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBtnText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
                Visible = False
              end
              object DestLbl: TLabel
                Left = 11
                Top = 79
                Width = 74
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Send report To:'
                Color = clBlue
                FocusControl = cbDestination
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBtnText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object lblPrnType: TLabel
                Left = 11
                Top = 34
                Width = 48
                Height = 13
                Anchors = [akTop, akRight]
                Caption = 'Type Print'
                Color = clBlue
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBtnText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
                Transparent = True
              end
              object UpDown1: TUpDown
                Left = 75
                Top = 144
                Width = 15
                Height = 24
                Anchors = [akTop, akRight]
                Enabled = False
                Min = 1
                Max = 32767
                Position = 1
                TabOrder = 0
                Visible = False
              end
              object edtCount: TcxTextEdit
                Left = 90
                Top = 145
                Anchors = [akTop, akRight]
                Enabled = False
                TabOrder = 1
                Text = '1'
                Visible = False
                Width = 36
              end
              object cbDestination: TComboBox
                Left = 11
                Top = 97
                Width = 133
                Height = 21
                Style = csDropDownList
                Anchors = [akTop, akRight]
                TabOrder = 2
                Items.Strings = (
                  'Screen'
                  'Printer'
                  'File'
                  'E-mail')
              end
              object CBDocLayout: TComboBox
                Left = 11
                Top = 52
                Width = 133
                Height = 21
                Style = csDropDownList
                Anchors = [akTop, akRight]
                TabOrder = 3
              end
              object BPrint: TBitBtn
                Left = 11
                Top = 6
                Width = 133
                Height = 26
                Anchors = [akTop, akRight]
                Caption = 'Print'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 4
                OnClick = BPrintClick
              end
            end
            object cxGrid3: TcxGrid
              Left = 0
              Top = 0
              Width = 686
              Height = 277
              Align = alClient
              TabOrder = 1
              object cxGrid3DBTableView1: TcxGridDBTableView
                PopupMenu = dmToonTransact
                OnDblClick = BPrintClick
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = DSDocuments
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'SDOCNO'
                    Column = cxGrid3DBTableView1SDOCNO
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FDOCAMOUNT'
                    Column = cxGrid3DBTableView1FDOCAMOUNT
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'SDOCNO'
                    Column = cxGrid3DBTableView1SDOCNO
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FDOCAMOUNT'
                    Column = cxGrid3DBTableView1FDOCAMOUNT
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.ImmediateEditor = False
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsSelection.CellSelect = False
                OptionsView.Footer = True
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid3DBTableView1SDOCNO: TcxGridDBColumn
                  DataBinding.FieldName = 'SDOCNO'
                end
                object cxGrid3DBTableView1DDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DDATE'
                  DateTimeGrouping = dtgByMonth
                end
                object cxGrid3DBTableView1SDESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'SDESCRIPTION'
                  Width = 105
                end
                object cxGrid3DBTableView1BPRINTED: TcxGridDBColumn
                  DataBinding.FieldName = 'BPRINTED'
                  Width = 91
                end
                object cxGrid3DBTableView1FDOCAMOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FDOCAMOUNT'
                  Width = 101
                end
                object cxGrid3DBTableView1SREFERENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SREFERENCE'
                  Width = 234
                end
              end
              object cxGrid3Level1: TcxGridLevel
                GridView = cxGrid3DBTableView1
              end
            end
          end
          object TSTransactions: TTabSheet
            Caption = 'Transactions'
            ImageIndex = 6
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 843
              Height = 33
              Align = alTop
              TabOrder = 0
              object bShowTrans: TBitBtn
                Left = 568
                Top = 4
                Width = 97
                Height = 25
                Caption = 'Show transactions'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = bShowTransClick
              end
              object cbAlltrans: TCheckBox
                Left = 12
                Top = 8
                Width = 97
                Height = 17
                Caption = 'All'
                TabOrder = 1
                OnClick = cbAlltransClick
              end
            end
            object Panel2: TPanel
              Left = 0
              Top = 33
              Width = 843
              Height = 244
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Panel3: TPanel
                Left = 0
                Top = 98
                Width = 843
                Height = 146
                Align = alBottom
                TabOrder = 0
                object LCredit: TLabel
                  Left = 1
                  Top = 1
                  Width = 841
                  Height = 13
                  Align = alTop
                  Caption = 'Credit'
                  ExplicitWidth = 27
                end
                object cxGrid6: TcxGrid
                  Left = 1
                  Top = 14
                  Width = 841
                  Height = 131
                  Align = alClient
                  TabOrder = 0
                  object cxGrid6DBTableView1: TcxGridDBTableView
                    PopupMenu = dmToonTransact
                    NavigatorButtons.ConfirmDelete = False
                    DataController.DataSource = wwdsOpenCredits
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FAMOUNT'
                        Column = cxGrid6DBTableView1FAMOUNT
                      end
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FOUTSTANDINGAMOUNT'
                        Column = cxGrid6DBTableView1FOUTSTANDINGAMOUNT
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FOUTSTANDINGAMOUNT'
                        Column = cxGrid6DBTableView1FOUTSTANDINGAMOUNT
                      end
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FAMOUNT'
                        Column = cxGrid6DBTableView1FAMOUNT
                      end
                      item
                        Format = '0'
                        Kind = skCount
                        FieldName = 'SREFERENCE'
                        Column = cxGrid6DBTableView1SREFERENCE
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.Footer = True
                    Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                    object cxGrid6DBTableView1SREFERENCE: TcxGridDBColumn
                      DataBinding.FieldName = 'SREFERENCE'
                    end
                    object cxGrid6DBTableView1SDESCRIPTION: TcxGridDBColumn
                      DataBinding.FieldName = 'SDESCRIPTION'
                    end
                    object cxGrid6DBTableView1DDATE: TcxGridDBColumn
                      DataBinding.FieldName = 'DDATE'
                      DateTimeGrouping = dtgByMonth
                    end
                    object cxGrid6DBTableView1FAMOUNT: TcxGridDBColumn
                      DataBinding.FieldName = 'FAMOUNT'
                    end
                    object cxGrid6DBTableView1FOUTSTANDINGAMOUNT: TcxGridDBColumn
                      DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
                    end
                  end
                  object cxGrid6Level1: TcxGridLevel
                    GridView = cxGrid6DBTableView1
                  end
                end
              end
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 843
                Height = 90
                Align = alClient
                TabOrder = 1
                object LDebit: TLabel
                  Left = 1
                  Top = 1
                  Width = 841
                  Height = 13
                  Align = alTop
                  Caption = 'Debit'
                  ExplicitWidth = 25
                end
                object cxGrid5: TcxGrid
                  Left = 1
                  Top = 14
                  Width = 841
                  Height = 75
                  Align = alClient
                  TabOrder = 0
                  object cxGrid5DBTableView1: TcxGridDBTableView
                    PopupMenu = dmToonTransact
                    NavigatorButtons.ConfirmDelete = False
                    DataController.DataSource = wwdsOpenDebits
                    DataController.Summary.DefaultGroupSummaryItems = <
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FAMOUNT'
                        Column = cxGrid5DBTableView1FAMOUNT
                      end
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FOUTSTANDINGAMOUNT'
                        Column = cxGrid5DBTableView1FOUTSTANDINGAMOUNT
                      end>
                    DataController.Summary.FooterSummaryItems = <
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FAMOUNT'
                        Column = cxGrid5DBTableView1FAMOUNT
                      end
                      item
                        Format = '0.00'
                        Kind = skSum
                        FieldName = 'FOUTSTANDINGAMOUNT'
                        Column = cxGrid5DBTableView1FOUTSTANDINGAMOUNT
                      end
                      item
                        Format = '0'
                        Kind = skCount
                        FieldName = 'SREFERENCE'
                        Column = cxGrid5DBTableView1SREFERENCE
                      end>
                    DataController.Summary.SummaryGroups = <>
                    OptionsData.Deleting = False
                    OptionsData.Editing = False
                    OptionsData.Inserting = False
                    OptionsView.Footer = True
                    Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                    object cxGrid5DBTableView1SREFERENCE: TcxGridDBColumn
                      DataBinding.FieldName = 'SREFERENCE'
                    end
                    object cxGrid5DBTableView1SDESCRIPTION: TcxGridDBColumn
                      DataBinding.FieldName = 'SDESCRIPTION'
                    end
                    object cxGrid5DBTableView1DDATE: TcxGridDBColumn
                      DataBinding.FieldName = 'DDATE'
                      DateTimeGrouping = dtgByMonth
                    end
                    object cxGrid5DBTableView1FAMOUNT: TcxGridDBColumn
                      DataBinding.FieldName = 'FAMOUNT'
                    end
                    object cxGrid5DBTableView1FOUTSTANDINGAMOUNT: TcxGridDBColumn
                      DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
                    end
                  end
                  object cxGrid5Level1: TcxGridLevel
                    GridView = cxGrid5DBTableView1
                  end
                end
              end
              object cxSplitter2: TcxSplitter
                Left = 0
                Top = 90
                Width = 843
                Height = 8
                HotZoneClassName = 'TcxXPTaskBarStyle'
                AlignSplitter = salBottom
                AutoSnap = True
                Control = Panel3
              end
            end
          end
          object tsBankAccounts: TTabSheet
            Caption = 'Bankaccounts'
            ImageIndex = 6
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 843
              Height = 41
              Align = alTop
              TabOrder = 0
              object bBankDelete: TBitBtn
                Left = 116
                Top = 10
                Width = 96
                Height = 25
                Caption = 'Delete'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 0
                OnClick = bBankDeleteClick
              end
              object BBankAdd: TBitBtn
                Left = 10
                Top = 10
                Width = 96
                Height = 25
                Caption = 'Add'
                DoubleBuffered = True
                ParentDoubleBuffered = False
                TabOrder = 1
                OnClick = BBankAddClick
              end
            end
            object cxGrid8: TcxGrid
              Left = 0
              Top = 41
              Width = 843
              Height = 236
              Align = alClient
              TabOrder = 1
              object cxGrid8DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = DSAccountRef
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsData.Deleting = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.GroupByBox = False
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid8DBTableView1WACCOUNTREFID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTREFID'
                  Visible = False
                  VisibleForCustomization = False
                end
                object cxGrid8DBTableView1SREFERENCE: TcxGridDBColumn
                  DataBinding.FieldName = 'SREFERENCE'
                end
                object cxGrid8DBTableView1WACCOUNTID: TcxGridDBColumn
                  DataBinding.FieldName = 'WACCOUNTID'
                  Visible = False
                  VisibleForCustomization = False
                end
              end
              object cxGrid8Level1: TcxGridLevel
                GridView = cxGrid8DBTableView1
              end
            end
          end
          object tsBackorder: TTabSheet
            Caption = 'Backorder'
            ImageIndex = 7
          end
          object tsStock: TTabSheet
            Caption = 'tsStock'
            ImageIndex = 8
            object cxGrid4: TcxGrid
              Left = 0
              Top = 0
              Width = 843
              Height = 277
              Align = alClient
              TabOrder = 0
              object cxGrid4DBTableView1: TcxGridDBTableView
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = dsDocs
                DataController.Summary.DefaultGroupSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid4DBTableView1DDATE
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FEXCLUSIVEAMT'
                    Column = cxGrid4DBTableView1FEXCLUSIVEAMT
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FQTYSHIPPED'
                    Column = cxGrid4DBTableView1FQTYSHIPPED
                  end>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = '0'
                    Kind = skCount
                    FieldName = 'DDATE'
                    Column = cxGrid4DBTableView1DDATE
                  end
                  item
                    Format = '0.00'
                    Kind = skSum
                    FieldName = 'FEXCLUSIVEAMT'
                    Column = cxGrid4DBTableView1FEXCLUSIVEAMT
                  end
                  item
                    Kind = skSum
                    FieldName = 'FQTYSHIPPED'
                    Column = cxGrid4DBTableView1FQTYSHIPPED
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.Deleting = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.Footer = True
                OptionsView.Indicator = True
                Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
                object cxGrid4DBTableView1DDATE: TcxGridDBColumn
                  DataBinding.FieldName = 'DDATE'
                  DateTimeGrouping = dtgByMonth
                end
                object cxGrid4DBTableView1FQTYSHIPPED: TcxGridDBColumn
                  DataBinding.FieldName = 'FQTYSHIPPED'
                end
                object cxGrid4DBTableView1SDOCNO: TcxGridDBColumn
                  DataBinding.FieldName = 'SDOCNO'
                end
                object cxGrid4DBTableView1SDESCRIPTION: TcxGridDBColumn
                  DataBinding.FieldName = 'SDESCRIPTION'
                  Width = 185
                end
                object cxGrid4DBTableView1FSELLINGPRICE: TcxGridDBColumn
                  DataBinding.FieldName = 'FSELLINGPRICE'
                  Width = 97
                end
                object cxGrid4DBTableView1FITEMDISCOUNT: TcxGridDBColumn
                  DataBinding.FieldName = 'FITEMDISCOUNT'
                  Width = 112
                end
                object cxGrid4DBTableView1FEXCLUSIVEAMT: TcxGridDBColumn
                  DataBinding.FieldName = 'FEXCLUSIVEAMT'
                  Width = 90
                end
                object cxGrid4DBTableView1FINCLUSIVEAMT: TcxGridDBColumn
                  DataBinding.FieldName = 'FINCLUSIVEAMT'
                end
                object cxGrid4DBTableView1FUNITQTY: TcxGridDBColumn
                  DataBinding.FieldName = 'FUNITQTY'
                end
                object cxGrid4DBTableView1UNITDESC: TcxGridDBColumn
                  DataBinding.FieldName = 'UNITDESC'
                end
                object cxGrid4DBTableView1WTYPEID: TcxGridDBColumn
                  Caption = 'type'
                  DataBinding.FieldName = 'WTYPEID'
                end
                object cxGrid4DBTableView1BPOSTED: TcxGridDBColumn
                  Caption = 'posted'
                  DataBinding.FieldName = 'BPOSTED'
                end
                object cxGrid4DBTableView1SSTOCKCODE: TcxGridDBColumn
                  DataBinding.FieldName = 'SSTOCKCODE'
                end
                object cxGrid4DBTableView1STOCKDESC: TcxGridDBColumn
                  DataBinding.FieldName = 'STOCKDESC'
                  Width = 122
                end
              end
              object cxGrid4Level1: TcxGridLevel
                GridView = cxGrid4DBTableView1
              end
            end
          end
        end
        object PBtn2: TPanel
          Left = 0
          Top = 554
          Width = 851
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object PRgtBtn2: TPanel
            Left = 634
            Top = 0
            Width = 217
            Height = 31
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object btnOk: TBitBtn
              Left = 2
              Top = 2
              Width = 96
              Height = 25
              Caption = 'OK'
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
              OnClick = btnOkClick
              OnKeyDown = FormKeyDown
              OnKeyPress = FormKeyPress
            end
            object BitBtnCancel: TBitBtn
              Left = 108
              Top = 2
              Width = 96
              Height = 25
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
              OnClick = BSearchClick
              OnKeyDown = FormKeyDown
              OnKeyPress = FormKeyPress
            end
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 851
          Height = 241
          Align = alTop
          ParentColor = True
          TabOrder = 0
          object LAccountCode: TLabel
            Left = 18
            Top = 11
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Account Number'
          end
          object Label2: TLabel
            Left = 68
            Top = 35
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Name'
          end
          object LAdress: TLabel
            Left = 58
            Top = 59
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Address'
          end
          object Label4: TLabel
            Left = 39
            Top = 83
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Postal Code'
          end
          object LCity: TLabel
            Left = 79
            Top = 107
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'City'
          end
          object LState: TLabel
            Left = 71
            Top = 131
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'State'
          end
          object LCountry: TLabel
            Left = 60
            Top = 155
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Country'
          end
          object Label5: TLabel
            Left = 396
            Top = 11
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Phone 1'
          end
          object Label6: TLabel
            Left = 396
            Top = 35
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Phone 2'
          end
          object Label7: TLabel
            Left = 420
            Top = 59
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fax'
          end
          object Label8: TLabel
            Left = 411
            Top = 107
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Email'
          end
          object Label11: TLabel
            Left = 28
            Top = 187
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contact Name'
          end
          object Label12: TLabel
            Left = 38
            Top = 211
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Salesperson'
          end
          object Label21: TLabel
            Left = 353
            Top = 187
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Reporting Group 1'
          end
          object Label22: TLabel
            Left = 353
            Top = 211
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Reporting Group 2'
          end
          object Label15: TLabel
            Left = 365
            Top = 131
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tax Reference'
          end
          object LECompanyRegnr: TLabel
            Left = 401
            Top = 155
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Reg no'
          end
          object Shape1: TShape
            Left = 23
            Top = 179
            Width = 665
            Height = 1
          end
          object LLanguage: TLabel
            Left = 608
            Top = 187
            Width = 48
            Height = 13
            Caption = 'Language'
          end
          object lwebsite: TLabel
            Left = 397
            Top = 83
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Website'
          end
          object edtAccountNumber: TcxTextEdit
            Left = 104
            Top = 8
            Enabled = False
            Properties.CharCase = ecUpperCase
            StyleDisabled.Color = clInactiveCaption
            StyleDisabled.TextColor = clInactiveCaptionText
            StyleFocused.Color = clHighlight
            StyleFocused.TextColor = clHighlightText
            TabOrder = 0
            OnExit = edtAccountNumberExit
            OnKeyPress = FormKeyPress
            Width = 153
          end
          object edtName: TcxTextEdit
            Left = 104
            Top = 32
            TabOrder = 1
            OnEnter = edtNameEnter
            OnKeyPress = FormKeyPress
            Width = 153
          end
          object edtAddress1: TcxTextEdit
            Left = 104
            Top = 56
            TabOrder = 2
            OnKeyPress = FormKeyPress
            Width = 153
          end
          object edtPCode: TcxTextEdit
            Left = 104
            Top = 80
            TabOrder = 3
            OnKeyPress = FormKeyPress
            Width = 153
          end
          object edtAddress2: TcxTextEdit
            Left = 104
            Top = 104
            TabOrder = 4
            OnKeyPress = FormKeyPress
            Width = 153
          end
          object edtAddress3: TcxTextEdit
            Left = 104
            Top = 128
            TabOrder = 5
            OnKeyPress = FormKeyPress
            Width = 153
          end
          object CBCountry: TComboBox
            Left = 104
            Top = 152
            Width = 153
            Height = 21
            Style = csDropDownList
            TabOrder = 6
          end
          object edtFax: TcxTextEdit
            Left = 444
            Top = 56
            TabOrder = 9
            OnKeyPress = FormKeyPress
            Width = 199
          end
          object edtPhone2: TcxTextEdit
            Left = 444
            Top = 32
            TabOrder = 8
            OnKeyPress = FormKeyPress
            Width = 199
          end
          object edtPhone1: TcxTextEdit
            Left = 444
            Top = 8
            TabOrder = 7
            OnKeyPress = FormKeyPress
            Width = 199
          end
          object edtEmail: TcxTextEdit
            Left = 444
            Top = 104
            TabOrder = 10
            OnDblClick = edtEmailDblClick
            Width = 199
          end
          object edtContact: TComboBox
            Left = 104
            Top = 184
            Width = 154
            Height = 21
            Style = csDropDownList
            TabOrder = 13
            OnKeyPress = edtContactKeyPress
          end
          object edtSalesPerson: TComboBox
            Left = 104
            Top = 208
            Width = 154
            Height = 21
            Style = csDropDownList
            TabOrder = 14
            OnKeyPress = edtSalespersonKeyPress
          end
          object CbxRepGroup1: TComboBox
            Left = 448
            Top = 184
            Width = 155
            Height = 21
            AutoDropDown = True
            Style = csDropDownList
            TabOrder = 15
            OnCloseUp = CbxRepGroup1CloseUp
            OnDropDown = CbxRepGroup1DropDown
            OnKeyDown = FormKeyDown
            OnKeyPress = FormKeyPress
          end
          object CbxRepGroup2: TComboBox
            Left = 448
            Top = 208
            Width = 155
            Height = 21
            AutoDropDown = True
            Style = csDropDownList
            TabOrder = 16
            OnCloseUp = CbxRepGroup1CloseUp
            OnDropDown = CbxRepGroup1DropDown
            OnKeyDown = FormKeyDown
            OnKeyPress = FormKeyPress
          end
          object edtReference: TcxTextEdit
            Left = 444
            Top = 128
            TabOrder = 11
            OnKeyPress = FormKeyPress
            Width = 199
          end
          object ECompanyRegnr: TcxTextEdit
            Left = 444
            Top = 152
            TabOrder = 12
            OnKeyPress = FormKeyPress
            Width = 199
          end
          object cbOsfLanguage: TComboBox
            Left = 608
            Top = 208
            Width = 134
            Height = 21
            Style = csDropDownList
            TabOrder = 17
            OnKeyPress = edtSalespersonKeyPress
          end
          object BLookupPostal: TBitBtn
            Left = 262
            Top = 80
            Width = 31
            Height = 21
            Caption = '<-'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 18
            OnClick = BLookupPostalClick
          end
          object EWebsite: TcxTextEdit
            Left = 444
            Top = 80
            TabOrder = 19
            OnDblClick = EWebsiteDblClick
            Width = 199
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 0
          Top = 241
          Width = 851
          Height = 8
          HotZoneClassName = 'TcxXPTaskBarStyle'
          AlignSplitter = salTop
          AutoSnap = True
          Control = Panel5
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'List'
        object ButtonPanel: TPanel
          Left = 0
          Top = 548
          Width = 851
          Height = 37
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object PRightBtn: TPanel
            Left = 607
            Top = 0
            Width = 244
            Height = 37
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object BTBOk: TBitBtn
              Left = 34
              Top = 5
              Width = 96
              Height = 25
              Caption = 'OK'
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
              ModalResult = 1
              ParentDoubleBuffered = False
              TabOrder = 0
              Visible = False
              OnClick = BTBOkClick
              OnKeyDown = FormKeyDown
              OnKeyPress = FormKeyPress
            end
            object BtnCancel: TBitBtn
              Left = 140
              Top = 5
              Width = 96
              Height = 25
              Cancel = True
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
              ModalResult = 2
              ParentDoubleBuffered = False
              TabOrder = 1
              OnKeyDown = FormKeyDown
              OnKeyPress = FormKeyPress
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 851
          Height = 57
          Align = alTop
          TabOrder = 1
          object Value: TLabel
            Left = 259
            Top = 8
            Width = 27
            Height = 13
            Caption = 'Value'
          end
          object Filter: TLabel
            Left = 3
            Top = 8
            Width = 59
            Height = 13
            Caption = 'Filter column'
          end
          object BClearFilter: TBitBtn
            Left = 474
            Top = 22
            Width = 75
            Height = 23
            Caption = 'Clear'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = BClearFilterClick
          end
          object BFilter2: TBitBtn
            Left = 394
            Top = 22
            Width = 75
            Height = 23
            Caption = 'Filter'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 1
            OnClick = BFilter2Click
          end
          object EFilterValue: TcxTextEdit
            Left = 259
            Top = 24
            Properties.CharCase = ecUpperCase
            TabOrder = 2
            OnKeyPress = FormKeyPress
            OnKeyUp = FormKeyUp
            Width = 129
          end
          object CBOperatot: TComboBox
            Left = 155
            Top = 24
            Width = 57
            Height = 21
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 3
            Text = 'Like'
            Items.Strings = (
              'Like'
              '='
              '<'
              '>'
              '<='
              '>='
              '<>')
          end
          object CBFindColumn: TComboBox
            Left = 3
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            TabOrder = 4
          end
          object cbShowInactive: TCheckBox
            Left = 568
            Top = 26
            Width = 97
            Height = 17
            Caption = 'Show inactive'
            TabOrder = 5
          end
        end
        object cxGrid1: TcxGrid
          Left = 0
          Top = 57
          Width = 851
          Height = 491
          Align = alClient
          BorderWidth = 3
          TabOrder = 2
          object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
            PopupMenu = pmDocument
            OnDblClick = BEditClick
            OnKeyDown = DBGSearchKeyDown
            OnKeyPress = DBGSearchKeyPress
            NavigatorButtons.ConfirmDelete = False
            OnCustomDrawCell = cxGrid1DBBandedTableView1CustomDrawCell
            DataController.DataSource = DSDebtorCreditor
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Format = '0'
                Kind = skCount
                FieldName = 'SACCOUNTCODE'
                Column = cxGrid1DBBandedTableView1SACCOUNTCODE
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0'
                Kind = skCount
                FieldName = 'SACCOUNTCODE'
                Column = cxGrid1DBBandedTableView1SACCOUNTCODE
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.DragDropText = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsCustomize.DataRowSizing = True
            OptionsCustomize.GroupRowSizing = True
            OptionsCustomize.BandsQuickCustomization = True
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.MultiSelect = True
            OptionsView.ShowEditButtons = gsebForFocusedRecord
            OptionsView.Footer = True
            OptionsView.FooterMultiSummaries = True
            OptionsView.GroupFooterMultiSummaries = True
            OptionsView.GroupFooters = gfAlwaysVisible
            OptionsView.Indicator = True
            Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
            Bands = <
              item
                FixedKind = fkLeft
                Width = 349
              end
              item
              end>
            object cxGrid1DBBandedTableView1SDescription: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDescription'
              Width = 199
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SACCOUNTCODE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SACCOUNTCODE'
              Options.Grouping = False
              Width = 141
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SPostal1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SPostal1'
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SPostal2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SPostal2'
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SPostal3: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SPostal3'
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SPostalCode: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SPostalCode'
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1STelephone1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'STelephone1'
              Position.BandIndex = 1
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1STelephone2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'STelephone2'
              Position.BandIndex = 1
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SFax: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SFax'
              Position.BandIndex = 1
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SEmail: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SEmail'
              Position.BandIndex = 1
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SBranchCode: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SBranchCode'
              Position.BandIndex = 1
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SBankAccountNumber: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SBankAccountNumber'
              Position.BandIndex = 1
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1DLastActivity: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DLastActivity'
              Position.BandIndex = 1
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SReference: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SReference'
              Position.BandIndex = 1
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WDueDays: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WDueDays'
              Position.BandIndex = 1
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WAccountID: TcxGridDBBandedColumn
              Caption = 'AccountID'
              DataBinding.FieldName = 'WAccountID'
              Width = 140
              Position.BandIndex = 1
              Position.ColIndex = 13
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1LastName: TcxGridDBBandedColumn
              DataBinding.FieldName = 'LastName'
              Position.BandIndex = 1
              Position.ColIndex = 14
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1GroupDesc1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GroupDesc1'
              Options.CellMerging = True
              Position.BandIndex = 1
              Position.ColIndex = 15
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1GroupSort1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GroupSort1'
              Options.CellMerging = True
              Position.BandIndex = 1
              Position.ColIndex = 16
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1GroupDesc2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GroupDesc2'
              Options.CellMerging = True
              Position.BandIndex = 1
              Position.ColIndex = 17
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1GroupSort2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GroupSort2'
              Options.CellMerging = True
              Position.BandIndex = 1
              Position.ColIndex = 18
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WCOLOR: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WCOLOR'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 19
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WTEXTCOLOR: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WTEXTCOLOR'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 20
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SDELIVERY1: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDELIVERY1'
              Position.BandIndex = 1
              Position.ColIndex = 21
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SDELIVERY2: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDELIVERY2'
              Position.BandIndex = 1
              Position.ColIndex = 22
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SDELIVERY3: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDELIVERY3'
              Position.BandIndex = 1
              Position.ColIndex = 23
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1SDELIVERYCODE: TcxGridDBBandedColumn
              DataBinding.FieldName = 'SDELIVERYCODE'
              Position.BandIndex = 1
              Position.ColIndex = 24
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1DELCOUNTRY: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DELCOUNTRY'
              Options.CellMerging = True
              Position.BandIndex = 1
              Position.ColIndex = 25
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1POSCOUNTRY: TcxGridDBBandedColumn
              DataBinding.FieldName = 'POSCOUNTRY'
              Options.CellMerging = True
              Position.BandIndex = 1
              Position.ColIndex = 26
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1FIRSTNAME: TcxGridDBBandedColumn
              DataBinding.FieldName = 'FIRSTNAME'
              Position.BandIndex = 1
              Position.ColIndex = 27
              Position.RowIndex = 0
            end
            object cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'WREPORTINGGROUP2ID'
              Visible = False
              VisibleForCustomization = False
              Position.BandIndex = 1
              Position.ColIndex = 28
              Position.RowIndex = 0
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBBandedTableView1
          end
        end
      end
    end
  end
  object DSContactLink: TDataSource
    DataSet = QadressPerAccount
    Left = 80
    Top = 440
  end
  object QDebtorCreditor: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'SELECT debtor.SDELIVERY1 ,debtor.SDELIVERY2,debtor.SDELIVERY3, d' +
        'ebtor.SDELIVERYCODE,dc.COUNTRIES_NAME delcountry,pc.COUNTRIES_NA' +
        'ME poscountry, account.SDescription, account.SAccountCode, SPost' +
        'al1, '
      '  SPostal2,SPostal3, SPostalCode, STelephone1, STelephone2, '
      '  SFax, SEmail, SBranchCode, SBankAccountNumber, '
      
        '  DLastActivity, SReference, WDueDays,account.WAccountID,firstna' +
        'me, LastName, Groups1.SDescription GroupDesc1,Groups1.WSortNo Gr' +
        'oupSort1, Groups2.SDescription GroupDesc2, Groups2.WSortNo Group' +
        'Sort2'
      ',Groups1.WColor,Groups1.WTextColor,WReportingGroup2ID'
      ''
      ''
      ''
      
        '  FROM debtor JOIN account ON  (debtor.WAccountID = account.WAcc' +
        'ountID) left OUTER JOIN Contacts Contacts '
      '    ON  (debtor.WContactID = Contacts.RecordID) '
      
        '    left JOIN Groups Groups2 ON  (account.WReportingGroup2ID = G' +
        'roups2.WGroupID) '
      
        '    left JOIN Groups Groups1 ON  (account.WReportingGroup1ID = G' +
        'roups1.WGroupID) '
      
        '    left JOIN COUNTRIES pc on pc.COUNTRIES_ID = debtor.WPOSTCOUN' +
        'TRIES_ID'
      
        '    left JOIN COUNTRIES dc on dc.COUNTRIES_ID = debtor.WDELCOUNT' +
        'RIES_ID'
      '    where WAccountTypeId = 1   ')
    BeforeOpen = QDebtorCreditorBeforeOpen
    Left = 796
    Top = 60
    object QDebtorCreditorSDescription: TStringField
      FieldName = 'SDescription'
      Size = 35
    end
    object QDebtorCreditorSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object QDebtorCreditorSPostal1: TStringField
      FieldName = 'SPostal1'
      Size = 30
    end
    object QDebtorCreditorSPostal2: TStringField
      FieldName = 'SPostal2'
      Size = 30
    end
    object QDebtorCreditorSPostal3: TStringField
      FieldName = 'SPostal3'
      Size = 30
    end
    object QDebtorCreditorSPostalCode: TStringField
      FieldName = 'SPostalCode'
      Size = 8
    end
    object QDebtorCreditorSTelephone1: TStringField
      FieldName = 'STelephone1'
    end
    object QDebtorCreditorSTelephone2: TStringField
      FieldName = 'STelephone2'
    end
    object QDebtorCreditorSFax: TStringField
      FieldName = 'SFax'
    end
    object QDebtorCreditorSEmail: TStringField
      FieldName = 'SEmail'
      Size = 50
    end
    object QDebtorCreditorSBranchCode: TStringField
      FieldName = 'SBranchCode'
      Size = 10
    end
    object QDebtorCreditorSBankAccountNumber: TStringField
      FieldName = 'SBankAccountNumber'
    end
    object QDebtorCreditorSReference: TStringField
      FieldName = 'SReference'
      Size = 15
    end
    object QDebtorCreditorWDueDays: TIntegerField
      FieldName = 'WDueDays'
    end
    object QDebtorCreditorWAccountID: TIntegerField
      FieldName = 'WAccountID'
    end
    object QDebtorCreditorLastName: TStringField
      FieldName = 'LastName'
      Size = 50
    end
    object QDebtorCreditorGroupDesc1: TStringField
      FieldName = 'GroupDesc1'
      Size = 30
    end
    object QDebtorCreditorGroupSort1: TIntegerField
      FieldName = 'GroupSort1'
    end
    object QDebtorCreditorGroupDesc2: TStringField
      FieldName = 'GroupDesc2'
      Size = 30
    end
    object QDebtorCreditorGroupSort2: TIntegerField
      FieldName = 'GroupSort2'
    end
    object QDebtorCreditorWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object QDebtorCreditorWTEXTCOLOR: TIntegerField
      FieldName = 'WTEXTCOLOR'
    end
    object QDebtorCreditorSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object QDebtorCreditorSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object QDebtorCreditorSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object QDebtorCreditorSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object QDebtorCreditorDELCOUNTRY: TStringField
      FieldName = 'DELCOUNTRY'
      Origin = 'pc.COUNTRIES_NAME'
      Required = True
      Size = 64
    end
    object QDebtorCreditorPOSCOUNTRY: TStringField
      FieldName = 'POSCOUNTRY'
      Origin = 'dc.COUNTRIES_NAME'
      Required = True
      Size = 64
    end
    object QDebtorCreditorFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object QDebtorCreditorWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object QDebtorCreditorDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
  end
  object DSDebtorCreditor: TDataSource
    DataSet = QDebtorCreditor
    Left = 344
    Top = 552
  end
  object DSAppointments: TDataSource
    DataSet = QEvents
    Left = 320
    Top = 600
  end
  object DSDocuments: TDataSource
    DataSet = qryDocHead
    Left = 520
    Top = 532
  end
  object tblAccount: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from account where WAccountID = :WAccountID')
    UpdateObject = ZUSQLAccount
    AutoCalcFields = False
    IndexFieldNames = 'SACCOUNTCODE Asc'
    BeforeOpen = tblAccountBeforeOpen
    AfterInsert = tblAccountAfterInsert
    Left = 432
    Top = 509
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
      end>
    object tblAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object tblAccountSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object tblAccountSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 3
    end
    object tblAccountSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object tblAccountSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object tblAccountWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
      Required = True
    end
    object tblAccountWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      Required = True
    end
    object tblAccountBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object tblAccountBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object tblAccountBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object tblAccountBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object tblAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblAccountWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblAccountWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
  end
  object tblCreditor: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from creditor where WAccountID = :WAccountID')
    MasterFields = 'WAccountID'
    UpdateObject = ZUSQLCreditor
    IndexFieldNames = 'WAccountID Asc'
    BeforeOpen = tblCreditorBeforeOpen
    Left = 510
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
      end>
    object tblCreditorWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object tblCreditorSCODE: TStringField
      FieldName = 'SCODE'
      Size = 6
    end
    object tblCreditorWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
      Required = True
    end
    object tblCreditorSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object tblCreditorSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object tblCreditorSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object tblCreditorSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object tblCreditorSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object tblCreditorWPOSTCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSTCOUNTRIES_ID'
    end
    object tblCreditorSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object tblCreditorSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object tblCreditorSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object tblCreditorWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object tblCreditorSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object tblCreditorSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object tblCreditorSFAX: TStringField
      FieldName = 'SFAX'
    end
    object tblCreditorSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object tblCreditorWBANKNAME: TStringField
      FieldName = 'WBANKNAME'
    end
    object tblCreditorSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object tblCreditorSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object tblCreditorSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object tblCreditorFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object tblCreditorFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object tblCreditorBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object tblCreditorBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object tblCreditorDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object tblCreditorWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblCreditorWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object tblCreditorSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object tblCreditorSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblCreditorFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object tblCreditorWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object tblCreditorDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblCreditorWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object tblCreditorWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object tblCreditorWDEFAULTTAX: TIntegerField
      FieldName = 'WDEFAULTTAX'
    end
    object tblCreditorSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 35
    end
    object tblCreditorSFREEFIELD1: TStringField
      FieldName = 'SFREEFIELD1'
      Size = 35
    end
    object tblCreditorSFREEFIELD2: TStringField
      FieldName = 'SFREEFIELD2'
      Size = 35
    end
    object tblCreditorSFREEFIELD3: TStringField
      FieldName = 'SFREEFIELD3'
      Size = 35
    end
    object tblCreditorSLANGUAGE: TStringField
      FieldName = 'SLANGUAGE'
      Size = 35
    end
    object tblCreditorSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object tblCreditorSLAYOUTINVOICE: TStringField
      FieldName = 'SLAYOUTINVOICE'
      Size = 35
    end
    object tblCreditorSLAYOUTCREDITNOTE: TStringField
      FieldName = 'SLAYOUTCREDITNOTE'
      Size = 35
    end
    object tblCreditorSLAYOUTQUOTE: TStringField
      FieldName = 'SLAYOUTQUOTE'
      Size = 35
    end
    object tblCreditorSWEBSITE: TStringField
      FieldName = 'SWEBSITE'
      Size = 120
    end
    object tblCreditorWTRANSMISSIONTYPE: TIntegerField
      FieldName = 'WTRANSMISSIONTYPE'
    end
    object tblCreditorSCREDITCARDNUMBER: TStringField
      FieldName = 'SCREDITCARDNUMBER'
      Size = 35
    end
    object tblCreditorSCREDITCARDHOLDER: TStringField
      FieldName = 'SCREDITCARDHOLDER'
    end
    object tblCreditorSBANKNAME: TStringField
      FieldName = 'SBANKNAME'
    end
    object tblCreditorDEXPIRYDATE: TDateTimeField
      FieldName = 'DEXPIRYDATE'
    end
  end
  object tblDebtor: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from debtor where WAccountID = :WAccountID')
    MasterFields = 'WAccountID'
    UpdateObject = ZUSQLDebtor
    IndexFieldNames = 'WAccountID Asc'
    BeforeOpen = tblCreditorBeforeOpen
    Left = 646
    Top = 281
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountID'
      end>
    object tblDebtorWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object tblDebtorWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object tblDebtorSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object tblDebtorSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object tblDebtorSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object tblDebtorSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object tblDebtorWPOSTCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSTCOUNTRIES_ID'
    end
    object tblDebtorSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object tblDebtorSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object tblDebtorSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object tblDebtorSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object tblDebtorWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object tblDebtorSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object tblDebtorSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object tblDebtorSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object tblDebtorSFAX: TStringField
      FieldName = 'SFAX'
    end
    object tblDebtorSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object tblDebtorSBANKNAME: TStringField
      FieldName = 'SBANKNAME'
    end
    object tblDebtorSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object tblDebtorSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object tblDebtorSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object tblDebtorSCREDITCARDNUMBER: TStringField
      FieldName = 'SCREDITCARDNUMBER'
    end
    object tblDebtorDEXPIRYDATE: TDateTimeField
      FieldName = 'DEXPIRYDATE'
    end
    object tblDebtorSCREDITCARDTYPE: TStringField
      FieldName = 'SCREDITCARDTYPE'
    end
    object tblDebtorSCREDITCARDHOLDER: TStringField
      FieldName = 'SCREDITCARDHOLDER'
    end
    object tblDebtorFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object tblDebtorFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object tblDebtorFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object tblDebtorFINTEREST: TFloatField
      FieldName = 'FINTEREST'
    end
    object tblDebtorWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object tblDebtorWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object tblDebtorBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object tblDebtorBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object tblDebtorBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object tblDebtorSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object tblDebtorWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object tblDebtorDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object tblDebtorWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblDebtorWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object tblDebtorSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblDebtorDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblDebtorWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object tblDebtorWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object tblDebtorWDEFAULTTAX: TIntegerField
      FieldName = 'WDEFAULTTAX'
    end
    object tblDebtorSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 35
    end
    object tblDebtorSFREEFIELD1: TStringField
      FieldName = 'SFREEFIELD1'
      Size = 35
    end
    object tblDebtorSFREEFIELD2: TStringField
      FieldName = 'SFREEFIELD2'
      Size = 35
    end
    object tblDebtorSFREEFIELD3: TStringField
      FieldName = 'SFREEFIELD3'
      Size = 35
    end
    object tblDebtorSLANGUAGE: TStringField
      FieldName = 'SLANGUAGE'
      Size = 35
    end
    object tblDebtorSLAYOUTINVOICE: TStringField
      FieldName = 'SLAYOUTINVOICE'
      Size = 35
    end
    object tblDebtorSLAYOUTCREDITNOTE: TStringField
      FieldName = 'SLAYOUTCREDITNOTE'
      Size = 35
    end
    object tblDebtorSLAYOUTQUOTE: TStringField
      FieldName = 'SLAYOUTQUOTE'
      Size = 35
    end
    object tblDebtorDREMITTANCE: TDateTimeField
      FieldName = 'DREMITTANCE'
    end
    object tblDebtorSWEBSITE: TStringField
      FieldName = 'SWEBSITE'
      Size = 120
    end
    object tblDebtorWTRANSMISSIONTYPE: TIntegerField
      FieldName = 'WTRANSMISSIONTYPE'
    end
  end
  object QadressPerAccount: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select * from contacts,AddressPerAccount where Contacts.RecordID' +
        ' = AddressPerAccount.WContactId and  AddressPerAccount.WaccountI' +
        'd = :ID')
    UpdateObject = ZUSQLAdressPerAccount
    AfterInsert = QadressPerAccountAfterInsert
    Left = 420
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
      end>
    object QadressPerAccountRECORDID: TIntegerField
      FieldName = 'RECORDID'
    end
    object QadressPerAccountRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QadressPerAccountFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object QadressPerAccountLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object QadressPerAccountBIRTHDATE: TDateTimeField
      FieldName = 'BIRTHDATE'
    end
    object QadressPerAccountANNIVERSARY: TDateTimeField
      FieldName = 'ANNIVERSARY'
    end
    object QadressPerAccountGENDER: TStringField
      FieldName = 'GENDER'
      Size = 1
    end
    object QadressPerAccountTITLE: TStringField
      FieldName = 'TITLE'
      Size = 50
    end
    object QadressPerAccountCOMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 50
    end
    object QadressPerAccountJOB_POSITION: TStringField
      FieldName = 'JOB_POSITION'
      Size = 30
    end
    object QadressPerAccountADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 100
    end
    object QadressPerAccountCITY: TStringField
      FieldName = 'CITY'
      Size = 50
    end
    object QadressPerAccountSTATE: TStringField
      FieldName = 'STATE'
      Size = 25
    end
    object QadressPerAccountZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object QadressPerAccountCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 25
    end
    object QadressPerAccountNOTE: TStringField
      FieldName = 'NOTE'
      Size = 255
    end
    object QadressPerAccountPHONE1: TStringField
      FieldName = 'PHONE1'
      Size = 25
    end
    object QadressPerAccountPHONE2: TStringField
      FieldName = 'PHONE2'
      Size = 25
    end
    object QadressPerAccountPHONE3: TStringField
      FieldName = 'PHONE3'
      Size = 25
    end
    object QadressPerAccountPHONE4: TStringField
      FieldName = 'PHONE4'
      Size = 25
    end
    object QadressPerAccountPHONE5: TStringField
      FieldName = 'PHONE5'
      Size = 25
    end
    object QadressPerAccountPHONETYPE1: TIntegerField
      FieldName = 'PHONETYPE1'
    end
    object QadressPerAccountPHONETYPE2: TIntegerField
      FieldName = 'PHONETYPE2'
    end
    object QadressPerAccountPHONETYPE3: TIntegerField
      FieldName = 'PHONETYPE3'
    end
    object QadressPerAccountPHONETYPE4: TIntegerField
      FieldName = 'PHONETYPE4'
    end
    object QadressPerAccountPHONETYPE5: TIntegerField
      FieldName = 'PHONETYPE5'
    end
    object QadressPerAccountCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object QadressPerAccountEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object QadressPerAccountCUSTOM1: TStringField
      FieldName = 'CUSTOM1'
      Size = 100
    end
    object QadressPerAccountCUSTOM2: TStringField
      FieldName = 'CUSTOM2'
      Size = 100
    end
    object QadressPerAccountCUSTOM3: TStringField
      FieldName = 'CUSTOM3'
      Size = 100
    end
    object QadressPerAccountCUSTOM4: TStringField
      FieldName = 'CUSTOM4'
      Size = 100
    end
    object QadressPerAccountUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object QadressPerAccountUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object QadressPerAccountUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object QadressPerAccountUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object QadressPerAccountUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object QadressPerAccountUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      Size = 100
    end
    object QadressPerAccountUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object QadressPerAccountUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object QadressPerAccountUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object QadressPerAccountUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
    object QadressPerAccountDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object QadressPerAccountWADDRESSPERACCOUNTID: TIntegerField
      FieldName = 'WADDRESSPERACCOUNTID'
    end
    object QadressPerAccountWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QadressPerAccountWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
  end
  object ZUSQLAccount: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO account'
      
        '  (account.WACCOUNTID, account.SACCOUNTCODE, account.SMAINACCOUN' +
        'TCODE, '
      
        '   account.SSUBACCOUNTCODE, account.SDESCRIPTION, account.WACCOU' +
        'NTTYPEID, '
      
        '   account.WREPORTINGGROUP1ID, account.WREPORTINGGROUP2ID, accou' +
        'nt.BSUBACCOUNTS, '
      
        '   account.BINCOMEEXPENSE, account.BOPENITEM, account.BINACTIVE,' +
        ' account.DSYSDATE, '
      '   account.WPROFILEID, account.WLINKACCOUNT)'
      'VALUES'
      
        '  (:WACCOUNTID, :SACCOUNTCODE, :SMAINACCOUNTCODE, :SSUBACCOUNTCO' +
        'DE, :SDESCRIPTION, '
      
        '   :WACCOUNTTYPEID, :WREPORTINGGROUP1ID, :WREPORTINGGROUP2ID, :B' +
        'SUBACCOUNTS, '
      
        '   :BINCOMEEXPENSE, :BOPENITEM, :BINACTIVE, :DSYSDATE, :WPROFILE' +
        'ID, :WLINKACCOUNT)')
    DeleteSQL.Strings = (
      'DELETE FROM account'
      'WHERE'
      '  account.WACCOUNTID = :OLD_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE account SET'
      '  account.WACCOUNTID = :WACCOUNTID,'
      '  account.SACCOUNTCODE = :SACCOUNTCODE,'
      '  account.SMAINACCOUNTCODE = :SMAINACCOUNTCODE,'
      '  account.SSUBACCOUNTCODE = :SSUBACCOUNTCODE,'
      '  account.SDESCRIPTION = :SDESCRIPTION,'
      '  account.WACCOUNTTYPEID = :WACCOUNTTYPEID,'
      '  account.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  account.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  account.BSUBACCOUNTS = :BSUBACCOUNTS,'
      '  account.BINCOMEEXPENSE = :BINCOMEEXPENSE,'
      '  account.BOPENITEM = :BOPENITEM,'
      '  account.BINACTIVE = :BINACTIVE,'
      '  account.DSYSDATE = :DSYSDATE,'
      '  account.WPROFILEID = :WPROFILEID,'
      '  account.WLINKACCOUNT = :WLINKACCOUNT'
      'WHERE'
      '  account.WACCOUNTID = :OLD_WACCOUNTID')
    Left = 769
    Top = 516
  end
  object ZUSQLCreditor: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO CREDITOR'
      
        '  (WACCOUNTID, SCODE, WCONTACTID, SPASSWORD, SPOSTAL1, SPOSTAL2,' +
        ' SPOSTAL3, SPOSTALCODE, WPOSTCOUNTRIES_ID, SDELIVERY1, SDELIVERY' +
        '2, SDELIVERY3, WDELCOUNTRIES_ID, STELEPHONE1, STELEPHONE2, SFAX,' +
        ' SEMAIL, WBANKNAME, SBRANCHCODE, SBANKACCOUNTNUMBER, SBANKACCOUN' +
        'TNAME, FCREDITLIMIT, FCHARGEAMOUNT, BOPENITEM, BPOSTBBF, DLASTAC' +
        'TIVITY, WCURRENCYID, WFOREXACCOUNTID, SMESSAGE, SREFERENCE, FDIS' +
        'COUNT, WDEFAULTPRICETYPEID, DSYSDATE, WDUEDAYS, WDEFAULTACCOUNT,' +
        ' WDEFAULTTAX, SCOMPANYREGNO, SFREEFIELD1, SFREEFIELD2, SFREEFIEL' +
        'D3, SLANGUAGE, SDELIVERYCODE, SLAYOUTINVOICE, SLAYOUTCREDITNOTE,' +
        ' SLAYOUTQUOTE, SWEBSITE, WTRANSMISSIONTYPE, SCREDITCARDNUMBER, S' +
        'CREDITCARDHOLDER, SBANKNAME, DEXPIRYDATE)'
      'VALUES'
      
        '  (:WACCOUNTID, :SCODE, :WCONTACTID, :SPASSWORD, :SPOSTAL1, :SPO' +
        'STAL2, :SPOSTAL3, :SPOSTALCODE, :WPOSTCOUNTRIES_ID, :SDELIVERY1,' +
        ' :SDELIVERY2, :SDELIVERY3, :WDELCOUNTRIES_ID, :STELEPHONE1, :STE' +
        'LEPHONE2, :SFAX, :SEMAIL, :WBANKNAME, :SBRANCHCODE, :SBANKACCOUN' +
        'TNUMBER, :SBANKACCOUNTNAME, :FCREDITLIMIT, :FCHARGEAMOUNT, :BOPE' +
        'NITEM, :BPOSTBBF, :DLASTACTIVITY, :WCURRENCYID, :WFOREXACCOUNTID' +
        ', :SMESSAGE, :SREFERENCE, :FDISCOUNT, :WDEFAULTPRICETYPEID, :DSY' +
        'SDATE, :WDUEDAYS, :WDEFAULTACCOUNT, :WDEFAULTTAX, :SCOMPANYREGNO' +
        ', :SFREEFIELD1, :SFREEFIELD2, :SFREEFIELD3, :SLANGUAGE, :SDELIVE' +
        'RYCODE, :SLAYOUTINVOICE, :SLAYOUTCREDITNOTE, :SLAYOUTQUOTE, :SWE' +
        'BSITE, :WTRANSMISSIONTYPE, :SCREDITCARDNUMBER, :SCREDITCARDHOLDE' +
        'R, :SBANKNAME, :DEXPIRYDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM CREDITOR'
      'WHERE'
      '  WACCOUNTID = :Old_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE CREDITOR'
      'SET'
      
        '  WACCOUNTID = :WACCOUNTID, SCODE = :SCODE, WCONTACTID = :WCONTA' +
        'CTID, SPASSWORD = :SPASSWORD, SPOSTAL1 = :SPOSTAL1, SPOSTAL2 = :' +
        'SPOSTAL2, SPOSTAL3 = :SPOSTAL3, SPOSTALCODE = :SPOSTALCODE, WPOS' +
        'TCOUNTRIES_ID = :WPOSTCOUNTRIES_ID, SDELIVERY1 = :SDELIVERY1, SD' +
        'ELIVERY2 = :SDELIVERY2, SDELIVERY3 = :SDELIVERY3, WDELCOUNTRIES_' +
        'ID = :WDELCOUNTRIES_ID, STELEPHONE1 = :STELEPHONE1, STELEPHONE2 ' +
        '= :STELEPHONE2, SFAX = :SFAX, SEMAIL = :SEMAIL, WBANKNAME = :WBA' +
        'NKNAME, SBRANCHCODE = :SBRANCHCODE, SBANKACCOUNTNUMBER = :SBANKA' +
        'CCOUNTNUMBER, SBANKACCOUNTNAME = :SBANKACCOUNTNAME, FCREDITLIMIT' +
        ' = :FCREDITLIMIT, FCHARGEAMOUNT = :FCHARGEAMOUNT, BOPENITEM = :B' +
        'OPENITEM, BPOSTBBF = :BPOSTBBF, DLASTACTIVITY = :DLASTACTIVITY, ' +
        'WCURRENCYID = :WCURRENCYID, WFOREXACCOUNTID = :WFOREXACCOUNTID, ' +
        'SMESSAGE = :SMESSAGE, SREFERENCE = :SREFERENCE, FDISCOUNT = :FDI' +
        'SCOUNT, WDEFAULTPRICETYPEID = :WDEFAULTPRICETYPEID, DSYSDATE = :' +
        'DSYSDATE, WDUEDAYS = :WDUEDAYS, WDEFAULTACCOUNT = :WDEFAULTACCOU' +
        'NT, WDEFAULTTAX = :WDEFAULTTAX, SCOMPANYREGNO = :SCOMPANYREGNO, ' +
        'SFREEFIELD1 = :SFREEFIELD1, SFREEFIELD2 = :SFREEFIELD2, SFREEFIE' +
        'LD3 = :SFREEFIELD3, SLANGUAGE = :SLANGUAGE, SDELIVERYCODE = :SDE' +
        'LIVERYCODE, SLAYOUTINVOICE = :SLAYOUTINVOICE, SLAYOUTCREDITNOTE ' +
        '= :SLAYOUTCREDITNOTE, SLAYOUTQUOTE = :SLAYOUTQUOTE, SWEBSITE = :' +
        'SWEBSITE, WTRANSMISSIONTYPE = :WTRANSMISSIONTYPE, SCREDITCARDNUM' +
        'BER = :SCREDITCARDNUMBER, SCREDITCARDHOLDER = :SCREDITCARDHOLDER' +
        ', SBANKNAME = :SBANKNAME, DEXPIRYDATE = :DEXPIRYDATE'
      'WHERE'
      '  WACCOUNTID = :Old_WACCOUNTID')
    RefreshSQL.Strings = (
      
        'SELECT WACCOUNTID, SCODE, WCONTACTID, SPASSWORD, SPOSTAL1, SPOST' +
        'AL2, SPOSTAL3, SPOSTALCODE, WPOSTCOUNTRIES_ID, SDELIVERY1, SDELI' +
        'VERY2, SDELIVERY3, WDELCOUNTRIES_ID, STELEPHONE1, STELEPHONE2, S' +
        'FAX, SEMAIL, WBANKNAME, SBRANCHCODE, SBANKACCOUNTNUMBER, SBANKAC' +
        'COUNTNAME, FCREDITLIMIT, FCHARGEAMOUNT, BOPENITEM, BPOSTBBF, DLA' +
        'STACTIVITY, WCURRENCYID, WFOREXACCOUNTID, SMESSAGE, SREFERENCE, ' +
        'FDISCOUNT, WDEFAULTPRICETYPEID, DSYSDATE, WDUEDAYS, WDEFAULTACCO' +
        'UNT, WDEFAULTTAX, SCOMPANYREGNO, SFREEFIELD1, SFREEFIELD2, SFREE' +
        'FIELD3, SLANGUAGE, SDELIVERYCODE, SLAYOUTINVOICE, SLAYOUTCREDITN' +
        'OTE, SLAYOUTQUOTE, SWEBSITE, WTRANSMISSIONTYPE, SCREDITCARDNUMBE' +
        'R, SCREDITCARDHOLDER, SBANKNAME, DEXPIRYDATE FROM CREDITOR'
      'WHERE'
      '  WACCOUNTID = :WACCOUNTID')
    Left = 356
    Top = 180
  end
  object ZUSQLDebtor: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DEBTOR'
      
        '  (WACCOUNTID, WCONTACTID, SPASSWORD, SPOSTAL1, SPOSTAL2, SPOSTA' +
        'L3, WPOSTCOUNTRIES_ID, SPOSTALCODE, SDELIVERY1, SDELIVERY2, SDEL' +
        'IVERY3, WDELCOUNTRIES_ID, SDELIVERYCODE, STELEPHONE1, STELEPHONE' +
        '2, SFAX, SEMAIL, SBANKNAME, SBRANCHCODE, SBANKACCOUNTNUMBER, SBA' +
        'NKACCOUNTNAME, SCREDITCARDNUMBER, DEXPIRYDATE, SCREDITCARDTYPE, ' +
        'SCREDITCARDHOLDER, FCREDITLIMIT, FCHARGEAMOUNT, FDISCOUNT, FINTE' +
        'REST, WBANKID, WSALESMANID, BOPENITEM, BPOSTBBF, BDISABLED, SMES' +
        'SAGE, WDEFAULTPRICETYPEID, DLASTACTIVITY, WCURRENCYID, WFOREXACC' +
        'OUNTID, SREFERENCE, DSYSDATE, WDUEDAYS, DREMITTANCE, WDEFAULTACC' +
        'OUNT, WDEFAULTTAX, SCOMPANYREGNO, SFREEFIELD1, SFREEFIELD2, SFRE' +
        'EFIELD3, SLANGUAGE, SLAYOUTINVOICE, SLAYOUTCREDITNOTE, SLAYOUTQU' +
        'OTE, SWEBSITE, WTRANSMISSIONTYPE)'
      'VALUES'
      
        '  (:WACCOUNTID, :WCONTACTID, :SPASSWORD, :SPOSTAL1, :SPOSTAL2, :' +
        'SPOSTAL3, :WPOSTCOUNTRIES_ID, :SPOSTALCODE, :SDELIVERY1, :SDELIV' +
        'ERY2, :SDELIVERY3, :WDELCOUNTRIES_ID, :SDELIVERYCODE, :STELEPHON' +
        'E1, :STELEPHONE2, :SFAX, :SEMAIL, :SBANKNAME, :SBRANCHCODE, :SBA' +
        'NKACCOUNTNUMBER, :SBANKACCOUNTNAME, :SCREDITCARDNUMBER, :DEXPIRY' +
        'DATE, :SCREDITCARDTYPE, :SCREDITCARDHOLDER, :FCREDITLIMIT, :FCHA' +
        'RGEAMOUNT, :FDISCOUNT, :FINTEREST, :WBANKID, :WSALESMANID, :BOPE' +
        'NITEM, :BPOSTBBF, :BDISABLED, :SMESSAGE, :WDEFAULTPRICETYPEID, :' +
        'DLASTACTIVITY, :WCURRENCYID, :WFOREXACCOUNTID, :SREFERENCE, :DSY' +
        'SDATE, :WDUEDAYS, :DREMITTANCE, :WDEFAULTACCOUNT, :WDEFAULTTAX, ' +
        ':SCOMPANYREGNO, :SFREEFIELD1, :SFREEFIELD2, :SFREEFIELD3, :SLANG' +
        'UAGE, :SLAYOUTINVOICE, :SLAYOUTCREDITNOTE, :SLAYOUTQUOTE, :SWEBS' +
        'ITE, :WTRANSMISSIONTYPE)')
    DeleteSQL.Strings = (
      'DELETE FROM DEBTOR'
      'WHERE'
      '  WACCOUNTID = :Old_WACCOUNTID')
    ModifySQL.Strings = (
      'UPDATE DEBTOR'
      'SET'
      
        '  WACCOUNTID = :WACCOUNTID, WCONTACTID = :WCONTACTID, SPASSWORD ' +
        '= :SPASSWORD, SPOSTAL1 = :SPOSTAL1, SPOSTAL2 = :SPOSTAL2, SPOSTA' +
        'L3 = :SPOSTAL3, WPOSTCOUNTRIES_ID = :WPOSTCOUNTRIES_ID, SPOSTALC' +
        'ODE = :SPOSTALCODE, SDELIVERY1 = :SDELIVERY1, SDELIVERY2 = :SDEL' +
        'IVERY2, SDELIVERY3 = :SDELIVERY3, WDELCOUNTRIES_ID = :WDELCOUNTR' +
        'IES_ID, SDELIVERYCODE = :SDELIVERYCODE, STELEPHONE1 = :STELEPHON' +
        'E1, STELEPHONE2 = :STELEPHONE2, SFAX = :SFAX, SEMAIL = :SEMAIL, ' +
        'SBANKNAME = :SBANKNAME, SBRANCHCODE = :SBRANCHCODE, SBANKACCOUNT' +
        'NUMBER = :SBANKACCOUNTNUMBER, SBANKACCOUNTNAME = :SBANKACCOUNTNA' +
        'ME, SCREDITCARDNUMBER = :SCREDITCARDNUMBER, DEXPIRYDATE = :DEXPI' +
        'RYDATE, SCREDITCARDTYPE = :SCREDITCARDTYPE, SCREDITCARDHOLDER = ' +
        ':SCREDITCARDHOLDER, FCREDITLIMIT = :FCREDITLIMIT, FCHARGEAMOUNT ' +
        '= :FCHARGEAMOUNT, FDISCOUNT = :FDISCOUNT, FINTEREST = :FINTEREST' +
        ', WBANKID = :WBANKID, WSALESMANID = :WSALESMANID, BOPENITEM = :B' +
        'OPENITEM, BPOSTBBF = :BPOSTBBF, BDISABLED = :BDISABLED, SMESSAGE' +
        ' = :SMESSAGE, WDEFAULTPRICETYPEID = :WDEFAULTPRICETYPEID, DLASTA' +
        'CTIVITY = :DLASTACTIVITY, WCURRENCYID = :WCURRENCYID, WFOREXACCO' +
        'UNTID = :WFOREXACCOUNTID, SREFERENCE = :SREFERENCE, DSYSDATE = :' +
        'DSYSDATE, WDUEDAYS = :WDUEDAYS, DREMITTANCE = :DREMITTANCE, WDEF' +
        'AULTACCOUNT = :WDEFAULTACCOUNT, WDEFAULTTAX = :WDEFAULTTAX, SCOM' +
        'PANYREGNO = :SCOMPANYREGNO, SFREEFIELD1 = :SFREEFIELD1, SFREEFIE' +
        'LD2 = :SFREEFIELD2, SFREEFIELD3 = :SFREEFIELD3, SLANGUAGE = :SLA' +
        'NGUAGE, SLAYOUTINVOICE = :SLAYOUTINVOICE, SLAYOUTCREDITNOTE = :S' +
        'LAYOUTCREDITNOTE, SLAYOUTQUOTE = :SLAYOUTQUOTE, SWEBSITE = :SWEB' +
        'SITE, WTRANSMISSIONTYPE = :WTRANSMISSIONTYPE'
      'WHERE'
      '  WACCOUNTID = :Old_WACCOUNTID')
    RefreshSQL.Strings = (
      
        'SELECT WACCOUNTID, WCONTACTID, SPASSWORD, SPOSTAL1, SPOSTAL2, SP' +
        'OSTAL3, WPOSTCOUNTRIES_ID, SPOSTALCODE, SDELIVERY1, SDELIVERY2, ' +
        'SDELIVERY3, WDELCOUNTRIES_ID, SDELIVERYCODE, STELEPHONE1, STELEP' +
        'HONE2, SFAX, SEMAIL, SBANKNAME, SBRANCHCODE, SBANKACCOUNTNUMBER,' +
        ' SBANKACCOUNTNAME, SCREDITCARDNUMBER, DEXPIRYDATE, SCREDITCARDTY' +
        'PE, SCREDITCARDHOLDER, FCREDITLIMIT, FCHARGEAMOUNT, FDISCOUNT, F' +
        'INTEREST, WBANKID, WSALESMANID, BOPENITEM, BPOSTBBF, BDISABLED, ' +
        'SMESSAGE, WDEFAULTPRICETYPEID, DLASTACTIVITY, WCURRENCYID, WFORE' +
        'XACCOUNTID, SREFERENCE, DSYSDATE, WDUEDAYS, DREMITTANCE, WDEFAUL' +
        'TACCOUNT, WDEFAULTTAX, SCOMPANYREGNO, SFREEFIELD1, SFREEFIELD2, ' +
        'SFREEFIELD3, SLANGUAGE, SLAYOUTINVOICE, SLAYOUTCREDITNOTE, SLAYO' +
        'UTQUOTE, SWEBSITE, WTRANSMISSIONTYPE FROM DEBTOR'
      'WHERE'
      '  WACCOUNTID = :WACCOUNTID')
    Left = 477
    Top = 368
  end
  object ZUSQLAdressPerAccount: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO AddressPerAccount'
      
        '  (AddressPerAccount.WADDRESSPERACCOUNTID, AddressPerAccount.WAC' +
        'COUNTID, '
      '   AddressPerAccount.WCONTACTID, AddressPerAccount.DSYSDATE)'
      'VALUES'
      '  (:WADDRESSPERACCOUNTID, :WACCOUNTID, :WCONTACTID, :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM AddressPerAccount'
      'WHERE'
      
        '  AddressPerAccount.WADDRESSPERACCOUNTID = :OLD_WADDRESSPERACCOU' +
        'NTID')
    ModifySQL.Strings = (
      'UPDATE AddressPerAccount SET'
      '  AddressPerAccount.WADDRESSPERACCOUNTID = '
      ':WADDRESSPERACCOUNTID,'
      '  AddressPerAccount.WACCOUNTID = :WACCOUNTID,'
      '  AddressPerAccount.WCONTACTID = :WCONTACTID,'
      '  AddressPerAccount.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  AddressPerAccount.WADDRESSPERACCOUNTID = '
      ':OLD_WADDRESSPERACCOUNTID')
    Left = 957
    Top = 156
  end
  object ZQAccountRef: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from ACCOUNTREF where WAccountid = :WAccountid ')
    CachedUpdates = True
    UpdateObject = ZUSQLAccountRef
    Left = 569
    Top = 197
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountid'
      end>
    object ZQAccountRefWACCOUNTREFID: TIntegerField
      FieldName = 'WACCOUNTREFID'
      Visible = False
    end
    object ZQAccountRefSREFERENCE: TStringField
      DisplayLabel = 'Reference'
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object ZQAccountRefWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Visible = False
    end
  end
  object ZUSQLAccountRef: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO ACCOUNTREF'
      
        '  (ACCOUNTREF.WACCOUNTREFID, ACCOUNTREF.SREFERENCE, ACCOUNTREF.W' +
        'ACCOUNTID)'
      'VALUES'
      '  (:WACCOUNTREFID, :SREFERENCE, :WACCOUNTID)')
    DeleteSQL.Strings = (
      'DELETE FROM ACCOUNTREF'
      'WHERE ACCOUNTREF.WACCOUNTREFID = :OLD_WACCOUNTREFID')
    ModifySQL.Strings = (
      'UPDATE ACCOUNTREF SET'
      '  ACCOUNTREF.WACCOUNTREFID = :WACCOUNTREFID,'
      '  ACCOUNTREF.SREFERENCE = :SREFERENCE,'
      '  ACCOUNTREF.WACCOUNTID = :WACCOUNTID'
      'WHERE'
      'ACCOUNTREF.WACCOUNTREFID = :OLD_WACCOUNTREFID')
    Left = 33
    Top = 397
  end
  object DSAccountRef: TDataSource
    DataSet = ZQAccountRef
    Left = 453
    Top = 189
  end
  object pmDocument: TPopupMenu
    OnPopup = pmDocumentPopup
    Left = 89
    Top = 320
    object Invoice1: TMenuItem
      Caption = 'Invoice'
      OnClick = Invoice1Click
    end
    object Creditnote1: TMenuItem
      Caption = 'Creditnote'
      OnClick = Creditnote1Click
    end
    object Quote1: TMenuItem
      Caption = 'Quote'
      OnClick = Quote1Click
    end
    object Reports1: TMenuItem
      Caption = 'Reports'
    end
    object Openinbrowserfromimplink1: TMenuItem
      Caption = 'Open in browser from implink'
    end
    object Pluginscopyfrom1: TMenuItem
      Caption = 'Copy from plugin'
    end
    object Pluginscopyto1: TMenuItem
      Caption = 'Copy to plugin'
    end
    object PluginsAction11: TMenuItem
      Caption = 'Plugin action 1'
    end
    object PluginsAction21: TMenuItem
      Caption = 'Plugin action 2'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Setreportinggroup1: TMenuItem
      Caption = 'Repgroup1'
    end
    object Setreportinggroup2: TMenuItem
    end
  end
  object ZQGen: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 753
    Top = 283
  end
  object qryDocHead: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from  DocHead ')
    BeforeOpen = qryDocHeadBeforeOpen
    Left = 590
    Top = 508
    object qryDocHeadWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object qryDocHeadSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object qryDocHeadWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
    end
    object qryDocHeadDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object qryDocHeadDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object qryDocHeadWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object qryDocHeadWPAYMENTTYPEID: TIntegerField
      FieldName = 'WPAYMENTTYPEID'
    end
    object qryDocHeadWPOSTAL1ID: TIntegerField
      FieldName = 'WPOSTAL1ID'
    end
    object qryDocHeadWPOSTAL2ID: TIntegerField
      FieldName = 'WPOSTAL2ID'
    end
    object qryDocHeadWPOSTAL3ID: TIntegerField
      FieldName = 'WPOSTAL3ID'
    end
    object qryDocHeadWPOSCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSCOUNTRIES_ID'
    end
    object qryDocHeadWPOSTALCODEID: TIntegerField
      FieldName = 'WPOSTALCODEID'
    end
    object qryDocHeadWMESSAGE1ID: TIntegerField
      FieldName = 'WMESSAGE1ID'
    end
    object qryDocHeadWMESSAGE2ID: TIntegerField
      FieldName = 'WMESSAGE2ID'
    end
    object qryDocHeadWMESSAGE3ID: TIntegerField
      FieldName = 'WMESSAGE3ID'
    end
    object qryDocHeadFINVOICEDISCOUNT: TFloatField
      FieldName = 'FINVOICEDISCOUNT'
    end
    object qryDocHeadWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object qryDocHeadSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 255
    end
    object qryDocHeadWDELADDRESS1ID: TIntegerField
      FieldName = 'WDELADDRESS1ID'
    end
    object qryDocHeadWDELADDRESS2ID: TIntegerField
      FieldName = 'WDELADDRESS2ID'
    end
    object qryDocHeadWDELADDRESS3ID: TIntegerField
      FieldName = 'WDELADDRESS3ID'
    end
    object qryDocHeadWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object qryDocHeadWDELCODEID: TIntegerField
      FieldName = 'WDELCODEID'
    end
    object qryDocHeadBPRINTED: TSmallintField
      FieldName = 'BPRINTED'
    end
    object qryDocHeadBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object qryDocHeadWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object qryDocHeadWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object qryDocHeadWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object qryDocHeadBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object qryDocHeadWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object qryDocHeadFDOCAMOUNT: TFloatField
      FieldName = 'FDOCAMOUNT'
      DisplayFormat = '0.00'
    end
    object qryDocHeadFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object qryDocHeadBREPEATING: TSmallintField
      FieldName = 'BREPEATING'
    end
    object qryDocHeadDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object qryDocHeadWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object qryDocHeadWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object qryDocHeadWTERMS: TIntegerField
      FieldName = 'WTERMS'
    end
    object qryDocHeadWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object qryDocHeadDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object qryDocHeadWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object qryDocHeadSEXTERNALID: TStringField
      FieldName = 'SEXTERNALID'
      Size = 50
    end
    object qryDocHeadWPOSTALNAME: TIntegerField
      FieldName = 'WPOSTALNAME'
    end
    object qryDocHeadWPOSTALCONTACT: TIntegerField
      FieldName = 'WPOSTALCONTACT'
    end
    object qryDocHeadWDELNAME: TIntegerField
      FieldName = 'WDELNAME'
    end
    object qryDocHeadWDELCONTACT: TIntegerField
      FieldName = 'WDELCONTACT'
    end
    object qryDocHeadWTAXNUMBER: TIntegerField
      FieldName = 'WTAXNUMBER'
    end
    object qryDocHeadWCONTRAACCOUNT: TIntegerField
      FieldName = 'WCONTRAACCOUNT'
    end
    object qryDocHeadWOPENITEMTRANSACTID: TIntegerField
      FieldName = 'WOPENITEMTRANSACTID'
    end
  end
  object QEvents: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from events')
    CachedUpdates = True
    Left = 550
    Top = 377
    object QEventsRECORDID: TIntegerField
      FieldName = 'RECORDID'
    end
    object QEventsSTARTTIME: TDateTimeField
      FieldName = 'STARTTIME'
    end
    object QEventsENDTIME: TDateTimeField
      FieldName = 'ENDTIME'
    end
    object QEventsRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object QEventsWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object QEventsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QEventsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object QEventsNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object QEventsCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object QEventsALLDAYEVENT: TSmallintField
      FieldName = 'ALLDAYEVENT'
    end
    object QEventsDINGPATH: TStringField
      FieldName = 'DINGPATH'
      Size = 255
    end
    object QEventsALARMSET: TSmallintField
      FieldName = 'ALARMSET'
    end
    object QEventsALARMADVANCE: TIntegerField
      FieldName = 'ALARMADVANCE'
    end
    object QEventsALARMADVANCETYPE: TIntegerField
      FieldName = 'ALARMADVANCETYPE'
    end
    object QEventsSNOOZETIME: TDateTimeField
      FieldName = 'SNOOZETIME'
    end
    object QEventsREPEATCODE: TIntegerField
      FieldName = 'REPEATCODE'
    end
    object QEventsREPEATRANGEEND: TDateTimeField
      FieldName = 'REPEATRANGEEND'
    end
    object QEventsCUSTOMINTERVAL: TIntegerField
      FieldName = 'CUSTOMINTERVAL'
    end
    object QEventsUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object QEventsUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object QEventsUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object QEventsUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object QEventsUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object QEventsUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      OnGetText = QEventsUSERFIELD5GetText
      Size = 100
    end
    object QEventsUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object QEventsUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object QEventsUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object QEventsUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
  end
  object ZQDocs: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select stock.SStockCode,Stock.Sdescription Stockdesc,docline.WDo' +
        'cid, docline.FQtyShipped,dochead.SDocno,dochead.ddate,messages.S' +
        'Description,'
      
        'FSELLINGPRICE, FITEMDISCOUNT, FEXCLUSIVEAMT, FINCLUSIVEAMT ,unit' +
        '.FUNITQTY,unit.SDESCRIPTION UNITDESC,dochead.WTypeid,Dochead.Bpo' +
        'sted'
      ' from docline '
      'join dochead on docline.wdocid = dochead.Wdocid '
      'join stock on docline.wstockid = stock.Wstockid'
      'join Account on account.Waccountid = dochead.Waccountid'
      
        'left join messages on docline.wdescriptionid = messages.Wmessage' +
        'id'
      
        'left join unit on docline.Sunit = cast(unit.WUNITID as varchar(2' +
        '0))'
      'where Dochead.WAccountid = :StockId'
      'union'
      
        'select stock.SStockCode,Stock.Sdescription Stockdesc,docline.WDo' +
        'cid, docline.FQtyShipped,dochead.SDocno,dochead.ddate,messages.S' +
        'Description,'
      
        'FSELLINGPRICE, FITEMDISCOUNT, FEXCLUSIVEAMT, FINCLUSIVEAMT ,unit' +
        '.FUNITQTY,unit.SDESCRIPTION UNITDESC,dochead.WTypeid,Dochead.Bpo' +
        'sted'
      ' from DOCLINE_LINKED docline '
      'join dochead on docline.wdocid = dochead.Wdocid '
      'join stock on docline.wstockid = stock.Wstockid'
      'join Account on account.Waccountid = dochead.Waccountid'
      
        'left join messages on docline.wdescriptionid = messages.Wmessage' +
        'id'
      
        'left join unit on docline.Sunit = cast(unit.WUNITID as varchar(2' +
        '0))'
      'where Dochead.WAccountid = :StockId2'
      'order by 6 desc')
    Left = 897
    Top = 71
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'StockId'
      end
      item
        DataType = ftUnknown
        Name = 'StockId2'
      end>
    object ZQDocsSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object ZQDocsSTOCKDESC: TStringField
      FieldName = 'STOCKDESC'
      Size = 64
    end
    object ZQDocsWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object ZQDocsFQTYSHIPPED: TFloatField
      FieldName = 'FQTYSHIPPED'
    end
    object ZQDocsSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object ZQDocsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQDocsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object ZQDocsFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
      DisplayFormat = '0.00'
    end
    object ZQDocsFITEMDISCOUNT: TFloatField
      FieldName = 'FITEMDISCOUNT'
    end
    object ZQDocsFEXCLUSIVEAMT: TFloatField
      FieldName = 'FEXCLUSIVEAMT'
      DisplayFormat = '0.00'
    end
    object ZQDocsFINCLUSIVEAMT: TFloatField
      FieldName = 'FINCLUSIVEAMT'
      DisplayFormat = '0.00'
    end
    object ZQDocsFUNITQTY: TFloatField
      FieldName = 'FUNITQTY'
    end
    object ZQDocsUNITDESC: TStringField
      FieldName = 'UNITDESC'
      Size = 8
    end
    object ZQDocsWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
      OnGetText = ZQDocsWTYPEIDGetText
    end
    object ZQDocsBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
  end
  object dsDocs: TDataSource
    DataSet = ZQDocs
    Left = 987
    Top = 134
  end
  object SaveDialog1: TSaveDialog
    Left = 525
    Top = 328
  end
  object dmToonTransact: TPopupMenu
    Left = 569
    Top = 415
    object Showtransact1: TMenuItem
      Caption = 'Show transact'
      OnClick = Showtransact1Click
    end
  end
  object wwqryOpenDebits: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingA' +
        'mount,'
      '             Messages.SDescription,BUnused'
      'FROM Transact,Messages'
      'WHERE (WAccountID = :Account) '
      'AND (FOutstandingAmount > 0)'
      'And (Transact.WDescriptionID=Messages.WMessageID)'
      'ORDER BY Transact.DDate')
    CachedUpdates = True
    Left = 1156
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account'
      end>
    object wwqryOpenDebitsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object wwqryOpenDebitsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object wwqryOpenDebitsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object wwqryOpenDebitsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object wwqryOpenDebitsFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object wwqryOpenDebitsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object wwqryOpenDebitsBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object wwqryOpenDebitsISLINKED: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ISLINKED'
      Calculated = True
    end
  end
  object wwdsOpenDebits: TDataSource
    DataSet = wwqryOpenDebits
    Left = 1148
    Top = 153
  end
  object wwqryOpenCredits: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'SELECT WTransactionID, SReference, DDate, FAmount, FOutstandingA' +
        'mount,'
      '             Messages.SDescription, BUnused'
      'FROM Transact,Messages'
      'WHERE (WAccountID = :Account) '
      'AND (FOutstandingAmount < 0)'
      'And (Transact.WDescriptionID=Messages.WMessageID)'
      'ORDER BY Transact.DDate;')
    CachedUpdates = True
    Left = 986
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Account'
      end>
    object wwqryOpenCreditsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object wwqryOpenCreditsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object wwqryOpenCreditsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object wwqryOpenCreditsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object wwqryOpenCreditsFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object wwqryOpenCreditsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object wwqryOpenCreditsBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object wwqryOpenCreditsISLINKED: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ISLINKED'
      Calculated = True
    end
  end
  object wwdsOpenCredits: TDataSource
    DataSet = wwqryOpenCredits
    Left = 1134
    Top = 38
  end
end
