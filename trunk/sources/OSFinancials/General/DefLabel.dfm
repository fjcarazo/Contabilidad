object fmDefLabel: TfmDefLabel
  Left = 141
  Top = 91
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Define Labels'
  ClientHeight = 381
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 384
    Top = 0
    Width = 201
    Height = 340
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object lblDesc: TLabel
      Left = 22
      Top = 2
      Width = 87
      Height = 13
      Caption = 'Labels Description'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 46
      Width = 189
      Height = 6
      Shape = bsBottomLine
    end
    object DataInspector: TwwDataInspector
      Left = 10
      Top = 52
      Width = 177
      Height = 269
      DisableThemes = False
      BorderStyle = bsNone
      TabOrder = 0
      DataSource = dmDatabase.dsLabSpecs
      Items = <
        item
          DataSource = dmDatabase.dsLabSpecs
          DataField = 'SDescription'
          Caption = 'Description'
          ReadOnly = True
          TabStop = False
          WordWrap = False
        end
        item
          DataSource = dmDatabase.dsLabSpecs
          Caption = 'Page '
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FPageWidth'
              Caption = 'Width'
              Expanded = True
              WordWrap = False
            end
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FPageHeight'
              Caption = 'Height'
              WordWrap = False
            end
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FTopMargin'
              Caption = 'Top Margin'
              WordWrap = False
            end
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FLeftMargin'
              Caption = 'Left Margin'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = dmDatabase.dsLabSpecs
          Caption = 'Labels'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FWidth'
              Caption = 'Width'
              WordWrap = False
            end
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FHeight'
              Caption = 'Height'
              WordWrap = False
            end
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'WAccross'
              Caption = 'Number in across'
              WordWrap = False
            end
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'WDown'
              Caption = 'Number in down'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = dmDatabase.dsLabSpecs
          Caption = 'Gap'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FVGap'
              Caption = 'Vertical'
              WordWrap = False
            end
            item
              DataSource = dmDatabase.dsLabSpecs
              DataField = 'FHGap'
              Caption = 'Horizontal'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = dmDatabase.dsLabSpecs
          DataField = 'BPortrait'
          Caption = 'Portrait'
          CustomControl = wwDBComboBox1
          WordWrap = False
        end
        item
          DataSource = dmDatabase.dsLabSpecs
          DataField = 'WFontSize'
          Caption = 'Font size'
          WordWrap = False
        end>
      CaptionWidth = 115
      Options = [ovColumnResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      OnItemChanged = DataInspectorItemChanged
      object wwDBComboBox1: TwwDBComboBox
        Left = 116
        Top = 224
        Width = 60
        Height = 15
        TabStop = False
        ShowButton = True
        Style = csDropDownList
        MapList = False
        AllowClearKey = False
        AutoDropDown = True
        BorderStyle = bsNone
        Ctl3D = False
        DataField = 'BPortrait'
        DataSource = dmDatabase.dsLabSpecs
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          '0'
          '1')
        ParentCtl3D = False
        Picture.PictureMaskFromDataSet = False
        ReadOnly = True
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
        Visible = False
      end
    end
    object InputFilePnl: TPanel
      Left = 10
      Top = 72
      Width = 185
      Height = 221
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      OnExit = InputFilePnlExit
      object Label2: TLabel
        Left = 16
        Top = 12
        Width = 80
        Height = 13
        Caption = 'Input New Name'
      end
      object edFileName: TEdit
        Left = 16
        Top = 36
        Width = 131
        Height = 21
        TabOrder = 0
      end
      object btnOk2: TBitBtn
        Left = 16
        Top = 60
        Width = 96
        Height = 25
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOk2Click
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
      end
      object BtnCancel2: TBitBtn
        Left = 16
        Top = 92
        Width = 96
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
        OnClick = BtnCancel2Click
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
      end
    end
    object cbLabelDes: TComboBox
      Left = 22
      Top = 20
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbLabelDesChange
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 384
    Height = 340
    HorzScrollBar.Color = clWindow
    HorzScrollBar.ParentColor = False
    Align = alClient
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    object DPaperPnl: TPanel
      Left = -4
      Top = -10
      Width = 500
      Height = 417
      BevelOuter = bvNone
      TabOrder = 0
      object Panel1: TPanel
        Left = 17
        Top = 26
        Width = 410
        Height = 371
        BevelOuter = bvNone
        Color = clWindow
        TabOrder = 0
        object shHGap: TShape
          Left = -8
          Top = 88
          Width = 423
          Height = 33
          Brush.Style = bsClear
          Pen.Style = psDot
          OnMouseDown = shHGapMouseDown
        end
        object ShVGap: TShape
          Left = 140
          Top = -4
          Width = 35
          Height = 379
          Brush.Style = bsClear
          Pen.Style = psDot
          OnMouseDown = ShVGapMouseDown
        end
        object ShLeft: TShape
          Left = 0
          Top = 0
          Width = 53
          Height = 371
          Align = alLeft
          Brush.Style = bsClear
          Pen.Style = psDot
        end
        object shTop: TShape
          Left = 0
          Top = 0
          Width = 411
          Height = 37
          Brush.Style = bsClear
          Pen.Style = psDot
        end
        object Label1: TLabel
          Left = 54
          Top = 36
          Width = 83
          Height = 51
          AutoSize = False
          Caption = 'Label1'
          Color = clBtnFace
          ParentColor = False
          OnClick = Label1Click
        end
        object CoinGh: TShape
          Left = 74
          Top = 42
          Width = 6
          Height = 6
          Cursor = crSizeNWSE
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = CoinGhMouseMove
          OnMouseUp = EndMove
        end
        object PointH: TShape
          Left = 90
          Top = 42
          Width = 6
          Height = 6
          Cursor = crSizeNWSE
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = PointHMouseMove
          OnMouseUp = EndMove
        end
        object CoinDh: TShape
          Left = 113
          Top = 42
          Width = 6
          Height = 6
          Cursor = crSizeNWSE
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = CoinDhMouseMove
          OnMouseUp = EndMove
        end
        object PointD: TShape
          Left = 113
          Top = 58
          Width = 6
          Height = 6
          Cursor = crSizeNWSE
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = PointDMouseMove
          OnMouseUp = EndMove
        end
        object CoinDb: TShape
          Left = 113
          Top = 74
          Width = 6
          Height = 6
          Cursor = crSizeNWSE
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = CoinDbMouseMove
          OnMouseUp = EndMove
        end
        object PointB: TShape
          Left = 92
          Top = 74
          Width = 6
          Height = 6
          Cursor = crSizeNWSE
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = PointBMouseMove
          OnMouseUp = EndMove
        end
        object CoinGb: TShape
          Left = 74
          Top = 74
          Width = 6
          Height = 6
          Cursor = crSizeNESW
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = CoinGbMouseMove
          OnMouseUp = EndMove
        end
        object PointG: TShape
          Left = 74
          Top = 58
          Width = 6
          Height = 6
          Cursor = crSizeNWSE
          Brush.Color = clBlack
          OnMouseDown = StartMove
          OnMouseMove = PointGMouseMove
          OnMouseUp = EndMove
        end
      end
    end
  end
  object BottomPnl: TPanel
    Left = 0
    Top = 340
    Width = 585
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnCancel: TBitBtn
      Left = 478
      Top = 8
      Width = 96
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
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
    end
    object btnOk: TBitBtn
      Left = 377
      Top = 8
      Width = 96
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
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
    end
    object BtnDelete: TBitBtn
      Left = 6
      Top = 8
      Width = 99
      Height = 25
      Caption = '&Delete'
      ModalResult = 2
      TabOrder = 2
      OnClick = BtnDeleteClick
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
    end
  end
end
