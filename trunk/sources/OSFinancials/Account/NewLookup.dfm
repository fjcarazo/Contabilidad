object fmPosLookup: TfmPosLookup
  Left = 727
  Top = 254
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Lookup'
  ClientHeight = 495
  ClientWidth = 588
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PFind: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 189
    Align = alTop
    TabOrder = 0
    object LGroup: TLabel
      Left = 12
      Top = 70
      Width = 29
      Height = 13
      Caption = 'Group'
    end
    object LCreditor: TLabel
      Left = 12
      Top = 146
      Width = 36
      Height = 13
      Caption = 'Creditor'
    end
    object LGroup2: TLabel
      Left = 12
      Top = 110
      Width = 38
      Height = 13
      Caption = 'Group 2'
    end
    object ECode: TEdit
      Left = 240
      Top = 4
      Width = 233
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyPress = ECodeKeyPress
    end
    object Bsearch: TButton
      Left = 488
      Top = 3
      Width = 97
      Height = 23
      Caption = 'Search'
      TabOrder = 1
      OnClick = BsearchClick
    end
    object CBField: TComboBox
      Left = 12
      Top = 4
      Width = 217
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      TabStop = False
      Items.Strings = (
        'Code'
        'Description'
        'Barcode'
        'Description and extra description'
        'Code, Description and extra description')
    end
    object cbField2: TComboBox
      Left = 12
      Top = 48
      Width = 217
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      TabStop = False
      Text = 'Code'
      Visible = False
      Items.Strings = (
        'Code'
        'Description'
        'Barcode'
        'Description and extra description')
    end
    object ECode2: TEdit
      Left = 240
      Top = 48
      Width = 233
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Visible = False
      OnKeyPress = ECode2KeyPress
    end
    object CBLogic: TComboBox
      Left = 12
      Top = 26
      Width = 217
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 5
      TabStop = False
      Text = 'Empty'
      OnChange = CBLogicChange
      Items.Strings = (
        'Empty'
        'And'
        'Or')
    end
    object Button1: TButton
      Left = 488
      Top = 35
      Width = 97
      Height = 22
      Caption = 'Clear'
      TabOrder = 6
      TabStop = False
      OnClick = Button1Click
    end
    object cbAutogroup: TComboBox
      Left = 12
      Top = 84
      Width = 573
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      OnKeyPress = ECodeKeyPress
    end
    object cbCreditor: TComboBox
      Left = 12
      Top = 162
      Width = 573
      Height = 21
      Style = csDropDownList
      TabOrder = 8
      OnKeyPress = ECodeKeyPress
    end
    object cbGroup2: TComboBox
      Left = 12
      Top = 124
      Width = 573
      Height = 21
      Style = csDropDownList
      TabOrder = 9
      OnKeyPress = ECodeKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 399
    Width = 588
    Height = 96
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      588
      96)
    object Label1: TLabel
      Left = 8
      Top = 27
      Width = 51
      Height = 13
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Search by:'
      Transparent = True
    end
    object Shape1: TShape
      Left = 8
      Top = 45
      Width = 562
      Height = 26
      Anchors = [akLeft, akRight, akBottom]
      Brush.Color = clBtnFace
      Shape = stRoundRect
      ExplicitWidth = 592
    end
    object Bevel1: TBevel
      Left = -31
      Top = 21
      Width = 627
      Height = 3
      Anchors = [akLeft, akRight, akBottom]
      ExplicitWidth = 657
    end
    object StatusBar: TStatusBar
      Left = 1
      Top = 76
      Width = 586
      Height = 19
      Panels = <
        item
          Width = 110
        end
        item
          Width = 100
        end
        item
          Width = 100
        end
        item
          Width = 110
        end
        item
          Width = 150
        end
        item
          Width = 150
        end
        item
          Width = 80
        end
        item
          Width = 50
        end>
    end
    object cbCode: TCheckBox
      Tag = 10
      Left = 76
      Top = 49
      Width = 109
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Code'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = cbCodeClick
    end
    object cbDescription: TCheckBox
      Tag = 11
      Left = 214
      Top = 49
      Width = 136
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Description'
      TabOrder = 1
      OnClick = cbDescriptionClick
    end
    object cbBarCode: TCheckBox
      Tag = 12
      Left = 356
      Top = 49
      Width = 118
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Bar Code'
      TabOrder = 2
      OnClick = cbBarCodeClick
    end
    object cbAuto: TCheckBox
      Tag = 12
      Left = 480
      Top = 49
      Width = 81
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Auto'
      TabOrder = 4
      OnClick = cbAutoClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 189
    Width = 588
    Height = 210
    Align = alClient
    TabOrder = 2
    object cxGrid1DBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
      OnDblClick = DBGrdLookupDblClick
      OnKeyDown = DBGrdLookupKeyDown
      OnKeyPress = DBGrdLookupKeyPress
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsStock
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
      object cxGrid1DBTableView1WSTOCKID: TcxGridDBColumn
        DataBinding.FieldName = 'WSTOCKID'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1SSTOCKCODE: TcxGridDBColumn
        DataBinding.FieldName = 'SSTOCKCODE'
      end
      object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SDESCRIPTION'
      end
      object cxGrid1DBTableView1SBARCODENUMBER: TcxGridDBColumn
        DataBinding.FieldName = 'SBARCODENUMBER'
        Width = 206
      end
      object cxGrid1DBTableView1SEXTRADESC: TcxGridDBColumn
        DataBinding.FieldName = 'SEXTRADESC'
        Width = 1428
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 268
    Top = 224
    object Usefilter1: TMenuItem
      Caption = 'Use filter'
      OnClick = Usefilter1Click
    end
  end
  object ZQStock: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select stock.*,'
      'Accintax.SAccountCode IntaxCode,'
      'Accintax.Sdescription IntaxDesc,'
      'intax.FRate IntaxRate,'
      'AccOutTax.SAccountCode outTaxCode,'
      'AccOutTax.Sdescription outTaxDesc,'
      'OutTax.FRate outTaxRate,'
      'COSAcc.SAccountCode COSAccCode,'
      'COSAcc.SDescription COSAccDesc,'
      'SalesAcc.SAccountCode SalesAccCode,'
      'SalesAcc.SDescription SalesAccDesc,'
      'StockAcc.SAccountCode StockAccCode,'
      'StockAcc.SDescription StockAccDesc'
      ' from '
      'stock '
      'left join Tax intax on(intax.WaccountId = stock.WInputtaxid) '
      'left join Tax OutTax on(OutTax.WaccountId = stock.WOutputtaxid) '
      
        'left join Account Accintax on(Accintax.WaccountId = stock.WInput' +
        'taxid) '
      
        'left join Account AccOutTax on(AccOutTax.WaccountId = stock.WOut' +
        'puttaxid) '
      
        'left join Account COSAcc on(COSAcc.WaccountId = stock.WCOSTACCOU' +
        'NTID) '
      
        'left join Account SalesAcc on(SalesAcc.WaccountId = stock.WSales' +
        'AccountId) '
      
        'left join Account StockAcc on(StockAcc.WaccountId = stock.WStock' +
        'AccountId) ')
    FetchRows = 1000
    BeforeOpen = ZQStockBeforeOpen
    AfterScroll = ZQStockAfterScroll
    Left = 504
    Top = 288
    object ZQStockWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQStockSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object ZQStockSBARCODENUMBER: TStringField
      FieldName = 'SBARCODENUMBER'
      Size = 25
    end
    object ZQStockSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQStockWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQStockWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQStockWCOSTACCOUNTID: TIntegerField
      FieldName = 'WCOSTACCOUNTID'
    end
    object ZQStockWINPUTTAXID: TIntegerField
      FieldName = 'WINPUTTAXID'
    end
    object ZQStockWOUTPUTTAXID: TIntegerField
      FieldName = 'WOUTPUTTAXID'
    end
    object ZQStockFOPENINGAVECOST: TFloatField
      FieldName = 'FOPENINGAVECOST'
    end
    object ZQStockFQTYONHAND: TFloatField
      FieldName = 'FQTYONHAND'
    end
    object ZQStockFOPENINGQTY: TFloatField
      FieldName = 'FOPENINGQTY'
    end
    object ZQStockFINVQTYONHAND: TFloatField
      FieldName = 'FINVQTYONHAND'
    end
    object ZQStockFREORDERQTY: TFloatField
      FieldName = 'FREORDERQTY'
    end
    object ZQStockWSALESACCOUNTID: TIntegerField
      FieldName = 'WSALESACCOUNTID'
    end
    object ZQStockBAPPLYINVOICEDISCOUNT: TSmallintField
      FieldName = 'BAPPLYINVOICEDISCOUNT'
    end
    object ZQStockWSTOCKACCOUNTID: TIntegerField
      FieldName = 'WSTOCKACCOUNTID'
    end
    object ZQStockFSELLINGPRICE1: TFloatField
      FieldName = 'FSELLINGPRICE1'
    end
    object ZQStockFSELLINGPRICE2: TFloatField
      FieldName = 'FSELLINGPRICE2'
    end
    object ZQStockFSELLINGPRICE3: TFloatField
      FieldName = 'FSELLINGPRICE3'
    end
    object ZQStockFUNITAVECOST: TFloatField
      FieldName = 'FUNITAVECOST'
    end
    object ZQStockFUNITCOST: TFloatField
      FieldName = 'FUNITCOST'
    end
    object ZQStockWUNITID: TIntegerField
      FieldName = 'WUNITID'
    end
    object ZQStockDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQStockBAPPLYTAX: TSmallintField
      FieldName = 'BAPPLYTAX'
    end
    object ZQStockWINPUTTAX2ID: TIntegerField
      FieldName = 'WINPUTTAX2ID'
    end
    object ZQStockBTAXABLE: TSmallintField
      FieldName = 'BTAXABLE'
    end
    object ZQStockWSUPPLIER1ID: TIntegerField
      FieldName = 'WSUPPLIER1ID'
    end
    object ZQStockWSUPPLIER2ID: TIntegerField
      FieldName = 'WSUPPLIER2ID'
    end
    object ZQStockWSTOCKTYPEID: TIntegerField
      FieldName = 'WSTOCKTYPEID'
    end
    object ZQStockWOUTPUTTAX2ID: TIntegerField
      FieldName = 'WOUTPUTTAX2ID'
    end
    object ZQStockWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQStockBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object ZQStockWPERENTID: TIntegerField
      FieldName = 'WPERENTID'
    end
    object ZQStockWLOCATIONID: TIntegerField
      FieldName = 'WLOCATIONID'
    end
    object ZQStockWFILENAMEID: TIntegerField
      FieldName = 'WFILENAMEID'
    end
    object ZQStockSEXTRADESC: TStringField
      FieldName = 'SEXTRADESC'
      Size = 255
    end
    object ZQStockINTAXCODE: TStringField
      FieldName = 'INTAXCODE'
      Size = 7
    end
    object ZQStockINTAXDESC: TStringField
      FieldName = 'INTAXDESC'
      Size = 35
    end
    object ZQStockINTAXRATE: TFloatField
      FieldName = 'INTAXRATE'
    end
    object ZQStockOUTTAXCODE: TStringField
      FieldName = 'OUTTAXCODE'
      Size = 7
    end
    object ZQStockOUTTAXDESC: TStringField
      FieldName = 'OUTTAXDESC'
      Size = 35
    end
    object ZQStockOUTTAXRATE: TFloatField
      FieldName = 'OUTTAXRATE'
    end
    object ZQStockCOSACCCODE: TStringField
      FieldName = 'COSACCCODE'
      Size = 7
    end
    object ZQStockCOSACCDESC: TStringField
      FieldName = 'COSACCDESC'
      Size = 35
    end
    object ZQStockSALESACCCODE: TStringField
      FieldName = 'SALESACCCODE'
      Size = 7
    end
    object ZQStockSALESACCDESC: TStringField
      FieldName = 'SALESACCDESC'
      Size = 35
    end
    object ZQStockSTOCKACCCODE: TStringField
      FieldName = 'STOCKACCCODE'
      Size = 7
    end
    object ZQStockSTOCKACCDESC: TStringField
      FieldName = 'STOCKACCDESC'
      Size = 35
    end
    object ZQStockSEXTERNALID: TStringField
      FieldName = 'SEXTERNALID'
      Size = 200
    end
    object ZQStockFNETTOWEIGHT: TFloatField
      FieldName = 'FNETTOWEIGHT'
    end
    object ZQStockFGROSSWEIGHT: TFloatField
      FieldName = 'FGROSSWEIGHT'
    end
    object ZQStockFREORDERQTYTRIG: TFloatField
      FieldName = 'FREORDERQTYTRIG'
    end
    object ZQStockSMANUFACTURER: TStringField
      FieldName = 'SMANUFACTURER'
      Size = 35
    end
    object ZQStockFMINIMUMQTY: TFloatField
      FieldName = 'FMINIMUMQTY'
    end
    object ZQStockWLOCBATSERTYPEID: TIntegerField
      FieldName = 'WLOCBATSERTYPEID'
    end
  end
  object dsStock: TDataSource
    DataSet = ZQStock
    Left = 112
    Top = 120
  end
  object ZQGroups: TUniQuery
    DataTypeMap = <>
    FetchRows = 9999
    Left = 100
    Top = 264
  end
  object TShowDetail: TTimer
    Enabled = False
    OnTimer = TShowDetailTimer
    Left = 200
    Top = 136
  end
  object tblBatchControl: TUniTable
    TableName = 'BatCon'
    DataTypeMap = <>
    Left = 97
    Top = 205
    object tblBatchControlWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
    end
    object tblBatchControlWUSERID: TIntegerField
      FieldName = 'WUSERID'
    end
    object tblBatchControlWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object tblBatchControlSBATCHNUMBER: TStringField
      FieldName = 'SBATCHNUMBER'
      Size = 8
    end
    object tblBatchControlBPOSTED: TSmallintField
      FieldName = 'BPOSTED'
    end
    object tblBatchControlBIMPORTED: TSmallintField
      FieldName = 'BIMPORTED'
    end
    object tblBatchControlBDOCSOURCE: TSmallintField
      FieldName = 'BDOCSOURCE'
    end
    object tblBatchControlWLINECOUNT: TIntegerField
      FieldName = 'WLINECOUNT'
    end
    object tblBatchControlSFILENAME: TStringField
      FieldName = 'SFILENAME'
      Size = 16
    end
    object tblBatchControlWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object tblBatchControlDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object tblBatchControlWINITBATID: TIntegerField
      FieldName = 'WINITBATID'
    end
    object tblBatchControlSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object tblBatchControlSUNIQUEID: TStringField
      FieldName = 'SUNIQUEID'
      Size = 8
    end
  end
  object dsBatchControl: TDataSource
    DataSet = tblBatchControl
    Left = 259
    Top = 179
  end
end
