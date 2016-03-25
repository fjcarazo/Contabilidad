object frPayCreditors: TfrPayCreditors
  Left = 223
  Top = 193
  Caption = 'Pay creditors'
  ClientHeight = 515
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 471
    Width = 848
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 648
      Top = 6
      Width = 91
      Height = 25
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
    end
    object BitBtn2: TBitBtn
      Left = 551
      Top = 6
      Width = 91
      Height = 25
      Caption = 'Procces'
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
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BtnPrint: TBitBtn
      Left = 432
      Top = 6
      Width = 113
      Height = 25
      Caption = '&Print List'
      DoubleBuffered = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000010000000000004141
        4100524E4D0053504E0052525200595554005F5A59005D5D5D0065605F006363
        6300696665006E6866006C6C6C00776D6700767373007777770082777300807E
        7D004573870042778E0073AAB50078AFB50079B1B7007BB2B8007DB3B9007EB5
        BB007FB5BC0064C2CF0068C5CF0075CCD50078CED60079CFD8004FC2EB0051C3
        EB0052C4EB0052C5ED0054C5ED005BC6ED005FC8EE005AC8F00077F1F6007FF5
        F600878787008F8D8B00998F8B009E928E009D948F0093919000989594009D9A
        99009D9D9D00A1959100A3989400A59A9600A19E9E00A89D9900A1A29400A5A3
        A200A9A7A700A7A2AB00A9A9A900AEAAAA00B5A9A600B2AFAF00B3B0AF00BCB3
        AF00B5B2B100B7B5B400B9B6B600BCB6B500C4B6B200C0BCBC0086C180002312
        A50082CFD50084CFD7008FCED50090CED50085D1D80093D0D80084CDEF0080F2
        F60089F5F60090F6F6009CF4F600A5F6F600C4C2C200C8C5C400CECCCC00D0CE
        CC00D7CFCE00D7D5D500E0D5D100EAE5E200ECE7E500F4F2F100F6F6F5000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF121212
        12121212121212FFFFFFFFFFFF12544F4D4D4D4C4C5512FFFFFFFFFFFF12524E
        4B4B4B4B4B5212FFFFFFFF343312281F1E1D1D1D1D29123334FF2E4610121B1C
        1C1C1C1C1C1C130D462E2E5C412C2C2C2C2C2C2C2C2C2C3E5C2E335D5D5D5D5D
        5D5D5D5D5D5D5D5D5D33345F5F57444444444344433F475F5F34345F5B0B0403
        03030302020308585F37375F5908010101010101010105565F373759440E0401
        010101010101053B493C34463E373A312A0E0B0807070A38483CFF33332E3C3B
        3B3B312E2E2B113334FFFFFFFF12191919191915151512FFFFFFFFFFFF125252
        52525252522912FFFFFFFFFFFF12121212121212121212FFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BtnPrintClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 848
    Height = 209
    Align = alTop
    TabOrder = 0
    object LContraAccount: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Contra account'
    end
    object LBankAccount: TLabel
      Left = 272
      Top = 8
      Width = 110
      Height = 13
      Caption = 'Payment bank account'
    end
    object LClieopComment: TLabel
      Left = 464
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Clieop comment'
    end
    object LPaymentDate: TLabel
      Left = 148
      Top = 8
      Width = 70
      Height = 13
      Caption = 'LPaymentDate'
    end
    object EContraAccount: TEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      Text = '2000-000'
    end
    object CBCreateClieop: TCheckBox
      Left = 8
      Top = 52
      Width = 257
      Height = 17
      Caption = 'Create clieop file'
      TabOrder = 2
    end
    object EPaymentBankAccount: TEdit
      Left = 272
      Top = 24
      Width = 185
      Height = 21
      TabOrder = 3
      Text = 'EPaymentBankAccount'
    end
    object BitBtn4: TBitBtn
      Left = 105
      Top = 24
      Width = 24
      Height = 19
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
      TabOrder = 1
      OnClick = BitBtn4Click
    end
    object EClieopComment1: TEdit
      Left = 464
      Top = 24
      Width = 153
      Height = 21
      MaxLength = 40
      TabOrder = 4
    end
    object EClieopComment2: TEdit
      Left = 464
      Top = 48
      Width = 153
      Height = 21
      MaxLength = 40
      TabOrder = 5
    end
    object PFilter: TPanel
      Left = 4
      Top = 76
      Width = 865
      Height = 128
      TabOrder = 6
    end
    object DTPaymentDate: TDateTimePicker
      Left = 148
      Top = 24
      Width = 113
      Height = 21
      Date = 40479.457847939810000000
      Time = 40479.457847939810000000
      TabOrder = 7
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 209
    Width = 848
    Height = 262
    Align = alClient
    TabOrder = 2
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      OnCustomDrawCell = cxGrid1DBBandedTableView1CustomDrawCell
      DataController.DataSource = DSCreditorsOpenItems
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
      Bands = <
        item
        end
        item
          FixedKind = fkLeft
        end>
      object cxGrid1DBBandedTableView1PayTransaction: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PayTransaction'
        RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
        Width = 93
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Description: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Description'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Amount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Amount'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1CreditorCode: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CreditorCode'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1CreditorDescription: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CreditorDescription'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Reference: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Reference'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1TransactionDate: TcxGridDBBandedColumn
        DataBinding.FieldName = 'TransactionDate'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DueDate: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DueDate'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1AmountOpen: TcxGridDBBandedColumn
        DataBinding.FieldName = 'AmountOpen'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
        Options.Editing = False
        Width = 98
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1TransactionID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'TransactionID'
        Options.Editing = False
        Width = 101
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1BankType: TcxGridDBBandedColumn
        DataBinding.FieldName = 'BankType'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1BankNumber: TcxGridDBBandedColumn
        DataBinding.FieldName = 'BankNumber'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1City: TcxGridDBBandedColumn
        DataBinding.FieldName = 'City'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1CreditorDebRef: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CreditorDebRef'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DocRef: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DocRef'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object DSCreditorsOpenItems: TDataSource
    DataSet = CDSCreditorOpenITems
    Left = 136
    Top = 112
  end
  object QCreditorsOpenItems: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select'
      'Account.SACCOUNTCODE,'
      'Account.WACCOUNTTYPEID,'
      '      Account.SDescription,'
      '      transact.WTransactionID,'
      '      transact.DDate,'
      '      transact.DPAYMENTDATE as duedate,'
      '      transact.SReference,'
      '      dochead.SReference SDocref,'
      '      Messages.SDescription,'
      '      transact.FAmount ,'
      '      transact.FOutstandingAmount ,'
      '      Creditor.SPostal2,'
      '      Creditor.SBranchCode,'
      '      Creditor.SBankAccountNumber,'
      '      Creditor.SMessage SCreditRef'
      
        '      from transact  left join dochead on (transact.WDocid = doc' +
        'head.WDocid),'
      '      Account,      Messages,      Creditor'
      '      where'
      '      Messages.WMEssageID = Transact.WDescriptionID'
      '      and Creditor.WAccountId= Account.WAccountId'
      '      and transact.WAccountId= Account.WAccountId'
      '      and Account.WaccountTypeId in (1,2)'
      '      And transact.FOutstandingAmount  < 0'
      'union'
      'SELECT '
      'Account.SACCOUNTCODE,'
      'Account.WACCOUNTTYPEID,'
      '      Account.SDescription,'
      '      transact.WTransactionID,'
      '      transact.DDate,'
      '      transact.DPAYMENTDATE as duedate,'
      '      transact.SReference,'
      '      dochead.SReference SDocref,'
      '      Messages.SDescription,'
      '      transact.FAmount ,'
      '      transact.FOutstandingAmount ,'
      '      debtor.SPostal2,'
      '      debtor.SBranchCode,'
      '      debtor.SBankAccountNumber,'
      '      debtor.SMessage SCreditRef'
      
        '      from transact  left join dochead on (transact.WDocid = doc' +
        'head.WDocid),'
      '      Account,      Messages,      debtor'
      '      where'
      '      Messages.WMEssageID = Transact.WDescriptionID'
      '      and debtor.WAccountId= Account.WAccountId'
      '      and transact.WAccountId= Account.WAccountId'
      '      and Account.WaccountTypeId in (1,2)'
      '      And transact.FOutstandingAmount  < 0')
    CachedUpdates = True
    BeforeOpen = QCreditorsOpenItemsBeforeOpen
    Left = 248
    Top = 104
    object QCreditorsOpenItemsSACCOUNTCODE: TStringField
      FieldName = 'SACCOUNTCODE'
      Size = 6
    end
    object QCreditorsOpenItemsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object QCreditorsOpenItemsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object QCreditorsOpenItemsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object QCreditorsOpenItemsDUEDATE: TDateTimeField
      FieldName = 'DUEDATE'
      ReadOnly = True
    end
    object QCreditorsOpenItemsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QCreditorsOpenItemsSDESCRIPTION_1: TStringField
      FieldName = 'SDESCRIPTION_1'
      Size = 35
    end
    object QCreditorsOpenItemsFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      ReadOnly = True
    end
    object QCreditorsOpenItemsFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
      ReadOnly = True
    end
    object QCreditorsOpenItemsSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object QCreditorsOpenItemsSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object QCreditorsOpenItemsSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object QCreditorsOpenItemsSDOCREF: TStringField
      FieldName = 'SDOCREF'
      Size = 255
    end
    object QCreditorsOpenItemsSCREDITREF: TStringField
      FieldName = 'SCREDITREF'
      Size = 15
    end
    object QCreditorsOpenItemsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
  end
  object CDSCreditorOpenITems: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CreditorCode'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CreditorDescription'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Reference'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TransactionDate'
        DataType = ftDateTime
      end
      item
        Name = 'DueDate'
        DataType = ftDate
      end
      item
        Name = 'Description'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Amount'
        DataType = ftFloat
      end
      item
        Name = 'AmountOpen'
        DataType = ftFloat
      end
      item
        Name = 'PayTransaction'
        DataType = ftInteger
      end
      item
        Name = 'TransactionID'
        DataType = ftInteger
      end
      item
        Name = 'BankType'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'BankNumber'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'City'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CreditorDebRef'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DocRef'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'accountid'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 168
    Data = {
      BD0100009619E0BD010000001800000010000000000003000000BD010C437265
      6469746F72436F64650100490000000100055749445448020002000F00134372
      656469746F724465736372697074696F6E010049000000010005574944544802
      0002001400095265666572656E63650100490000000100055749445448020002
      000F000F5472616E73616374696F6E4461746508000800000000000744756544
      61746504000600000000000B4465736372697074696F6E010049000000010005
      574944544802000200230006416D6F756E7408000400000000000A416D6F756E
      744F70656E08000400000000000E5061795472616E73616374696F6E04000100
      000000000D5472616E73616374696F6E494404000100000000000842616E6B54
      7970650100490000000100055749445448020002000A000A42616E6B4E756D62
      6572010049000000010005574944544802000200230004436974790100490000
      0001000557494454480200020023000E4372656469746F724465625265660100
      49000000010005574944544802000200320006446F6352656601004900000001
      00055749445448020002001400096163636F756E746964040001000000000000
      00}
    object CDSCreditorOpenITemsPayTransaction: TIntegerField
      DisplayWidth = 5
      FieldName = 'PayTransaction'
    end
    object CDSCreditorOpenITemsDescription: TStringField
      DisplayWidth = 35
      FieldName = 'Description'
      Size = 35
    end
    object CDSCreditorOpenITemsAmount: TFloatField
      DisplayWidth = 10
      FieldName = 'Amount'
    end
    object CDSCreditorOpenITemsCreditorCode: TStringField
      DisplayWidth = 15
      FieldName = 'CreditorCode'
      Size = 15
    end
    object CDSCreditorOpenITemsCreditorDescription: TStringField
      DisplayWidth = 20
      FieldName = 'CreditorDescription'
    end
    object CDSCreditorOpenITemsReference: TStringField
      DisplayWidth = 15
      FieldName = 'Reference'
      Size = 15
    end
    object CDSCreditorOpenITemsTransactionDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TransactionDate'
    end
    object CDSCreditorOpenITemsDueDate: TDateField
      DisplayWidth = 10
      FieldName = 'DueDate'
    end
    object CDSCreditorOpenITemsAmountOpen: TFloatField
      DisplayWidth = 10
      FieldName = 'AmountOpen'
    end
    object CDSCreditorOpenITemsTransactionID: TIntegerField
      DisplayWidth = 10
      FieldName = 'TransactionID'
    end
    object CDSCreditorOpenITemsBankType: TStringField
      DisplayWidth = 10
      FieldName = 'BankType'
      Size = 10
    end
    object CDSCreditorOpenITemsBankNumber: TStringField
      DisplayWidth = 35
      FieldName = 'BankNumber'
      Size = 35
    end
    object CDSCreditorOpenITemsCity: TStringField
      DisplayWidth = 35
      FieldName = 'City'
      Size = 35
    end
    object CDSCreditorOpenITemsCreditorDebRef: TStringField
      DisplayLabel = 'Debtor code'
      DisplayWidth = 50
      FieldName = 'CreditorDebRef'
      Size = 50
    end
    object CDSCreditorOpenITemsDocRef: TStringField
      DisplayLabel = 'Document reference'
      DisplayWidth = 20
      FieldName = 'DocRef'
    end
    object CDSCreditorOpenITemsaccountid: TIntegerField
      FieldName = 'accountid'
    end
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 416
    Top = 196
    object Uncheckall1: TMenuItem
      Caption = 'Uncheck all'
      OnClick = Uncheckall1Click
    end
    object Uncheckselected1: TMenuItem
      Caption = 'Uncheck selected'
      OnClick = Uncheckselected1Click
    end
    object Checkselected1: TMenuItem
      Caption = 'Check selected'
      OnClick = Checkselected1Click
    end
    object Reclaccheckedfrompaymentdate1: TMenuItem
      Caption = 'Reclac checked from payment date'
      OnClick = Reclaccheckedfrompaymentdate1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 384
    Top = 112
  end
end
