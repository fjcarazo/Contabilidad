object fmEditAccountRef: TfmEditAccountRef
  Left = 184
  Top = 188
  Width = 684
  Height = 394
  Caption = 'Edit account ref'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 676
    Height = 360
    ActivePage = tsdetail
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object tsdetail: TTabSheet
      Caption = 'detail'
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 105
        Width = 668
        Height = 37
        DataSource = dsRefs
        Align = alTop
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 105
        Align = alTop
        TabOrder = 1
        DesignSize = (
          668
          105)
        object Label1: TLabel
          Left = 8
          Top = 3
          Width = 25
          Height = 14
          Caption = 'Code'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 120
          Top = 2
          Width = 53
          Height = 13
          Caption = 'Description'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 8
          Top = 44
          Width = 91
          Height = 13
          Caption = 'Std bankaccountnr'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 17
          Width = 95
          Height = 21
          Color = clBtnFace
          DataField = 'SACCOUNTCODE'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 120
          Top = 17
          Width = 537
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          DataField = 'SDESCRIPTION'
          DataSource = DataSource1
          ReadOnly = True
          TabOrder = 1
        end
        object Memo1: TMemo
          Left = 8
          Top = 64
          Width = 649
          Height = 37
          Anchors = [akLeft, akTop, akRight]
          Color = clBtnFace
          Lines.Strings = (
            
              'Bankimport extra link functions. Enter bank account for exact ma' +
              'tch on account. Enter text with a # prefix to look inside a impo' +
              'rted '
            
              'bankline to see if the text is in that string. Text will be sear' +
              'ched uppercased.')
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 120
          Top = 40
          Width = 233
          Height = 21
          DataField = 'SBANKACCOUNTNUMBER'
          DataSource = DataSource1
          ParentColor = True
          ReadOnly = True
          TabOrder = 3
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 142
        Width = 668
        Height = 190
        Align = alClient
        TabOrder = 2
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsRefs
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn
            Caption = 'REFERENCE'
            DataBinding.FieldName = 'SREFERENCE'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object tsList: TTabSheet
      Caption = 'List'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 668
        Height = 41
        Align = alTop
        TabOrder = 0
        object Button1: TButton
          Left = 12
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Detail'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 41
        Width = 668
        Height = 291
        Align = alClient
        TabOrder = 1
        object cxGrid2DBTableView1: TcxGridDBTableView
          OnDblClick = Button1Click
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource2
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid2DBTableView1SREFERENCE: TcxGridDBColumn
            DataBinding.FieldName = 'SREFERENCE'
            Width = 233
          end
          object cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn
            DataBinding.FieldName = 'SACCOUNTCODE'
            Width = 103
          end
          object cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SDESCRIPTION'
            Width = 327
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
  end
  object ZQRefs: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from accountRef where Waccountid = :WAccountid')
    UpdateObject = ZUSQLRefs
    BeforeOpen = ZQRefsBeforeOpen
    BeforePost = ZQRefsBeforePost
    Left = 152
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WAccountid'
      end>
    object ZQRefsWACCOUNTREFID: TIntegerField
      FieldName = 'WACCOUNTREFID'
    end
    object ZQRefsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object ZQRefsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object qAccountinfo: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select SAccountcode,SDescription,debtor.SBANKACCOUNTNUMBER from ' +
        'account join debtor on account.Waccountid =Debtor.Waccountid'
      ' where account.Waccountid = :Waccountid'
      'union'
      
        'select SAccountcode,SDescription,creditor.SBANKACCOUNTNUMBER fro' +
        'm account join creditor on account.Waccountid =creditor.Waccount' +
        'id'
      ' where Account.Waccountid = :Waccountid2'
      'union'
      'select SAccountcode,SDescription,'#39'n.v.t.'#39' from account '
      ' where Account.Waccountid = :Waccountid3'
      '')
    Left = 232
    Top = 132
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Waccountid'
      end
      item
        DataType = ftUnknown
        Name = 'Waccountid2'
      end
      item
        DataType = ftUnknown
        Name = 'Waccountid3'
      end>
    object qAccountinfoSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object qAccountinfoSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 40
    end
    object qAccountinfoSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
  end
  object DataSource1: TDataSource
    DataSet = qAccountinfo
    Left = 192
    Top = 212
  end
  object dsRefs: TDataSource
    DataSet = ZQRefs
    Left = 328
    Top = 152
  end
  object ZUSQLRefs: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO accountRef'
      
        '  (accountRef.WACCOUNTREFID, accountRef.SREFERENCE, accountRef.W' +
        'ACCOUNTID)'
      'VALUES'
      '  (:WACCOUNTREFID, :SREFERENCE, :WACCOUNTID)')
    DeleteSQL.Strings = (
      'DELETE FROM accountRef'
      'WHERE'
      '   accountRef.WACCOUNTREFID = :OLD_WACCOUNTREFID ')
    ModifySQL.Strings = (
      'UPDATE accountRef SET'
      '  accountRef.WACCOUNTREFID = :WACCOUNTREFID,'
      '  accountRef.SREFERENCE = :SREFERENCE,'
      '  accountRef.WACCOUNTID = :WACCOUNTID'
      'WHERE'
      ' accountRef.WACCOUNTREFID '
      '= :OLD_WACCOUNTREFID ')
    Left = 112
    Top = 160
  end
  object ZQRefList: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select account.Waccountid, Sreference , SAccountcode,SDescriptio' +
        'n from accountref join account on accountref.WAccountid = accoun' +
        't.Waccountid'
      'order by SAccountcode')
    Left = 400
    Top = 156
    object ZQRefListWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQRefListSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 35
    end
    object ZQRefListSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 7
    end
    object ZQRefListSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 40
    end
  end
  object DataSource2: TDataSource
    DataSet = ZQRefList
    Left = 320
    Top = 208
  end
end
