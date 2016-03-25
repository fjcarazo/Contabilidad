object frBatchPayDebtors: TfrBatchPayDebtors
  Left = 259
  Top = 165
  Caption = 'Automatische incasso'
  ClientHeight = 582
  ClientWidth = 986
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 538
    Width = 986
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 664
      Top = 8
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
      Left = 568
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Process'
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
      Left = 448
      Top = 8
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 245
    Width = 986
    Height = 293
    Align = alClient
    TabOrder = 1
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      Styles.StyleSheet = dmQuantumGridDefs.GridBandedTableViewStyleSheetWindowsStandard
      Bands = <
        item
          FixedKind = fkLeft
          Width = 550
        end
        item
        end>
      object cxGrid1DBBandedTableView1EXPORT: TcxGridDBBandedColumn
        DataBinding.FieldName = 'EXPORT'
        RepositoryItem = dmQuantumGridDefs.osfDBCheckbox
        Width = 67
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Code: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Code'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SDescription: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SDescription'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Type: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Type'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SReference: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SReference'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1TotalAmount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'TotalAmount'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1Outstanding: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Outstanding'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DDuedate: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DDuedate'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WDueDays: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WDueDays'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DLastActivity: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DLastActivity'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1FChargeAmount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'FChargeAmount'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1FCREDITLimit: TcxGridDBBandedColumn
        DataBinding.FieldName = 'FCREDITLimit'
        RepositoryItem = dmQuantumGridDefs.osFcurrencyEdit
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1FDiscount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'FDiscount'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1FInterest: TcxGridDBBandedColumn
        DataBinding.FieldName = 'FInterest'
        RepositoryItem = dmQuantumGridDefs.osfQtyWithHighDecimals
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1ReportingGroup1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'ReportingGroup1'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1ReportingGroup2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'ReportingGroup2'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SBankAccountNumber: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SBankAccountNumber'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SBranchCode: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SBranchCode'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SPostal1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SPostal1'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 15
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SPostal2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SPostal2'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 16
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SPostal3: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SPostal3'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 17
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SPostalCode: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SPostalCode'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 18
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1STelephone1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'STelephone1'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 19
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SLINEDESC: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SLINEDESC'
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 20
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DDate: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DDate'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 21
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SCode: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SCode'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 22
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1BDisabled: TcxGridDBBandedColumn
        DataBinding.FieldName = 'BDisabled'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 23
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1BOpenItem: TcxGridDBBandedColumn
        DataBinding.FieldName = 'BOpenItem'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 24
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1BPostBBF: TcxGridDBBandedColumn
        DataBinding.FieldName = 'BPostBBF'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 25
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1CountOutstanding: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CountOutstanding'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 26
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1DSysDate: TcxGridDBBandedColumn
        DataBinding.FieldName = 'DSysDate'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 27
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SBankAccountName: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SBankAccountName'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 28
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SBankName: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SBankName'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 29
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SCreditCardHolder: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SCreditCardHolder'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 30
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SCreditCardNumber: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SCreditCardNumber'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 31
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SCreditCardType: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SCreditCardType'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 32
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SDelivery1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SDelivery1'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 33
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SDelivery2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SDelivery2'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 34
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SDelivery3: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SDelivery3'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 35
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SDeliveryCode: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SDeliveryCode'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 36
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SEmail: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SEmail'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 37
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SFax: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SFax'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 38
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SMessage: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SMessage'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 39
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1SPassword: TcxGridDBBandedColumn
        DataBinding.FieldName = 'SPassword'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 40
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1STelephone2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'STelephone2'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 41
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WAccountID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WAccountID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 42
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WBankID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WBankID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 43
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WContactID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WContactID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 44
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WCurrencyID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WCurrencyID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 45
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WDefaultAccount: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WDefaultAccount'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 46
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WDefaultPriceTypeID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WDefaultPriceTypeID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 47
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WForexAccountID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WForexAccountID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 48
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WReportingGroup1ID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WReportingGroup1ID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 49
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WReportingGroup2ID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WReportingGroup2ID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 50
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WSalesmanID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WSalesmanID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 51
        Position.RowIndex = 0
      end
      object cxGrid1DBBandedTableView1WTransactionID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WTransactionID'
        Visible = False
        Options.Editing = False
        Position.BandIndex = 1
        Position.ColIndex = 52
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBBandedTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 245
    Align = alTop
    TabOrder = 2
    DesignSize = (
      986
      245)
    object Label1: TLabel
      Left = 159
      Top = 5
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Van'
    end
    object Label2: TLabel
      Left = 161
      Top = 43
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tot'
    end
    object LBankAccount: TLabel
      Left = 464
      Top = 25
      Width = 148
      Height = 13
      Caption = 'Rekening nummer ontvangsten'
    end
    object LPaymentDate: TLabel
      Left = 656
      Top = 25
      Width = 62
      Height = 13
      Caption = 'Betaal datum'
    end
    object LContraAccount: TLabel
      Left = 8
      Top = 25
      Width = 73
      Height = 13
      Caption = 'Contra account'
    end
    object Label3: TLabel
      Left = 11
      Top = 65
      Width = 52
      Height = 13
      Caption = 'Message 1'
    end
    object Label4: TLabel
      Left = 251
      Top = 65
      Width = 52
      Height = 13
      Caption = 'Message 2'
    end
    object Label5: TLabel
      Left = 491
      Top = 65
      Width = 52
      Height = 13
      Caption = 'Message 3'
    end
    object Label6: TLabel
      Left = 464
      Top = 5
      Width = 54
      Height = 13
      Caption = 'ExportType'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 184
      Top = 2
      Width = 186
      Height = 21
      Date = 2.454867071821354000
      Time = 2.454867071821354000
      MaxDate = 365245.000000000000000000
      MinDate = 2.000000000000000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 184
      Top = 40
      Width = 186
      Height = 21
      Date = 2.454894560214598000
      Time = 2.454894560214598000
      MaxDate = 365245.000000000000000000
      MinDate = 2.000000000000000000
      TabOrder = 1
    end
    object BRefresh: TButton
      Left = 376
      Top = 40
      Width = 75
      Height = 21
      Caption = 'Ververs'
      TabOrder = 2
      OnClick = BRefreshClick
    end
    object EPaymentBankAccount: TEdit
      Left = 464
      Top = 40
      Width = 185
      Height = 21
      TabOrder = 3
      OnExit = EPaymentBankAccountExit
    end
    object DTPaymentDate: TDateTimePicker
      Left = 656
      Top = 40
      Width = 113
      Height = 21
      Date = 2.672646655119024000
      Time = 2.672646655119024000
      MaxDate = 365245.000000000000000000
      MinDate = 2.000000000000000000
      TabOrder = 4
    end
    object BitBtn4: TBitBtn
      Left = 105
      Top = 40
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
      TabOrder = 5
      OnClick = BitBtn4Click
    end
    object EContraAccount: TEdit
      Left = 8
      Top = 40
      Width = 97
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 6
      Text = '2000-000'
    end
    object CBUseInvoiceRef: TCheckBox
      Left = 8
      Top = 4
      Width = 129
      Height = 17
      Caption = 'Use invoice ref'
      TabOrder = 7
    end
    object EMessage1: TEdit
      Left = 11
      Top = 80
      Width = 230
      Height = 21
      TabOrder = 8
    end
    object EMessage2: TEdit
      Left = 251
      Top = 80
      Width = 230
      Height = 21
      TabOrder = 9
    end
    object EMessage3: TEdit
      Left = 491
      Top = 80
      Width = 230
      Height = 21
      TabOrder = 10
    end
    object cbIncQuotes: TCheckBox
      Left = 736
      Top = 82
      Width = 97
      Height = 17
      Caption = 'Inc quotes'
      TabOrder = 11
    end
    object PFilter: TPanel
      Left = 11
      Top = 107
      Width = 964
      Height = 128
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 12
    end
    object cbExportType: TComboBox
      Left = 524
      Top = 2
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 13
      Text = 'None'
      OnChange = cbExportTypeChange
      Items.Strings = (
        'None'
        'Clieop'
        'pain.008.001.02')
    end
  end
  object CDOpenstaandePosten: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EXPORT'
        DataType = ftInteger
      end
      item
        Name = 'Code'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SDescription'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'Type'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SReference'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TotalAmount'
        DataType = ftFloat
      end
      item
        Name = 'Outstanding'
        DataType = ftFloat
      end
      item
        Name = 'DDuedate'
        DataType = ftDate
      end
      item
        Name = 'WDueDays'
        DataType = ftInteger
      end
      item
        Name = 'DLastActivity'
        DataType = ftDate
      end
      item
        Name = 'FChargeAmount'
        DataType = ftFloat
      end
      item
        Name = 'FCreditLimit'
        DataType = ftFloat
      end
      item
        Name = 'FDiscount'
        DataType = ftFloat
      end
      item
        Name = 'FInterest'
        DataType = ftFloat
      end
      item
        Name = 'ReportingGroup1'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ReportingGroup2'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SBankAccountNumber'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SBranchCode'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SCode'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SPostal1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SPostal2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SPostal3'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SPostalCode'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'STelephone1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BDisabled'
        DataType = ftInteger
      end
      item
        Name = 'BOpenItem'
        DataType = ftInteger
      end
      item
        Name = 'BPostBBF'
        DataType = ftInteger
      end
      item
        Name = 'CountOutstanding'
        DataType = ftInteger
      end
      item
        Name = 'DSysDate'
        DataType = ftDateTime
      end
      item
        Name = 'SBankAccountName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SBankName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SCreditCardHolder'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SCreditCardNumber'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SCreditCardType'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SDelivery1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SDelivery2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SDelivery3'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SDeliveryCode'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'SEmail'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SFax'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SMessage'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SPassword'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'STelephone2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'WAccountID'
        DataType = ftInteger
      end
      item
        Name = 'WBankID'
        DataType = ftInteger
      end
      item
        Name = 'WContactID'
        DataType = ftInteger
      end
      item
        Name = 'WCurrencyID'
        DataType = ftInteger
      end
      item
        Name = 'WDefaultAccount'
        DataType = ftInteger
      end
      item
        Name = 'WDefaultPriceTypeID'
        DataType = ftInteger
      end
      item
        Name = 'WForexAccountID'
        DataType = ftInteger
      end
      item
        Name = 'WReportingGroup1ID'
        DataType = ftInteger
      end
      item
        Name = 'WReportingGroup2ID'
        DataType = ftInteger
      end
      item
        Name = 'WSalesmanID'
        DataType = ftInteger
      end
      item
        Name = 'WTransactionID'
        DataType = ftInteger
      end
      item
        Name = 'DDate'
        DataType = ftDate
      end
      item
        Name = 'SLINEDESC'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DEXPIRYDATE'
        DataType = ftDateTime
      end
      item
        Name = 'SCOMPANYREGNO'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 140
    Top = 340
    Data = {
      030600009619E0BD01000000180000003A000000000003000000030606455850
      4F5254040001000000000004436F646501004900000001000557494454480200
      02000A000C534465736372697074696F6E010049000000010005574944544802
      0002002300045479706501004900000001000557494454480200020014000A53
      5265666572656E636501004900000001000557494454480200020028000B546F
      74616C416D6F756E7408000400000000000B4F75747374616E64696E67080004
      0000000000084444756564617465040006000000000008574475654461797304
      000100000000000D444C617374416374697669747904000600000000000D4643
      6861726765416D6F756E7408000400000000000C464372656469744C696D6974
      08000400000000000946446973636F756E7408000400000000000946496E7465
      7265737408000400000000000F5265706F7274696E6747726F75703101004900
      000001000557494454480200020028000F5265706F7274696E6747726F757032
      0100490000000100055749445448020002002800125342616E6B4163636F756E
      744E756D62657201004900000001000557494454480200020014000B53427261
      6E6368436F64650100490000000100055749445448020002000A000553436F64
      6501004900000001000557494454480200020006000853506F7374616C310100
      490000000100055749445448020002001E000853506F7374616C320100490000
      000100055749445448020002001E000853506F7374616C330100490000000100
      055749445448020002001E000B53506F7374616C436F64650100490000000100
      0557494454480200020008000B5354656C6570686F6E65310100490000000100
      055749445448020002001400094244697361626C656404000100000000000942
      4F70656E4974656D04000100000000000842506F737442424604000100000000
      0010436F756E744F75747374616E64696E670400010000000000084453797344
      6174650800080000000000105342616E6B4163636F756E744E616D6501004900
      00000100055749445448020002001E00095342616E6B4E616D65010049000000
      0100055749445448020002001400115343726564697443617264486F6C646572
      0100490000000100055749445448020002001400115343726564697443617264
      4E756D62657201004900000001000557494454480200020014000F5343726564
      6974436172645479706501004900000001000557494454480200020014000A53
      44656C6976657279310100490000000100055749445448020002001E000A5344
      656C6976657279320100490000000100055749445448020002001E000A534465
      6C6976657279330100490000000100055749445448020002001E000D5344656C
      6976657279436F64650100490000000100055749445448020002000800065345
      6D61696C01004900000001000557494454480200020032000453466178010049
      000000010005574944544802000200140008534D657373616765010049000000
      0100055749445448020002003200095350617373776F72640100490000000100
      0557494454480200020008000B5354656C6570686F6E65320100490000000100
      0557494454480200020014000A574163636F756E744944040001000000000007
      5742616E6B494404000100000000000A57436F6E746163744944040001000000
      00000B5743757272656E6379494404000100000000000F5744656661756C7441
      63636F756E740400010000000000135744656661756C74507269636554797065
      494404000100000000000F57466F7265784163636F756E744944040001000000
      000012575265706F7274696E6747726F75703149440400010000000000125752
      65706F7274696E6747726F757032494404000100000000000B5753616C65736D
      616E494404000100000000000E575472616E73616374696F6E49440400010000
      000000054444617465040006000000000009534C494E45444553430100490000
      0001000557494454480200020064000B44455850495259444154450800080000
      0000000D53434F4D50414E595245474E4F010049000000010005574944544802
      00020014000000}
    object CDOpenstaandePostenEXPORT: TIntegerField
      DisplayLabel = 'Export'
      DisplayWidth = 5
      FieldName = 'EXPORT'
    end
    object CDOpenstaandePostenCode: TStringField
      DisplayWidth = 7
      FieldName = 'Code'
      Size = 10
    end
    object CDOpenstaandePostenSDescription: TStringField
      DisplayLabel = 'Debiteur'
      DisplayWidth = 35
      FieldName = 'SDescription'
      Size = 35
    end
    object CDOpenstaandePostenType: TStringField
      DisplayWidth = 10
      FieldName = 'Type'
    end
    object CDOpenstaandePostenSReference: TStringField
      DisplayLabel = 'Factuur ref'
      DisplayWidth = 18
      FieldName = 'SReference'
      Size = 40
    end
    object CDOpenstaandePostenTotalAmount: TFloatField
      DisplayLabel = 'Factuur bedrag'
      DisplayWidth = 12
      FieldName = 'TotalAmount'
    end
    object CDOpenstaandePostenOutstanding: TFloatField
      DisplayLabel = 'Uitstaand'
      DisplayWidth = 10
      FieldName = 'Outstanding'
    end
    object CDOpenstaandePostenDDueDate: TDateField
      DisplayLabel = 'Afloop datum'
      DisplayWidth = 10
      FieldName = 'DDuedate'
    end
    object CDOpenstaandePostenWDueDays: TIntegerField
      DisplayLabel = 'Betaal conditie'
      DisplayWidth = 11
      FieldName = 'WDueDays'
    end
    object CDOpenstaandePostenDLastActivity: TDateField
      DisplayLabel = 'Laaste activiteit'
      DisplayWidth = 12
      FieldName = 'DLastActivity'
    end
    object CDOpenstaandePostenFChargeAmount: TFloatField
      DisplayLabel = 'Reken bedrag'
      DisplayWidth = 11
      FieldName = 'FChargeAmount'
    end
    object CDOpenstaandePostenFCREDITLimit: TFloatField
      DisplayLabel = 'Credit limiet'
      DisplayWidth = 10
      FieldName = 'FCREDITLimit'
    end
    object CDOpenstaandePostenFDiscount: TFloatField
      DisplayLabel = 'Korting'
      DisplayWidth = 10
      FieldName = 'FDiscount'
    end
    object CDOpenstaandePostenFInterest: TFloatField
      DisplayLabel = 'Rente'
      DisplayWidth = 10
      FieldName = 'FInterest'
    end
    object CDOpenstaandePostenReportingGroup1: TStringField
      DisplayLabel = 'Rapportgroep 1'
      DisplayWidth = 40
      FieldName = 'ReportingGroup1'
      Size = 40
    end
    object CDOpenstaandePostenReportingGroup2: TStringField
      DisplayLabel = 'Rapportgroep 2'
      DisplayWidth = 40
      FieldName = 'ReportingGroup2'
      Size = 40
    end
    object CDOpenstaandePostenSBankAccountNumber: TStringField
      DisplayLabel = 'Bank rekening nummer'
      DisplayWidth = 20
      FieldName = 'SBankAccountNumber'
    end
    object CDOpenstaandePostenSBranchCode: TStringField
      DisplayLabel = 'Bank type'
      DisplayWidth = 10
      FieldName = 'SBranchCode'
      Size = 10
    end
    object CDOpenstaandePostenSPostal1: TStringField
      DisplayLabel = 'Straat / huisnr'
      DisplayWidth = 30
      FieldName = 'SPostal1'
      Size = 30
    end
    object CDOpenstaandePostenSPostal2: TStringField
      DisplayLabel = 'Plaats'
      DisplayWidth = 30
      FieldName = 'SPostal2'
      Size = 30
    end
    object CDOpenstaandePostenSPostal3: TStringField
      DisplayLabel = 'Land'
      DisplayWidth = 30
      FieldName = 'SPostal3'
      Size = 30
    end
    object CDOpenstaandePostenSPostalCode: TStringField
      DisplayLabel = 'Postcode'
      DisplayWidth = 8
      FieldName = 'SPostalCode'
      Size = 8
    end
    object CDOpenstaandePostenSTelephone1: TStringField
      DisplayLabel = 'Telefoon nummer'
      DisplayWidth = 20
      FieldName = 'STelephone1'
    end
    object CDOpenstaandePostenSLINEDESC: TStringField
      DisplayLabel = 'Linedesc'
      DisplayWidth = 100
      FieldName = 'SLINEDESC'
      Size = 100
    end
    object CDOpenstaandePostenDDate: TDateField
      FieldName = 'DDate'
      Visible = False
    end
    object CDOpenstaandePostenSCode: TStringField
      DisplayWidth = 6
      FieldName = 'SCode'
      Visible = False
      Size = 6
    end
    object CDOpenstaandePostenBDisabled: TIntegerField
      DisplayWidth = 5
      FieldName = 'BDisabled'
      Visible = False
    end
    object CDOpenstaandePostenBOpenItem: TIntegerField
      DisplayWidth = 5
      FieldName = 'BOpenItem'
      Visible = False
    end
    object CDOpenstaandePostenBPostBBF: TIntegerField
      DisplayWidth = 5
      FieldName = 'BPostBBF'
      Visible = False
    end
    object CDOpenstaandePostenCountOutstanding: TIntegerField
      DisplayWidth = 10
      FieldName = 'CountOutstanding'
      Visible = False
    end
    object CDOpenstaandePostenDSysDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DSysDate'
      Visible = False
    end
    object CDOpenstaandePostenSBankAccountName: TStringField
      DisplayWidth = 30
      FieldName = 'SBankAccountName'
      Visible = False
      Size = 30
    end
    object CDOpenstaandePostenSBankName: TStringField
      DisplayWidth = 20
      FieldName = 'SBankName'
      Visible = False
    end
    object CDOpenstaandePostenSCreditCardHolder: TStringField
      DisplayWidth = 20
      FieldName = 'SCreditCardHolder'
      Visible = False
    end
    object CDOpenstaandePostenSCreditCardNumber: TStringField
      DisplayWidth = 20
      FieldName = 'SCreditCardNumber'
      Visible = False
    end
    object CDOpenstaandePostenSCreditCardType: TStringField
      DisplayWidth = 20
      FieldName = 'SCreditCardType'
      Visible = False
    end
    object CDOpenstaandePostenSDelivery1: TStringField
      DisplayWidth = 30
      FieldName = 'SDelivery1'
      Visible = False
      Size = 30
    end
    object CDOpenstaandePostenSDelivery2: TStringField
      DisplayWidth = 30
      FieldName = 'SDelivery2'
      Visible = False
      Size = 30
    end
    object CDOpenstaandePostenSDelivery3: TStringField
      DisplayWidth = 30
      FieldName = 'SDelivery3'
      Visible = False
      Size = 30
    end
    object CDOpenstaandePostenSDeliveryCode: TStringField
      DisplayWidth = 8
      FieldName = 'SDeliveryCode'
      Visible = False
      Size = 8
    end
    object CDOpenstaandePostenSEmail: TStringField
      DisplayWidth = 50
      FieldName = 'SEmail'
      Visible = False
      Size = 50
    end
    object CDOpenstaandePostenSFax: TStringField
      DisplayWidth = 20
      FieldName = 'SFax'
      Visible = False
    end
    object CDOpenstaandePostenSMessage: TStringField
      DisplayWidth = 50
      FieldName = 'SMessage'
      Visible = False
      Size = 50
    end
    object CDOpenstaandePostenSPassword: TStringField
      DisplayWidth = 8
      FieldName = 'SPassword'
      Visible = False
      Size = 8
    end
    object CDOpenstaandePostenSTelephone2: TStringField
      DisplayWidth = 20
      FieldName = 'STelephone2'
      Visible = False
    end
    object CDOpenstaandePostenWAccountID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WAccountID'
      Visible = False
    end
    object CDOpenstaandePostenWBankID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WBankID'
      Visible = False
    end
    object CDOpenstaandePostenWContactID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WContactID'
      Visible = False
    end
    object CDOpenstaandePostenWCurrencyID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WCurrencyID'
      Visible = False
    end
    object CDOpenstaandePostenWDefaultAccount: TIntegerField
      DisplayWidth = 10
      FieldName = 'WDefaultAccount'
      Visible = False
    end
    object CDOpenstaandePostenWDefaultPriceTypeID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WDefaultPriceTypeID'
      Visible = False
    end
    object CDOpenstaandePostenWForexAccountID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WForexAccountID'
      Visible = False
    end
    object CDOpenstaandePostenWReportingGroup1ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WReportingGroup1ID'
      Visible = False
    end
    object CDOpenstaandePostenWReportingGroup2ID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WReportingGroup2ID'
      Visible = False
    end
    object CDOpenstaandePostenWSalesmanID: TIntegerField
      DisplayWidth = 10
      FieldName = 'WSalesmanID'
      Visible = False
    end
    object CDOpenstaandePostenWTransactionID: TIntegerField
      FieldName = 'WTransactionID'
      Visible = False
    end
    object CDOpenstaandePostenDEXPIRYDATE: TDateTimeField
      FieldName = 'DEXPIRYDATE'
    end
    object CDOpenstaandePostenSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
    end
  end
  object QSelectOpenDebtorItems: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'SELECT '
      'Account.SACCOUNTCODE Code,'
      'Account.SDescription,'
      'Account.WReportingGroup1ID,'
      'Account.WReportingGroup2ID,'
      'Account.WAccountID, '
      'Account.WAccountTypeID, '
      
        'trim(Messages.SDESCRIPTION) || coalesce(Messages.SEXTRADESCRIPTI' +
        'ON,'#39#39') SlineDesc ,'
      'Transact.SReference,'
      'WContactID, '
      'SPassword, '
      'SPostal1, '
      'SPostal2, '
      'SPostal3, '
      'SPostalCode, '
      'SDelivery1, '
      'SDelivery2, '
      'SDelivery3, '
      'SDeliveryCode, '
      'STelephone1, '
      'STelephone2, '
      'SFax, '
      'SEmail, '
      'SBankName, '
      'SBranchCode, '
      'SBankAccountNumber, '
      'SBankAccountName, '
      'SCreditCardNumber, '
      'DExpiryDate,'
      'SCreditCardType, '
      'SCreditCardHolder, '
      'FCREDITLimit, '
      'FChargeAmount, '
      'FDiscount, '
      'FInterest, '
      'WBankID, '
      'WSalesmanID, '
      'Account.BOpenItem, '
      'BPostBBF, '
      'BDisabled, '
      'SMessage, '
      'WDefaultPriceTypeID, '
      'DLastActivity, '
      'Debtor.WCurrencyID, '
      'WForexAccountID, '
      'Debtor.SReference, '
      'Debtor.DSysDate, '
      'SCOMPANYREGNO,'
      'WDueDays, '
      'WDefaultAccount ,'
      'WTransactionID ,'
      'DDate,'
      'DPAYMENTDATE   dduedate,'
      'FAmount as TotalAmount,'
      'FOutstandingAmount  as Outstanding,'
      '1 as CountOutstanding'
      
        'from Transact join  Debtor on Transact.WAccountId =Debtor.wAccou' +
        'ntId'
      'join Account  on  Transact.WAccountId = Account.WAccountId'
      'join messages on transact.WDESCRIPTIONID = messages.WMESSAGEID'
      'where FOutstandingAmount > 0'
      'and (DDate >=:Date1  and DDate <= :Date2)'
      ' '
      'union'
      'SELECT'
      'Account.SACCOUNTCODE Code,'
      'Account.SDescription,'
      'Account.WReportingGroup1ID,'
      'Account.WReportingGroup2ID,'
      'Account.WAccountID, '
      'Account.WAccountTypeID, '
      
        'trim(Messages.SDESCRIPTION) || coalesce(Messages.SEXTRADESCRIPTI' +
        'ON,'#39#39') SlineDesc ,'
      'Transact.SReference,'
      'WContactID, '
      'SPassword, '
      'SPostal1, '
      'SPostal2, '
      'SPostal3, '
      'SPostalCode, '
      'SDelivery1, '
      'SDelivery2, '
      'SDelivery3, '
      'SDeliveryCode, '
      'STelephone1, '
      'STelephone2, '
      'SFax, '
      'SEmail, '
      'SBankName, '
      'SBranchCode, '
      'SBankAccountNumber, '
      'SBankAccountName, '
      'SCreditCardNumber, '
      'DExpiryDate,'
      #39#39', '
      #39#39', '
      'FCREDITLimit, '
      'FChargeAmount, '
      'FDiscount, '
      'null, '
      'null, '
      'null, '
      'Account.BOpenItem, '
      'BPostBBF, '
      'null, '
      'SMessage, '
      'WDefaultPriceTypeID, '
      'DLastActivity, '
      'Debtor.WCurrencyID, '
      'WForexAccountID, '
      'Debtor.SReference, '
      'Debtor.DSysDate, '
      'SCOMPANYREGNO ,'
      ''
      'WDueDays, '
      'WDefaultAccount ,'
      'WTransactionID ,'
      'DDate,'
      'DPAYMENTDATE   dduedate,'
      'FAmount as TotalAmount,'
      'FOutstandingAmount  as Outstanding,'
      '1 as CountOutstanding'
      
        'from Transact join  creditor Debtor on Transact.WAccountId =Debt' +
        'or.wAccountId'
      'join Account  on  Transact.WAccountId = Account.WAccountId'
      'join messages on transact.WDESCRIPTIONID = messages.WMESSAGEID'
      'where FOutstandingAmount > 0  '
      'and (DDate >=:Date3  and DDate <= :Date4)')
    BeforeOpen = QSelectOpenDebtorItemsBeforeOpen
    Left = 276
    Top = 156
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date1'
      end
      item
        DataType = ftDate
        Name = 'Date2'
      end
      item
        DataType = ftUnknown
        Name = 'Date3'
      end
      item
        DataType = ftUnknown
        Name = 'Date4'
      end>
    object QSelectOpenDebtorItemsCODE: TStringField
      FieldName = 'CODE'
      Size = 7
    end
    object QSelectOpenDebtorItemsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 64
    end
    object QSelectOpenDebtorItemsWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object QSelectOpenDebtorItemsWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object QSelectOpenDebtorItemsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QSelectOpenDebtorItemsSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QSelectOpenDebtorItemsWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object QSelectOpenDebtorItemsSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object QSelectOpenDebtorItemsSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 64
    end
    object QSelectOpenDebtorItemsSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object QSelectOpenDebtorItemsSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object QSelectOpenDebtorItemsSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object QSelectOpenDebtorItemsSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 84
    end
    object QSelectOpenDebtorItemsSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object QSelectOpenDebtorItemsSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object QSelectOpenDebtorItemsSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object QSelectOpenDebtorItemsSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object QSelectOpenDebtorItemsSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object QSelectOpenDebtorItemsSFAX: TStringField
      FieldName = 'SFAX'
    end
    object QSelectOpenDebtorItemsSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object QSelectOpenDebtorItemsSBANKNAME: TStringField
      FieldName = 'SBANKNAME'
    end
    object QSelectOpenDebtorItemsSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object QSelectOpenDebtorItemsSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
      Size = 45
    end
    object QSelectOpenDebtorItemsSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object QSelectOpenDebtorItemsSCREDITCARDNUMBER: TStringField
      FieldName = 'SCREDITCARDNUMBER'
      Size = 35
    end
    object QSelectOpenDebtorItemsDEXPIRYDATE: TDateTimeField
      FieldName = 'DEXPIRYDATE'
    end
    object QSelectOpenDebtorItemsSCREDITCARDTYPE: TStringField
      FieldName = 'SCREDITCARDTYPE'
    end
    object QSelectOpenDebtorItemsSCREDITCARDHOLDER: TStringField
      FieldName = 'SCREDITCARDHOLDER'
    end
    object QSelectOpenDebtorItemsFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object QSelectOpenDebtorItemsFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object QSelectOpenDebtorItemsFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object QSelectOpenDebtorItemsFINTEREST: TFloatField
      FieldName = 'FINTEREST'
    end
    object QSelectOpenDebtorItemsWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object QSelectOpenDebtorItemsWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object QSelectOpenDebtorItemsBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object QSelectOpenDebtorItemsBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object QSelectOpenDebtorItemsBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object QSelectOpenDebtorItemsSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object QSelectOpenDebtorItemsWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object QSelectOpenDebtorItemsDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object QSelectOpenDebtorItemsWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object QSelectOpenDebtorItemsWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object QSelectOpenDebtorItemsSREFERENCE_1: TStringField
      FieldName = 'SREFERENCE_1'
    end
    object QSelectOpenDebtorItemsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object QSelectOpenDebtorItemsWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object QSelectOpenDebtorItemsWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object QSelectOpenDebtorItemsWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object QSelectOpenDebtorItemsDDATE: TDateTimeField
      FieldName = 'DDATE'
    end
    object QSelectOpenDebtorItemsTOTALAMOUNT: TFloatField
      FieldName = 'TOTALAMOUNT'
      ReadOnly = True
    end
    object QSelectOpenDebtorItemsOUTSTANDING: TFloatField
      FieldName = 'OUTSTANDING'
      ReadOnly = True
    end
    object QSelectOpenDebtorItemsCOUNTOUTSTANDING: TIntegerField
      FieldName = 'COUNTOUTSTANDING'
      ReadOnly = True
      Required = True
    end
    object QSelectOpenDebtorItemsDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object QSelectOpenDebtorItemsSLINEDESC: TStringField
      FieldName = 'SLINEDESC'
      ReadOnly = True
      Size = 319
    end
    object QSelectOpenDebtorItemsWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
    object QSelectOpenDebtorItemsSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      ReadOnly = True
      FixedChar = True
      Size = 35
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 124
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = CDOpenstaandePosten
    Left = 488
    Top = 136
  end
  object tblSysVars: TUniTable
    TableName = 'SYSVARS'
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    ReadOnly = True
    Left = 610
    Top = 133
    object tblSysVarsSCOMPANYNAME: TStringField
      FieldName = 'SCOMPANYNAME'
      Size = 35
    end
    object tblSysVarsSCOMPANYREGNO: TStringField
      FieldName = 'SCOMPANYREGNO'
      Size = 30
    end
    object tblSysVarsWEMAILSERVERADDRESS: TStringField
      FieldName = 'WEMAILSERVERADDRESS'
      Size = 30
    end
    object tblSysVarsWFAXSERVERID: TIntegerField
      FieldName = 'WFAXSERVERID'
    end
    object tblSysVarsBLOBLOGO: TBlobField
      FieldName = 'BLOBLOGO'
    end
    object tblSysVarsSADDRESS1: TStringField
      FieldName = 'SADDRESS1'
      Size = 30
    end
    object tblSysVarsSADDRESS2: TStringField
      FieldName = 'SADDRESS2'
      Size = 30
    end
    object tblSysVarsSADDRESS3: TStringField
      FieldName = 'SADDRESS3'
      Size = 30
    end
    object tblSysVarsSPOSTCODE: TStringField
      FieldName = 'SPOSTCODE'
      Size = 8
    end
    object tblSysVarsSPHONENUMBER: TStringField
      FieldName = 'SPHONENUMBER'
      Size = 30
    end
    object tblSysVarsSFAXNUMBER: TStringField
      FieldName = 'SFAXNUMBER'
      Size = 30
    end
    object tblSysVarsWRETAINEDINCOMEID: TIntegerField
      FieldName = 'WRETAINEDINCOMEID'
    end
    object tblSysVarsWDEBTORSCONTROLID: TIntegerField
      FieldName = 'WDEBTORSCONTROLID'
    end
    object tblSysVarsWCREDITORSCONTROLID: TIntegerField
      FieldName = 'WCREDITORSCONTROLID'
    end
    object tblSysVarsSBACKUPPATH: TStringField
      FieldName = 'SBACKUPPATH'
      Size = 255
    end
    object tblSysVarsWCOSTOFSALESTYPEID: TIntegerField
      FieldName = 'WCOSTOFSALESTYPEID'
    end
    object tblSysVarsWCREDITNOTEBATCHTYPEID: TIntegerField
      FieldName = 'WCREDITNOTEBATCHTYPEID'
    end
    object tblSysVarsSCREDITNOTEMESSAGE1: TStringField
      FieldName = 'SCREDITNOTEMESSAGE1'
      Size = 30
    end
    object tblSysVarsSCREDITNOTEMESSAGE2: TStringField
      FieldName = 'SCREDITNOTEMESSAGE2'
      Size = 30
    end
    object tblSysVarsSCREDITNOTEMESSAGE3: TStringField
      FieldName = 'SCREDITNOTEMESSAGE3'
      Size = 30
    end
    object tblSysVarsWPURCHASESBATCHID: TIntegerField
      FieldName = 'WPURCHASESBATCHID'
    end
    object tblSysVarsSPURCHASESMESSAGE1: TStringField
      FieldName = 'SPURCHASESMESSAGE1'
      Size = 30
    end
    object tblSysVarsSPURCHASESMESSAGE2: TStringField
      FieldName = 'SPURCHASESMESSAGE2'
      Size = 30
    end
    object tblSysVarsSPURCHASESMESSAGE3: TStringField
      FieldName = 'SPURCHASESMESSAGE3'
      Size = 30
    end
    object tblSysVarsWGOODSRETURNEDBATCHID: TIntegerField
      FieldName = 'WGOODSRETURNEDBATCHID'
    end
    object tblSysVarsSGOODSRETURNEDMESSAGE1: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE1'
      Size = 30
    end
    object tblSysVarsSGOODSRETURNEDMESSAGE2: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE2'
      Size = 30
    end
    object tblSysVarsSGOODSRETURNEDMESSAGE3: TStringField
      FieldName = 'SGOODSRETURNEDMESSAGE3'
      Size = 30
    end
    object tblSysVarsWINVOICESBATCHID: TIntegerField
      FieldName = 'WINVOICESBATCHID'
    end
    object tblSysVarsSINVOICESMESSAGE1: TStringField
      FieldName = 'SINVOICESMESSAGE1'
      Size = 30
    end
    object tblSysVarsSINVOICESMESSAGE2: TStringField
      FieldName = 'SINVOICESMESSAGE2'
      Size = 30
    end
    object tblSysVarsSINVOICESMESSAGE3: TStringField
      FieldName = 'SINVOICESMESSAGE3'
      Size = 30
    end
    object tblSysVarsWDISPLAYAMOUNT: TIntegerField
      FieldName = 'WDISPLAYAMOUNT'
    end
    object tblSysVarsBACCOUNTSOPEN: TSmallintField
      FieldName = 'BACCOUNTSOPEN'
    end
    object tblSysVarsBBATCHTYPES: TSmallintField
      FieldName = 'BBATCHTYPES'
    end
    object tblSysVarsBGROUPS: TSmallintField
      FieldName = 'BGROUPS'
    end
    object tblSysVarsBNOTCLOSED: TSmallintField
      FieldName = 'BNOTCLOSED'
    end
    object tblSysVarsBPERIODCHANGE: TSmallintField
      FieldName = 'BPERIODCHANGE'
    end
    object tblSysVarsBSALESMANEXIST: TSmallintField
      FieldName = 'BSALESMANEXIST'
    end
    object tblSysVarsBUNITSEXIST: TSmallintField
      FieldName = 'BUNITSEXIST'
    end
    object tblSysVarsFLASTYEARPL: TFloatField
      FieldName = 'FLASTYEARPL'
    end
    object tblSysVarsWNOOFPERIODS: TIntegerField
      FieldName = 'WNOOFPERIODS'
    end
    object tblSysVarsWINVOICEPAPERID: TIntegerField
      FieldName = 'WINVOICEPAPERID'
    end
    object tblSysVarsWCREDITNOTEPAPERID: TIntegerField
      FieldName = 'WCREDITNOTEPAPERID'
    end
    object tblSysVarsWPURCHASEPAPERID: TIntegerField
      FieldName = 'WPURCHASEPAPERID'
    end
    object tblSysVarsWGOODSRETURNEDPAPERID: TIntegerField
      FieldName = 'WGOODSRETURNEDPAPERID'
    end
    object tblSysVarsWQUOTEPAPERID: TIntegerField
      FieldName = 'WQUOTEPAPERID'
    end
    object tblSysVarsWORDERPAPERID: TIntegerField
      FieldName = 'WORDERPAPERID'
    end
    object tblSysVarsWSTATEMENTPAPERID: TIntegerField
      FieldName = 'WSTATEMENTPAPERID'
    end
    object tblSysVarsWREMITTANCEPAPERID: TIntegerField
      FieldName = 'WREMITTANCEPAPERID'
    end
    object tblSysVarsFRECONCILEDBANKBALANCE: TFloatField
      FieldName = 'FRECONCILEDBANKBALANCE'
    end
    object tblSysVarsWRECONCILEDBANKID: TIntegerField
      FieldName = 'WRECONCILEDBANKID'
    end
    object tblSysVarsDRECONCILEDLASTDATE: TDateTimeField
      FieldName = 'DRECONCILEDLASTDATE'
    end
    object tblSysVarsSSTATEMENTMESSAGE1: TStringField
      FieldName = 'SSTATEMENTMESSAGE1'
      Size = 30
    end
    object tblSysVarsSSTATEMENTMESSAGE2: TStringField
      FieldName = 'SSTATEMENTMESSAGE2'
      Size = 30
    end
    object tblSysVarsSSTATEMENTMESSAGE3: TStringField
      FieldName = 'SSTATEMENTMESSAGE3'
      Size = 30
    end
    object tblSysVarsBCREATEBALANCELINK: TSmallintField
      FieldName = 'BCREATEBALANCELINK'
    end
    object tblSysVarsWTAXDUEACCOUNTID: TIntegerField
      FieldName = 'WTAXDUEACCOUNTID'
    end
    object tblSysVarsBTAXINVOICEBASED: TSmallintField
      FieldName = 'BTAXINVOICEBASED'
    end
    object tblSysVarsBCREATECOSTOFSALES: TSmallintField
      FieldName = 'BCREATECOSTOFSALES'
    end
    object tblSysVarsWCURRENTUSERID: TIntegerField
      FieldName = 'WCURRENTUSERID'
    end
    object tblSysVarsSINVOICEHEADING: TStringField
      FieldName = 'SINVOICEHEADING'
    end
    object tblSysVarsSCREDITNOTEHEADING: TStringField
      FieldName = 'SCREDITNOTEHEADING'
    end
    object tblSysVarsSPURCHASEHEADING: TStringField
      FieldName = 'SPURCHASEHEADING'
    end
    object tblSysVarsSGOODSRETURNEDHEADING: TStringField
      FieldName = 'SGOODSRETURNEDHEADING'
    end
    object tblSysVarsSQUOTEHEADING: TStringField
      FieldName = 'SQUOTEHEADING'
    end
    object tblSysVarsSQUOTEMESSAGE1: TStringField
      FieldName = 'SQUOTEMESSAGE1'
      Size = 30
    end
    object tblSysVarsSQUOTEMESSAGE2: TStringField
      FieldName = 'SQUOTEMESSAGE2'
      Size = 30
    end
    object tblSysVarsSQUOTEMESSAGE3: TStringField
      FieldName = 'SQUOTEMESSAGE3'
      Size = 30
    end
    object tblSysVarsSORDERHEADING: TStringField
      FieldName = 'SORDERHEADING'
    end
    object tblSysVarsSORDERMESSAGE1: TStringField
      FieldName = 'SORDERMESSAGE1'
      Size = 30
    end
    object tblSysVarsSORDERMESSAGE2: TStringField
      FieldName = 'SORDERMESSAGE2'
      Size = 30
    end
    object tblSysVarsSORDERMESSAGE3: TStringField
      FieldName = 'SORDERMESSAGE3'
      Size = 30
    end
    object tblSysVarsBPOSTTOLASTYEAR: TSmallintField
      FieldName = 'BPOSTTOLASTYEAR'
    end
    object tblSysVarsWBASECURRENCYID: TIntegerField
      FieldName = 'WBASECURRENCYID'
    end
    object tblSysVarsBMULTICURRENCY: TSmallintField
      FieldName = 'BMULTICURRENCY'
    end
    object tblSysVarsSTAXREGNO: TStringField
      FieldName = 'STAXREGNO'
      Size = 30
    end
    object tblSysVarsBPAYMENTSBASED: TSmallintField
      FieldName = 'BPAYMENTSBASED'
    end
    object tblSysVarsWDUEACCOUNTID: TIntegerField
      FieldName = 'WDUEACCOUNTID'
    end
    object tblSysVarsWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
    end
    object tblSysVarsBONLINE: TSmallintField
      FieldName = 'BONLINE'
    end
    object tblSysVarsBREMOTE: TSmallintField
      FieldName = 'BREMOTE'
    end
    object tblSysVarsWCOLOURID: TIntegerField
      FieldName = 'WCOLOURID'
    end
    object tblSysVarsSACCOUNTREPORTNAME1: TStringField
      FieldName = 'SACCOUNTREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSACCOUNTREPORTNAME2: TStringField
      FieldName = 'SACCOUNTREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSDEBTORREPORTNAME1: TStringField
      FieldName = 'SDEBTORREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSDEBTORREPORTNAME2: TStringField
      FieldName = 'SDEBTORREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSCREDITORREPORTNAME1: TStringField
      FieldName = 'SCREDITORREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSCREDITORREPORTNAME2: TStringField
      FieldName = 'SCREDITORREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSSTOCKREPORTNAME1: TStringField
      FieldName = 'SSTOCKREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSSTOCKREPORTNAME2: TStringField
      FieldName = 'SSTOCKREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSDOCUMENTREPORTNAME1: TStringField
      FieldName = 'SDOCUMENTREPORTNAME1'
      Size = 15
    end
    object tblSysVarsSDOCUMENTREPORTNAME2: TStringField
      FieldName = 'SDOCUMENTREPORTNAME2'
      Size = 15
    end
    object tblSysVarsSSELLINGPRICENAME1: TStringField
      FieldName = 'SSELLINGPRICENAME1'
      Size = 15
    end
    object tblSysVarsSSELLINGPRICENAME2: TStringField
      FieldName = 'SSELLINGPRICENAME2'
      Size = 15
    end
    object tblSysVarsSSELLINGPRICENAME3: TStringField
      FieldName = 'SSELLINGPRICENAME3'
      Size = 15
    end
    object tblSysVarsWVERSION: TIntegerField
      FieldName = 'WVERSION'
    end
    object tblSysVarsSREPORTFONTSNAME: TStringField
      FieldName = 'SREPORTFONTSNAME'
      Size = 35
    end
    object tblSysVarsBUSEAVGCOST: TSmallintField
      FieldName = 'BUSEAVGCOST'
    end
    object tblSysVarsBPRNSTATEMENTLOGO: TSmallintField
      FieldName = 'BPRNSTATEMENTLOGO'
    end
    object tblSysVarsDTLASTUSETIME: TDateTimeField
      FieldName = 'DTLASTUSETIME'
    end
    object tblSysVarsBSHOWTIPS: TSmallintField
      FieldName = 'BSHOWTIPS'
    end
    object tblSysVarsWAUTOSAVETIME: TIntegerField
      FieldName = 'WAUTOSAVETIME'
    end
    object tblSysVarsBSHOWREMINDER: TSmallintField
      FieldName = 'BSHOWREMINDER'
    end
    object tblSysVarsBSERVICEPREPRINTED: TSmallintField
      FieldName = 'BSERVICEPREPRINTED'
    end
    object tblSysVarsWDEFAULTOUTPUTID: TIntegerField
      FieldName = 'WDEFAULTOUTPUTID'
    end
    object tblSysVarsWDEFAULTZOOM: TIntegerField
      FieldName = 'WDEFAULTZOOM'
    end
    object tblSysVarsBUSEOUTLOOKEXP: TSmallintField
      FieldName = 'BUSEOUTLOOKEXP'
    end
    object tblSysVarsSEMAILADDRESS: TStringField
      FieldName = 'SEMAILADDRESS'
      Size = 60
    end
  end
  object QGoups: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from groups where WGroupID = :GroupId')
    Left = 364
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GroupId'
      end>
    object QGoupsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
    end
    object QGoupsWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object QGoupsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object QGoupsWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object QGoupsWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object QGoupsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object QGoupsWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 556
    Top = 364
    object Uncheckall1: TMenuItem
      Caption = 'Alle uitvinken'
      OnClick = Uncheckall1Click
    end
    object Uncheckselected1: TMenuItem
      Caption = 'Uitvinken geselecteerde records'
      OnClick = Uncheckselected1Click
    end
    object Checkselected1: TMenuItem
      Caption = 'Aanvinken geselecteerde records'
      OnClick = Checkselected1Click
    end
    object ickall1: TMenuItem
      Caption = 'Tick all'
      OnClick = ickall1Click
    end
  end
  object QSelectQuotes: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'SELECT '
      'Account.SACCOUNTCODE Code,'
      'Account.SDescription,'
      'Account.WReportingGroup1ID,'
      'Account.WReportingGroup2ID,'
      'Account.WAccountID, '
      'Account.WAccountTypeID, '
      'SDocNo as SReference,'
      'dochead.SReference as SLineDesc,'
      'WContactID, '
      'SPassword, '
      'SPostal1, '
      'SPostal2, '
      'SPostal3, '
      'SPostalCode, '
      'SDelivery1, '
      'SDelivery2, '
      'SDelivery3, '
      'SDeliveryCode, '
      'STelephone1, '
      'STelephone2, '
      'SFax, '
      'SEmail, '
      'SBankName, '
      'SBranchCode, '
      'SBankAccountNumber, '
      'SBankAccountName, '
      'SCreditCardNumber, '
      'DExpiryDate,'
      'SCreditCardType, '
      'SCreditCardHolder, '
      'FCREDITLimit, '
      'FChargeAmount, '
      'FDiscount, '
      'FInterest, '
      'WBankID, '
      'Debtor.WSalesmanID, '
      'Account.BOpenItem, '
      'BPostBBF, '
      'BDisabled, '
      'SMessage, '
      'WDefaultPriceTypeID, '
      'DLastActivity, '
      'Debtor.WCurrencyID, '
      'WForexAccountID, '
      'SDocNo, '
      'Debtor.DSysDate, '
      'WDueDays, '
      'dduedate,'
      'WDefaultAccount ,'
      'FDocAmount as Outstanding,'
      'FDocAmount as TotalAmount,'
      '0 as CountOutstanding,'
      'dochead.WTypeID'
      'from Debtor,dochead,Account'
      'where Debtor.wAccountId = dochead.WAccountId'
      'and (dochead.WTypeID = 14 or dochead.WTypeID = 10)'
      'and BPosted <> 1'
      'and Debtor.wAccountId = Account.WAccountId'
      'and (DDate >=:Date2  and DDate <= :Date1)'
      'and SBankAccountNumber <> '#39#39)
    BeforeOpen = QSelectQuotesBeforeOpen
    Left = 360
    Top = 368
    ParamData = <
      item
        DataType = ftDate
        Name = 'Date2'
      end
      item
        DataType = ftDate
        Name = 'Date1'
      end>
    object QSelectQuotesCODE: TStringField
      FieldName = 'CODE'
      Size = 6
    end
    object QSelectQuotesSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object QSelectQuotesWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object QSelectQuotesWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object QSelectQuotesWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QSelectQuotesSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QSelectQuotesWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object QSelectQuotesSPASSWORD: TStringField
      FieldName = 'SPASSWORD'
      Size = 8
    end
    object QSelectQuotesSPOSTAL1: TStringField
      FieldName = 'SPOSTAL1'
      Size = 30
    end
    object QSelectQuotesSPOSTAL2: TStringField
      FieldName = 'SPOSTAL2'
      Size = 30
    end
    object QSelectQuotesSPOSTAL3: TStringField
      FieldName = 'SPOSTAL3'
      Size = 30
    end
    object QSelectQuotesSPOSTALCODE: TStringField
      FieldName = 'SPOSTALCODE'
      Size = 8
    end
    object QSelectQuotesSDELIVERY1: TStringField
      FieldName = 'SDELIVERY1'
      Size = 30
    end
    object QSelectQuotesSDELIVERY2: TStringField
      FieldName = 'SDELIVERY2'
      Size = 30
    end
    object QSelectQuotesSDELIVERY3: TStringField
      FieldName = 'SDELIVERY3'
      Size = 30
    end
    object QSelectQuotesSDELIVERYCODE: TStringField
      FieldName = 'SDELIVERYCODE'
      Size = 8
    end
    object QSelectQuotesSTELEPHONE1: TStringField
      FieldName = 'STELEPHONE1'
    end
    object QSelectQuotesSTELEPHONE2: TStringField
      FieldName = 'STELEPHONE2'
    end
    object QSelectQuotesSFAX: TStringField
      FieldName = 'SFAX'
    end
    object QSelectQuotesSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object QSelectQuotesSBANKNAME: TStringField
      FieldName = 'SBANKNAME'
    end
    object QSelectQuotesSBRANCHCODE: TStringField
      FieldName = 'SBRANCHCODE'
      Size = 10
    end
    object QSelectQuotesSBANKACCOUNTNUMBER: TStringField
      FieldName = 'SBANKACCOUNTNUMBER'
    end
    object QSelectQuotesSBANKACCOUNTNAME: TStringField
      FieldName = 'SBANKACCOUNTNAME'
      Size = 30
    end
    object QSelectQuotesSCREDITCARDNUMBER: TStringField
      FieldName = 'SCREDITCARDNUMBER'
    end
    object QSelectQuotesDEXPIRYDATE: TDateTimeField
      FieldName = 'DEXPIRYDATE'
    end
    object QSelectQuotesSCREDITCARDTYPE: TStringField
      FieldName = 'SCREDITCARDTYPE'
    end
    object QSelectQuotesSCREDITCARDHOLDER: TStringField
      FieldName = 'SCREDITCARDHOLDER'
    end
    object QSelectQuotesFCREDITLIMIT: TFloatField
      FieldName = 'FCREDITLIMIT'
    end
    object QSelectQuotesFCHARGEAMOUNT: TFloatField
      FieldName = 'FCHARGEAMOUNT'
    end
    object QSelectQuotesFDISCOUNT: TFloatField
      FieldName = 'FDISCOUNT'
    end
    object QSelectQuotesFINTEREST: TFloatField
      FieldName = 'FINTEREST'
    end
    object QSelectQuotesWBANKID: TIntegerField
      FieldName = 'WBANKID'
    end
    object QSelectQuotesWSALESMANID: TIntegerField
      FieldName = 'WSALESMANID'
    end
    object QSelectQuotesBOPENITEM: TSmallintField
      FieldName = 'BOPENITEM'
    end
    object QSelectQuotesBPOSTBBF: TSmallintField
      FieldName = 'BPOSTBBF'
    end
    object QSelectQuotesBDISABLED: TSmallintField
      FieldName = 'BDISABLED'
    end
    object QSelectQuotesSMESSAGE: TStringField
      FieldName = 'SMESSAGE'
      Size = 50
    end
    object QSelectQuotesWDEFAULTPRICETYPEID: TIntegerField
      FieldName = 'WDEFAULTPRICETYPEID'
    end
    object QSelectQuotesDLASTACTIVITY: TDateTimeField
      FieldName = 'DLASTACTIVITY'
    end
    object QSelectQuotesWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
    end
    object QSelectQuotesWFOREXACCOUNTID: TIntegerField
      FieldName = 'WFOREXACCOUNTID'
    end
    object QSelectQuotesSDOCNO: TStringField
      FieldName = 'SDOCNO'
      Size = 15
    end
    object QSelectQuotesDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object QSelectQuotesWDUEDAYS: TIntegerField
      FieldName = 'WDUEDAYS'
    end
    object QSelectQuotesWDEFAULTACCOUNT: TIntegerField
      FieldName = 'WDEFAULTACCOUNT'
    end
    object QSelectQuotesOUTSTANDING: TFloatField
      FieldName = 'OUTSTANDING'
    end
    object QSelectQuotesTOTALAMOUNT: TFloatField
      FieldName = 'TOTALAMOUNT'
    end
    object QSelectQuotesCOUNTOUTSTANDING: TIntegerField
      FieldName = 'COUNTOUTSTANDING'
      ReadOnly = True
      Required = True
    end
    object QSelectQuotesWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
      Required = True
    end
    object QSelectQuotesDDUEDATE: TDateTimeField
      FieldName = 'DDUEDATE'
    end
    object QSelectQuotesSLINEDESC: TStringField
      FieldName = 'SLINEDESC'
      Size = 255
    end
    object QSelectQuotesWACCOUNTTYPEID: TIntegerField
      FieldName = 'WACCOUNTTYPEID'
      Required = True
    end
  end
end
