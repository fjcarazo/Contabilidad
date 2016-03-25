object fmPrintOptions: TfmPrintOptions
  Left = 334
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Printing Options'
  ClientHeight = 142
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DestLbl: TLabel
    Left = 10
    Top = 18
    Width = 74
    Height = 13
    Caption = 'Send report To:'
    FocusControl = cbDestination
  end
  object lblCopies: TLabel
    Left = 131
    Top = 17
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'Copies :'
    Enabled = False
    FocusControl = edtCount
  end
  object cbDestination: TComboBox
    Left = 10
    Top = 50
    Width = 91
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbDestinationChange
    OnKeyPress = cbDestinationKeyPress
    Items.Strings = (
      'Screen'
      'Printer'
      'File'
      'E-mail')
  end
  object BitBtnPrint: TBitBtn
    Left = 112
    Top = 48
    Width = 141
    Height = 25
    Caption = '&Printer Setup'
    TabOrder = 2
    TabStop = False
    OnClick = BitBtnPrintClick
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000000000000000
      1F7C1F7C1F7C1F7C000018631863186318631863186318631863186300001863
      00001F7C1F7C0000000000000000000000000000000000000000000000000000
      186300001F7C0000186318631863186318631863E07FE07FE07F186318630000
      000000001F7C0000186318631863186318631863104210421042186318630000
      186300001F7C0000000000000000000000000000000000000000000000000000
      1863186300000000186318631863186318631863186318631863186300001863
      0000186300001F7C000000000000000000000000000000000000000018630000
      1863000000001F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00001863
      0000186300001F7C1F7C1F7C0000FF7F00000000000000000000FF7F00000000
      000000001F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7F00000000000000000000FF7F0000
      1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      00001F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000000000000000000000
      00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
      1F7C1F7C1F7C}
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 110
    Width = 282
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object btnCancel: TBitBtn
      Left = 136
      Top = 4
      Width = 95
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 1
      TabStop = False
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
      Left = 40
      Top = 4
      Width = 95
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 0
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
  end
  object UpDown1: TUpDown
    Left = 210
    Top = 12
    Width = 16
    Height = 24
    Enabled = False
    Min = 1
    Max = 32767
    Position = 1
    TabOrder = 4
    OnClick = UpDown1Click
  end
  object edtCount: TEdit
    Left = 172
    Top = 14
    Width = 37
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = '1'
    OnChange = edtCountChange
    OnKeyPress = cbDestinationKeyPress
  end
end