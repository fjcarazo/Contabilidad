object JobProject: TJobProject
  Left = 94
  Top = 124
  Caption = 'JobProject'
  ClientHeight = 609
  ClientWidth = 1066
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 1066
    Height = 609
    Align = alClient
    TabOrder = 0
    object PageControl2: TPageControl
      Left = 145
      Top = 0
      Width = 917
      Height = 605
      ActivePage = tsDetail
      Align = alClient
      TabOrder = 0
      object tsList: TTabSheet
        Caption = 'List'
        object Splitter2: TSplitter
          Left = 0
          Top = 153
          Width = 909
          Height = 12
          Cursor = crVSplit
          Align = alTop
          ExplicitWidth = 917
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 165
          Width = 909
          Height = 412
          Align = alClient
          DataSource = DSJobProject
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = BEditClick
          OnTitleClick = DBGrid1TitleClick
        end
        object PSearch: TPanel
          Left = 0
          Top = 0
          Width = 909
          Height = 153
          Align = alTop
          TabOrder = 1
        end
      end
      object tsDetail: TTabSheet
        Caption = 'tsDetail'
        ImageIndex = 1
        object PageControl1: TPageControl
          Left = 0
          Top = 157
          Width = 909
          Height = 420
          ActivePage = tsProjectQuote2
          Align = alClient
          TabOrder = 0
          OnChange = PageControl1Change
          object tsDocuments: TTabSheet
            Caption = 'Documents'
            ImageIndex = 1
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 901
              Height = 41
              Align = alTop
              TabOrder = 0
              object lType: TLabel
                Left = 72
                Top = 16
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Type'
              end
              object bDocAdd: TButton
                Left = 256
                Top = 8
                Width = 121
                Height = 25
                Caption = 'Add'
                TabOrder = 0
                OnClick = bDocAddClick
              end
              object BDocEdit: TButton
                Left = 388
                Top = 8
                Width = 121
                Height = 25
                Caption = 'Edit'
                TabOrder = 1
                OnClick = BDocEditClick
              end
              object cbType: TComboBox
                Left = 100
                Top = 12
                Width = 145
                Height = 21
                Style = csDropDownList
                TabOrder = 2
              end
            end
            object DBGrid3: TDBGrid
              Left = 0
              Top = 41
              Width = 901
              Height = 351
              Align = alClient
              DataSource = dsDocs
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGrid3DblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DDATE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SDOCNO'
                  Width = 111
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SREFERENCE'
                  Width = 242
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FDOCAMOUNT'
                  Width = 94
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FDOCEXLAMOUNT'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FTAXAMOUNT'
                  Width = 84
                  Visible = True
                end>
            end
          end
          object tsTransactions: TTabSheet
            Caption = 'Transactions'
            ImageIndex = 1
            object PnlPlain: TPanel
              Left = 0
              Top = 0
              Width = 901
              Height = 392
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Splitter1: TSplitter
                Left = 0
                Top = 247
                Width = 901
                Height = 4
                Cursor = crVSplit
                Align = alBottom
                ExplicitTop = 249
                ExplicitWidth = 909
              end
              object pnlLeft: TPanel
                Left = 0
                Top = 0
                Width = 901
                Height = 247
                Align = alClient
                TabOrder = 0
                object wwdbgDebits: TDBGrid
                  Left = 1
                  Top = 16
                  Width = 899
                  Height = 230
                  Align = alClient
                  DataSource = dswwqryOpenDebits
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                  PopupMenu = PopupMenu1
                  ReadOnly = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnTitleClick = wwdbgDebitsTitleClick
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SACCOUNTCODE'
                      Title.Caption = 'Code'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SACCDESCRIPTION'
                      Title.Caption = 'Description'
                      Width = 150
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SREFERENCE'
                      Title.Caption = 'Reference'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SDESCRIPTION'
                      Title.Caption = 'Line description'
                      Width = 150
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DDATE'
                      Title.Caption = 'Date'
                      Width = 70
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FAMOUNT'
                      Title.Caption = 'Amount'
                      Width = 80
                      Visible = True
                    end>
                end
                object Panel2: TPanel
                  Left = 1
                  Top = 1
                  Width = 899
                  Height = 15
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'Debits'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
              end
              object pnlRight: TPanel
                Left = 0
                Top = 251
                Width = 901
                Height = 141
                Align = alBottom
                TabOrder = 1
                object Panel3: TPanel
                  Left = 1
                  Top = 1
                  Width = 899
                  Height = 15
                  Align = alTop
                  BevelOuter = bvNone
                  Caption = 'Credits'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                end
                object wwdbgCredits: TDBGrid
                  Left = 1
                  Top = 16
                  Width = 899
                  Height = 124
                  Align = alClient
                  DataSource = dswwqryOpenCredits
                  Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
                  PopupMenu = PopupMenu1
                  ReadOnly = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnTitleClick = wwdbgCreditsTitleClick
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'SACCOUNTCODE'
                      Title.Caption = 'Code'
                      Width = 50
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SACCDESCRIPTION'
                      Title.Caption = 'Description'
                      Width = 150
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SREFERENCE'
                      Title.Caption = 'Reference'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'SDESCRIPTION'
                      Title.Caption = 'Line description'
                      Width = 150
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DDATE'
                      Title.Caption = 'Date'
                      Width = 70
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FAMOUNT'
                      Title.Caption = 'Amount'
                      Width = 80
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsProjectQuote2: TTabSheet
            Caption = 'Quotes'
            ImageIndex = 2
            object DBGrid2: TDBGrid
              Left = 0
              Top = 41
              Width = 901
              Height = 351
              Align = alClient
              DataSource = dsQuotes
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = BqEditClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DDATE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SDOCNO'
                  Width = 111
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SREFERENCE'
                  Width = 242
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FDOCAMOUNT'
                  Width = 94
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FDOCEXLAMOUNT'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FTAXAMOUNT'
                  Width = 84
                  Visible = True
                end>
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 901
              Height = 41
              Align = alTop
              TabOrder = 1
              object BQadd: TButton
                Left = 16
                Top = 8
                Width = 121
                Height = 25
                Caption = 'Add'
                TabOrder = 0
                OnClick = BQaddClick
              end
              object BqEdit: TButton
                Left = 160
                Top = 8
                Width = 121
                Height = 25
                Caption = 'Edit'
                TabOrder = 1
                OnClick = BqEditClick
              end
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 909
          Height = 157
          Align = alTop
          Color = clWhite
          TabOrder = 1
          object LCode: TLabel
            Left = 64
            Top = 11
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Code'
            FocusControl = DBECode
          end
          object LDescription: TLabel
            Left = 35
            Top = 35
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Description'
            FocusControl = DBEDesc
          end
          object Label3: TLabel
            Left = 46
            Top = 60
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Startdate'
          end
          object Label4: TLabel
            Left = 324
            Top = 60
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Enddate'
          end
          object LEnabled: TLabel
            Left = 272
            Top = 12
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Enabled'
          end
          object LStatus: TLabel
            Left = 56
            Top = 83
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Status'
          end
          object Label1: TLabel
            Left = 54
            Top = 107
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Budget'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 56
            Top = 131
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Debtor'
            FocusControl = DBEdit2
          end
          object DBECode: TDBEdit
            Left = 96
            Top = 8
            Width = 134
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SJOBPROJECTCODE'
            DataSource = DSJobProject
            TabOrder = 0
          end
          object DBEDesc: TDBEdit
            Left = 96
            Top = 32
            Width = 381
            Height = 21
            DataField = 'SDESCRIPTION'
            DataSource = DSJobProject
            TabOrder = 1
          end
          object DBCheckBox1: TDBCheckBox
            Left = 320
            Top = 9
            Width = 17
            Height = 17
            DataField = 'BENABLED'
            DataSource = DSJobProject
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit1: TDBEdit
            Left = 96
            Top = 104
            Width = 121
            Height = 21
            DataField = 'FTOTALBUDGET'
            DataSource = DSJobProject
            TabOrder = 3
          end
          object DBEdit2: TDBEdit
            Left = 96
            Top = 128
            Width = 357
            Height = 21
            DataField = 'WDEFAULTACCOUNT'
            DataSource = DSJobProject
            ReadOnly = True
            TabOrder = 4
          end
          object BitBtn3: TBitBtn
            Left = 457
            Top = 127
            Width = 24
            Height = 21
            DoubleBuffered = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000130B0000130B00000000000000000000A56D39A56D39
              A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
              39A56D39A56D39A56D39A56D39A592ADA59EC6A56D39A56D39A56D39A56D39A5
              6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A582ADA59EDE
              AD82BDCEC3C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D
              39A56D39A56D39A56D39A56D399CD3FFBD9EEFAD82BDC6B2BDA56D39A56D39A5
              6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
              A5CFF7B5A2F7A58EC6D6C3CEA56D39A56D39A56D39A56D39A56D39A56D39A56D
              39A56D39A56D39A56D39A56D39A56D39A56D39ADCFFFBDA2EFA582B5CEC3CEA5
              6D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39
              A56D39A56D39A5C3F7ADAEDEA5A2ADD6BEC6CEB2C6D6B2A5DEC3B5DEC3B5BDA2
              C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39C6A29CDE
              BE9CFFEFBDFFFFD6FFFFD6FFFFDEF7EFD6BDA2C6A56D39A56D39A56D39A56D39
              A56D39A56D39A56D39A56D39D6AE9CEFDFB5FFF3C6FFFFD6FFFFDEFFFFDEFFFF
              DEDECFBDBDA2C6A56D39A56D39A56D39A56D39A56D39A56D39A56D39EFCFADFF
              EFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFFDEF7F3D6E7CFC6A56D39A56D39A56D39
              A56D39A56D39A56D39C6B2ADF7E3BDFFDFB5FFEFBDFFFFD6FFFFDEFFFFDEFFFF
              DEF7F3D6F7E3C6A56D39A56D39A56D39A56D39A56D39A56D39CEB2ADF7E3BDFF
              E3B5FFE3BDFFFFC6FFFFD6FFFFDEFFFFD6FFFFCEF7E3C6A56D39A56D39A56D39
              A56D39A56D39A56D39A56D39F7DFC6FFEFCEFFE3C6FFE3B5FFEFBDFFF3C6F7F3
              C6FFEFC6F7CFB5A56D39A56D39A56D39A56D39A56D39A56D39A56D39DEBEB5FF
              FFDEFFFFDEFFE3BDF7DFB5F7E3B5FFEFBDDEC3A5C6A2C6A56D39A56D39A56D39
              A56D39A56D39A56D39A56D39A56D39DEC3BDF7F3D6FFEFCEFFEFC6F7E3BDE7C3
              A5D6C3BDA56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A56D39A5
              6D39A56D39A56D39D6B2A5D6B2ADBDA28CA56D39A56D39A56D39}
            ParentDoubleBuffered = False
            TabOrder = 5
            OnClick = BitBtn3Click
          end
          object dbeEndDate: TcxDBDateEdit
            Left = 372
            Top = 56
            DataBinding.DataField = 'DENDDATE'
            DataBinding.DataSource = DSJobProject
            TabOrder = 6
            Width = 105
          end
          object dbeStartDate: TcxDBDateEdit
            Left = 96
            Top = 56
            DataBinding.DataField = 'DSTARTDATE'
            DataBinding.DataSource = DSJobProject
            TabOrder = 7
            Width = 105
          end
          object CbJobcode2: TcxDBImageComboBox
            Left = 95
            Top = 79
            DataBinding.DataField = 'WSTATUSID'
            DataBinding.DataSource = DSJobProject
            Properties.Items = <>
            TabOrder = 8
            Width = 381
          end
        end
      end
    end
    object PEditButtons: TPanel
      Left = 0
      Top = 0
      Width = 145
      Height = 605
      Align = alLeft
      Color = clBtnShadow
      TabOrder = 1
      object BNew: TButton
        Left = 13
        Top = 16
        Width = 119
        Height = 25
        Caption = 'New'
        TabOrder = 0
        OnClick = BNewClick
      end
      object BDelete: TButton
        Left = 13
        Top = 48
        Width = 119
        Height = 25
        Caption = 'Delete'
        TabOrder = 1
        OnClick = BDeleteClick
      end
      object BEdit: TButton
        Left = 13
        Top = 80
        Width = 119
        Height = 25
        Caption = 'Edit'
        TabOrder = 2
        OnClick = BEditClick
      end
      object BSave: TButton
        Left = 13
        Top = 112
        Width = 119
        Height = 25
        Caption = 'Save'
        TabOrder = 3
        OnClick = BSaveClick
      end
      object BCancel: TButton
        Left = 13
        Top = 144
        Width = 119
        Height = 25
        Caption = 'Cancel'
        TabOrder = 4
        OnClick = BCancelClick
      end
      object BReport: TButton
        Left = 13
        Top = 318
        Width = 119
        Height = 25
        Caption = 'Report'
        TabOrder = 5
        OnClick = BReportClick
      end
      object CBReport: TComboBox
        Left = 11
        Top = 287
        Width = 122
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        Items.Strings = (
          '1'
          '2'
          '3')
      end
    end
  end
  object ZQJobProject: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from jobproject p')
    UpdateObject = ZUsqlJobProject
    BeforeOpen = ZQJobProjectBeforeOpen
    AfterOpen = ZQJobProjectAfterOpen
    AfterInsert = ZQJobProjectAfterInsert
    AfterScroll = ZQJobProjectAfterScroll
    Left = 220
    Top = 248
  end
  object DSJobProject: TDataSource
    DataSet = ZQJobProject
    Left = 400
    Top = 312
  end
  object ZUsqlJobProject: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO jobproject'
      
        '  (WJOBPROJECTID, SJOBPROJECTCODE, SDESCRIPTION, DSTARTDATE, DEN' +
        'DDATE, '
      
        '   WPARENTID, WNOTEFILEID, BENABLED, WSTATUSID, WINBUDGETACCID, ' +
        'WEXBUDGETACCID, '
      
        '   WPROFILEID, WINFOSID, WGROUP1ID, DSYSDATE, WUSERID, WGROUP2ID' +
        ', WPROFBUDGETID, '
      '   WDEFAULTACCOUNT, FTOTALBUDGET)'
      'VALUES'
      
        '  (:WJOBPROJECTID, :SJOBPROJECTCODE, :SDESCRIPTION, :DSTARTDATE,' +
        ' :DENDDATE, '
      
        '   :WPARENTID, :WNOTEFILEID, :BENABLED, :WSTATUSID, :WINBUDGETAC' +
        'CID, :WEXBUDGETACCID, '
      
        '   :WPROFILEID, :WINFOSID, :WGROUP1ID, :DSYSDATE, :WUSERID, :WGR' +
        'OUP2ID, '
      '   :WPROFBUDGETID, :WDEFAULTACCOUNT, :FTOTALBUDGET)')
    DeleteSQL.Strings = (
      'DELETE FROM jobproject'
      'WHERE'
      '  jobproject.WJOBPROJECTID = :OLD_WJOBPROJECTID')
    ModifySQL.Strings = (
      'UPDATE jobproject SET'
      '  WJOBPROJECTID = :WJOBPROJECTID,'
      '  SJOBPROJECTCODE = :SJOBPROJECTCODE,'
      '  SDESCRIPTION = :SDESCRIPTION,'
      '  DSTARTDATE = :DSTARTDATE,'
      '  DENDDATE = :DENDDATE,'
      '  WPARENTID = :WPARENTID,'
      '  WNOTEFILEID = :WNOTEFILEID,'
      '  BENABLED = :BENABLED,'
      '  WSTATUSID = :WSTATUSID,'
      '  WINBUDGETACCID = :WINBUDGETACCID,'
      '  WEXBUDGETACCID = :WEXBUDGETACCID,'
      '  WPROFILEID = :WPROFILEID,'
      '  WINFOSID = :WINFOSID,'
      '  WGROUP1ID = :WGROUP1ID,'
      '  DSYSDATE = :DSYSDATE,'
      '  WUSERID = :WUSERID,'
      '  WGROUP2ID = :WGROUP2ID,'
      '  WPROFBUDGETID = :WPROFBUDGETID,'
      '  WDEFAULTACCOUNT = :WDEFAULTACCOUNT,'
      '  FTOTALBUDGET = :FTOTALBUDGET'
      'WHERE'
      '  jobproject.WJOBPROJECTID = :OLD_WJOBPROJECTID')
    Left = 296
    Top = 288
  end
  object wwqryOpenCredits: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'SELECT account.SaccountCode,Account.SDescription SAccDescription' +
        ', WTransactionID, SReference, DDate, FAmount, FOutstandingAmount' +
        ','
      '             Messages.SDescription, BUnused'
      
        'FROM Transact join Messages on (Transact.WDescriptionID=Messages' +
        '.WMessageID)'
      'join Account on Transact.WAccountid = Account.WAccountid'
      'WHERE (Transact.WJobCodeId = :WJobCodeId) '
      'and FAmount < 0'
      'ORDER BY Transact.DDate;')
    CachedUpdates = True
    Left = 358
    Top = 423
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WJobCodeId'
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
    object wwqryOpenCreditsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object wwqryOpenCreditsSACCDESCRIPTION: TStringField
      FieldName = 'SACCDESCRIPTION'
      Size = 40
    end
  end
  object wwqryOpenDebits: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'SELECT account.SaccountCode,Account.SDescription SAccDescription' +
        ', WTransactionID, SReference, DDate, FAmount, FOutstandingAmount' +
        ','
      '             Messages.SDescription, BUnused'
      
        'FROM Transact join Messages on (Transact.WDescriptionID=Messages' +
        '.WMessageID)'
      'join Account on Transact.WAccountid = Account.WAccountid'
      'WHERE (Transact.WJobCodeId = :WJobCodeId) '
      'and FAmount > 0'
      'ORDER BY Transact.DDate;')
    CachedUpdates = True
    Left = 496
    Top = 348
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WJobCodeId'
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
    object wwqryOpenDebitsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object wwqryOpenDebitsSACCDESCRIPTION: TStringField
      FieldName = 'SACCDESCRIPTION'
      Size = 40
    end
  end
  object dswwqryOpenDebits: TDataSource
    DataSet = wwqryOpenDebits
    Left = 476
    Top = 320
  end
  object dswwqryOpenCredits: TDataSource
    DataSet = wwqryOpenCredits
    Left = 296
    Top = 344
  end
  object PopupMenu1: TPopupMenu
    Left = 197
    Top = 337
    object Deletefromproject1: TMenuItem
      Caption = 'Delete from project'
      OnClick = Deletefromproject1Click
    end
    object Addtoproject1: TMenuItem
      Caption = 'Add to project'
      OnClick = Addtoproject1Click
    end
  end
  object ZQQuotes: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select Wdocid,DDate,SDOCNO,SREFERENCE,FDOCAMOUNT, FDOCAMOUNT - F' +
        'TAXAMOUNT FDOCEXLAMOUNT'
      
        ',FTAXAMOUNT from dochead where WJOBCODEID = :JOBCODE and Wtypeid' +
        ' = 1000')
    AfterOpen = ZQQuotesAfterOpen
    Left = 577
    Top = 433
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'JOBCODE'
      end>
  end
  object dsQuotes: TDataSource
    DataSet = ZQQuotes
    Left = 669
    Top = 433
  end
  object ZQDocs: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select Wdocid,DDate,WTypeid,SDOCNO,SREFERENCE,FDOCAMOUNT, FDOCAM' +
        'OUNT - FTAXAMOUNT FDOCEXLAMOUNT'
      
        ',FTAXAMOUNT from dochead where WJOBCODEID = :JOBCODE and Wtypeid' +
        ' in (10,11,12,13,14,15,16,17,18)'
      'order by Wtypeid , ddate desc')
    AfterOpen = ZQDocsAfterOpen
    Left = 557
    Top = 509
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'JOBCODE'
      end>
  end
  object dsDocs: TDataSource
    DataSet = ZQDocs
    Left = 665
    Top = 529
  end
end
