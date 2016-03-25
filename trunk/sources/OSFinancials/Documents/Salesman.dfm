object fmSalesman: TfmSalesman
  Left = 513
  Top = 228
  Caption = 'Salesman'
  ClientHeight = 333
  ClientWidth = 399
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 299
    Width = 399
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      399
      34)
    object BtnClose: TBitBtn
      Left = 296
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
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
      TabOrder = 0
      OnClick = btnCloseClick
      OnKeyDown = FormKeyDown
    end
  end
  object cxGrid1: TcxGrid
    Left = 137
    Top = 0
    Width = 262
    Height = 299
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dmDatabase.dsGroups
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
      object cxGrid1DBTableView1WGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'WGROUPID'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1WGROUPTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'WGROUPTYPEID'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn
        DataBinding.FieldName = 'SDESCRIPTION'
      end
      object cxGrid1DBTableView1WPARENTGROUP2ID: TcxGridDBColumn
        DataBinding.FieldName = 'WPARENTGROUP2ID'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1WPARENTGROUP1ID: TcxGridDBColumn
        DataBinding.FieldName = 'WPARENTGROUP1ID'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn
        DataBinding.FieldName = 'DSYSDATE'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1WSORTNO: TcxGridDBColumn
        DataBinding.FieldName = 'WSORTNO'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1BDISABLE: TcxGridDBColumn
        DataBinding.FieldName = 'BDISABLE'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1WCOLOR: TcxGridDBColumn
        DataBinding.FieldName = 'WCOLOR'
        Visible = False
        VisibleForCustomization = False
      end
      object cxGrid1DBTableView1WTEXTCOLOR: TcxGridDBColumn
        DataBinding.FieldName = 'WTEXTCOLOR'
        Visible = False
        VisibleForCustomization = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 299
    Align = alLeft
    TabOrder = 2
    object sbDelete: TSpeedButton
      Left = 5
      Top = 40
      Width = 120
      Height = 25
      Caption = 'Delete'
      OnClick = sbDeleteClick
    end
    object sbAdd: TSpeedButton
      Left = 4
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Add'
      OnClick = sbAddClick
    end
  end
end
