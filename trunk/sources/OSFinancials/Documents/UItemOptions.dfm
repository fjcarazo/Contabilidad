object ItemOptions: TItemOptions
  Left = 147
  Top = 279
  Caption = 'Item options'
  ClientHeight = 367
  ClientWidth = 576
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 576
    Height = 367
    ActivePage = Details
    Align = alClient
    TabOrder = 0
    object Options: TTabSheet
      Caption = 'Options'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 35
        Width = 568
        Height = 304
        Align = alClient
        DataSource = dsItemsOptions
        ParentShowHint = False
        PopupMenu = PMOptions
        ShowHint = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'WITEMOPTIONID'
            ReadOnly = True
            Title.Caption = 'Id'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION'
            Title.Caption = 'Description'
            Width = 222
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 568
        Height = 35
        DataSource = dsItemsOptions
        Align = alTop
        TabOrder = 1
      end
    end
    object Details: TTabSheet
      Caption = 'Details'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ButtonPanel: TPanel
        Left = 0
        Top = 305
        Width = 568
        Height = 34
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          568
          34)
        object BtnOk: TBitBtn
          Left = 378
          Top = 6
          Width = 95
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
          OnClick = BtnOkClick
        end
        object BtnCancel: TBitBtn
          Left = 479
          Top = 6
          Width = 95
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
          OnClick = BtnCancelClick
        end
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 568
        Height = 305
        ActivePage = tsOptionDetail
        Align = alClient
        TabOrder = 1
        object tsOptionDetail: TTabSheet
          Caption = 'Options'
          object Label1: TLabel
            Left = 168
            Top = 92
            Width = 80
            Height = 13
            Caption = 'SDESCRIPTION'
          end
          object DBText1: TDBText
            Left = 0
            Top = 43
            Width = 560
            Height = 30
            Align = alTop
            DataField = 'SDESCRIPTION'
            DataSource = dsItemsOptions
            ExplicitWidth = 568
          end
          object DBGrid2: TDBGrid
            Left = 0
            Top = 73
            Width = 560
            Height = 204
            Align = alClient
            DataSource = dsOptionsValues
            PopupMenu = PMOptions
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'SDESCRIPTION'
                Title.Caption = 'Description'
                Width = 226
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FEXTRAAMOUNT'
                Title.Caption = 'Extra amount'
                Width = 101
                Visible = True
              end>
          end
          object DBNavigator2: TDBNavigator
            Left = 0
            Top = 0
            Width = 560
            Height = 43
            DataSource = dsOptionsValues
            Align = alTop
            TabOrder = 1
          end
        end
      end
    end
  end
  object ZItemsOptions: TUniTable
    TableName = 'ITEMOPTIONS'
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    AfterInsert = ZItemsOptionsAfterInsert
    AfterScroll = ZItemsOptionsAfterScroll
    Left = 100
    Top = 104
    object ZItemsOptionsWITEMOPTIONID: TIntegerField
      FieldName = 'WITEMOPTIONID'
      Required = True
    end
    object ZItemsOptionsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
  end
  object dsItemsOptions: TDataSource
    DataSet = ZItemsOptions
    Left = 232
    Top = 100
  end
  object ZQITEMOPTIONSVALUES: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select '
      '* from ITEMOPTIONSVALUES where WITEMOPTIONID =:WITEMOPTIONID')
    CachedUpdates = True
    UpdateObject = ZUSQLITEMOPTIONSVALUES
    AfterInsert = ZQITEMOPTIONSVALUESAfterInsert
    Left = 100
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WITEMOPTIONID'
      end>
    object ZQITEMOPTIONSVALUESWITEMOPTIONVALUEID: TIntegerField
      FieldName = 'WITEMOPTIONVALUEID'
      Required = True
    end
    object ZQITEMOPTIONSVALUESWITEMOPTIONID: TIntegerField
      FieldName = 'WITEMOPTIONID'
    end
    object ZQITEMOPTIONSVALUESSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object ZQITEMOPTIONSVALUESFEXTRAAMOUNT: TFloatField
      FieldName = 'FEXTRAAMOUNT'
    end
  end
  object ZUSQLITEMOPTIONSVALUES: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO ITEMOPTIONSVALUES'
      
        '  (ITEMOPTIONSVALUES.WITEMOPTIONVALUEID, ITEMOPTIONSVALUES.WITEM' +
        'OPTIONID, '
      
        '   ITEMOPTIONSVALUES.SDESCRIPTION, ITEMOPTIONSVALUES.FEXTRAAMOUN' +
        'T)'
      'VALUES'
      
        '  (:WITEMOPTIONVALUEID, :WITEMOPTIONID, :SDESCRIPTION, :FEXTRAAM' +
        'OUNT)')
    DeleteSQL.Strings = (
      'DELETE FROM ITEMOPTIONSVALUES'
      'WHERE'
      '  ITEMOPTIONSVALUES.WITEMOPTIONVALUEID = :OLD_WITEMOPTIONVALUEID')
    ModifySQL.Strings = (
      'UPDATE ITEMOPTIONSVALUES SET'
      '  ITEMOPTIONSVALUES.WITEMOPTIONVALUEID = '
      ':WITEMOPTIONVALUEID,'
      '  ITEMOPTIONSVALUES.WITEMOPTIONID = :WITEMOPTIONID,'
      '  ITEMOPTIONSVALUES.SDESCRIPTION = :SDESCRIPTION,'
      '  ITEMOPTIONSVALUES.FEXTRAAMOUNT = :FEXTRAAMOUNT'
      'WHERE'
      '  ITEMOPTIONSVALUES.WITEMOPTIONVALUEID = '
      ':OLD_WITEMOPTIONVALUEID')
    Left = 100
    Top = 200
  end
  object dsOptionsValues: TDataSource
    DataSet = ZQITEMOPTIONSVALUES
    Left = 240
    Top = 156
  end
  object PMOptions: TPopupMenu
    Left = 40
    Top = 112
    object Extrafields1: TMenuItem
      Caption = 'plugins'
    end
  end
end
