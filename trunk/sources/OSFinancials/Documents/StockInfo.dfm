object fmStockInfo: TfmStockInfo
  Left = 524
  Top = 118
  Anchors = [akTop, akRight]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Stock Information'
  ClientHeight = 631
  ClientWidth = 675
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 597
    Width = 675
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      675
      34)
    object BtnOk: TBitBtn
      Left = 451
      Top = 4
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&OK'
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
      TabOrder = 0
      OnClick = btnOkClick
      OnKeyDown = FormKeyDown
    end
    object BtnCancel: TBitBtn
      Left = 556
      Top = 4
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
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
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 675
    Height = 597
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'General'
      DesignSize = (
        667
        569)
      object GroupBox2: TGroupBox
        Left = 23
        Top = 4
        Width = 297
        Height = 156
        Anchors = [akTop, akRight]
        Caption = 'Selling price descriptions'
        TabOrder = 0
        object Label1: TLabel
          Left = 64
          Top = 28
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Selling Price 1'
        end
        object Label2: TLabel
          Left = 64
          Top = 52
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Selling Price 2'
        end
        object Label3: TLabel
          Left = 64
          Top = 76
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Selling Price 3'
        end
        object LCBDefaultPrice: TLabel
          Left = 97
          Top = 100
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Default'
        end
        object DBEdit1: TDBEdit
          Left = 136
          Top = 24
          Width = 155
          Height = 21
          DataField = 'SSellingPriceName1'
          DataSource = dsSysvars
          TabOrder = 0
          OnKeyDown = FormKeyDown
        end
        object DBEdit2: TDBEdit
          Left = 136
          Top = 48
          Width = 155
          Height = 21
          DataField = 'SSellingPriceName2'
          DataSource = dsSysvars
          TabOrder = 1
          OnKeyDown = FormKeyDown
        end
        object DBEdit3: TDBEdit
          Left = 136
          Top = 72
          Width = 155
          Height = 21
          DataField = 'SSellingPriceName3'
          DataSource = dsSysvars
          TabOrder = 2
          OnKeyDown = FormKeyDown
        end
        object CBDefaultPrice: TComboBox
          Left = 136
          Top = 98
          Width = 154
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 3
          Text = 'Price 2'
          Items.Strings = (
            'Price 1'
            'Price 2'
            'Price 3')
        end
      end
      object GroupBox3: TGroupBox
        Left = 366
        Top = 4
        Width = 297
        Height = 216
        Anchors = [akTop, akRight, akBottom]
        Caption = 'Cost of Sales'
        TabOrder = 1
        object Label4: TLabel
          Left = 75
          Top = 50
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cost of sales batch'
        end
        object Label5: TLabel
          Left = 101
          Top = 74
          Width = 19
          Height = 13
          Alignment = taRightJustify
          Caption = 'Use'
        end
        object LDBCheckBox3: TLabel
          Left = 167
          Top = 24
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Create Cost of Sales'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 268
          Top = 22
          Width = 16
          Height = 17
          Alignment = taLeftJustify
          DataField = 'BCREATECOSTOFSALES'
          DataSource = dsSysvars
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = DBCheckBox3Click
          OnKeyDown = FormKeyDown
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 174
          Top = 44
          Width = 114
          Height = 21
          DataField = 'WCOSTOFSALESTYPEID'
          DataSource = dsSysvars
          KeyField = 'WBATCHTYPEID'
          ListField = 'SDESCRIPTION'
          TabOrder = 1
          OnKeyDown = FormKeyDown
        end
        object rbCostOfSales: TRadioButton
          Left = 125
          Top = 94
          Width = 163
          Height = 17
          Caption = 'Cost of Sales'
          TabOrder = 2
        end
        object rbAveCost: TRadioButton
          Left = 125
          Top = 72
          Width = 163
          Height = 17
          Caption = 'Average Cost'
          TabOrder = 3
        end
      end
      object gbStocksettings: TGroupBox
        Left = 2
        Top = 223
        Width = 677
        Height = 254
        Anchors = [akLeft, akRight, akBottom]
        Caption = 'Stockdocsettings'
        TabOrder = 2
        DesignSize = (
          677
          254)
        object LCBNoBackOrder: TLabel
          Left = 567
          Top = 78
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'No backorder'
        end
        object LCBCantSellOutOfStock: TLabel
          Left = 528
          Top = 94
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Cants sell out of stock'
        end
        object LCBNoPrintMessage: TLabel
          Left = 558
          Top = 130
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'No confirm print'
        end
        object LCBCheckReferenceUsed: TLabel
          Left = 527
          Top = 146
          Width = 105
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Check reference used'
        end
        object LCBDoNotCreateItems: TLabel
          Left = 540
          Top = 162
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Do not create items'
        end
        object LcbGoToQty: TLabel
          Left = 587
          Top = 63
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Go to Qty'
        end
        object LcbCannotEditDescription: TLabel
          Left = 524
          Top = 47
          Width = 108
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Cannot edit description'
        end
        object LcbCannotEditPrice: TLabel
          Left = 552
          Top = 31
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Cannot edit price'
        end
        object LDefincForDocs: TLabel
          Left = 537
          Top = 15
          Width = 95
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Default Incl for docs'
        end
        object LButtonLookup: TLabel
          Left = 566
          Top = 178
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Button lookup'
        end
        object LNoOutOfStockMsg: TLabel
          Left = 514
          Top = 193
          Width = 118
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'No out of stock message'
        end
        object LcbOutOfStockDrawCol: TLabel
          Left = 508
          Top = 212
          Width = 124
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 'Use colors for out of stock'
        end
        object Label6: TLabel
          Left = 6
          Top = 48
          Width = 117
          Height = 13
          Caption = 'Payment discount debtor'
        end
        object Label7: TLabel
          Left = 6
          Top = 105
          Width = 84
          Height = 13
          Caption = 'Shipcost unit type'
        end
        object Label8: TLabel
          Left = 6
          Top = 72
          Width = 122
          Height = 13
          Caption = 'Payment discount creditor'
        end
        object LcbUseTabsInStock: TLabel
          Left = 532
          Top = 113
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Use tabs in stock'
        end
        object CBSqlOnlyForStockLookup: TCheckBox
          Left = 6
          Top = 127
          Width = 366
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Sql only for stock lookup'
          TabOrder = 0
        end
        object cbMergeInvoiceToOrders: TCheckBox
          Left = 6
          Top = 143
          Width = 366
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Merge invoice to orders'
          TabOrder = 1
        end
        object cbMergeItemsOnLedger: TCheckBox
          Left = 6
          Top = 161
          Width = 366
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Merge items per tax on ledger'
          TabOrder = 2
        end
        object cbBomStock: TCheckBox
          Left = 6
          Top = 176
          Width = 366
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Calc BOM stock'
          TabOrder = 3
        end
        object cbShowBackorders: TCheckBox
          Left = 6
          Top = 192
          Width = 366
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Show backorders'
          TabOrder = 4
        end
        object cbLimitForDefaulSupplier: TCheckBox
          Left = 6
          Top = 208
          Width = 366
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'limit stock purchase only for default suppier or non'
          TabOrder = 5
        end
        object CBNoBackOrder: TCheckBox
          Left = 643
          Top = 77
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 6
        end
        object CBCantSellOutOfStock: TCheckBox
          Left = 643
          Top = 93
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 7
        end
        object CBNoPrintMessage: TCheckBox
          Left = 643
          Top = 129
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 8
        end
        object CBCheckReferenceUsed: TCheckBox
          Left = 643
          Top = 145
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 9
        end
        object CBDoNotCreateItems: TCheckBox
          Left = 643
          Top = 160
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 10
        end
        object cbGoToQty: TCheckBox
          Left = 643
          Top = 62
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 11
        end
        object cbCannotEditDescription: TCheckBox
          Left = 643
          Top = 46
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 12
        end
        object cbCannotEditPrice: TCheckBox
          Left = 643
          Top = 30
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 13
        end
        object cbDefInc: TCheckBox
          Left = 643
          Top = 14
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 14
        end
        object cbButtonLookup: TCheckBox
          Left = 643
          Top = 176
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 15
        end
        object cbNoOutOfStockMsg: TCheckBox
          Left = 643
          Top = 192
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 16
        end
        object cbOutOfStockDrawCol: TCheckBox
          Left = 643
          Top = 210
          Width = 16
          Height = 17
          Anchors = [akTop, akRight]
          TabOrder = 17
        end
        object BOptions: TBitBtn
          Left = 8
          Top = 16
          Width = 277
          Height = 29
          Caption = 'Setup Options'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 18
          WordWrap = True
          OnClick = BOptionsClick
        end
        object cbShipcostunittype: TComboBox
          Left = 152
          Top = 101
          Width = 202
          Height = 21
          Style = csDropDownList
          TabOrder = 19
          OnEnter = cbShipcostunittypeEnter
        end
        object EpaymetItem: TEdit
          Left = 152
          Top = 48
          Width = 169
          Height = 21
          TabOrder = 20
          Text = 'EpaymetItem'
        end
        object BBSales: TBitBtn
          Left = 328
          Top = 49
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
          TabOrder = 21
          OnClick = BBSalesClick
        end
        object EpaymetItemCred: TEdit
          Left = 152
          Top = 72
          Width = 169
          Height = 21
          TabOrder = 22
          Text = 'EpaymetItem'
        end
        object BitBtn1: TBitBtn
          Left = 328
          Top = 73
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
          TabOrder = 23
          OnClick = BitBtn1Click
        end
        object cbUseTabsInStock: TCheckBox
          Left = 625
          Top = 112
          Width = 16
          Height = 17
          TabOrder = 24
        end
        object cbForceStockTypeCheck: TCheckBox
          Left = 6
          Top = 223
          Width = 366
          Height = 17
          Alignment = taLeftJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Force stocktype check'
          TabOrder = 25
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Unit'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 667
        Height = 569
        Align = alClient
        Caption = 'Units of stock'
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 2
          Top = 93
          Width = 663
          Height = 474
          Align = alClient
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DataSource1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
            object cxGrid1DBTableView1WUNITID: TcxGridDBColumn
              DataBinding.FieldName = 'WUNITID'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
              DataBinding.FieldName = 'SDESCRIPTION'
              Width = 199
            end
            object cxGrid1DBTableView1FUNITQTY: TcxGridDBColumn
              Caption = 'qty'
              DataBinding.FieldName = 'FUNITQTY'
              Width = 103
            end
            object cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn
              DataBinding.FieldName = 'DSYSDATE'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 663
          Height = 78
          Align = alTop
          TabOrder = 1
          object sbAdd: TSpeedButton
            Left = 8
            Top = 51
            Width = 100
            Height = 21
            Caption = 'Add'
            Transparent = False
            OnClick = sbAddClick
          end
          object sbDelete: TSpeedButton
            Left = 114
            Top = 51
            Width = 100
            Height = 21
            Caption = 'Delete'
            Transparent = False
            OnClick = sbDeleteClick
          end
          object edtNewUnit: TEdit
            Left = 8
            Top = 16
            Width = 145
            Height = 21
            TabOrder = 0
            OnKeyDown = FormKeyDown
            OnKeyPress = edtNewUnitKeyPress
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Taxclasses'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 667
        Height = 237
        Align = alTop
        TabOrder = 0
        object Label9: TLabel
          Left = 144
          Top = 92
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Name'
          FocusControl = DBEdit4
        end
        object Label10: TLabel
          Left = 132
          Top = 115
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'input tax'
          FocusControl = DBEdit5
        end
        object Label11: TLabel
          Left = 126
          Top = 139
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Outputtax'
          FocusControl = DBEdit6
        end
        object Label13: TLabel
          Left = 105
          Top = 212
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Stockaccount'
          FocusControl = DBEdit8
        end
        object Label12: TLabel
          Left = 107
          Top = 161
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Salesaccount'
          FocusControl = DBEdit7
        end
        object Label14: TLabel
          Left = 112
          Top = 186
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Costaccount'
          FocusControl = DBEdit9
        end
        object DBEdit4: TDBEdit
          Left = 180
          Top = 88
          Width = 394
          Height = 21
          DataField = 'SNAME'
          DataSource = dsTaxClass
          TabOrder = 0
        end
        object DBEdit5: TDBEdit
          Left = 180
          Top = 113
          Width = 394
          Height = 21
          TabStop = False
          DataField = 'WINPUTTAX'
          DataSource = dsTaxClass
          ReadOnly = True
          TabOrder = 1
          OnDblClick = DBEdit4DblClick
        end
        object DBEdit6: TDBEdit
          Left = 180
          Top = 136
          Width = 394
          Height = 21
          TabStop = False
          DataField = 'WOUTPUTTAX'
          DataSource = dsTaxClass
          ReadOnly = True
          TabOrder = 2
          OnDblClick = DBEdit4DblClick
        end
        object DBEdit8: TDBEdit
          Left = 180
          Top = 208
          Width = 394
          Height = 21
          TabStop = False
          DataField = 'WSTOCKACCOUNTID'
          DataSource = dsTaxClass
          ReadOnly = True
          TabOrder = 5
          OnDblClick = DBEdit4DblClick
        end
        object DBEdit7: TDBEdit
          Left = 180
          Top = 160
          Width = 394
          Height = 21
          TabStop = False
          DataField = 'WSALESACCOUNTID'
          DataSource = dsTaxClass
          ReadOnly = True
          TabOrder = 3
          OnDblClick = DBEdit4DblClick
        end
        object DBEdit9: TDBEdit
          Left = 180
          Top = 183
          Width = 394
          Height = 21
          TabStop = False
          DataField = 'WCOSTACCOUNTID'
          DataSource = dsTaxClass
          ReadOnly = True
          TabOrder = 4
          OnDblClick = DBEdit4DblClick
        end
        object DBNavigator1: TDBNavigator
          Left = 1
          Top = 1
          Width = 665
          Height = 44
          DataSource = dsTaxClass
          Align = alTop
          TabOrder = 11
        end
        object BitBtn2: TBitBtn
          Left = 580
          Top = 137
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
          TabOrder = 7
          OnClick = BitBtn2Click
        end
        object BitBtn3: TBitBtn
          Left = 580
          Top = 113
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
          TabOrder = 6
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 580
          Top = 209
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
          TabOrder = 10
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 580
          Top = 161
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
          TabOrder = 8
          OnClick = BitBtn5Click
        end
        object BitBtn6: TBitBtn
          Left = 580
          Top = 185
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
          TabOrder = 9
          OnClick = BitBtn6Click
        end
        object BitBtn7: TBitBtn
          Left = 4
          Top = 52
          Width = 173
          Height = 25
          Caption = 'reupdate all'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 12
          OnClick = BitBtn7Click
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 237
        Width = 667
        Height = 332
        Align = alClient
        TabOrder = 1
        object cxGrid2DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsTaxClass
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
          object cxGrid2DBTableView1WSTOCKCLASSTAXID: TcxGridDBColumn
            Caption = 'id'
            DataBinding.FieldName = 'WSTOCKCLASSTAXID'
          end
          object cxGrid2DBTableView1SNAME: TcxGridDBColumn
            DataBinding.FieldName = 'SNAME'
            Width = 99
          end
          object cxGrid2DBTableView1WOUTPUTTAX: TcxGridDBColumn
            DataBinding.FieldName = 'WOUTPUTTAX'
            Width = 99
          end
          object cxGrid2DBTableView1WINPUTTAX: TcxGridDBColumn
            DataBinding.FieldName = 'WINPUTTAX'
            Width = 80
          end
          object cxGrid2DBTableView1WSALESACCOUNTID: TcxGridDBColumn
            DataBinding.FieldName = 'WSALESACCOUNTID'
            Width = 94
          end
          object cxGrid2DBTableView1WSTOCKACCOUNTID: TcxGridDBColumn
            DataBinding.FieldName = 'WSTOCKACCOUNTID'
            Width = 116
          end
          object cxGrid2DBTableView1WCOSTACCOUNTID: TcxGridDBColumn
            DataBinding.FieldName = 'WCOSTACCOUNTID'
            Width = 150
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGrid2DBTableView1
        end
      end
    end
  end
  object dsSysvars: TDataSource
    Left = 102
    Top = 308
  end
  object ZQTaxclass: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from stocktaxclass')
    UpdateObject = ZUSQLTaxclass
    BeforePost = ZQTaxclassBeforePost
    Left = 24
    Top = 300
    object ZQTaxclassWSTOCKCLASSTAXID: TIntegerField
      FieldName = 'WSTOCKCLASSTAXID'
      Required = True
    end
    object ZQTaxclassSNAME: TStringField
      FieldName = 'SNAME'
      Size = 30
    end
    object ZQTaxclassWINPUTTAX: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WINPUTTAX'
      OnGetText = ZQTaxclassWINPUTTAXGetText
    end
    object ZQTaxclassWOUTPUTTAX: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WOUTPUTTAX'
      OnGetText = ZQTaxclassWINPUTTAXGetText
    end
    object ZQTaxclassWSALESACCOUNTID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WSALESACCOUNTID'
      OnGetText = ZQTaxclassWINPUTTAXGetText
    end
    object ZQTaxclassWSTOCKACCOUNTID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WSTOCKACCOUNTID'
      OnGetText = ZQTaxclassWINPUTTAXGetText
    end
    object ZQTaxclassWCOSTACCOUNTID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'WCOSTACCOUNTID'
      OnGetText = ZQTaxclassWINPUTTAXGetText
    end
  end
  object ZUSQLTaxclass: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO stocktaxclass'
      
        '  (stocktaxclass.WSTOCKCLASSTAXID, stocktaxclass.SNAME, stocktax' +
        'class.WINPUTTAX, '
      
        '   stocktaxclass.WOUTPUTTAX, stocktaxclass.WSALESACCOUNTID, stoc' +
        'ktaxclass.WSTOCKACCOUNTID, '
      '   stocktaxclass.WCOSTACCOUNTID)'
      'VALUES'
      
        '  (:WSTOCKCLASSTAXID, :SNAME, :WINPUTTAX, :WOUTPUTTAX, :WSALESAC' +
        'COUNTID, '
      '   :WSTOCKACCOUNTID, :WCOSTACCOUNTID)')
    DeleteSQL.Strings = (
      'DELETE FROM stocktaxclass'
      'WHERE'
      '  stocktaxclass.WSTOCKCLASSTAXID = :OLD_WSTOCKCLASSTAXID')
    ModifySQL.Strings = (
      'UPDATE stocktaxclass SET'
      '  stocktaxclass.WSTOCKCLASSTAXID = :WSTOCKCLASSTAXID,'
      '  stocktaxclass.SNAME = :SNAME,'
      '  stocktaxclass.WINPUTTAX = :WINPUTTAX,'
      '  stocktaxclass.WOUTPUTTAX = :WOUTPUTTAX,'
      '  stocktaxclass.WSALESACCOUNTID = :WSALESACCOUNTID,'
      '  stocktaxclass.WSTOCKACCOUNTID = :WSTOCKACCOUNTID,'
      '  stocktaxclass.WCOSTACCOUNTID = :WCOSTACCOUNTID'
      'WHERE'
      '  stocktaxclass.WSTOCKCLASSTAXID = :OLD_WSTOCKCLASSTAXID')
    Left = 180
    Top = 352
  end
  object dsTaxClass: TDataSource
    DataSet = ZQTaxclass
    Left = 284
    Top = 376
  end
  object DataSource1: TDataSource
    DataSet = UniQUnit
    Left = 468
    Top = 264
  end
  object UniQUnit: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO UNIT'
      '  (WUNITID, SDESCRIPTION, DSYSDATE, FUNITQTY)'
      'VALUES'
      '  (:WUNITID, :SDESCRIPTION, :DSYSDATE, :FUNITQTY)')
    SQLDelete.Strings = (
      'DELETE FROM UNIT'
      'WHERE'
      '  WUNITID = :Old_WUNITID')
    SQLUpdate.Strings = (
      'UPDATE UNIT'
      'SET'
      
        ' SDESCRIPTION = :SDESCRIPTION, DSYSDATE = :DSYSDATE, FUNITQTY = ' +
        ':FUNITQTY'
      'WHERE'
      '  WUNITID = :Old_WUNITID')
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select  * from unit order by 1')
    AfterInsert = UniQUnitAfterInsert
    Left = 292
    Top = 272
  end
end
