object fmCreationCompWiz: TfmCreationCompWiz
  Left = 10
  Top = 10
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = 'Creation Wizard'
  ClientHeight = 399
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 523
    Height = 63
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object LblMessages: TLabel
      Left = 7
      Top = 6
      Width = 392
      Height = 49
      AutoSize = False
      Caption = 
        'Welcome to the TurboCASH set of books creation wizard. Please se' +
        'lect an option and click next , or Cancel to cancel creating a n' +
        'ew set of books. '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
  object rgPanel: TPanel
    Left = 93
    Top = 63
    Width = 430
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ButtonPanel: TPanel
      Left = 0
      Top = 282
      Width = 430
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object BtnBack: TBitBtn
        Left = 6
        Top = 6
        Width = 90
        Height = 25
        Caption = '&Back'
        DoubleBuffered = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFCFCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAC7B18B93753EFCFBFBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDCEB5A175
          26986101906B2DFCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFEEE6D8AF8B4A9A64029B65039B6402926D2DFCFBFBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F0C3A7749C67089F67049F66049F66
          049F6604936F2EFCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED5C09CA3
          721BA16A06A26905A16A07A26906A16A07A2690596702FFCFBFBFFFFFFFFFFFF
          FFFFFFFFFFFFE7DAC4AF8337A56C09A66D09A66D09A66D09A66D09A66D09A66D
          09A66D09987230FCFCFBFFFFFFFFFFFFF5EFE5BD9B5DA86F0BAA710BAA720CAA
          710BAA720CAA710BAA720CAA710BAA720CAA710B9B7432FCFCFBFFFFFFFFFFFF
          C4A05FAB730DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE74
          0DAE740D9C7733FCFCFBFFFFFFFFFFFFFFFFFFE5D4B6B7872FB0770FB27910B2
          780FB27910B2780FB27910B2780FB27910B2780FA07934FCFCFBFFFFFFFFFFFF
          FFFFFFFFFFFFFDFCFAD9BF90B47E1BB57B11B67B11B67B11B67B11B67B11B67B
          11B67B11A27B35FCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F2E9CE
          AA6AB67C12B97E14B98015B97F14B98015B97F14A47D36FCFCFBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE3CEC69947BA8015BD8116BD81
          16BD8116A67E37FCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE4D0AAC08C2BBE8317BF8418A78038FCFCFBFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9F5D8BA
          83BF851DB1883DFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EEE2DEC496FFFFFF}
        ParentDoubleBuffered = False
        TabOrder = 0
        TabStop = False
        OnClick = BtnBackClick
      end
      object BtnNext: TBitBtn
        Left = 97
        Top = 6
        Width = 90
        Height = 25
        Caption = '&Next'
        DoubleBuffered = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF93753EC7B18BFCFBFAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF906B2D
          986101A17526DDCEB5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF926D2D9B64029B65039A6402AF8B4AEEE6D8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF936F2E
          9F66049F66049F66049F67049C6708C3A774F9F6F0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF96702FA26905A16A07A26906A16A07A26905A1
          6A06A3721BD5C09CFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF987230
          A66D09A66D09A66D09A66D09A66D09A66D09A66D09A56C09AF8337E7DAC4FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9B7432AA710BAA720CAA710BAA720CAA710BAA
          720CAA710BAA720CAA710BA86F0BBD9B5DF5EFE5FFFFFFFFFFFFFFFFFF9C7733
          AE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAE740DAB73
          0DC4A05FFFFFFFFFFFFFFFFFFFA07934B2780FB27910B2780FB27910B2780FB2
          7910B2780FB27910B0770FB7872FE5D4B6FFFFFFFFFFFFFFFFFFFFFFFFA27B35
          B67B11B67B11B67B11B67B11B67B11B67B11B57B11B47E1BD9BF90FDFCFAFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFA47D36B97F14B98015B97F14B98015B97E14B6
          7C12CEAA6AF7F2E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA67E37
          BD8116BD8116BD8116BA8015C69947EFE3CEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFA78038BF8418BE8317C08C2BE4D0AAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1883D
          BF851DD8BA83FBF9F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFDEC496FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Layout = blGlyphRight
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BtnNextClick
      end
      object btnCancel: TBitBtn
        Left = 289
        Top = 6
        Width = 90
        Height = 25
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
        TabOrder = 2
        TabStop = False
        OnClick = btnCancelClick
      end
      object BtnFinish: TBitBtn
        Left = 193
        Top = 6
        Width = 90
        Height = 25
        Caption = '&Finish'
        DoubleBuffered = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFAFAFAFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFB7AB95BA9D69F7F4EFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF2F1EFBDBCB9958365A69371D7CAB4FFFFFFFFFFFFFFFFFFB5A68B
          9861019D6D17D6C4A3FFFFFFFFFFFFFFFFFFFFFFFFF1F0EEABA59B9962019861
          01BD9C62FFFFFFFFFFFFFFFFFFB6A78B9B63029B64039A6302B08942EDE6D9FF
          FFFFFFFFFFF2F0EEABA59B9C64029B6301BE9D63FFFFFFFFFFFFFFFFFFB7A88C
          9E66049E66049E66049E66049D680AC7AD80FBFAF8F2F0EEABA59B9F66049E66
          04C09E64FFFFFFFFFFFFFFFFFFB8A88CA26A06A26B07A26906A26B07A26906A1
          6A07A87928C6BDABADA79DA26A06A26906C2A065FFFFFFFFFFFFFFFFFFB9A98D
          A66D08A66C08A66C08A66C08A66C08A66C08A66D08A66D099B752FA56C09A66C
          08C4A266FFFFFFFFFFFFFFFFFFBAAA8DAA700BAA720CAA710BAA720CAA710BAA
          720CAA710BAA720CAA710BAA720CAA710BC5A367FFFFFFFFFFFFFFFFFFBBAA8E
          AE740DAE730DAE730DAE730DAE730DAE730DAE730DAE730DAE730DAE730DAE73
          0DC9A568FFFFFFFFFFFFFFFFFFBCAB8EB2780FB27910B2780FB27910B2780FB2
          7910B2780FB27910B1770FB27910B2780FCAA869FFFFFFFFFFFFFFFFFFBDAC8F
          B57B12B67B12B67B12B67B12B67B12B67B12B57B12B07B1D9D8459B57A12B67B
          12CDAA6AFFFFFFFFFFFFFFFFFFBDAD8FB97E14B87F15B87E14B87F15B97E14B6
          7C12CCA96AE6E3DCAEA79CB97E13B97E14CFAB6BFFFFFFFFFFFFFFFFFFBFAE90
          BC8116BD8116BD8116BB8015C2933CEBDEC8FFFFFFF3F1EEAEA89CBD8115BD81
          16D1AD6CFFFFFFFFFFFFFFFFFFBFAF90BF8417BF8418BD8620DEC496FEFEFEFF
          FFFFFFFFFFF3F1EEAFA89CBF8416BF8417D2AE6DFFFFFFFFFFFFFFFFFFCFBB97
          BF8417CFA860F6F1E6FFFFFFFFFFFFFFFFFFFFFFFFF7F7F5BAB3A7C18517C185
          18D3AF6DFFFFFFFFFFFFFFFFFFECDEC5E8D6B6FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F2E0CFB0E0CFB0EEE4D3FFFFFFFFFFFF}
        ParentDoubleBuffered = False
        TabOrder = 3
        OnClick = BtnFinishClick
      end
    end
    object nbCreate: TNotebook
      Left = 0
      Top = 0
      Width = 430
      Height = 282
      Align = alClient
      PageIndex = 1
      TabOrder = 0
      OnPageChanged = nbCreatePageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Default'
        object rgOptions: TGroupBox
          Left = 8
          Top = 12
          Width = 337
          Height = 205
          Caption = 'Do you wish to :'
          TabOrder = 0
          object index0: TRadioButton
            Left = 6
            Top = 18
            Width = 283
            Height = 17
            Caption = 'Convert from an older TurboCASH (v 2.01 2.02, 2.03) ?'
            Enabled = False
            TabOrder = 0
            Visible = False
          end
          object index1: TRadioButton
            Left = 6
            Top = 44
            Width = 283
            Height = 17
            Caption = 'Copy an existing set of books ?'
            TabOrder = 1
          end
          object index2: TRadioButton
            Left = 6
            Top = 70
            Width = 283
            Height = 17
            Caption = 'Let TurboCASH help you to create a set of books ?'
            Checked = True
            TabOrder = 2
            TabStop = True
          end
          object index3: TRadioButton
            Left = 6
            Top = 96
            Width = 283
            Height = 17
            Caption = 'Customise your own set of books (Advanced) ?'
            TabOrder = 3
          end
          object index4: TRadioButton
            Left = 6
            Top = 122
            Width = 283
            Height = 17
            Caption = 'Convert From Pastel ?'
            TabOrder = 4
          end
          object index5: TRadioButton
            Left = 6
            Top = 170
            Width = 283
            Height = 17
            Caption = 'Connect to remote Database'
            TabOrder = 5
          end
          object index6: TRadioButton
            Left = 6
            Top = 146
            Width = 283
            Height = 17
            Caption = 'Convert TC4 to osFinancials ?'
            TabOrder = 6
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SelectBookstoCopy'
        DesignSize = (
          430
          282)
        object sbBrowse: TSpeedButton
          Left = 332
          Top = 211
          Width = 89
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Browse'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000000000001483
            EF001985EF003994F00019A1F6001AA6F50063ACD60067B2D80067B3F50069B8
            F40034C6F90031C9FC0038D8FD0079CADD004DF5FD00948F8F00969191009894
            93009C9797009E999900A19C9C00A49E9E00A6A19F00A6A2A100A8A3A300A8A4
            A100ACA6A300A8A4A400AFA9A900B0A9AA00B1ADAD00B6B1B100B9B5B500BCB7
            B700BEB8B900C1BDBD00C4BEBF00DBCFB500DACFB900D9D0BE00FEE1A400FEE2
            AA00FEE4AB00FEE3AD00FDE4AE00FEE7B500F3E1B900F2E2BE00FEE6B900FDE7
            BE00FFEABF0083C4F7008AC8F400C3C3C500C7C6C700C8C5C500CCC7C700C4C7
            CA00CDC9CA00CACACC00D2CECE00D9D2C700D7D2CC00D8D1CA00D5D1D100DDDA
            DA00DFDCDC00E1DEDE00F2E3C000F3E6C300FEE9C100FEE9C500F4E6C900FEEB
            CC00FEEFCD00F3E7D000FDEDD200F2E9DA00F1E9DD00FFF3DC00EDEAEA00EFEC
            EC00F0EDEE000000000000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF330203FFFFFFFFFFFFFFFFFFFFFFFF34050E0A03FFFFFFFFFF1B
            111017363B070E0C0B01FFFFFF141F23221F1D1406060D0B0508FFFF1741401E
            1411141E1C063C0609FFFF175040173F4E4E3F131B1E0639FFFFFF3B521B4B46
            464C4C4E131C1436FFFF205038272C2C3046494C3F141E14FFFF1B521E442C28
            2C3046494E11200FFFFF1B431E2F322D282C30464E142110FFFF203B2025494F
            2D282C313F1E2316FFFFFF1F381B454A462C2C48163C2038FFFFFF1B23231A25
            2F2E261B404314FFFFFFFFFF1B2338211E1E3850501BFFFFFFFFFFFFFF1B1F3B
            4350524017FFFFFFFFFFFFFFFFFFFF1F1B1B1F40FFFFFFFFFFFF}
          OnClick = sbBrowseClick
          ExplicitLeft = 350
          ExplicitTop = 186
        end
        object cxGrid1: TcxGrid
          Left = 8
          Top = 4
          Width = 315
          Height = 235
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DSBooks
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Header = False
            Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
            object cxGrid1DBTableView1Bookname: TcxGridDBColumn
              DataBinding.FieldName = 'Bookname'
            end
            object cxGrid1DBTableView1Database: TcxGridDBColumn
              DataBinding.FieldName = 'Database'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGrid1DBTableView1Server: TcxGridDBColumn
              DataBinding.FieldName = 'Server'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGrid1DBTableView1ID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object lblDir1: TcxDBLabel
          Left = 8
          Top = 245
          Anchors = [akLeft, akRight, akBottom]
          DataBinding.DataField = 'database'
          DataBinding.DataSource = DSBooks
          Height = 21
          Width = 419
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'GetNameofset'
        object LblLocation: TLabel
          Left = 28
          Top = 152
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Location :'
        end
        object LblFolder: TLabel
          Left = 26
          Top = 176
          Width = 51
          Height = 13
          Caption = 'C:\Tcash3'
        end
        object Label1: TLabel
          Left = 26
          Top = 97
          Width = 127
          Height = 13
          Caption = 'Name for new set of books'
        end
        object SpeedButton1: TSpeedButton
          Left = 81
          Top = 145
          Width = 104
          Height = 25
          Caption = '&Browse'
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000000000001483
            EF001985EF003994F00019A1F6001AA6F50063ACD60067B2D80067B3F50069B8
            F40034C6F90031C9FC0038D8FD0079CADD004DF5FD00948F8F00969191009894
            93009C9797009E999900A19C9C00A49E9E00A6A19F00A6A2A100A8A3A300A8A4
            A100ACA6A300A8A4A400AFA9A900B0A9AA00B1ADAD00B6B1B100B9B5B500BCB7
            B700BEB8B900C1BDBD00C4BEBF00DBCFB500DACFB900D9D0BE00FEE1A400FEE2
            AA00FEE4AB00FEE3AD00FDE4AE00FEE7B500F3E1B900F2E2BE00FEE6B900FDE7
            BE00FFEABF0083C4F7008AC8F400C3C3C500C7C6C700C8C5C500CCC7C700C4C7
            CA00CDC9CA00CACACC00D2CECE00D9D2C700D7D2CC00D8D1CA00D5D1D100DDDA
            DA00DFDCDC00E1DEDE00F2E3C000F3E6C300FEE9C100FEE9C500F4E6C900FEEB
            CC00FEEFCD00F3E7D000FDEDD200F2E9DA00F1E9DD00FFF3DC00EDEAEA00EFEC
            EC00F0EDEE000000000000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF330203FFFFFFFFFFFFFFFFFFFFFFFF34050E0A03FFFFFFFFFF1B
            111017363B070E0C0B01FFFFFF141F23221F1D1406060D0B0508FFFF1741401E
            1411141E1C063C0609FFFF175040173F4E4E3F131B1E0639FFFFFF3B521B4B46
            464C4C4E131C1436FFFF205038272C2C3046494C3F141E14FFFF1B521E442C28
            2C3046494E11200FFFFF1B431E2F322D282C30464E142110FFFF203B2025494F
            2D282C313F1E2316FFFFFF1F381B454A462C2C48163C2038FFFFFF1B23231A25
            2F2E261B404314FFFFFFFFFF1B2338211E1E3850501BFFFFFFFFFFFFFF1B1F3B
            4350524017FFFFFFFFFFFFFFFFFFFF1F1B1B1F40FFFFFFFFFFFF}
          OnClick = SpeedButton1Click
        end
        object lblToCopy: TLabel
          Left = 34
          Top = 18
          Width = 106
          Height = 13
          Caption = 'Set of Books to Copy :'
        end
        object Label2: TLabel
          Left = 53
          Top = 38
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Name :'
        end
        object Label3: TLabel
          Left = 40
          Top = 62
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Location :'
        end
        object lblToCopyName: TLabel
          Left = 94
          Top = 38
          Width = 75
          Height = 13
          Caption = 'lblToCopyName'
        end
        object lblToCopyLoc: TLabel
          Left = 94
          Top = 62
          Width = 65
          Height = 13
          Caption = 'lblToCopyLoc'
        end
        object edtNewName: TEdit
          Left = 24
          Top = 115
          Width = 249
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 15
          ParentFont = False
          TabOrder = 0
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'SelectBooksToCnv'
        object Label12: TLabel
          Left = 22
          Top = 185
          Width = 108
          Height = 13
          Caption = 'C:\Windows\system32'
        end
        object DriveComboBox1: TDriveComboBox
          Left = 12
          Top = 14
          Width = 201
          Height = 19
          DirList = dlbOldBooks
          TabOrder = 0
        end
        object dlbOldBooks: TDirectoryListBox
          Left = 12
          Top = 36
          Width = 201
          Height = 143
          DirLabel = Label12
          TabOrder = 1
        end
        object ProgressPanel: TPanel
          Left = 6
          Top = -2
          Width = 297
          Height = 181
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object Label11: TLabel
            Left = 16
            Top = 29
            Width = 124
            Height = 13
            Caption = 'Creating set of accounts...'
          end
          object ProgressBar1: TProgressBar
            Left = 16
            Top = 129
            Width = 273
            Height = 25
            Max = 10
            Step = 6
            TabOrder = 0
          end
          object Animate2: TAnimate
            Left = 32
            Top = 48
            Width = 272
            Height = 60
            CommonAVI = aviCopyFiles
            StopFrame = 34
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Tmp'
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Customise1'
        object Label4: TLabel
          Left = 59
          Top = 56
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Creditors Control'
        end
        object Label5: TLabel
          Left = 63
          Top = 88
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Debtors Control'
        end
        object Label6: TLabel
          Left = 49
          Top = 120
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Retained Earnings'
        end
        object lblOption0: TLabel
          Left = 244
          Top = 25
          Width = 76
          Height = 13
          Caption = '- Company Infos'
        end
        object lblOption2: TLabel
          Left = 244
          Top = 70
          Width = 40
          Height = 13
          Caption = '- Groups'
        end
        object lblOption3: TLabel
          Left = 244
          Top = 92
          Width = 52
          Height = 13
          Caption = '- Salesman'
        end
        object lblOption4: TLabel
          Left = 244
          Top = 115
          Width = 66
          Height = 13
          Caption = '- Batch Types'
        end
        object lblOption5: TLabel
          Left = 244
          Top = 137
          Width = 92
          Height = 13
          Caption = '- Documents set up'
        end
        object lblOption6: TLabel
          Left = 244
          Top = 160
          Width = 54
          Height = 13
          Caption = '- Stock info'
        end
        object NextOptionAr: TImage
          Left = 216
          Top = 24
          Width = 23
          Height = 16
          Picture.Data = {
            07544269746D6170F6000000424DF60000000000000076000000280000001000
            0000100000000100040000000000800000000000000000000000100000001000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00888888888888888888888888888888888888888888888888888888888088
            888888888888800888888888888880E088888800000000EE0888880EEEEEEEEE
            E088880EEEEEEEEEE0888800000000EE08888888888880E08888888888888008
            8888888888888088888888888888888888888888888888888888888888888888
            8888}
          Stretch = True
        end
        object lblOption1: TLabel
          Left = 244
          Top = 47
          Width = 86
          Height = 13
          Caption = '- Financial Periods'
        end
        object LAccountDigets: TLabel
          Left = 69
          Top = 25
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Account digits'
        end
        object edtCredControl: TEdit
          Left = 140
          Top = 50
          Width = 49
          Height = 21
          MaxLength = 3
          TabOrder = 0
          OnExit = edtCredControlExit
          OnKeyPress = FormKeyPress
        end
        object edtDebtorsControl: TEdit
          Left = 140
          Top = 82
          Width = 49
          Height = 21
          MaxLength = 3
          TabOrder = 1
          OnExit = edtDebtorsControlExit
          OnKeyPress = FormKeyPress
        end
        object edtRetainedEarnings: TEdit
          Left = 140
          Top = 114
          Width = 49
          Height = 21
          MaxLength = 3
          TabOrder = 2
          OnExit = edtRetainedEarningsExit
          OnKeyPress = FormKeyPress
        end
        object ProgressBar: TProgressBar
          Left = 14
          Top = 182
          Width = 219
          Height = 16
          TabOrder = 3
          Visible = False
        end
        object EAccountDigets: TEdit
          Left = 140
          Top = 24
          Width = 49
          Height = 21
          ReadOnly = True
          TabOrder = 4
          Text = '3'
          OnChange = EAccountDigetsChange
        end
        object UpDown1: TUpDown
          Left = 189
          Top = 24
          Width = 15
          Height = 21
          Associate = EAccountDigets
          Min = 3
          Max = 8
          Position = 3
          TabOrder = 5
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Tmp2'
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'LetTcHelp0'
        DesignSize = (
          430
          282)
        object BitBtn1: TBitBtn
          Left = 300
          Top = 210
          Width = 87
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = '&Browse'
          DoubleBuffered = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000000000001483
            EF001985EF003994F00019A1F6001AA6F50063ACD60067B2D80067B3F50069B8
            F40034C6F90031C9FC0038D8FD0079CADD004DF5FD00948F8F00969191009894
            93009C9797009E999900A19C9C00A49E9E00A6A19F00A6A2A100A8A3A300A8A4
            A100ACA6A300A8A4A400AFA9A900B0A9AA00B1ADAD00B6B1B100B9B5B500BCB7
            B700BEB8B900C1BDBD00C4BEBF00DBCFB500DACFB900D9D0BE00FEE1A400FEE2
            AA00FEE4AB00FEE3AD00FDE4AE00FEE7B500F3E1B900F2E2BE00FEE6B900FDE7
            BE00FFEABF0083C4F7008AC8F400C3C3C500C7C6C700C8C5C500CCC7C700C4C7
            CA00CDC9CA00CACACC00D2CECE00D9D2C700D7D2CC00D8D1CA00D5D1D100DDDA
            DA00DFDCDC00E1DEDE00F2E3C000F3E6C300FEE9C100FEE9C500F4E6C900FEEB
            CC00FEEFCD00F3E7D000FDEDD200F2E9DA00F1E9DD00FFF3DC00EDEAEA00EFEC
            EC00F0EDEE000000000000000000000000000000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFF330203FFFFFFFFFFFFFFFFFFFFFFFF34050E0A03FFFFFFFFFF1B
            111017363B070E0C0B01FFFFFF141F23221F1D1406060D0B0508FFFF1741401E
            1411141E1C063C0609FFFF175040173F4E4E3F131B1E0639FFFFFF3B521B4B46
            464C4C4E131C1436FFFF205038272C2C3046494C3F141E14FFFF1B521E442C28
            2C3046494E11200FFFFF1B431E2F322D282C30464E142110FFFF203B2025494F
            2D282C313F1E2316FFFFFF1F381B454A462C2C48163C2038FFFFFF1B23231A25
            2F2E261B404314FFFFFFFFFF1B2338211E1E3850501BFFFFFFFFFFFFFF1B1F3B
            4350524017FFFFFFFFFFFFFFFFFFFF1F1B1B1F40FFFFFFFFFFFF}
          ParentDoubleBuffered = False
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object cxGrid2: TcxGrid
          Left = 12
          Top = 8
          Width = 271
          Height = 229
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          object cxGridDBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = DSBooks
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Header = False
            Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
            object cxGridDBColumn1: TcxGridDBColumn
              DataBinding.FieldName = 'Bookname'
            end
            object cxGridDBColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'Database'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGridDBColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'Server'
              Visible = False
              VisibleForCustomization = False
            end
            object cxGridDBColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              VisibleForCustomization = False
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
        object lblDir: TcxDBLabel
          Left = 6
          Top = 237
          Anchors = [akLeft, akRight, akBottom]
          DataBinding.DataField = 'database'
          DataBinding.DataSource = DSBooks
          Height = 39
          Width = 405
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'LetTcHelp1'
        object Label19: TLabel
          Left = 55
          Top = 55
          Width = 159
          Height = 13
          Caption = 'Do you want in your financial year'
          WordWrap = True
        end
        object Label16: TLabel
          Left = 55
          Top = 86
          Width = 196
          Height = 13
          Caption = 'Do you want to Change your batch types.'
          WordWrap = True
        end
        object Label28: TLabel
          Left = 55
          Top = 116
          Width = 175
          Height = 13
          Caption = 'Do you want to Change your Groups.'
          WordWrap = True
        end
        object Label18: TLabel
          Left = 56
          Top = 177
          Width = 106
          Height = 13
          Caption = 'Change Salesman info'
        end
        object Label17: TLabel
          Left = 55
          Top = 25
          Width = 107
          Height = 13
          Caption = 'Change Company info.'
        end
        object Label7: TLabel
          Left = 55
          Top = 147
          Width = 95
          Height = 13
          Caption = 'Are you using Stock'
          WordWrap = True
        end
        object CbStep11: TCheckBox
          Left = 16
          Top = 55
          Width = 21
          Height = 13
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 0
        end
        object CbStep12: TCheckBox
          Left = 16
          Top = 86
          Width = 21
          Height = 13
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 1
        end
        object CbStep13: TCheckBox
          Left = 16
          Top = 116
          Width = 21
          Height = 13
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 2
        end
        object cbStock: TCheckBox
          Left = 16
          Top = 147
          Width = 21
          Height = 13
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 3
        end
        object CbChangeCompData: TCheckBox
          Left = 16
          Top = 25
          Width = 21
          Height = 13
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 4
        end
        object cbChangeSalesman: TCheckBox
          Left = 16
          Top = 177
          Width = 21
          Height = 13
          Alignment = taLeftJustify
          BiDiMode = bdLeftToRight
          Checked = True
          ParentBiDiMode = False
          State = cbChecked
          TabOrder = 5
        end
      end
    end
  end
  object LftPanel: TPanel
    Left = 0
    Top = 63
    Width = 93
    Height = 317
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 93
      Height = 317
      Align = alClient
      Picture.Data = {
        07544269746D617006EE0000424D06EE0000000000003604000028000000A900
        00005C0100000100080000000000D0E900000000000000000000000100000001
        0000EDB4E500EDBCE500F5BCE500FFBCE500EDC4E500F5C4E500E4B4F400EDB4
        F400F5B4F400E4BCF400EDBCF400F5BCF400FFBCF400EDC4F400F5C4F400FFC4
        F400E4B4FF00E4BCFF00EDBCFF00F5BCFF00FFBCFF00E4C4FF00EDC4FF00F5C4
        FF00FFC4FF00FFC4FF00EDCDFF00F5CDFF00FFCDFF00FFCDFF00EDB4FF00E4BC
        FF00EDBCFF00F5BCFF00FFBCFF00E4C4FF00EDC4FF00F5C4FF00FFC4FF00FFC4
        FF00EDCDFF00F5CDFF00FFCDFF00FFCDFF00FFD6FF00E4C4FF00EDC4FF00F5C4
        FF00FFC4FF00EDCDFF00F5CDFF00FFCDFF00FFCDFF00F5D6FF00FFD6FF00FFD6
        FF00FFD6FF00E4C4FF00EDC4FF00F5C4FF00FFC4FF00FFC4FF00EDCDFF00F5CD
        FF00FFCDFF00FFCDFF00EDD6FF00F5D6FF00FFD6FF00FFD6FF00FFD6FF00F5DE
        FF00FFDEFF00F5C4FF00E4CDFF00EDCDFF00F5CDFF00FFCDFF00FFCDFF00EDD6
        FF00F5D6FF00FFD6FF00FFD6FF00F5DEFF00FFDEFF00FFDEFF00FFDEFF00EDCD
        FF00F5CDFF00FFCDFF00FFCDFF00EDD6FF00F5D6FF00FFD6FF00FFD6FF00FFD6
        FF00F5DEFF00FFDEFF00FFDEFF00FFDEFF00FFE6FF00FFE6FF00EDD6FF00F5D6
        FF00FFD6FF00FFD6FF00F5DEFF00FFDEFF00FFDEFF00FFDEFF00F5E6FF00FFE6
        FF00FFE6FF00FFE6FF00FFE6FF00F5D6FF00FFD6FF00FFD6FF00F5DEFF00FFDE
        FF00FFDEFF00FFDEFF00F5E6FF00FFE6FF00FFE6FF00FFE6FF00FFEEFF00FFEE
        FF00FFEEFF00FFEEFF00F5DEFF00FFDEFF00FFDEFF00F5E6FF00FFE6FF00FFE6
        FF00FFE6FF00FFEEFF00FFEEFF00FFEEFF00FFEEFF00FFF7FF00F5DEFF00FFDE
        FF00FFDEFF00FFDEFF00F5E6FF00FFE6FF00FFE6FF00FFE6FF00FFEEFF00FFEE
        FF00FFEEFF00FFEEFF00FFF7FF00FFF7FF00FFF7FF00FFFFFF00FFE6FF00FFE6
        FF00FFE6FF00FFEEFF00FFEEFF00FFEEFF00FFEEFF00FFF7FF00FFF7FF00FFF7
        FF00FFF7FF00FFFFFF00FFFFFF00FFEEFF00FFEEFF00FFEEFF00FFEEFF00FFF7
        FF00FFF7FF00FFF7FF00FFF7FF00FFFFFF00FFFFFF00FFFFFF00FFEEFF00FFEE
        FF00FFF7FF00FFF7FF00FFF7FF00FFF7FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFF7FF00FFF7FF00FFF7FF00FFF7FF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7FF00FFF7FF00FFF7FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C0C16000C0CFF000CCF16000CCF
        FF00D50C1600D50CFF00D5CF1600D6D0FF00938EFF000C0CFF000CFF16000CFF
        FF00FF0C1600FF0CFF00FFFF1600FFFFFF000C0C16000C0C16000C0C16000C0C
        1600D0D0D4D4D4C3C3D0D0D0D0D0C3C3BABABAA7A7ACACAC87875D5D4C4C4C3E
        3E3F3F3F2E2E24242F2F2F252525252525251313121212121212121213132424
        13131320202424242E2E2F2F4C4C4C51515D5D5D77779393878787ACAC939393
        ACACACACACACACBABABABABABABABDBDBABABAB1B1BABABAA6A6A5A5ACACACA7
        A79797978A8A78786B6B6B5C5C5151514C4C3F3F51515151515151514C4C3131
        4C4C4C4C4C3C3C3C2F2F24000000D0D0D4D4D4C3C3D0D0D0D0D0C3C3BABABAA7
        A7ACACAC87875D5D4C4C4C3E3E3F3F3F2E2E24242F2F2F252525252525251313
        12121212121212121313242413131320202424242E2E2F2F4C4C4C51515D5D5D
        77779393878787ACAC939393ACACACACACACACBABABABABABABABDBDBABABAB1
        B1BABABAA6A6A5A5ACACACA7A79797978A8A78786B6B6B5C5C5151514C4C3F3F
        51515151515151514C4C31314C4C4C4C4C3C3C3C2F2F24000000D0D0D4D4D4C3
        C3D0D0D0C6C6C7C7BABABAACAC98989897975D5D4C4C4C3E3E32323224242525
        2525252525292929252513131212121212121212121212121212121212131313
        202024242E2E2E3F3F4C4C4C6A6A83838A8A8A97979797979393ACACB1B1B1BA
        BABABABABABABABABABABABABAACACACACAC9797939393979783838383836B6B
        6767675D5D4C4C4C3E3E51514C4C4C51515151513E3E3F3F3F3F3F32322F2F2F
        242412000000D0D0D4D4D4C3C3D0D0D0C6C6C7C7BABABAACAC98989897975D5D
        4C4C4C3E3E323232242425252525252525292929252513131212121212121212
        121212121212121212131313202024242E2E2E3F3F4C4C4C6A6A83838A8A8A97
        979797979393ACACB1B1B1BABABABABABABABABABABABABABAACACACACAC9797
        939393979783838383836B6B6767675D5D4C4C4C3E3E51514C4C4C5151515151
        3E3E3F3F3F3F3F32322F2F2F242412000000C7C7D4D4D4D0D0BCBCBCC3C3BABA
        B1B1B19393979797878751514C4C4C3A3A323232242425252929292929333333
        2525242413131306061212120A0A12120A0A0A0A0A101010121220202424242E
        2E2E2E2E5D5D6B6B83838397979797979797ACACB1B1B1ACACB1B1B1BABABABA
        BABABAACACA5A5A5ABAB979783838397977B7B7B6B6B5D5D5050504B4B515151
        51515050515151616151515151513E3E3232322525252525242412000000C7C7
        D4D4D4D0D0BCBCBCC3C3BABAB1B1B19393979797878751514C4C4C3A3A323232
        2424252529292929293333332525242413131306061212120A0A12120A0A0A0A
        0A101010121220202424242E2E2E2E2E5D5D6B6B83838397979797979797ACAC
        B1B1B1ACACB1B1B1BABABABABABABAACACA5A5A5ABAB979783838397977B7B7B
        6B6B5D5D5050504B4B51515151515050515151616151515151513E3E32323225
        25252525242412000000C7C7C7C7C7D0D0BCBCBCC6C6A6A6A2A2A29797939393
        878751513E3E3E35353131312828252529292929292929292525121213131312
        121212121212121202020207070A0A0A0707121212121220202E2E2E4C4C5C5C
        6F6F6F6B6B8A8A8A97979797A7A7A7ABABACACACB1B1BABABABABAB1B1ABABAB
        939397978383836B6B6969695C5C5D5D4C4C4C3F3F5151515151515151515161
        616161613F3F3F3F1212121717121212121212000000C7C7C7C7C7D0D0BCBCBC
        C6C6A6A6A2A2A29797939393878751513E3E3E35353131312828252529292929
        292929292525121213131312121212121212121202020207070A0A0A07071212
        12121220202E2E2E4C4C5C5C6F6F6F6B6B8A8A8A97979797A7A7A7ABABACACAC
        B1B1BABABABABAB1B1ABABAB939397978383836B6B6969695C5C5D5D4C4C4C3F
        3F5151515151515151515161616161613F3F3F3F121212171712121212121200
        0000C7C7C7C7C7D0D0BCBCBCC6C6A6A6A2A2A29797939393878751513E3E3E35
        3531313128282525292929292929292925251212131313121212121212121212
        02020207070A0A0A0707121212121220202E2E2E4C4C5C5C6F6F6F6B6B8A8A8A
        97979797A7A7A7ABABACACACB1B1BABABABABAB1B1ABABAB939397978383836B
        6B6969695C5C5D5D4C4C4C3F3F5151515151515151515161616161613F3F3F3F
        1212121717121212121212000000C6C6C6C6C6C6C6BCBCBCB0B0ABAB97979785
        858383836B6B3E3E3131313131242424161616162525251B1B25252525251313
        12121212120A0A0A121220201313130A0A0707070A0A07071111112020121212
        2D2D3F3F5C5C5C6B6B6B6B6B85858A8AA7A7A7ABABACACACACACBABABABABAAC
        ACA5A5A5939383836B6B6B767667676751514C4C3F3F3F3F3F5151514C4C3F3F
        51515151515151513E3E3F3F0D0D0D1212171717131302000000C6C6C6C6C6C6
        C6BCBCBCB0B0ABAB97979785858383836B6B3E3E313131313124242416161616
        2525251B1B2525252525131312121212120A0A0A121220201313130A0A070707
        0A0A070711111120201212122D2D3F3F5C5C5C6B6B6B6B6B85858A8AA7A7A7AB
        ABACACACACACBABABABABAACACA5A5A5939383836B6B6B767667676751514C4C
        3F3F3F3F3F5151514C4C3F3F51515151515151513E3E3F3F0D0D0D1212171717
        131302000000BABAC3C3C3BCBCB0B0B0A6A6A1A1969696858578787876763232
        3131311F1F161616111112121717171717242424242413131212121212121212
        121213130202020A0A0707070A0A070711111112122020201F1F31314C4C4C5C
        5C6161616B6B7F7F8686869393A5A5A5B9B9B7B7BABABAACAC93939393938383
        7878786B6B50505058583F3F3F3F3F3F3F3F3F3F3F3F3F3F51515151513F3F3F
        3E3E31311717170A0A171717131313000000BABAC3C3C3BCBCB0B0B0A6A6A1A1
        9696968585787878767632323131311F1F161616111112121717171717242424
        242413131212121212121212121213130202020A0A0707070A0A070711111112
        122020201F1F31314C4C4C5C5C6161616B6B7F7F8686869393A5A5A5B9B9B7B7
        BABABAACAC939393939383837878786B6B50505058583F3F3F3F3F3F3F3F3F3F
        3F3F3F3F51515151513F3F3F3E3E31311717170A0A171717131313000000A7A7
        B7B7B7A7A7A7A7A7A7A78A8A8787876C6C6C6C6C5E5E33332525252525171717
        25252525242424131316161612120A0A1212120A0A0909090707090913131313
        130A0A0A131313130202020A0A13131320202E2E2F2F2F3F3F5252525D5D5E5E
        62626297979393939797A7A7A7A7A7A7A7979797939362625252525D5D525252
        4C4C3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F2F2F3F3F13131313
        13131313131313000000A7A7B7B7B7A7A7A7A7A7A7A78A8A8787876C6C6C6C6C
        5E5E3333252525252517171725252525242424131316161612120A0A1212120A
        0A0909090707090913131313130A0A0A131313130202020A0A13131320202E2E
        2F2F2F3F3F5252525D5D5E5E62626297979393939797A7A7A7A7A7A7A7979797
        939362625252525D5D5252524C4C3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F2F2F3F3F1313131313131313131313000000A7A7B7B7B7A7A7A7A7A7
        A7A78A8A8787876C6C6C6C6C5E5E333325252525251717172525252524242413
        1316161612120A0A1212120A0A0909090707090913131313130A0A0A13131313
        0202020A0A13131320202E2E2F2F2F3F3F5252525D5D5E5E6262629797939393
        9797A7A7A7A7A7A7A7979797939362625252525D5D5252524C4C3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F2F2F3F3F131313131313131313131300
        000097979797979797858585858578786B6B6B51514C4C4C4C4C252512121212
        121212122525252513131312121212120A0A12120A0A0A0A0A0A0A0A06060A0A
        0A0A0A131313131313130A0A13131313130A0A0A121220202424242F2F323232
        3F3F4545515151505050505067676B6B7D7D7D6B6B6B6B6B4B4B4E4E3F3F3F3F
        3F3F3F3F3C3C3F3F2F2F2F3B3B2F2F2F404033333F3F3F33332F2F2F2F2F2F2F
        131313131313131313131300000097979797979797858585858578786B6B6B51
        514C4C4C4C4C252512121212121212122525252513131312121212120A0A1212
        0A0A0A0A0A0A0A0A06060A0A0A0A0A131313131313130A0A13131313130A0A0A
        121220202424242F2F3232323F3F4545515151505050505067676B6B7D7D7D6B
        6B6B6B6B4B4B4E4E3F3F3F3F3F3F3F3F3C3C3F3F2F2F2F3B3B2F2F2F40403333
        3F3F3F33332F2F2F2F2F2F2F1313131313131313131313000000939383838385
        857676766B6B50504B4B4B4C4C2F2F2F2F2F2424131313121212121212121212
        12121212120A0A0A0A0A12120A0A0A0A0A0909090A0A060613131313130A0A0A
        131302020A0A0A1313131313090909090A0A0A16161616161212252525252524
        242E2E2E2E2E2F2F3F3F3F4C4C3232322E2E2F2F2F2F2F2F2F3030302F2F2F2F
        2F2F2F21213F3F3F33332F2F2F2F2F2F2F2F2F2F252530301313131313131313
        131313000000939383838385857676766B6B50504B4B4B4C4C2F2F2F2F2F2424
        13131312121212121212121212121212120A0A0A0A0A12120A0A0A0A0A090909
        0A0A060613131313130A0A0A131302020A0A0A1313131313090909090A0A0A16
        161616161212252525252524242E2E2E2E2E2F2F3F3F3F4C4C3232322E2E2F2F
        2F2F2F2F2F3030302F2F2F2F2F2F2F21213F3F3F33332F2F2F2F2F2F2F2F2F2F
        25253030131313131313131313131300000077777777777B7B7676766B6B5050
        4C4C4C3F3F3C3C3C2F2F121212121213131212121212242413131306060A0A0A
        12120A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A13131313130A0A131313131302
        020A0A0A0A0A090904040401010101010D0D0101010101161613131312122525
        2A2A2A2A2A171717131320202020202020202020242421213030302F2F252525
        2F2F292925252525252929292525252513131313131313131313130000007777
        7777777B7B7676766B6B50504C4C4C3F3F3C3C3C2F2F12121212121313121212
        1212242413131306060A0A0A12120A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A13
        131313130A0A131313131302020A0A0A0A0A090904040401010101010D0D0101
        0101011616131313121225252A2A2A2A2A171717131320202020202020202020
        242421213030302F2F2525252F2F292925252525252929292525252513131313
        1313131313131300000077777777777B7B7676766B6B50504C4C4C3F3F3C3C3C
        2F2F121212121213131212121212242413131306060A0A0A12120A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A13131313130A0A131313131302020A0A0A0A0A0909
        04040401010101010D0D01010101011616131313121225252A2A2A2A2A171717
        131320202020202020202020242421213030302F2F2525252F2F292925252525
        2529292925252525131313131313131313131300000076767676767B7B6B6B6B
        6A6A51515151512F2F3030302525252524242413131616162020171713131312
        120A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A1313130A0A13131313131313
        0A0A0A1313131313010101010101010101010101010101010A0A0A1313020202
        1313171717171718181717171313121213131320202020202121252525252525
        2525252517172525171717121212121212121212131313131313131313131300
        000076767676767B7B6B6B6B6A6A51515151512F2F3030302525252524242413
        131616162020171713131312120A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A
        1313130A0A131313131313130A0A0A1313131313010101010101010101010101
        010101010A0A0A13130202021313171717171718181717171313121213131320
        2020202021212525252525252525252517172525171717121212121212121212
        13131313131313131313130000007B7B7B7B7B6B6B6A6A6A51514C4C3F3F3F2F
        2F2525252020252512121212121313132424242413131312120909090A0A0606
        0A0A0A0A0A0A0A0A12120D0D13131313130202020A0A13131313130A0A131313
        0A0A02020101010A0A0202020A0A01010A0A0A02020A0A0A0707020217171717
        1713131302021313121212131313131320201717212121252517171712121212
        17171713131313130A0A131313131313131313131313130000007B7B7B7B7B6B
        6B6A6A6A51514C4C3F3F3F2F2F25252520202525121212121213131324242424
        13131312120909090A0A06060A0A0A0A0A0A0A0A12120D0D1313131313020202
        0A0A13131313130A0A1313130A0A02020101010A0A0202020A0A01010A0A0A02
        020A0A0A07070202171717171713131302021313121212131313131320201717
        21212125251717171212121217171713131313130A0A13131313131313131313
        1313130000006B6B7B7B7B6B6B6161614C4C51512F2F2F303025252514142424
        1313131212121212121213131212120A0A0606060A0A0A0A0A0A0A12120A0A0A
        12120A0A1313130A0A13131313130A0A13131313130A0A0A02020A0A1313130A
        0A0202020A0A13130A0A0A0707070707060607070A0A0A13130A0A0A07071313
        1313131313131313131313131313131313131313131313130A0A0A13130A0A0A
        0202070713131313131313131313130000006B6B7B7B7B6B6B6161614C4C5151
        2F2F2F3030252525141424241313131212121212121213131212120A0A060606
        0A0A0A0A0A0A0A12120A0A0A12120A0A1313130A0A13131313130A0A13131313
        130A0A0A02020A0A1313130A0A0202020A0A13130A0A0A070707070706060707
        0A0A0A13130A0A0A070713131313131313131313131313131313131313131313
        131313130A0A0A13130A0A0A0202070713131313131313131313130000006B6B
        7B7B7B6B6B6F6F6F626251513F3F3F33332A2A2A252513131212120A0A121212
        121212120A0A0A06060606060A0A06060A0A0A0A0A1212121616121213131313
        130A0A0A131302020A0A0A1313131313070707070808080A0A07070708080A0A
        080808121206060607070A0A1212121212131313090908081313130707131313
        08080A0A0808081313020202131302021313130A0A0202020707020213131313
        131313131313130000006B6B7B7B7B6B6B6F6F6F626251513F3F3F33332A2A2A
        252513131212120A0A121212121212120A0A0A06060606060A0A06060A0A0A0A
        0A1212121616121213131313130A0A0A131302020A0A0A131313131307070707
        0808080A0A07070708080A0A080808121206060607070A0A1212121212131313
        09090808131313070713131308080A0A0808081313020202131302021313130A
        0A0202020707020213131313131313131313130000006B6B7B7B7B6B6B6F6F6F
        626251513F3F3F33332A2A2A252513131212120A0A121212121212120A0A0A06
        060606060A0A06060A0A0A0A0A1212121616121213131313130A0A0A13130202
        0A0A0A1313131313070707070808080A0A07070708080A0A0808081212060606
        07070A0A121212121213131309090808131313070713131308080A0A08080813
        13020202131302021313130A0A02020207070202131313131313131313131300
        00008585787878757576767669695D5D3F3F3F3F3F2929292929292917171718
        1812121212120A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A
        0A0A0A13131313130A0A13131313130A0A13131302020A0A13131313130A0A0A
        131313130A0A0A13130202020A0A13131313130A0A13131313130A0A13131313
        130A0A0A131302020A0A0A131313131313131313131313131313131313131313
        13131313131313131313130000008585787878757576767669695D5D3F3F3F3F
        3F29292929292929171717181812121212120A0A1212120A0A0A0A0A0A0A1212
        0A0A0A0A0A1212120A0A0A0A0A0A0A13131313130A0A13131313130A0A131313
        02020A0A13131313130A0A0A131313130A0A0A13130202020A0A13131313130A
        0A13131313130A0A13131313130A0A0A131302020A0A0A131313131313131313
        1313131313131313131313131313131313131313131313000000767676767678
        78676767696951513F3F3F2F2F29292929292929121212171712121212120D0D
        0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A0A0A121213131313130A0A0A
        13130A0A13131313130A0A0A131313130A0A0A13130202020A0A13131313130A
        0A13131313130A0A13131313130A0A0A131302020A0A0A13131313130A0A1313
        1313130A0A131313131313131313130202131313131313130202021313131313
        13130200000076767676767878676767696951513F3F3F2F2F29292929292929
        121212171712121212120D0D0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A
        0A0A121213131313130A0A0A13130A0A13131313130A0A0A131313130A0A0A13
        130202020A0A13131313130A0A13131313130A0A13131313130A0A0A13130202
        0A0A0A13131313130A0A13131313130A0A131313131313131313130202131313
        131313130202021313131313131302000000767667676769696B6B6B5D5D5252
        3F3F3F292924242412121818121212171712121212120A0A1212120A0A0A0A0A
        0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A1313131313020213130A0A0A13
        131313130A0A13131313130A0A13131313130A0A13131313130A0A0A13130202
        0A0A0A13131313130A0A13131313130A0A13131313130A0A1313130202131313
        1313131313131313131313131313131313131313131313131313130000007676
        67676769696B6B6B5D5D52523F3F3F2929242424121218181212121717121212
        12120A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A13
        13131313020213130A0A0A13131313130A0A13131313130A0A13131313130A0A
        13131313130A0A0A131302020A0A0A13131313130A0A13131313130A0A131313
        13130A0A13131302021313131313131313131313131313131313131313131313
        13131313131313000000767667676769696B6B6B5D5D52523F3F3F2929242424
        12121818121212171712121212120A0A1212120A0A0A0A0A0A0A12120A0A0A0A
        0A0A0A0A12120A0A0A0A0A1313131313020213130A0A0A13131313130A0A1313
        1313130A0A13131313130A0A13131313130A0A0A131302020A0A0A1313131313
        0A0A13131313130A0A13131313130A0A13131302021313131313131313131313
        1313131313131313131313131313131313131300000067676B6B6B5D5D626262
        51513F3F2F2F2F25251212121212121212121212121212120D0D12120A0A0A0A
        0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A1313130A0A1313130A0A1313
        1313130A0A13131302020A0A13131313130A0A0A131302020A0A0A1313131313
        0A0A13131313130A0A13131313130A0A13131302020A0A0A131313130A0A0A13
        1313131313131313131313131313131313131313131313131313131313131300
        000067676B6B6B5D5D62626251513F3F2F2F2F25251212121212121212121212
        121212120D0D12120A0A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A
        1313130A0A1313130A0A13131313130A0A13131302020A0A13131313130A0A0A
        131302020A0A0A13131313130A0A13131313130A0A13131313130A0A13131302
        020A0A0A131313130A0A0A131313131313131313131313131313131313131313
        131313131313131313131300000061615D5D5D51515151513F3F2F2F29292920
        20131313121212121717170A0A1212120A0A0A0A0A0A0A0A0A1212120A0A0A0A
        1212120A0A0A0A0A12120A0A0A0A0A131313131313130A0A13131313130A0A0A
        131313130A0A0A13131313130A0A13131313130A0A13131313130A0A13131302
        020A0A0A131313130A0A0A13131313130A0A13131313130A0A13131313130202
        131313131313131302021313131313131302020213131300000061615D5D5D51
        515151513F3F2F2F2929292020131313121212121717170A0A1212120A0A0A0A
        0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A1313131313
        13130A0A13131313130A0A0A131313130A0A0A13131313130A0A13131313130A
        0A13131313130A0A13131302020A0A0A131313130A0A0A13131313130A0A1313
        1313130A0A131313131302021313131313131313020213131313131313020202
        13131300000051514C4C4C3F3F33333335352929252525141413131313130A0A
        1212120A0A1212120A0A12120A0A0A12120A0A0A0A0A12120A0A0A0A0A121212
        0A0A0A0A13131313130A0A0A131302020A0A0A13131313130A0A13130202020A
        0A13131313130A0A13131302020A0A0A131313130A0A0A13131313130A0A1313
        1313130A0A13131302020A0A1313131313131313131313131313131313131313
        13131313131313131313131313131300000051514C4C4C3F3F33333335352929
        252525141413131313130A0A1212120A0A1212120A0A12120A0A0A12120A0A0A
        0A0A12120A0A0A0A0A1212120A0A0A0A13131313130A0A0A131302020A0A0A13
        131313130A0A13130202020A0A13131313130A0A13131302020A0A0A13131313
        0A0A0A13131313130A0A13131313130A0A13131302020A0A1313131313131313
        1313131313131313131313131313131313131313131313131313130000005151
        4C4C4C3F3F33333335352929252525141413131313130A0A1212120A0A121212
        0A0A12120A0A0A12120A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A13131313
        130A0A0A131302020A0A0A13131313130A0A13130202020A0A13131313130A0A
        13131302020A0A0A131313130A0A0A13131313130A0A13131313130A0A131313
        02020A0A13131313131313131313131313131313131313131313131313131313
        131313131313130000004C4C3F3F3F2525292929252525251212121717131313
        13130A0A0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A0A
        0A1212120A0A0A0A12121213131313130A0A13131313130A0A13131313130A0A
        13131313130A0A0A131313130A0A0A13131313130A0A13131313130A0A131313
        02020A0A13131313130A0A0A131313130A0A0A13131313131313131313131313
        131313131313131313131313131313131313130000004C4C3F3F3F2525292929
        25252525121212171713131313130A0A0A0A0A0A0A1212120A0A0A0A1212120A
        0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A12121213131313130A0A1313
        1313130A0A13131313130A0A13131313130A0A0A131313130A0A0A1313131313
        0A0A13131313130A0A13131302020A0A13131313130A0A0A131313130A0A0A13
        1313131313131313131313131313131313131313131313131313131313131300
        00002E2E3A3A3A1717252525121212122525251313131313141409090707070A
        0A0A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A
        1313130A0A13131313130A0A13131313130A0A0A131313130A0A0A1313131313
        0A0A13131313130A0A13131302020A0A13131313130A0A0A131313130A0A0A13
        131313130A0A13131313130A0A13131313131313131313131313131313131313
        13131313131313131313130000002E2E3A3A3A17172525251212121225252513
        13131313141409090707070A0A0A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A
        0A0A0A12120A0A0A0A0A0A0A1313130A0A13131313130A0A13131313130A0A0A
        131313130A0A0A13131313130A0A13131313130A0A13131302020A0A13131313
        130A0A0A131313130A0A0A13131313130A0A13131313130A0A13131313131313
        131313131313131313131313131313131313131313131300000013130202020A
        0A0A0A0A0A0A12120A0A0A0A0A1212120A0A12120A0A0A121212121207071212
        1212120A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A
        12120A0A0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A13
        1313131313131313131313131313131313130A0A0A0A0A12120A0A0A0A0A1212
        0A0A0A0A0A121212121212121212121212121212121212120A0A0A0A0A121212
        0A0A0A00000013130202020A0A0A0A0A0A0A12120A0A0A0A0A1212120A0A1212
        0A0A0A1212121212070712121212120A0A1212120A0A0A0A0A0A0A12120A0A0A
        0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A1212120A
        0A0A0A0A0A0A12120A0A0A131313131313131313131313131313131313130A0A
        0A0A0A12120A0A0A0A0A12120A0A0A0A0A121212121212121212121212121212
        121212120A0A0A0A0A1212120A0A0A00000013130202020A0A0A0A0A0A0A1212
        0A0A0A0A0A1212120A0A12120A0A0A1212121212070712121212120A0A121212
        0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A0A
        0A1212120A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A131313131313131313
        131313131313131313130A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A121212
        121212121212121212121212121212120A0A0A0A0A1212120A0A0A0000001313
        0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A121210101012120A0A0A
        121210100A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A
        0A1212120A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A
        0A0A0A131313131313131313131313020213131313130A0A0A0A0A0A0A0A0A0A
        12120A0A0A0A0A0A0A121212121212121212121212121212121212120A0A0A12
        120A0A0A0A0A0A00000013130A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A
        0A0A121210101012120A0A0A121210100A0A0A12120A0A0A0A0A0A0A1212120A
        0A0A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A1212
        0A0A0A0A0A0A0A0A12120A0A0A0A0A1313131313131313131313130202131313
        13130A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212121212121212121212
        12121212121212120A0A0A12120A0A0A0A0A0A00000013130202020A0A0A0A0A
        0A0A12120A0A0A0A0A0A0A0A0A0A1212121212070712121212120A0A12121212
        120A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A0A0A1212120A0A1212
        0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A1313131313
        13131313131313131313131313130A0A0A0A0A12120A0A0A0A0A0A0A1212120A
        0A121212121212121212121212121212121212120A0A0A0A0A0A0A0A12120A00
        000013130202020A0A0A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A121212121207
        0712121212120A0A12121212120A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A
        0A0A0A0A0A1212120A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A
        0A0A12120A0A0A131313131313131313131313131313131313130A0A0A0A0A12
        120A0A0A0A0A0A0A1212120A0A12121212121212121212121212121212121212
        0A0A0A0A0A0A0A0A12120A00000013130A0A0A0A0A1212120A0A0A0A1212120A
        0A1212120A0A12120A0A0A12121212120A0A101012121212120A0A0A0A0A0A0A
        1212120A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A12120A0A0A
        0A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A13131313131313131313131313
        1313131313130A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A0A0A12121212121212
        1212121212121212121212120A0A0A12120A0A0A0A0A1200000013130A0A0A0A
        0A1212120A0A0A0A1212120A0A1212120A0A12120A0A0A12121212120A0A1010
        12121212120A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A12120A0A0A
        0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A13
        1313131313131313131313131313131313130A0A0A0A0A0A0A0A0A0A12120A0A
        0A0A0A0A0A121212121212121212121212121212121212120A0A0A12120A0A0A
        0A0A1200000013130A0A0A0A0A1212120A0A0A0A1212120A0A1212120A0A1212
        0A0A0A12121212120A0A101012121212120A0A0A0A0A0A0A1212120A0A0A0A0A
        12120A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A
        0A1212120A0A0A0A0A0A0A131313131313131313131313131313131313130A0A
        0A0A0A0A0A0A0A0A12120A0A0A0A0A0A0A121212121212121212121212121212
        121212120A0A0A12120A0A0A0A0A1200000013130202020A0A0A0A0A0A0A1212
        0A0A0A0A0A0A0A0A0A0A121212121210100A0A0A121212120A0A0A10100A0A0A
        12120A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A1212120A
        0A0A0A0A0A0A12120A0A0A12120A0A0A0A0A0A0A121212131313131313131313
        020202131313131313130A0A0A0A0A0A0A1212120A0A0A0A1212120A0A121212
        121212121212121212121212121212120A0A0A0A0A1212120A0A0A0000001313
        0202020A0A0A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A121212121210100A0A0A
        121212120A0A0A10100A0A0A12120A0A0A0A0A12120A0A0A0A0A12120A0A0A0A
        0A0A0A0A12120A0A1212120A0A0A0A0A0A0A12120A0A0A12120A0A0A0A0A0A0A
        121212131313131313131313020202131313131313130A0A0A0A0A0A0A121212
        0A0A0A0A1212120A0A121212121212121212121212121212121212120A0A0A0A
        0A1212120A0A0A00000013130A0A0A0A0A0A0A0A12120A0A0A0A0A0A0A121212
        0A0A12121212120A0A12121210100A0A12121212120A0A0A0A0A0A0A1212120A
        0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A0A0A0A0A0A12120A0A
        0A0A0A0A0A0A0A0A0A0A12120A0A0A1313131313131313131313131313131313
        13130A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A1212121212121212121212
        12121212121212120A0A0A12120A0A0A0A0A0A00000013130A0A0A0A0A0A0A0A
        12120A0A0A0A0A0A0A1212120A0A12121212120A0A12121210100A0A12121212
        120A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A
        0A0A0A0A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A0A0A12120A0A0A1313131313
        13131313131313131313131313130A0A0A0A0A12120A0A0A0A0A12120A0A0A0A
        0A121212121212121212121212121212121212120A0A0A12120A0A0A0A0A0A00
        0000131302020212120A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A121212121207
        07121212121210100A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A
        0A0A0A12120A0A0A12120A0A1212120A0A1212120A0A0A0A1212120A0A121212
        0A0A0A0A0A0A0A131313131313131313131313131313131313130A0A0A0A0A0A
        0A0A0A0A0A0A12120A0A0A0A0A12121212121212121212121212121212121212
        1212120A0A0A0A0A0A0A12000000131302020212120A0A0A0A0A0A0A0A0A0A12
        120A0A0A0A0A12121212120707121212121210100A0A0A12120A0A0A0A0A1212
        0A0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A12120A0A1212120A0A121212
        0A0A0A0A1212120A0A1212120A0A0A0A0A0A0A13131313131313131313131313
        1313131313130A0A0A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A12121212121212
        1212121212121212121212121212120A0A0A0A0A0A0A12000000131302020212
        120A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A1212121212070712121212121010
        0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A
        12120A0A1212120A0A1212120A0A0A0A1212120A0A1212120A0A0A0A0A0A0A13
        1313131313131313131313131313131313130A0A0A0A0A0A0A0A0A0A0A0A1212
        0A0A0A0A0A121212121212121212121212121212121212121212120A0A0A0A0A
        0A0A1200000013130A0A0A0A0A0A0A0A12120A0A1212120A0A0A0A0A12120A0A
        121212121212121212120A0A12121212120A0A0A12120A0A0A0A0A0A0A121212
        0A0A0A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A131313131313131313131313131313131313130A0A
        0A0A0A0A0A1313130A0A0A0A0A0A0A0A0A121212121212121313131212121212
        131312120A0A0A0A0A0A0A0A0A0A0A00000013130A0A0A0A0A0A0A0A12120A0A
        1212120A0A0A0A0A12120A0A121212121212121212120A0A12121212120A0A0A
        12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A0A
        0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A131313131313131313
        131313131313131313130A0A0A0A0A0A0A1313130A0A0A0A0A0A0A0A0A121212
        121212121313131212121212131312120A0A0A0A0A0A0A0A0A0A0A0000001313
        0202020A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A
        0A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212120A
        0A0A0A0A0A0A12120A0A0A12120A0A0A0A0A07071313130A0A1313130A0A1313
        13131317170C0C0C171717172525252424252525323224241717172424252525
        1717141413131313130606061212131324242417172525251313121217171714
        1413131313130A00000013130202020A0A0A0A0A12120A0A0A0A0A0A0A121212
        0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A12
        120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A12120A0A0A0A0A0707
        1313130A0A1313130A0A131313131317170C0C0C171717172525252424252525
        3232242417171724242525251717141413131313130606061212131324242417
        1725252513131212171717141413131313130A00000013130202020A0A121212
        0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A12
        120A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A
        1212120A0A0A0A0A070713130A0A0A1313020202131313131313131717171717
        1717171725252530303232322F2F252525252525252424242525141413131313
        1307070712121212242424252512121224241313171717141413131313131300
        000013130202020A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A
        0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A
        0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A070713130A0A0A1313020202
        1313131313131317171717171717171725252530303232322F2F252525252525
        2524242425251414131313131307070712121212242424252512121224241313
        171717141413131313131300000013130202020A0A1212120A0A0A0A0A0A0A12
        120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A
        1212120A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A
        070713130A0A0A13130202021313131313131317171717171717171725252530
        303232322F2F2525252525252524242425251414131313131307070712121212
        24242425251212122424131317171714141313131313130000000A0A1313130A
        0A0A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A
        1212120A0A0A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A
        12120A0A0A0A0A0A0A0A0A0A0A0A08080A0A0A13131313131313131313131317
        17171717252525252525252F2F3232323F3F2525353535323229292925252121
        1313131313121212131313132424241717252525131312121717171717131313
        13130A0000000A0A1313130A0A0A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A
        0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A121212
        0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A0A0A08080A0A0A13
        13131313131313131313131717171717252525252525252F2F3232323F3F2525
        3535353232292929252521211313131313121212131313132424241717252525
        13131212171717171713131313130A00000013130202020A0A0A0A0A0A0A1212
        0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A12120A0A0A0A0A0A0A121212
        0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A12
        120A0A0A0A0A13130A0A0A131313131313131313171717131317171725252929
        2F2F2F3F3F3232323F3F3F3F33333333332F2F2F2F2F25251313131313202020
        1212242417171720201717172020121217171714141313131313130000001313
        0202020A0A0A0A0A0A0A12120A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A
        12120A0A0A0A0A0A0A1212120A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A
        0A1212120A0A0A0A0A0A0A12120A0A0A0A0A13130A0A0A131313131313131313
        1717171313171717252529292F2F2F3F3F3232323F3F3F3F33333333332F2F2F
        2F2F252513131313132020201212242417171720201717172020121217171714
        1413131313131300000013130A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A
        0A0A0A0A1212120A0A0A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A0A
        0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A13131313
        131313131313131317171313171717131324242425252F2F3F3F3F3F3F4C4C4C
        3F3F3E3E3F3F3F3F3F3F3F3F2F2F30302F2F2F20202525251717252512121225
        2517171724241717141414171713131313130A00000013130A0A0A0A0A121212
        0A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A0A0A1212120A
        0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A
        1212120A0A0A0A0A131313131313131313131313171713131717171313242424
        25252F2F3F3F3F3F3F4C4C4C3F3F3E3E3F3F3F3F3F3F3F3F2F2F30302F2F2F20
        2025252517172525121212252517171724241717141414171713131313130A00
        000013130A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212120A
        0A0A0A0A0A0A0A0A1212120A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A
        0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A131313131313131313131313
        17171313171717131324242425252F2F3F3F3F3F3F4C4C4C3F3F3E3E3F3F3F3F
        3F3F3F3F2F2F30302F2F2F202025252517172525121212252517171724241717
        141414171713131313130A00000013130202020A0A0A0A0A0A0A12120A0A0A0A
        0A0A0A0A0A0A12120A0A0A0A0A1212120A0A12120A0A0A0A0A1212120A0A0A0A
        0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A
        1313131313131313131717171313171714141416162020202F2F3F3F3F3F3F51
        514C4C4C4C4C3E3E3E3E3E3F3F3F3F3F3F3F3F3F303030303024242425252525
        121212242412121225251212171717171713131313130200000013130202020A
        0A0A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A1212120A0A1212
        0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A
        12120A0A0A0A0A12120A0A0A1313131313131313131717171313171714141416
        162020202F2F3F3F3F3F3F51514C4C4C4C4C3E3E3E3E3E3F3F3F3F3F3F3F3F3F
        3030303030242424252525251212122424121212252512121717171717131313
        13130200000013130A0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A12120A0A
        0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A121212
        0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A0A0A0A1313131313131317
        171313131717141417171712122424243B3B3F3F5151514C4C50505050503A3A
        3E3E3E3E3E5151513F3F3F3F3F3F3F4040333333252525252424241313121212
        25252525141414121213131313131300000013130A0A0A0A0A0A0A0A12120A0A
        0A0A0A12120A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A
        0A0A0A0A1212120A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A
        0A0A0A0A1313131313131317171313131717141417171712122424243B3B3F3F
        5151514C4C50505050503A3A3E3E3E3E3E5151513F3F3F3F3F3F3F4040333333
        2525252524242413131212122525252514141412121313131313130000001313
        1313130A0A0A0A0A0A0A0A0A1212120A0A0A0A0A0A0A0A0A1212120A0A0A0A0A
        0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A13130A0A0A0A
        0A1212120A0A0A0A0A0A0A13130A0A0A13131717131313131317171713131818
        171717202024242432324C4C5151515D5D4C4C4C4C4C3E3E3A3A3A4C4C4C4C4C
        51514C4C4E4E4E4C4C2F2F2F2929252513131316162020201717252517171714
        141313130A0A1300000013131313130A0A0A0A0A0A0A0A0A1212120A0A0A0A0A
        0A0A0A0A1212120A0A0A0A0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A
        0A0A0A0A0A0A13130A0A0A0A0A1212120A0A0A0A0A0A0A13130A0A0A13131717
        131313131317171713131818171717202024242432324C4C5151515D5D4C4C4C
        4C4C3E3E3A3A3A4C4C4C4C4C51514C4C4E4E4E4C4C2F2F2F2929252513131316
        162020201717252517171714141313130A0A130000000A0A0A0A0A12120A0A0A
        0A0A12120A0A0A0A0A1212120A0A06061010100A0A1212121212121207070712
        120A0A0A12120A0A131313131312121212121212171717131314141412122626
        2525251818252525131302021717171313171717171717171717171717252525
        252535353F3F3F3F3F51515150504C4C51515151515151515D5D51515151514C
        4C5D5D5D3F3F3F3F2E2E2E24242F2F2F292933333F3F3F2F2F2E2E2E2F2F2400
        00000A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A1212120A0A06061010100A
        0A1212121212121207070712120A0A0A12120A0A131313131312121212121212
        1717171313141414121226262525251818252525131302021717171313171717
        171717171717171717252525252535353F3F3F3F3F51515150504C4C51515151
        515151515D5D51515151514C4C5D5D5D3F3F3F3F2E2E2E24242F2F2F29293333
        3F3F3F2F2F2E2E2E2F2F240000000A0A0A0A0A12120A0A0A0A0A12120A0A0A0A
        0A1212120A0A06061010100A0A1212121212121207070712120A0A0A12120A0A
        1313131313121212121212121717171313141414121226262525251818252525
        131302021717171313171717171717171717171717252525252535353F3F3F3F
        3F51515150504C4C51515151515151515D5D51515151514C4C5D5D5D3F3F3F3F
        2E2E2E24242F2F2F292933333F3F3F2F2F2E2E2E2F2F240000000A0A1212120A
        0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A10100A0A0A121212121212120A0A
        1212121212121212131313131212121212121212121212121414141414252525
        1414252518181826262626261313131313131313131717171313171717171717
        17252525252532323F3F3F3F3F50505051514C4C51515151515D5D5D51515D5D
        51515151515050504C4C3F3F3131312F2F2F2F2F2F2F33333232322E2E2F2F2F
        2E2E2F0000000A0A1212120A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A1010
        0A0A0A121212121212120A0A1212121212121212131313131212121212121212
        1212121214141414142525251414252518181826262626261313131313131313
        13171717131317171717171717252525252532323F3F3F3F3F50505051514C4C
        51515151515D5D5D51515D5D51515151515050504C4C3F3F3131312F2F2F2F2F
        2F2F33333232322E2E2F2F2F2E2E2F00000012120A0A0A0A0A1212120A0A0A0A
        0A0A0A12120A0A0A0A0A12120707071212121212121212121313131313242424
        2424171720202012122424241212242414141424242121212525252525252525
        2525252513130A0A131313131317171713131212171717242425252525253232
        3F3F3F3E3E5151514C4C50505D5D5D5D5D5D5D5D616161616161615D5D616161
        5D5D4C4C4C4C4C32322F2F2F2F2F33333F3F3F3B3B3F3F3F3F3F3F0000001212
        0A0A0A0A0A1212120A0A0A0A0A0A0A12120A0A0A0A0A12120707071212121212
        1212121213131313132424242424171720202012122424241212242414141424
        2421212125252525252525252525252513130A0A131313131317171713131212
        1717172424252525252532323F3F3F3E3E5151514C4C50505D5D5D5D5D5D5D5D
        616161616161615D5D6161615D5D4C4C4C4C4C32322F2F2F2F2F33333F3F3F3B
        3B3F3F3F3F3F3F0000000A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A
        0A0A1212121212121212121212121313242424171730303024242F2F29292930
        302424242F2F2424252525252525252525252525252525303025252513131212
        13131313131212121212121217171724242424242F2F32323F3F3F4C4C4C4C4C
        4C4C5D5D6161616B6B6B6B6B69696B6B6969696F6F787878696961614C4C4C3F
        3F3F3F3F3F3F2F2F3F3F3F4C4C3F3F3F4C4C510000000A0A0A0A0A12120A0A0A
        0A0A0A0A1212120A0A0A0A0A0A0A121212121212121212121212131324242417
        1730303024242F2F29292930302424242F2F2424252525252525252525252525
        2525253030252525131312121313131313121212121212121717172424242424
        2F2F32323F3F3F4C4C4C4C4C4C4C5D5D6161616B6B6B6B6B69696B6B6969696F
        6F787878696961614C4C4C3F3F3F3F3F3F3F2F2F3F3F3F4C4C3F3F3F4C4C5100
        00000A0A0A0A0A12120A0A0A0A0A0A0A1212120A0A0A0A0A0A0A121212121212
        1212121212121313242424171730303024242F2F29292930302424242F2F2424
        2525252525252525252525252525253030252525131312121313131313121212
        1212121217171724242424242F2F32323F3F3F4C4C4C4C4C4C4C5D5D6161616B
        6B6B6B6B69696B6B6969696F6F787878696961614C4C4C3F3F3F3F3F3F3F2F2F
        3F3F3F4C4C3F3F3F4C4C510000000A0A1212120A0A0A0A0A0A0A12120A0A0A0A
        0A0A0A0A1212121212121212121212121313242425252525253F3F3F3F3F2F2F
        3F3F3F2F2F3232322F2F323230303030302F2F2F30302F2F2F2F2F30302F2F2F
        12121313121212121224242414142424242424252530303032323F3F3F3F3F4C
        4C5D5D5D5D5D505067676769696B6B6B6B6B7D7D6B6B6B6B6B8686866B6B6B6B
        69696961614C4C4C51513F3F4C4C4C4C4C5050505050670000000A0A1212120A
        0A0A0A0A0A0A12120A0A0A0A0A0A0A0A12121212121212121212121213132424
        25252525253F3F3F3F3F2F2F3F3F3F2F2F3232322F2F323230303030302F2F2F
        30302F2F2F2F2F30302F2F2F1212131312121212122424241414242424242425
        2530303032323F3F3F3F3F4C4C5D5D5D5D5D505067676769696B6B6B6B6B7D7D
        6B6B6B6B6B8686866B6B6B6B69696961614C4C4C51513F3F4C4C4C4C4C505050
        50506700000012120A0A0A0A0A0A0A0A12120A0A0A0A0A12120A0A0A0A0A2424
        1313131212121212131324242A2A2A33335151513F3F51513F3F3F3F3F3F3F3F
        3F3F3F3F3030303F3F3030303B3B30302F2F2F2F2F2F2F2F2424202024242420
        202424242424242425252530302F2F2F3F3F4C4C5151515D5D5D5D5D67676767
        6B6B6B76766B6B6B8787838387878783836B6B6B83836B6B6B6B6B6969616161
        515151514B4B4B4B4B5D5D5D5D5D6B00000012120A0A0A0A0A0A0A0A12120A0A
        0A0A0A12120A0A0A0A0A24241313131212121212131324242A2A2A3333515151
        3F3F51513F3F3F3F3F3F3F3F3F3F3F3F3030303F3F3030303B3B30302F2F2F2F
        2F2F2F2F2424202024242420202424242424242425252530302F2F2F3F3F4C4C
        5151515D5D5D5D5D676767676B6B6B76766B6B6B8787838387878783836B6B6B
        83836B6B6B6B6B6969616161515151514B4B4B4B4B5D5D5D5D5D6B0000000A0A
        0A0A0A0A0A1212120A0A12120A0A0A0A0A0A0A0A121213131616161212121212
        202029292F2F2F3333626262515151515151514C4C3F3F3F3F3F3F3F3F3F3F3F
        3F3C3C3C3F3F30303B3B3B2F2F2F2F2F24242F2F2424242F2F2F2F2F32322F2F
        2F2F2F3F3F3F3F3F40404E4E5D5D5D69696B6B6B6B6B67677676767878838383
        86868A8A878787878783838383836B6B6B6B6B6B6B6F6F6F696962624B4B4B50
        505050506767690000000A0A0A0A0A0A0A1212120A0A12120A0A0A0A0A0A0A0A
        121213131616161212121212202029292F2F2F3333626262515151515151514C
        4C3F3F3F3F3F3F3F3F3F3F3F3F3C3C3C3F3F30303B3B3B2F2F2F2F2F24242F2F
        2424242F2F2F2F2F32322F2F2F2F2F3F3F3F3F3F40404E4E5D5D5D69696B6B6B
        6B6B6767767676787883838386868A8A878787878783838383836B6B6B6B6B6B
        6B6F6F6F696962624B4B4B50505050506767690000000A0A0A0A0A0A0A121212
        0A0A12120A0A0A0A0A0A0A0A121213131616161212121212202029292F2F2F33
        33626262515151515151514C4C3F3F3F3F3F3F3F3F3F3F3F3F3C3C3C3F3F3030
        3B3B3B2F2F2F2F2F24242F2F2424242F2F2F2F2F32322F2F2F2F2F3F3F3F3F3F
        40404E4E5D5D5D69696B6B6B6B6B6767767676787883838386868A8A87878787
        8783838383836B6B6B6B6B6B6B6F6F6F696962624B4B4B505050505067676900
        00000A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A12120A0A0A0A0A242413131316
        1612121213132525333333404062626261615D5D51515151514C4C4C51513F3F
        4C4C4C3F3F4C4C4C3C3C3F3F3B3B3B3B3B3B3B3B2E2E2F2F2F2F2F32322F2F2F
        32323F3F32323240404E4E4E51514C4C5D5D5D696969696978786A6A76767678
        7885858597978A8A97979797978383836B6B83838787877D7D6969696F6F6969
        5050505C5C6A6A6A5D5D6B0000000A0A0A0A0A12120A0A0A0A0A0A0A0A0A0A12
        120A0A0A0A0A2424131313161612121213132525333333404062626261615D5D
        51515151514C4C4C51513F3F4C4C4C3F3F4C4C4C3C3C3F3F3B3B3B3B3B3B3B3B
        2E2E2F2F2F2F2F32322F2F2F32323F3F32323240404E4E4E51514C4C5D5D5D69
        6969696978786A6A767676787885858597978A8A97979797978383836B6B8383
        8787877D7D6969696F6F69695050505C5C6A6A6A5D5D6B0000000A0A12121206
        060A0A0A10101212131313121212121224240A0A161616121225252531313232
        4C4C4C5151505050515161616B6B6B6F6F787878787878786161615D5D505050
        4B4B4B4B4B4B4B4C4C50505051514C4C5151514C4C4C4C4C4C4C51514C4C4C3F
        3F3F3F3F525261616B6B6B6F6F7D7D7D83838383939393979797979797979797
        9393939797979797979797979797979797878787979797978383838383838383
        8686830000000A0A12121206060A0A0A10101212131313121212121224240A0A
        1616161212252525313132324C4C4C5151505050515161616B6B6B6F6F787878
        787878786161615D5D5050504B4B4B4B4B4B4B4C4C50505051514C4C5151514C
        4C4C4C4C4C4C51514C4C4C3F3F3F3F3F525261616B6B6B6F6F7D7D7D83838383
        9393939797979797979797979393939797979797979797979797979797878787
        9797979783838383838383838686830000000A0A0A0A0A121207070712121212
        121212131324242417171212252525252535353532323F3F51515161614C4C4C
        616161616969696B6B7D7D7D787884846969696B6B61616150505D5D5050505D
        5D5050505D5D5151515151515151515151515D5D5151514C4C51515151516B6B
        6969696B6B8787878787858593939397979393939393A2A29797979393A7A7A7
        979797979797979797979797878797978383838A8A8383838383830000000A0A
        0A0A0A1212070707121212121212121313242424171712122525252525353535
        32323F3F51515161614C4C4C616161616969696B6B7D7D7D787884846969696B
        6B61616150505D5D5050505D5D5050505D5D5151515151515151515151515D5D
        5151514C4C51515151516B6B6969696B6B878787878785859393939797939393
        9393A2A29797979393A7A7A7979797979797979797979797878797978383838A
        8A8383838383830000000A0A0A0A0A1212070707121212121212121313242424
        17171212252525252535353532323F3F51515161614C4C4C616161616969696B
        6B7D7D7D787884846969696B6B61616150505D5D5050505D5D5050505D5D5151
        515151515151515151515D5D5151514C4C51515151516B6B6969696B6B878787
        8787858593939397979393939393A2A29797979393A7A7A79797979797979797
        97979797878797978383838A8A8383838383830000000A0A0A0A0A1212101010
        0A0A12121313132424131313242412122929292F2F3333333E3E51516161616F
        6F61616161616B6B6B6B6B7D7D838383878784847D7D7D78786F6F6F78786767
        61616167676B6B6B61615D5D5D5D5D5D5D5D5D5D61615D5D6262625D5D616161
        616169696B6B6B979786868697979F9F9797979393A2A2A2A2A2A2A2A2A2A293
        93A7A7A78A8AA7A7979797979797979797979797979797939397979793939700
        00000A0A0A0A0A12121010100A0A12121313132424131313242412122929292F
        2F3333333E3E51516161616F6F61616161616B6B6B6B6B7D7D83838387878484
        7D7D7D78786F6F6F7878676761616167676B6B6B61615D5D5D5D5D5D5D5D5D5D
        61615D5D6262625D5D616161616169696B6B6B979786868697979F9F97979793
        93A2A2A2A2A2A2A2A2A2A29393A7A7A78A8AA7A7979797979797979797979797
        97979793939797979393970000000A0A0A0A0A12120A0A0A1212121213131324
        24171717252512122F2F2F2F2F3F3F3F3F3F515161616169696B6B6B6B6B6B6B
        87878787878787878787878787878787876B6B6B6B6B78786B6B6B78786B6B6B
        69696B6B6161616767626262676762626B6B6B69697B7B7B6B6B838397979797
        97939393A7A79393ABABABACACACACACACACA5A5ACACACA2A2ACACACA7A7ACAC
        A7A7A7A7A7939393A7A7979793939393939797979393970000000A0A0A0A0A12
        120A0A0A121212121313132424171717252512122F2F2F2F2F3F3F3F3F3F5151
        61616169696B6B6B6B6B6B6B87878787878787878787878787878787876B6B6B
        6B6B78786B6B6B78786B6B6B69696B6B6161616767626262676762626B6B6B69
        697B7B7B6B6B83839797979797939393A7A79393ABABABACACACACACACACA5A5
        ACACACA2A2ACACACA7A7ACACA7A7A7A7A7939393A7A797979393939393979797
        93939700000012120A0A0A121212121212121313242424171724242425252020
        2424242F2F3F3F3F3F3F4C4C62626278786B6B6B7B7B6B6B8A8A8A8787979797
        9F9F979787878783838383836B6B858576767676767B7B7B676769696161615C
        5C6767675D5D6B6B6B6B6B838383838397979797939393A5A5ACACACACACA5A5
        B9B9B9A5A5B9B9B9ACACACACACACACACACB1B1B1A5A5B9B9ACACACACACA7A7A7
        A5A5ACAC939393A7A7ABABABA7A7A500000012120A0A0A121212121212121313
        2424241717242424252520202424242F2F3F3F3F3F3F4C4C62626278786B6B6B
        7B7B6B6B8A8A8A87879797979F9F979787878783838383836B6B858576767676
        767B7B7B676769696161615C5C6767675D5D6B6B6B6B6B838383838397979797
        939393A5A5ACACACACACA5A5B9B9B9A5A5B9B9B9ACACACACACACACACACB1B1B1
        A5A5B9B9ACACACACACA7A7A7A5A5ACAC939393A7A7ABABABA7A7A50000001212
        0A0A0A1212121212121213132424241717242424252520202424242F2F3F3F3F
        3F3F4C4C62626278786B6B6B7B7B6B6B8A8A8A87879797979F9F979787878783
        838383836B6B858576767676767B7B7B676769696161615C5C6767675D5D6B6B
        6B6B6B838383838397979797939393A5A5ACACACACACA5A5B9B9B9A5A5B9B9B9
        ACACACACACACACACACB1B1B1A5A5B9B9ACACACACACA7A7A7A5A5ACAC939393A7
        A7ABABABA7A7A50000000A0A0A0A0A1212121212121212122424241717252525
        252520202F2F2F3F3F3F3F3F4C4C4C4C67676769697B7B7B8686868697979797
        97989898979798989797978787939393838383836B6B6B83838383837B7B6B6B
        6767676B6B6767676B6B76766B6B6B97979797979797ACACACACACBABAB0B0B0
        C6C6B9B9BABABABABABABABABABAB0B0B0B0B0ACACBABABABABAA6A6BABABAB0
        B0B9B9B9ACACACACA5A5A5ABABACACACBABAB10000000A0A0A0A0A1212121212
        121212122424241717252525252520202F2F2F3F3F3F3F3F4C4C4C4C67676769
        697B7B7B86868686979797979798989897979898979797878793939383838383
        6B6B6B83838383837B7B6B6B6767676B6B6767676B6B76766B6B6B9797979797
        9797ACACACACACBABAB0B0B0C6C6B9B9BABABABABABABABABABAB0B0B0B0B0AC
        ACBABABABABAA6A6BABABAB0B0B9B9B9ACACACACA5A5A5ABABACACACBABAB100
        000012120A0A0A121212121213131212252525252525252525252F2F3030303F
        3F4C4C4C4C4C5D5D7878786D6D868686868697979797979797ACACACADADACAC
        97979797979797979393878793939393938383836B6B85857676767676767676
        76766B6B838383A7A7ABABABACACB1B1B0B0B0C3C3C3C3C3C3C3BABAC3C3C3C3
        C3C3C3C3BABAC3C3ACACACB9B9BABABABABABABABABABAB0B0ACACACBABAB0B0
        A5A5A5ACACBABABABABABA00000012120A0A0A12121212121313121225252525
        2525252525252F2F3030303F3F4C4C4C4C4C5D5D7878786D6D86868686869797
        9797979797ACACACADADACAC9797979797979797939387879393939393838383
        6B6B8585767676767676767676766B6B838383A7A7ABABABACACB1B1B0B0B0C3
        C3C3C3C3C3C3BABAC3C3C3C3C3C3C3C3BABAC3C3ACACACB9B9BABABABABABABA
        BABABAB0B0ACACACBABAB0B0A5A5A5ACACBABABABABABA0000000A0A0A0A0A12
        12131313161620201212122525252525292930303F3F3F52525858585D5D5D5D
        6D6D6D878783838386869797A7A7A79797A7A7A7ADADA7A7A7A7A7A7A7979797
        979793939797979797979797838383838383837B7B83838383838383838383B1
        B1B1B1B1B1B1BABAC6C6C6C3C3C6C6C6D0D0C3C3C7C7C7C3C3C7C7C7C3C3C3C3
        BABABAB0B0C3C3C3BDBDBABAC3C3C3BABABABABAC6C6ACACACACACACACC3C3C3
        BABAC30000000A0A0A0A0A121213131316162020121212252525252529293030
        3F3F3F52525858585D5D5D5D6D6D6D878783838386869797A7A7A79797A7A7A7
        ADADA7A7A7A7A7A7A7979797979793939797979797979797838383838383837B
        7B83838383838383838383B1B1B1B1B1B1B1BABAC6C6C6C3C3C6C6C6D0D0C3C3
        C7C7C7C3C3C7C7C7C3C3C3C3BABABAB0B0C3C3C3BDBDBABAC3C3C3BABABABABA
        C6C6ACACACACACACACC3C3C3BABAC30000000A0A0A0A0A121213131316162020
        1212122525252525292930303F3F3F52525858585D5D5D5D6D6D6D8787838383
        86869797A7A7A79797A7A7A7ADADA7A7A7A7A7A7A79797979797939397979797
        97979797838383838383837B7B83838383838383838383B1B1B1B1B1B1B1BABA
        C6C6C6C3C3C6C6C6D0D0C3C3C7C7C7C3C3C7C7C7C3C3C3C3BABABAB0B0C3C3C3
        BDBDBABAC3C3C3BABABABABAC6C6ACACACACACACACC3C3C3BABAC30000001010
        20202013131313130A0A121220202024242E2E2E3B3B4C4C4C4C4C5D5D505050
        67676767767676767693939393939797979797A7A7ACACACB1B1B1B1A7A7A7AC
        AC97979797979F9F9393939393939393939393939393939393939393A5A5ACAC
        B1B1B1C6C6C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C6C6C6C6C6C6C6C6C6C6
        C3C3C3C3C3C3C3C3C3C6C6C6BABABABAB0B0B0ACACB0B0B0ACACB0B0B8B8B8AC
        ACB9B9B9B9B9B9000000101020202013131313130A0A121220202024242E2E2E
        3B3B4C4C4C4C4C5D5D50505067676767767676767693939393939797979797A7
        A7ACACACB1B1B1B1A7A7A7ACAC97979797979F9F939393939393939393939393
        9393939393939393A5A5ACACB1B1B1C6C6C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C6C6C6C6C6C6C6C6C6C6C3C3C3C3C3C3C3C3C3C6C6C6BABABABAB0B0B0AC
        ACB0B0B0ACACB0B0B8B8B8ACACB9B9B9B9B9B900000013132020201717131313
        131320202424242F2F3232324C4C616169696961617878787676787885858583
        8397979797979393A7A7A7ACACA7A7A7B1B1B1B1ACACACACACACACACA7A7ACAC
        939393ACAC939393ABAB9F9FA1A1A1A1A1ABABABACACB1B1BABABAD0D0C6C6C6
        D0D0C6C6C6C6C6C6C6D0D0D0C6C6C6C6D0D0D0C6C6D0D0D0C6C6C6C6C3C3C3C3
        C3C7C7C7C3C3C3C3BABABAB0B0C3C3C3BABABABAACACACC6C6B9B9B9BABABA00
        000013132020201717131313131320202424242F2F3232324C4C616169696961
        6178787876767878858585838397979797979393A7A7A7ACACA7A7A7B1B1B1B1
        ACACACACACACACACA7A7ACAC939393ACAC939393ABAB9F9FA1A1A1A1A1ABABAB
        ACACB1B1BABABAD0D0C6C6C6D0D0C6C6C6C6C6C6C6D0D0D0C6C6C6C6D0D0D0C6
        C6D0D0D0C6C6C6C6C3C3C3C3C3C7C7C7C3C3C3C3BABABAB0B0C3C3C3BABABABA
        ACACACC6C6B9B9B9BABABA00000030303030302525171717252524242F2F2F3F
        3F51515151516B6B6B6B6B83836B6B6B979793939797979393ACACACA7A7A5A5
        ACACACACACA7A7A7ACACB1B1ACACACACACACACACACACACACB7B7B7ACACB7B7B7
        A5A5B9B9A5A5A5ADADB9B9B9BABAC7C7C7C7C7C7C7D0D0D0D0D0D0D0D0D0D0D0
        D0D0D0D0D0D0D0D0D3D3D3D0D0D3D3D3D0D0D0D0C6C6C6D0D0C7C7C7C7C7C7C7
        BABABAC3C3C3C3C3C3C3C7C7C7C7C7C7C7C7C7C7C7C7C6000000303030303025
        25171717252524242F2F2F3F3F51515151516B6B6B6B6B83836B6B6B97979393
        9797979393ACACACA7A7A5A5ACACACACACA7A7A7ACACB1B1ACACACACACACACAC
        ACACACACB7B7B7ACACB7B7B7A5A5B9B9A5A5A5ADADB9B9B9BABAC7C7C7C7C7C7
        C7D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D3D3D3D0D0D3D3D3D0D0D0D0
        C6C6C6D0D0C7C7C7C7C7C7C7BABABAC3C3C3C3C3C3C3C7C7C7C7C7C7C7C7C7C7
        C7C7C600000030303030302525171717252524242F2F2F3F3F51515151516B6B
        6B6B6B83836B6B6B979793939797979393ACACACA7A7A5A5ACACACACACA7A7A7
        ACACB1B1ACACACACACACACACACACACACB7B7B7ACACB7B7B7A5A5B9B9A5A5A5AD
        ADB9B9B9BABAC7C7C7C7C7C7C7D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
        D3D3D3D0D0D3D3D3D0D0D0D0C6C6C6D0D0C7C7C7C7C7C7C7BABABAC3C3C3C3C3
        C3C3C7C7C7C7C7C7C7C7C7C7C7C7C60000002F2F40404029292F2F2F29293030
        3F3F3F515161616169697F7F8A8A8A8A8A9797979797A2A2A5A5A5A5A5B9B9B9
        ACACB1B1B1B1B1A5A5B9B9B9ACACB1B1ACACACB9B9ADADADB9B9C5C5B9B9B9C7
        C7C5C5C5C3C3BABAC7C7C7C7C7C7C7C7C7C7C7C7C7C7C7DBDBC7C7C7DBDBC7C7
        DBDBDBD0D0D4D4D4D0D0DBDBD0D0D0C7C7C7C7C7C7C7D0D0D3D3D3D0D0C7C7C7
        C7C7C7C7C6C6C6C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C70000002F2F
        40404029292F2F2F292930303F3F3F515161616169697F7F8A8A8A8A8A979797
        9797A2A2A5A5A5A5A5B9B9B9ACACB1B1B1B1B1A5A5B9B9B9ACACB1B1ACACACB9
        B9ADADADB9B9C5C5B9B9B9C7C7C5C5C5C3C3BABAC7C7C7C7C7C7C7C7C7C7C7C7
        C7C7C7DBDBC7C7C7DBDBC7C7DBDBDBD0D0D4D4D4D0D0DBDBD0D0D0C7C7C7C7C7
        C7C7D0D0D3D3D3D0D0C7C7C7C7C7C7C7C6C6C6C7C7C7C7C7C7C7C7C7C7C7C7C7
        C7C7C7C7C7C7C700000033334040402F2F2F2F2F3F3F3F3F5151516161787878
        7D7D86869696969696A2A2A2A2A2A6A6B0B0B0B0B0BABABABABABABABABABAB0
        B0BABABAB0B0ACACB9B9B9B9B9B9B9B9BABAC4C4C7C7C7C7C7C7C7C7C7C7C6C6
        C6C6C6C7C7C7C7C7D4D4D4D4D4D4D4DBDBD3D3D3DBDBD4D4DBDBDBD4D4DADADA
        D4D4DBDBD4D4D4D3D3DBDBDBD0D0D0D0D0D0D0C7C7D4D4D4C7C7C7C7CECECEC6
        C6C7C7C7D0D0D0D0D4D4D4D4D4D4D4D4C7C7C700000033334040402F2F2F2F2F
        3F3F3F3F51515161617878787D7D86869696969696A2A2A2A2A2A6A6B0B0B0B0
        B0BABABABABABABABABABAB0B0BABABAB0B0ACACB9B9B9B9B9B9B9B9BABAC4C4
        C7C7C7C7C7C7C7C7C7C7C6C6C6C6C6C7C7C7C7C7D4D4D4D4D4D4D4DBDBD3D3D3
        DBDBD4D4DBDBDBD4D4DADADAD4D4DBDBD4D4D4D3D3DBDBDBD0D0D0D0D0D0D0C7
        C7D4D4D4C7C7C7C7CECECEC6C6C7C7C7D0D0D0D0D4D4D4D4D4D4D4D4C7C7C700
        000033334040402F2F3F3F3F3F3F3F3F5D5D5D69697F7F7F8A8A9797969696A2
        A2A6A6A6A5A5B0B0B0B0B0B8B8C6C6C6BABAC7C7BABABABABABABABABABABABA
        B9B9B9B9B9BABABAB9B9C6C6C7C7C7C7C7C7C7C7D0D0C7C7D4D4D4C6C6CFCFCF
        D4D4D0D0DBDBDBDBDBDBDBDBDADADBDBDBDBDBDBDBDBDBDBDBDBD4D4D0D0D0DB
        DBD0D0D0D4D4D0D0D0D0D0D0D0C7C7C7CFCFCDCDC6C6C6D0D0CDCDCDD0D0D0D0
        C7C7C7C7C7D4D4D4C7C7D400000033334040402F2F3F3F3F3F3F3F3F5D5D5D69
        697F7F7F8A8A9797969696A2A2A6A6A6A5A5B0B0B0B0B0B8B8C6C6C6BABAC7C7
        BABABABABABABABABABABABAB9B9B9B9B9BABABAB9B9C6C6C7C7C7C7C7C7C7C7
        D0D0C7C7D4D4D4C6C6CFCFCFD4D4D0D0DBDBDBDBDBDBDBDBDADADBDBDBDBDBDB
        DBDBDBDBDBDBD4D4D0D0D0DBDBD0D0D0D4D4D0D0D0D0D0D0D0C7C7C7CFCFCDCD
        C6C6C6D0D0CDCDCDD0D0D0D0C7C7C7C7C7D4D4D4C7C7D400000033334040402F
        2F3F3F3F3F3F3F3F5D5D5D69697F7F7F8A8A9797969696A2A2A6A6A6A5A5B0B0
        B0B0B0B8B8C6C6C6BABAC7C7BABABABABABABABABABABABAB9B9B9B9B9BABABA
        B9B9C6C6C7C7C7C7C7C7C7C7D0D0C7C7D4D4D4C6C6CFCFCFD4D4D0D0DBDBDBDB
        DBDBDBDBDADADBDBDBDBDBDBDBDBDBDBDBDBD4D4D0D0D0DBDBD0D0D0D4D4D0D0
        D0D0D0D0D0C7C7C7CFCFCDCDC6C6C6D0D0CDCDCDD0D0D0D0C7C7C7C7C7D4D4D4
        C7C7D40000002F2F2F2F2F3F3F3B3B3B3F3F4C4C61616178788787878C8CA1A1
        A6A6A6A6A6A6A6A6B0B0BCBCBCBCBCBCBCC3C3C3C3C3BABAC3C3C3C7C7C7C7C7
        C3C3C7C7BABABAB9B9C3C3C3C4C4C3C3C6C6C6C7C7C7C7C7CFCFCFCFC6C6C6C6
        C6C6C6C6D0D0D0D0D0D0D0DBDBD4D4D4D4D4D4D4D0D0D0DBDBD4D4D4D0D0D0D0
        D4D4D4D0D0C7C7C7D4D4CFCFC7C7C7D0D0CFCFCFCDCDC4C4CDCDCDCDCDCFCFCF
        D0D0D7D7C7C7C7C7C7C7C7C7C7C7C70000002F2F2F2F2F3F3F3B3B3B3F3F4C4C
        61616178788787878C8CA1A1A6A6A6A6A6A6A6A6B0B0BCBCBCBCBCBCBCC3C3C3
        C3C3BABAC3C3C3C7C7C7C7C7C3C3C7C7BABABAB9B9C3C3C3C4C4C3C3C6C6C6C7
        C7C7C7C7CFCFCFCFC6C6C6C6C6C6C6C6D0D0D0D0D0D0D0DBDBD4D4D4D4D4D4D4
        D0D0D0DBDBD4D4D4D0D0D0D0D4D4D4D0D0C7C7C7D4D4CFCFC7C7C7D0D0CFCFCF
        CDCDC4C4CDCDCDCDCDCFCFCFD0D0D7D7C7C7C7C7C7C7C7C7C7C7C70000003030
        3030303B3B3232323F3F4C4C6161616B6B8A8A8A9898B1B1A6A6A6A6A6BDBDBD
        BCBCC6C6C6C6C6D0D0C6C6C6C3C3C6C6C3C3C3C6C6C3C3C3C7C7C6C6C4C4C4B9
        B9C4C4C4C4C4C4C4C3C3C3C6C6C6C6C6CFCFC6C6CFCFCFC3C3D2D2D2C3C3CFCF
        D0D0D0DBDBD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D0D0D0D4D4CFCFCF
        C7C7C7C7C6C6C6C7C7C4C4C4C4C4C4C4C4C4C4CDCDCDCDCDD0D0D0D0C6C6C6C6
        C6C7C7C7C7C7C700000030303030303B3B3232323F3F4C4C6161616B6B8A8A8A
        9898B1B1A6A6A6A6A6BDBDBDBCBCC6C6C6C6C6D0D0C6C6C6C3C3C6C6C3C3C3C6
        C6C3C3C3C7C7C6C6C4C4C4B9B9C4C4C4C4C4C4C4C3C3C3C6C6C6C6C6CFCFC6C6
        CFCFCFC3C3D2D2D2C3C3CFCFD0D0D0DBDBD4D4D4D4D4D4D4D4D4D4D4D4D4D4D4
        D4D4D4D4D0D0D0D4D4CFCFCFC7C7C7C7C6C6C6C7C7C4C4C4C4C4C4C4C4C4C4CD
        CDCDCDCDD0D0D0D0C6C6C6C6C6C7C7C7C7C7C7000000242424242433333F3F3F
        3F3F5D5D69696986869797979797B9B9C3C3C3C7C7C7C7C7C7C7C7C7C7C7C7C3
        C3C3C3C3C3C3C3C3C3C3C3C6C6C6C6C6B9B9B9B9C6C6C6C6C6C6C6C6C6C6C6C6
        C7C7C7D0D0D0D0D0D0D0D9D9D0D0D0D0D0D7D7D7CFCFD0D0D0D0D0DADADADADA
        DADAD0D0D7D7D7D0D0CFCFCFCDCDC6C6C7C7C7CFCFC6C6C6C6C6D0D0C6C6C6CF
        CFC6C6C6C6C6C6C6C6C6C6C7C7C6C6C6C7C7D4D4C3C3C3C3C3C3C3C3C3C3C300
        0000242424242433333F3F3F3F3F5D5D69696986869797979797B9B9C3C3C3C7
        C7C7C7C7C7C7C7C7C7C7C7C3C3C3C3C3C3C3C3C3C3C3C3C6C6C6C6C6B9B9B9B9
        C6C6C6C6C6C6C6C6C6C6C6C6C7C7C7D0D0D0D0D0D0D0D9D9D0D0D0D0D0D7D7D7
        CFCFD0D0D0D0D0DADADADADADADAD0D0D7D7D7D0D0CFCFCFCDCDC6C6C7C7C7CF
        CFC6C6C6C6C6D0D0C6C6C6CFCFC6C6C6C6C6C6C6C6C6C6C7C7C6C6C6C7C7D4D4
        C3C3C3C3C3C3C3C3C3C3C300000024242424242F2F3F3F3F51515D5D6B6B6B83
        83979797A7A7ACACC3C3C3C7C7C7C7C7C7C7C7C7C7C7C7C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C6C6C6C6C6C6C6C6C6C6C6C6D0D0D0C6C6D0D0C6C6C6C7C7D0D0D0
        D0D0D0D0D0D0D0D9D9D0D0D0DADAD0D0D7D7D7DADADADADADADAD7D7D4D4D4CF
        CFCFCFCFCDCDC6C6C6C6C6C7C7C6C6C6C7C7C6C6C7C7C7C7C7C6C6C6C6C6C6C6
        C7C7C7C6C6C7C7C7D0D0C7C7C6C6C6C6C6C6C6C6C6C6B900000024242424242F
        2F3F3F3F51515D5D6B6B6B8383979797A7A7ACACC3C3C3C7C7C7C7C7C7C7C7C7
        C7C7C7C3C3C3C3C3C3C3C3C3C3C3C3C3C3C6C6C6C6C6C6C6C6C6C6C6C6D0D0D0
        C6C6D0D0C6C6C6C7C7D0D0D0D0D0D0D0D0D0D0D9D9D0D0D0DADAD0D0D7D7D7DA
        DADADADADADAD7D7D4D4D4CFCFCFCFCFCDCDC6C6C6C6C6C7C7C6C6C6C7C7C6C6
        C7C7C7C7C7C6C6C6C6C6C6C6C7C7C7C6C6C7C7C7D0D0C7C7C6C6C6C6C6C6C6C6
        C6C6B900000024242424242F2F3F3F3F51515D5D6B6B6B8383979797A7A7ACAC
        C3C3C3C7C7C7C7C7C7C7C7C7C7C7C7C3C3C3C3C3C3C3C3C3C3C3C3C3C3C6C6C6
        C6C6C6C6C6C6C6C6C6D0D0D0C6C6D0D0C6C6C6C7C7D0D0D0D0D0D0D0D0D0D0D9
        D9D0D0D0DADAD0D0D7D7D7DADADADADADADAD7D7D4D4D4CFCFCFCFCFCDCDC6C6
        C6C6C6C7C7C6C6C6C7C7C6C6C7C7C7C7C7C6C6C6C6C6C6C6C7C7C7C6C6C7C7C7
        D0D0C7C7C6C6C6C6C6C6C6C6C6C6B90000002E2E2F2F2F2F2F3F3F3F3F3F5D5D
        7676768A8A979797ACACBABAC3C3C3C7C7C7C7C7DBDBC7C7C7C7C7C7C7C6C6C6
        C6C6C6C6C6C6C6D0D0D0D0D0D0D0D0D0C6C6C6D0D0C6C6C6D0D0D0D0D0D0D0D0
        D0D0D0D0DADAD0D0DADADAD0D0D0D0D0D7D7D7D7D0D0D0DADADADADAD7D7D4D4
        CFCFCFD0D0D0D0D0D0D0C6C6C7C7C7C6C6D0D0D0C6C6C7C7C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C7C7C7C6C6C7C7C6C6C6C6C6C6C6C6C3C3C30000002E2E
        2F2F2F2F2F3F3F3F3F3F5D5D7676768A8A979797ACACBABAC3C3C3C7C7C7C7C7
        DBDBC7C7C7C7C7C7C7C6C6C6C6C6C6C6C6C6C6D0D0D0D0D0D0D0D0D0C6C6C6D0
        D0C6C6C6D0D0D0D0D0D0D0D0D0D0D0D0DADAD0D0DADADAD0D0D0D0D0D7D7D7D7
        D0D0D0DADADADADAD7D7D4D4CFCFCFD0D0D0D0D0D0D0C6C6C7C7C7C6C6D0D0D0
        C6C6C7C7C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C7C7C7C6C6C7C7C6C6C6C6
        C6C6C6C6C3C3C30000002E2E3F3F3F32324C4C4C4C4C6B6B7676769797ACACAC
        B1B1C3C3C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C6C6C6C6C6D0D0D0D0D0D3
        D3D4D4D4DBDBD4D4D0D0D0D0D0D0D0D0D0D0D0D0D3D3D3C7C7DBDBDBD0D0D7D7
        D7D7D7D7D7D7D7D7D7D7D0D0D7D7D7DADADADADAD4D4D7D7D0D0D0D0D0CFCFCF
        D0D0CFCFC6C6C6C7C7C6C6C6C7C7C6C6C6C6C6C7C7C4C4C4C3C3C3C3C6C6C6C6
        C6C6C6C6C7C7C6C6C7C7C7C7C7C3C3C3C6C6C30000002E2E3F3F3F32324C4C4C
        4C4C6B6B7676769797ACACACB1B1C3C3C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7C7
        C7C6C6C6C6C6D0D0D0D0D0D3D3D4D4D4DBDBD4D4D0D0D0D0D0D0D0D0D0D0D0D0
        D3D3D3C7C7DBDBDBD0D0D7D7D7D7D7D7D7D7D7D7D7D7D0D0D7D7D7DADADADADA
        D4D4D7D7D0D0D0D0D0CFCFCFD0D0CFCFC6C6C6C7C7C6C6C6C7C7C6C6C6C6C6C7
        C7C4C4C4C3C3C3C3C6C6C6C6C6C6C6C6C7C7C6C6C7C7C7C7C7C3C3C3C6C6C300
        00003F3F4C4C4C3F3F515151505076768383839797ACACACBABAC3C3C3C3C3C7
        C7C7C7C7C7C7C7C7C7C7C7C7C7D0D0D0D0D0D0D0D0D0D0D4D4DBDBDBDBDBDBDB
        D0D0D0D0D0D0D0D0D3D3C7C7DBDBDBD4D4D4D4D4D0D0D9D9DADADADADADADADA
        DADADADADADADADADAD0D0D0D7D7D4D4D7D7D7D0D0D0D0D0D0D0C6C6C7C7C7C6
        C6C7C7C7C6C6C6C6C7C7C7C6C6C6C6C6B9B9C6C6C6C6C6C3C3C6C6C6C6C6C6C6
        C7C7C7C7C7C6C6C6BABAC30000003F3F4C4C4C3F3F5151515050767683838397
        97ACACACBABAC3C3C3C3C3C7C7C7C7C7C7C7C7C7C7C7C7C7C7D0D0D0D0D0D0D0
        D0D0D0D4D4DBDBDBDBDBDBDBD0D0D0D0D0D0D0D0D3D3C7C7DBDBDBD4D4D4D4D4
        D0D0D9D9DADADADADADADADADADADADADADADADADAD0D0D0D7D7D4D4D7D7D7D0
        D0D0D0D0D0D0C6C6C7C7C7C6C6C7C7C7C6C6C6C6C7C7C7C6C6C6C6C6B9B9C6C6
        C6C6C6C3C3C6C6C6C6C6C6C6C7C7C7C7C7C6C6C6BABAC30000003F3F4C4C4C3F
        3F515151505076768383839797ACACACBABAC3C3C3C3C3C7C7C7C7C7C7C7C7C7
        C7C7C7C7C7D0D0D0D0D0D0D0D0D0D0D4D4DBDBDBDBDBDBDBD0D0D0D0D0D0D0D0
        D3D3C7C7DBDBDBD4D4D4D4D4D0D0D9D9DADADADADADADADADADADADADADADADA
        DAD0D0D0D7D7D4D4D7D7D7D0D0D0D0D0D0D0C6C6C7C7C7C6C6C7C7C7C6C6C6C6
        C7C7C7C6C6C6C6C6B9B9C6C6C6C6C6C3C3C6C6C6C6C6C6C6C7C7C7C7C7C6C6C6
        BABAC30000004C4C5D5D5D616161616178787676979797ABABACACACC3C3BABA
        C6C6C6C3C3C3C3C3C7C7C7C7C3C3C3C7C7C7C7C7D0D0D0D0D4D4D4D0D0DBDBDB
        DBDBDBDBD3D3D3DBDBD4D4D4DBDBD4D4DBDBDBDBDBDBDBDBDBDBD7D7DADADADA
        DADADADADADADADADADADAD0D0D7D7D7D4D4D7D7CFCFCFD7D7D4D4D4CFCFC7C7
        C6C6C6C7C7C6C6C6C6C6D0D0C6C6C6C6C6B9B9B9C6C6B9B9C3C3C3C6C6C3C3C3
        C6C6C3C3C7C7C7BABABABABABABAAC0000004C4C5D5D5D616161616178787676
        979797ABABACACACC3C3BABAC6C6C6C3C3C3C3C3C7C7C7C7C3C3C3C7C7C7C7C7
        D0D0D0D0D4D4D4D0D0DBDBDBDBDBDBDBD3D3D3DBDBD4D4D4DBDBD4D4DBDBDBDB
        DBDBDBDBDBDBD7D7DADADADADADADADADADADADADADADAD0D0D7D7D7D4D4D7D7
        CFCFCFD7D7D4D4D4CFCFC7C7C6C6C6C7C7C6C6C6C6C6D0D0C6C6C6C6C6B9B9B9
        C6C6B9B9C3C3C3C6C6C3C3C3C6C6C3C3C7C7C7BABABABABABABAAC0000006161
        6B6B6B69696B6B6B6B6B9797939393ACACC3C3C3BABAC6C6BABABAB9B9B9B9B9
        C6C6C3C3BABABAC7C7C7C7C7DBDBD0D0D3D3D3D4D4DADADAC7C7DBDBC7C7C7DB
        DBC7C7C7DBDBDBDBDBDBDBDBDBDBDBDBDADADADADADADADADADADADADADADADA
        DADADADADAD0D0D0D7D7D4D4D7D7D7D4D4D7D7D7DADAC6C6C6C6C6C6C6C6C6C6
        C7C7D0D0C6C6C6D0D0C6C6C6B9B9B9B9C6C6C6C6C6C3C3C3C3C3D0D0BABABABA
        BAB1B1B1A5A5AC00000061616B6B6B69696B6B6B6B6B9797939393ACACC3C3C3
        BABAC6C6BABABAB9B9B9B9B9C6C6C3C3BABABAC7C7C7C7C7DBDBD0D0D3D3D3D4
        D4DADADAC7C7DBDBC7C7C7DBDBC7C7C7DBDBDBDBDBDBDBDBDBDBDBDBDADADADA
        DADADADADADADADADADADADADADADADADAD0D0D0D7D7D4D4D7D7D7D4D4D7D7D7
        DADAC6C6C6C6C6C6C6C6C6C6C7C7D0D0C6C6C6D0D0C6C6C6B9B9B9B9C6C6C6C6
        C6C3C3C3C3C3D0D0BABABABABAB1B1B1A5A5AC0000006B6B6969697070878787
        87879797979797ADADB9B9B9C3C3BABAB0B0B0C6C6ACACACACACC3C3C3C3C3C3
        C3D4D4D4C7C7D4D4D0D0D0D0D0D0D0D0D4D4D0D0DBDBDBD4D4DBDBDBDBDBDBDB
        DBDBDBDADADADADADADADADADADADADADADADADADADADADADADADAD0D0D0D0D0
        D4D4CFCFD4D4D4D7D7D4D4D4D0D0D0D0D0D0D0C6C6D0D0D0C3C3D0D0C3C3C3D0
        D0B0B0B0C6C6B9B9C3C3C3C3C3C3C3C3C3C3C6C6BABABABABAB1B1B1ACACA200
        00006B6B696969707087878787879797979797ADADB9B9B9C3C3BABAB0B0B0C6
        C6ACACACACACC3C3C3C3C3C3C3D4D4D4C7C7D4D4D0D0D0D0D0D0D0D0D4D4D0D0
        DBDBDBD4D4DBDBDBDBDBDBDBDBDBDBDADADADADADADADADADADADADADADADADA
        DADADADADADADAD0D0D0D0D0D4D4CFCFD4D4D4D7D7D4D4D4D0D0D0D0D0D0D0C6
        C6D0D0D0C3C3D0D0C3C3C3D0D0B0B0B0C6C6B9B9C3C3C3C3C3C3C3C3C3C3C6C6
        BABABABABAB1B1B1ACACA20000006B6B696969707087878787879797979797AD
        ADB9B9B9C3C3BABAB0B0B0C6C6ACACACACACC3C3C3C3C3C3C3D4D4D4C7C7D4D4
        D0D0D0D0D0D0D0D0D4D4D0D0DBDBDBD4D4DBDBDBDBDBDBDBDBDBDBDADADADADA
        DADADADADADADADADADADADADADADADADADADAD0D0D0D0D0D4D4CFCFD4D4D4D7
        D7D4D4D4D0D0D0D0D0D0D0C6C6D0D0D0C3C3D0D0C3C3C3D0D0B0B0B0C6C6B9B9
        C3C3C3C3C3C3C3C3C3C3C6C6BABABABABAB1B1B1ACACA2000000696983838397
        979F9F9FADADACACA7A7A7BABABABABAB9B9C3C3C3C3C3BABAC3C3C3C7C7C7C7
        C7C7C7C7C7C3C3C3D0D0D4D4DBDBDBD4D4DADADAC7C7C7C7DADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADAD4
        D4D4D4D4D0D0D3D3D0D0D0C7C7D0D0D0D0D0C6C6C7C7C7D0D0C6C6C6C6C6C7C7
        C6C6C6C6C6CECECEC3C3C7C7C7C7C7C7C7C4C4C4C3C3BABAACACACACACA5A5A5
        ACACA7000000696983838397979F9F9FADADACACA7A7A7BABABABABAB9B9C3C3
        C3C3C3BABAC3C3C3C7C7C7C7C7C7C7C7C7C3C3C3D0D0D4D4DBDBDBD4D4DADADA
        C7C7C7C7DADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADADADADADAD4D4D4D4D4D0D0D3D3D0D0D0C7C7D0D0D0D0D0C6C6
        C7C7C7D0D0C6C6C6C6C6C7C7C6C6C6C6C6CECECEC3C3C7C7C7C7C7C7C7C4C4C4
        C3C3BABAACACACACACA5A5A5ACACA700000078786B6B6B97979F9F9F9797B9B9
        ACACACBABAC3C3C3BABAC3C3C6C6C6C7C7C7C7C7C7C7C7C7C3C3C3C7C7D0D0D0
        D0D0C7C7DBDBDBDBDBD4D4D4DADAC7C7D9D9D9DADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADADADADADAD4D4D0D0D0DBDBD0D0
        D4D4D4D0D0D3D3D3D0D0D0D0D0D0D0C6C6D0D0D0C6C6C6C6C6C6C6C6C6C7C7C7
        CECEC6C6C7C7C7C7C7C6C6C6C4C4B9B9B9B9B9B9B9ACACACA7A7930000007878
        6B6B6B97979F9F9F9797B9B9ACACACBABAC3C3C3BABAC3C3C6C6C6C7C7C7C7C7
        C7C7C7C7C3C3C3C7C7D0D0D0D0D0C7C7DBDBDBDBDBD4D4D4DADAC7C7D9D9D9DA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADADA
        DADADAD4D4D0D0D0DBDBD0D0D4D4D4D0D0D3D3D3D0D0D0D0D0D0D0C6C6D0D0D0
        C6C6C6C6C6C6C6C6C6C7C7C7CECEC6C6C7C7C7C7C7C6C6C6C4C4B9B9B9B9B9B9
        B9ACACACA7A79300000078786B6B6B9797979797ADADA7A7B7B7B7BABAC3C3C3
        BABAC3C3BABABAC3C3C6C6C6C7C7C7C7C7C7C7C7C7D0D0D0C7C7DBDBDBDBDBD4
        D4DBDBDBD4D4DADAD0D0D0D0D0D9D9D9DADADADADADADADADADADADADADADADA
        DADADADADADADADADADADADADADADAD4D4DBDBDBD3D3D0D0D0D0D0D0D0D0D0D0
        D0D0C6C6C7C7C7D0D0C6C6C6D0D0C3C3C6C6C6C6C6C7C7C7C6C6C7C7C7C7C7C7
        C7C4C4C4BABAC3C3B9B9B9B9B9ACACACACACA700000078786B6B6B9797979797
        ADADA7A7B7B7B7BABAC3C3C3BABAC3C3BABABAC3C3C6C6C6C7C7C7C7C7C7C7C7
        C7D0D0D0C7C7DBDBDBDBDBD4D4DBDBDBD4D4DADAD0D0D0D0D0D9D9D9DADADADA
        DADADADADADADADADADADADADADADADADADADADADADADADADADADAD4D4DBDBDB
        D3D3D0D0D0D0D0D0D0D0D0D0D0D0C6C6C7C7C7D0D0C6C6C6D0D0C3C3C6C6C6C6
        C6C7C7C7C6C6C7C7C7C7C7C7C7C4C4C4BABAC3C3B9B9B9B9B9ACACACACACA700
        000078786B6B6B9797979797ADADA7A7B7B7B7BABAC3C3C3BABAC3C3BABABAC3
        C3C6C6C6C7C7C7C7C7C7C7C7C7D0D0D0C7C7DBDBDBDBDBD4D4DBDBDBD4D4DADA
        D0D0D0D0D0D9D9D9DADADADADADADADADADADADADADADADADADADADADADADADA
        DADADADADADADAD4D4DBDBDBD3D3D0D0D0D0D0D0D0D0D0D0D0D0C6C6C7C7C7D0
        D0C6C6C6D0D0C3C3C6C6C6C6C6C7C7C7C6C6C7C7C7C7C7C7C7C4C4C4BABAC3C3
        B9B9B9B9B9ACACACACACA70000006F6F6B6B6B97979797979797ACACB1B1B1BA
        BABABABABABAC3C3C3C3C3C7C7BABABAC3C3C7C7C7C7C7C7C7D4D4D4D0D0D4D4
        DBDBDBDBDBDBDBDBDBDBDBDBD0D0D0D9D9D7D7D7D9D9DADADADADADADADADADA
        DADADADADADADADADADADADADADADADADADADAD4D4D0D0D0DBDBD0D0D4D4D4D0
        D0D0D0D0D0D0D0D0D0D0D0D0D0C6C6C6D0D0C6C6C3C3C3C6C6C7C7C7C7C7C7C7
        C7C7C7C6C6C4C4C4C6C6BABAB9B9B9B0B0B9B9B9ACACA70000006F6F6B6B6B97
        979797979797ACACB1B1B1BABABABABABABAC3C3C3C3C3C7C7BABABAC3C3C7C7
        C7C7C7C7C7D4D4D4D0D0D4D4DBDBDBDBDBDBDBDBDBDBDBDBD0D0D0D9D9D7D7D7
        D9D9DADADADADADADADADADADADADADADADADADADADADADADADADADADADADAD4
        D4D0D0D0DBDBD0D0D4D4D4D0D0D0D0D0D0D0D0D0D0D0D0D0D0C6C6C6D0D0C6C6
        C3C3C3C6C6C7C7C7C7C7C7C7C7C7C7C6C6C4C4C4C6C6BABAB9B9B9B0B0B9B9B9
        ACACA700000069697B7B7B83838686868A8AACACB1B1B1B1B1C3C3C3BABAC3C3
        BDBDBDC3C3C7C7C7C7C7C3C3C7C7C7C7C7D4D4D4D0D0D4D4D4D4D4D0D0DBDBDB
        DBDBDBDBD0D0D0D0D0D9D9D9D7D7D0D0D7D7D7DADAD7D7D7DADADADADADADADA
        DADADADADADADADADADADADBDBD4D4D4D0D0D3D3C7C7C7DBDBD0D0D0C6C6D0D0
        C6C6C6C7C7D0D0D0C3C3C7C7C6C6C6C6C6C7C7C7C7C7C7C7C7C7C7C7C7CECECE
        B9B9BABAACACACACACACACACA5A59700000069697B7B7B83838686868A8AACAC
        B1B1B1B1B1C3C3C3BABAC3C3BDBDBDC3C3C7C7C7C7C7C3C3C7C7C7C7C7D4D4D4
        D0D0D4D4D4D4D4D0D0DBDBDBDBDBDBDBD0D0D0D0D0D9D9D9D7D7D0D0D7D7D7DA
        DAD7D7D7DADADADADADADADADADADADADADADADADADADADBDBD4D4D4D0D0D3D3
        C7C7C7DBDBD0D0D0C6C6D0D0C6C6C6C7C7D0D0D0C3C3C7C7C6C6C6C6C6C7C7C7
        C7C7C7C7C7C7C7C7C7CECECEB9B9BABAACACACACACACACACA5A5970000006B6B
        6B6B6B767683838386868A8AACACACB1B1A6A6A6BABABABAC3C3C3C3C3C3C3C3
        C7C7C7C7C7C7C7C7C7C7C7C7D4D4C6C6C7C7C7D4D4D0D0D0D4D4D4D4CFCFCFD0
        D0D0D0D0D9D9D7D7D9D9D9DADAD4D4D4DADADADADADADADADADADADAD9D9D7D7
        D7D7D7DBDBD0D0D0D4D4D0D0D3D3D3D0D0D0D0D0D0D0D0D0D0D0D0C6C6D0D0D0
        C6C6C6C6C3C3C3C6C6C7C7C7C7C7C7C7C7C7C7C7C7C6C6C6BABABABAACACACAC
        ACA1A1A19393930000006B6B6B6B6B767683838386868A8AACACACB1B1A6A6A6
        BABABABAC3C3C3C3C3C3C3C3C7C7C7C7C7C7C7C7C7C7C7C7D4D4C6C6C7C7C7D4
        D4D0D0D0D4D4D4D4CFCFCFD0D0D0D0D0D9D9D7D7D9D9D9DADAD4D4D4DADADADA
        DADADADADADADADAD9D9D7D7D7D7D7DBDBD0D0D0D4D4D0D0D3D3D3D0D0D0D0D0
        D0D0D0D0D0D0D0C6C6D0D0D0C6C6C6C6C3C3C3C6C6C7C7C7C7C7C7C7C7C7C7C7
        C7C6C6C6BABABABAACACACACACA1A1A19393930000006B6B6B6B6B7676838383
        86868A8AACACACB1B1A6A6A6BABABABAC3C3C3C3C3C3C3C3C7C7C7C7C7C7C7C7
        C7C7C7C7D4D4C6C6C7C7C7D4D4D0D0D0D4D4D4D4CFCFCFD0D0D0D0D0D9D9D7D7
        D9D9D9DADAD4D4D4DADADADADADADADADADADADAD9D9D7D7D7D7D7DBDBD0D0D0
        D4D4D0D0D3D3D3D0D0D0D0D0D0D0D0D0D0D0D0C6C6D0D0D0C6C6C6C6C3C3C3C6
        C6C7C7C7C7C7C7C7C7C7C7C7C7C6C6C6BABABABAACACACACACA1A1A193939300
        000067676767676B6B7B7B7B85858686A2A2A2A6A6A6A6A6BABAC3C3C3C3C3BD
        BDC7C7C7C7C7C7C7C7C7C7C7C7D4D4D4C6C6C6C6C6C6C6C6C6C7C7C7D4D4D4D4
        D6D6D6D6D6D0D0D0D0D0D7D7D0D0D0D9D9DADADADADADADAD7D7D7D9D9D0D0D0
        D0D0D0D0D0D0D0D0D0DBDBDBD3D3C7C7DBDBDBD0D0D0D0D0D0D0C6C6D0D0D0C6
        C6D0D0D0C6C6C6C6D0D0D0C6C6C7C7C7C7C7C7C7C7C7C7C7C7C4C4C4C3C3C3C3
        939393A1A1A1A1A19F9F9300000067676767676B6B7B7B7B85858686A2A2A2A6
        A6A6A6A6BABAC3C3C3C3C3BDBDC7C7C7C7C7C7C7C7C7C7C7C7D4D4D4C6C6C6C6
        C6C6C6C6C6C7C7C7D4D4D4D4D6D6D6D6D6D0D0D0D0D0D7D7D0D0D0D9D9DADADA
        DADADADAD7D7D7D9D9D0D0D0D0D0D0D0D0D0D0D0D0DBDBDBD3D3C7C7DBDBDBD0
        D0D0D0D0D0D0C6C6D0D0D0C6C6D0D0D0C6C6C6C6D0D0D0C6C6C7C7C7C7C7C7C7
        C7C7C7C7C7C4C4C4C3C3C3C3939393A1A1A1A1A19F9F930000005D5D5C5C5C6A
        6A6A6A6A7B7B9696979797A2A2A6A6A6A5A5C3C3C3C3C3C3C3C3C3C3C7C7C3C3
        C7C7C7C7C7C6C6C6C6C6C3C3C3C3C3C6C6C3C3C3C7C7DBDBD0D0D0D0D0D0D0D0
        D0D0D0D0D7D7D7D7D7D7D7D7D9D9DADAD0D0D0D0D0D7D7D7D0D0CFCFCFCFCFD4
        D4DBDBDBD0D0D0D0C7C7C7D4D4D0D0D0D0D0D0D0D0D0D0D0D0C6C6C6D0D0C3C3
        C3C3C3C3C3C6C6C6C7C7C6C6C7C7C7C7C7C7C7C7C3C3C3C3A1A1A19393A1A1A1
        9393930000005D5D5C5C5C6A6A6A6A6A7B7B9696979797A2A2A6A6A6A5A5C3C3
        C3C3C3C3C3C3C3C3C7C7C3C3C7C7C7C7C7C6C6C6C6C6C3C3C3C3C3C6C6C3C3C3
        C7C7DBDBD0D0D0D0D0D0D0D0D0D0D0D0D7D7D7D7D7D7D7D7D9D9DADAD0D0D0D0
        D0D7D7D7D0D0CFCFCFCFCFD4D4DBDBDBD0D0D0D0C7C7C7D4D4D0D0D0D0D0D0D0
        D0D0D0D0D0C6C6C6D0D0C3C3C3C3C3C3C3C6C6C6C7C7C6C6C7C7C7C7C7C7C7C7
        C3C3C3C3A1A1A19393A1A1A19393930000003F3F404040515150505061616B6B
        6B6B6B86868686868A8AA5A5B0B0B0C3C3BDBDBDC6C6B9B9BABABAC6C6C7C7C7
        C7C7C3C3C3C3C3BABAC6C6C6C7C7C7C7C6C6C6D0D0D0D0D0DADADADADADADAD4
        D4D0D0D0D0D0D9D9DADADAD0D0C6C6C6C6C6CECEC6C6C6D0D0D0D0D0D3D3DADA
        DADADAD0D0D7D7D7D7D7D2D2C3C3C3C6C6C3C3C3C3C3C7C7C5C5C5B9B9BABABA
        B9B9BABABABABAC3C3BABABABABABABAA7A7A797979393938585770000003F3F
        404040515150505061616B6B6B6B6B86868686868A8AA5A5B0B0B0C3C3BDBDBD
        C6C6B9B9BABABAC6C6C7C7C7C7C7C3C3C3C3C3BABAC6C6C6C7C7C7C7C6C6C6D0
        D0D0D0D0DADADADADADADAD4D4D0D0D0D0D0D9D9DADADAD0D0C6C6C6C6C6CECE
        C6C6C6D0D0D0D0D0D3D3DADADADADAD0D0D7D7D7D7D7D2D2C3C3C3C6C6C3C3C3
        C3C3C7C7C5C5C5B9B9BABABAB9B9BABABABABAC3C3BABABABABABABAA7A7A797
        979393938585770000003F3F404040515150505061616B6B6B6B6B8686868686
        8A8AA5A5B0B0B0C3C3BDBDBDC6C6B9B9BABABAC6C6C7C7C7C7C7C3C3C3C3C3BA
        BAC6C6C6C7C7C7C7C6C6C6D0D0D0D0D0DADADADADADADAD4D4D0D0D0D0D0D9D9
        DADADAD0D0C6C6C6C6C6CECEC6C6C6D0D0D0D0D0D3D3DADADADADAD0D0D7D7D7
        D7D7D2D2C3C3C3C6C6C3C3C3C3C3C7C7C5C5C5B9B9BABABAB9B9BABABABABAC3
        C3BABABABABABABAA7A7A797979393938585770000002F2F3F3F3F3F3F515151
        51515C5C6B6B6B7B7B7B7B7B8383A2A2A6A6A6BABABABABABABABABAC3C3C3C7
        C7C7C7C7C3C3BABAC3C3C3BABAC3C3C3C7C7C7C7C3C3C3C7C7D4D4D4D4D4D4D4
        D4D4D4D0D0D4D4D4CFCFD0D0DADADAD0D0C6C6C6C3C3C3C3C7C7C7C7C7D0D0D0
        D3D3D0D0D0D0D0DADAD0D0D0DADAC6C6C6C6C6C6C6C7C7C7C7C7BABAC7C7C7C5
        C5B9B9B9C3C3BABAB9B9B9B7B7B1B1B1A7A7B7B7979797939397979793938500
        00002F2F3F3F3F3F3F51515151515C5C6B6B6B7B7B7B7B7B8383A2A2A6A6A6BA
        BABABABABABABABAC3C3C3C7C7C7C7C7C3C3BABAC3C3C3BABAC3C3C3C7C7C7C7
        C3C3C3C7C7D4D4D4D4D4D4D4D4D4D4D0D0D4D4D4CFCFD0D0DADADAD0D0C6C6C6
        C3C3C3C3C7C7C7C7C7D0D0D0D3D3D0D0D0D0D0DADAD0D0D0DADAC6C6C6C6C6C6
        C6C7C7C7C7C7BABAC7C7C7C5C5B9B9B9C3C3BABAB9B9B9B7B7B1B1B1A7A7B7B7
        979797939397979793938500000024242F2F2F2F2F3F3F3F3E3E51515D5D5D6A
        6A6B6B6B76769696A7A7A7ACACBABABABABAB9B9B7B7B7C3C3BABABABABAC3C3
        BABABABABAC6C6C6C7C7C7C7C7C7C7C5C5C3C3C3C7C7C7C7D4D4D4C7C7D4D4D4
        C3C3D2D2D0D0D0D0D0C3C3C3BABAC3C3C7C7C7C6C6C7C7C7D4D4D4D4D4D4D4DA
        DADADADAD7D7C3C3C6C6C6C3C3C6C6C6BDBDC7C7BABABAC7C7B9B9B9B7B7BABA
        ACACACA7A7ACACAC9898979797979797978A8A8A87879700000024242F2F2F2F
        2F3F3F3F3E3E51515D5D5D6A6A6B6B6B76769696A7A7A7ACACBABABABABAB9B9
        B7B7B7C3C3BABABABABAC3C3BABABABABAC6C6C6C7C7C7C7C7C7C7C5C5C3C3C3
        C7C7C7C7D4D4D4C7C7D4D4D4C3C3D2D2D0D0D0D0D0C3C3C3BABAC3C3C7C7C7C6
        C6C7C7C7D4D4D4D4D4D4D4DADADADADAD7D7C3C3C6C6C6C3C3C6C6C6BDBDC7C7
        BABABAC7C7B9B9B9B7B7BABAACACACA7A7ACACAC9898979797979797978A8A8A
        87879700000024242929292F2F24242432323F3F3F3F3F4C4C5D5D5D50509393
        979797A7A7A7A7A79797A7A7ADADADB7B7B9B9B9B9B9B9B9BABABABABABABABA
        BDBDC7C7B9B9B9B9B9C5C5C5C3C3C7C7C7C7C7C7C7C7C7C7C6C6C6C6C3C3C3C6
        C6C3C3C3B9B9B9B9C7C7C7BABAC6C6C6C7C7D4D4D4D4D4D4D4D4D4D4D4D4C6C6
        B0B0B0C6C6BABABABABAC7C7B7B7B7BABAB7B7B7ACACACAC9797978787878787
        83837D7D7676766B6B8383836B6B6B00000024242929292F2F24242432323F3F
        3F3F3F4C4C5D5D5D50509393979797A7A7A7A7A79797A7A7ADADADB7B7B9B9B9
        B9B9B9B9BABABABABABABABABDBDC7C7B9B9B9B9B9C5C5C5C3C3C7C7C7C7C7C7
        C7C7C7C7C6C6C6C6C3C3C3C6C6C3C3C3B9B9B9B9C7C7C7BABAC6C6C6C7C7D4D4
        D4D4D4D4D4D4D4D4D4D4C6C6B0B0B0C6C6BABABABABAC7C7B7B7B7BABAB7B7B7
        ACACACAC979797878787878783837D7D7676766B6B8383836B6B6B0000002424
        2929292F2F24242432323F3F3F3F3F4C4C5D5D5D50509393979797A7A7A7A7A7
        9797A7A7ADADADB7B7B9B9B9B9B9B9B9BABABABABABABABABDBDC7C7B9B9B9B9
        B9C5C5C5C3C3C7C7C7C7C7C7C7C7C7C7C6C6C6C6C3C3C3C6C6C3C3C3B9B9B9B9
        C7C7C7BABAC6C6C6C7C7D4D4D4D4D4D4D4D4D4D4D4D4C6C6B0B0B0C6C6BABABA
        BABAC7C7B7B7B7BABAB7B7B7ACACACAC979797878787878783837D7D7676766B
        6B8383836B6B6B0000001212121212121212121224242F2F2F2F2F3F3F4C4C4C
        3F3F6A6A7B7B7B8383979797878793939797979898ABABAB9797ACACACACACB1
        B1B1B1B1BABAB1B1B9B9B9ACACB9B9B9B7B7C3C3C7C7C7C7C7C7C7C7B0B0C6C6
        B0B0B0C3C3ACACACB9B9ACACB7B7B7BDBDBDBDBDC6C6C7C7C7C7C7C7C7D4D4D4
        D4D4BABABDBDBDB0B0BABABAB1B1ACACA7A7A7ACAC9797979797979787878783
        8369696967675D5D5D5D5D50505D5D5D6B6B6100000012121212121212121212
        24242F2F2F2F2F3F3F4C4C4C3F3F6A6A7B7B7B83839797978787939397979798
        98ABABAB9797ACACACACACB1B1B1B1B1BABAB1B1B9B9B9ACACB9B9B9B7B7C3C3
        C7C7C7C7C7C7C7C7B0B0C6C6B0B0B0C3C3ACACACB9B9ACACB7B7B7BDBDBDBDBD
        C6C6C7C7C7C7C7C7C7D4D4D4D4D4BABABDBDBDB0B0BABABAB1B1ACACA7A7A7AC
        AC97979797979797878787838369696967675D5D5D5D5D50505D5D5D6B6B6100
        000017171313131313131313121220202424242F2F2F2F2F3B3B4B4B5050506B
        6B6B6B6B76767878838383878793939393939393ABABABACACACACACACACACAC
        ACACACACACACACACACACA7A7BABABAC7C7C7C7C7B0B0C3C3BABABAB0B0ABABAB
        9393ABABACACACA2A2A6A6A6BABABDBDC7C7C7C7C7C7C7C7C7C7BDBDBABABAB1
        B1A6A6A6ACAC97979797979F9F878787878778786B6B6B5D5D4C4C4C4C4C3F3F
        2F2F2F3F3F3F3F3F51515100000017171313131313131313121220202424242F
        2F2F2F2F3B3B4B4B5050506B6B6B6B6B76767878838383878793939393939393
        ABABABACACACACACACACACACACACACACACACACACACACA7A7BABABAC7C7C7C7C7
        B0B0C3C3BABABAB0B0ABABAB9393ABABACACACA2A2A6A6A6BABABDBDC7C7C7C7
        C7C7C7C7C7C7BDBDBABABAB1B1A6A6A6ACAC97979797979F9F87878787877878
        6B6B6B5D5D4C4C4C4C4C3F3F2F2F2F3F3F3F3F3F515151000000131317171713
        13131313131313132020202F2F2F2F2F2F2F2D2D3A3A3A4C4C50505050505858
        676767696982828293939393979797939397979793939797ABABAB9F9F939393
        ACACACACB7B7B7BABABDBDBDBABAB0B0BABABAB1B1A1A1A19F9F93939F9F9FA2
        A2A2A2A2B1B1BABABDBDBDC7C7C7C7C7C7C7B1B1B1B1B1B1B1A2A2A293939393
        83838390906B6B6B676769694C4C4C4C4C3B3B3B2E2E2F2F2020202E2E323232
        3F3F4000000013131717171313131313131313132020202F2F2F2F2F2F2F2D2D
        3A3A3A4C4C505050505058586767676969828282939393939797979393979797
        93939797ABABAB9F9F939393ACACACACB7B7B7BABABDBDBDBABAB0B0BABABAB1
        B1A1A1A19F9F93939F9F9FA2A2A2A2A2B1B1BABABDBDBDC7C7C7C7C7C7C7B1B1
        B1B1B1B1B1A2A2A29393939383838390906B6B6B676769694C4C4C4C4C3B3B3B
        2E2E2F2F2020202E2E3232323F3F400000001313171717131313131313131313
        2020202F2F2F2F2F2F2F2D2D3A3A3A4C4C505050505058586767676969828282
        93939393979797939397979793939797ABABAB9F9F939393ACACACACB7B7B7BA
        BABDBDBDBABAB0B0BABABAB1B1A1A1A19F9F93939F9F9FA2A2A2A2A2B1B1BABA
        BDBDBDC7C7C7C7C7C7C7B1B1B1B1B1B1B1A2A2A29393939383838390906B6B6B
        676769694C4C4C4C4C3B3B3B2E2E2F2F2020202E2E3232323F3F400000001717
        17171708081313131313131313131320202121212F2F11111F1F1F31313F3F3F
        4C4C4C4C4C4C4C67676767677777939393939397979797979F9F97979F9F9F97
        979F9F9F9797ACACA7A7A7C7C7BABABABABABABABABABAACAC93939393939393
        9090909696A2A2A2A5A5B9B9B7B7B7BABABABABAC7C7B1B1B1B1B1ACAC8A8A8A
        9393858577777767676767675D5D4C4C4C4C4C2F2F2F2F2F2E2E202012121224
        243232323F3F4000000017171717170808131313131313131313132020212121
        2F2F11111F1F1F31313F3F3F4C4C4C4C4C4C4C67676767677777939393939397
        979797979F9F97979F9F9F97979F9F9F9797ACACA7A7A7C7C7BABABABABABABA
        BABABAACAC939393939393939090909696A2A2A2A5A5B9B9B7B7B7BABABABABA
        C7C7B1B1B1B1B1ACAC8A8A8A9393858577777767676767675D5D4C4C4C4C4C2F
        2F2F2F2F2E2E202012121224243232323F3F4000000013131313131313131313
        1313131313131313131313131313131313131313131313131717171717171717
        173A3A3A4B4B676778787883838787878787878787878787878C8C8C97979797
        979797ADADA7A7A7B9B9B9B9ACACAC9797979797939383838383838282929292
        9292A1A1ABABABBABABABABABABABABAA5A5A593936767675D5D3F3F40404033
        331717171717131313131313130202020A0A0808171717171733333333334500
        0000131313131313131313131313131313131313131313131313131313131313
        131313131717171717171717173A3A3A4B4B6767787878838387878787878787
        87878787878C8C8C97979797979797ADADA7A7A7B9B9B9B9ACACAC9797979797
        9393838383838382829292929292A1A1ABABABBABABABABABABABABAA5A5A593
        936767675D5D3F3F40404033331717171717131313131313130202020A0A0808
        1717171717333333333345000000131313131313131313131313131313131313
        131313131313070713131313131313131313131313131317172E2E2E3A3A4C4C
        5D5D5D6767696969787875756969697D7D8787878A8A87879393939898989898
        B9B9ACAC9797979F9F83838383837878767676777777777793939797A2A2A2AC
        ACB1B1B1B1B1979785858576765151513F3F32322525252A2A14141412121717
        13131313131313130A0A13130A0A0A12122A2A2A333333000000131313131313
        1313131313131313131313131313131313130707131313131313131313131313
        13131317172E2E2E3A3A4C4C5D5D5D6767696969787875756969697D7D878787
        8A8A87879393939898989898B9B9ACAC9797979F9F8383838383787876767677
        7777777793939797A2A2A2ACACB1B1B1B1B1979785858576765151513F3F3232
        2525252A2A1414141212171713131313131313130A0A13130A0A0A12122A2A2A
        3333330000001313131313131313131313131313131313131313131313130707
        13131313131313131313131313131317172E2E2E3A3A4C4C5D5D5D6767696969
        787875756969697D7D8787878A8A87879393939898989898B9B9ACAC9797979F
        9F83838383837878767676777777777793939797A2A2A2ACACB1B1B1B1B19797
        85858576765151513F3F32322525252A2A141414121217171313131313131313
        0A0A13130A0A0A12122A2A2A3333330000001313131313131313131313131313
        1313131313131313131307070A0A0A07070202020A0A13131313131313121212
        161624242F2F2F3F3F3C3C3C4C4C3C3C5D5D5D5D5D6969697878787878787893
        939797979797878793939383837878785D5D4B4B5D5D5D5D5D6B6B6B61616969
        6B6B6B70707070708A8A5D5D5151513F3F2F2F2F121212121717171313171717
        1313131313131313130202020A0A13130A0A0A0A0A2424242929250000001313
        1313131313131313131313131313131313131313131307070A0A0A0707020202
        0A0A13131313131313121212161624242F2F2F3F3F3C3C3C4C4C3C3C5D5D5D5D
        5D6969697878787878787893939797979797878793939383837878785D5D4B4B
        5D5D5D5D5D6B6B6B616169696B6B6B70707070708A8A5D5D5151513F3F2F2F2F
        1212121217171713131717171313131313131313130202020A0A13130A0A0A0A
        0A24242429292500000013131313131313131313131313131313131313131313
        1313131313131313131313131313020213131313130A0A0A1717131317171713
        13242424202024243030303F3F5252525D5D5D5D67676769696B6B6B87877878
        7878785D5D5858583F3F3F3F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F3F3F32323224241313131313131302020213131313131313131313131313
        13131313131313130909090A0A0A0A0A12122500000013131313131313131313
        1313131313131313131313131313131313131313131313131313020213131313
        130A0A0A171713131717171313242424202024243030303F3F5252525D5D5D5D
        67676769696B6B6B878778787878785D5D5858583F3F3F3F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F2F2F2F2F2F2F3F3F32323224241313131313131302020213
        13131313131313131313131313131313131313130909090A0A0A0A0A12122500
        0000131313131313131313131313131313131313131313131313131317171713
        1313131317171313131313171705050513131717131313131313131313131313
        20202030302F2F2F3F3F3F3F4C4C4C58585D5D5D69695D5D5252523F3F3C3C3C
        2424202013131312121717171313171713131317171313131717131312121212
        121212121313020213131302021313130A0A1313131313131313131313131313
        0A0A0A0A0A0A0A0A161620000000131313131313131313131313131313131313
        1313131313131313171717131313131317171313131313171705050513131717
        13131313131313131313131320202030302F2F2F3F3F3F3F4C4C4C58585D5D5D
        69695D5D5252523F3F3C3C3C2424202013131312121717171313171713131317
        171313131717131312121212121212121313020213131302021313130A0A1313
        1313131313131313131313130A0A0A0A0A0A0A0A161620000000131313131313
        1313131313131313131313131313131313131212171717171714141417171313
        131313131317171705050D0D0A0A0A0A0A121212131313131313131717252525
        303024242F2F2F3B3B3F3F3F3F3F404040404025252525251414131313131313
        1317171713131717131313131313131313131616131313121212121213131313
        0A0A0A1313131313131313131313131313131313171713130A0A0A1717171717
        1313120000001313131313131313131313131313131313131313131313131212
        171717171714141417171313131313131317171705050D0D0A0A0A0A0A121212
        131313131313131717252525303024242F2F2F3B3B3F3F3F3F3F404040404025
        2525252514141313131313131317171713131717131313131313131313131616
        1313131212121212131313130A0A0A1313131313131313131313131313131313
        171713130A0A0A17171717171313120000001313131313131313131313131313
        1313131313131313131312121717171717141414171713131313131313171717
        05050D0D0A0A0A0A0A121212131313131313131717252525303024242F2F2F3B
        3B3F3F3F3F3F4040404040252525252514141313131313131317171713131717
        1313131313131313131316161313131212121212131313130A0A0A1313131313
        131313131313131313131313171713130A0A0A17171717171313120000001313
        1313131313131313131313131313131313131313131313131717171313131313
        1313131313131313130D0D0D0D0D0A0A09090912121212121212202013131313
        131717172525202020202020202F2F2F30302525252525181814141413130303
        1313131313131313131313130A0A0A13131313130A0A13131212121212121212
        202012121F1F1F10101313130A0A131302020213131717171414171717171712
        1212121217172400000013131313131313131313131313131313131313131313
        1313131317171713131313131313131313131313130D0D0D0D0D0A0A09090912
        121212121212202013131313131717172525202020202020202F2F2F30302525
        2525251818141414131303031313131313131313131313130A0A0A1313131313
        0A0A13131212121212121212202012121F1F1F10101313130A0A131302020213
        1317171714141717171717121212121217172400000013131313131313131313
        1313131313131313131313131313131313131313131313130A0A07070A0A0A07
        070D0D0D11110909090909111111111120202424131313131317171714140A0A
        12121220202020201717141412121217171313130303030303030306060A0A0A
        060607070A0A0A06060A0A0A0707121212121212122020201F1F111111111110
        100A0A0A13131313131313131313131312121717171717121218181824242500
        0000131313131313131313131313131313131313131313131313131313131313
        131313130A0A07070A0A0A07070D0D0D11110909090909111111111120202424
        131313131317171714140A0A1212122020202020171714141212121717131313
        0303030303030306060A0A0A060607070A0A0A06060A0A0A0707121212121212
        122020201F1F111111111110100A0A0A13131313131313131313131312121717
        1717171212181818242425000000070702020213131313131313131313131313
        1313131313131313131313131313131313131313131313131312121212121212
        1212121212121212121212121313131313131313131313131313130202131313
        131313131313131313131313131313131313130A0A13131313130A0A13131302
        020A0A0A13131313131313131313131302021313131313131313131313131313
        171717131317171714141717131313121224242425252F000000070702020213
        1313131313131313131313131313131313131313131313131313131313131313
        1313131313121212121212121212121212121212121212121313131313131313
        131313131313130202131313131313131313131313131313131313131313130A
        0A13131313130A0A13131302020A0A0A13131313131313131313131302021313
        1313131313131313131313131717171313171717141417171313131212242424
        25252F0000000707020202131313131313131313131313131313131313131313
        1313131313131313131313131313131313121212121212121212121212121212
        1212121213131313131313131313131313131302021313131313131313131313
        13131313131313131313130A0A13131313130A0A13131302020A0A0A13131313
        1313131313131313020213131313131313131313131313131717171313171717
        14141717131313121224242425252F0000001313131313131313131313130202
        1313131313131313131313131313131313131313131313131313131313121212
        1212121212121212121212121212121213131313131313131313131313131313
        1313131313131313131313020213131313131313131313131302020212121313
        0A0A0A13131313130A0A13131313131313131313131313131313131313131313
        1717131313131317171414141717171713131313132424242424300000001313
        1313131313131313131302021313131313131313131313131313131313131313
        1313131313131313131212121212121212121212121212121212121213131313
        1313131313131313131313131313131313131313131313020213131313131313
        1313131313020202121213130A0A0A13131313130A0A13131313131313131313
        1313131313131313131313131717131313131317171414141717171713131313
        1324242424243000000017171313131313131313131313131313131313131313
        1313131313131313131313131313131313131313131212121212121212121212
        1212121212121212131313131313131302021313131313131313131313131313
        1313131313131313020213131313130A0A131313020213131313130A0A131313
        0202131313131313131313131313131302020213131313131313131317171713
        1317171717171717131313121224242425252F00000017171313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        1312121212121212121212121212121212121212131313131313131302021313
        1313131313131313131313131313131313131313020213131313130A0A131313
        020213131313130A0A1313130202131313131313131313131313131302020213
        1313131313131313171717131317171717171717131313121224242425252F00
        0000141417171713131313131313131313131313131313131313131313131313
        1313131313131313131313131312121212121212121212121212121212121212
        1313131313131313131313131313131313131313020213131313131313131313
        1313131313131313130A0A0A13130A0A13131313130A0A0A1313131302020213
        1313131313131313131313131313131317171313131313171714141412121717
        1313131313242424242430000000141417171713131313131313131313131313
        1313131313131313131313131313131313131313131313131312121212121212
        1212121212121212121212121313131313131313131313131313131313131313
        0202131313131313131313131313131313131313130A0A0A13130A0A13131313
        130A0A0A13131313020202131313131313131313131313131313131317171313
        1313131717141414121217171313131313242424242430000000141417171713
        1313131313131313131313131313131313131313131313131313131313131313
        1313131313121212121212121212121212121212121212121313131313131313
        1313131313131313131313130202131313131313131313131313131313131313
        130A0A0A13130A0A13131313130A0A0A13131313020202131313131313131313
        1313131313131313171713131313131717141414121217171313131313242424
        2424300000001717171717131313131313131313020202131313131313131313
        1313131313131313131313131313131313121212121212121212121212121212
        1212121213131313131313131313131313131313131313131313131313131313
        13131313131313131313130A0A131313131302020A0A0A13131313130A0A1313
        1313131313131313131313131313131313131313131313131717171313171717
        14141717131313161620202025252F0000001717171717131313131313131313
        0202021313131313131313131313131313131313131313131313131313121212
        1212121212121212121212121212121213131313131313131313131313131313
        13131313131313131313131313131313131313131313130A0A13131313130202
        0A0A0A13131313130A0A13131313131313131313131313131313131313131313
        13131313171717131317171714141717131313161620202025252F0000001717
        1717171313131313131313131313131313131313131313131313131313131313
        1313131313131313131212121212121212121212121212121212121213131313
        1313131313130202131313131313131313131313020202131313131313130202
        13131313131313130A0A13131313130A0A131313131313131313131313020202
        1313131313131302021313131717131313131317171414141717171713131312
        1225252524243000000017171717171313131313131313131313131313131313
        1313131313131313131313131313131313131313131212121212121212121212
        1212121212121212131313131313131313130202131313131313131313131313
        02020213131313131313020213131313131313130A0A13131313130A0A131313
        1313131313131313130202021313131313131302021313131717131313131317
        1714141417171717131313121225252524243000000014141212121717131313
        1313131313131313131313131313131313131313131313131313131313131313
        1312121212121212121212121212121212121212131313131313131313131313
        1313130202131313131313131313131313131313131313131313130A0A131313
        13130A0A13131302021212121313131313131313131313131313131313131313
        1313131313131313171717131317171717171414121212121224242424242F00
        0000141412121217171313131313131313131313131313131313131313131313
        1313131313131313131313131312121212121212121212121212121212121212
        1313131313131313131313131313130202131313131313131313131313131313
        131313131313130A0A13131313130A0A13131302021212121313131313131313
        1313131313131313131313131313131313131313171717131317171717171414
        121212121224242424242F000000141412121217171313131313131313131313
        1313131313131313131313131313131313131313131313131312121212121212
        1212121212121212121212121313131313131313131313131313130202131313
        131313131313131313131313131313131313130A0A13131313130A0A13131302
        0212121213131313131313131313131313131313131313131313131313131313
        171717131317171717171414121212121224242424242F000000131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        1313131313121212121212121313131212121212121212121313131313131313
        1313131313131313131313131313131313131313131313131313131313131302
        020A0A0A131313130A0A0A13130202020A0A1313131313131313131313131313
        1313131313131313171713131313131717131313171717171313131212242424
        2525300000001313131313131313131313131313131313131313131313131313
        1313131313131313131313131313131313121212121212121313131212121212
        1212121213131313131313131313131313131313131313131313131313131313
        131313131313131313131302020A0A0A131313130A0A0A13130202020A0A1313
        1313131313131313131313131313131313131313171713131313131717131313
        1717171713131312122424242525300000001717141414131320202017171414
        1414142424141414131313131313131313131313131313131313131313131313
        1717141412121217171414141717141413131313131313130202131313131313
        131313130A0A13130A0A0A08080A0A0A13130707131313131313131313131313
        131313131313131313130A0A1313130A0A0808080A0A131307070713130A0A0A
        08080A0A13131307071313130A0A080812121212122424242525250000001717
        1414141313202020171714141414142424141414131313131313131313131313
        1313131313131313131313131717141412121217171414141717141413131313
        131313130202131313131313131313130A0A13130A0A0A08080A0A0A13130707
        131313131313131313131313131313131313131313130A0A1313130A0A080808
        0A0A131307070713130A0A0A08080A0A13131307071313130A0A080812121212
        1224242425252500000012121717171414131313141412122121211414131313
        1717131313131313131313131313131313131313131313131212171714141417
        1714141412121717131313131313131313131313131313131313131313130A0A
        1313130A0A1313130A0A13130A0A0A1313131313020213131313131313131313
        13130A0A1313130A0A1313130A0A13130A0A0A13130A0A0A13130A0A1313130A
        0A1313130A0A1313121212131316161620201700000012121717171414131313
        1414121221212114141313131717131313131313131313131313131313131313
        1313131312121717141414171714141412121717131313131313131313131313
        131313131313131313130A0A1313130A0A1313130A0A13130A0A0A1313131313
        02021313131313131313131313130A0A1313130A0A1313130A0A13130A0A0A13
        130A0A0A13130A0A1313130A0A1313130A0A1313121212131316161620201700
        0000121217171714141313131414121221212114141313131717131313131313
        1313131313131313131313131313131312121717141414171714141412121717
        131313131313131313131313131313131313131313130A0A1313130A0A131313
        0A0A13130A0A0A131313131302021313131313131313131313130A0A1313130A
        0A1313130A0A13130A0A0A13130A0A0A13130A0A1313130A0A1313130A0A1313
        1212121313161616202017000000171714141413132424241414202017171714
        1413131320201313131313131313131314141313131313131317171714141717
        1414141212171717171714141313131313131313131313131313131313131313
        0202131313131313130202021313131313131313131313131313131313131302
        0213131313131313020202131313131313130202131313131313131302021313
        1313131313020202131313130A0A0A1212131313121224000000171714141413
        1324242414142020171717141413131320201313131313131313131314141313
        1313131313171717141417171414141212171717171714141313131313131313
        1313131313131313131313130202131313131313130202021313131313131313
        1313131313131313131313020213131313131313020202131313131313130202
        1313131313131313020213131313131313020202131313130A0A0A1212131313
        1212240000001212171717141413131313131414131313171721212114141313
        1313131313131313202014141313131212171717141412121717171717141414
        1212171713131313131313131313020213131313131313131313131302020213
        1313131313130202131313131313131313131313131313131313131302021313
        1313131313020202131313131313130202131313131313130202021313131313
        131313130A0A0A12121212121212240000001212171717141413131313131414
        1313131717212121141413131313131313131313202014141313131212171717
        1414121217171717171414141212171713131313131313131313020213131313
        1313131313131313020202131313131313130202131313131313131313131313
        1313131313131313020213131313131313020202131313131313130202131313
        131313130202021313131313131313130A0A0A12121212121212240000001414
        1212121717212121141424241414142020171717141414142020201414131313
        1414131321212114141212121717171714141412121717171717141413131313
        1313131313131313131313020213131317171313131313171713131313131717
        1313131313131313131302021313131313131313131317171313131313131313
        1313131317171713131313131313131317171713131313131313171713131313
        1313131312121200000014141212121717212121141424241414142020171717
        1414141420202014141313131414131321212114141212121717171714141412
        1217171717171414131313131313131313131313131313020213131317171313
        1313131717131313131317171313131313131313131302021313131313131313
        1313171713131313131313131313131317171713131313131313131317171713
        1313131313131717131313131313131312121200000014141212121717212121
        1414242414141420201717171414141420202014141313131414131321212114
        1412121217171717141414121217171717171414131313131313131313131313
        1313130202131313171713131313131717131313131317171313131313131313
        1313020213131313131313131313171713131313131313131313131317171713
        1313131313131313171717131313131313131717131313131313131312121200
        0000171714141413131717171414131314141413131313131717212114141425
        2514141417172121171717141417171714141212171717141412121217171313
        1313131313131313131313131313131313131313131313131313131313131313
        1313131313131313131313131313131313131313131313131313131313131317
        1713131313131313131313171713131313131313131313131313131317171313
        1212121212242424121224000000171714141413131717171414131314141413
        1313131317172121141414252514141417172121171717141417171714141212
        1717171414121212171713131313131313131313131313131313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        1313131313131313131313171713131313131313131313171713131313131313
        1313131313131313171713131212121212242424121224000000121217171714
        1420202014142020171717212114141420201717212121171721212125251414
        2525252121171717141412121717171414171717131317171313131313131313
        0202131313131313131313131717131317171713131717171313171714141413
        1313131313131313131313131313131313131717131313131317171713131717
        1313131313171717131317171313131717131313131317171212122525252525
        1212250000001212171717141420202014142020171717212114141420201717
        2121211717212121252514142525252121171717141412121717171414171717
        1313171713131313131313130202131313131313131313131717131317171713
        1317171713131717141414131313131313131313131313131313131313131717
        1313131313171717131317171313131313171717131317171313131717131313
        1313171712121225252525251212250000001414171717141413131317171414
        1313131717141414131317171414142424141414121217171414141212171717
        1313171713131317171313131717131313131313131313131313131313131313
        1313131317171717141414121217171714141212171717131313131313131313
        1313131313131313131317171313131717131313171713131717171313171717
        1414121217171713131717171717141425252529292525252525250000001414
        1717171414131313171714141313131717141414131317171414142424141414
        1212171714141412121717171313171713131317171313131717131313131313
        1313131313131313131313131313131317171717141414121217171714141212
        1717171313131313131313131313131313131313131317171313131717131313
        1717131317171713131717171414121217171713131717171717141425252529
        2925252525252500000014141717171414131313171714141313131717141414
        1313171714141424241414141212171714141412121717171313171713131317
        1713131317171313131313131313131313131313131313131313131317171717
        1414141212171717141412121717171313131313131313131313131313131313
        1313171713131317171313131717131317171713131717171414121217171713
        1317171717171414252525292925252525252500000021211717171414171717
        1414121217171714141212121717131313131313130202021313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        1313131313131313121212121717170A0A1212120A0A0A0A0909091313141414
        1313131313131314142020201717131317171713131717171313171713131317
        171313130202171713131317171313130C0C1717131313121217171725252500
        0000212117171714141717171414121217171714141212121717131313131313
        1302020213131313131313131313131313131313131313131313131313131313
        1313131313131313131313131313131313131313121212121717170A0A121212
        0A0A0A0A09090913131414141313131313131314142020201717131317171713
        131717171313171713131317171313130202171713131317171313130C0C1717
        1313131212171717252525000000212117171714141212121717171714141417
        1714141412121313131313131313131313131313131313131313131302021313
        1313131313020202131313131313130202131313131313130202021313131313
        0D0D131316161613130A0A0A0A0A0A0A0A0A0A13132121211414131314141425
        2514141421211717171717141417171714141212171717171713131313131717
        1414141717171717171717171313132020121212252525000000212117171714
        1412121217171717141414171714141412121313131313131313131313131313
        1313131313131313020213131313131313020202131313131313130202131313
        1313131302020213131313130D0D131316161613130A0A0A0A0A0A0A0A0A0A13
        1321212114141313141414252514141421211717171717141417171714141212
        1717171717131313131317171414141717171717171717171313132020121212
        2525250000002525141414171714141412121717141414121217171717171313
        1313131313131313131302021313131313131313131313131313131313131313
        1313131313131313131313131313131313131313131313130D0D13131616160A
        0A1212120A0A12120A0A0A131312121217172121171717252517171725251717
        1414141212171717171717171414141212171717141412121717171717171717
        2626171713131313131616162020250000002525141414171714141412121717
        1414141212171717171713131313131313131313131302021313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        131313130D0D13131616160A0A1212120A0A12120A0A0A131312121217172121
        1717172525171717252517171414141212171717171717171414141212171717
        1414121217171717171717172626171713131313131616162020250000002525
        1414141717141414121217171414141212171717171713131313131313131313
        1313020213131313131313131313131313131313131313131313131313131313
        131313131313131313131313131313130D0D13131616160A0A1212120A0A1212
        0A0A0A1313121212171721211717172525171717252517171414141212171717
        1717171714141412121717171414121217171717171717172626171713131313
        1316161620202500000025251414141212171717141412121717171414121212
        1717131313131313131313131313131313131313131313131313131313131313
        131313131313131313131313131313131313131313131313131313130D0D1212
        0A0A0A12120A0A0A12120A0A1616161313121212252517172525252525262626
        2929252517171725251717172525171725252517172525251717252525252529
        2926262629292929202020202024242420202400000025251414141212171717
        1414121217171714141212121717131313131313131313131313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        13131313131313130D0D12120A0A0A12120A0A0A12120A0A1616161313121212
        2525171725252525252626262929252517171725251717172525171725252517
        1725252517172525252525292926262629292929202020202024242420202400
        0000252514141417171717171414171717171714141717171313131313131313
        1313131313131313131313131302020213131313131313020213131313131313
        02020213131313131313020213131313131313130A0A0A0A12121216160A0A0A
        12120D0D12121212121212122525242429292929292F2F2F2929252525252525
        25252525252525252525252525292929292925252929292F2F2929292F2F3333
        2424242E2E2424242F2F2E000000252514141417171717171414171717171714
        1417171713131313131313131313131313131313131313131302020213131313
        1313130202131313131313130202021313131313131302021313131313131313
        0A0A0A0A12121216160A0A0A12120D0D12121212121212122525242429292929
        292F2F2F29292525252525252525252525252525252525252529292929292525
        2929292F2F2929292F2F33332424242E2E2424242F2F2E000000171721212117
        1714141412121717141414121217171714140A0A131313131313131302021313
        1313131313131313131313131313131313131313131313131313131313131313
        1313131313131313131313130A0A0A0A1212120A0A1616161313171712121217
        17242424121229292F2F2F2929333333333332322424242F2F24242430302424
        2F2F2F24242F2F2F2F2F2F2F2F2F2F33332F2F2F33332F2F3232322F2F2E2E2E
        2F2F310000001717212121171714141412121717141414121217171714140A0A
        1313131313131313020213131313131313131313131313131313131313131313
        1313131313131313131313131313131313131313131313130A0A0A0A1212120A
        0A161616131317171212121717242424121229292F2F2F292933333333333232
        2424242F2F242424303024242F2F2F24242F2F2F2F2F2F2F2F2F2F33332F2F2F
        33332F2F3232322F2F2E2E2E2F2F310000002525141414171714141412121717
        1414141212171717141413131313131313131313131313131313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        131313130A0A0A0A0A0A0A12120A0A0A12121212121212121225252528282424
        2929292F2F333333333332322F2F2F32322F2F2F32322F2F2F2F2F32322F2F2F
        2F2F2F2F2F2F2F3F3F33333340403F3F3F3F3F3F3F3F3F3F3F3F2F0000002525
        1414141717141414121217171414141212171717141413131313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        131313131313131313131313131313130A0A0A0A0A0A0A12120A0A0A12121212
        1212121212252525282824242929292F2F333333333332322F2F2F32322F2F2F
        32322F2F2F2F2F32322F2F2F2F2F2F2F2F2F2F3F3F33333340403F3F3F3F3F3F
        3F3F3F3F3F3F2F00000025251414141717141414121217171414141212171717
        1414131313131313131313131313131313131313131313131313131313131313
        131313131313131313131313131313131313131313131313131313130A0A0A0A
        0A0A0A12120A0A0A121212121212121212252525282824242929292F2F333333
        333332322F2F2F32322F2F2F32322F2F2F2F2F32322F2F2F2F2F2F2F2F2F2F3F
        3F33333340403F3F3F3F3F3F3F3F3F3F3F3F2F00000017172121211717141414
        1717141417171714141717171414131313131313131313131313131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        13131317171313130A0A0A0A0A0A0A0A0A1212120D0D13131212122424121212
        2525252532323235353333333F3F32322F2F2F32322F2F2F323232322F2F2F32
        323F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F4C4C4C4C4C4C4C4C3F3F4C00
        0000171721212117171414141717141417171714141717171414131313131313
        1313131313131313131313131313131313131313131313131313131313131313
        13131313131313131313131313131317171313130A0A0A0A0A0A0A0A0A121212
        0D0D131312121224241212122525252532323235353333333F3F32322F2F2F32
        322F2F2F323232322F2F2F32323F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
        4C4C4C4C4C4C4C4C3F3F4C000000171714141417172121211717212117171721
        2117171714140A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A17171721212626
        1414141414131313131307071212121313242424252525252525251212121212
        131302021313130202020202131317171717171717202020171724242F2F2F2F
        2F3F3F3F3F3F4B4B3F3F3F3A3A4C4C4C3F3F4C4C5D5D5D5D5D4C4C4C51515050
        5050505D5D4C4C4C4C4C5D5D50505050505050504B4B3E000000171714141417
        1721212117172121171717212117171714140A0A0A0A0A0A0A0A0A0A0A0A0A0A
        0A0A0A0A0A171717212126261414141414131313131307071212121313242424
        2525252525252512121212121313020213131302020202021313171717171717
        17202020171724242F2F2F2F2F3F3F3F3F3F4B4B3F3F3F3A3A4C4C4C3F3F4C4C
        5D5D5D5D5D4C4C4C515150505050505D5D4C4C4C4C4C5D5D5050505050505050
        4B4B3E0000001414171717141425252514142525141414252514141425251313
        0D0D0D13130D0D0D13130D0D1313130D0D212121181825252222221717131313
        1313070712121213132424242525252525252517172020201717131313131313
        13131313131317171717171414242424242424242F2F2F2F2F3F3F3F4C4C3A3A
        3F3F3F3A3A3F3F3F4C4C4C4C51515150505D5D5D5D5D51515D5D5D5D5D515151
        5D5D5D5D5050505C5C5050504C4C3F0000001414171717141425252514142525
        1414142525141414252513130D0D0D13130D0D0D13130D0D1313130D0D212121
        1818252522222217171313131313070712121213132424242525252525252517
        1720202017171313131313131313131313131717171717141424242424242424
        2F2F2F2F2F3F3F3F4C4C3A3A3F3F3F3A3A3F3F3F4C4C4C4C51515150505D5D5D
        5D5D51515D5D5D5D5D5151515D5D5D5D5050505C5C5050504C4C3F0000001414
        1717171414252525141425251414142525141414252513130D0D0D13130D0D0D
        13130D0D1313130D0D2121211818252522222217171313131313070712121213
        1324242425252525252525171720202017171313131313131313131313131717
        1717171414242424242424242F2F2F2F2F3F3F3F4C4C3A3A3F3F3F3A3A3F3F3F
        4C4C4C4C51515150505D5D5D5D5D51515D5D5D5D5D5151515D5D5D5D5050505C
        5C5050504C4C3F00000014141414141717212121171721211717172121171717
        2121121212121212121212121212121212121212122525252525262617171725
        2514141413131313121212121225252525252525252525121224242414141212
        1212121717131313171717172525251717252525131324242F2F2F32323F3F3F
        4C4C3F3F3A3A3A4C4C3A3A3A4C4C4C4C4C4C4C51515D5D5D5D5D61615D5D5D51
        515D5D5D5D5D616150505050504C4C4C3E3E3F00000014141414141717212121
        1717212117171721211717172121121212121212121212121212121212121212
        1225252525252626171717252514141413131313121212121225252525252525
        2525251212242424141412121212121717131313171717172525251717252525
        131324242F2F2F32323F3F3F4C4C3F3F3A3A3A4C4C3A3A3A4C4C4C4C4C4C4C51
        515D5D5D5D5D61615D5D5D51515D5D5D5D5D616150505050504C4C4C3E3E3F00
        0000171714141425251414142525141425252514142525251414242417171725
        2517171725252525171717252517171725252525252525252525252513131212
        1212121212242424171725252525251717252525171717171414141212171717
        252525252A2A2A1717252525252524243030303F3F3F3F3F4C4C3F3F4C4C4C3A
        3A3F3F3F4B4B4C4C5151514C4C61616151515D5D4C4C4C616151515150505D5D
        5151515050515151323232000000171714141425251414142525141425252514
        1425252514142424171717252517171725252525171717252517171725252525
        2525252525252525131312121212121212242424171725252525251717252525
        171717171414141212171717252525252A2A2A1717252525252524243030303F
        3F3F3F3F4C4C3F3F4C4C4C3A3A3F3F3F4B4B4C4C5151514C4C61616151515D5D
        4C4C4C616151515150505D5D5151515050515151323232000000141414141417
        1721212117172121181818212118181821212525252525252525252525252525
        2525252525252525292925252929292929252525242412121212122424131313
        121224241717172525252525252524242525252424252525252529292F2F2F29
        29252525252525252F2F2F3F3F3F3F3F51514C4C4C4C4C3F3F4C4C4C3F3F4C4C
        4C4C4C4C4C5151514C4C4C4C5151514C4C4C4C4C51514C4C5151514C4C3E3E3E
        3232250000001414141414171721212117172121181818212118181821212525
        2525252525252525252525252525252525252525292925252929292929252525
        2424121212121224241313131212242417171725252525252525242425252524
        24252525252529292F2F2F2929252525252525252F2F2F3F3F3F3F3F51514C4C
        4C4C4C3F3F4C4C4C3F3F4C4C4C4C4C4C4C5151514C4C4C4C5151514C4C4C4C4C
        51514C4C5151514C4C3E3E3E3232250000001414141414171721212117172121
        1818182121181818212125252525252525252525252525252525252525252525
        2929252529292929292525252424121212121224241313131212242417171725
        25252525252524242525252424252525252529292F2F2F292925252525252525
        2F2F2F3F3F3F3F3F51514C4C4C4C4C3F3F4C4C4C3F3F4C4C4C4C4C4C4C515151
        4C4C4C4C5151514C4C4C4C4C51514C4C5151514C4C3E3E3E3232250000001414
        1717172121181818212118182121211717212121171730302424242525303030
        242425253030302424242424292925252F2F2F29292929292525252524242413
        13121212242413132424242525252525292930302424242F2F2424242F2F3333
        2F2F2F292925252525252F2F2F2F2F3F3F3F3F3F51514C4C4C4C4C3F3F4B4B4B
        3F3F4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C3E3E3E3F
        3F32323225252400000014141717172121181818212118182121211717212121
        171730302424242525303030242425253030302424242424292925252F2F2F29
        2929292925252525242424131312121224241313242424252525252529293030
        2424242F2F2424242F2F33332F2F2F292925252525252F2F2F2F2F3F3F3F3F3F
        51514C4C4C4C4C3F3F4B4B4B3F3F4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
        4C4C4C4C4C4C4C4C3E3E3E3F3F32323225252400000017171414141717212121
        1717212117171721211717172121252525252530302020202525303024242421
        212525252525252532323229292F2F2F25252525242424171713131312121212
        24242425252525252F2F2F2F3232322F2F3232322F2F2F2F4040402929252525
        25252F2F2F2F2F3F3F5151514C4C51514C4C4C4C4C3F3F3F4B4B3F3F4C4C4C4C
        4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C323232323232323212122400
        0000171714141417172121211717212117171721211717172121252525252530
        302020202525303024242421212525252525252532323229292F2F2F25252525
        24242417171313131212121224242425252525252F2F2F2F3232322F2F323232
        2F2F2F2F404040292925252525252F2F2F2F2F3F3F5151514C4C51514C4C4C4C
        4C3F3F3F4B4B3F3F4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
        3232323232323232121224000000171714141425251414142424252514141425
        2514141425252121303030252530303025252121303030242424242425253333
        29292935352F2F2F292932322525251212121212131312122424242525292929
        3F3F2F2F3232323B3B3232323F3F3F3F3F3F3F2A2A25252529292F2F2F2F2F3F
        3F51515151514C4C4C4C4C4C4C3F3F3F4C4C3E3E4C4C4C4C4C5151515D5D4C4C
        51515150505D5D5D51515D5D2F2F2F2525242424242412000000171714141425
        2514141424242525141414252514141425252121303030252530303025252121
        30303024242424242525333329292935352F2F2F292932322525251212121212
        1313121224242425252929293F3F2F2F3232323B3B3232323F3F3F3F3F3F3F2A
        2A25252529292F2F2F2F2F3F3F51515151514C4C4C4C4C4C4C3F3F3F4C4C3E3E
        4C4C4C4C4C5151515D5D4C4C51515150505D5D5D51515D5D2F2F2F2525242424
        2424120000001717141414252514141424242525141414252514141425252121
        30303025253030302525212130303024242424242525333329292935352F2F2F
        2929323225252512121212121313121224242425252929293F3F2F2F3232323B
        3B3232323F3F3F3F3F3F3F2A2A25252529292F2F2F2F2F3F3F51515151514C4C
        4C4C4C4C4C3F3F3F4C4C3E3E4C4C4C4C4C5151515D5D4C4C51515150505D5D5D
        51515D5D2F2F2F25252424242424120000002525252525171717171714141212
        17171717171717171717242412121224241212122424242412121229292F2F2F
        29292F2F2F2F2F29292F2F2F2F2F29292F2F2F29292020201212202024242425
        252F2F2F3F3F4B4B3F3F3F3A3A3F3F3F4B4B3F3F4B4B4B2F2F3F3F3F2F2F2F2F
        2F2F2F32322F2F2F2F2F333332323229293232322525252525252525254C4C4C
        3E3E51513F3F3F4C4C3E3E3E4C4C3F3F29292925252525252525250000002525
        2525251717171717141412121717171717171717171724241212122424121212
        2424242412121229292F2F2F29292F2F2F2F2F29292F2F2F2F2F29292F2F2F29
        292020201212202024242425252F2F2F3F3F4B4B3F3F3F3A3A3F3F3F4B4B3F3F
        4B4B4B2F2F3F3F3F2F2F2F2F2F2F2F32322F2F2F2F2F33333232322929323232
        2525252525252525254C4C4C3E3E51513F3F3F4C4C3E3E3E4C4C3F3F29292925
        2525252525252500000025251717172525171717171714141212122525171717
        2525292924242429292424242929242429292924242F2F2F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F2F2F2F2F2F2424241313202024242424242F2F2F4C4C3F3F
        4B4B4B3F3F4C4C4C3A3A4C4C3F3F3F3F3F33333332322F2F2F2F2F3232303030
        3232252535353525253232322525252525252525253F3F3F3A3A32323B3B3B3F
        3F2E2E2E3F3F3B3B292929252525252525252500000025251717172525171717
        1717141412121225251717172525292924242429292424242929242429292924
        242F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F24242413132020
        24242424242F2F2F4C4C3F3F4B4B4B3F3F4C4C4C3A3A4C4C3F3F3F3F3F333333
        32322F2F2F2F2F32323030303232252535353525253232322525252525252525
        253F3F3F3A3A32323B3B3B3F3F2E2E2E3F3F3B3B292929252525252525252500
        00002525242424252524242425252424252525242425252524242F2F25252532
        322525253232252532323225252F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F2F3232242424242420202F2F2F32322F2F2F4C4C3F3F4C4C4C3F3F4C4C4C
        3F3F4C4C3F3F3F2F2F2F2F2F32322F2F2424242F2F2424243030323225252532
        322525252525252525252528282E2E2E2F2F2E2E2E2E2E2E2E2F2F2F2E2E2E2E
        2525252525252525252525000000252524242425252424242525242425252524
        2425252524242F2F25252532322525253232252532323225252F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F3232242424242420202F2F2F32322F2F2F
        4C4C3F3F4C4C4C3F3F4C4C4C3F3F4C4C3F3F3F2F2F2F2F2F32322F2F2424242F
        2F2424243030323225252532322525252525252525252528282E2E2E2F2F2E2E
        2E2E2E2E2E2F2F2F2E2E2E2E2525252525252525252525000000252524242425
        2524242425252424252525242425252524242F2F252525323225252532322525
        32323225252F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F3232242424
        242420202F2F2F32322F2F2F4C4C3F3F4C4C4C3F3F4C4C4C3F3F4C4C3F3F3F2F
        2F2F2F2F32322F2F2424242F2F24242430303232252525323225252525252525
        25252528282E2E2E2F2F2E2E2E2E2E2E2E2F2F2F2E2E2E2E2525252525252525
        25252500000024242F2F2F2F2F32323232323F3F2F2F2F32322F2F2F32323232
        32323232323232323232323232323232323F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3232323B3B2F2F2F2E2E2F2F2E2E2E3F3F3232324C4C3F3F4C4C4C3E
        3E4C4C4C3E3E4C4C3E3E3E2F2F3232322F2F24242F2F2F24242F2F2F24242F2F
        25252535352525252525252525252525252424242F2F24242121212E2E242424
        21212F2F252525252525252525251200000024242F2F2F2F2F32323232323F3F
        2F2F2F32322F2F2F3232323232323232323232323232323232323232323F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3232323B3B2F2F2F2E2E2F2F2E2E2E3F
        3F3232324C4C3F3F4C4C4C3E3E4C4C4C3E3E4C4C3E3E3E2F2F3232322F2F2424
        2F2F2F24242F2F2F24242F2F2525253535252525252525252525252525242424
        2F2F24242121212E2E24242421212F2F25252525252525252525120000003B3B
        3232323F3F4C4C4C4C4C51515151514C4C4C4C4C3F3F3F3F3232323F3F323232
        3F3F32323F3F3F32323F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3B3B3F3F3F3F3F3F3F3F3F3F4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
        4C4C4C32323232322424242424242424242F2F2F242425252525252525252525
        2828242424242425252424242424242424242425252424242424242425252525
        252525251212240000003B3B3232323F3F4C4C4C4C4C51515151514C4C4C4C4C
        3F3F3F3F3232323F3F3232323F3F32323F3F3F32323F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3B3B3F3F3F3F3F3F3F3F3F3F4C4C4C4C
        4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C32323232322424242424242424242F2F2F
        2424252525252525252525252828242424242425252424242424242424242425
        252424242424242425252525252525251212240000003F3F3F3F3F5D5D5D5D5D
        5D5D6B6B6B6B6B5D5D5D5D5D50503F3F3F3F3F3E3E3E3E3E3E3E3E3E3E3E3E3E
        3E5151514C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4B4B4C4C4C4C4C3F3F
        4C4C4C3F3F4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C2F2F333333
        323232322424242F2F2424243232252525252525252525252525242425252512
        1229292925252525252525252525252525252525252525252525252513131200
        00003F3F3F3F3F5D5D5D5D5D5D5D6B6B6B6B6B5D5D5D5D5D50503F3F3F3F3F3E
        3E3E3E3E3E3E3E3E3E3E3E3E3E5151514C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
        4C4C4C4B4B4C4C4C4C4C3F3F4C4C4C3F3F4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
        4C4C4C4C4C4C4C2F2F333333323232322424242F2F2424243232252525252525
        2525252525252424252525121229292925252525252525252525252525252525
        25252525252525251313120000003F3F3F3F3F5D5D5D5D5D5D5D6B6B6B6B6B5D
        5D5D5D5D50503F3F3F3F3F3E3E3E3E3E3E3E3E3E3E3E3E3E3E5151514C4C4C4C
        4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4B4B4C4C4C4C4C3F3F4C4C4C3F3F4C4C4C
        4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C2F2F333333323232322424242F
        2F24242432322525252525252525252525252424252525121229292925252525
        252525252525252525252525252525252525252513131200000051515151515C
        5C76767678786B6B8787876B6B7676766767515150505051514C4C4C51515050
        5151514C4C5050504B4B50504B4B4B50504B4B4B505050504C4C4C4C4C505050
        4B4B5D5D4C4C4C4C4C4B4B4B4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151513F
        3F2F2F2F2F2F2F2F3232322F2F3232322F2F2525252525252524242424242525
        1212122424242424252525251717172424252525252517172424242525121212
        24241300000051515151515C5C76767678786B6B8787876B6B76767667675151
        50505051514C4C4C515150505151514C4C5050504B4B50504B4B4B50504B4B4B
        505050504C4C4C4C4C5050504B4B5D5D4C4C4C4C4C4B4B4B4C4C4C4C4C4C4C4C
        4C4C4C4C4C4C4C4C5151513F3F2F2F2F2F2F2F2F3232322F2F3232322F2F2525
        2525252525242424242425251212122424242424252525251717172424252525
        25251717242424252512121224241300000061616262626B6B7676766B6B8787
        87878783836B6B6B7676626269696961616262626161616161616161614C4C4C
        4C4C4C4C5050504C4C4C4C4C4C4C4C4C4C4C4C4C4C50505050504B4B5D5D5D4C
        4C4C4C4C4C4C4C4C5151514C4C4C4C4C4C4C4C4C4C4C4C3F3F4040402F2F2F2F
        3232322F2F2F2F2F2F2F25252525252424242424242412122424241616252525
        1717121225252517171717172121171725252525251313131212120000006161
        6262626B6B7676766B6B878787878783836B6B6B767662626969696161626262
        6161616161616161614C4C4C4C4C4C4C5050504C4C4C4C4C4C4C4C4C4C4C4C4C
        4C50505050504B4B5D5D5D4C4C4C4C4C4C4C4C4C5151514C4C4C4C4C4C4C4C4C
        4C4C4C3F3F4040402F2F2F2F3232322F2F2F2F2F2F2F25252525252424242424
        2424121224242416162525251717121225252517171717172121171725252525
        251313131212120000006B6B6B6B6B85858383838A8A97979797979797838383
        6B6B6B6B6F6F6F6D6D6B6B6B7D7D69696F6F6F62626161615D5D62625151515D
        5D5151514C4C51515D5D5D51515D5D5D5D5D61615D5D5D5D5D6161615D5D5D5D
        6969696969696969696969696969695D5D4B4B4B4C4C3B3B2E2E2E21212F2F2F
        2F2F252525252525252525252424171725252514142525252626262626262625
        252626261717222217171717171717171414120000006B6B6B6B6B8585838383
        8A8A979797979797978383836B6B6B6B6F6F6F6D6D6B6B6B7D7D69696F6F6F62
        626161615D5D62625151515D5D5151514C4C51515D5D5D51515D5D5D5D5D6161
        5D5D5D5D5D6161615D5D5D5D6969696969696969696969696969695D5D4B4B4B
        4C4C3B3B2E2E2E21212F2F2F2F2F252525252525252525252424171725252514
        1425252526262626262626252526262617172222171717171717171714141200
        00006B6B6B6B6B85858383838A8A979797979797978383836B6B6B6B6F6F6F6D
        6D6B6B6B7D7D69696F6F6F62626161615D5D62625151515D5D5151514C4C5151
        5D5D5D51515D5D5D5D5D61615D5D5D5D5D6161615D5D5D5D6969696969696969
        696969696969695D5D4B4B4B4C4C3B3B2E2E2E21212F2F2F2F2F252525252525
        2525252524241717252525141425252526262626262626252526262617172222
        17171717171717171414120000006B6B6B6B6B83838383839797979798989897
        9783838383836B6B7D7D7D6B6B6B6B6B7D7D6B6B6B6B6B696962626261616161
        5D5D5D51515151515D5D4C4C5D5D5D61615D5D5D5D5D5D5D6161615D5D616161
        5D5D69696B6B6B69696969696F6F69696969695D5D5D5D5D4C4C3B3B3B3B3B2F
        2F2F2F2F30302525252525252525252525252525171717242417171725252222
        25252514142525252121171717171714141212121717140000006B6B6B6B6B83
        8383838397979797989898979783838383836B6B7D7D7D6B6B6B6B6B7D7D6B6B
        6B6B6B6969626262616161615D5D5D51515151515D5D4C4C5D5D5D61615D5D5D
        5D5D5D5D6161615D5D6161615D5D69696B6B6B69696969696F6F69696969695D
        5D5D5D5D4C4C3B3B3B3B3B2F2F2F2F2F30302525252525252525252525252525
        1717172424171717252522222525251414252525212117171717171414121212
        1717140000006B6B878787838397979797979797979797979797979785856D6D
        6B6B6B87877D7D7D6B6B6B6B6B6B6B6B6B717171696962625D5D5D61615D5D5D
        515150505D5D5D61615D5D5D62625D5D6161615D5D6161615D5D696969696969
        696B6B6B696969696969695C5C4B4B4B58584C4C3B3B3B32323C3C3C2F2F2929
        2525252525252525252512122525251212252525141424241414141717212121
        1717141417171717171414141212170000006B6B878787838397979797979797
        979797979797979785856D6D6B6B6B87877D7D7D6B6B6B6B6B6B6B6B6B717171
        696962625D5D5D61615D5D5D515150505D5D5D61615D5D5D62625D5D6161615D
        5D6161615D5D696969696969696B6B6B696969696969695C5C4B4B4B58584C4C
        3B3B3B32323C3C3C2F2F29292525252525252525252512122525251212252525
        1414242414141417172121211717141417171717171414141212170000008383
        8A8A8A9797939393A7A7A2A2A7A7A7939393939397976B6B8787878787878787
        7D7D6B6B8383836B6B6B6B6B6B6B6F6F6969696B6B5D5D5D5D5D5D5D6B6B6B62
        6261616161615D5D6161615D5D5D5D5D6B6B67676969696B6B6B6B6B7D7D7676
        6969695C5C5050504B4B58583F3F3F3F3F3F3F3F3F3F25252525252525252525
        1717252525252512121414141313131313131320201414141212252514141417
        1717171714141200000083838A8A8A9797939393A7A7A2A2A7A7A79393939393
        97976B6B87878787878787877D7D6B6B8383836B6B6B6B6B6B6B6F6F6969696B
        6B5D5D5D5D5D5D5D6B6B6B626261616161615D5D6161615D5D5D5D5D6B6B6767
        6969696B6B6B6B6B7D7D76766969695C5C5050504B4B58583F3F3F3F3F3F3F3F
        3F3F252525252525252525251717252525252512121414141313131313131320
        2014141412122525141414171717171714141200000083838A8A8A9797939393
        A7A7A2A2A7A7A7939393939397976B6B87878787878787877D7D6B6B8383836B
        6B6B6B6B6B6B6F6F6969696B6B5D5D5D5D5D5D5D6B6B6B626261616161615D5D
        6161615D5D5D5D5D6B6B67676969696B6B6B6B6B7D7D76766969695C5C505050
        4B4B58583F3F3F3F3F3F3F3F3F3F252525252525252525251717252525252512
        1214141413131313131313202014141412122525141414171717171714141200
        000087879797979393ACACACACACACACA7A7A793939393939393979787878787
        87878787979783838383836B6B6B6B6B6B6B7D7D6F6F6F78786B6B6B67676161
        6969696262696969616162625D5D5D61615D5D5D6B6B6B6B6B6B6B6B6B7D7D7D
        6B6B7D7D6B6B6B5C5C5C5C5C505050505D5D5D3E3E3F3F3F3F3F252525252525
        2525252525251212252525121213131313131313131313131325252514142525
        171717141412121217171700000087879797979393ACACACACACACACA7A7A793
        93939393939397978787878787878787979783838383836B6B6B6B6B6B6B7D7D
        6F6F6F78786B6B6B676761616969696262696969616162625D5D5D61615D5D5D
        6B6B6B6B6B6B6B6B6B7D7D7D6B6B7D7D6B6B6B5C5C5C5C5C505050505D5D5D3E
        3E3F3F3F3F3F2525252525252525252525251212252525121213131313131313
        13131313132525251414252517171714141212121717170000009797979797AC
        ACACACACB1B1A5A5ADADADABAB93939393939797979797979797979787879797
        83838386867D7D7D83836B6B8383836B6B787878767669696F6F6F6C6C626262
        696961616262625D5D5D5D5D6B6B6B6B7B7B7B6B6B8686866B6B6B6B6B6B6B6B
        6B6A6A6A6B6B61614C4C4C4C4C3E3E3E32322525252525252525252525252525
        1717172020141414131313131414142525141414252526261717171414171717
        1414120000009797979797ACACACACACB1B1A5A5ADADADABAB93939393939797
        97979797979797978787979783838386867D7D7D83836B6B8383836B6B787878
        767669696F6F6F6C6C626262696961616262625D5D5D5D5D6B6B6B6B7B7B7B6B
        6B8686866B6B6B6B6B6B6B6B6B6A6A6A6B6B61614C4C4C4C4C3E3E3E32322525
        2525252525252525252525251717172020141414131313131414142525141414
        2525262617171714141717171414120000009797ACACACBABABABABAACACB9B9
        A5A5A5ABABABABABABAB93939797979797979797979793939797978383868686
        838386868383836B6B858585767676766C6C6C717169696962626B6B5D5D5D61
        615D5D5D6B6B7B7B7676767F7F6B6B6B86867F7F7B7B7B7B7B6B6B6B6B6B6B6B
        5C5C5C4C4C3F3F3F313125252525252525252525242417172424242020131313
        1414141424242417172626262626262617171717171717171414120000009797
        ACACACBABABABABAACACB9B9A5A5A5ABABABABABABAB93939797979797979797
        979793939797978383868686838386868383836B6B858585767676766C6C6C71
        7169696962626B6B5D5D5D61615D5D5D6B6B7B7B7676767F7F6B6B6B86867F7F
        7B7B7B7B7B6B6B6B6B6B6B6B5C5C5C4C4C3F3F3F313125252525252525252525
        2424171724242420201313131414141424242417172626262626262617171717
        17171717141412000000A7A7939393C3C3BABABABABAA5A5B9B9B9ABABA5A5A5
        ABAB9797979797979797979797979F9F9797979393838383878783838686866B
        6B8383837B7B76767171716C6C717171696962626161615D5D5D5D5D6B6B7B7B
        7B7B7B6B6B8686866B6B83836B6B6B85857B7B7B6B6B6B6B6161614C4C313131
        2E2E252525252525252525252525171725252513131414142020171726262626
        2626262630302B2B1717171414121212171714000000A7A7939393C3C3BABABA
        BABAA5A5B9B9B9ABABA5A5A5ABAB9797979797979797979797979F9F97979793
        93838383878783838686866B6B8383837B7B76767171716C6C71717169696262
        6161615D5D5D5D5D6B6B7B7B7B7B7B6B6B8686866B6B83836B6B6B85857B7B7B
        6B6B6B6B6161614C4C3131312E2E252525252525252525252525171725252513
        1314141420201717262626262626262630302B2B171717141412121217171400
        0000A7A7939393C3C3BABABABABAA5A5B9B9B9ABABA5A5A5ABAB979797979797
        9797979797979F9F9797979393838383878783838686866B6B8383837B7B7676
        7171716C6C717171696962626161615D5D5D5D5D6B6B7B7B7B7B7B6B6B868686
        6B6B83836B6B6B85857B7B7B6B6B6B6B6161614C4C3131312E2E252525252525
        2525252525251717252525131314141420201717262626262626262630302B2B
        1717171414121212171714000000B9B9B9B9B9ACACC3C3C3B9B9B9B9ACACACA7
        A7ACACACA7A79F9F9797979393878787939387879F9F9F979787878797979393
        8383839797838383868683838585857676858585767678786B6B6B69696B6B6B
        6B6B6B6B6B6B6B67676969697B7B6B6B76767678787878786B6B6B6B5D5D5D3F
        3F3F3F3F2E2E2525242424131324242413132424121212252525252517172525
        2F2F2F2929262626292925252525252525131313121224000000B9B9B9B9B9AC
        ACC3C3C3B9B9B9B9ACACACA7A7ACACACA7A79F9F979797939387878793938787
        9F9F9F9797878787979793938383839797838383868683838585857676858585
        767678786B6B6B69696B6B6B6B6B6B6B6B6B6B67676969697B7B6B6B76767678
        787878786B6B6B6B5D5D5D3F3F3F3F3F2E2E2525242424131324242413132424
        1212122525252525171725252F2F2F2929262626292925252525252525131313
        121224000000A6A6BABABAC6C6ACACACB0B0B9B9ACACACA7A7939393A7A79F9F
        9F9F9F9F9F93939393939F9F9F9F9F9797878787939397979393938383979797
        8383838385858583838383836B6B6B6B6B6B6B6F6F6969696B6B67676B6B6B6B
        6B67676769696B6B6B6B6B6B6B767676696961615151513F3F3F3F3F2F2F2424
        1717171313121212171713132525252525121212252525252929293030292929
        252525252525251717202020121217000000A6A6BABABAC6C6ACACACB0B0B9B9
        ACACACA7A7939393A7A79F9F9F9F9F9F9F93939393939F9F9F9F9F9797878787
        9393979793939383839797978383838385858583838383836B6B6B6B6B6B6B6F
        6F6969696B6B67676B6B6B6B6B67676769696B6B6B6B6B6B6B76767669696161
        5151513F3F3F3F3F2F2F24241717171313121212171713132525252525121212
        252525252929293030292929252525252525251717202020121217000000BABA
        ACACACC6C6ACACACC6C6ACACACACACA7A7A2A2A2A7A797979797979F9F979797
        9F9F979797979797979797978787979787878793938383839797838393939383
        838686866B6B83836F6F6F69696F6F6F6B6B5D5D6B6B6B67676B6B6B5D5D6B6B
        6767676B6B67676761615D5D4C4C4C3F3F3232322F2F24242525251717202020
        121224241717172424252525171725252F2F2F2A2A3030302929252525252525
        25171717202012000000BABAACACACC6C6ACACACC6C6ACACACACACA7A7A2A2A2
        A7A797979797979F9F9797979F9F979797979797979797978787979787878793
        938383839797838393939383838686866B6B83836F6F6F69696F6F6F6B6B5D5D
        6B6B6B67676B6B6B5D5D6B6B6767676B6B67676761615D5D4C4C4C3F3F323232
        2F2F24242525251717202020121224241717172424252525171725252F2F2F2A
        2A303030292925252525252525171717202012000000BABAACACACC6C6ACACAC
        C6C6ACACACACACA7A7A2A2A2A7A797979797979F9F9797979F9F979797979797
        979797978787979787878793938383839797838393939383838686866B6B8383
        6F6F6F69696F6F6F6B6B5D5D6B6B6B67676B6B6B5D5D6B6B6767676B6B676767
        61615D5D4C4C4C3F3F3232322F2F242425252517172020201212242417171724
        24252525171725252F2F2F2A2A30303029292525252525252517171720201200
        0000BABAB0B0B0B9B9B9B9B9ACACB0B0B9B9B9ACACA7A7A7A7A79797ABABAB97
        97939393ACAC9797979797ACAC979797979797979F9F9F979793939387879797
        9F9F9F9797838383868687876B6B6B7D7D69696961615D5D5D5D5D5D5D505050
        5D5D5D5D50505050505D5D5D4C4C51513F3F3F3F3F3030302424252512121224
        2412121212122525171717252521212125252525292929252529292925252525
        2525252525252525121225000000BABAB0B0B0B9B9B9B9B9ACACB0B0B9B9B9AC
        ACA7A7A7A7A79797ABABAB9797939393ACAC9797979797ACAC97979797979797
        9F9F9F9797939393878797979F9F9F9797838383868687876B6B6B7D7D696969
        61615D5D5D5D5D5D5D5050505D5D5D5D50505050505D5D5D4C4C51513F3F3F3F
        3F30303024242525121212242412121212122525171717252521212125252525
        2929292525292929252525252525252525252525121225000000B9B9BABABAAC
        ACB8B8B8ACACACACB9B9B9A7A7ACACACA7A7ACACA7A7A7ACACA7A7A7A5A5ACAC
        ACACACA7A7979797979797979797979797979797979787879797979797878787
        838387877D7D7D6B6B6F6F6F5D5D51515D5D5D515151515151514C4C5151514C
        4C3F3F3F4C4C3F3F3F3F3F303025252525252525252525131312121212122424
        1717172525242424171725253030302929303030292925252525252525252525
        252512000000B9B9BABABAACACB8B8B8ACACACACB9B9B9A7A7ACACACA7A7ACAC
        A7A7A7ACACA7A7A7A5A5ACACACACACA7A7979797979797979797979797979797
        979787879797979797878787838387877D7D7D6B6B6F6F6F5D5D51515D5D5D51
        5151515151514C4C5151514C4C3F3F3F4C4C3F3F3F3F3F303025252525252525
        2525251313121212121224241717172525242424171725253030302929303030
        292925252525252525252525252512000000BABABABABAB8B8ACACACACACB0B0
        A5A5A5ACACACACACA7A7A5A5A5A5A5B9B9ACACACB1B1A6A6A5A5A5ACACA7A7A7
        979797979797979797979797979797979797979797979797878787876B6B6B6B
        6B6969695151515151515151515151513F3F3F3F3F3F3F3A3A3232323B3B3232
        3030302929252525252517172424241313242424131312122525252424171717
        252525252A2A2A30302A2A2A252525252929292525252525252517000000BABA
        BABABAB8B8ACACACACACB0B0A5A5A5ACACACACACA7A7A5A5A5A5A5B9B9ACACAC
        B1B1A6A6A5A5A5ACACA7A7A79797979797979797979797979797979797979797
        97979797878787876B6B6B6B6B6969695151515151515151515151513F3F3F3F
        3F3F3F3A3A3232323B3B32323030302929252525252517172424241313242424
        131312122525252424171717252525252A2A2A30302A2A2A2525252529292925
        25252525252517000000BABABABABAB8B8ACACACACACB0B0A5A5A5ACACACACAC
        A7A7A5A5A5A5A5B9B9ACACACB1B1A6A6A5A5A5ACACA7A7A79797979797979797
        97979797979797979797979797979797878787876B6B6B6B6B69696951515151
        51515151515151513F3F3F3F3F3F3F3A3A3232323B3B32323030302929252525
        252517172424241313242424131312122525252424171717252525252A2A2A30
        302A2A2A252525252929292525252525252517000000BABABABABAB8B8ACACAC
        B8B8ACACB1B1B1B1B1B1B1B1A7A7ACACB1B1B1A6A6B0B0B0BABAA6A6B0B0B0A5
        A5A7A7A798989797A7A7A7979798989897979797979797979793939383836B6B
        6B6B6B6F6F696969515151515252523F3F3F3F3F3F3F3F3F3F3F3F24242E2E2E
        2F2F242425252525252525251717252525252513131212121212242417171725
        25252525171725252F2F2F292925252529292525303030292925252525252500
        0000BABABABABAB8B8ACACACB8B8ACACB1B1B1B1B1B1B1B1A7A7ACACB1B1B1A6
        A6B0B0B0BABAA6A6B0B0B0A5A5A7A7A798989797A7A7A7979798989897979797
        979797979793939383836B6B6B6B6B6F6F696969515151515252523F3F3F3F3F
        3F3F3F3F3F3F3F24242E2E2E2F2F242425252525252525251717252525252513
        13121212121224241717172525252525171725252F2F2F292925252529292525
        3030302929252525252525000000BABAB0B0B0B8B8ACACACACACACACACACACB9
        B9ACACACB1B1A5A5B9B9B9BABABABABABABABABAA6A6A6A5A5ACACACA7A7A7A7
        97979797979797979797A7A79393938A8A97979783836B6B7878786969616161
        515151513F3F3F52523F3F3F2F2F3F3F2F2F2F2E2E2424242F2F242425252525
        2517171717172525242424131324242413132424171717252524242425252525
        2929293030292929292929292929292929252525292925000000BABAB0B0B0B8
        B8ACACACACACACACACACACB9B9ACACACB1B1A5A5B9B9B9BABABABABABABABABA
        A6A6A6A5A5ACACACA7A7A7A797979797979797979797A7A79393938A8A979797
        83836B6B7878786969616161515151513F3F3F52523F3F3F2F2F3F3F2F2F2F2E
        2E2424242F2F2424252525252517171717172525242424131324242413132424
        1717172525242424252525252929293030292929292929292929292929252525
        292925000000BABABABABAACACC6C6C6ACACB9B9B9B9B9B9B9ACACACB9B9B8B8
        A5A5A5ACACACACACB8B8A5A5ACACACACACB8B8B8B8B8ACACABABABA5A5ABABAB
        979793939393939393939393979785856B6B6B858578787850505D5D4C4C4C3E
        3E323232323232322F2F2F121225252529292929252525242413131312122525
        171717171713131312121717252525171730303025252F2F2F2F2F29292F2F2F
        2F2F2F2F2F2F2F33332F2F2F2F2F2F000000}
      ExplicitHeight = 292
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 380
    Width = 523
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object DSBooks: TDataSource
    DataSet = cdBooks
    Left = 441
    Top = 168
  end
  object cdBooks: TVirtualTable
    Active = True
    IndexFieldNames = 'bookname CIS'
    FieldDefs = <
      item
        Name = 'bookname'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'database'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'server'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    Left = 320
    Top = 124
    Data = {
      030004000800626F6F6B6E616D65010014000000000008006461746162617365
      0100E8030000000006007365727665720100FA00000000000200696403000000
      00000000000000000000}
    object cdBooksbookname: TStringField
      DisplayLabel = 'Bookname'
      DisplayWidth = 50
      FieldName = 'bookname'
    end
    object cdBooksdatabase: TStringField
      FieldName = 'database'
      Visible = False
      Size = 1000
    end
    object cdBooksserver: TStringField
      FieldName = 'server'
      Visible = False
      Size = 250
    end
    object cdBooksid: TIntegerField
      FieldName = 'id'
      Visible = False
    end
  end
end
