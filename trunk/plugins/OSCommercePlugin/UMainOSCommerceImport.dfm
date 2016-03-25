object MainOSCommerceImport: TMainOSCommerceImport
  Left = 137
  Top = 142
  Caption = 'osCommerce Import'
  ClientHeight = 546
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 8
    Top = 8
    Width = 224
    Height = 16
    Caption = 'Need commercial support? Click here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = Label9Click
  end
  object LabelManual: TLabel
    Left = 448
    Top = 8
    Width = 157
    Height = 16
    Caption = 'Online manual? Click here!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = LabelManualClick
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 36
    Width = 649
    Height = 489
    ActivePage = TSSettings
    TabOrder = 0
    Visible = False
    OnChange = PageControl1Change
    object TSSettings: TTabSheet
      Caption = 'Settings / Process'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 641
        Height = 461
        ActivePage = TabSheet6
        Align = alClient
        TabOrder = 0
        object TabSheet2: TTabSheet
          Caption = 'Standard'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            633
            433)
          object Label6: TLabel
            Left = 179
            Top = 20
            Width = 279
            Height = 13
            Anchors = []
            Caption = 'Date-Time used to synchronize with osCommerce database'
          end
          object Label29: TLabel
            Left = 8
            Top = 328
            Width = 111
            Height = 13
            Caption = 'Run every XXX second'
            Visible = False
          end
          object DTSincTime: TDateTimePicker
            Left = 367
            Top = 40
            Width = 73
            Height = 21
            Anchors = []
            Date = 29221.000000000000000000
            Time = 29221.000000000000000000
            Kind = dtkTime
            TabOrder = 0
          end
          object DTSincDate: TDateTimePicker
            Left = 165
            Top = 40
            Width = 169
            Height = 21
            Anchors = []
            Date = 36161.000000000000000000
            Time = 36161.000000000000000000
            TabOrder = 1
            OnChange = DTSincDateChange
          end
          object BSyncOrders: TButton
            Left = 129
            Top = 90
            Width = 388
            Height = 22
            Hint = 
              'Press this button To Sync/Download the Orders, Debtors and Stock' +
              ' Items changed between the dates picked above'
            Anchors = [akLeft, akRight]
            Caption = 'Sync/Download Orders'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BSyncOrdersClick
          end
          object Button2: TButton
            Left = 129
            Top = 134
            Width = 388
            Height = 22
            Anchors = [akLeft, akRight]
            Caption = 'Sync/Download Stock Items only'
            TabOrder = 3
            Visible = False
            OnClick = Button2Click
          end
          object PProgress: TPanel
            Left = 206
            Top = 355
            Width = 241
            Height = 76
            Anchors = [akBottom]
            TabOrder = 4
            Visible = False
            object Label15: TLabel
              Left = 8
              Top = 8
              Width = 52
              Height = 13
              Caption = 'Processing'
            end
            object Lprocess: TLabel
              Left = 72
              Top = 8
              Width = 52
              Height = 13
              Caption = 'Processing'
            end
            object PBProccess: TProgressBar
              Left = 8
              Top = 24
              Width = 225
              Height = 16
              TabOrder = 0
            end
            object Button7: TButton
              Left = 80
              Top = 48
              Width = 75
              Height = 25
              Caption = 'Stop'
              TabOrder = 1
              OnClick = Button7Click
            end
          end
          object BSyncAll: TButton
            Left = 129
            Top = 157
            Width = 388
            Height = 21
            Anchors = [akLeft, akRight]
            Caption = 'Sync/Download all items'
            TabOrder = 5
            Visible = False
            OnClick = BSyncAllClick
          end
          object BSyncOSCwithTC: TButton
            Left = 129
            Top = 180
            Width = 388
            Height = 21
            Anchors = [akLeft, akRight]
            Caption = 'Upload osF Stock Level to osC'
            TabOrder = 6
            Visible = False
            OnClick = BSyncOSCwithTCClick
          end
          object BResave: TButton
            Left = 128
            Top = 440
            Width = 75
            Height = 25
            Caption = 'Resave'
            TabOrder = 7
            Visible = False
            OnClick = BResaveClick
          end
          object DTPSyncToTime: TDateTimePicker
            Left = 367
            Top = 62
            Width = 73
            Height = 21
            Anchors = []
            Date = 29221.000000000000000000
            Time = 29221.000000000000000000
            Kind = dtkTime
            TabOrder = 8
          end
          object DTSyncToDate: TDateTimePicker
            Left = 165
            Top = 62
            Width = 169
            Height = 21
            Anchors = []
            Date = 36161.000000000000000000
            Time = 36161.000000000000000000
            TabOrder = 9
          end
          object StaticText1: TStaticText
            Left = 84
            Top = 43
            Width = 69
            Height = 17
            Anchors = [akLeft]
            Caption = 'To Date-Time'
            TabOrder = 10
          end
          object BAutoUpdate: TButton
            Left = 128
            Top = 316
            Width = 388
            Height = 22
            Hint = 
              'Use this to Sync/Download Orders from osC to osF. Run a second o' +
              'sF to see the orders coming in.'
            Anchors = [akLeft, akRight]
            Caption = 'Start Auto Update'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            Visible = False
            OnClick = BAutoUpdateClick
          end
          object EInterval: TEdit
            Left = 8
            Top = 345
            Width = 113
            Height = 21
            TabOrder = 12
            Text = '30'
            Visible = False
          end
          object Button10: TButton
            Left = 129
            Top = 112
            Width = 388
            Height = 22
            Anchors = [akLeft, akRight]
            Caption = 'Sync/Download Customers only'
            TabOrder = 13
            Visible = False
            OnClick = Button10Click
          end
          object CbForceItems: TCheckBox
            Left = 10
            Top = 224
            Width = 111
            Height = 14
            Caption = 'Force all items'
            TabOrder = 14
            Visible = False
          end
          object CBMatchStockCode: TCheckBox
            Left = 10
            Top = 240
            Width = 177
            Height = 17
            Caption = 'Match on StockCode'
            TabOrder = 15
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Tax Mapping'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            633
            433)
          object TVTax: TTreeView
            Left = 8
            Top = 8
            Width = 145
            Height = 419
            Hint = 
              'You need to hookup the taxes and set your OT_XXX variable by han' +
              'd.'
            Anchors = [akLeft, akTop, akBottom]
            HideSelection = False
            Indent = 19
            ParentShowHint = False
            PopupMenu = PopupMenu1
            ReadOnly = True
            RowSelect = True
            ShowHint = True
            TabOrder = 0
            OnChange = TVTaxChange
            OnChanging = TVTaxChanging
          end
          object PEditTaxDetail: TPanel
            Left = 160
            Top = 8
            Width = 468
            Height = 249
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Visible = False
            DesignSize = (
              468
              249)
            object LgenOutputtax: TLabel
              Left = 8
              Top = 12
              Width = 126
              Height = 13
              Caption = 'Output Tax Account(sales)'
            end
            object LSalesAccount: TLabel
              Left = 8
              Top = 88
              Width = 69
              Height = 13
              Caption = 'Sales Account'
            end
            object LCOSAccount: TLabel
              Left = 8
              Top = 128
              Width = 105
              Height = 13
              Caption = 'Cost of Sales Account'
            end
            object LStockAccount: TLabel
              Left = 8
              Top = 168
              Width = 71
              Height = 13
              Caption = 'Stock Account'
            end
            object LInputTaxAccount: TLabel
              Left = 8
              Top = 52
              Width = 142
              Height = 13
              Caption = 'Input Tax Account (Purchase)'
            end
            object LELinkRate: TLabel
              Left = 9
              Top = 208
              Width = 86
              Height = 13
              Caption = 'Linkrate (US TAX)'
            end
            object TCSalesAccount: TComboBox
              Left = 64
              Top = 104
              Width = 387
              Height = 21
              Hint = 
                'Sales Account osF will link to the selected osC Tax link in the ' +
                'treeview'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object TCCostOfSalesACcount: TComboBox
              Left = 64
              Top = 144
              Width = 387
              Height = 21
              Hint = 
                'Cost of Sales Account osF will link to the selected osC Tax link' +
                ' in the treeview'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object TCStockAccount: TComboBox
              Left = 64
              Top = 184
              Width = 387
              Height = 21
              Hint = 
                'Stock Account osF will link to the selected osC Tax link in the ' +
                'treeview'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
            end
            object TCTaxAccount: TComboBox
              Left = 64
              Top = 28
              Width = 387
              Height = 21
              Hint = 
                'Sales Taxes osF will link to the selected osC Tax link in the tr' +
                'eeview'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object TCTaxAccountInput: TComboBox
              Left = 64
              Top = 68
              Width = 387
              Height = 21
              Hint = 
                'Purchase Taxes osF will link to the selected osC Tax link in the' +
                ' treeview'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object ELinkRate: TEdit
              Left = 10
              Top = 221
              Width = 121
              Height = 21
              TabOrder = 5
              Text = '0'
            end
            object Button11: TButton
              Left = 8
              Top = 32
              Width = 49
              Height = 17
              Caption = 'Change'
              TabOrder = 6
              OnClick = TCTaxAccountDblClick
            end
            object BInputTaxAccount: TButton
              Left = 8
              Top = 71
              Width = 49
              Height = 17
              Caption = 'Change'
              TabOrder = 7
              OnClick = BInputTaxAccountClick
            end
            object BSalesAccount: TButton
              Left = 8
              Top = 103
              Width = 49
              Height = 17
              Caption = 'Change'
              TabOrder = 8
              OnClick = BSalesAccountClick
            end
            object BCOSAccount: TButton
              Left = 8
              Top = 144
              Width = 49
              Height = 16
              Caption = 'Change'
              TabOrder = 9
              OnClick = BCOSAccountClick
            end
            object BStockAccount: TButton
              Left = 8
              Top = 183
              Width = 49
              Height = 17
              Caption = 'Change'
              TabOrder = 10
              OnClick = BStockAccountClick
            end
          end
          object POrdertotal: TPanel
            Left = 160
            Top = 264
            Width = 468
            Height = 177
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Visible = False
            DesignSize = (
              468
              177)
            object Label17: TLabel
              Left = 8
              Top = 12
              Width = 24
              Height = 13
              Caption = 'Type'
            end
            object Label18: TLabel
              Left = 8
              Top = 64
              Width = 102
              Height = 13
              Caption = 'Order Total exact text'
            end
            object Label24: TLabel
              Left = 8
              Top = 104
              Width = 107
              Height = 13
              Caption = 'Order Total description'
            end
            object CBType: TComboBox
              Left = 8
              Top = 28
              Width = 444
              Height = 21
              Hint = 
                'Type discount will deduct this amount from the invoice. Type Ite' +
                'm will be added as a item to osF.'
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Items.Strings = (
                'DISCOUNT'
                'PRODUCT')
            end
            object EOrderTotalExactText: TEdit
              Left = 8
              Top = 80
              Width = 444
              Height = 21
              Hint = 
                'The exact matching text in osC from this variable example: ot_sh' +
                'ipping'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object CBExclusive: TCheckBox
              Left = 8
              Top = 147
              Width = 177
              Height = 17
              Caption = 'Is Exclusive Price'
              TabOrder = 2
            end
            object EOrderTotalExactDesc: TEdit
              Left = 8
              Top = 120
              Width = 444
              Height = 21
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 3
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Extra Options'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            633
            433)
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 88
            Height = 13
            Caption = 'Product Language'
          end
          object Label2: TLabel
            Left = 8
            Top = 48
            Width = 82
            Height = 13
            Caption = 'Product Currency'
          end
          object Label3: TLabel
            Left = 8
            Top = 88
            Width = 371
            Height = 13
            Caption = 
              'Product barcode option name (Use the same option name in all opt' +
              'ion choices)'
            Visible = False
          end
          object Label4: TLabel
            Left = 200
            Top = 8
            Width = 103
            Height = 13
            Caption = 'Invoice Number prefix'
          end
          object Label5: TLabel
            Left = 312
            Top = 8
            Width = 100
            Height = 13
            Caption = 'Customer Code prefix'
          end
          object Label11: TLabel
            Left = 200
            Top = 48
            Width = 84
            Height = 13
            Caption = 'Stock Code prefix'
          end
          object Label16: TLabel
            Left = 8
            Top = 128
            Width = 30
            Height = 13
            Caption = 'Status'
          end
          object Label21: TLabel
            Left = 8
            Top = 240
            Width = 237
            Height = 13
            Caption = 'Debtor default Sales Account for Country not in list'
            Visible = False
          end
          object Label22: TLabel
            Left = 264
            Top = 240
            Width = 40
            Height = 13
            Caption = 'Account'
            Visible = False
          end
          object Label23: TLabel
            Left = 264
            Top = 280
            Width = 71
            Height = 13
            Caption = 'Debtor group 1'
            Visible = False
          end
          object Label27: TLabel
            Left = 264
            Top = 336
            Width = 310
            Height = 13
            Caption = 'Global ORDERS URL link osF with osC (launch browser to admin)'
            Visible = False
          end
          object Label28: TLabel
            Left = 264
            Top = 384
            Width = 332
            Height = 13
            Caption = 'Global CUSTOMERS URL link osF with osC (launch browser to admin)'
            Visible = False
          end
          object CBProductLang: TComboBox
            Left = 8
            Top = 24
            Width = 169
            Height = 21
            Style = csDropDownList
            TabOrder = 0
            OnChange = CBProductLangChange
          end
          object CBProductBarcode: TComboBox
            Left = 8
            Top = 104
            Width = 169
            Height = 21
            Style = csDropDownList
            TabOrder = 1
            Visible = False
          end
          object CBProductCur: TComboBox
            Left = 8
            Top = 64
            Width = 169
            Height = 21
            Style = csDropDownList
            TabOrder = 2
          end
          object EInvoicePrefix: TEdit
            Left = 200
            Top = 24
            Width = 33
            Height = 21
            TabOrder = 3
            Text = 'OS'
          end
          object ECustomerPRefix: TEdit
            Left = 312
            Top = 24
            Width = 33
            Height = 21
            TabOrder = 4
            Text = 'OS'
          end
          object EStockCodePrefix: TEdit
            Left = 200
            Top = 64
            Width = 33
            Height = 21
            TabOrder = 5
            Text = 'OS'
          end
          object CBStatus: TCheckListBox
            Left = 8
            Top = 144
            Width = 169
            Height = 81
            ItemHeight = 13
            TabOrder = 6
            OnClick = CBStatusClick
          end
          object CBImportAsQuote: TCheckBox
            Left = 200
            Top = 160
            Width = 97
            Height = 17
            Caption = 'Import as quote'
            TabOrder = 7
          end
          object CBResyncDateTime: TCheckBox
            Left = 200
            Top = 144
            Width = 145
            Height = 17
            Caption = 'Resync Date-Time on pull'
            TabOrder = 8
          end
          object CBUpdateStockFromTC: TCheckBox
            Left = 200
            Top = 176
            Width = 241
            Height = 17
            Caption = 'Re-update stocklevel in osC from Stock Level in osF'
            TabOrder = 9
            Visible = False
          end
          object CBImportItemAttributesAsComment: TCheckBox
            Left = 200
            Top = 192
            Width = 201
            Height = 17
            Caption = 'Import Item Attributes as comment'
            TabOrder = 10
          end
          object CBUSeTaxRatesFromOrderProduct: TCheckBox
            Left = 200
            Top = 208
            Width = 201
            Height = 17
            Caption = 'Use Tax Rates from Order Products'
            TabOrder = 11
            Visible = False
          end
          object MCountriesList: TMemo
            Left = 8
            Top = 257
            Width = 249
            Height = 158
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 12
            Visible = False
          end
          object CBDebtorAccount: TComboBox
            Left = 264
            Top = 256
            Width = 356
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 13
            Visible = False
          end
          object CBDebtorGroup1: TComboBox
            Left = 264
            Top = 296
            Width = 337
            Height = 21
            Style = csDropDownList
            TabOrder = 14
            Visible = False
          end
          object CBUseStockIDOnly: TCheckBox
            Left = 472
            Top = 144
            Width = 129
            Height = 17
            Caption = 'Use Stock ID'
            TabOrder = 15
          end
          object CBUseDocReportingGroup1: TCheckBox
            Left = 472
            Top = 160
            Width = 137
            Height = 33
            Caption = 'Doc Reportinggroep1 as Status'
            TabOrder = 16
            WordWrap = True
          end
          object ELinkOrdersUrl: TEdit
            Left = 264
            Top = 352
            Width = 337
            Height = 21
            Hint = 
              'Example : http://www.yourdomain.org/catalog/admin/orders.php?sel' +
              'ected_box=customers&page=1&oID=<@ID@>&action=edit'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
            Visible = False
            OnDblClick = ELinkOrdersUrlDblClick
          end
          object ELinkCustUrl: TEdit
            Left = 264
            Top = 400
            Width = 337
            Height = 21
            Hint = 
              'Example : http://www.yourdomain.org/catalog/admin/customers.php?' +
              'page=1&cID=<@ID@>&action=edit'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
            Visible = False
            OnDblClick = ELinkCustUrlDblClick
          end
          object CBImportStockGroups: TCheckBox
            Left = 472
            Top = 192
            Width = 137
            Height = 33
            Caption = 'Import osC Categories into Stockgroep1'
            TabOrder = 19
            WordWrap = True
          end
          object cbEditExistingItems: TCheckBox
            Left = 472
            Top = 221
            Width = 137
            Height = 15
            Caption = 'Edit existing items'
            TabOrder = 20
            WordWrap = True
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Debug SQL'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            633
            433)
          object Memo1: TMemo
            Left = 8
            Top = 40
            Width = 620
            Height = 391
            Anchors = [akLeft, akTop, akRight, akBottom]
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
          end
          object CBDebug: TCheckBox
            Left = 8
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Use debug'
            TabOrder = 1
            OnClick = CBDebugClick
          end
          object Refresh: TButton
            Left = 88
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Refresh'
            TabOrder = 2
            OnClick = RefreshClick
          end
        end
        object TCGenSql: TTabSheet
          Caption = 'Exec SQL'
          ImageIndex = 4
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Splitter3: TSplitter
            Left = 0
            Top = 89
            Width = 633
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object MFreeSQL: TMemo
            Left = 0
            Top = 0
            Width = 633
            Height = 89
            Align = alTop
            Lines.Strings = (
              'Select * from orders_total where 1= 0 ')
            TabOrder = 0
          end
          object Panel6: TPanel
            Left = 0
            Top = 92
            Width = 633
            Height = 341
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 642
              Height = 64
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object DBNavigator1: TDBNavigator
                Left = 0
                Top = 39
                Width = 642
                Height = 25
                DataSource = DSGen
                Align = alBottom
                TabOrder = 0
              end
              object Button4: TButton
                Left = 8
                Top = 8
                Width = 75
                Height = 25
                Caption = 'Exec/Open'
                TabOrder = 1
                OnClick = Button4Click
              end
              object Button1: TButton
                Left = 104
                Top = 8
                Width = 209
                Height = 25
                Caption = 'Check Double items'
                TabOrder = 2
                Visible = False
                OnClick = Button1Click
              end
              object Button12: TButton
                Left = 324
                Top = 8
                Width = 209
                Height = 25
                Caption = 'Check Double items 2'
                TabOrder = 3
                Visible = False
                OnClick = Button12Click
              end
            end
            object DBGrid5: TDBGrid
              Left = 0
              Top = 64
              Width = 642
              Height = 316
              Align = alClient
              DataSource = DSGen
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'TOOLS'
          ImageIndex = 5
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object PageControl3: TPageControl
            Left = 0
            Top = 0
            Width = 633
            Height = 433
            ActivePage = TabSheet8
            Align = alClient
            TabOrder = 0
            object TabSheet7: TTabSheet
              Caption = 'Incorrect amounts'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              DesignSize = (
                625
                405)
              object Label26: TLabel
                Left = 190
                Top = 11
                Width = 60
                Height = 13
                Caption = 'Orders_id >='
              end
              object MOutput: TMemo
                Left = 0
                Top = 104
                Width = 625
                Height = 301
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 0
              end
              object Button5: TButton
                Left = 16
                Top = 8
                Width = 145
                Height = 25
                Caption = 'Check all OT with osF'
                TabOrder = 1
                OnClick = Button5Click
              end
              object PBTools: TProgressBar
                Left = 16
                Top = 40
                Width = 473
                Height = 16
                Step = 1
                TabOrder = 2
              end
              object Button8: TButton
                Left = 16
                Top = 64
                Width = 225
                Height = 25
                Caption = 'Check all OT with osF and add'
                TabOrder = 3
                OnClick = Button8Click
              end
              object EFromOrderNr: TEdit
                Left = 256
                Top = 8
                Width = 121
                Height = 21
                TabOrder = 4
                Text = '0'
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'Not in osF'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object MNotInTC: TMemo
                Left = 0
                Top = 0
                Width = 634
                Height = 444
                Align = alClient
                Anchors = []
                TabOrder = 0
              end
            end
            object TabSheet9: TTabSheet
              Caption = 'Reprocess in list'
              ImageIndex = 2
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object MProcessThisList: TMemo
                Left = 8
                Top = 40
                Width = 297
                Height = 233
                TabOrder = 0
              end
              object Button9: TButton
                Left = 8
                Top = 8
                Width = 289
                Height = 25
                Caption = 'Proces this list'
                TabOrder = 1
                OnClick = Button9Click
              end
            end
            object TabSheet10: TTabSheet
              Caption = 'Process single order and convert stock'
              ImageIndex = 3
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              DesignSize = (
                625
                405)
              object Label25: TLabel
                Left = 8
                Top = 8
                Width = 61
                Height = 13
                Caption = 'Ordernumber'
              end
              object BConvertOldStockIdToSExternal: TButton
                Left = 128
                Top = 87
                Width = 400
                Height = 25
                Hint = 
                  'If you have a older version of the plugin the link on stock was ' +
                  'put in the stock code. Now we link on the id from oscommerce so ' +
                  'its more save to do a update from osF to osC. Stock levels canno' +
                  'w be updated to osC with greater acurracy.'
                Anchors = [akLeft, akRight]
                Caption = 'Convert old stock to new id'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BConvertOldStockIdToSExternalClick
              end
              object Button6: TButton
                Left = 128
                Top = 54
                Width = 401
                Height = 25
                Anchors = [akLeft, akRight]
                Caption = 'Process Order'
                TabOrder = 1
                OnClick = Button6Click
              end
              object Button3: TButton
                Left = 128
                Top = 24
                Width = 401
                Height = 25
                Anchors = [akLeft, akRight]
                Caption = 'Show Order'
                TabOrder = 2
                OnClick = Button3Click
              end
              object EOderNR: TEdit
                Left = 7
                Top = 25
                Width = 121
                Height = 21
                TabOrder = 3
                Text = '11425'
              end
            end
          end
        end
        object tsUSeInvoiceSorting: TTabSheet
          Caption = 'Invoice sort'
          ImageIndex = 6
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label7: TLabel
            Left = 8
            Top = 32
            Width = 103
            Height = 13
            Caption = 'Group stock available'
          end
          object Label8: TLabel
            Left = 8
            Top = 72
            Width = 129
            Height = 13
            Caption = 'Groups stock not available.'
          end
          object cbUseInvoicesorting: TCheckBox
            Left = 8
            Top = 8
            Width = 273
            Height = 17
            Caption = 'Use invoice sorting'
            TabOrder = 0
          end
          object cbStockAvail: TComboBox
            Left = 8
            Top = 48
            Width = 337
            Height = 21
            Style = csDropDownList
            TabOrder = 1
          end
          object cbStockNotAvial: TComboBox
            Left = 8
            Top = 88
            Width = 337
            Height = 21
            Style = csDropDownList
            TabOrder = 2
          end
        end
      end
    end
    object TSOrders: TTabSheet
      Caption = 'Orders New/Changed'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Splitter1: TSplitter
        Left = 0
        Top = 177
        Width = 650
        Height = 16
        Cursor = crVSplit
        Align = alTop
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 650
        Height = 41
        Align = alTop
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 41
        Width = 650
        Height = 136
        Align = alTop
        DataSource = DSOrders
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'customers_id'
            Title.Caption = 'Customer id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'orders_id'
            Title.Caption = 'Order id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_name'
            Title.Caption = 'Name'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_company'
            Title.Caption = 'Company'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_street_address'
            Title.Caption = 'Street address'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_suburb'
            Title.Caption = 'Suburb'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_city'
            Title.Caption = 'City'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_postcode'
            Title.Caption = 'Postcode'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_state'
            Title.Caption = 'State'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_country'
            Title.Caption = 'Country'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_telephone'
            Title.Caption = 'Telephone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'customers_email_address'
            Title.Caption = 'Email address'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_name'
            Title.Caption = 'Delivery name'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_company'
            Title.Caption = 'Delivery Company'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_street_address'
            Title.Caption = 'Delivery streetaddress'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_suburb'
            Title.Caption = 'Delivery suburb'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_city'
            Title.Caption = 'Delivery city'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_postcode'
            Title.Caption = 'Delivery postcode'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_state'
            Title.Caption = 'Delivery state'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'delivery_country'
            Title.Caption = 'Delivery country'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_name'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_company'
            Title.Caption = 'Billing company'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_street_address'
            Title.Caption = 'Billing streetaddress'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_suburb'
            Title.Caption = 'Billing suburb'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_city'
            Title.Caption = 'Billing city'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_postcode'
            Title.Caption = 'Billing postcode'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_state'
            Title.Caption = 'Billing state'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'billing_country'
            Title.Caption = 'Billing country'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'payment_method'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cc_type'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cc_owner'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cc_number'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cc_expires'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'last_modified'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_purchased'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'orders_status'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'orders_date_finished'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'currency'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'currency_value'
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 193
        Width = 650
        Height = 307
        Align = alClient
        Caption = 'Panel2'
        TabOrder = 2
        object Splitter2: TSplitter
          Left = 1
          Top = 157
          Width = 648
          Height = 15
          Cursor = crVSplit
          Align = alBottom
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 648
          Height = 156
          Align = alClient
          Caption = 'Panel5'
          TabOrder = 0
          DesignSize = (
            639
            117)
          object Label13: TLabel
            Left = 16
            Top = 16
            Width = 59
            Height = 13
            Caption = 'Order details'
          end
          object DBGrid2: TDBGrid
            Left = 18
            Top = 32
            Width = 584
            Height = 10
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = DSOrderProducts
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'products_model'
                Title.Caption = 'Model'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'products_name'
                Title.Caption = 'Name'
                Width = 288
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'products_price'
                Title.Caption = 'Price'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'final_price'
                Title.Caption = 'Final price'
                Width = 76
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'products_tax'
                Title.Caption = 'Products tax'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'products_quantity'
                Title.Caption = 'Products quantity'
                Width = 106
                Visible = True
              end>
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 133
          Width = 639
          Height = 134
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'Panel2'
          TabOrder = 1
          object Label14: TLabel
            Left = 16
            Top = 8
            Width = 58
            Height = 13
            Caption = 'Order Totals'
          end
          object DBGrid4: TDBGrid
            Left = 16
            Top = 26
            Width = 977
            Height = 87
            DataSource = DSOrderTtotals
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'title'
                Width = 193
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'text'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'value'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'class'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'sort_order'
                Visible = True
              end>
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Stock Items'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 650
        Height = 41
        Align = alTop
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 41
        Width = 650
        Height = 459
        Align = alClient
        DataSource = DSStock
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'products_id'
            Title.Caption = 'Id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_quantity'
            Title.Caption = 'Quantity'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_model'
            Title.Caption = 'Model'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_name'
            Title.Caption = 'Name'
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_price'
            Title.Caption = 'Price'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_date_added'
            Title.Caption = 'Date added'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_last_modified'
            Title.Caption = 'Last modified'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_date_available'
            Title.Caption = 'Date available'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_weight'
            Title.Caption = 'Weight'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_status'
            Title.Caption = 'Status'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'products_ordered'
            Title.Caption = 'Ordered'
            Visible = True
          end>
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 80
    Top = 472
    object Connection1: TMenuItem
      Caption = 'Connection'
      object Login1: TMenuItem
        Caption = 'Login'
        OnClick = Login1Click
      end
      object Logout1: TMenuItem
        Caption = 'Logout'
        OnClick = Logout1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      OnClick = Help1Click
    end
  end
  object DSOrders: TDataSource
    Left = 496
    Top = 472
  end
  object DSStock: TDataSource
    Left = 536
    Top = 424
  end
  object DSOrderProducts: TDataSource
    Left = 504
    Top = 112
  end
  object DSOrderTtotals: TDataSource
    Left = 532
    Top = 124
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 536
    Top = 64
    object Insert1: TMenuItem
      Caption = 'Insert'
      OnClick = Insert1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
  end
  object DSGen: TDataSource
    Left = 544
    Top = 120
  end
  object TRunUpdateOrders: TTimer
    Enabled = False
    OnTimer = TRunUpdateOrdersTimer
    Left = 48
    Top = 464
  end
end
