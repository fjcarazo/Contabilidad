object FormMainExpImp: TFormMainExpImp
  Left = 215
  Top = 91
  Caption = 'osFinancials Import / Export'
  ClientHeight = 547
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCMain: TPageControl
    Left = 0
    Top = 0
    Width = 803
    Height = 547
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 811
    ExplicitHeight = 549
    object TabSheet1: TTabSheet
      Caption = 'Process'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pcStreamTypes: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 519
        ActivePage = tsContacts
        Align = alClient
        TabOrder = 0
        OnChange = pcStreamTypesChange
        ExplicitWidth = 803
        ExplicitHeight = 521
        object tsContacts: TTabSheet
          Caption = 'Import'
          DesignSize = (
            787
            491)
          object DBNavigator2: TDBNavigator
            Left = 148
            Top = 40
            Width = 280
            Height = 25
            DataSource = DSImportGrid
            DragCursor = crDefault
            TabOrder = 0
          end
          object BImportContacts: TButton
            Left = 8
            Top = 113
            Width = 121
            Height = 25
            Caption = 'Import Contacts'
            TabOrder = 1
            OnClick = BImportContactsClick
          end
          object BImportDebtors: TButton
            Left = 8
            Top = 81
            Width = 121
            Height = 25
            Caption = 'Import Debtors'
            TabOrder = 2
            OnClick = BImportDebtorsClick
          end
          object BImportStock: TButton
            Left = 8
            Top = 145
            Width = 121
            Height = 25
            Caption = 'Import Stock'
            TabOrder = 3
            OnClick = BImportStockClick
          end
          object BImportdocuments: TButton
            Left = 8
            Top = 177
            Width = 121
            Height = 25
            Caption = 'Import documents'
            TabOrder = 4
            OnClick = BImportdocumentsClick
          end
          object Button11: TButton
            Left = 8
            Top = 369
            Width = 121
            Height = 25
            Caption = 'Import all types'
            TabOrder = 5
            OnClick = Button11Click
          end
          object Panel1: TPanel
            Left = 144
            Top = 80
            Width = 641
            Height = 401
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 6
            object Splitter1: TSplitter
              Left = 0
              Top = 278
              Width = 641
              Height = 3
              Cursor = crVSplit
              Align = alBottom
            end
            object DBGrid4: TDBGrid
              Left = 0
              Top = 281
              Width = 641
              Height = 120
              Align = alBottom
              DataSource = dsDetail
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid3DblClick
            end
            object DBGrid3: TDBGrid
              Left = 0
              Top = 0
              Width = 641
              Height = 278
              Align = alClient
              Anchors = [akLeft, akTop, akBottom]
              DataSource = DSImportGrid
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid3DblClick
            end
          end
          object Memo1: TMemo
            Left = 512
            Top = 8
            Width = 265
            Height = 57
            TabOrder = 7
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Export'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            787
            491)
          object Label17: TLabel
            Left = 136
            Top = 0
            Width = 18
            Height = 13
            Caption = 'Log'
          end
          object Panel2: TPanel
            Left = 136
            Top = 72
            Width = 641
            Height = 401
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 0
              Top = 278
              Width = 641
              Height = 3
              Cursor = crVSplit
              Align = alBottom
            end
            object DBGrid2: TDBGrid
              Left = 0
              Top = 281
              Width = 641
              Height = 120
              Align = alBottom
              DataSource = dsDetail
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid3DblClick
            end
            object DBGrid8: TDBGrid
              Left = 0
              Top = 0
              Width = 641
              Height = 278
              Align = alClient
              Anchors = [akLeft, akTop, akBottom]
              DataSource = DSImportGrid
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid3DblClick
            end
          end
          object BUploadDebtors: TButton
            Left = 24
            Top = 72
            Width = 75
            Height = 25
            Caption = 'Debtors'
            TabOrder = 1
            OnClick = BUploadDebtorsClick
          end
          object BUploadContacts: TButton
            Left = 24
            Top = 104
            Width = 75
            Height = 25
            Caption = 'Contacts'
            TabOrder = 2
            Visible = False
          end
          object MUploadLog: TMemo
            Left = 136
            Top = 16
            Width = 637
            Height = 41
            TabOrder = 3
          end
        end
      end
    end
    object TSSetup: TTabSheet
      Caption = 'Setup'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        795
        519)
      object Label22: TLabel
        Left = 16
        Top = 8
        Width = 63
        Height = 13
        Caption = 'Data sources'
      end
      object pcSettings: TPageControl
        Left = 14
        Top = 126
        Width = 785
        Height = 389
        ActivePage = TabSheet3
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'Settings'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label1: TLabel
            Left = 8
            Top = 13
            Width = 28
            Height = 13
            Caption = 'Name'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 8
            Top = 37
            Width = 46
            Height = 13
            Caption = 'Debtor url'
            FocusControl = DBEdit2
          end
          object Label3: TLabel
            Left = 8
            Top = 61
            Width = 50
            Height = 13
            Caption = 'Creditor url'
            FocusControl = DBEdit3
          end
          object Label4: TLabel
            Left = 288
            Top = 13
            Width = 42
            Height = 13
            Caption = 'Stock url'
            FocusControl = DBEdit4
          end
          object Label5: TLabel
            Left = 288
            Top = 37
            Width = 63
            Height = 13
            Caption = 'Document url'
            FocusControl = DBEdit5
          end
          object Label6: TLabel
            Left = 288
            Top = 61
            Width = 42
            Height = 13
            Caption = 'Event url'
            FocusControl = DBEdit6
          end
          object Label7: TLabel
            Left = 288
            Top = 85
            Width = 51
            Height = 13
            Caption = 'Contact url'
            FocusControl = DBEdit7
          end
          object Label8: TLabel
            Left = 8
            Top = 84
            Width = 32
            Height = 13
            Caption = 'php url'
            FocusControl = DBEdit9
          end
          object Label10: TLabel
            Left = 152
            Top = 112
            Width = 67
            Height = 13
            Caption = 'php username'
            FocusControl = DBEdit10
          end
          object Label11: TLabel
            Left = 248
            Top = 112
            Width = 66
            Height = 13
            Caption = 'php password'
            FocusControl = DBEdit11
          end
          object Label12: TLabel
            Left = 8
            Top = 112
            Width = 26
            Height = 13
            Caption = 'Prefix'
            FocusControl = DBEdit12
          end
          object Label9: TLabel
            Left = 592
            Top = 8
            Width = 27
            Height = 13
            Caption = 'Ini file'
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 8
            Top = 153
            Width = 113
            Height = 56
            Caption = 'Type'
            DataField = 'IMP_SOURCE_LOGICTYPE'
            DataSource = dsSource
            Items.Strings = (
              'Vtigerimport'
              'osF internal'
              'VTiger Sync')
            ParentBackground = True
            TabOrder = 0
            Values.Strings = (
              '0'
              '1')
          end
          object DBEdit1: TDBEdit
            Left = 80
            Top = 8
            Width = 188
            Height = 21
            DataField = 'IMP_NAME'
            DataSource = dsSource
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 80
            Top = 32
            Width = 188
            Height = 21
            DataField = 'IMP_DEBTORURL'
            DataSource = dsSource
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 80
            Top = 56
            Width = 187
            Height = 21
            DataField = 'IMP_CREDITORURL'
            DataSource = dsSource
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 360
            Top = 8
            Width = 187
            Height = 21
            DataField = 'IMP_STOCKURL'
            DataSource = dsSource
            TabOrder = 4
          end
          object DBEdit5: TDBEdit
            Left = 360
            Top = 32
            Width = 187
            Height = 21
            DataField = 'IMP_DOCUMENTURL'
            DataSource = dsSource
            TabOrder = 5
          end
          object DBEdit6: TDBEdit
            Left = 360
            Top = 56
            Width = 187
            Height = 21
            DataField = 'IMP_EVENTURL'
            DataSource = dsSource
            TabOrder = 6
          end
          object DBEdit7: TDBEdit
            Left = 360
            Top = 80
            Width = 187
            Height = 21
            DataField = 'IMP_CONTACTURL'
            DataSource = dsSource
            TabOrder = 7
          end
          object DBEdit9: TDBEdit
            Left = 80
            Top = 80
            Width = 187
            Height = 21
            DataField = 'IMP_OSFINANCIALS_PHP_URL'
            DataSource = dsSource
            TabOrder = 8
          end
          object DBEdit10: TDBEdit
            Left = 152
            Top = 128
            Width = 89
            Height = 21
            DataField = 'IMP_USERNAME'
            DataSource = dsSource
            TabOrder = 9
          end
          object DBEdit11: TDBEdit
            Left = 248
            Top = 128
            Width = 97
            Height = 21
            DataField = 'IMP_PASSWORD'
            DataSource = dsSource
            PasswordChar = '*'
            TabOrder = 10
          end
          object DBEdit12: TDBEdit
            Left = 8
            Top = 128
            Width = 134
            Height = 21
            DataField = 'IMP_PREFIX'
            DataSource = dsSource
            TabOrder = 11
          end
          object DBEdit8: TDBEdit
            Left = 8
            Top = 216
            Width = 121
            Height = 21
            DataField = 'IMP_SOURCE_LOGICTYPE'
            DataSource = dsSource
            TabOrder = 12
          end
          object DBMemo1: TDBMemo
            Left = 592
            Top = 24
            Width = 193
            Height = 177
            DataField = 'IMP_INIFILE'
            DataSource = dsSource
            ScrollBars = ssBoth
            TabOrder = 13
            WordWrap = False
            OnDblClick = DBMemo1DblClick
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Test connection'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            777
            361)
          object DBGrid6: TDBGrid
            Left = 0
            Top = 152
            Width = 769
            Height = 203
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsFreeSelect
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGrid6DblClick
          end
          object MFreeSql: TMemo
            Left = 0
            Top = 32
            Width = 769
            Height = 113
            Anchors = [akLeft, akTop, akRight]
            Lines.Strings = (
              'Select * from stock')
            TabOrder = 1
          end
          object Button6: TButton
            Left = 4
            Top = 3
            Width = 75
            Height = 25
            Caption = 'Open SQL'
            TabOrder = 2
            OnClick = Button6Click
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Extra settings'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            777
            361)
          object LWSTOCKACCOUNTSID: TLabel
            Left = 460
            Top = 72
            Width = 128
            Height = 13
            Caption = 'Purchase or stock account'
            FocusControl = DBEdit13
          end
          object Label15: TLabel
            Left = 607
            Top = 120
            Width = 177
            Height = 13
            Caption = 'External tax reference(in stock select)'
            FocusControl = DBEdit15
          end
          object LWSALESACCOUNTID: TLabel
            Left = 460
            Top = 24
            Width = 68
            Height = 13
            Caption = 'Sales account'
            FocusControl = DBEdit16
          end
          object LWCOSTOFSALESACCOUNTID: TLabel
            Left = 460
            Top = 120
            Width = 97
            Height = 13
            Caption = 'Cost of sale account'
            FocusControl = DBEdit17
          end
          object LWINPUTTAXACCOUNTID: TLabel
            Left = 612
            Top = 72
            Width = 111
            Height = 13
            Caption = 'Input tax (purchase tax)'
            FocusControl = DBEdit19
          end
          object LWOUTPUTTAXACCOUNTID: TLabel
            Left = 604
            Top = 24
            Width = 79
            Height = 13
            Caption = 'Output(sales) tax'
            FocusControl = DBEdit20
          end
          object Label21: TLabel
            Left = 0
            Top = 0
            Width = 37
            Height = 13
            Caption = 'Tax link'
          end
          object Label13: TLabel
            Left = 0
            Top = 160
            Width = 61
            Height = 13
            Caption = 'Extra options'
          end
          object Label14: TLabel
            Left = 0
            Top = 352
            Width = 88
            Height = 13
            Caption = 'Linked stock code'
            FocusControl = DBEdit14
          end
          object Label16: TLabel
            Left = 0
            Top = 312
            Width = 129
            Height = 13
            Caption = 'External or used parameter.'
            FocusControl = DBEdit18
          end
          object DBGrid5: TDBGrid
            Left = 0
            Top = 43
            Width = 449
            Height = 86
            Anchors = [akLeft, akTop, akRight]
            DataSource = DataSource2
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'IMP_EXTID'
                Title.Caption = 'External ID'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WSALESACCOUNTID'
                ReadOnly = True
                Title.Caption = 'Sales'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WCOSTOFSALESACCOUNTID'
                Title.Caption = 'Cost of sales'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WSTOCKACCOUNTID'
                Title.Caption = 'Stock'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WINPUTTAXACCOUNTID'
                Title.Caption = 'Inputtax'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WOUTPUTTAXACCOUNTID'
                Title.Caption = 'Output tax'
                Visible = True
              end>
          end
          object DBNavigator5: TDBNavigator
            Left = 0
            Top = 16
            Width = 240
            Height = 25
            DataSource = DataSource2
            TabOrder = 1
          end
          object DBEdit13: TDBEdit
            Left = 508
            Top = 88
            Width = 89
            Height = 21
            DataField = 'WSTOCKACCOUNTID'
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit15: TDBEdit
            Left = 607
            Top = 136
            Width = 137
            Height = 21
            DataField = 'IMP_EXTID'
            DataSource = DataSource2
            TabOrder = 3
          end
          object DBEdit16: TDBEdit
            Left = 508
            Top = 40
            Width = 86
            Height = 21
            DataField = 'WSALESACCOUNTID'
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit17: TDBEdit
            Left = 508
            Top = 136
            Width = 86
            Height = 21
            DataField = 'WCOSTOFSALESACCOUNTID'
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit19: TDBEdit
            Left = 652
            Top = 88
            Width = 86
            Height = 21
            DataField = 'WINPUTTAXACCOUNTID'
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 6
          end
          object DBEdit20: TDBEdit
            Left = 652
            Top = 40
            Width = 86
            Height = 21
            DataField = 'WOUTPUTTAXACCOUNTID'
            DataSource = DataSource2
            ReadOnly = True
            TabOrder = 7
          end
          object Button2: TButton
            Left = 462
            Top = 88
            Width = 41
            Height = 17
            Caption = 'Edit'
            TabOrder = 8
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 462
            Top = 139
            Width = 41
            Height = 17
            Caption = 'Edit'
            TabOrder = 9
            OnClick = Button3Click
          end
          object Button5: TButton
            Left = 462
            Top = 43
            Width = 41
            Height = 17
            Caption = 'Edit'
            TabOrder = 10
            OnClick = Button5Click
          end
          object Button7: TButton
            Left = 606
            Top = 88
            Width = 41
            Height = 17
            Caption = 'Edit'
            TabOrder = 11
            OnClick = Button7Click
          end
          object Button8: TButton
            Left = 606
            Top = 43
            Width = 41
            Height = 17
            Caption = 'Edit'
            TabOrder = 12
            OnClick = Button8Click
          end
          object DBGrid7: TDBGrid
            Left = 0
            Top = 211
            Width = 568
            Height = 86
            Anchors = [akLeft, akTop, akRight]
            DataSource = dsImpTotals
            TabOrder = 13
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'IMP_EXTID'
                Title.Caption = 'External id'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WSTOCKID'
                Title.Caption = 'Stockitem'
                Width = 180
                Visible = True
              end>
          end
          object DBNavigator3: TDBNavigator
            Left = 0
            Top = 176
            Width = 240
            Height = 25
            DataSource = dsImpTotals
            TabOrder = 14
          end
          object DBEdit14: TDBEdit
            Left = 0
            Top = 368
            Width = 233
            Height = 21
            DataField = 'WSTOCKID'
            DataSource = dsImpTotals
            TabOrder = 15
          end
          object DBEdit18: TDBEdit
            Left = 0
            Top = 328
            Width = 232
            Height = 21
            DataField = 'IMP_EXTID'
            DataSource = dsImpTotals
            TabOrder = 16
          end
          object Button10: TButton
            Left = 238
            Top = 371
            Width = 41
            Height = 17
            Caption = 'Edit'
            TabOrder = 17
            OnClick = Button10Click
          end
        end
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 48
        Width = 781
        Height = 65
        Anchors = [akLeft, akTop, akRight]
        DataSource = dsSource
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'IMP_SOURCEID'
            Title.Caption = 'Source id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMP_NAME'
            Title.Caption = 'Name'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMP_SOURCE_LOGICTYPE'
            Title.Caption = 'Logic type'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMP_PREFIX'
            Title.Caption = 'Prefix'
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 16
        Top = 24
        Width = 240
        Height = 25
        DataSource = dsSource
        TabOrder = 2
      end
    end
  end
  object ZTIMPSOURCE: TUniTable
    TableName = 'IMP_SOURCE'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    AfterInsert = ZTIMPSOURCEAfterInsert
    AfterScroll = ZTIMPSOURCEAfterScroll
    Left = 424
    Top = 372
    object ZTIMPSOURCEIMP_SOURCEID: TIntegerField
      FieldName = 'IMP_SOURCEID'
      Required = True
    end
    object ZTIMPSOURCEIMP_NAME: TStringField
      FieldName = 'IMP_NAME'
      Required = True
      Size = 35
    end
    object ZTIMPSOURCEIMP_DEBTORURL: TStringField
      FieldName = 'IMP_DEBTORURL'
      Size = 250
    end
    object ZTIMPSOURCEIMP_CREDITORURL: TStringField
      FieldName = 'IMP_CREDITORURL'
      Size = 250
    end
    object ZTIMPSOURCEIMP_STOCKURL: TStringField
      FieldName = 'IMP_STOCKURL'
      Size = 250
    end
    object ZTIMPSOURCEIMP_DOCUMENTURL: TStringField
      FieldName = 'IMP_DOCUMENTURL'
      Size = 250
    end
    object ZTIMPSOURCEIMP_EVENTURL: TStringField
      FieldName = 'IMP_EVENTURL'
      Size = 250
    end
    object ZTIMPSOURCEIMP_CONTACTURL: TStringField
      FieldName = 'IMP_CONTACTURL'
      Size = 250
    end
    object ZTIMPSOURCEIMP_SOURCE_LOGICTYPE: TIntegerField
      FieldName = 'IMP_SOURCE_LOGICTYPE'
    end
    object ZTIMPSOURCEIMP_OSFINANCIALS_PHP_URL: TStringField
      FieldName = 'IMP_OSFINANCIALS_PHP_URL'
      Size = 250
    end
    object ZTIMPSOURCEIMP_USERNAME: TStringField
      FieldName = 'IMP_USERNAME'
      Size = 50
    end
    object ZTIMPSOURCEIMP_PASSWORD: TStringField
      FieldName = 'IMP_PASSWORD'
      Size = 50
    end
    object ZTIMPSOURCEIMP_PREFIX: TStringField
      FieldName = 'IMP_PREFIX'
      Size = 10
    end
    object ZTIMPSOURCEIMP_INIFILE: TBlobField
      FieldName = 'IMP_INIFILE'
    end
  end
  object dsSource: TDataSource
    DataSet = ZTIMPSOURCE
    Left = 408
    Top = 336
  end
  object DSImportGrid: TDataSource
    Left = 372
    Top = 392
  end
  object ZTIMPSTOCKACCOUNTS: TUniTable
    TableName = 'IMP_STOCKACCOUNTS'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    AfterInsert = ZTIMPSTOCKACCOUNTSAfterInsert
    Left = 404
    Top = 372
    object ZTIMPSTOCKACCOUNTSIMP_STOCKACCOUNTSID: TIntegerField
      FieldName = 'IMP_STOCKACCOUNTSID'
      Required = True
    end
    object ZTIMPSTOCKACCOUNTSIMP_SOURCEID: TIntegerField
      FieldName = 'IMP_SOURCEID'
      Required = True
    end
    object ZTIMPSTOCKACCOUNTSIMP_EXTID: TStringField
      FieldName = 'IMP_EXTID'
      Required = True
      Size = 60
    end
    object ZTIMPSTOCKACCOUNTSWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
      OnGetText = ZTIMPSTOCKACCOUNTSWSALESACCOUNTIDGetText
    end
    object ZTIMPSTOCKACCOUNTSWCOSTOFSALESACCOUNTID: TIntegerField
      FieldName = 'WCOSTOFSALESACCOUNTID'
      OnGetText = ZTIMPSTOCKACCOUNTSWSALESACCOUNTIDGetText
    end
    object ZTIMPSTOCKACCOUNTSWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
      OnGetText = ZTIMPSTOCKACCOUNTSWSALESACCOUNTIDGetText
    end
    object ZTIMPSTOCKACCOUNTSWINPUTTAXACCOUNTID: TIntegerField
      FieldName = 'WINPUTTAXACCOUNTID'
      OnGetText = ZTIMPSTOCKACCOUNTSWSALESACCOUNTIDGetText
    end
    object ZTIMPSTOCKACCOUNTSWOUTPUTTAXACCOUNTID: TIntegerField
      FieldName = 'WOUTPUTTAXACCOUNTID'
      OnGetText = ZTIMPSTOCKACCOUNTSWSALESACCOUNTIDGetText
    end
  end
  object DataSource2: TDataSource
    DataSet = ZTIMPSTOCKACCOUNTS
    Left = 328
    Top = 392
  end
  object dsDetail: TDataSource
    Left = 376
    Top = 400
  end
  object dsMaster: TDataSource
    Left = 352
    Top = 401
  end
  object dsFreeSelect: TDataSource
    Left = 352
    Top = 370
  end
  object ZTIMPTOTALS: TUniTable
    TableName = 'IMP_TOTALS'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    AfterInsert = ZTIMPTOTALSAfterInsert
    Left = 430
    Top = 398
    object ZTIMPTOTALSIMP_TOTALID: TIntegerField
      FieldName = 'IMP_TOTALID'
      Required = True
    end
    object ZTIMPTOTALSIMP_SOURCEID: TIntegerField
      FieldName = 'IMP_SOURCEID'
      Required = True
    end
    object ZTIMPTOTALSIMP_EXTID: TStringField
      FieldName = 'IMP_EXTID'
      Required = True
      Size = 60
    end
    object ZTIMPTOTALSWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
      OnGetText = ZTIMPTOTALSWSTOCKIDGetText
    end
  end
  object dsImpTotals: TDataSource
    DataSet = ZTIMPTOTALS
    Left = 434
    Top = 370
  end
  object ZExternalCon: TUniConnection
    DataTypeMap = <>
    Left = 380
    Top = 364
  end
end
