object fmInvestigator: TfmInvestigator
  Left = 297
  Top = 159
  Caption = 'Investigator'
  ClientHeight = 641
  ClientWidth = 1192
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1192
    Height = 69
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 108
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 1192
      Height = 67
      ButtonHeight = 68
      ButtonWidth = 59
      Caption = 'ToolBar1'
      DrawingStyle = dsGradient
      Images = dmOsfResource.BatchEnabledButtons
      ShowCaptions = True
      TabOrder = 0
      ExplicitWidth = 108
      object tblSearch: TToolButton
        Left = 0
        Top = 0
        Caption = 'F3: Search'
        ImageIndex = 12
        Style = tbsCheck
        OnClick = tblSearchClick
      end
      object tblDetails: TToolButton
        Left = 59
        Top = 0
        Caption = 'F4: Details'
        ImageIndex = 15
        Style = tbsCheck
        Visible = False
        OnClick = tblDetailsClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 69
    Width = 185
    Height = 553
    Align = alLeft
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 1
    ExplicitHeight = 392
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 183
      Height = 17
      Align = alTop
      AutoSize = False
      Caption = 'Search'
      Color = clSilver
      ParentColor = False
    end
    object Bevel1: TBevel
      Left = 1
      Top = 1
      Width = 183
      Height = 17
      Style = bsRaised
    end
    object SpeedButton1: TSpeedButton
      Left = 164
      Top = 3
      Width = 18
      Height = 14
      Caption = 'X'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 40
      Top = 28
      Width = 55
      Height = 13
      Caption = 'Search For:'
    end
    object Shape1: TShape
      Left = 9
      Top = 44
      Width = 164
      Height = 2
      Brush.Color = clNavy
    end
    object Shape2: TShape
      Left = 4
      Top = 264
      Width = 175
      Height = 107
      Pen.Color = clNavy
      Pen.Width = 2
    end
    object Label3: TLabel
      Left = 6
      Top = 266
      Width = 171
      Height = 15
      AutoSize = False
      Caption = 'Search Tip'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object LblMsg: TLabel
      Left = 12
      Top = 118
      Width = 3
      Height = 13
    end
    object Label4: TLabel
      Left = 9
      Top = 284
      Width = 165
      Height = 66
      AutoSize = False
      Caption = 
        'Type in what you are looking for if want to look a specific type' +
        ' check the corresponding button or Click down here to refine you' +
        'r serach'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 10
      Top = 352
      Width = 68
      Height = 13
      Cursor = crHandPoint
      Caption = 'Refine Search'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      Transparent = True
      OnClick = Label5Click
    end
    object Panel5: TPanel
      Left = 7
      Top = 130
      Width = 172
      Height = 125
      Color = clWhite
      TabOrder = 3
      Visible = False
      object Label6: TLabel
        Left = 12
        Top = 102
        Width = 40
        Height = 13
        Cursor = crHandPoint
        Caption = '<< Back'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = True
        OnClick = Label6Click
      end
      object Label7: TLabel
        Left = 4
        Top = 2
        Width = 88
        Height = 13
        Caption = 'Search Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 102
        Top = 102
        Width = 39
        Height = 13
        Cursor = crHandPoint
        Caption = 'More >>'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = True
        OnClick = Label11Click
      end
      object cbin: TCheckBox
        Left = 11
        Top = 18
        Width = 156
        Height = 17
        Caption = 'Whereever in'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbLeft: TCheckBox
        Left = 11
        Top = 36
        Width = 156
        Height = 17
        Caption = 'Starting position'
        TabOrder = 1
      end
      object cbRight: TCheckBox
        Left = 11
        Top = 56
        Width = 156
        Height = 17
        Caption = 'Ending'
        TabOrder = 2
      end
      object cbCase: TCheckBox
        Left = 11
        Top = 76
        Width = 156
        Height = 17
        Caption = 'Case Sensitive'
        TabOrder = 3
      end
    end
    object Panel8: TPanel
      Left = 7
      Top = 130
      Width = 172
      Height = 125
      Color = clWhite
      TabOrder = 5
      Visible = False
      object Label9: TLabel
        Left = 12
        Top = 102
        Width = 40
        Height = 13
        Cursor = crHandPoint
        Caption = '<< Back'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentColor = False
        ParentFont = False
        Transparent = True
        OnClick = Label9Click
      end
      object Label10: TLabel
        Left = 4
        Top = 2
        Width = 105
        Height = 13
        Caption = 'Advanced Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 4
        Top = 32
        Width = 88
        Height = 13
        Caption = 'Record Found limit'
      end
      object MaxRec: TSpinEdit
        Left = 4
        Top = 47
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 500
      end
    end
    object Panel6: TPanel
      Left = 7
      Top = 132
      Width = 172
      Height = 123
      Color = clWhite
      TabOrder = 4
      object cbAll: TCheckBox
        Left = 8
        Top = 3
        Width = 159
        Height = 17
        Caption = 'Everything'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbDocs: TCheckBox
        Left = 8
        Top = 23
        Width = 159
        Height = 17
        Caption = 'Documents'
        TabOrder = 1
      end
      object cbBatches: TCheckBox
        Left = 8
        Top = 43
        Width = 159
        Height = 17
        Caption = 'Batches'
        TabOrder = 2
      end
      object cbStockInf: TCheckBox
        Left = 8
        Top = 62
        Width = 159
        Height = 17
        Caption = 'Stocks Informations'
        TabOrder = 3
      end
      object cbAccNames: TCheckBox
        Left = 8
        Top = 81
        Width = 159
        Height = 17
        Caption = 'Accounts Names'
        TabOrder = 4
      end
      object cbAccInfo: TCheckBox
        Left = 8
        Top = 101
        Width = 159
        Height = 17
        Caption = 'Accounts Informations'
        TabOrder = 5
      end
    end
    object btnSearch: TBitBtn
      Left = 8
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Search Now'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSearchClick
    end
    object btnStop: TBitBtn
      Left = 96
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Stop'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnStopClick
    end
    object edtSearch: TComboBox
      Left = 8
      Top = 58
      Width = 163
      Height = 21
      TabOrder = 2
      OnKeyDown = edtSearchKeyDown
    end
  end
  object Panel2: TPanel
    Left = 185
    Top = 69
    Width = 1007
    Height = 553
    Align = alClient
    BevelInner = bvLowered
    Caption = 'Panel2'
    TabOrder = 2
    ExplicitWidth = 567
    ExplicitHeight = 392
    object Splitter1: TSplitter
      Left = 149
      Top = 2
      Width = 4
      Height = 549
      ExplicitHeight = 388
    end
    object Panel7: TPanel
      Left = 153
      Top = 2
      Width = 852
      Height = 549
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitWidth = 412
      ExplicitHeight = 388
      object Splitter2: TSplitter
        Left = 0
        Top = 393
        Width = 852
        Height = 6
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 232
        ExplicitWidth = 412
      end
      object SearchView: TcxListView
        Left = 0
        Top = 0
        Width = 852
        Height = 393
        Align = alClient
        Columns = <
          item
            Caption = 'Description'
            Width = 200
          end
          item
            Caption = 'Reference'
            Width = 80
          end
          item
            Caption = 'Type'
            Width = 80
          end
          item
            Caption = 'Date'
            Width = 80
          end
          item
            Caption = 'ID'
          end
          item
            Caption = 'KindID'
          end
          item
            Caption = 'BBool'
            Width = 0
          end>
        PopupMenu = PopupMenu1
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = SearchViewColumnClick
        OnCompare = SearchViewCompare
        OnDblClick = SearchViewDblClick
        OnSelectItem = SearchViewSelectItem
        ExplicitWidth = 412
        ExplicitHeight = 232
      end
      object nbDetails: TNotebook
        Left = 0
        Top = 399
        Width = 852
        Height = 150
        Align = alBottom
        PageIndex = 1
        TabOrder = 1
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Accounts'
          object LvDetails: TcxListView
            Left = 0
            Top = 0
            Width = 852
            Height = 150
            Align = alClient
            Columns = <>
            ReadOnly = True
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 147
      Height = 549
      Align = alLeft
      BevelInner = bvRaised
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      ExplicitHeight = 388
      DesignSize = (
        147
        549)
      object lblMoreInfo: TLabel
        Left = 6
        Top = 80
        Width = 136
        Height = 406
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        WordWrap = True
        ExplicitHeight = 245
      end
      object LblBig: TLabel
        Left = 4
        Top = 7
        Width = 137
        Height = 62
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        WordWrap = True
      end
      object Shape3: TShape
        Left = 3
        Top = 72
        Width = 138
        Height = 5
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = clTeal
        Pen.Style = psClear
      end
      object Image1: TImage
        Left = 1
        Top = 482
        Width = 145
        Height = 66
        Align = alBottom
        Picture.Data = {
          0A544A504547496D616765B8070000FFD8FFE000104A46494600010101004800
          480000FFDB004300100B0C0E0C0A100E0D0E1211101318281A18161618312325
          1D283A333D3C3933383740485C4E404457453738506D51575F626768673E4D71
          797064785C656763FFDB0043011112121815182F1A1A2F634238426363636363
          6363636363636363636363636363636363636363636363636363636363636363
          63636363636363636363636363FFC0001108003C005003012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F40A
          28A280311ED6E2FF005BBB59AE6F2DE2B754F204320456DC39638EA7208C1E3E
          B9E2D15D4ED64CA4897D093CAB811CA3EEF4206D3FC47040EDCD37550B68E9AA
          E76FD99184A063E78CF2473DC1008E477F5AAB6F15C6BEA97735CBC1A73E4C56
          F0B6D691718CC8C0FF00BDF28E9C67906802E26BBA692EB35DC56D2C64078AE1
          846EA4807907D8F5191EF5621BFB3B8904705DC12B95DC15240C48F5C0ED50DB
          68BA5DA051069F6C8554286F286E207A9EA7A77A47D1B49C316D3ECD72305842
          A0FE78A00D0A2B0D6386CD41D27528808822FD9A6B8DF1ED1C05C9C95EFC8EE0
          672062AEE95AAC1A9C2C50849A362B2C5BB3B48EE0FF00129EA18751F88A00BF
          4514500155AEAFADED58248CCD230CAC71A9773C13F7473D8F3566B1E064D2E7
          BC96EADA40656799EED17CC0C8BF7436064614E00C63E53CE4D0050BF37BADEB
          A96512450C3A7B2CF2F9DF386623E4CAA91C8209C0623D7D28B9D3AF34C8D09B
          B98D8995A5B9FB20F2DA324E7701C929EAA39EFCF229BE1BD4F7EB9A8C374AA2
          5BB7135B4A400658F682A9EFB54838F76F435D4500511A669F73E54EC9F69030
          F1B492B48BCF423248EF4BFD8FA66F2FFD9D69B8FF001790B9FE5552647D0FCC
          B981E31A7677496EC42F9649E4A13C7248F97D7A75AC2BEF11EA13EAF259C572
          961E51E2211E65718C8C97181D8E003F53D6803B14B68235DA9046ABE8A800AC
          7D66C2C6DA4B5BD3696C6249963955C2840AC701B041E41231D3A9E6B11BC41A
          C69C0CCCC35084005E391555C6339219401E9D41AD3D7355B2D4BC22F2C52612
          ECAC0BE60DBE5B93C87FEEE30724F1C77E3201B274CB3DF1BA402268C10A6126
          3C03DBE5C5416CD259EA3169E6E5AE51A03203290644DBB57923A839EFCE41E4
          F65106A97298B9B986D4166CADA82EDB7181F3B0E0F7FBBE956AD6CEDED37F91
          1ED67397724B3375EAC793D4F5A00B158BE2AB8860D2956E9435BCB3C6930EFB
          3396C773C03D39C67A75ADAAC0D66D1758D5A3D32669E3845B34ACF13019C90B
          B4E73FA8F5F7A00C8B3D3EE7C5E5B57BB98DA46A76D8F958C8018E58F7EA3008
          20F07A71524DE21D6B416116AF691CE990AB3EE2A18966C7CC148380071853DF
          06B6EC749BCD3E6B64835595EC61509F679A246240047DF001F4FCAB52678E38
          5DE66458954976720281DF39ED401C0EA9AECBAE95748268F4FB671BA4400A6F
          2386666031B7278C75C7B0AAA96EF246B65A8969ED231BA0BB56025808E817DB
          D8F1DC11802B7B57D734D8ECE5D2B42303DC5C03936E80C7183F79C91819C67F
          1C5674CA5A07456752548053EF0E3B648E7F114015D66783CA57CDD5AC9858EF
          621956247471D51B91C1A9FC216A9AA5D481210BA4DB3BB18D972B34AC02F20E
          4101467B1048F5AA770F69A569F7BF647BE86768B6EE902889F3D805E73C9C67
          38C75EF5D8D9595E68D6220D3C457B6C8AEE88E7CB91989040DDF74E496E703B
          50059D3B3672B69ADFEAE250D6C71FF2CBA6DEBC95E07D0AF539AD1AC954BBBC
          D66DAE9EDA4B386DA3707CC742D297C7CB8527006D0739EB8F7AD6A002B26E4C
          DA7EAAD7696B24F6F70A892B47F334641201DBD48F9B9C67A13F5D6A4A00C6BF
          F13585B59ACD6EFF006A9258C3C5147D4838C163FC039EAD8E87D315C549347A
          9CC2EB59D421B89771290894795174E1573EDF8F7CF5AEFF0050D134DD4C8379
          671C8C1836EE5492060648EBF4354FFE111D0B6B28B1C07258E267193FF7D7BD
          007173EAF6360AD1428032939455D801FCBBFA806B460B4D76E2D4CB1694E320
          ECF39963627B7CA4E47E38AEBF4ED0F4CD3306CACA18997387DB97E7FDA3CFEB
          5A1401C5E91E11BAB8BA8EEF5F747440196D14EE5DDFEDF6FC0707F43D9D2D14
          0051451401FFD9}
        ExplicitTop = 321
      end
    end
    object Animate1: TAnimate
      Left = 13
      Top = 184
      Width = 16
      Height = 16
      Color = clNone
      CommonAVI = aviFindFile
      ParentColor = False
      StopFrame = 8
      Visible = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 622
    Width = 1192
    Height = 19
    Anchors = []
    Panels = <
      item
        Width = 50
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
    ExplicitTop = -19
    ExplicitWidth = 108
  end
  object ZTblMessage: TUniTable
    TableName = 'messages'
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    BeforeOpen = ZTblMessageBeforeOpen
    Left = 410
    Top = 119
    object ZTblMessageWMESSAGEID: TIntegerField
      FieldName = 'WMESSAGEID'
      Required = True
    end
    object ZTblMessageSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZTblMessageSEXTRADESCRIPTION: TStringField
      FieldName = 'SEXTRADESCRIPTION'
      Size = 255
    end
  end
  object ZRQLocSerialBatch: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'select a.* from DOC_LOCBATSER a where a.Wdocid = :wdocid and a.w' +
        'lineid =:Wlineid'
      ''
      'union'
      
        'select a.* from DOC_LOCBATSER a join DOC_LOCBATSERSALE b on a.WL' +
        'OCBATSER_ID = b.WLOCBATSER_ID'
      'where b.Wdocid = :wdocid2 and b.wlineid =:Wlineid2'
      '')
    Left = 402
    Top = 215
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'wdocid'
      end
      item
        DataType = ftUnknown
        Name = 'Wlineid'
      end
      item
        DataType = ftUnknown
        Name = 'wdocid2'
      end
      item
        DataType = ftUnknown
        Name = 'Wlineid2'
      end>
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 590
    Top = 227
    object Showdetail1: TMenuItem
      Caption = 'Show detail'
      OnClick = SearchViewDblClick
    end
    object Links1: TMenuItem
      Caption = 'Links'
    end
  end
end
