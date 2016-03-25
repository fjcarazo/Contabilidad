object FormReverseBatch: TFormReverseBatch
  Left = 504
  Top = 107
  Caption = 'Reverse batch'
  ClientHeight = 457
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 845
    Height = 457
    ActivePage = TSBatches
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TSBatches: TTabSheet
      Caption = 'Batches'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object POkbutton: TPanel
        Left = 0
        Top = 390
        Width = 837
        Height = 39
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        OnDblClick = POkbuttonDblClick
        DesignSize = (
          837
          39)
        object BitBtn1: TBitBtn
          Left = 638
          Top = 9
          Width = 97
          Height = 25
          Anchors = [akTop, akRight]
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
          TabOrder = 0
          Visible = False
        end
        object BitBtn2: TBitBtn
          Left = 742
          Top = 9
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'OK'
          Default = True
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
          TabOrder = 1
        end
      end
      object cxbatches: TcxGrid
        Left = 0
        Top = 73
        Width = 837
        Height = 317
        Align = alClient
        TabOrder = 1
        object cxbatchesDBTableView1: TcxGridDBTableView
          OnDblClick = DBGrid1DblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DSBatcon
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              FieldName = 'WBatchId'
              Column = cxbatchesDBTableView1WBatchId
            end>
          DataController.Summary.SummaryGroups = <
            item
              Links = <>
              SummaryItems = <
                item
                  Format = '0'
                  Kind = skCount
                  FieldName = 'WBatchId'
                  Column = cxbatchesDBTableView1WBatchId
                end>
            end>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.MultiSelect = True
          OptionsSelection.CellMultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfAlwaysVisible
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxbatchesDBTableView1WBatchId: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'WBatchId'
          end
          object cxbatchesDBTableView1SAlias: TcxGridDBColumn
            Caption = 'Alias'
            DataBinding.FieldName = 'SAlias'
          end
          object cxbatchesDBTableView1dsysdate: TcxGridDBColumn
            Caption = 'Sysdate'
            DataBinding.FieldName = 'dsysdate'
            DateTimeGrouping = dtgRelativeToToday
          end
          object cxbatchesDBTableView1linecount: TcxGridDBColumn
            DataBinding.FieldName = 'linecount'
          end
          object cxbatchesDBTableView1wdocid: TcxGridDBColumn
            DataBinding.FieldName = 'wdocid'
          end
          object cxbatchesDBTableView1MINDATE: TcxGridDBColumn
            Caption = 'Min Date'
            DataBinding.FieldName = 'MINDATE'
            DateTimeGrouping = dtgByMonth
          end
          object cxbatchesDBTableView1MAXDATE: TcxGridDBColumn
            Caption = 'Max Date'
            DataBinding.FieldName = 'MAXDATE'
            DateTimeGrouping = dtgByMonth
          end
        end
        object cxbatchesLevel1: TcxGridLevel
          GridView = cxbatchesDBTableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 837
        Height = 73
        Align = alTop
        TabOrder = 2
        object ID: TLabel
          Left = 9
          Top = 18
          Width = 11
          Height = 13
          Caption = 'ID'
        end
        object BDeleteBatch: TButton
          Left = 273
          Top = 32
          Width = 219
          Height = 25
          Caption = 'Reverse batch'
          TabOrder = 0
          OnClick = BDeleteBatchClick
        end
        object EFindId: TEdit
          Left = 9
          Top = 34
          Width = 121
          Height = 21
          TabOrder = 1
          OnChange = EFindIdChange
          OnDblClick = EFindIdDblClick
        end
        object Button1: TButton
          Left = 272
          Top = 2
          Width = 137
          Height = 25
          Caption = 'Recalc totals'
          TabOrder = 2
          Visible = False
          OnClick = BRecalcTotalsClick
        end
        object CBNoDocPosts: TCheckBox
          Left = 136
          Top = 32
          Width = 97
          Height = 17
          Caption = 'No doc posts'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = CBNoDocPostsClick
        end
        object BReDoAll: TButton
          Left = 124
          Top = 4
          Width = 141
          Height = 25
          Caption = 'Redo all'
          TabOrder = 4
          Visible = False
          OnClick = BReDoAllClick
        end
        object Button2: TButton
          Left = 414
          Top = 2
          Width = 78
          Height = 25
          Caption = 'Openbalans'
          TabOrder = 5
          Visible = False
          OnClick = Button2Click
        end
        object reverseYear: TButton
          Left = 36
          Top = 4
          Width = 83
          Height = 25
          Caption = 'Rollback year'
          TabOrder = 6
          Visible = False
          OnClick = reverseYearClick
        end
        object Bhardremove: TBitBtn
          Left = 512
          Top = 2
          Width = 105
          Height = 25
          Caption = 'Hard remove'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 7
          Visible = False
          OnClick = BhardremoveClick
        end
      end
    end
    object TSDocuments: TTabSheet
      Caption = 'Documents'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object BUndook: TButton
        Left = 368
        Top = 328
        Width = 75
        Height = 25
        Caption = 'ok'
        TabOrder = 0
        Visible = False
        OnClick = BUndookClick
      end
      object Memo1: TMemo
        Left = 24
        Top = 104
        Width = 417
        Height = 221
        TabOrder = 1
        Visible = False
      end
      object cxdocuments: TcxGrid
        Left = 0
        Top = 61
        Width = 837
        Height = 368
        Align = alClient
        TabOrder = 2
        object cxdocumentsDBTableView1: TcxGridDBTableView
          OnDblClick = DBGrid2DblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsDocHeader
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              FieldName = 'SDOCNO'
              Column = cxdocumentsDBTableView1SDOCNO
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              FieldName = 'SDOCNO'
              Column = cxdocumentsDBTableView1SDOCNO
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
          OptionsCustomize.DataRowSizing = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfAlwaysVisible
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxdocumentsDBTableView1SDOCNO: TcxGridDBColumn
            DataBinding.FieldName = 'SDOCNO'
            Width = 116
          end
          object cxdocumentsDBTableView1DDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DDATE'
            DateTimeGrouping = dtgByMonth
            Width = 143
          end
          object cxdocumentsDBTableView1SREFERENCE: TcxGridDBColumn
            DataBinding.FieldName = 'SREFERENCE'
            Width = 302
          end
          object cxdocumentsDBTableView1WDOCID: TcxGridDBColumn
            Caption = 'docid'
            DataBinding.FieldName = 'WDOCID'
            Width = 117
          end
        end
        object cxdocumentsLevel1: TcxGridLevel
          GridView = cxdocumentsDBTableView1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 837
        Height = 61
        Align = alTop
        TabOrder = 3
        object Label1: TLabel
          Left = 10
          Top = 18
          Width = 31
          Height = 13
          Caption = 'Doc id'
        end
        object BDocuments: TButton
          Left = 280
          Top = 28
          Width = 201
          Height = 25
          Caption = 'Reverse document'
          TabOrder = 0
          OnClick = BDocumentsClick
        end
        object BSelectFromList: TButton
          Left = 280
          Top = 0
          Width = 201
          Height = 25
          Caption = 'Select from delimeted list(enter)'
          TabOrder = 1
          OnClick = BSelectFromListClick
        end
        object EFindDocNo: TEdit
          Left = 9
          Top = 34
          Width = 121
          Height = 21
          TabOrder = 2
          OnChange = EFindDocNoChange
        end
      end
    end
    object TSDetails: TTabSheet
      Caption = 'Details'
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxDetails: TcxGrid
        Left = 0
        Top = 41
        Width = 837
        Height = 388
        Align = alClient
        TabOrder = 0
        object cxDetailsDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DSDetails
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FAMOUNT'
              Column = cxDetailsDBTableView1FAMOUNT
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FCREDIT'
              Column = cxDetailsDBTableView1FCREDIT
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FDEBIT'
              Column = cxDetailsDBTableView1FDEBIT
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              FieldName = 'WLINEID'
              Column = cxDetailsDBTableView1WLINEID
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FAMOUNT'
              Column = cxDetailsDBTableView1FAMOUNT
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FCREDIT'
              Column = cxDetailsDBTableView1FCREDIT
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FDEBIT'
              Column = cxDetailsDBTableView1FDEBIT
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'FTAXAMOUNT'
              Column = cxDetailsDBTableView1FTAXAMOUNT
            end>
          DataController.Summary.SummaryGroups = <
            item
              Links = <>
              SummaryItems = <
                item
                  Kind = skCount
                  Column = cxDetailsDBTableView1WLINEID
                end>
            end
            item
              Links = <>
              SummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FAMOUNT'
                  Column = cxDetailsDBTableView1FAMOUNT
                end>
            end
            item
              Links = <>
              SummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FCREDIT'
                  Column = cxDetailsDBTableView1FCREDIT
                end>
            end
            item
              Links = <>
              SummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FDEBIT'
                  Column = cxDetailsDBTableView1FDEBIT
                end>
            end
            item
              Links = <>
              SummaryItems = <
                item
                  Format = '0.00'
                  Kind = skSum
                  FieldName = 'FTAXAMOUNT'
                  Column = cxDetailsDBTableView1FTAXAMOUNT
                end>
            end>
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnsQuickCustomizationReordering = qcrEnabled
          OptionsCustomize.DataRowSizing = True
          OptionsCustomize.GroupRowSizing = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.Indicator = True
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxDetailsDBTableView1WTRANSACTIONID: TcxGridDBColumn
            DataBinding.FieldName = 'WTRANSACTIONID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1WBATCHID: TcxGridDBColumn
            DataBinding.FieldName = 'WBATCHID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1WLINEID: TcxGridDBColumn
            Caption = 'id'
            DataBinding.FieldName = 'WLINEID'
            Width = 42
          end
          object cxDetailsDBTableView1SREFERENCE: TcxGridDBColumn
            DataBinding.FieldName = 'SREFERENCE'
            Width = 104
          end
          object cxDetailsDBTableView1DDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DDATE'
            DateTimeGrouping = dtgByMonth
            Width = 84
          end
          object cxDetailsDBTableView1SDESCRIPTION: TcxGridDBColumn
            DataBinding.FieldName = 'SDESCRIPTION'
            Width = 191
          end
          object cxDetailsDBTableView1WACCOUNTID: TcxGridDBColumn
            DataBinding.FieldName = 'WACCOUNTID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1SACCOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'SACCOUNT'
            Width = 100
          end
          object cxDetailsDBTableView1WCONTRAACCOUNTID: TcxGridDBColumn
            DataBinding.FieldName = 'WCONTRAACCOUNTID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1SCONTRAACCOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'SCONTRAACCOUNT'
            Width = 112
          end
          object cxDetailsDBTableView1WTAXID: TcxGridDBColumn
            DataBinding.FieldName = 'WTAXID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1STAX: TcxGridDBColumn
            DataBinding.FieldName = 'STAX'
            Width = 89
          end
          object cxDetailsDBTableView1FDEBIT: TcxGridDBColumn
            DataBinding.FieldName = 'FDEBIT'
            RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
            Width = 100
          end
          object cxDetailsDBTableView1FCREDIT: TcxGridDBColumn
            DataBinding.FieldName = 'FCREDIT'
            RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
            Width = 99
          end
          object cxDetailsDBTableView1FAMOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'FAMOUNT'
            RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
            Width = 96
          end
          object cxDetailsDBTableView1FTAXAMOUNT: TcxGridDBColumn
            DataBinding.FieldName = 'FTAXAMOUNT'
            RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
            Width = 102
          end
          object cxDetailsDBTableView1DALLOCATEDDATE: TcxGridDBColumn
            DataBinding.FieldName = 'DALLOCATEDDATE'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1BEXCLUSIVE: TcxGridDBColumn
            DataBinding.FieldName = 'BEXCLUSIVE'
            RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
            Width = 112
          end
          object cxDetailsDBTableView1WLINKEDID: TcxGridDBColumn
            DataBinding.FieldName = 'WLINKEDID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1WREPORTINGGROUP1ID: TcxGridDBColumn
            DataBinding.FieldName = 'WREPORTINGGROUP1ID'
            Visible = False
            VisibleForCustomization = False
          end
          object cxDetailsDBTableView1WREPORTINGGROUP2ID: TcxGridDBColumn
            DataBinding.FieldName = 'WREPORTINGGROUP2ID'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object cxDetailsLevel1: TcxGridLevel
          GridView = cxDetailsDBTableView1
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 837
        Height = 41
        Align = alTop
        TabOrder = 1
        object bPrintdetails: TBitBtn
          Left = 8
          Top = 8
          Width = 113
          Height = 25
          Caption = 'Print'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = bPrintdetailsClick
        end
      end
    end
  end
  object DSDetails: TDataSource
    DataSet = QDetails
    Left = 124
    Top = 228
  end
  object QDetails: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from V_TRANSACTASBATCHWITHTRANSID'
      'where WBatchId =  :Param1')
    Left = 176
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Param1'
      end>
    object QDetailsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object QDetailsWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object QDetailsWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object QDetailsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QDetailsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object QDetailsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object QDetailsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QDetailsSACCOUNT: TStringField
      FieldName = 'SACCOUNT'
      Size = 7
    end
    object QDetailsWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object QDetailsSCONTRAACCOUNT: TStringField
      FieldName = 'SCONTRAACCOUNT'
      Size = 7
    end
    object QDetailsWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object QDetailsSTAX: TStringField
      FieldName = 'STAX'
      Size = 7
    end
    object QDetailsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object QDetailsFDEBIT: TFloatField
      FieldName = 'FDEBIT'
    end
    object QDetailsFCREDIT: TFloatField
      FieldName = 'FCREDIT'
    end
    object QDetailsFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object QDetailsDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object QDetailsBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object QDetailsWLINKEDID: TIntegerField
      FieldName = 'WLINKEDID'
    end
    object QDetailsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object QDetailsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
  end
  object QBatCon: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select batcon.WBatchId,coalesce(batcon.SAlias,battypes.SDescript' +
        'ion),batcon.dsysdate,'
      
        'count(transact.WBatchId) as linecount, min(transact.ddate) MinDa' +
        'te,max(transact.ddate) MaxDate ,batcon.wdocid '
      
        'from batcon join transact on (batcon.WBatchId =transact.WBatchId' +
        ') join battypes on battypes.WBatchTypeID = batcon.WBatchTypeID'
      'where BPosted = 1'
      
        'group by batcon.WBatchTypeID,batcon.WBatchId,coalesce(batcon.SAl' +
        'ias,battypes.SDescription),batcon.dsysdate,batcon.wdocid'
      'order by 6')
    Left = 212
    Top = 184
    object QBatConWBatchId: TIntegerField
      FieldName = 'WBatchId'
    end
    object QBatConSAlias: TStringField
      FieldName = 'SAlias'
      Size = 15
    end
    object QBatCondsysdate: TDateTimeField
      FieldName = 'dsysdate'
    end
    object QBatConlinecount: TIntegerField
      FieldName = 'linecount'
    end
    object QBatConwdocid: TIntegerField
      FieldName = 'wdocid'
    end
    object QBatConMINDATE: TDateTimeField
      FieldName = 'MINDATE'
      ReadOnly = True
    end
    object QBatConMAXDATE: TDateTimeField
      FieldName = 'MAXDATE'
      ReadOnly = True
    end
  end
  object DSBatcon: TDataSource
    DataSet = QBatCon
    Left = 264
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 84
    Top = 172
    object Detail1: TMenuItem
      Caption = 'Detail'
      OnClick = DBGrid1DblClick
    end
    object Report1: TMenuItem
      Caption = 'Report'
      OnClick = Report1Click
    end
  end
  object QAccounts: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select WAccountID,WPeriodId, 0 WAccountTypeid from Totals'
      'where WPeriodId not in(-1,0)')
    Left = 204
    Top = 276
    object QAccountsWaccountId: TIntegerField
      FieldName = 'WaccountId'
      Origin = 'TCBV."transact.DB".WAccountID'
    end
    object QAccountsWperiodId: TIntegerField
      FieldName = 'WperiodId'
      Origin = 'TCBV."transact.DB".WPeriodID'
    end
    object QAccountsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      ReadOnly = True
      Required = True
    end
  end
  object QGenMast: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select WAccountID,WPeriodId from Totals group by WAccountID,WPer' +
        'iodId')
    CachedUpdates = True
    Left = 164
    Top = 344
  end
  object QGen: TUniQuery
    DataTypeMap = <>
    Left = 16
    Top = 228
  end
  object ZQHistTotals: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from totalshist where Wyearid = :id')
    UpdateObject = ZUdHistTotals
    Left = 148
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end>
    object ZQHistTotalsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 10
    end
    object ZQHistTotalsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
    end
    object ZQHistTotalsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object ZQHistTotalsWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object ZQHistTotalsWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQHistTotalsBACTUAL: TSmallintField
      FieldName = 'BACTUAL'
      Required = True
    end
    object ZQHistTotalsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
    end
    object ZQHistTotalsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object ZQHistPeriods: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from periodhist where Wyearid =:year')
    UpdateObject = ZUdHistPeriods
    Left = 284
    Top = 284
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'year'
      end>
    object ZQHistPeriodsWYEARID: TIntegerField
      FieldName = 'WYEARID'
      Required = True
    end
    object ZQHistPeriodsWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object ZQHistPeriodsDSTARTDATE: TDateTimeField
      FieldName = 'DSTARTDATE'
      Required = True
    end
    object ZQHistPeriodsDENDDATE: TDateTimeField
      FieldName = 'DENDDATE'
      Required = True
    end
    object ZQHistPeriodsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 12
    end
    object ZQHistPeriodsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object ZUdHistPeriods: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO periodhist'
      
        '  (periodhist.WYEARID, periodhist.WPERIODID, periodhist.DSTARTDA' +
        'TE, periodhist.DENDDATE, '
      '   periodhist.SDESCRIPTION, periodhist.DSYSDATE)'
      'VALUES'
      
        '  (:WYEARID, :WPERIODID, :DSTARTDATE, :DENDDATE, :SDESCRIPTION, ' +
        ':DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM periodhist'
      'WHERE'
      '  periodhist.WYEARID = :OLD_WYEARID AND'
      '  periodhist.WPERIODID = :OLD_WPERIODID')
    ModifySQL.Strings = (
      'UPDATE periodhist SET'
      '  periodhist.WYEARID = :WYEARID,'
      '  periodhist.WPERIODID = :WPERIODID,'
      '  periodhist.DSTARTDATE = :DSTARTDATE,'
      '  periodhist.DENDDATE = :DENDDATE,'
      '  periodhist.SDESCRIPTION = :SDESCRIPTION,'
      '  periodhist.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  periodhist.WYEARID = :OLD_WYEARID AND'
      '  periodhist.WPERIODID = :OLD_WPERIODID')
    Left = 264
    Top = 360
  end
  object ZUdHistTotals: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO totalshist'
      '  (totalshist.SACCOUNTCODE, totalshist.WACCOUNTTYPEID, '
      'totalshist.WACCOUNTID, '
      
        '   totalshist.WYEARID, totalshist.WPERIODID, totalshist.BACTUAL,' +
        ' '
      'totalshist.FAMOUNT, '
      '   totalshist.DSYSDATE)'
      'VALUES'
      '  (:SACCOUNTCODE, :WACCOUNTTYPEID, :WACCOUNTID, '
      ':WYEARID, :WPERIODID, :BACTUAL, '
      '   :FAMOUNT, :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM totalshist'
      'WHERE'
      '  totalshist.WACCOUNTID = :OLD_WACCOUNTID AND'
      '  totalshist.WYEARID = :OLD_WYEARID AND'
      '  totalshist.WPERIODID = :OLD_WPERIODID AND'
      '  totalshist.BACTUAL = :OLD_BACTUAL')
    ModifySQL.Strings = (
      'UPDATE totalshist SET'
      '  totalshist.SACCOUNTCODE = :SACCOUNTCODE,'
      '  totalshist.WACCOUNTTYPEID = :WACCOUNTTYPEID,'
      '  totalshist.WACCOUNTID = :WACCOUNTID,'
      '  totalshist.WYEARID = :WYEARID,'
      '  totalshist.WPERIODID = :WPERIODID,'
      '  totalshist.BACTUAL = :BACTUAL,'
      '  totalshist.FAMOUNT = :FAMOUNT,'
      '  totalshist.DSYSDATE = :DSYSDATE'
      'WHERE'
      '  totalshist.WACCOUNTID = :OLD_WACCOUNTID AND'
      '  totalshist.WYEARID = :OLD_WYEARID AND'
      '  totalshist.WPERIODID = :OLD_WPERIODID AND'
      '  totalshist.BACTUAL = :OLD_BACTUAL')
    Left = 100
    Top = 324
  end
  object tblDocHeader: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from dochead where wdocid = -1')
    UpdateObject = UniUpdateSQL1
    Left = 596
    Top = 128
    object tblDocHeaderWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object tblDocHeaderSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object tblDocHeaderWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
    end
    object tblDocHeaderDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object tblDocHeaderDALLOCATEDDATE: TDateTimeField
      FieldName = 'DALLOCATEDDATE'
    end
    object tblDocHeaderWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      Required = True
    end
    object tblDocHeaderWPAYMENTTYPEID: TIntegerField
      FieldName = 'WPAYMENTTYPEID'
    end
    object tblDocHeaderWPOSTAL1ID: TIntegerField
      FieldName = 'WPOSTAL1ID'
    end
    object tblDocHeaderWPOSTAL2ID: TIntegerField
      FieldName = 'WPOSTAL2ID'
    end
    object tblDocHeaderWPOSTAL3ID: TIntegerField
      FieldName = 'WPOSTAL3ID'
    end
    object tblDocHeaderWPOSCOUNTRIES_ID: TIntegerField
      FieldName = 'WPOSCOUNTRIES_ID'
    end
    object tblDocHeaderWPOSTALCODEID: TIntegerField
      FieldName = 'WPOSTALCODEID'
    end
    object tblDocHeaderWMESSAGE1ID: TIntegerField
      FieldName = 'WMESSAGE1ID'
    end
    object tblDocHeaderWMESSAGE2ID: TIntegerField
      FieldName = 'WMESSAGE2ID'
    end
    object tblDocHeaderWMESSAGE3ID: TIntegerField
      FieldName = 'WMESSAGE3ID'
    end
    object tblDocHeaderFINVOICEDISCOUNT: TFloatField
      FieldName = 'FINVOICEDISCOUNT'
    end
    object tblDocHeaderWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object tblDocHeaderSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object tblDocHeaderWDELADDRESS1ID: TIntegerField
      FieldName = 'WDELADDRESS1ID'
    end
    object tblDocHeaderWDELADDRESS2ID: TIntegerField
      FieldName = 'WDELADDRESS2ID'
    end
    object tblDocHeaderWDELADDRESS3ID: TIntegerField
      FieldName = 'WDELADDRESS3ID'
    end
    object tblDocHeaderWDELCOUNTRIES_ID: TIntegerField
      FieldName = 'WDELCOUNTRIES_ID'
    end
    object tblDocHeaderWDELCODEID: TIntegerField
      FieldName = 'WDELCODEID'
    end
    object tblDocHeaderBPRINTED: TSmallintField
      FieldName = 'BPRINTED'
    end
    object tblDocHeaderBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object tblDocHeaderWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object tblDocHeaderWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object tblDocHeaderWPAYMENTGROUPID: TIntegerField
      FieldName = 'WPAYMENTGROUPID'
    end
    object tblDocHeaderBEXCLUSIVE: TSmallintField
      FieldName = 'BEXCLUSIVE'
    end
    object tblDocHeaderWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object tblDocHeaderFDOCAMOUNT: TFloatField
      FieldName = 'FDOCAMOUNT'
    end
    object tblDocHeaderFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object tblDocHeaderBREPEATING: TSmallintField
      FieldName = 'BREPEATING'
    end
    object tblDocHeaderDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblDocHeaderWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object tblDocHeaderWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object tblDocHeaderWTERMS: TIntegerField
      FieldName = 'WTERMS'
    end
    object tblDocHeaderWJOBCODEID: TIntegerField
      FieldName = 'WJOBCODEID'
    end
    object tblDocHeaderDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object tblDocHeaderWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblDocHeaderSEXTERNALID: TStringField
      FieldName = 'SEXTERNALID'
      Size = 50
    end
    object tblDocHeaderWPOSTALNAME: TIntegerField
      FieldName = 'WPOSTALNAME'
    end
    object tblDocHeaderWPOSTALCONTACT: TIntegerField
      FieldName = 'WPOSTALCONTACT'
    end
    object tblDocHeaderWDELNAME: TIntegerField
      FieldName = 'WDELNAME'
    end
    object tblDocHeaderWDELCONTACT: TIntegerField
      FieldName = 'WDELCONTACT'
    end
    object tblDocHeaderWTAXNUMBER: TIntegerField
      FieldName = 'WTAXNUMBER'
    end
    object tblDocHeaderWCONTRAACCOUNT: TIntegerField
      FieldName = 'WCONTRAACCOUNT'
    end
    object tblDocHeaderWOPENITEMTRANSACTID: TIntegerField
      FieldName = 'WOPENITEMTRANSACTID'
    end
    object tblDocHeaderFCURRENCYRATE: TFloatField
      FieldName = 'FCURRENCYRATE'
    end
  end
  object dsDocHeader: TDataSource
    DataSet = tblDocHeader
    Left = 520
    Top = 172
  end
  object UniUpdateSQL1: TUniUpdateSQL
    Left = 600
    Top = 180
  end
end
