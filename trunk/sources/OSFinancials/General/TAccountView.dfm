object fmTAccountView: TfmTAccountView
  Left = 34
  Top = 163
  Width = 1257
  Height = 621
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 83
  Caption = 'T Account Viewer'
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 560
    Width = 1249
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnDblClick = ButtonPanelDblClick
    DesignSize = (
      1249
      34)
    object Label11: TLabel
      Left = 12
      Top = 12
      Width = 22
      Height = 13
      Caption = 'Filter'
    end
    object BtnOk: TBitBtn
      Left = 1060
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = '&Ok'
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
      Left = 1154
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight, akBottom]
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
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BtnCancelClick
    end
    object EFilter: TEdit
      Left = 48
      Top = 8
      Width = 185
      Height = 21
      TabOrder = 2
      OnChange = EFilterChange
      OnExit = EFilterExit
    end
    object pPRogress: TPanel
      Left = 336
      Top = 4
      Width = 433
      Height = 25
      TabOrder = 3
      Visible = False
      object LText: TLabel
        Left = 312
        Top = 4
        Width = 27
        Height = 13
        Caption = 'LText'
      end
      object pbExp: TProgressBar
        Left = 4
        Top = 4
        Width = 305
        Height = 17
        TabOrder = 0
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1249
    Height = 49
    Align = alTop
    Color = clWhite
    TabOrder = 1
    OnClick = Panel1Click
    DesignSize = (
      1249
      49)
    object Label8: TLabel
      Left = 314
      Top = 10
      Width = 39
      Height = 13
      Caption = 'To Date'
    end
    object Label9: TLabel
      Left = 216
      Top = 10
      Width = 52
      Height = 13
      Caption = 'From Date:'
    end
    object Label3: TLabel
      Left = 10
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Account'
    end
    object Label2: TLabel
      Left = 1131
      Top = 28
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Credit'
      Transparent = True
    end
    object Label1: TLabel
      Left = 1045
      Top = 28
      Width = 25
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Debit'
      Transparent = True
    end
    object DtStart: TDateTimePicker
      Left = 214
      Top = 25
      Width = 91
      Height = 21
      Date = 38987.000000000000000000
      Time = 38987.000000000000000000
      MaxDate = 365245.000000000000000000
      MinDate = 2.000000000000000000
      TabOrder = 0
      OnChange = DtStartChange
    end
    object dbedtFromAccount: TEdit
      Left = 11
      Top = 25
      Width = 118
      Height = 21
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 131
      Top = 25
      Width = 25
      Height = 22
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
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object Button1: TButton
      Left = 448
      Top = 20
      Width = 113
      Height = 25
      Caption = 'Export'
      TabOrder = 3
      OnClick = Button1Click
    end
    object dtEndDate: TDateTimePicker
      Left = 312
      Top = 25
      Width = 88
      Height = 21
      Date = 39349.000000000000000000
      Time = 39349.000000000000000000
      MaxDate = 365245.000000000000000000
      MinDate = 2.000000000000000000
      TabOrder = 4
      OnChange = DtStartChange
    end
    object Button2: TButton
      Left = 580
      Top = 20
      Width = 113
      Height = 25
      Caption = 'Print'
      TabOrder = 5
      OnClick = Button2Click
    end
    object bBack: TBitBtn
      Left = 732
      Top = 20
      Width = 75
      Height = 25
      Caption = '<'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      Visible = False
      OnClick = bBackClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 1249
    Height = 511
    Align = alClient
    BevelOuter = bvNone
    Color = clGray
    FullRepaint = False
    TabOrder = 2
    DesignSize = (
      1249
      511)
    object Label7: TLabel
      Left = 18
      Top = 8
      Width = 748
      Height = 13
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = '`'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape2: TShape
      Left = 0
      Top = 0
      Width = 0
      Height = 487
      Align = alClient
      Pen.Color = clWhite
      ExplicitHeight = 480
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 1249
      Height = 487
      Align = alRight
      BevelOuter = bvNone
      BorderWidth = 2
      Color = clWhite
      TabOrder = 0
      DesignSize = (
        1249
        487)
      object Shape1: TShape
        Left = 2
        Top = 2
        Width = 1245
        Height = 483
        Align = alClient
        Pen.Color = clWhite
        ExplicitHeight = 476
      end
      object Label10: TLabel
        Left = 895
        Top = 6
        Width = 82
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Opening Balance'
        Transparent = True
      end
      object Label4: TLabel
        Left = 1081
        Top = 466
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        AutoSize = False
        Caption = '0.00'
        Transparent = True
        ExplicitTop = 457
      end
      object Label5: TLabel
        Left = 968
        Top = 466
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        AutoSize = False
        Caption = '0.00'
        Transparent = True
        ExplicitTop = 457
      end
      object lblOpBal: TLabel
        Left = 968
        Top = 6
        Width = 100
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = '0.0'
        Transparent = True
      end
      object lblOpBalCt: TLabel
        Left = 1081
        Top = 6
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = '0.0'
        Transparent = True
      end
      object Panel3: TPanel
        Left = 1076
        Top = -4
        Width = 3
        Height = 465
        Anchors = [akTop, akRight, akBottom]
        BevelOuter = bvNone
        Color = clNavy
        TabOrder = 0
        object Shape3: TShape
          Left = 0
          Top = 0
          Width = 3
          Height = 465
          Align = alClient
          Brush.Color = clNavy
          Pen.Color = clNavy
          Pen.Width = 0
          ExplicitHeight = 456
        end
      end
      object wwDBGrid1: TDBGrid
        Left = 14
        Top = 9
        Width = 1224
        Height = 463
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        Color = clWhite
        DataSource = DsDr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgColumnResize, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentBiDiMode = False
        ParentFont = False
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clInactiveBorder
        TitleFont.Height = -1
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = wwDBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CONTRAACCOUNTS'
            Title.Caption = '-'
            Title.Color = clWhite
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnFace
            Title.Font.Height = -1
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 500
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WBATCHID'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WREPORTINGGROUP1ID'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WREPORTINGGROUP2ID'
            Title.Caption = '-'
            Title.Color = clWhite
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SAccount'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACCDESC'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALIAS'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 226
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SREFERENCE'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DDATE'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAMOUNTDE'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAMOUNTCR'
            Title.Caption = '-'
            Title.Color = clWhite
            Width = 89
            Visible = True
          end>
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 487
      Width = 1249
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      DesignSize = (
        1249
        24)
      object Shape5: TShape
        Left = 0
        Top = 0
        Width = 1249
        Height = 24
        Align = alClient
        Pen.Color = clWhite
      end
      object Label6: TLabel
        Left = 877
        Top = 7
        Width = 215
        Height = 13
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = 'Balance :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        ExplicitLeft = 869
      end
    end
  end
  object DsDr: TDataSource
    DataSet = QryTAccountDr
    OnDataChange = DsDrDataChange
    Left = 16
    Top = 110
  end
  object QryTAccountDr: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      
        'Select b.BINCOMEEXPENSE,b.SDescription AccDesc,a.BLASTYEAR,a.WRe' +
        'portingGroup1id, a.WReportingGroup2id,a.WDOCID,a.WBATCHID ,a.DDa' +
        'te,a.SReference,'
      'a.FAmount'
      ',a.WAccountID,'
      
        'a.BReconciled, a.FOutStandingAmount,a.WtransactionID,A.WDescript' +
        'ionID,BatCon.SAlias'
      ' ,messages.SDescription,a.WPeriodID'
      
        ' From TRANSACT a left join Batcon on (Batcon.WbatchID= a.WBatchI' +
        'd)'
      ' left join Account b on (a.WAccountID = b.Waccountid)'
      ' left join messages on (messages.WMessageId = a.WDescriptionId)'
      'Where a.DDate>=:DtStart And a.DDate<=:DtEnd')
    Left = 284
    Top = 68
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DtStart'
        Value = 32874d
      end
      item
        DataType = ftDate
        Name = 'DtEnd'
        Value = 43831d
      end>
    object QryTAccountDrDDATE: TDateTimeField
      FieldName = 'DDATE'
      DisplayFormat = 'dd-mm-yyyy'
    end
    object QryTAccountDrSREFERENCE: TStringField
      FieldName = 'SREFERENCE'
      Size = 15
    end
    object QryTAccountDrFAMOUNT: TFloatField
      FieldName = 'FAMOUNT'
      DisplayFormat = '0.00'
    end
    object QryTAccountDrWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
    end
    object QryTAccountDrBRECONCILED: TSmallintField
      FieldName = 'BRECONCILED'
    end
    object QryTAccountDrFOUTSTANDINGAMOUNT: TFloatField
      FieldName = 'FOUTSTANDINGAMOUNT'
    end
    object QryTAccountDrWTRANSACTIONID: TIntegerField
      FieldName = 'WTRANSACTIONID'
    end
    object QryTAccountDrWDESCRIPTIONID: TIntegerField
      FieldName = 'WDESCRIPTIONID'
    end
    object QryTAccountDrSALIAS: TStringField
      FieldName = 'SALIAS'
      Size = 15
    end
    object QryTAccountDrSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 35
    end
    object QryTAccountDrWBATCHID: TIntegerField
      FieldName = 'WBATCHID'
      Required = True
    end
    object QryTAccountDrWDOCID: TIntegerField
      FieldName = 'WDOCID'
    end
    object QryTAccountDrWPERIODID: TIntegerField
      FieldName = 'WPERIODID'
      Required = True
    end
    object QryTAccountDrWREPORTINGGROUP1ID: TIntegerField
      DisplayWidth = 15
      FieldName = 'WREPORTINGGROUP1ID'
      OnGetText = QryTAccountDrWREPORTINGGROUP1IDGetText
    end
    object QryTAccountDrBLASTYEAR: TSmallintField
      FieldName = 'BLASTYEAR'
    end
    object QryTAccountDrACCDESC: TStringField
      FieldName = 'ACCDESC'
      Size = 64
    end
    object QryTAccountDrWREPORTINGGROUP2ID: TIntegerField
      FieldName = 'WREPORTINGGROUP2ID'
      OnGetText = QryTAccountDrWREPORTINGGROUP2IDGetText
    end
    object QryTAccountDrBINCOMEEXPENSE: TSmallintField
      FieldName = 'BINCOMEEXPENSE'
      Required = True
    end
  end
  object qGen: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 501
    Top = 160
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 176
    Top = 147
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'Export.txt'
    Filter = 'Text files|*.txt|CSV files|*.csv|All files|*.*'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 132
    Top = 129
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 304
    Top = 160
    object CostGroup11: TMenuItem
      Caption = 'CostGroup1'
    end
    object Costgroup21: TMenuItem
      Caption = 'Costgroup2'
    end
    object Gotodocument1: TMenuItem
      Caption = 'Go to document'
      OnClick = Gotodocument1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Plugins: TMenuItem
      Caption = 'Plugins'
    end
  end
  object VirtualTable1: TVirtualTable
    Left = 848
    Top = 129
    Data = {03000000000000000000}
  end
end
