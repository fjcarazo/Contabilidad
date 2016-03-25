object fmEditCurrencies: TfmEditCurrencies
  Left = 324
  Top = 266
  Caption = 'Currencies'
  ClientHeight = 520
  ClientWidth = 654
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 49
    Width = 654
    Height = 434
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'WCURRENCYID'
        ReadOnly = True
        Title.Caption = 'ID'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SDESCRIPTION'
        Title.Caption = 'Description'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSYMBOL'
        Title.Caption = 'Symbol'
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        ReadOnly = True
        Title.Caption = '-----'
        Width = 22
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRATE1'
        Title.Caption = 'Rate'
        Width = 144
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 654
    Height = 49
    DataSource = DataSource1
    Align = alTop
    TabOrder = 1
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 483
    Width = 654
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      654
      37)
    object BtnCancel: TBitBtn
      Left = 539
      Top = 8
      Width = 96
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
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
      ModalResult = 1
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object ZQCurs: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from currency')
    UpdateObject = ZUSQLCurrency
    AfterInsert = ZQCursAfterInsert
    BeforeDelete = ZQCursBeforeDelete
    Left = 424
    Top = 12
    object ZQCursWCURRENCYID: TIntegerField
      FieldName = 'WCURRENCYID'
      Required = True
    end
    object ZQCursSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object ZQCursSSYMBOL: TStringField
      FieldName = 'SSYMBOL'
      Size = 6
    end
    object ZQCursFRATE1: TFloatField
      FieldName = 'FRATE1'
      DisplayFormat = '0.########'
    end
    object ZQCursFRATE2: TFloatField
      FieldName = 'FRATE2'
      DisplayFormat = '0.########'
    end
    object ZQCursFRETE3: TFloatField
      FieldName = 'FRETE3'
      DisplayFormat = '0.########'
    end
    object ZQCursFRATE4: TFloatField
      FieldName = 'FRATE4'
    end
    object ZQCursFRATE5: TFloatField
      FieldName = 'FRATE5'
    end
    object ZQCursFRATE6: TFloatField
      FieldName = 'FRATE6'
    end
    object ZQCursFRATE7: TFloatField
      FieldName = 'FRATE7'
    end
    object ZQCursFRATE8: TFloatField
      FieldName = 'FRATE8'
    end
    object ZQCursFRATE9: TFloatField
      FieldName = 'FRATE9'
    end
    object ZQCursFRATE10: TFloatField
      FieldName = 'FRATE10'
    end
    object ZQCursFRATE11: TFloatField
      FieldName = 'FRATE11'
    end
    object ZQCursFRATE12: TFloatField
      FieldName = 'FRATE12'
    end
    object ZQCursFRATE13: TFloatField
      FieldName = 'FRATE13'
    end
    object ZQCursFRATE14: TFloatField
      FieldName = 'FRATE14'
    end
    object ZQCursFRATE15: TFloatField
      FieldName = 'FRATE15'
    end
    object ZQCursFRATE16: TFloatField
      FieldName = 'FRATE16'
    end
    object ZQCursFRATE17: TFloatField
      FieldName = 'FRATE17'
    end
    object ZQCursFRATE18: TFloatField
      FieldName = 'FRATE18'
    end
    object ZQCursFRATE19: TFloatField
      FieldName = 'FRATE19'
    end
    object ZQCursFRATE20: TFloatField
      FieldName = 'FRATE20'
    end
    object ZQCursFRATE21: TFloatField
      FieldName = 'FRATE21'
    end
    object ZQCursFRATE22: TFloatField
      FieldName = 'FRATE22'
    end
    object ZQCursFRATE23: TFloatField
      FieldName = 'FRATE23'
    end
    object ZQCursFRATE24: TFloatField
      FieldName = 'FRATE24'
    end
    object ZQCursFRATE25: TFloatField
      FieldName = 'FRATE25'
    end
    object ZQCursFRATE26: TFloatField
      FieldName = 'FRATE26'
    end
    object ZQCursWCONTRYID: TIntegerField
      FieldName = 'WCONTRYID'
    end
    object ZQCursWVARIANCEACCOUNTID: TIntegerField
      FieldName = 'WVARIANCEACCOUNTID'
    end
    object ZQCursWNOOFDECIMALS: TIntegerField
      FieldName = 'WNOOFDECIMALS'
    end
    object ZQCursDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
  end
  object ZUSQLCurrency: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO currency'
      
        '  (WCURRENCYID, SDESCRIPTION, SSYMBOL, FRATE1, FRATE2, FRETE3, F' +
        'RATE4, '
      
        '   FRATE5, FRATE6, FRATE7, FRATE8, FRATE9, FRATE10, FRATE11, FRA' +
        'TE12, FRATE13, '
      
        '   FRATE14, FRATE15, FRATE16, FRATE17, FRATE18, FRATE19, FRATE20' +
        ', FRATE21, '
      
        '   FRATE22, FRATE23, FRATE24, FRATE25, FRATE26, WCONTRYID, WVARI' +
        'ANCEACCOUNTID, '
      '   WNOOFDECIMALS, DSYSDATE)'
      'VALUES'
      
        '  (:WCURRENCYID, :SDESCRIPTION, :SSYMBOL, :FRATE1, :FRATE2, :FRE' +
        'TE3, :FRATE4, '
      
        '   :FRATE5, :FRATE6, :FRATE7, :FRATE8, :FRATE9, :FRATE10, :FRATE' +
        '11, :FRATE12, '
      
        '   :FRATE13, :FRATE14, :FRATE15, :FRATE16, :FRATE17, :FRATE18, :' +
        'FRATE19, '
      
        '   :FRATE20, :FRATE21, :FRATE22, :FRATE23, :FRATE24, :FRATE25, :' +
        'FRATE26, '
      '   :WCONTRYID, :WVARIANCEACCOUNTID, :WNOOFDECIMALS, :DSYSDATE)')
    DeleteSQL.Strings = (
      'DELETE FROM currency'
      'WHERE'
      '  currency.WCURRENCYID = :OLD_WCURRENCYID')
    ModifySQL.Strings = (
      'UPDATE currency SET'
      '  WCURRENCYID = :WCURRENCYID,'
      '  SDESCRIPTION = :SDESCRIPTION,'
      '  SSYMBOL = :SSYMBOL,'
      '  FRATE1 = :FRATE1,'
      '  FRATE2 = :FRATE2,'
      '  FRETE3 = :FRETE3,'
      '  FRATE4 = :FRATE4,'
      '  FRATE5 = :FRATE5,'
      '  FRATE6 = :FRATE6,'
      '  FRATE7 = :FRATE7,'
      '  FRATE8 = :FRATE8,'
      '  FRATE9 = :FRATE9,'
      '  FRATE10 = :FRATE10,'
      '  FRATE11 = :FRATE11,'
      '  FRATE12 = :FRATE12,'
      '  FRATE13 = :FRATE13,'
      '  FRATE14 = :FRATE14,'
      '  FRATE15 = :FRATE15,'
      '  FRATE16 = :FRATE16,'
      '  FRATE17 = :FRATE17,'
      '  FRATE18 = :FRATE18,'
      '  FRATE19 = :FRATE19,'
      '  FRATE20 = :FRATE20,'
      '  FRATE21 = :FRATE21,'
      '  FRATE22 = :FRATE22,'
      '  FRATE23 = :FRATE23,'
      '  FRATE24 = :FRATE24,'
      '  FRATE25 = :FRATE25,'
      '  FRATE26 = :FRATE26,'
      '  WCONTRYID = :WCONTRYID,'
      '  WVARIANCEACCOUNTID = :WVARIANCEACCOUNTID,'
      '  WNOOFDECIMALS = :WNOOFDECIMALS,'
      '  DSYSDATE = :DSYSDATE'
      'WHERE'
      '  currency.WCURRENCYID = :OLD_WCURRENCYID')
    Left = 572
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ZQCurs
    Left = 512
    Top = 124
  end
end
