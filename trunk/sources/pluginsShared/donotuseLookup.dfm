object FmLookup: TFmLookup
  Left = 97
  Top = 209
  ActiveControl = DBGrdLookup
  BorderIcons = [biSystemMenu]
  Caption = 'FmLookup'
  ClientHeight = 247
  ClientWidth = 495
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = DBGrdLookupKeyPress
  DesignSize = (
    495
    247)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 183
    Width = 498
    Height = 45
    Anchors = [akLeft, akRight, akBottom]
    Brush.Color = clBtnFace
    Shape = stRoundRect
    ExplicitWidth = 417
  end
  object Label1: TLabel
    Left = 8
    Top = 187
    Width = 51
    Height = 13
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Search by:'
    Transparent = True
  end
  object Bevel1: TBevel
    Left = 4
    Top = 201
    Width = 481
    Height = 3
    Anchors = [akLeft, akRight, akBottom]
    ExplicitWidth = 400
  end
  object LSearch: TLabel
    Left = 64
    Top = 187
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
    Transparent = True
  end
  object DBGrdLookup: TDBGrid
    Left = 4
    Top = 6
    Width = 486
    Height = 173
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSGeneral
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrdLookupDrawColumnCell
    OnDblClick = DBGrdLookupDblClick
    OnKeyDown = FormKeyDown
    OnKeyPress = DBGrdLookupKeyPress
    OnTitleClick = DBGrdLookupTitleClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 228
    Width = 495
    Height = 19
    Panels = <>
  end
  object cbCode: TCheckBox
    Tag = 10
    Left = 10
    Top = 205
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akLeft, akBottom]
    Caption = 'Code'
    Checked = True
    Color = clSilver
    ParentColor = False
    State = cbChecked
    TabOrder = 2
    OnClick = cbCodeClick
  end
  object cbDescription: TCheckBox
    Tag = 11
    Left = 118
    Top = 205
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akLeft, akBottom]
    Caption = 'Description'
    Color = clSilver
    ParentColor = False
    TabOrder = 3
    OnClick = cbCodeClick
  end
  object cbBarCode: TCheckBox
    Tag = 12
    Left = 232
    Top = 205
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akLeft, akBottom]
    Caption = 'Bar Code'
    Color = clSilver
    ParentColor = False
    TabOrder = 4
    OnClick = cbCodeClick
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 80
    object Usefilter1: TMenuItem
      Caption = 'Use filter'
      OnClick = Usefilter1Click
    end
  end
  object tblAccount: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select SACCOUNTCODE,SDescription,WAccountTypeID,WAccountID from ' +
        'account'
      'where Binactive = 0')
    Left = 120
    Top = 24
  end
  object TblStock: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from stock')
    Left = 120
    Top = 80
  end
  object tblContacts: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from contacts')
    Left = 192
    Top = 24
  end
  object TblPeriods: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'Select * from periods')
    Left = 192
    Top = 80
  end
  object DSGeneral: TDataSource
    Left = 56
    Top = 80
  end
  object tblSysVars: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select WDebtorsControlID,  WCreditorsControlID,WRetainedIncomeID' +
        ' from sysvars')
    Left = 264
    Top = 24
  end
  object ZQTblGroup: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      
        'Select WGROUPID, SDESCRIPTION  from groups where WGroupTypeID = ' +
        ':WGroupTypeID')
    Left = 56
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WGroupTypeID'
      end>
  end
end
