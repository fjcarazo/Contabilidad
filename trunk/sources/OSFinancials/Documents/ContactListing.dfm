object fmContactListing: TfmContactListing
  Left = 519
  Top = 49
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Contact Listing'
  ClientHeight = 498
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 115
    Top = 0
    Width = 920
    Height = 418
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 3
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 918
      Height = 49
      Align = alTop
      TabOrder = 0
      OnClick = Panel6Click
      object Filter: TLabel
        Left = 9
        Top = 4
        Width = 22
        Height = 13
        Caption = 'Field'
      end
      object Value: TLabel
        Left = 258
        Top = 4
        Width = 27
        Height = 13
        Caption = 'Value'
      end
      object CBFindColumn: TComboBox
        Left = 9
        Top = 20
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 0
      end
      object CBOperatot: TComboBox
        Left = 180
        Top = 20
        Width = 57
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 1
        Text = 'Like'
        Items.Strings = (
          'Like'
          '='
          '<'
          '>'
          '<='
          '>='
          '<>')
      end
      object EFilterValue: TEdit
        Left = 258
        Top = 20
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnKeyPress = EFilterValueKeyPress
      end
      object BFilter: TButton
        Left = 390
        Top = 19
        Width = 61
        Height = 21
        Caption = 'Filter'
        TabOrder = 3
        OnClick = BFilterClick
      end
      object BClearFilter: TButton
        Left = 452
        Top = 19
        Width = 61
        Height = 21
        Caption = 'Clear'
        TabOrder = 4
        OnClick = BClearFilterClick
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 50
      Width = 918
      Height = 367
      Align = alClient
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = DBGSearchDblClick
        OnKeyPress = DBGSearchKeyPress
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0'
            Kind = skCount
            FieldName = 'LASTNAME'
            Column = cxGrid1DBTableView1LASTNAME
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skCount
            FieldName = 'LASTNAME'
            Column = cxGrid1DBTableView1LASTNAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Footer = True
        OptionsView.Indicator = True
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        object cxGrid1DBTableView1LASTNAME: TcxGridDBColumn
          DataBinding.FieldName = 'LASTNAME'
          SortIndex = 0
          SortOrder = soDescending
          Width = 119
        end
        object cxGrid1DBTableView1PHONE3: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE3'
          Width = 115
        end
        object cxGrid1DBTableView1PHONE1: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE1'
          Width = 99
        end
        object cxGrid1DBTableView1PHONE2: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE2'
          Width = 77
        end
        object cxGrid1DBTableView1EMAIL: TcxGridDBColumn
          DataBinding.FieldName = 'EMAIL'
          Width = 155
        end
        object cxGrid1DBTableView1ADDRESS: TcxGridDBColumn
          DataBinding.FieldName = 'ADDRESS'
          Width = 298
        end
        object cxGrid1DBTableView1CITY: TcxGridDBColumn
          DataBinding.FieldName = 'CITY'
          Width = 122
        end
        object cxGrid1DBTableView1STATE: TcxGridDBColumn
          DataBinding.FieldName = 'STATE'
        end
        object cxGrid1DBTableView1ZIP: TcxGridDBColumn
          DataBinding.FieldName = 'ZIP'
        end
        object cxGrid1DBTableView1COUNTRY: TcxGridDBColumn
          DataBinding.FieldName = 'COUNTRY'
        end
        object cxGrid1DBTableView1COMPANY: TcxGridDBColumn
          DataBinding.FieldName = 'COMPANY'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 418
    Width = 1035
    Height = 42
    Align = alBottom
    TabOrder = 0
    object DestLbl: TLabel
      Left = 48
      Top = 13
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Send report To:'
      FocusControl = cbDestination
    end
    object lblCopies: TLabel
      Left = 242
      Top = 13
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Copies :'
      Enabled = False
      FocusControl = edtCount
    end
    object BtnOk: TBitBtn
      Left = 352
      Top = 9
      Width = 97
      Height = 25
      Caption = '&Print'
      DoubleBuffered = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888000000000008888800000000000888808888888880
        80888088888888808088000000000000080800000000000008080888888AAA88
        00080888888AAA88000808888882228808080888888222880808000000000000
        0880000000000000088008888888888080800888888888808080800000000008
        08008000000000080800880FFFFFFFF08080880FFFFFFFF080808880FCCCCCF0
        00088880FCCCCCF000088880FFFFFFFF08888880FFFFFFFF088888880FCCCCCF
        088888880FCCCCCF088888880FFFFFFFF08888880FFFFFFFF088888880000000
        0088888880000000008888888888888888888888888888888888}
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancel: TBitBtn
      Left = 456
      Top = 9
      Width = 89
      Height = 25
      Cancel = True
      Caption = '&Close'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnCancelClick
    end
    object cbDestination: TComboBox
      Left = 126
      Top = 11
      Width = 91
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbDestinationChange
      OnKeyPress = lvContactKeyPress
    end
    object edtCount: TEdit
      Left = 288
      Top = 11
      Width = 37
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '1'
      OnChange = edtCountChange
      OnKeyPress = lvContactKeyPress
    end
    object UpDown1: TUpDown
      Left = 325
      Top = 10
      Width = 16
      Height = 24
      Enabled = False
      Min = 1
      Max = 32767
      Position = 1
      TabOrder = 4
      OnClick = UpDown1Click
    end
  end
  object POkbutton: TPanel
    Left = 0
    Top = 460
    Width = 1035
    Height = 38
    Align = alBottom
    TabOrder = 1
    Visible = False
    DesignSize = (
      1035
      38)
    object BitBtn1: TBitBtn
      Left = 836
      Top = 9
      Width = 97
      Height = 25
      Anchors = [akTop, akRight]
      DoubleBuffered = True
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BtnCancelClick
    end
    object BitBtn2: TBitBtn
      Left = 940
      Top = 9
      Width = 89
      Height = 25
      Anchors = [akTop, akRight]
      DoubleBuffered = True
      Kind = bkOK
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 115
    Height = 418
    Align = alLeft
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Color = clBtnShadow
    TabOrder = 2
    object BAdd: TButton
      Left = 6
      Top = 14
      Width = 100
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = BAddClick
    end
    object BDelete: TButton
      Left = 6
      Top = 78
      Width = 100
      Height = 25
      Caption = 'Delete'
      TabOrder = 1
      OnClick = BDeleteClick
    end
    object BEdit: TButton
      Left = 6
      Top = 46
      Width = 100
      Height = 25
      Caption = 'Edit'
      TabOrder = 2
      OnClick = BEditClick
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = dmDatabase.QContacts
    Left = 232
    Top = 104
  end
  object VpFlexDataStore1: TVpFlexDataStore
    AutoConnect = False
    AutoCreate = False
    CategoryColorMap.Category0.Color = clNavy
    CategoryColorMap.Category0.Description = 'Category 0'
    CategoryColorMap.Category1.Color = clRed
    CategoryColorMap.Category1.Description = 'Category 1'
    CategoryColorMap.Category2.Color = clYellow
    CategoryColorMap.Category2.Description = 'Category 2'
    CategoryColorMap.Category3.Color = clLime
    CategoryColorMap.Category3.Description = 'Category 3'
    CategoryColorMap.Category4.Color = clPurple
    CategoryColorMap.Category4.Description = 'Category 4'
    CategoryColorMap.Category5.Color = clTeal
    CategoryColorMap.Category5.Description = 'Category 5'
    CategoryColorMap.Category6.Color = clFuchsia
    CategoryColorMap.Category6.Description = 'Category 6'
    CategoryColorMap.Category7.Color = clOlive
    CategoryColorMap.Category7.Description = 'Category 7'
    CategoryColorMap.Category8.Color = clAqua
    CategoryColorMap.Category8.Description = 'Category 8'
    CategoryColorMap.Category9.Color = clMaroon
    CategoryColorMap.Category9.Description = 'Category 9'
    EnableEventTimer = True
    PlayEventSounds = True
    DayBuffer = 31
    DataSources.ResourceDataSource = DataSource3
    DataSources.ContactsDataSource = DataSource2
    ResourceID = 0
    OnSetFilterCriteria = VpFlexDataStore1SetFilterCriteria
    Left = 40
    Top = 104
    ResourceFieldMappings = (
      'ResourceID'
      'ResourceID'
      'Description'
      'Description'
      'Notes'
      'Notes'
      'ImageIndex'
      'ImageIndex'
      'UserField0'
      'UserField0'
      'UserField1'
      'UserField1'
      'UserField2'
      'UserField2'
      'UserField3'
      'UserField3'
      'UserField4'
      'UserField4'
      'UserField5'
      'UserField5'
      'UserField6'
      'UserField6'
      'UserField7'
      'UserField7'
      'UserField8'
      'UserField8'
      'UserField9'
      'UserField9'
      'ResourceActive'
      'Active')
    ContactFieldMappings = (
      'RecordID'
      'RecordID'
      'ResourceID'
      'ResourceID'
      'FirstName'
      'FirstName'
      'LastName'
      'LastName'
      'Birthdate'
      'Birthdate'
      'Anniversary'
      'Anniversary'
      'Title'
      'Title'
      'Company'
      'Company'
      'Address'
      'Address'
      'City'
      'City'
      'State'
      'State'
      'Zip'
      'Zip'
      'Country'
      'Country'
      'Note'
      'Note'
      'Phone1'
      'Phone1'
      'Phone2'
      'Phone2'
      'Phone3'
      'Phone3'
      'Phone4'
      'Phone4'
      'Phone5'
      'Phone5'
      'PhoneType1'
      'PhoneType1'
      'PhoneType2'
      'PhoneType2'
      'PhoneType3'
      'PhoneType3'
      'PhoneType4'
      'PhoneType4'
      'PhoneType5'
      'PhoneType5'
      'Category'
      'Category'
      'EMail'
      'EMail'
      'Custom1'
      'Custom1'
      'Custom2'
      'Custom2'
      'Custom3'
      'Custom3'
      'Custom4'
      'Custom4'
      'UserField0'
      'UserField0'
      'UserField1'
      'UserField1'
      'UserField2'
      'UserField2'
      'UserField3'
      'UserField3'
      'UserField4'
      'UserField4'
      'UserField5'
      'UserField5'
      'UserField6'
      'UserField6'
      'UserField7'
      'UserField7'
      'UserField8'
      'UserField8'
      'UserField9'
      'UserField9'
      'Job_Position'
      'Position')
  end
  object VpControlLink1: TVpControlLink
    DataStore = VpFlexDataStore1
    Printer.DayStart = h_08
    Printer.DayEnd = h_05
    Printer.Granularity = gr30Min
    Printer.MarginUnits = imAbsolutePixel
    Printer.PrintFormats = <>
    Left = 384
    Top = 144
  end
  object DataSource2: TDataSource
    DataSet = dmDatabase.QContacts
    Left = 152
    Top = 104
  end
  object DataSource3: TDataSource
    DataSet = dmDatabase.QResources
    Left = 160
    Top = 184
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 15
    OnTimer = Timer1Timer
    Left = 336
    Top = 88
  end
end
