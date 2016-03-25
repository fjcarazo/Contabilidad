object StockLinkDetail: TStockLinkDetail
  Left = 205
  Top = 203
  Caption = 'Linked detail'
  ClientHeight = 525
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TcxTreeView
    Left = 0
    Top = 0
    Width = 321
    Height = 491
    Align = alLeft
    TabOrder = 0
    HideSelection = False
    Images = ILitems
    Indent = 35
    ReadOnly = True
    RowSelect = True
    OnChange = TreeView1Change
    ExplicitHeight = 493
  end
  object Panel1: TPanel
    Left = 321
    Top = 0
    Width = 524
    Height = 491
    Align = alClient
    TabOrder = 1
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 296
      Width = 522
      Height = 194
      Align = alBottom
      Caption = 'rgoptions'
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 522
      Height = 295
      Align = alClient
      TabOrder = 1
      object DBGrid1: TDBGrid
        Left = 1
        Top = 1
        Width = 520
        Height = 259
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRIPTION'
            Title.Caption = 'Description'
            Width = 294
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FEXCL'
            Title.Caption = 'Exclusive'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FINC'
            ReadOnly = True
            Title.Caption = 'Inclusive'
            Width = 89
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 1
        Top = 260
        Width = 520
        Height = 34
        Align = alBottom
        TabOrder = 1
        object LTotExcl: TLabel
          Left = 332
          Top = 8
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
        end
        object lTotInc: TLabel
          Left = 416
          Top = 8
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = '0.00'
        end
        object Label1: TLabel
          Left = 60
          Top = 12
          Width = 16
          Height = 13
          Caption = 'Qty'
        end
        object Eqty: TEdit
          Left = 96
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '1'
          OnChange = EqtyChange
          OnKeyPress = EqtyKeyPress
        end
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 491
    Width = 845
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      845
      34)
    object BtnOk: TBitBtn
      Left = 642
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
      Left = 747
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
  object ZQLinkedDef: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from STOCK_LINKEDSALE where wstockid = :wstockid'
      'order by Wsortid')
    Left = 492
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'wstockid'
      end>
    object ZQLinkedDefWSTOCKLINKSALEID: TIntegerField
      FieldName = 'WSTOCKLINKSALEID'
      Required = True
    end
    object ZQLinkedDefWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
      Required = True
    end
    object ZQLinkedDefWLINKSTOCKID: TIntegerField
      FieldName = 'WLINKSTOCKID'
    end
    object ZQLinkedDefWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQLinkedDefWGROUPITEMID: TIntegerField
      FieldName = 'WGROUPITEMID'
      Required = True
    end
    object ZQLinkedDefFEXTRAPRICE: TFloatField
      FieldName = 'FEXTRAPRICE'
    end
    object ZQLinkedDefWPRICETYPE: TSmallintField
      FieldName = 'WPRICETYPE'
    end
    object ZQLinkedDefWSORTID: TIntegerField
      FieldName = 'WSORTID'
    end
  end
  object ILitems: TImageList
    Height = 32
    Width = 32
    Left = 552
    Top = 84
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 384
    Top = 84
  end
  object ZQDoclineLink: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'Select * from DOCLINE_LINKED where Wdocid =:WDOCID')
    CachedUpdates = True
    UpdateObject = ZUSQLDocLinked
    AfterInsert = ZQDoclineLinkAfterInsert
    Left = 180
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WDOCID'
      end>
    object ZQDoclineLinkWDOCLINKED_ID: TIntegerField
      FieldName = 'WDOCLINKED_ID'
      Required = True
    end
    object ZQDoclineLinkWDOCLINEID: TIntegerField
      FieldName = 'WDOCLINEID'
      Required = True
    end
    object ZQDoclineLinkWDOCID: TIntegerField
      FieldName = 'WDOCID'
      Required = True
    end
    object ZQDoclineLinkWSTOCKID: TIntegerField
      FieldName = 'WSTOCKID'
    end
    object ZQDoclineLinkWLINETYPEID: TIntegerField
      FieldName = 'WLINETYPEID'
    end
    object ZQDoclineLinkWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object ZQDoclineLinkFQTYORDERED: TFloatField
      FieldName = 'FQTYORDERED'
    end
    object ZQDoclineLinkFQTYSHIPPED: TFloatField
      FieldName = 'FQTYSHIPPED'
    end
    object ZQDoclineLinkFSELLINGPRICE: TFloatField
      FieldName = 'FSELLINGPRICE'
    end
    object ZQDoclineLinkFITEMDISCOUNT: TFloatField
      FieldName = 'FITEMDISCOUNT'
    end
    object ZQDoclineLinkWTAXID: TIntegerField
      FieldName = 'WTAXID'
    end
    object ZQDoclineLinkFEXCLUSIVEAMT: TFloatField
      FieldName = 'FEXCLUSIVEAMT'
    end
    object ZQDoclineLinkFINCLUSIVEAMT: TFloatField
      FieldName = 'FINCLUSIVEAMT'
    end
    object ZQDoclineLinkFTAXAMOUNT: TFloatField
      FieldName = 'FTAXAMOUNT'
    end
    object ZQDoclineLinkDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQDoclineLinkSUNIT: TStringField
      FieldName = 'SUNIT'
      Size = 8
    end
    object ZQDoclineLinkSSTOCKCODE: TStringField
      FieldName = 'SSTOCKCODE'
      Size = 15
    end
    object ZQDoclineLinkWPROFILEID: TIntegerField
      FieldName = 'WPROFILEID'
    end
    object ZQDoclineLinkWSERIALNOID: TIntegerField
      FieldName = 'WSERIALNOID'
    end
    object ZQDoclineLinkWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
    object ZQDoclineLinkWREPORTINGGROUP1ID: TIntegerField
      FieldName = 'WREPORTINGGROUP1ID'
    end
    object ZQDoclineLinkWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
    end
    object ZQDoclineLinkWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object ZQDoclineLinkFUNITQTY: TFloatField
      FieldName = 'FUNITQTY'
    end
  end
  object ZUSQLDocLinked: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOCLINE_LINKED'
      
        '  (DOCLINE_LINKED.WDOCLINKED_ID, DOCLINE_LINKED.WDOCLINEID, DOCL' +
        'INE_LINKED.WDOCID, '
      
        '   DOCLINE_LINKED.WSTOCKID, DOCLINE_LINKED.WLINETYPEID, DOCLINE_' +
        'LINKED.WDESCRIPTIONID, '
      
        '   DOCLINE_LINKED.FQTYORDERED, DOCLINE_LINKED.FQTYSHIPPED, DOCLI' +
        'NE_LINKED.FSELLINGPRICE, '
      
        '   DOCLINE_LINKED.FITEMDISCOUNT, DOCLINE_LINKED.WTAXID, DOCLINE_' +
        'LINKED.FEXCLUSIVEAMT, '
      
        '   DOCLINE_LINKED.FINCLUSIVEAMT, DOCLINE_LINKED.FTAXAMOUNT, DOCL' +
        'INE_LINKED.DSYSDATE, '
      
        '   DOCLINE_LINKED.SUNIT, DOCLINE_LINKED.SSTOCKCODE, DOCLINE_LINK' +
        'ED.WPROFILEID, '
      
        '   DOCLINE_LINKED.WSERIALNOID, DOCLINE_LINKED.WSORTNO, DOCLINE_L' +
        'INKED.WREPORTINGGROUP1ID, '
      
        '   DOCLINE_LINKED.WREPORTINGGROUP2ID, DOCLINE_LINKED.WACCOUNTID,' +
        ' DOCLINE_LINKED.FUNITQTY)'
      'VALUES'
      
        '  (:WDOCLINKED_ID, :WDOCLINEID, :WDOCID, :WSTOCKID, :WLINETYPEID' +
        ', :WDESCRIPTIONID, '
      
        '   :FQTYORDERED, :FQTYSHIPPED, :FSELLINGPRICE, :FITEMDISCOUNT, :' +
        'WTAXID, '
      
        '   :FEXCLUSIVEAMT, :FINCLUSIVEAMT, :FTAXAMOUNT, :DSYSDATE, :SUNI' +
        'T, :SSTOCKCODE, '
      
        '   :WPROFILEID, :WSERIALNOID, :WSORTNO, :WREPORTINGGROUP1ID, :WR' +
        'EPORTINGGROUP2ID, '
      '   :WACCOUNTID, :FUNITQTY)')
    DeleteSQL.Strings = (
      'DELETE FROM DOCLINE_LINKED'
      'WHERE'
      '  DOCLINE_LINKED.WDOCLINKED_ID = :OLD_WDOCLINKED_ID')
    ModifySQL.Strings = (
      'UPDATE DOCLINE_LINKED SET'
      '  DOCLINE_LINKED.WDOCLINKED_ID = :WDOCLINKED_ID,'
      '  DOCLINE_LINKED.WDOCLINEID = :WDOCLINEID,'
      '  DOCLINE_LINKED.WDOCID = :WDOCID,'
      '  DOCLINE_LINKED.WSTOCKID = :WSTOCKID,'
      '  DOCLINE_LINKED.WLINETYPEID = :WLINETYPEID,'
      '  DOCLINE_LINKED.WDESCRIPTIONID = :WDESCRIPTIONID,'
      '  DOCLINE_LINKED.FQTYORDERED = :FQTYORDERED,'
      '  DOCLINE_LINKED.FQTYSHIPPED = :FQTYSHIPPED,'
      '  DOCLINE_LINKED.FSELLINGPRICE = :FSELLINGPRICE,'
      '  DOCLINE_LINKED.FITEMDISCOUNT = :FITEMDISCOUNT,'
      '  DOCLINE_LINKED.WTAXID = :WTAXID,'
      '  DOCLINE_LINKED.FEXCLUSIVEAMT = :FEXCLUSIVEAMT,'
      '  DOCLINE_LINKED.FINCLUSIVEAMT = :FINCLUSIVEAMT,'
      '  DOCLINE_LINKED.FTAXAMOUNT = :FTAXAMOUNT,'
      '  DOCLINE_LINKED.DSYSDATE = :DSYSDATE,'
      '  DOCLINE_LINKED.SUNIT = :SUNIT,'
      '  DOCLINE_LINKED.SSTOCKCODE = :SSTOCKCODE,'
      '  DOCLINE_LINKED.WPROFILEID = :WPROFILEID,'
      '  DOCLINE_LINKED.WSERIALNOID = :WSERIALNOID,'
      '  DOCLINE_LINKED.WSORTNO = :WSORTNO,'
      '  DOCLINE_LINKED.WREPORTINGGROUP1ID = '
      ':WREPORTINGGROUP1ID,'
      '  DOCLINE_LINKED.WREPORTINGGROUP2ID = '
      ':WREPORTINGGROUP2ID,'
      '  DOCLINE_LINKED.WACCOUNTID = :WACCOUNTID,'
      '  DOCLINE_LINKED.FUNITQTY = :FUNITQTY'
      'WHERE'
      '  DOCLINE_LINKED.WDOCLINKED_ID = :OLD_WDOCLINKED_ID')
    Left = 176
    Top = 208
  end
end
