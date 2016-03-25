object FPosDocItem: TFPosDocItem
  Left = 338
  Top = 411
  Width = 239
  Height = 184
  Caption = 'POS Document type'
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 80
    Height = 13
    Caption = 'Document status'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 38
    Height = 13
    Caption = 'Postype'
  end
  object PBotom: TPanel
    Left = 0
    Top = 117
    Width = 231
    Height = 33
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      231
      33)
    object BClose: TBitBtn
      Left = 382
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
  end
  object ComboBox1: TComboBox
    Left = 12
    Top = 28
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      'Osf document'
      'Std pos document'
      'Pos open document'
      'Pos closed document')
  end
  object cbPosType: TComboBox
    Left = 12
    Top = 72
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 2
    Text = 'Retail'
    Items.Strings = (
      'Retail'
      'Horeca')
  end
  object ZQSelectie: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from dochead where wdocid =:wdocid')
    UpdateObject = ZUSQLSelectie
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'wdocid'
      end>
    object ZQSelectieWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object ZQSelectieWSOURCETYPEID: TIntegerField
      FieldName = 'WSOURCETYPEID'
    end
    object ZQSelectieSEXTERNALID: TStringField
      FieldName = 'SEXTERNALID'
      Size = 50
    end
  end
  object ZUSQLSelectie: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO dochead'
      '  (dochead.WSOURCETYPEID, dochead.SEXTERNALID)'
      'VALUES'
      '  (:WSOURCETYPEID, :SEXTERNALID)')
    DeleteSQL.Strings = (
      'DELETE FROM dochead'
      'WHERE'
      '  dochead.WDOCID = :OLD_WDOCID')
    ModifySQL.Strings = (
      'UPDATE dochead SET'
      '  dochead.WSOURCETYPEID = :WSOURCETYPEID,'
      '  dochead.SEXTERNALID = :SEXTERNALID'
      'WHERE'
      '  dochead.WDOCID = :OLD_WDOCID')
    Left = 180
    Top = 45
  end
  object DataSource1: TDataSource
    DataSet = ZQSelectie
    Left = 36
    Top = 112
  end
end
