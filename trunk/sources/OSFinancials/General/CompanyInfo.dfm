object fmCompanyInfo: TfmCompanyInfo
  Left = 464
  Top = 121
  Caption = 'Company Information'
  ClientHeight = 578
  ClientWidth = 869
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 544
    Width = 869
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      869
      34)
    object BtnOk: TBitBtn
      Left = 658
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
      OnClick = btnOkClick
      OnKeyDown = FormKeyDown
    end
    object BtnCancel: TBitBtn
      Left = 769
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
      OnClick = btnCancelClick
      OnKeyDown = FormKeyDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 869
    Height = 544
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 867
      Height = 542
      ActivePage = TabOptions
      Align = alClient
      Style = tsButtons
      TabOrder = 0
      object tabAddress: TTabSheet
        Caption = 'Address'
        ImageIndex = 1
        DesignSize = (
          859
          511)
        object Label1: TLabel
          Left = 59
          Top = 11
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Company name'
        end
        object Label2: TLabel
          Left = 94
          Top = 35
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Address'
        end
        object Label9: TLabel
          Left = 432
          Top = 59
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tax Reg No.'
        end
        object Label8: TLabel
          Left = 406
          Top = 35
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Company Reg No.'
        end
        object Label6: TLabel
          Left = 98
          Top = 151
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fax no.'
        end
        object Label5: TLabel
          Left = 64
          Top = 127
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Telephone no.'
        end
        object Label10: TLabel
          Left = 458
          Top = 127
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'E-Mail :'
        end
        object Label3: TLabel
          Left = 436
          Top = 11
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Postal Code'
        end
        object LBankname1: TLabel
          Left = 72
          Top = 191
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bank1 name'
        end
        object LBankNumber1: TLabel
          Left = 86
          Top = 239
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bank1 nr '
        end
        object LBankname2: TLabel
          Left = 433
          Top = 187
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bank2 name'
        end
        object LBankNumber2: TLabel
          Left = 424
          Top = 235
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bank2 number'
        end
        object Shape1: TShape
          Left = 48
          Top = 175
          Width = 665
          Height = 1
        end
        object Shape2: TShape
          Left = 48
          Top = 114
          Width = 665
          Height = 1
        end
        object Label14: TLabel
          Left = 83
          Top = 263
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'SWIFT nr '
        end
        object Label15: TLabel
          Left = 95
          Top = 287
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'IBAN nr'
        end
        object Label16: TLabel
          Left = 444
          Top = 259
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'SWIFT nr '
        end
        object Label17: TLabel
          Left = 456
          Top = 283
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'IBAN nr'
        end
        object LHoldername1: TLabel
          Left = 72
          Top = 215
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Holder name'
        end
        object LHoldername2: TLabel
          Left = 435
          Top = 211
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'holder name'
        end
        object Label21: TLabel
          Left = 476
          Top = 310
          Width = 17
          Height = 13
          Alignment = taRightJustify
          Caption = 'BIC'
        end
        object Label11: TLabel
          Left = 113
          Top = 310
          Width = 17
          Height = 13
          Alignment = taRightJustify
          Caption = 'BIC'
        end
        object DBEdit1: TDBEdit
          Left = 136
          Top = 8
          Width = 249
          Height = 21
          DataField = 'SCompanyName'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 0
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit2: TDBEdit
          Left = 136
          Top = 32
          Width = 201
          Height = 21
          DataField = 'SAddress1'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 1
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit3: TDBEdit
          Left = 136
          Top = 56
          Width = 201
          Height = 21
          DataField = 'SAddress2'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 2
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit4: TDBEdit
          Left = 136
          Top = 80
          Width = 201
          Height = 21
          DataField = 'SAddress3'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 3
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit5: TDBEdit
          Left = 496
          Top = 8
          Width = 209
          Height = 21
          DataField = 'SPostCode'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 4
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit10: TDBEdit
          Left = 496
          Top = 120
          Width = 209
          Height = 21
          DataField = 'SEmailAddress'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 9
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit6: TDBEdit
          Left = 136
          Top = 120
          Width = 201
          Height = 21
          DataField = 'SPhoneNumber'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 7
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit7: TDBEdit
          Left = 136
          Top = 144
          Width = 201
          Height = 21
          DataField = 'SFaxNumber'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 8
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit8: TDBEdit
          Left = 496
          Top = 32
          Width = 209
          Height = 21
          DataField = 'SCompanyRegNo'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 5
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
        end
        object DBEdit9: TDBEdit
          Left = 496
          Top = 56
          Width = 209
          Height = 21
          DataField = 'STAXRegNo'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 6
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit11: TDBEdit
          Left = 136
          Top = 184
          Width = 209
          Height = 21
          DataField = 'SBANKNAME1'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 10
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit12: TDBEdit
          Left = 136
          Top = 232
          Width = 209
          Height = 21
          DataField = 'SBANKNUMBER1'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 12
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit14: TDBEdit
          Left = 496
          Top = 184
          Width = 209
          Height = 21
          DataField = 'SBANKNAME2'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 15
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit13: TDBEdit
          Left = 496
          Top = 232
          Width = 209
          Height = 21
          DataField = 'SBANKNUMBER2'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 17
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit15: TDBEdit
          Left = 136
          Top = 256
          Width = 209
          Height = 21
          DataField = 'SBANKSWIFT1'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 13
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit16: TDBEdit
          Left = 136
          Top = 280
          Width = 209
          Height = 21
          DataField = 'SBANKIBAN1'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 14
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit17: TDBEdit
          Left = 496
          Top = 256
          Width = 209
          Height = 21
          DataField = 'SBANKSWIFT2'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 18
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit18: TDBEdit
          Left = 496
          Top = 280
          Width = 209
          Height = 21
          DataField = 'SBANKIBAN2'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 19
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit19: TDBEdit
          Left = 136
          Top = 208
          Width = 209
          Height = 21
          DataField = 'SBANKACCOUNTNAME1'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 11
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit20: TDBEdit
          Left = 496
          Top = 208
          Width = 209
          Height = 21
          DataField = 'SBANKACCOUNTNAME2'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 16
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object PFreefield: TPanel
          Left = 0
          Top = 344
          Width = 867
          Height = 168
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 20
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 216
            Top = 76
            TabOrder = 0
            Width = 121
          end
        end
        object DBEdit22: TDBEdit
          Left = 499
          Top = 307
          Width = 209
          Height = 21
          DataField = 'SBANKBIC2'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 21
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
        object DBEdit21: TDBEdit
          Left = 136
          Top = 307
          Width = 209
          Height = 21
          DataField = 'SBANKBIC1'
          DataSource = dmDatabase.dsSysVars
          TabOrder = 22
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit9KeyPress
        end
      end
      object TabOptions: TTabSheet
        Caption = 'Options'
        ImageIndex = 1
        DesignSize = (
          859
          511)
        object Label4: TLabel
          Left = 4
          Top = 12
          Width = 57
          Height = 13
          Caption = 'Tax Method'
        end
        object Label7: TLabel
          Left = 4
          Top = 54
          Width = 62
          Height = 13
          Caption = 'Due account'
        end
        object Label13: TLabel
          Left = 370
          Top = 12
          Width = 71
          Height = 13
          Caption = 'Company Logo'
        end
        object Label12: TLabel
          Left = 164
          Top = 54
          Width = 72
          Height = 13
          Caption = 'Default Output '
        end
        object Label18: TLabel
          Left = 4
          Top = 260
          Width = 245
          Height = 13
          Caption = 'Local path (folder for local files save like images etc)'
        end
        object Label19: TLabel
          Left = 4
          Top = 296
          Width = 192
          Height = 13
          Caption = 'Plugins path (path with the reports folder)'
        end
        object Label20: TLabel
          Left = 4
          Top = 332
          Width = 203
          Height = 13
          Caption = 'ini path  (ini file, registration and books files)'
        end
        object comboxTaxType: TComboBox
          Left = 4
          Top = 26
          Width = 117
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = comboxTaxTypeChange
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
          Items.Strings = (
            'Invoice Based'
            'Payments Based')
        end
        object edtDueAccount: TEdit
          Left = 4
          Top = 72
          Width = 73
          Height = 21
          TabOrder = 1
          OnEnter = edtDueAccountEnter
          OnKeyDown = FormKeyDown
        end
        object Button1: TButton
          Left = 4
          Top = 149
          Width = 321
          Height = 25
          Caption = 'Click here to set the Windows date / currency format'
          TabOrder = 2
          TabStop = False
          OnClick = Button1Click
          OnKeyDown = FormKeyDown
        end
        object CbCompLogo: TCheckBox
          Left = 164
          Top = 24
          Width = 169
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Use Picture logo on Reports'
          TabOrder = 3
          Visible = False
        end
        object DBImage1: TcxDBImage
          Left = 370
          Top = 26
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataBinding.DataField = 'BLOBLOGO'
          DataBinding.DataSource = dmDatabase.dsSysVars
          PopupMenu = PopupMenu1
          TabOrder = 4
          Height = 448
          Width = 472
        end
        object cbDefaultOutPut: TComboBox
          Left = 164
          Top = 72
          Width = 117
          Height = 21
          Style = csDropDownList
          TabOrder = 5
          OnChange = comboxTaxTypeChange
          OnKeyDown = FormKeyDown
          OnKeyPress = DBEdit1KeyPress
          Items.Strings = (
            'Invoice Based'
            'Payments Based')
        end
        object Bsetdata: TBitBtn
          Left = 276
          Top = 368
          Width = 75
          Height = 25
          Caption = 'Save'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 6
          OnClick = BsetdataClick
        end
        object ELocalpath: TEdit
          Left = 4
          Top = 272
          Width = 349
          Height = 21
          TabOrder = 7
          Text = 'ELocalpath'
        end
        object EPluginspath: TEdit
          Left = 4
          Top = 308
          Width = 349
          Height = 21
          TabOrder = 8
          Text = 'Edit1'
        end
        object EIniPath: TEdit
          Left = 4
          Top = 344
          Width = 349
          Height = 21
          TabOrder = 9
          Text = 'Edit1'
        end
        object Clear: TButton
          Left = 276
          Top = 396
          Width = 75
          Height = 25
          Caption = 'Clear'
          TabOrder = 10
          OnClick = ClearClick
        end
        object cbDebugsql: TCheckBox
          Left = 8
          Top = 240
          Width = 97
          Height = 17
          Caption = 'Debug sql'
          TabOrder = 11
        end
        object Button2: TButton
          Left = 525
          Top = 480
          Width = 135
          Height = 25
          Action = Clear1
          Anchors = [akRight, akBottom]
          TabOrder = 12
        end
        object Button3: TButton
          Left = 673
          Top = 480
          Width = 161
          Height = 25
          Action = LoadFromFile1
          Anchors = [akRight, akBottom]
          TabOrder = 13
        end
        object Button4: TButton
          Left = 365
          Top = 480
          Width = 147
          Height = 25
          Action = Paste1
          Anchors = [akRight, akBottom]
          TabOrder = 14
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 238
    Top = 110
    object Clear1x: TMenuItem
      Action = Clear1
    end
    object LoadFromFile1x: TMenuItem
      Action = LoadFromFile1
    end
    object Paste1x: TMenuItem
      Action = Paste1
    end
  end
  object ActionList1: TActionList
    Left = 501
    Top = 104
    object Clear1: TAction
      Caption = '&Clear'
      OnExecute = Clear1Click
    end
    object LoadFromFile1: TAction
      Caption = 'L&oad From File'
      OnExecute = LoadFromFile1Click
    end
    object Paste1: TAction
      Caption = '&Paste'
      OnExecute = Paste1Click
    end
  end
end
