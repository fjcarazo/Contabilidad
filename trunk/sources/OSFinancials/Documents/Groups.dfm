object fmGroups: TfmGroups
  Left = 178
  Top = 39
  Caption = 'Groups'
  ClientHeight = 700
  ClientWidth = 1003
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
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 666
    Width = 1003
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      1003
      34)
    object BtnClose: TBitBtn
      Left = 872
      Top = 5
      Width = 126
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
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnCloseClick
      OnKeyDown = FormKeyDown
    end
    object BtnOk: TBitBtn
      Left = 752
      Top = 5
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Print'
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
      TabOrder = 1
      OnClick = BtnPrintClick
    end
  end
  object pcmain: TPageControl
    Left = 0
    Top = 133
    Width = 1003
    Height = 533
    ActivePage = tstreeview
    Align = alClient
    TabOrder = 1
    object tstreeview: TTabSheet
      Caption = 'tstreeview'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      DesignSize = (
        995
        505)
      object Image1: TImage
        Left = 872
        Top = 156
        Width = 117
        Height = 105
        Anchors = [akTop, akRight]
        Stretch = True
      end
      object Panel1: TPanel
        Left = 7
        Top = 12
        Width = 851
        Height = 495
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderWidth = 7
        TabOrder = 0
        DesignSize = (
          851
          495)
        object TVGroups: TcxTreeView
          Left = 133
          Top = 8
          Width = 710
          Height = 479
          Align = alClient
          DragMode = dmAutomatic
          ParentFont = False
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDragDrop = TVGroupsDragDrop
          OnDragOver = TVGroupsDragOver
          OnKeyDown = FormKeyDown
          OnKeyUp = TVGroupsKeyUp
          OnMouseDown = TVGroupsMouseDown
          HideSelection = False
          Images = DMTCCoreLink.ImageList1
          Items.NodeData = {
            0301000000240000001D00000001000000FFFFFFFFFFFFFFFF00000000000000
            00000000000103710071007100}
          RightClickSelect = True
          OnChange = TVGroupsChange
          OnEditing = TVGroupsEditing
          OnEdited = TVGroupsEdited
        end
        object Panel2: TPanel
          Left = 240
          Top = 36
          Width = 570
          Height = 435
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvLowered
          BevelWidth = 2
          TabOrder = 1
          Visible = False
          OnExit = Panel2Exit
          DesignSize = (
            570
            435)
          object LEditGroup: TLabel
            Left = 20
            Top = 8
            Width = 82
            Height = 20
            Caption = 'LEditGroup'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBNavigator1: TDBNavigator
            Left = 20
            Top = 28
            Width = 512
            Height = 25
            DataSource = dsGroupDesc
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
          object btokdesc: TBitBtn
            Left = 441
            Top = 213
            Width = 103
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Ok'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 1
            OnClick = btokdescClick
          end
          object btcanceldesc: TBitBtn
            Left = 309
            Top = 213
            Width = 99
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Cancel'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = btcanceldescClick
          end
          object Panel3: TPanel
            Left = 4
            Top = 247
            Width = 562
            Height = 184
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 3
          end
          object Panel7: TPanel
            Left = 19
            Top = 56
            Width = 526
            Height = 151
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            object DBCtrlGrid1: TDBCtrlGrid
              Left = 1
              Top = 1
              Width = 524
              Height = 149
              Align = alClient
              AllowDelete = False
              AllowInsert = False
              DataSource = dsGroupDesc
              PanelHeight = 74
              PanelWidth = 507
              TabOrder = 0
              RowCount = 2
              SelectedColor = clActiveBorder
              object LDesc: TLabel
                Left = 4
                Top = 37
                Width = 53
                Height = 13
                Caption = 'Description'
                FocusControl = DBEdit1
              end
              object LLang: TLabel
                Left = 4
                Top = 1
                Width = 48
                Height = 13
                Caption = 'Language'
                FocusControl = DBLookupComboBox1
              end
              object DBEdit1: TDBEdit
                Left = 3
                Top = 50
                Width = 497
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'SDESCRIPTION'
                DataSource = dsGroupDesc
                TabOrder = 0
              end
              object DBLookupComboBox1: TDBLookupComboBox
                Left = 2
                Top = 15
                Width = 498
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'Lookuplang'
                DataSource = dsGroupDesc
                Enabled = False
                ReadOnly = True
                TabOrder = 1
              end
            end
          end
        end
        object PgrActions: TPanel
          Left = 8
          Top = 8
          Width = 125
          Height = 479
          Align = alLeft
          TabOrder = 2
          object bgrnew: TBitBtn
            Left = 8
            Top = 12
            Width = 109
            Height = 25
            Caption = 'bgrnew'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 0
            OnClick = bgrnewClick
          end
          object bgredit: TBitBtn
            Left = 8
            Top = 48
            Width = 109
            Height = 25
            Caption = 'bgredit'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 1
            OnClick = bgreditClick
          end
          object bgrdelete: TBitBtn
            Left = 8
            Top = 84
            Width = 109
            Height = 25
            Caption = 'bgrdelete'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = bgrdeleteClick
          end
          object bgrMoveUp: TBitBtn
            Left = 8
            Top = 120
            Width = 109
            Height = 25
            Caption = 'bgrMoveUp'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 3
            OnClick = bgrMoveUpClick
          end
          object bGrMoveDown: TBitBtn
            Left = 8
            Top = 156
            Width = 109
            Height = 25
            Caption = 'bGrMoveDown'
            DoubleBuffered = True
            ParentDoubleBuffered = False
            TabOrder = 4
            OnClick = bGrMoveDownClick
          end
        end
      end
      object cbEnabled: TCheckBox
        Left = 872
        Top = 124
        Width = 117
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'Disable'
        TabOrder = 1
        OnClick = cbEnabledClick
      end
      object PBackColor: TPanel
        Left = 872
        Top = 276
        Width = 117
        Height = 37
        Anchors = [akTop, akRight]
        Caption = 'PBackColor'
        ParentBackground = False
        TabOrder = 2
        object BBackColor: TSpeedButton
          Left = 16
          Top = 7
          Width = 89
          Height = 22
          Caption = 'Back Color'
          OnClick = BBackColorClick
        end
      end
      object PFontColor: TPanel
        Left = 872
        Top = 320
        Width = 117
        Height = 37
        Anchors = [akTop, akRight]
        Caption = 'Panel2'
        ParentBackground = False
        TabOrder = 3
        object bFontColor: TSpeedButton
          Left = 16
          Top = 7
          Width = 89
          Height = 22
          Caption = 'Font Color'
          OnClick = bFontColorClick
        end
      end
      object Pexample: TPanel
        Left = 868
        Top = 368
        Width = 121
        Height = 29
        Anchors = [akTop, akRight]
        Caption = 'Example'
        ParentBackground = False
        TabOrder = 4
      end
    end
    object tsListview: TTabSheet
      Caption = 'tsListview'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pcnewsearch: TPageControl
        Left = 0
        Top = 0
        Width = 995
        Height = 505
        ActivePage = tsSearch
        Align = alClient
        TabOrder = 0
        object tsSearch: TTabSheet
          Caption = 'tsSearch'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 987
            Height = 37
            Align = alTop
            TabOrder = 0
            object Button1: TButton
              Left = 100
              Top = 8
              Width = 75
              Height = 25
              Caption = 'New'
              TabOrder = 0
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 188
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Delete'
              TabOrder = 1
              OnClick = Button2Click
            end
            object Button5: TButton
              Left = 8
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Edit'
              TabOrder = 2
              OnClick = Button5Click
            end
          end
        end
        object tsDetail: TTabSheet
          Caption = 'tsDetail'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 987
            Height = 93
            Align = alTop
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 44
              Width = 53
              Height = 13
              Caption = 'Description'
              FocusControl = DBEdit2
            end
            object Button3: TButton
              Left = 16
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Post'
              TabOrder = 0
              OnClick = Button3Click
            end
            object bCancelDetail: TButton
              Left = 112
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Cancel'
              TabOrder = 1
              OnClick = bCancelDetailClick
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 60
              Width = 394
              Height = 21
              DataField = 'SDESCRIPTION'
              DataSource = dmDatabase.dsGroups
              TabOrder = 2
            end
          end
          object PageControl1: TPageControl
            Left = 0
            Top = 93
            Width = 987
            Height = 384
            Align = alClient
            TabOrder = 1
          end
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 1003
    Height = 133
    Align = alTop
    TabOrder = 2
    DesignSize = (
      1003
      133)
    object Shape2: TShape
      Left = 4
      Top = 87
      Width = 957
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clMoneyGreen
      Shape = stRoundRect
    end
    object Label2: TLabel
      Left = 10
      Top = 92
      Width = 112
      Height = 13
      Caption = 'Reporting Group Name:'
      Transparent = True
    end
    object GroupControl: TcxPageControl
      Left = 1
      Top = 1
      Width = 1001
      Height = 80
      Align = alTop
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      MultiLine = True
      Style = 2
      TabOrder = 1
      OnChange = GroupControlChange
      ClientRectBottom = 80
      ClientRectRight = 1001
      ClientRectTop = 0
    end
    object edtGroupName: TEdit
      Left = 136
      Top = 89
      Width = 263
      Height = 21
      MaxLength = 30
      TabOrder = 0
      Visible = False
      OnExit = edtGroupNameExit
      OnKeyPress = edtGroupNameKeyPress
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 32
    Top = 308
    object Editname1: TMenuItem
      Caption = 'Edit name'
      OnClick = Editname1Click
    end
    object LinkImage1: TMenuItem
      Caption = 'Link Image'
      OnClick = LinkImage1Click
    end
    object ranslations1: TMenuItem
      Caption = 'Translations'
      OnClick = Translations1Click
    end
    object Doall1: TMenuItem
      Caption = 'Do all'
      OnClick = Doall1Click
    end
    object Clearimage1: TMenuItem
      Caption = 'Clear image'
      OnClick = Clearimage1Click
    end
  end
  object ZQType: TUniQuery
    DataTypeMap = <>
    Left = 35
    Top = 225
  end
  object OpenDialog1: TOpenDialog
    Left = 51
    Top = 412
  end
  object ColorDialog1: TColorDialog
    Left = 756
    Top = 412
  end
  object ZQGroupDesc: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'select * from GROUPS_DESCRIPTIONS where WGroupid = :GROUPid')
    UpdateObject = ZUSQLGroupDesc
    BeforeOpen = ZQGroupDescBeforeOpen
    AfterInsert = ZQGroupDescAfterInsert
    AfterScroll = ZQGroupDescAfterScroll
    Left = 339
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GROUPid'
      end>
    object ZQGroupDescWGROUPDESCID: TIntegerField
      FieldName = 'WGROUPDESCID'
      Required = True
    end
    object ZQGroupDescWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQGroupDescWLANGUAGEID: TIntegerField
      FieldName = 'WLANGUAGEID'
      Required = True
    end
    object ZQGroupDescSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Required = True
      Size = 50
    end
    object ZQGroupDescLookuplang: TStringField
      FieldKind = fkLookup
      FieldName = 'Lookuplang'
      LookupDataSet = ZQLangs
      LookupKeyFields = 'WGROUPID'
      LookupResultField = 'SDESCRIPTION'
      KeyFields = 'WLANGUAGEID'
      Size = 50
      Lookup = True
    end
  end
  object ZQLangs: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    SQL.Strings = (
      'Select * from groups where WGroupTypeid = 1004')
    Left = 411
    Top = 132
    object ZQLangsWGROUPID: TIntegerField
      FieldName = 'WGROUPID'
      Required = True
    end
    object ZQLangsWGROUPTYPEID: TIntegerField
      FieldName = 'WGROUPTYPEID'
    end
    object ZQLangsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 30
    end
    object ZQLangsWPARENTGROUP2ID: TIntegerField
      FieldName = 'WPARENTGROUP2ID'
    end
    object ZQLangsWPARENTGROUP1ID: TIntegerField
      FieldName = 'WPARENTGROUP1ID'
    end
    object ZQLangsDSYSDATE: TDateTimeField
      FieldName = 'DSYSDATE'
    end
    object ZQLangsWSORTNO: TIntegerField
      FieldName = 'WSORTNO'
    end
    object ZQLangsBDISABLE: TSmallintField
      FieldName = 'BDISABLE'
    end
    object ZQLangsWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQLangsWTEXTCOLOR: TIntegerField
      FieldName = 'WTEXTCOLOR'
    end
  end
  object dsGroupDesc: TDataSource
    DataSet = ZQGroupDesc
    Left = 400
    Top = 424
  end
  object ZUSQLGroupDesc: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO GROUPS_DESCRIPTIONS'
      
        '  (GROUPS_DESCRIPTIONS.WGROUPID, GROUPS_DESCRIPTIONS.WLANGUAGEID' +
        ', GROUPS_DESCRIPTIONS.SDESCRIPTION, '
      '   GROUPS_DESCRIPTIONS.WGROUPDESCID)'
      'VALUES'
      '  (:WGROUPID, :WLANGUAGEID, :SDESCRIPTION, :WGROUPDESCID)')
    DeleteSQL.Strings = (
      'DELETE FROM GROUPS_DESCRIPTIONS'
      'WHERE'
      '  GROUPS_DESCRIPTIONS.WGROUPDESCID = :OLD_WGROUPDESCID')
    ModifySQL.Strings = (
      'UPDATE GROUPS_DESCRIPTIONS SET'
      '  GROUPS_DESCRIPTIONS.WGROUPID = :WGROUPID,'
      '  GROUPS_DESCRIPTIONS.WLANGUAGEID = :WLANGUAGEID,'
      '  GROUPS_DESCRIPTIONS.SDESCRIPTION = :SDESCRIPTION,'
      '  GROUPS_DESCRIPTIONS.WGROUPDESCID = :WGROUPDESCID'
      'WHERE'
      '  GROUPS_DESCRIPTIONS.WGROUPDESCID = '
      ':OLD_WGROUPDESCID')
    Left = 183
    Top = 136
  end
end
