object fmAccessControl: TfmAccessControl
  Left = 231
  Top = 257
  Caption = 'Access Control'
  ClientHeight = 606
  ClientWidth = 1071
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 567
    Width = 1071
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1071
      39)
    object BtnClose: TBitBtn
      Left = 845
      Top = 9
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E74747472
        7272707070767676A2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA4A4A46565656666666969696767676464646262625C5C5C6B6B6BFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAE5252525151515E5E5E8F8F8FB7
        B7B7AFAFAF7878784E4E4E4444445D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        5C5C5C3C3C3C626262CACACAF8F8F8FEFEFEFDFDFDF0F0F0A1A1A14242423232
        328B8B8BFFFFFFFFFFFFFFFFFFB6B6B63434343B3B3BB6B6B6FDFDFDFEFEFEFC
        FCFCFDFDFDFFFFFFF4F4F47C7C7C212121515151FFFFFFFFFFFFFFFFFF979797
        1F1F1F505050E2E2E2FBFBFBB7B7B78E8E8E9D9D9DECECECFEFEFEB6B6B62424
        24343434FFFFFFFFFFFFFFFFFF999999373737606060E7E7E7F6F6F67C7C7C22
        2222484848D8D8D8FEFEFEB9B9B93A3A3A4A4A4AFFFFFFFFFFFFFFFFFFB7B7B7
        878787898989C8C8C8F4F4F48F8F8F7272727A7A7AD7D7D7F7F7F79696966262
        62767676FFFFFFFFFFFFFFFFFFFFFFFF9090909B9B9B929292D7D7D78F8F8F8A
        8A8A868686CFCFCFBDBDBD7C7C7C717171909090FFFFFFFFFFFFFFFFFFFFFFFF
        AAAAAA9D9D9DA7A7A7A2A2A28D8D8D9C9C9C8E8E8EBCBCBC8686868383837C7C
        7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A1A19D9D9D9A9A9A8D8D8DAC
        ACAC949494B4B4B48585857E7E7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBFBFBFBFBFBF909090BABABA9D9D9DBFBFBFA8A8A8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191B6
        B6B69A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6BEBEBEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnCloseClick
      OnKeyDown = FormKeyDown
    end
    object BitBtn1: TBitBtn
      Left = 965
      Top = 9
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Apply'
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
      TabOrder = 1
      OnClick = BitBtn1Click
      OnKeyDown = FormKeyDown
    end
    object bLogReport: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Log report'
      TabOrder = 2
      OnClick = bLogReportClick
    end
  end
  object AccessCtrl: TPageControl
    Left = 337
    Top = 0
    Width = 734
    Height = 567
    ActivePage = TabSheet2
    Align = alClient
    Anchors = []
    TabOrder = 1
    OnExit = AccessCtrlExit
    object Default: TTabSheet
      Caption = 'Standard Security'
      DesignSize = (
        726
        539)
      object Label4: TLabel
        Left = 9
        Top = 12
        Width = 53
        Height = 13
        Caption = 'User Name'
      end
      object Label1: TLabel
        Left = 9
        Top = 48
        Width = 71
        Height = 13
        Caption = 'User Password'
      end
      object Label2: TLabel
        Left = 9
        Top = 74
        Width = 53
        Height = 13
        Caption = 'User E-mail'
      end
      object edtPassword: TMaskEdit
        Left = 89
        Top = 40
        Width = 345
        Height = 21
        PasswordChar = '#'
        TabOrder = 0
        OnKeyDown = FormKeyDown
      end
      object wwDBEdit1: TDBEdit
        Left = 89
        Top = 68
        Width = 345
        Height = 21
        DataField = 'UserEmail'
        DataSource = dmDatabase.dsUser
        TabOrder = 1
      end
      object DBCheckBox1: TDBCheckBox
        Left = 9
        Top = 103
        Width = 94
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Disabled'
        DataField = 'BDisabled'
        DataSource = dmDatabase.dsUser
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnKeyDown = FormKeyDown
        OnKeyPress = edtPasswordKeyPress
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 128
        Width = 718
        Height = 109
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Options'
        TabOrder = 3
        object DBCheckBox17: TDBCheckBox
          Left = 12
          Top = 24
          Width = 137
          Height = 17
          Alignment = taLeftJustify
          Caption = 'System Setup'
          DataField = 'BSystemSetup'
          DataSource = dmDatabase.dsUser
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox16: TDBCheckBox
          Left = 12
          Top = 48
          Width = 137
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Global Processes'
          DataField = 'BGlobalProcesses'
          DataSource = dmDatabase.dsUser
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox9: TDBCheckBox
          Left = 12
          Top = 72
          Width = 137
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Reconciliation'
          DataField = 'BReconciliation'
          DataSource = dmDatabase.dsUser
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object cbSystemMenu: TCheckBox
          Left = 240
          Top = 24
          Width = 161
          Height = 20
          Alignment = taLeftJustify
          Caption = 'System menu'
          TabOrder = 3
        end
      end
      object CBHideDisabledMenuitems: TCheckBox
        Left = 176
        Top = 104
        Width = 169
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Hide disabled menu items'
        TabOrder = 4
      end
      object DBEdit1: TDBEdit
        Left = 89
        Top = 12
        Width = 345
        Height = 21
        DataField = 'SUSERNAME'
        DataSource = dmDatabase.dsUser
        TabOrder = 5
        OnExit = DBEdit1Exit
      end
    end
    object Reports: TTabSheet
      Caption = 'Reports Access'
      ImageIndex = 1
      DesignSize = (
        726
        539)
      object GroupBox4: TGroupBox
        Left = 8
        Top = 0
        Width = 718
        Height = 532
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object Label12: TLabel
          Left = 216
          Top = 18
          Width = 72
          Height = 13
          Caption = 'Default Output '
        end
        object DBCheckBox10: TDBCheckBox
          Left = 12
          Top = 28
          Width = 170
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Creditor Reports'
          DataField = 'BCreditorReports'
          DataSource = dmDatabase.dsUser
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox11: TDBCheckBox
          Left = 12
          Top = 52
          Width = 170
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Debtor Reports'
          DataField = 'BDebtorReports'
          DataSource = dmDatabase.dsUser
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox12: TDBCheckBox
          Left = 12
          Top = 76
          Width = 170
          Height = 17
          Alignment = taLeftJustify
          Caption = 'GL Reports'
          DataField = 'BLedgerReports'
          DataSource = dmDatabase.dsUser
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox13: TDBCheckBox
          Left = 12
          Top = 100
          Width = 170
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Stock Reports'
          DataField = 'BStockReports'
          DataSource = dmDatabase.dsUser
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox14: TDBCheckBox
          Left = 12
          Top = 124
          Width = 170
          Height = 17
          Alignment = taLeftJustify
          Caption = 'User Reports'
          DataField = 'BUserReports'
          DataSource = dmDatabase.dsUser
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object cbDefaultOutPut: TComboBox
          Left = 216
          Top = 36
          Width = 117
          Height = 21
          Style = csDropDownList
          TabOrder = 5
          OnKeyDown = FormKeyDown
          Items.Strings = (
            'Screen'
            'Printer'
            'File'
            'E-mail'
            'Fax')
        end
      end
    end
    object Batches: TTabSheet
      Caption = 'Batches Access'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 8
        Top = 0
        Width = 209
        Height = 257
        TabOrder = 0
        object DBCheckBox15: TDBCheckBox
          Left = 32
          Top = 39
          Width = 167
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Posting'
          DataField = 'BPosting'
          DataSource = dmDatabase.dsUser
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox4: TDBCheckBox
          Left = 32
          Top = 63
          Width = 167
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Batch Entry'
          DataField = 'BBatchEntry'
          DataSource = dmDatabase.dsUser
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox6: TDBCheckBox
          Left = 32
          Top = 87
          Width = 167
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Invoices'
          DataField = 'BInvoices'
          DataSource = dmDatabase.dsUser
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox7: TDBCheckBox
          Left = 32
          Top = 111
          Width = 167
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Purchases'
          DataField = 'BPurchases'
          DataSource = dmDatabase.dsUser
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox5: TDBCheckBox
          Left = 32
          Top = 135
          Width = 167
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Credit Notes'
          DataField = 'BCreditNote'
          DataSource = dmDatabase.dsUser
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object DBCheckBox8: TDBCheckBox
          Left = 32
          Top = 159
          Width = 167
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Stock Returns'
          DataField = 'BStockReturns'
          DataSource = dmDatabase.dsUser
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
      end
      object clbBatches: TCheckListBox
        Left = 224
        Top = 6
        Width = 209
        Height = 220
        AllowGrayed = True
        ItemHeight = 13
        TabOrder = 1
      end
      object Button1: TButton
        Left = 224
        Top = 232
        Width = 209
        Height = 25
        Caption = 'Select Account to Block'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Others'
      ImageIndex = 3
      DesignSize = (
        726
        539)
      object LCustomLimitation: TLabel
        Left = 6
        Top = 248
        Width = 78
        Height = 13
        Caption = 'Custom limitation'
      end
      object Label7: TLabel
        Left = 12
        Top = 106
        Width = 88
        Height = 13
        Caption = 'Stock access type'
      end
      object Label9: TLabel
        Left = 200
        Top = 104
        Width = 76
        Height = 13
        Caption = 'Link to calender'
      end
      object Label13: TLabel
        Left = 444
        Top = 104
        Width = 48
        Height = 13
        Caption = 'Language'
      end
      object Label14: TLabel
        Left = 444
        Top = 64
        Width = 57
        Height = 13
        Caption = 'System lang'
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 425
        Height = 99
        Caption = 'General'
        TabOrder = 0
        object DBCheckBox3: TDBCheckBox
          Left = 12
          Top = 16
          Width = 200
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit Stock'
          DataField = 'BStock'
          DataSource = dmDatabase.dsUser
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnKeyDown = FormKeyDown
          OnKeyPress = edtPasswordKeyPress
        end
        object cbEditUserRep: TCheckBox
          Left = 12
          Top = 36
          Width = 200
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit User report'
          TabOrder = 1
        end
        object cbAcc1: TCheckBox
          Left = 248
          Top = 36
          Width = 150
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit Debtors'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbAcc2: TCheckBox
          Left = 248
          Top = 56
          Width = 150
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit Creditors'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object cbAcc0: TCheckBox
          Left = 248
          Top = 16
          Width = 150
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit Ledger'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object cbEditCalender: TCheckBox
          Left = 12
          Top = 56
          Width = 200
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit calendar'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cbEditOnlyOwnCalander: TCheckBox
          Left = 12
          Top = 76
          Width = 200
          Height = 17
          Alignment = taLeftJustify
          Caption = 'limit edit on calendar'
          TabOrder = 6
        end
      end
      object MDisabledItems: TMemo
        Left = 4
        Top = 296
        Width = 533
        Height = 236
        Hint = 
          'name=D(Enabled false)name=H(Visible false)name=E(Enabled true)na' +
          'me=S(Visible true)'
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object GBPos: TGroupBox
        Left = 4
        Top = 148
        Width = 421
        Height = 93
        Caption = 'Point of Sales'
        TabOrder = 2
        object LCBMode: TLabel
          Left = 256
          Top = 12
          Width = 27
          Height = 13
          Caption = 'Mode'
        end
        object LLinkToSalesMan: TLabel
          Left = 256
          Top = 52
          Width = 79
          Height = 13
          Caption = 'Link to salesman'
        end
        object CBMode: TComboBox
          Left = 256
          Top = 28
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          Items.Strings = (
            'Invoice/Accounting'
            'Accounting'
            'POS'
            'WORKFLOW'
            'USERTAB')
        end
        object CBSalesManLink: TComboBox
          Left = 256
          Top = 68
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 1
        end
        object CheckBox2: TCheckBox
          Left = 8
          Top = 20
          Width = 149
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit Price'
          TabOrder = 2
        end
        object CBEditQty: TCheckBox
          Left = 8
          Top = 36
          Width = 149
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Edit Qantity'
          TabOrder = 3
        end
      end
      object BAddCustomLim: TButton
        Left = 377
        Top = 244
        Width = 105
        Height = 22
        Caption = 'Add'
        TabOrder = 3
        OnClick = BAddCustomLimClick
      end
      object CBHideDisabel: TComboBox
        Left = 96
        Top = 269
        Width = 275
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'Hide'
        Items.Strings = (
          'Hide'
          'Disable'
          'Show'
          'Enable')
      end
      object cbAccessType: TComboBox
        Left = 12
        Top = 122
        Width = 145
        Height = 21
        TabOrder = 5
        Text = 'cbAccessType'
        Items.Strings = (
          'Default (all rights)'
          'Wharehouse (Barcode / weigth)')
      end
      object cbCalendars: TComboBox
        Left = 200
        Top = 120
        Width = 217
        Height = 21
        Style = csDropDownList
        TabOrder = 6
      end
      object DBESPCIPADDRESS: TDBEdit
        Left = 376
        Top = 272
        Width = 157
        Height = 21
        DataField = 'SPCIPADDRESS'
        DataSource = dmDatabase.dsUser
        TabOrder = 7
      end
      object cbLang: TComboBox
        Left = 444
        Top = 120
        Width = 169
        Height = 21
        Style = csDropDownList
        TabOrder = 8
      end
      object cbSystemlang: TComboBox
        Left = 444
        Top = 80
        Width = 169
        Height = 21
        Style = csDropDownList
        TabOrder = 9
      end
      object cxibaction: TcxImageComboBox
        Left = 91
        Top = 247
        RepositoryItem = cxicbActions
        Properties.Items = <>
        TabOrder = 10
        Width = 280
      end
      object Button2: TButton
        Left = 488
        Top = 244
        Width = 105
        Height = 22
        Caption = 'add all'
        TabOrder = 11
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Documents'
      ImageIndex = 5
      DesignSize = (
        726
        539)
      object Label5: TLabel
        Left = 7
        Top = 72
        Width = 68
        Height = 13
        Caption = 'Limit Doc SQL'
      end
      object Label6: TLabel
        Left = 8
        Top = 55
        Width = 61
        Height = 13
        Caption = 'Interval (sec)'
      end
      object LLimitStockSql: TLabel
        Left = 8
        Top = 148
        Width = 76
        Height = 13
        Caption = 'Limit Stock SQL'
      end
      object Label8: TLabel
        Left = 8
        Top = 232
        Width = 94
        Height = 13
        Caption = 'Disable on doc form'
      end
      object Label10: TLabel
        Left = 8
        Top = 248
        Width = 58
        Height = 13
        Caption = 'Limit actions'
      end
      object Label11: TLabel
        Left = 228
        Top = 64
        Width = 38
        Height = 13
        Caption = 'Doc no '
      end
      object Label15: TLabel
        Left = 5
        Top = 371
        Width = 68
        Height = 13
        Caption = 'Limit deb/cred'
      end
      object Label16: TLabel
        Left = 309
        Top = 371
        Width = 57
        Height = 13
        Caption = 'Limit layouts'
      end
      object CBNOPosting: TCheckBox
        Left = 4
        Top = 5
        Width = 150
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Doc posting'
        TabOrder = 0
      end
      object MLimitDocSql: TMemo
        Left = 8
        Top = 88
        Width = 718
        Height = 53
        Anchors = [akLeft, akTop, akRight]
        Lines.Strings = (
          'MLimitDocSql')
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
      object CBAutoRefreschDoc: TCheckBox
        Left = 4
        Top = 26
        Width = 151
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Auto refresh doc'
        TabOrder = 2
      end
      object EAutoRefreshInterval: TEdit
        Left = 142
        Top = 52
        Width = 71
        Height = 21
        TabOrder = 3
        Text = '60'
      end
      object CBLikeSearchForStrings: TCheckBox
        Left = 216
        Top = 5
        Width = 210
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Like search for strings'
        TabOrder = 4
      end
      object MlimitStockSQL: TMemo
        Left = 8
        Top = 164
        Width = 717
        Height = 62
        Anchors = [akLeft, akTop, akRight]
        Lines.Strings = (
          'MlimitStockSQL')
        ScrollBars = ssBoth
        TabOrder = 5
        WordWrap = False
        OnDblClick = MlimitStockSQLDblClick
      end
      object MDisableOnDocForm: TMemo
        Left = 2
        Top = 267
        Width = 717
        Height = 102
        Anchors = [akLeft, akTop, akRight]
        Lines.Strings = (
          'MDisableOnDocForm')
        ScrollBars = ssBoth
        TabOrder = 6
        WordWrap = False
      end
      object cbCostcentersInDoc: TCheckBox
        Left = 216
        Top = 21
        Width = 210
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Costcenter in doc'
        TabOrder = 7
      end
      object cbReadOnlyTax: TCheckBox
        Left = 216
        Top = 38
        Width = 210
        Height = 20
        Alignment = taLeftJustify
        Caption = 'Readonly tax'
        TabOrder = 8
      end
      object cbDocnoFrom: TComboBox
        Left = 284
        Top = 60
        Width = 145
        Height = 21
        TabOrder = 9
        Text = 'cbDocnoFrom'
      end
      object mLimitDebCred: TMemo
        Left = 3
        Top = 390
        Width = 263
        Height = 102
        Lines.Strings = (
          'MDisableOnDocForm')
        ScrollBars = ssBoth
        TabOrder = 10
        WordWrap = False
        OnDblClick = mLimitDebCredDblClick
      end
      object mLimitLayouts: TMemo
        Left = 309
        Top = 390
        Width = 263
        Height = 102
        ScrollBars = ssBoth
        TabOrder = 11
        WordWrap = False
        OnDblClick = mLimitLayoutsDblClick
      end
    end
    object tsTypes: TTabSheet
      Caption = 'Groups'
      ImageIndex = 5
      object cbGroups: TCheckListBox
        Left = 0
        Top = 0
        Width = 726
        Height = 539
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object tsUSertabs: TTabSheet
      Caption = 'Usertabs'
      ImageIndex = 6
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 539
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsUniQUserTab
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1WPARAMID: TcxGridDBColumn
            DataBinding.FieldName = 'WPARAMID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WUSERID: TcxGridDBColumn
            DataBinding.FieldName = 'WUSERID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1SPARAMNAME: TcxGridDBColumn
            Caption = 'Group'
            DataBinding.FieldName = 'SPARAMNAME'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.Items = <
              item
                Description = 'group1'
                ImageIndex = 0
                Value = '1'
              end
              item
                Description = 'group2'
                Value = '2'
              end
              item
                Description = 'group3'
                Value = '3'
              end
              item
                Description = 'group4'
                Value = '4'
              end
              item
                Description = 'group5'
                Value = '5'
              end
              item
                Description = 'group6 '
                Value = '6'
              end>
            Width = 181
          end
          object cxGrid1DBTableView1SPARAMVALUE: TcxGridDBColumn
            Caption = 'Control'
            DataBinding.FieldName = 'SPARAMVALUE'
            RepositoryItem = cxicbActions
          end
          object cxGrid1DBTableView1WTYPEID: TcxGridDBColumn
            DataBinding.FieldName = 'WTYPEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WSOURCEID: TcxGridDBColumn
            DataBinding.FieldName = 'WSOURCEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WSOURCETYPEID: TcxGridDBColumn
            DataBinding.FieldName = 'WSOURCETYPEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DSYSDATE'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPARENTID: TcxGridDBColumn
            DataBinding.FieldName = 'WPARENTID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1WPARENTTYPEID: TcxGridDBColumn
            DataBinding.FieldName = 'WPARENTTYPEID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGrid1DBTableView1BACTIVE: TcxGridDBColumn
            DataBinding.FieldName = 'BACTIVE'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 567
    Align = alLeft
    BorderWidth = 3
    TabOrder = 2
    object Label3: TLabel
      Left = 4
      Top = 4
      Width = 329
      Height = 13
      Align = alTop
      Caption = 'Users'
      ExplicitWidth = 27
    end
    object lvUsers: TcxListView
      Left = 4
      Top = 17
      Width = 329
      Height = 505
      Align = alClient
      Anchors = []
      Columns = <
        item
          Caption = 'User'
          Width = 300
        end>
      HideSelection = False
      PopupMenu = PopupMenu1
      SmallImages = dmOsfResource.MenuImages
      TabOrder = 0
      ViewStyle = vsReport
      OnChange = lvUsersChange
      OnChanging = lvUsersChanging
      OnEdited = lvUsersEdited
      OnKeyDown = FormKeyDown
      OnKeyPress = edtPasswordKeyPress
    end
    object Panel2: TPanel
      Left = 4
      Top = 522
      Width = 329
      Height = 41
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        329
        41)
      object sbDelete: TBitBtn
        Left = 224
        Top = 10
        Width = 96
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '&Delete'
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
        TabOrder = 0
        OnClick = sbDeleteClick
      end
      object sbAdd: TBitBtn
        Left = 5
        Top = 10
        Width = 96
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = '&Add'
        DoubleBuffered = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF4BB34E4CB5534CB3524AB04EBFDFBFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAED2AD44CC6C49
          D87149D87144CC6DA9D5A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFAED2AE44CC6A3ECB4F3DCB4E43CB6AA9D5A9FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAED3AE47CF6D42
          CF553ECB4F43CB6AAAD6AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFAED3AE4BD2714CD65F43CF5544CC6BAAD6AAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFAFD6AFAFD6AFAFD5AFAFD5AF7FC87E4ED57558
          DE6C4DD76047CE6E7AC57AABD0ABABD0ABAED1AEAED1AEFFFFFF4BC05052D77A
          53D87A54D97B55DA7C54D97C64EA9263E77859DF6C55DF8147CE6E44CC6B43CB
          6943CA6843CA6B45AE4A4EC35564E38D68E17D6EE88472ED8974F08B72F0886D
          ED8265E8795BE06E51D96447D25A40CD523DCB4F48D77048B3504EC4555EDB86
          60D87467E07C6DE78371EC8874EF8973F0896EEE8366E97B5CE27152DA6648D3
          5B41CD5348D77049B4504CC2504DD3754ED47551D67753D87A54D97C68EB9674
          EF8973F08967EC9551D7784DD4754AD17147CE6D45CD6D46B24BFFFFFFAEDBAE
          AEDAAEAEDAAEAEDAAE7ECD7E54D97A70EB8773EF8A57DB7F7BCA7BADD6ADADD6
          ADADD5ADADD5ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFD6AF51D7786B
          E48070EA8556DB7EABDAABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFAFD7AF4FD47563DB776AE37E55D97DABDAABFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFD7AF4CD2725B
          D26E62DA7653D77BABDBABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFAFD7AF4BD17259D7825FDD8951D67AABDCABFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52C45553
          C55853C45852C255FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = sbAddClick
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 88
    Top = 144
    object Rename1: TMenuItem
      Caption = '&Rename'
      OnClick = Rename1Click
    end
    object Delete1: TMenuItem
      Caption = '&Delete'
      OnClick = sbDeleteClick
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
    object Numbering1: TMenuItem
      Caption = 'Numbering'
      OnClick = Numbering1Click
    end
  end
  object UniQUserTab: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from sysparams where WTypeid= 101 and wuserid =:wuser')
    AfterInsert = UniQUserTabAfterInsert
    Left = 749
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'wuser'
      end>
    object UniQUserTabWPARAMID: TIntegerField
      FieldName = 'WPARAMID'
      Required = True
    end
    object UniQUserTabWUSERID: TIntegerField
      FieldName = 'WUSERID'
      Required = True
    end
    object UniQUserTabSPARAMNAME: TStringField
      FieldName = 'SPARAMNAME'
      Required = True
      FixedChar = True
      Size = 25
    end
    object UniQUserTabSPARAMVALUE: TStringField
      FieldName = 'SPARAMVALUE'
      FixedChar = True
      Size = 50
    end
    object UniQUserTabWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object UniQUserTabWSOURCEID: TIntegerField
      FieldName = 'WSOURCEID'
    end
    object UniQUserTabWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object UniQUserTabDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object UniQUserTabWPARENTID: TIntegerField
      FieldName = 'WPARENTID'
    end
    object UniQUserTabWPARENTTYPEID: TIntegerField
      FieldName = 'WPARENTTYPEID'
    end
    object UniQUserTabBACTIVE: TSmallintField
      FieldName = 'BACTIVE'
    end
  end
  object cxEditRepository1: TcxEditRepository
    Left = 549
    Top = 320
    object cxicbActions: TcxEditRepositoryImageComboBoxItem
      Properties.Images = fmMain.ilbandsmall
      Properties.Items = <>
      Properties.LargeImages = fmMain.ilbandlarge
    end
  end
  object dsUniQUserTab: TDataSource
    DataSet = UniQUserTab
    Left = 861
    Top = 88
  end
end
