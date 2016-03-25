object fmDocLinks: TfmDocLinks
  Left = 205
  Top = 171
  Caption = 'Links'
  ClientHeight = 419
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 638
    Height = 378
    ActivePage = tsTo
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 646
    ExplicitHeight = 380
    object tsFrom: TTabSheet
      Caption = 'From'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 0
        Top = 41
        Width = 638
        Height = 311
        Align = alClient
        DataSource = dsFrom
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SLOOKUPDOCLINE'
            Title.Caption = 'Document'
            Width = 226
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SLOOKUPQTY'
            Title.Caption = 'Qty left'
            Width = 225
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 638
        Height = 41
        Align = alTop
        TabOrder = 1
        object bDelFrom: TButton
          Left = 24
          Top = 8
          Width = 117
          Height = 25
          Caption = 'Delete'
          TabOrder = 0
          OnClick = bDelFromClick
        end
        object bLinkFrom: TButton
          Left = 168
          Top = 8
          Width = 117
          Height = 25
          Caption = 'Link'
          TabOrder = 1
          OnClick = bLinkFromClick
        end
      end
    end
    object tsTo: TTabSheet
      Caption = 'To'
      ImageIndex = 1
      ExplicitWidth = 638
      ExplicitHeight = 352
      object DBGrid2: TDBGrid
        Left = 0
        Top = 41
        Width = 630
        Height = 309
        Align = alClient
        DataSource = dsTo
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'SLOOKUPDOCLINE'
            Title.Caption = 'Document'
            Width = 184
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SLOOKUPQTY'
            Title.Caption = 'Qty'
            Width = 111
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 630
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 638
        object bDelTo: TButton
          Left = 24
          Top = 8
          Width = 117
          Height = 25
          Caption = 'Delete'
          TabOrder = 0
          OnClick = bDelToClick
        end
        object bLinkTo: TButton
          Left = 168
          Top = 8
          Width = 117
          Height = 25
          Caption = 'Link'
          TabOrder = 1
          OnClick = bLinkToClick
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 378
    Width = 638
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 380
    ExplicitWidth = 646
    DesignSize = (
      638
      41)
    object bClose: TBitBtn
      Left = 510
      Top = 4
      Width = 121
      Height = 29
      Anchors = [akTop, akRight]
      Caption = 'Close'
      DoubleBuffered = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object ZQLinksFrom: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'SELECT *'
      'FROM DOC_LINK a'
      'where '
      'WFROMDOCID = :DOC')
    CachedUpdates = True
    UpdateObject = ZULinksFrom
    AfterOpen = ZQLinksFromAfterScroll
    AfterScroll = ZQLinksFromAfterScroll
    OnCalcFields = ZQLinksFromCalcFields
    Left = 148
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DOC'
      end>
    object ZQLinksFromWTODOCID: TIntegerField
      FieldName = 'WTODOCID'
      Required = True
    end
    object ZQLinksFromWTODOCLINEID: TIntegerField
      FieldName = 'WTODOCLINEID'
      Required = True
    end
    object ZQLinksFromSLOOKUPDOCLINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'SLOOKUPDOCLINE'
      Size = 200
      Calculated = True
    end
    object ZQLinksFromSLOOKUPQTY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SLOOKUPQTY'
      Calculated = True
    end
    object ZQLinksFromWFROMDOCID: TIntegerField
      FieldName = 'WFROMDOCID'
      Required = True
    end
    object ZQLinksFromWFROMDOCLINEID: TIntegerField
      FieldName = 'WFROMDOCLINEID'
      Required = True
    end
  end
  object ZQLinksTo: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'SELECT a.*, b.FQTYSHIPPED SLOOKUPQTY, b.FQTYSHIPPED FORGQTY'
      
        'FROM DOC_LINK a join docline b on a.WFROMDOCID = b.WDOCID and a.' +
        'WFROMDOCLINEID = b.WDOCLINEID'
      ''
      'where '
      'a.WTODOCID= :DOC'
      ' '
      '')
    CachedUpdates = True
    UpdateObject = ZULinksTo
    AfterOpen = ZQLinksToAfterScroll
    AfterScroll = ZQLinksToAfterScroll
    OnCalcFields = ZQLinksToCalcFields
    Left = 76
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DOC'
      end>
    object ZQLinksToWFROMDOCID: TIntegerField
      FieldName = 'WFROMDOCID'
      Required = True
    end
    object ZQLinksToWFROMDOCLINEID: TIntegerField
      FieldName = 'WFROMDOCLINEID'
      Required = True
    end
    object ZQLinksToWTODOCID: TIntegerField
      FieldName = 'WTODOCID'
      Required = True
    end
    object ZQLinksToWTODOCLINEID: TIntegerField
      FieldName = 'WTODOCLINEID'
      Required = True
    end
    object ZQLinksToSLOOKUPDOCLINE: TStringField
      FieldKind = fkCalculated
      FieldName = 'SLOOKUPDOCLINE'
      Size = 120
      Calculated = True
    end
    object ZQLinksToFORGQTY: TFloatField
      FieldName = 'FORGQTY'
    end
    object ZQLinksToSLOOKUPQTY: TFloatField
      FieldName = 'SLOOKUPQTY'
    end
  end
  object dsTo: TDataSource
    DataSet = ZQLinksTo
    Left = 192
    Top = 284
  end
  object dsFrom: TDataSource
    DataSet = ZQLinksFrom
    Left = 468
    Top = 136
  end
  object ZQQtyLink: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select  cast( (a.FqtyShipped * coalesce(unit.FUNITQTY,1) )- sum(' +
        'coalesce(dl.FqtyShipped* coalesce(dlu.FUNITQTY,1),0)) as numeric' +
        '(12,8)) x'
      
        '    from docline a join dochead b on a.wdocid = b.wdocid join st' +
        'ock s on a.WstockId = S.Wstockid'
      '     left join UNIT on cast(unit.WUNITID as char(10)) = a.Sunit'
      
        '     left join DOC_LINK v on v.WTODOCID = a.WDOCID and v.WTODOCL' +
        'INEID = a.WDOCLINEID'
      
        '     left join docline dl on v.WFROMDOCID = dl.WDOCID and dl.wDO' +
        'CLINEID = v.WFROMDOCLINEID'
      '     and dl.Wdocid <> :WDOCID'
      
        '     left join UNIT dlu on cast(dlu.WUNITID as char(10)) = dl.Su' +
        'nit'
      ''
      'where a.WDocid =:DOC and a.WDocLineId =:DOCLINE'
      'group by a.FqtyShipped,unit.FUNITQTY')
    Left = 252
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WDOCID'
      end
      item
        DataType = ftUnknown
        Name = 'DOC'
      end
      item
        DataType = ftUnknown
        Name = 'DOCLINE'
      end>
  end
  object ZULinksFrom: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOC_LINK'
      '  (WFROMDOCID, WFROMDOCLINEID, WTODOCID, WTODOCLINEID)'
      'VALUES'
      '  (:WFROMDOCID, :WFROMDOCLINEID, :WTODOCID, :WTODOCLINEID)')
    DeleteSQL.Strings = (
      'DELETE FROM DOC_LINK'
      'WHERE'
      '  DOC_LINK.WFROMDOCID = :OLD_WFROMDOCID AND'
      '  DOC_LINK.WFROMDOCLINEID = :OLD_WFROMDOCLINEID AND'
      '  DOC_LINK.WTODOCID = :OLD_WTODOCID AND'
      '  DOC_LINK.WTODOCLINEID = :OLD_WTODOCLINEID')
    ModifySQL.Strings = (
      'UPDATE DOC_LINK SET'
      '  WFROMDOCID = :WFROMDOCID,'
      '  WFROMDOCLINEID = :WFROMDOCLINEID,'
      '  WTODOCID = :WTODOCID,'
      '  WTODOCLINEID = :WTODOCLINEID'
      'WHERE'
      '  DOC_LINK.WFROMDOCID = :OLD_WFROMDOCID AND'
      '  DOC_LINK.WFROMDOCLINEID = :OLD_WFROMDOCLINEID AND'
      '  DOC_LINK.WTODOCID = :OLD_WTODOCID AND'
      '  DOC_LINK.WTODOCLINEID = :OLD_WTODOCLINEID')
    Left = 252
    Top = 160
  end
  object ZULinksTo: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO DOC_LINK'
      '  (WFROMDOCID, WFROMDOCLINEID, WTODOCID, WTODOCLINEID)'
      'VALUES'
      '  (:WFROMDOCID, :WFROMDOCLINEID, :WTODOCID, :WTODOCLINEID)')
    DeleteSQL.Strings = (
      'DELETE FROM DOC_LINK'
      'WHERE'
      '  DOC_LINK.WFROMDOCID = :OLD_WFROMDOCID AND'
      '  DOC_LINK.WFROMDOCLINEID = :OLD_WFROMDOCLINEID AND'
      '  DOC_LINK.WTODOCID = :OLD_WTODOCID AND'
      '  DOC_LINK.WTODOCLINEID = :OLD_WTODOCLINEID')
    ModifySQL.Strings = (
      'UPDATE DOC_LINK SET'
      '  WFROMDOCID = :WFROMDOCID,'
      '  WFROMDOCLINEID = :WFROMDOCLINEID,'
      '  WTODOCID = :WTODOCID,'
      '  WTODOCLINEID = :WTODOCLINEID'
      'WHERE'
      '  DOC_LINK.WFROMDOCID = :OLD_WFROMDOCID AND'
      '  DOC_LINK.WFROMDOCLINEID = :OLD_WFROMDOCLINEID AND'
      '  DOC_LINK.WTODOCID = :OLD_WTODOCID AND'
      '  DOC_LINK.WTODOCLINEID = :OLD_WTODOCLINEID')
    Left = 372
    Top = 160
  end
  object ZQQtyLinkTo: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'Select   cast((a.FqtyShipped * coalesce(unit.FUNITQTY,1) ) as nu' +
        'meric(12,8)) x'
      
        '    from docline a join dochead b on a.wdocid = b.wdocid join st' +
        'ock s on a.WstockId = S.Wstockid'
      '    left join UNIT on cast(unit.WUNITID as char(10)) = a.Sunit'
      'where a.WDocid =:DOC and a.WDocLineId =:DOCLINE'
      'group by a.FqtyShipped,unit.FUNITQTY')
    Left = 472
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DOC'
      end
      item
        DataType = ftUnknown
        Name = 'DOCLINE'
      end>
  end
end
