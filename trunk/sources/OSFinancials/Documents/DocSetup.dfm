object fmDocumentSetup: TfmDocumentSetup
  Left = 421
  Top = 305
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Document Setup'
  ClientHeight = 382
  ClientWidth = 531
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 348
    Width = 531
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      531
      34)
    object BtnOk: TBitBtn
      Left = 324
      Top = 6
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
      OnClick = btnOKClick
      OnKeyDown = FormKeyDown
    end
    object BtnCancel: TBitBtn
      Left = 426
      Top = 6
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancel'
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
      TabOrder = 1
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
    end
    object Bitprn1: TBitBtn
      Left = 196
      Top = 6
      Width = 120
      Height = 25
      Action = fmMain.SetupPrinter
      Anchors = [akTop, akRight]
      Caption = 'Setup Printer'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      TabStop = False
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 111
    Width = 531
    Height = 237
    ActivePage = tsInvoices
    Align = alClient
    Anchors = []
    TabOrder = 1
    OnChange = DBEdit1Change
    object tsInvoices: TTabSheet
      Caption = 'Invoices'
      DesignSize = (
        523
        209)
      object Label1: TLabel
        Left = 35
        Top = 11
        Width = 97
        Height = 13
        Alignment = taRightJustify
        Caption = 'Next invoice number'
      end
      object Label2: TLabel
        Left = 67
        Top = 35
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Invoice batch'
      end
      object Bevel1: TBevel
        Left = 301
        Top = 8
        Width = 2
        Height = 201
      end
      object Label6: TLabel
        Left = 316
        Top = 16
        Width = 78
        Height = 13
        Caption = 'Invoice Heading'
      end
      object Label7: TLabel
        Left = 316
        Top = 64
        Width = 81
        Height = 13
        Caption = 'Invoice Message'
      end
      object LInvLayout: TLabel
        Left = 84
        Top = 59
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file'
      end
      object LInvLayout2: TLabel
        Left = 75
        Top = 84
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file 2'
      end
      object DBEdit1: TDBEdit
        Left = 136
        Top = 8
        Width = 77
        Height = 21
        DataField = 'SInvoiceNextNumber'
        DataSource = dmDatabase.dsUser
        TabOrder = 0
        OnChange = DBEdit1Change
        OnEnter = DBEdit1Enter
        OnExit = DBEdit1Exit
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 136
        Top = 32
        Width = 129
        Height = 21
        DataField = 'WInvoicesBatchID'
        DataSource = dmDatabase.dsSysVars
        KeyField = 'WBatchTypeID'
        ListField = 'SDescription'
        ListSource = DataSource1
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit2: TDBEdit
        Left = 316
        Top = 32
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SInvoiceHeading'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit3: TDBEdit
        Left = 316
        Top = 88
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SInvoicesMessage1'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 3
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit4: TDBEdit
        Left = 316
        Top = 112
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SInvoicesMessage2'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 4
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit5: TDBEdit
        Left = 316
        Top = 136
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SInvoicesMessage3'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 5
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object CBdocLayoutInv: TComboBox
        Left = 136
        Top = 59
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 6
      end
      object CBdocLayoutInv2: TComboBox
        Left = 136
        Top = 83
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 7
      end
    end
    object tsCreditNotes: TTabSheet
      Caption = 'Credit Notes'
      DesignSize = (
        523
        209)
      object Label8: TLabel
        Left = 36
        Top = 11
        Width = 96
        Height = 13
        Alignment = taRightJustify
        Caption = 'Next cr note number'
      end
      object Label9: TLabel
        Left = 51
        Top = 35
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Credit note batch'
      end
      object Bevel2: TBevel
        Left = 301
        Top = 8
        Width = 2
        Height = 201
      end
      object Label10: TLabel
        Left = 316
        Top = 64
        Width = 99
        Height = 13
        Caption = 'Credit Note Message'
      end
      object Label15: TLabel
        Left = 316
        Top = 16
        Width = 96
        Height = 13
        Caption = 'Credit Note Heading'
      end
      object LCredLayout: TLabel
        Left = 84
        Top = 59
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file'
      end
      object LCredLayout2: TLabel
        Left = 75
        Top = 84
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file 2'
      end
      object DBEdit6: TDBEdit
        Left = 136
        Top = 8
        Width = 77
        Height = 21
        DataField = 'SCreditNoteNextNumber'
        DataSource = dmDatabase.dsUser
        TabOrder = 0
        OnChange = DBEdit1Change
        OnEnter = DBEdit6Enter
        OnExit = DBEdit6Exit
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 136
        Top = 32
        Width = 129
        Height = 21
        DataField = 'WCreditNoteBatchTypeID'
        DataSource = dmDatabase.dsSysVars
        KeyField = 'WBatchTypeID'
        ListField = 'SDescription'
        ListSource = DataSource1
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit7: TDBEdit
        Left = 316
        Top = 88
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SCreditNoteMessage1'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 3
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit8: TDBEdit
        Left = 316
        Top = 112
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SCreditNoteMessage2'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 4
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit9: TDBEdit
        Left = 316
        Top = 136
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SCreditNoteMessage3'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 5
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit15: TDBEdit
        Left = 316
        Top = 32
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SCreditNoteHeading'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object CBdocLayoutCreditNote: TComboBox
        Left = 136
        Top = 59
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 6
      end
      object CBdocLayoutCreditNote2: TComboBox
        Left = 136
        Top = 83
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 7
      end
    end
    object tsPurchases: TTabSheet
      Caption = 'Purchases'
      DesignSize = (
        523
        209)
      object Label11: TLabel
        Left = 25
        Top = 11
        Width = 107
        Height = 13
        Alignment = taRightJustify
        Caption = 'Next purchase number'
      end
      object Label12: TLabel
        Left = 316
        Top = 16
        Width = 88
        Height = 13
        Caption = 'Purchase Heading'
      end
      object Label13: TLabel
        Left = 316
        Top = 64
        Width = 91
        Height = 13
        Caption = 'Purchase Message'
      end
      object Label14: TLabel
        Left = 57
        Top = 35
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = 'Purchase batch'
      end
      object Bevel3: TBevel
        Left = 301
        Top = 10
        Width = 2
        Height = 201
      end
      object LPurchaseLayout: TLabel
        Left = 84
        Top = 59
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file'
      end
      object LPurchaseLayout2: TLabel
        Left = 75
        Top = 84
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file 2'
      end
      object DBEdit10: TDBEdit
        Left = 136
        Top = 8
        Width = 77
        Height = 21
        DataField = 'SPurchaseNextNumber'
        DataSource = dmDatabase.dsUser
        TabOrder = 0
        OnChange = DBEdit1Change
        OnEnter = DBEdit10Enter
        OnExit = DBEdit10Exit
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit11: TDBEdit
        Left = 316
        Top = 32
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SPurchaseHeading'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit12: TDBEdit
        Left = 316
        Top = 88
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SPurchasesMessage1'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 3
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit13: TDBEdit
        Left = 316
        Top = 112
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SPurchasesMessage2'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 4
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit14: TDBEdit
        Left = 316
        Top = 136
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SPurchasesMessage3'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 5
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 136
        Top = 32
        Width = 129
        Height = 21
        DataField = 'WPurchasesBatchID'
        DataSource = dmDatabase.dsSysVars
        KeyField = 'WBatchTypeID'
        ListField = 'SDescription'
        ListSource = DataSource1
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object CBdocLayoutPurchases: TComboBox
        Left = 136
        Top = 59
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 6
      end
      object CBdocLayoutPurchases2: TComboBox
        Left = 136
        Top = 83
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 7
      end
    end
    object tsGoodsReturned: TTabSheet
      Caption = 'Goods Returned'
      DesignSize = (
        523
        209)
      object Bevel6: TBevel
        Left = 301
        Top = 10
        Width = 2
        Height = 201
      end
      object Label25: TLabel
        Left = 42
        Top = 11
        Width = 90
        Height = 13
        Alignment = taRightJustify
        Caption = 'Next return number'
      end
      object Label27: TLabel
        Left = 316
        Top = 16
        Width = 104
        Height = 13
        Caption = 'Goods return Heading'
      end
      object Label28: TLabel
        Left = 316
        Top = 64
        Width = 107
        Height = 13
        Caption = 'Goods return Message'
      end
      object Label29: TLabel
        Left = 29
        Top = 35
        Width = 103
        Height = 13
        Alignment = taRightJustify
        Caption = 'Goods returned batch'
      end
      object LGoodsReturndLayout: TLabel
        Left = 84
        Top = 59
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file'
      end
      object LGoodsReturndLayout2: TLabel
        Left = 75
        Top = 84
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file 2'
      end
      object DBEdit26: TDBEdit
        Left = 136
        Top = 8
        Width = 77
        Height = 21
        DataField = 'SGoodsReturnedNextNumber'
        DataSource = dmDatabase.dsUser
        TabOrder = 0
        OnChange = DBEdit1Change
        OnEnter = DBEdit26Enter
        OnExit = DBEdit26Exit
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit27: TDBEdit
        Left = 316
        Top = 32
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SGoodsReturnedHeading'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit28: TDBEdit
        Left = 316
        Top = 88
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SGoodsReturnedMessage1'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 3
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit29: TDBEdit
        Left = 316
        Top = 112
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SGoodsReturnedMessage2'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 4
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit30: TDBEdit
        Left = 316
        Top = 136
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SGoodsReturnedMessage3'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 5
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBLookupComboBox11: TDBLookupComboBox
        Left = 136
        Top = 32
        Width = 129
        Height = 21
        DataField = 'WGoodsReturnedBatchID'
        DataSource = dmDatabase.dsSysVars
        DropDownRows = 12
        KeyField = 'WBatchTypeID'
        ListField = 'SDescription'
        ListSource = DataSource1
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object CBdocLayoutGoodsreturnd: TComboBox
        Left = 136
        Top = 59
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 6
      end
      object CBdocLayoutGoodsreturnd2: TComboBox
        Left = 136
        Top = 83
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 7
      end
    end
    object tsOrders: TTabSheet
      Caption = 'Orders'
      DesignSize = (
        523
        209)
      object Bevel4: TBevel
        Left = 301
        Top = 10
        Width = 2
        Height = 201
      end
      object Label17: TLabel
        Left = 45
        Top = 11
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = 'Next order number'
      end
      object Label20: TLabel
        Left = 316
        Top = 64
        Width = 72
        Height = 13
        Caption = 'Order Message'
      end
      object Label21: TLabel
        Left = 316
        Top = 16
        Width = 69
        Height = 13
        Caption = 'Order Heading'
      end
      object LOrdersLayout: TLabel
        Left = 84
        Top = 59
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file'
      end
      object LOrdersLayout2: TLabel
        Left = 75
        Top = 84
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file 2'
      end
      object DBEdit16: TDBEdit
        Left = 136
        Top = 8
        Width = 77
        Height = 21
        DataField = 'SOrderNextNumber'
        DataSource = dmDatabase.dsUser
        TabOrder = 0
        OnChange = DBEdit1Change
        OnEnter = DBEdit16Enter
        OnExit = DBEdit16Exit
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit17: TDBEdit
        Left = 316
        Top = 88
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SOrderMessage1'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit18: TDBEdit
        Left = 316
        Top = 112
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SOrderMessage2'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit19: TDBEdit
        Left = 316
        Top = 136
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SOrderMessage3'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 3
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit20: TDBEdit
        Left = 316
        Top = 32
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SOrderHeading'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 4
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object CBdocLayoutOrder: TComboBox
        Left = 136
        Top = 59
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 5
      end
      object CBdocLayoutOrder2: TComboBox
        Left = 136
        Top = 83
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 6
      end
    end
    object tsQuotes: TTabSheet
      Caption = 'Quotes'
      DesignSize = (
        523
        209)
      object Label18: TLabel
        Left = 42
        Top = 11
        Width = 90
        Height = 13
        Alignment = taRightJustify
        Caption = 'Next quote number'
      end
      object Bevel5: TBevel
        Left = 301
        Top = 10
        Width = 2
        Height = 201
      end
      object Label23: TLabel
        Left = 316
        Top = 16
        Width = 72
        Height = 13
        Caption = 'Quote Heading'
      end
      object Label24: TLabel
        Left = 316
        Top = 64
        Width = 75
        Height = 13
        Caption = 'Quote Message'
      end
      object LQuoteslayout: TLabel
        Left = 84
        Top = 59
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file'
      end
      object LQuoteslayout2: TLabel
        Left = 75
        Top = 84
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Layout file 2'
      end
      object DBEdit21: TDBEdit
        Left = 136
        Top = 8
        Width = 77
        Height = 21
        DataField = 'SQuoteNextNumber'
        DataSource = dmDatabase.dsUser
        TabOrder = 0
        OnChange = DBEdit1Change
        OnEnter = DBEdit21Enter
        OnExit = DBEdit21Exit
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit22: TDBEdit
        Left = 316
        Top = 32
        Width = 137
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SQuoteHeading'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 1
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit23: TDBEdit
        Left = 316
        Top = 88
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SQuoteMessage1'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 2
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit24: TDBEdit
        Left = 316
        Top = 112
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SQuoteMessage2'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 3
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object DBEdit25: TDBEdit
        Left = 316
        Top = 136
        Width = 153
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SQuoteMessage3'
        DataSource = dmDatabase.dsSysVars
        TabOrder = 4
        OnKeyDown = FormKeyDown
        OnKeyPress = DBEdit1KeyPress
      end
      object CBdocLayoutQuote: TComboBox
        Left = 136
        Top = 59
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 5
      end
      object CBdocLayoutQuote2: TComboBox
        Left = 136
        Top = 83
        Width = 129
        Height = 21
        Style = csDropDownList
        TabOrder = 6
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 111
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Layout file'
    end
    object Lnextbatchnr: TLabel
      Left = 8
      Top = 87
      Width = 64
      Height = 13
      Caption = 'Next batch nr'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 6
      Top = 31
      Width = 163
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Print standard logo'
      DataField = 'BUnitsExist'
      DataSource = dmDatabase.dsSysVars
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object docLayout: TComboBox
      Left = 256
      Top = 3
      Width = 185
      Height = 21
      TabOrder = 1
      Text = 'docLayout'
    end
    object CBUseOneNumbering: TCheckBox
      Left = 6
      Top = 59
      Width = 163
      Height = 17
      Alignment = taLeftJustify
      Caption = 'General numbers'
      TabOrder = 2
      OnClick = CBUseOneNumberingClick
    end
    object CBUserGeneralNumber: TComboBox
      Left = 256
      Top = 57
      Width = 185
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      Visible = False
      OnChange = CBUserGeneralNumberChange
    end
    object CBAutoPostDocuments: TCheckBox
      Left = 256
      Top = 30
      Width = 185
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Auto post documents'
      TabOrder = 4
    end
    object DBEdit31: TDBEdit
      Left = 256
      Top = 84
      Width = 185
      Height = 21
      DataField = 'SNEXTBATCHNUMBER'
      DataSource = dmDatabase.dsUser
      TabOrder = 5
      OnKeyDown = FormKeyDown
      OnKeyPress = DBEdit1KeyPress
    end
  end
  object qryBatchTypesList: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select WBatchTypeID,BCashBook,BatTypes.SDescription,'
      'WContraAccountID, BContraPerLine,'
      
        'BatTypes.DSysDate,(Account.SACCOUNTCODE||'#39'  '#39'||Account.SDescript' +
        'ion)   SContraName,'
      'WAccountID'
      
        'From v_BatTypes BatTypes left join  v_Account Account  on BatTyp' +
        'es.WContraAccountID=Account.WAccountID'
      '')
    Left = 574
    Top = 73
    object qryBatchTypesListWBATCHTYPEID: TIntegerField
      FieldName = 'WBATCHTYPEID'
    end
    object qryBatchTypesListBCASHBOOK: TSmallintField
      FieldName = 'BCASHBOOK'
    end
    object qryBatchTypesListSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 16
    end
    object qryBatchTypesListWCONTRAACCOUNTID: TIntegerField
      FieldName = 'WCONTRAACCOUNTID'
    end
    object qryBatchTypesListBCONTRAPERLINE: TSmallintField
      FieldName = 'BCONTRAPERLINE'
    end
    object qryBatchTypesListDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object qryBatchTypesListSCONTRANAME: TStringField
      FieldName = 'SCONTRANAME'
      Size = 42
    end
    object qryBatchTypesListWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryBatchTypesList
    Left = 112
    Top = 280
  end
end
