object LocBatSerInput: TLocBatSerInput
  Left = 155
  Top = 149
  Caption = 'LocBatSerInput'
  ClientHeight = 637
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PBotom: TPanel
    Left = 0
    Top = 604
    Width = 979
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      979
      33)
    object BClose: TBitBtn
      Left = 907
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 979
    Height = 604
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 987
    ExplicitHeight = 606
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ExplicitLeft = -20
      ExplicitTop = 26
      DesignSize = (
        971
        576)
      object Label3: TLabel
        Left = 184
        Top = 92
        Width = 75
        Height = 13
        Caption = 'Production date'
      end
      object Label1: TLabel
        Left = 12
        Top = 48
        Width = 88
        Height = 13
        Caption = 'Serial / description'
        FocusControl = DBEdit1
      end
      object Label5: TLabel
        Left = 12
        Top = 4
        Width = 41
        Height = 13
        Caption = 'Location'
        FocusControl = DBLookupComboBox1
      end
      object Label4: TLabel
        Left = 324
        Top = 4
        Width = 16
        Height = 13
        Caption = 'Qty'
        FocusControl = DBEdit4
      end
      object Label2: TLabel
        Left = 12
        Top = 92
        Width = 71
        Height = 13
        Caption = 'Max sales date'
      end
      object SpeedButton1: TSpeedButton
        Left = 144
        Top = 108
        Width = 23
        Height = 22
        Caption = '<'
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 316
        Top = 108
        Width = 23
        Height = 22
        Caption = '<'
        OnClick = SpeedButton2Click
      end
      object DateTimePicker2: TDateTimePicker
        Left = 184
        Top = 108
        Width = 134
        Height = 21
        Date = 365245.000000000000000000
        Time = 365245.000000000000000000
        MaxDate = 365245.000000000000000000
        MinDate = 2.000000000000000000
        TabOrder = 6
        Visible = False
        OnExit = DateTimePicker2Exit
        OnKeyPress = DBLookupComboBox1KeyPress
        OnKeyUp = DBLookupComboBox1KeyUp
      end
      object DateTimePicker1: TDateTimePicker
        Left = 12
        Top = 108
        Width = 134
        Height = 21
        Date = 40114.000000000000000000
        Time = 40114.000000000000000000
        MaxDate = 365245.000000000000000000
        MinDate = 2.000000000000000000
        TabOrder = 4
        Visible = False
        OnExit = DateTimePicker1Exit
        OnKeyPress = DBLookupComboBox1KeyPress
        OnKeyUp = DBLookupComboBox1KeyUp
      end
      object DBGrid1: TDBGrid
        Left = 10
        Top = 172
        Width = 939
        Height = 392
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DSData
        TabOrder = 8
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyUp = DBLookupComboBox1KeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'LOCATION'
            Title.Caption = 'Location'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FQTYORG'
            Title.Caption = 'QtyOrg'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION'
            Title.Caption = 'Description'
            Visible = True
          end>
      end
      object DBEdit1: TDBEdit
        Left = 12
        Top = 63
        Width = 449
        Height = 21
        DataField = 'SDESCRIPTION'
        DataSource = DSData
        TabOrder = 2
        OnKeyPress = DBLookupComboBox1KeyPress
        OnKeyUp = DBLookupComboBox1KeyUp
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 12
        Top = 20
        Width = 300
        Height = 21
        DataField = 'LOCATION'
        DataSource = DSData
        TabOrder = 0
        OnKeyPress = DBLookupComboBox1KeyPress
        OnKeyUp = DBLookupComboBox1KeyUp
      end
      object DBEdit4: TDBEdit
        Left = 324
        Top = 20
        Width = 134
        Height = 21
        DataField = 'FQTYORG'
        DataSource = DSData
        TabOrder = 1
        OnKeyPress = DBLookupComboBox1KeyPress
        OnKeyUp = DBLookupComboBox1KeyUp
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 141
        Width = 81
        Height = 25
        Caption = 'add (ins)'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 7
        OnClick = BitBtn1Click
      end
      object dtpDate: TDBEdit
        Left = 12
        Top = 108
        Width = 134
        Height = 21
        DataField = 'DLASTSALESDATE'
        DataSource = DSData
        TabOrder = 3
        OnKeyPress = DBLookupComboBox1KeyPress
        OnKeyUp = DBLookupComboBox1KeyUp
      end
      object dtpDate2: TDBEdit
        Left = 184
        Top = 108
        Width = 134
        Height = 21
        DataField = 'DCREATEDATE'
        DataSource = DSData
        TabOrder = 5
        OnKeyPress = DBLookupComboBox1KeyPress
        OnKeyUp = DBLookupComboBox1KeyUp
      end
      object BitBtn2: TBitBtn
        Left = 112
        Top = 141
        Width = 89
        Height = 25
        Caption = 'Delete'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 9
        OnClick = BitBtn2Click
      end
      object GroupBox1: TGroupBox
        Left = 472
        Top = 8
        Width = 321
        Height = 157
        Caption = 'Fast input'
        TabOrder = 10
        object Label6: TLabel
          Left = 13
          Top = 104
          Width = 43
          Height = 13
          Caption = 'Fastscan'
        end
        object Label7: TLabel
          Left = 12
          Top = 18
          Width = 49
          Height = 13
          Caption = 'Serail from'
        end
        object Label8: TLabel
          Left = 160
          Top = 18
          Width = 38
          Height = 13
          Caption = 'Serail to'
        end
        object Efastscan: TEdit
          Left = 12
          Top = 120
          Width = 245
          Height = 21
          TabOrder = 0
          OnKeyDown = EfastscanKeyDown
        end
        object EFromrange: TEdit
          Left = 12
          Top = 34
          Width = 137
          Height = 21
          TabOrder = 1
        end
        object EToRange: TEdit
          Left = 158
          Top = 33
          Width = 147
          Height = 21
          TabOrder = 2
        end
        object bAddRange: TButton
          Left = 232
          Top = 60
          Width = 75
          Height = 25
          Caption = 'Add range'
          TabOrder = 3
          OnClick = bAddRangeClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 392
        Width = 971
        Height = 20
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 394
        ExplicitWidth = 979
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 971
        Height = 392
        Align = alClient
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 1
          Top = 33
          Width = 653
          Height = 317
          Align = alClient
          DataSource = DSData
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = PopupMenu1
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid2DrawColumnCell
          OnDblClick = DBGrid2DblClick
          OnKeyPress = DBGrid2KeyPress
          OnKeyUp = DBGrid2KeyUp
          Columns = <
            item
              Expanded = False
              FieldName = 'FQTY'
              Title.Caption = 'Qty'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SDESCRIPTION'
              Title.Caption = 'Description'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOCATION'
              Title.Caption = 'Location'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DLASTSALESDATE'
              Title.Caption = 'Max sales date'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DCREATEDATE'
              Title.Caption = 'Production date'
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 1
          Top = 350
          Width = 969
          Height = 41
          Align = alBottom
          Caption = 'Sales'
          TabOrder = 1
          DesignSize = (
            969
            41)
          object bChange: TButton
            Left = 719
            Top = 11
            Width = 75
            Height = 23
            Anchors = [akTop]
            Caption = 'Change'
            TabOrder = 1
            OnClick = bChangeClick
          end
          object Edit1: TEdit
            Left = 558
            Top = 12
            Width = 85
            Height = 21
            Anchors = [akTop]
            TabOrder = 0
            Text = 'Edit1'
            OnKeyPress = Edit1KeyPress
            OnKeyUp = Edit1KeyUp
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 969
          Height = 32
          Align = alTop
          Caption = 'In stock'
          TabOrder = 2
          object Lfilterloc: TLabel
            Left = 16
            Top = 8
            Width = 59
            Height = 13
            Caption = 'filter location'
          end
          object cbLocations: TComboBox
            Left = 84
            Top = 4
            Width = 189
            Height = 21
            Style = csDropDownList
            TabOrder = 0
            OnChange = cbLocationsChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 654
          Top = 33
          Width = 316
          Height = 317
          Align = alRight
          Caption = 'Fast input'
          TabOrder = 3
          object Label9: TLabel
            Left = 13
            Top = 104
            Width = 43
            Height = 13
            Caption = 'Fastscan'
          end
          object Label10: TLabel
            Left = 12
            Top = 18
            Width = 49
            Height = 13
            Caption = 'Serail from'
          end
          object Label11: TLabel
            Left = 160
            Top = 18
            Width = 38
            Height = 13
            Caption = 'Serail to'
          end
          object Edit2: TEdit
            Left = 12
            Top = 120
            Width = 245
            Height = 21
            TabOrder = 0
            OnKeyDown = Edit2KeyDown
          end
          object eSaleFrom: TEdit
            Left = 12
            Top = 34
            Width = 137
            Height = 21
            TabOrder = 1
          end
          object ESalesTo: TEdit
            Left = 158
            Top = 33
            Width = 147
            Height = 21
            TabOrder = 2
          end
          object Button1: TButton
            Left = 228
            Top = 64
            Width = 75
            Height = 25
            Caption = 'Add range'
            TabOrder = 3
            OnClick = Button1Click
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 412
        Width = 971
        Height = 164
        Align = alBottom
        TabOrder = 1
        object DBGrid3: TDBGrid
          Left = 1
          Top = 21
          Width = 969
          Height = 142
          Align = alClient
          DataSource = dssales
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid3DblClick
          OnKeyPress = DBGrid3KeyPress
          OnKeyUp = DBGrid2KeyUp
          Columns = <
            item
              Expanded = False
              FieldName = 'FQTY'
              Title.Caption = 'Qty'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPTION'
              Title.Caption = 'Description'
              Width = 203
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOCATION'
              Title.Caption = 'Location'
              Width = 199
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DLASTSALESDATE'
              Title.Caption = 'Max sales date'
              Width = 78
              Visible = True
            end>
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 969
          Height = 20
          Align = alTop
          Caption = 'In document'
          TabOrder = 1
        end
      end
    end
  end
  object DSData: TDataSource
    DataSet = ZQData
    Left = 332
    Top = 284
  end
  object ZSQLData: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOC_LOCBATSER'
      '  (DOC_LOCBATSER.WLOCBATSER_ID, '
      'DOC_LOCBATSER.WSTOCKID, DOC_LOCBATSER.WDOCID, '
      '   DOC_LOCBATSER.WLINEID, DOC_LOCBATSER.SDESCRIPTION, '
      'DOC_LOCBATSER.DLASTSALESDATE, '
      '   DOC_LOCBATSER.FQTY, DOC_LOCBATSER.WLOCATIONID, '
      'DOC_LOCBATSER.DCREATEDATE, '
      '   DOC_LOCBATSER.FQTYORG)'
      'VALUES'
      '  (:WLOCBATSER_ID, :WSTOCKID, :WDOCID, :WLINEID, '
      ':SDESCRIPTION, :DLASTSALESDATE, '
      '   :FQTY, :WLOCATIONID, :DCREATEDATE, :FQTYORG)')
    DeleteSQL.Strings = (
      'DELETE FROM DOC_LOCBATSER'
      'WHERE'
      '  DOC_LOCBATSER.WLOCBATSER_ID = :OLD_WLOCBATSER_ID')
    ModifySQL.Strings = (
      'UPDATE DOC_LOCBATSER SET'
      '  DOC_LOCBATSER.WLOCBATSER_ID = :WLOCBATSER_ID,'
      '  DOC_LOCBATSER.WSTOCKID = :WSTOCKID,'
      '  DOC_LOCBATSER.WDOCID = :WDOCID,'
      '  DOC_LOCBATSER.WLINEID = :WLINEID,'
      '  DOC_LOCBATSER.SDESCRIPTION = :SDESCRIPTION,'
      '  DOC_LOCBATSER.DLASTSALESDATE = :DLASTSALESDATE,'
      '  DOC_LOCBATSER.FQTY = :FQTY,'
      '  DOC_LOCBATSER.WLOCATIONID = :WLOCATIONID,'
      '  DOC_LOCBATSER.DCREATEDATE = :DCREATEDATE,'
      '  DOC_LOCBATSER.FQTYORG = :FQTYORG'
      'WHERE'
      '  DOC_LOCBATSER.WLOCBATSER_ID = :OLD_WLOCBATSER_ID')
    Left = 168
    Top = 284
  end
  object ZQData: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from DOC_LOCBATSER')
    CachedUpdates = True
    UpdateObject = ZSQLData
    AfterInsert = ZQDataAfterInsert
    BeforePost = ZQDataBeforePost
    AfterScroll = ZQDataAfterScroll
    Left = 404
    Top = 288
    object ZQDataWLOCBATSER_ID: TIntegerField
      FieldName = 'WLOCBATSER_ID'
      Required = True
    end
    object ZQDataWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQDataWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQDataWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object ZQDataSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 40
    end
    object ZQDataDLASTSALESDATE: TDateField
      FieldName = 'DLASTSALESDATE'
    end
    object ZQDataFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object ZQDataWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object ZQDataDCREATEDATE: TDateField
      FieldName = 'DCREATEDATE'
    end
    object ZQDataFQTYORG: TFloatField
      FieldName = 'FQTYORG'
    end
    object ZQDataLOCATION: TStringField
      FieldKind = fkLookup
      FieldName = 'LOCATION'
      LookupDataSet = QLocation
      LookupKeyFields = 'WLOCATIONID'
      LookupResultField = 'SLOCCODE'
      KeyFields = 'WLOCATIONID'
      Size = 200
      Lookup = True
    end
  end
  object QLocation: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select  WLOCATIONID,  trim(trim(SLOCCODE) || '#39' '#39' || SDESCRIPTION' +
        ')  SLOCCODE from locations')
    Left = 544
    Top = 284
    object QLocationWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
      Required = True
    end
    object QLocationSLOCCODE: TStringField
      FieldName = 'SLOCCODE'
      ReadOnly = True
      Size = 44
    end
  end
  object ZUSQLStock: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO stock'
      '  (stock.WSTOCKID, stock.WLOCBATSERTYPEID)'
      'VALUES'
      '  (:WSTOCKID, :WLOCBATSERTYPEID)')
    DeleteSQL.Strings = (
      'DELETE FROM stock'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    ModifySQL.Strings = (
      'UPDATE stock SET'
      '  stock.WSTOCKID = :WSTOCKID,'
      '  stock.WLOCBATSERTYPEID = :WLOCBATSERTYPEID'
      'WHERE'
      '  stock.WSTOCKID = :OLD_WSTOCKID')
    Left = 100
    Top = 284
  end
  object ZQStockLocBatSer: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select WStockid,WLOCBATSERTYPEID  from stock')
    CachedUpdates = True
    UpdateObject = ZUSQLStock
    Left = 260
    Top = 288
    object ZQStockLocBatSerWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockLocBatSerWLOCBATSERTYPEID: TIntegerField
      FieldName = 'WLOCBATSERTYPEID'
    end
  end
  object ZQSales: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'SELECT *'
      'FROM DOC_LOCBATSERSALE')
    CachedUpdates = True
    UpdateObject = ZUSQLSales
    AfterPost = ZQSalesAfterPost
    OnCalcFields = ZQSalesCalcFields
    Left = 512
    Top = 168
    object ZQSalesWLOCBATSERSALE_ID: TIntegerField
      FieldName = 'WLOCBATSERSALE_ID'
      Required = True
    end
    object ZQSalesWLOCBATSER_ID: TIntegerField
      FieldName = 'WLOCBATSER_ID'
      Required = True
    end
    object ZQSalesWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object ZQSalesWLINEID: TIntegerField
      FieldName = 'WLINEID'
    end
    object ZQSalesDLASTSALESDATE: TDateField
      FieldName = 'DLASTSALESDATE'
    end
    object ZQSalesFQTY: TFloatField
      FieldName = 'FQTY'
    end
    object ZQSalesWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQSalesDESCRIPTION: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCRIPTION'
      Size = 50
      Calculated = True
    end
    object ZQSalesLOCATION: TStringField
      FieldKind = fkCalculated
      FieldName = 'LOCATION'
      Size = 100
      Calculated = True
    end
  end
  object ZUSQLSales: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOC_LOCBATSERSALE'
      
        '  (DOC_LOCBATSERSALE.WLOCBATSERSALE_ID, DOC_LOCBATSERSALE.WLOCBA' +
        'TSER_ID, '
      
        '   DOC_LOCBATSERSALE.WDOCID, DOC_LOCBATSERSALE.WLINEID, DOC_LOCB' +
        'ATSERSALE.DLASTSALESDATE, '
      '   DOC_LOCBATSERSALE.FQTY, DOC_LOCBATSERSALE.WSTOCKID)'
      'VALUES'
      
        '  (:WLOCBATSERSALE_ID, :WLOCBATSER_ID, :WDOCID, :WLINEID, :DLAST' +
        'SALESDATE, '
      '   :FQTY, :WSTOCKID)')
    DeleteSQL.Strings = (
      'DELETE FROM DOC_LOCBATSERSALE'
      'WHERE'
      '  DOC_LOCBATSERSALE.WLOCBATSERSALE_ID = :OLD_WLOCBATSERSALE_ID')
    ModifySQL.Strings = (
      'UPDATE DOC_LOCBATSERSALE SET'
      '  DOC_LOCBATSERSALE.WLOCBATSERSALE_ID = '
      ':WLOCBATSERSALE_ID,'
      '  DOC_LOCBATSERSALE.WLOCBATSER_ID = :WLOCBATSER_ID,'
      '  DOC_LOCBATSERSALE.WDOCID = :WDOCID,'
      '  DOC_LOCBATSERSALE.WLINEID = :WLINEID,'
      '  DOC_LOCBATSERSALE.DLASTSALESDATE = :DLASTSALESDATE,'
      '  DOC_LOCBATSERSALE.FQTY = :FQTY,'
      '  DOC_LOCBATSERSALE.WSTOCKID = :WSTOCKID'
      'WHERE'
      '  DOC_LOCBATSERSALE.WLOCBATSERSALE_ID = '
      ':OLD_WLOCBATSERSALE_ID')
    Left = 424
    Top = 152
  end
  object dssales: TDataSource
    DataSet = ZQSales
    Left = 356
    Top = 292
  end
  object ZQGetDescr: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select a.SDescription,trim(trim(b.SLOCCODE ) || '#39' : '#39' || b.SDESC' +
        'RIPTION) SLOCCODE  '
      
        ' from DOC_LOCBATSER a left join locations  b on a.WLOCATIONID = ' +
        'b.WLOCATIONID'
      'where a.WLOCBATSER_ID = :ID')
    Left = 468
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
      end>
    object ZQGetDescrSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 40
    end
    object ZQGetDescrSLOCCODE: TStringField
      FieldName = 'SLOCCODE'
      ReadOnly = True
      Size = 46
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 244
    Top = 360
    object Selectall1: TMenuItem
      Caption = 'Select all'
      OnClick = Selectall1Click
    end
  end
end
