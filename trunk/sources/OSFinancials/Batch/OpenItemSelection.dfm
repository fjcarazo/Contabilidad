object fmOpenItemSelection: TfmOpenItemSelection
  Left = 619
  Top = 278
  Caption = 'Open Item Selection'
  ClientHeight = 503
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 459
    Width = 804
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      804
      44)
    object BtnCancel: TBitBtn
      Left = 597
      Top = 10
      Width = 96
      Height = 23
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Close'
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
      OnClick = BtnCancelClick
    end
    object MDocinfo: TMemo
      Left = 5
      Top = 4
      Width = 574
      Height = 29
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 705
      Top = 10
      Width = 96
      Height = 23
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Ok'
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
      TabOrder = 2
      Visible = False
      OnClick = btnOkClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 231
    Align = alTop
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 70
      Align = alTop
      TabOrder = 0
      object LAccount: TMemo
        Left = 1
        Top = 1
        Width = 497
        Height = 68
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        PopupMenu = PopupMenu1
        TabOrder = 0
      end
      object Panel6: TPanel
        Left = 498
        Top = 1
        Width = 303
        Height = 68
        Align = alRight
        TabOrder = 1
        object bClear: TBitBtn
          Left = 16
          Top = 4
          Width = 109
          Height = 25
          Caption = 'Clear'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = bClearClick
        end
        object bOpenitem: TButton
          Left = 16
          Top = 36
          Width = 109
          Height = 25
          Caption = 'Openitem'
          TabOrder = 1
          OnClick = bOpenitemClick
        end
        object bCloseDiv: TBitBtn
          Left = 138
          Top = 36
          Width = 155
          Height = 25
          Caption = '<>'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = bCloseDivClick
        end
        object cbAutomatic: TCheckBox
          Left = 140
          Top = 8
          Width = 97
          Height = 17
          Caption = 'Automatic'
          TabOrder = 3
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 79
      Width = 802
      Height = 151
      Align = alClient
      TabOrder = 1
      object llinkedlines: TLabel
        Left = 1
        Top = 1
        Width = 800
        Height = 13
        Align = alTop
        Caption = 'Linked to line'
        ExplicitWidth = 63
      end
      object cxTop: TcxGrid
        Left = 1
        Top = 14
        Width = 800
        Height = 136
        Align = alClient
        TabOrder = 0
        object cxTopDBTableView1: TcxGridDBTableView
          OnDblClick = DBGrid1DblClick
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = cxTopDBTableView1CustomDrawCell
          DataController.DataSource = dsLinkedDetail
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FAMOUNT'
              Column = cxTopDBTableView1FAMOUNT
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FAMOUNT_1'
              Column = cxTopDBTableView1FAMOUNT_1
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FOUTSTANDINGAMOUNT'
              Column = cxTopDBTableView1FOUTSTANDINGAMOUNT
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Appending = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object cxTopDBTableView1DDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DDATE'
          end
          object cxTopDBTableView1SREFERENCE: TcxGridDBColumn
            DataBinding.FieldName = 'SREFERENCE'
          end
          object cxTopDBTableView1SDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SDESCRIPTION'
            Width = 228
          end
          object cxTopDBTableView1FAMOUNT_1: TcxGridDBColumn
            DataBinding.FieldName = 'FAMOUNT_1'
          end
          object cxTopDBTableView1FOUTSTANDINGAMOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'FOUTSTANDINGAMOUNT'
          end
          object cxTopDBTableView1FAMOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'FAMOUNT'
          end
          object cxTopDBTableView1SALIAS: TcxGridDBColumn
            DataBinding.FieldName = 'SALIAS'
          end
        end
        object cxTopLevel1: TcxGridLevel
          GridView = cxTopDBTableView1
        end
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 1
      Top = 71
      Width = 802
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      AlignSplitter = salTop
      AutoSnap = True
      Control = Panel2
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 239
    Width = 804
    Height = 220
    Align = alClient
    TabOrder = 2
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 802
      Height = 37
      Align = alTop
      TabOrder = 0
      object lopenlines: TLabel
        Left = 1
        Top = 1
        Width = 800
        Height = 13
        Align = alTop
        Caption = 'Lines open'
        ExplicitWidth = 52
      end
      object bcloseline: TBitBtn
        Left = 420
        Top = 7
        Width = 157
        Height = 21
        Caption = '<>'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = bCloseDivClick
      end
      object EFindline: TEdit
        Left = 176
        Top = 7
        Width = 121
        Height = 21
        TabOrder = 1
        OnKeyPress = EFindlineKeyPress
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 38
      Width = 802
      Height = 181
      Align = alClient
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = OidbGridDblClick
        OnKeyPress = cxGrid1DBTableView1KeyPress
        NavigatorButtons.ConfirmDelete = False
        OnEditKeyDown = cxGrid1DBTableView1EditKeyDown
        DataController.DataSource = dsOilinks
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            FieldName = 'WLINKEDAMOUNT'
            Column = cxGrid1DBTableView1WLINKEDAMOUNT
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'WFULLAMOUNT'
            Column = cxGrid1DBTableView1WFULLAMOUNT
          end
          item
            Format = '0.00'
            Kind = skSum
            FieldName = 'WOUTSTANDINGAMOUNT'
            Column = cxGrid1DBTableView1WOUTSTANDINGAMOUNT
          end
          item
            FieldName = 'WOUTSTANDINGAMOUNT'
            Column = cxGrid1DBTableView1UNUSED2
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ImmediateEditor = False
        OptionsData.Deleting = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        OnCustomDrawFooterCell = cxGrid1DBTableView1CustomDrawFooterCell
        object cxGrid1DBTableView1DDOCDATE: TcxGridDBColumn
          DataBinding.FieldName = 'DDOCDATE'
          Options.Editing = False
          Width = 72
        end
        object cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn
          DataBinding.FieldName = 'SREFERENCE'
          Options.Editing = False
          Width = 76
        end
        object cxGrid1DBTableView1SLINKEDREFERENCE: TcxGridDBColumn
          DataBinding.FieldName = 'SLINKEDREFERENCE'
          Options.Editing = False
          Width = 70
        end
        object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'SDESCRIPTION'
          Options.Editing = False
          Width = 155
        end
        object cxGrid1DBTableView1WFULLAMOUNT: TcxGridDBColumn
          DataBinding.FieldName = 'WFULLAMOUNT'
          RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
          Options.Editing = False
          Width = 81
        end
        object cxGrid1DBTableView1WOUTSTANDINGAMOUNT: TcxGridDBColumn
          DataBinding.FieldName = 'WOUTSTANDINGAMOUNT'
          RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
          Options.Editing = False
          Width = 89
        end
        object cxGrid1DBTableView1WLINKEDAMOUNT: TcxGridDBColumn
          DataBinding.FieldName = 'WLINKEDAMOUNT'
          RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
          Width = 102
        end
        object cxGrid1DBTableView1UNUSED2: TcxGridDBColumn
          Caption = 'X'
          DataBinding.FieldName = 'UNUSED2'
          RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
          Width = 90
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 231
    Width = 804
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salTop
    AutoSnap = True
    Control = Panel1
  end
  object ZQTransAction: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        ' select a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.' +
        'FAMOUNT, a.FOUTSTANDINGAMOUNT ORGOUTSTAND , sum(b.FAMOUNT) AMTPR' +
        'E '
      
        ' from transact a left join OILINKSPRE b on a.WTRANSACTIONID = b.' +
        'WTRANSACTIONID where a.WAccountId = :WAccountId and a.FoutStandi' +
        'ngAmount <> 0 '
      
        'group by a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a' +
        '.FAMOUNT, a.FOUTSTANDINGAMOUNT order by a.ddate asc ')
    UpdateObject = ZUSQLTransAction
    OnCalcFields = ZQTransActionCalcFields
    Left = 196
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountId'
      end>
    object ZQTransActionWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQTransActionDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQTransActionSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQTransActionWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object ZQTransActionFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object ZQTransActionORGOUTSTAND: TFloatField
      FieldName = 'ORGOUTSTAND'
    end
    object ZQTransActionAMTPRE: TFloatField
      FieldName = 'AMTPRE'
      ReadOnly = True
    end
    object ZQTransActionFOUTSTANDINGAMOUNT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FOUTSTANDINGAMOUNT'
      Calculated = True
    end
  end
  object ZUSQLTransAction: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO transact'
      
        '  (transact.WTRANSACTIONID, transact.WBATCHID, transact.WBATCHTY' +
        'PEID, transact.WLINEID, '
      
        '   transact.BCARRIEDFORWARD, transact.BLASTYEAR, transact.BLINKS' +
        'USED, transact.BMULTIPLEITEMS, '
      
        '   transact.WACCOUNTID, transact.DDATE, transact.WPERIODID, tran' +
        'sact.WYEARID, '
      
        '   transact.SREFERENCE, transact.FTAXRATE, transact.WTAXACCOUNTI' +
        'D, transact.FAMOUNT, '
      
        '   transact.FTAXAMOUNT, transact.FOUTSTANDINGAMOUNT, transact.BR' +
        'ECONCILED, '
      
        '   transact.WBALANCINGACCOUNTID, transact.WDESCRIPTIONID, transa' +
        'ct.WCURRENCYID, '
      
        '   transact.FFOREXAMOUNT, transact.WUSERID, transact.UNUSED, tra' +
        'nsact.DSYSDATE, '
      
        '   transact.BUNUSED, transact.WTAX2ID, transact.FCURRENCYRATE2, ' +
        'transact.FTAXRATE2, '
      
        '   transact.FTAX2AMOUNT, transact.WJOBCODEID, transact.WPROFILEI' +
        'D, transact.BEXCLUSIVE, '
      
        '   transact.WLINKEDID, transact.WREPORTINGGROUP1ID, transact.WRE' +
        'PORTINGGROUP2ID, '
      '   transact.WDOCID)'
      'VALUES'
      
        '  (:WTRANSACTIONID, :WBATCHID, :WBATCHTYPEID, :WLINEID, :BCARRIE' +
        'DFORWARD, '
      
        '   :BLASTYEAR, :BLINKSUSED, :BMULTIPLEITEMS, :WACCOUNTID, :DDATE' +
        ', :WPERIODID, '
      
        '   :WYEARID, :SREFERENCE, :FTAXRATE, :WTAXACCOUNTID, :FAMOUNT, :' +
        'FTAXAMOUNT, '
      
        '   :FOUTSTANDINGAMOUNT, :BRECONCILED, :WBALANCINGACCOUNTID, :WDE' +
        'SCRIPTIONID, '
      
        '   :WCURRENCYID, :FFOREXAMOUNT, :WUSERID, :UNUSED, :DSYSDATE, :B' +
        'UNUSED, '
      
        '   :WTAX2ID, :FCURRENCYRATE2, :FTAXRATE2, :FTAX2AMOUNT, :WJOBCOD' +
        'EID, :WPROFILEID, '
      
        '   :BEXCLUSIVE, :WLINKEDID, :WREPORTINGGROUP1ID, :WREPORTINGGROU' +
        'P2ID, :WDOCID)')
    DeleteSQL.Strings = (
      'DELETE FROM transact'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    ModifySQL.Strings = (
      'UPDATE transact SET'
      '  transact.WTRANSACTIONID = :WTRANSACTIONID,'
      '  transact.WBATCHID = :WBATCHID,'
      '  transact.WBATCHTYPEID = :WBATCHTYPEID,'
      '  transact.WLINEID = :WLINEID,'
      '  transact.BCARRIEDFORWARD = :BCARRIEDFORWARD,'
      '  transact.BLASTYEAR = :BLASTYEAR,'
      '  transact.BLINKSUSED = :BLINKSUSED,'
      '  transact.BMULTIPLEITEMS = :BMULTIPLEITEMS,'
      '  transact.WACCOUNTID = :WACCOUNTID,'
      '  transact.DDATE = :DDATE,'
      '  transact.WPERIODID = :WPERIODID,'
      '  transact.WYEARID = :WYEARID,'
      '  transact.SREFERENCE = :SREFERENCE,'
      '  transact.FTAXRATE = :FTAXRATE,'
      '  transact.WTAXACCOUNTID = :WTAXACCOUNTID,'
      '  transact.FAMOUNT = :FAMOUNT,'
      '  transact.FTAXAMOUNT = :FTAXAMOUNT,'
      '  transact.FOUTSTANDINGAMOUNT = :FOUTSTANDINGAMOUNT,'
      '  transact.BRECONCILED = :BRECONCILED,'
      '  transact.WBALANCINGACCOUNTID = :WBALANCINGACCOUNTID,'
      '  transact.WDESCRIPTIONID = :WDESCRIPTIONID,'
      '  transact.WCURRENCYID = :WCURRENCYID,'
      '  transact.FFOREXAMOUNT = :FFOREXAMOUNT,'
      '  transact.WUSERID = :WUSERID,'
      '  transact.UNUSED = :UNUSED,'
      '  transact.DSYSDATE = :DSYSDATE,'
      '  transact.BUNUSED = :BUNUSED,'
      '  transact.WTAX2ID = :WTAX2ID,'
      '  transact.FCURRENCYRATE2 = :FCURRENCYRATE2,'
      '  transact.FTAXRATE2 = :FTAXRATE2,'
      '  transact.FTAX2AMOUNT = :FTAX2AMOUNT,'
      '  transact.WJOBCODEID = :WJOBCODEID,'
      '  transact.WPROFILEID = :WPROFILEID,'
      '  transact.BEXCLUSIVE = :BEXCLUSIVE,'
      '  transact.WLINKEDID = :WLINKEDID,'
      '  transact.WREPORTINGGROUP1ID = :WREPORTINGGROUP1ID,'
      '  transact.WREPORTINGGROUP2ID = :WREPORTINGGROUP2ID,'
      '  transact.WDOCID = :WDOCID'
      'WHERE'
      '  transact.WTRANSACTIONID = :OLD_WTRANSACTIONID')
    Left = 372
    Top = 172
  end
  object ZQOILinks: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select OILinks.*,Messages.* from OILinks  join transact on OILin' +
        'ks.WAmountTransactionId = '
      
        'transact.WtransactionID join messages on (transact.WDescriptionI' +
        'd = Messages.WMessageId)')
    UpdateObject = ZUSQLOIlinks
    AfterInsert = ZQOILinksAfterInsert
    BeforePost = ZQOILinksBeforePost
    Left = 132
    Top = 172
    object ZQOILinksWOILINKSID: TIntegerField
      FieldName = 'WOILINKSID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ZQOILinksDDOCDATE: TDateTimeField
      FieldName = 'DDOCDATE'
    end
    object ZQOILinksSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object ZQOILinksSLINKEDREFERENCE: TStringField
      FieldName = 'SLINKEDREFERENCE'
      Size = 15
    end
    object ZQOILinksWFULLAMOUNT: TFloatField
      FieldName = 'WFULLAMOUNT'
    end
    object ZQOILinksWOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'WOUTSTANDINGAMOUNT'
    end
    object ZQOILinksWLINKEDAMOUNT: TFloatField
      FieldName = 'WLINKEDAMOUNT'
    end
    object ZQOILinksDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQOILinksUNUSED1: TIntegerField
      FieldName = 'UNUSED1'
    end
    object ZQOILinksWAMOUNTTRANSACTIONID: TIntegerField
      FieldName = 'WAMOUNTTRANSACTIONID'
    end
    object ZQOILinksWLINKTRANSACTIONID: TIntegerField
      FieldName = 'WLINKTRANSACTIONID'
    end
    object ZQOILinksWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQOILinksUNUSED2: TIntegerField
      FieldName = 'UNUSED2'
    end
    object ZQOILinksWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object ZQOILinksWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQOILinksWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object ZQOILinksDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQOILinksSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
  end
  object ZUSQLOIlinks: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO oilinks'
      '  (oilinks.WOILINKSID, oilinks.DDOCDATE, oilinks.SREFERENCE, '
      'oilinks.SLINKEDREFERENCE, '
      '   oilinks.WFULLAMOUNT, oilinks.WOUTSTANDINGAMOUNT, '
      'oilinks.WLINKEDAMOUNT, '
      '   oilinks.DDATE, oilinks.UNUSED1, '
      'oilinks.WAMOUNTTRANSACTIONID, oilinks.WLINKTRANSACTIONID, '
      '   oilinks.WUSERID, oilinks.UNUSED2, oilinks.WBATCHID, '
      'oilinks.WACCOUNTID, '
      '   oilinks.WTAXID, oilinks.DSYSDATE)'
      'VALUES'
      '  (:WOILINKSID, :DDOCDATE, :SREFERENCE, :SLINKEDREFERENCE, '
      ':WFULLAMOUNT, '
      '   :WOUTSTANDINGAMOUNT, :WLINKEDAMOUNT, :DDATE, '
      ':UNUSED1, :WAMOUNTTRANSACTIONID, '
      '   :WLINKTRANSACTIONID, :WUSERID, :UNUSED2, :WBATCHID, '
      ':WACCOUNTID, :WTAXID, '
      '   :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM oilinks'
      'WHERE'
      '  oilinks.WOILINKSID = :OLD_WOILINKSID')
    ModifySQL.Strings = (
      'UPDATE oilinks SET'
      '  oilinks.WOILINKSID = :WOILINKSID,'
      '  oilinks.DDOCDATE = :DDOCDATE,'
      '  oilinks.SREFERENCE = :SREFERENCE,'
      '  oilinks.SLINKEDREFERENCE = :SLINKEDREFERENCE,'
      '  oilinks.WFULLAMOUNT = :WFULLAMOUNT,'
      '  oilinks.WOUTSTANDINGAMOUNT = :WOUTSTANDINGAMOUNT,'
      '  oilinks.WLINKEDAMOUNT = :WLINKEDAMOUNT,'
      '  oilinks.DDATE = :DDATE,'
      '  oilinks.UNUSED1 = :UNUSED1,'
      '  oilinks.WAMOUNTTRANSACTIONID = :WAMOUNTTRANSACTIONID,'
      '  oilinks.WLINKTRANSACTIONID = :WLINKTRANSACTIONID,'
      '  oilinks.WUSERID = :WUSERID,'
      '  oilinks.UNUSED2 = :UNUSED2,'
      '  oilinks.WBATCHID = :WBATCHID,'
      '  oilinks.WACCOUNTID = :WACCOUNTID,'
      '  oilinks.WTAXID = :WTAXID,'
      '  oilinks.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  oilinks.WOILINKSID = :OLD_WOILINKSID')
    Left = 452
    Top = 100
  end
  object dsOilinks: TDataSource
    DataSet = ZQOILinks
    Left = 364
    Top = 116
  end
  object ZQOILINKSPRE: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from oilinkspre where Wtransactionid = :id'
      'and WBATCHID = :BatchCtrlID and WLINEID = :BatLineID ;')
    UpdateObject = ZUSQLLinksPre
    AfterInsert = ZQOILINKSPREAfterInsert
    Left = 280
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftUnknown
        Name = 'BatchCtrlID'
      end
      item
        DataType = ftUnknown
        Name = 'BatLineID'
      end>
    object ZQOILINKSPREWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQOILINKSPREWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQOILINKSPREWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQOILINKSPREWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQOILINKSPREFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
  end
  object ZUSQLLinksPre: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO oilinkspre'
      '  (WBATCHID, WLINEID, WBATCHTYPEID, WTRANSACTIONID, FAMOUNT)'
      'VALUES'
      
        '  (:WBATCHID, :WLINEID, :WBATCHTYPEID, :WTRANSACTIONID, :FAMOUNT' +
        ')')
    DeleteSQL.Strings = (
      'DELETE FROM oilinkspre'
      'WHERE'
      '  oilinkspre.WBATCHID = :OLD_WBATCHID AND'
      '  oilinkspre.WLINEID = :OLD_WLINEID')
    ModifySQL.Strings = (
      'UPDATE oilinkspre SET'
      '  WBATCHID = :WBATCHID,'
      '  WLINEID = :WLINEID,'
      '  WBATCHTYPEID = :WBATCHTYPEID,'
      '  WTRANSACTIONID = :WTRANSACTIONID,'
      '  FAMOUNT = :FAMOUNT'
      'WHERE'
      '  oilinkspre.WBATCHID = :OLD_WBATCHID AND'
      '  oilinkspre.WLINEID = :OLD_WLINEID')
    Left = 508
    Top = 148
  end
  object ZQLinkeddetail: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select * from transact  a join oilinkspre b on a.Wtransactionid ' +
        '= b.Wtransactionid'
      'left JOIN MESSAGES c ON (a.WDESCRIPTIONID = c.WMESSAGEID) '
      'join v_account e on a.waccountid = e.Waccountid'
      'join batcon d on b.WBATCHID = d.WBATCHID'
      'where b.wlineid = :Wlineid and  b.WBATCHID = :WBATCHID')
    UpdateObject = ZUPDSQLLinkeddetail
    Left = 224
    Top = 228
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Wlineid'
      end
      item
        DataType = ftUnknown
        Name = 'WBATCHID'
      end>
    object ZQLinkeddetailWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
      Required = True
    end
    object ZQLinkeddetailWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object ZQLinkeddetailWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
      Required = True
    end
    object ZQLinkeddetailWLINEID: TIntegerField
      FieldName = 'WLINEID'
      Required = True
    end
    object ZQLinkeddetailBCARRIEDFORWARD: TSmallintField
      FieldName = 'BCARRIEDFORWARD'
    end
    object ZQLinkeddetailBLASTYEAR: TSmallintField
      FieldName = 'BLASTYEAR'
    end
    object ZQLinkeddetailBLINKSUSED: TSmallintField
      FieldName = 'BLINKSUSED'
    end
    object ZQLinkeddetailBMULTIPLEITEMS: TSmallintField
      FieldName = 'BMULTIPLEITEMS'
    end
    object ZQLinkeddetailWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQLinkeddetailDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object ZQLinkeddetailWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQLinkeddetailWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object ZQLinkeddetailSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object ZQLinkeddetailFTAXRATE: TFloatField
      FieldName = 'FTAXRATE'
    end
    object ZQLinkeddetailWTAXACCOUNTID: TIntegerField
      FieldName = 'WTAXACCOUNTID'
    end
    object ZQLinkeddetailFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      Required = True
    end
    object ZQLinkeddetailFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQLinkeddetailFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object ZQLinkeddetailBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object ZQLinkeddetailWBALANCINGACCOUNTID: TIntegerField
      FieldName = 'WBALANCINGACCOUNTID'
    end
    object ZQLinkeddetailWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object ZQLinkeddetailWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object ZQLinkeddetailFFOREXAMOUNT: TFloatField
      FieldName = 'FFOREXAMOUNT'
    end
    object ZQLinkeddetailWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object ZQLinkeddetailUNUSED: TIntegerField
      FieldName = 'UNUSED'
    end
    object ZQLinkeddetailDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQLinkeddetailBUNUSED: TSmallintField
      FieldName = 'BUNUSED'
    end
    object ZQLinkeddetailWTAX2ID: TIntegerField
      FieldName = 'WTAX2ID'
    end
    object ZQLinkeddetailFCURRENCYRATE2: TFloatField
      FieldName = 'FCURRENCYRATE2'
    end
    object ZQLinkeddetailFTAXRATE2: TFloatField
      FieldName = 'FTAXRATE2'
    end
    object ZQLinkeddetailFTAX2AMOUNT: TFloatField
      FieldName = 'FTAX2AMOUNT'
    end
    object ZQLinkeddetailWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object ZQLinkeddetailWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQLinkeddetailBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object ZQLinkeddetailWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object ZQLinkeddetailWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQLinkeddetailWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQLinkeddetailWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQLinkeddetailDPAYMENTDATE: TDateTimeField
      FieldName = 'DPAYMENTDATE'
    end
    object ZQLinkeddetailWREMITTANCECOUNT: TIntegerField
      FieldName = 'WREMITTANCECOUNT'
    end
    object ZQLinkeddetailWPAYMENTTYPE: TIntegerField
      FieldName = 'WPAYMENTTYPE'
    end
    object ZQLinkeddetailWBATCHID_1: TIntegerField
      FieldName = 'WBATCHID_1'
      Required = True
    end
    object ZQLinkeddetailWLINEID_1: TIntegerField
      FieldName = 'WLINEID_1'
      Required = True
    end
    object ZQLinkeddetailWBATCHTYPEID_1: TIntegerField
      FieldName = 'WBATCHTYPEID_1'
      Required = True
    end
    object ZQLinkeddetailWTRANSACTIONID_1: TIntegerField
      FieldName = 'WTRANSACTIONID_1'
      Required = True
    end
    object ZQLinkeddetailFAMOUNT_1: TFloatField
      FieldName = 'FAMOUNT_1'
    end
    object ZQLinkeddetailWMESSAGEID: TIntegerField
      FieldName = 'WMESSAGEID'
      Required = True
    end
    object ZQLinkeddetailSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object ZQLinkeddetailSEXTRADESCRIPTION: TStringField
      FieldName = 'SEXTRADESCRIPTION'
      Size = 255
    end
    object ZQLinkeddetailWACCOUNTID_1: TIntegerField
      FieldName = 'WACCOUNTID_1'
      Required = True
    end
    object ZQLinkeddetailSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQLinkeddetailSMAINACCOUNTCODE: TStringField
      FieldName = 'SMAINACCOUNTCODE'
      Size = 4
    end
    object ZQLinkeddetailSSUBACCOUNTCODE: TStringField
      FieldName = 'SSUBACCOUNTCODE'
      Size = 3
    end
    object ZQLinkeddetailSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 64
    end
    object ZQLinkeddetailWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object ZQLinkeddetailWREPORTINGGROUP1ID_1: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID_1'
      Required = True
    end
    object ZQLinkeddetailWREPORTINGGROUP2ID_1: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID_1'
      Required = True
    end
    object ZQLinkeddetailBSUBACCOUNTS: TSmallintField
      FieldName = 'BSUBACCOUNTS'
      Required = True
    end
    object ZQLinkeddetailBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
    object ZQLinkeddetailBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object ZQLinkeddetailBINACTIVE: TSmallintField
      FieldName = 'BINACTIVE'
    end
    object ZQLinkeddetailDSYSDATE_1: TDateTimeField
      FieldName = 'DSYSDATE_1'
    end
    object ZQLinkeddetailWPROFILEID_1: TIntegerField
      FieldName = 'WPROFILEID_1'
    end
    object ZQLinkeddetailWLINKACCOUNT: TIntegerField
      FieldName = 'WLINKACCOUNT'
    end
    object ZQLinkeddetailWTAXACCOUNT: TIntegerField
      FieldName = 'WTAXACCOUNT'
    end
    object ZQLinkeddetailWCURRENCYID_1: TIntegerField
      FieldName = 'WCURRENCYID_1'
    end
    object ZQLinkeddetailWBATCHID_2: TIntegerField
      FieldName = 'WBATCHID_2'
      Required = True
    end
    object ZQLinkeddetailWUSERID_1: TIntegerField
      FieldName = 'WUSERID_1'
      Required = True
    end
    object ZQLinkeddetailWBATCHTYPEID_2: TIntegerField
      FieldName = 'WBATCHTYPEID_2'
      Required = True
    end
    object ZQLinkeddetailSBATCHNUMBER: TStringField
      FieldName = 'SBATCHNUMBER'
      Size = 8
    end
    object ZQLinkeddetailBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object ZQLinkeddetailBIMPORTED: TSmallintField
      FieldName = 'BIMPORTED'
    end
    object ZQLinkeddetailBDOCSOURCE: TSmallintField
      FieldName = 'BDOCSOURCE'
    end
    object ZQLinkeddetailWLINECOUNT: TIntegerField
      FieldName = 'WLINECOUNT'
    end
    object ZQLinkeddetailSFILENAME: TStringField
      FieldName = 'SFILENAME'
      Size = 16
    end
    object ZQLinkeddetailWDOCID_1: TIntegerField
      FieldName = 'WDOCID_1'
    end
    object ZQLinkeddetailDSYSDATE_2: TDateTimeField
      FieldName = 'DSYSDATE_2'
    end
    object ZQLinkeddetailWINITBATID: TIntegerField
      FieldName = 'WINITBATID'
    end
    object ZQLinkeddetailSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object ZQLinkeddetailSUNIQUEID: TStringField
      FieldName = 'SUNIQUEID'
      Size = 8
    end
  end
  object dsLinkedDetail: TDataSource
    DataSet = ZQLinkeddetail
    Left = 152
    Top = 276
  end
  object ZUPDSQLLinkeddetail: TUniUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM OILINKSPRE'
      'WHERE'
      '  OILINKSPRE.WBATCHID = :OLD_WBATCHID_1 AND'
      '  OILINKSPRE.WLINEID = :OLD_WLINEID_1 AND'
      '  OILINKSPRE.WTRANSACTIONID = :OLD_WTRANSACTIONID_1')
    ModifySQL.Strings = (
      'UPDATE OILINKSPRE SET'
      '  FAMOUNT = :FAMOUNT_1'
      'WHERE'
      '  OILINKSPRE.WBATCHID = :OLD_WBATCHID_1 AND'
      '  OILINKSPRE.WLINEID = :OLD_WLINEID_1 AND'
      '  OILINKSPRE.WTRANSACTIONID = :OLD_WTRANSACTIONID_1')
    Left = 284
    Top = 152
  end
  object PopupMenu1: TPopupMenu
    Left = 332
    Top = 20
    object Copy1: TMenuItem
      Caption = 'Copy to search'
      OnClick = Copy1Click
    end
  end
end
