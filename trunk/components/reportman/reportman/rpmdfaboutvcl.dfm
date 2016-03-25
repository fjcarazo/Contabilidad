object FRpAboutBoxVCL: TFRpAboutBoxVCL
  Left = 239
  Top = 268
  BorderStyle = bsDialog
  Caption = 'About Report Manager'
  ClientHeight = 347
  ClientWidth = 452
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 205
    Width = 452
    Height = 101
    Align = alClient
    Color = clBtnFace
    Lines.Strings = (
      'PDF Export base: K.Nishita (info@nishita.com) '
      
        'ZLib Compression: Jean-loup Gailly, Mark Adler, Jacques Nomssi N' +
        'zali'
      
        'Barcode codebase: Andreas Schmidth and friends (shmia@bizerba.de' +
        ')')
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 306
    Width = 452
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BOK: TButton
      Left = 191
      Top = 8
      Width = 90
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 205
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Image2: TImage
      Left = 8
      Top = 4
      Width = 49
      Height = 64
      AutoSize = True
      Picture.Data = {
        07544269746D617036250000424D362500000000000036000000280000003100
        000040000000010018000000000000250000120B0000120B0000000000000000
        0000848484848484848484848484848484848484848484848484848484848484
        8484848484848484848484848484848484848484848484848484848484848484
        8484848484848484848484848484848484848484848484848484848484848484
        8484848484848484848484848484848484848484848484848484848484848484
        84848484848484848484848484848484848484848400C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C684848400C6C6C600000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000C6C6C684848400C6C6
        C6000000FFF7F7F7F7FFFFF7F7F7FFF7EFF7F7FFF7FFF7FFF7F7FFFFF7FFF7E7
        F7F7E7FFF7EFF7F7F7F7FFEFF7F7EFFFFFF7F7F7F7FFF7EFEFF7EFF7F7EFFFFF
        FFFFF7F7F7F7F7F7EFEFF7F7F7FFF7F7F7F7EFFFFFF7F7FFF7FFF7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7FFF7F7F7EFEFF7FFEFF7F7EFE7EFDEDEDEF7EFEFE7
        E7E7EFF7EFF7F7F7000000C6C6C684848400C6C6C6000000F7F7F7F7FFF7F7F7
        F7F7F7FFEFF7F7F7E7E7F7BDC6F7BDC6EFC6C6F7DEDEF7CED6F7DEDEEFD6DEEF
        CEC6EFCECEEFCED6EFC6CEEFCECEEFC6CEEFC6CEEFDEDEF7F7F7F7F7F7FFF7F7
        EFE7EFF7C6C6F7D6D6EFC6C6F7CED6EFDED6EFCED6F7D6D6EFC6D6F7DED6F7F7
        F7F7FFFFFFF7F7F7F7F7FFF7F7EFF7F7F7F7F7FFF7F7F7FFF7FFF7F7000000C6
        C6C684848400C6C6C6000000F7F7F7FFF7FFF7F7F7F7FFF7EFF7F7F7EFE7F7CE
        CEF7D6D6F7D6CEF7DED6E7C6C6F7D6CEF7D6CEF7CECEF7D6DEEFD6CEEFCED6EF
        DEDEF7CED6F7DEDEF7EFF7F7F7F7F7FFF7F7F7FFF7EFEFF7B5BDF7CECEEFBDC6
        F7CECEF7CED6F7CECEF7CECEEFBDC6EFC6C6FFDEDEE7CECEEFCECEEFCECEE7DE
        DEF7F7EFF7FFF7F7F7FFF7F7F7F7F7F7000000C6C6C684848400C6C6C6000000
        FFF7F7F7FFF7FFF7FFF7F7F7EFF7F7F7DEE7F7BDC6FFBDC6F7BDC6F7C6CEF7BD
        BDF7C6D6F7BDC6F7CECEF7C6CEF7C6C6F7C6C6FFC6C6F7B5B5F7C6C6EFCED6F7
        F7EFE7F7F7F7F7F7F7E7DEF7C6C6EFD6CEF7C6C6EFC6C6F7C6BDEFCED6EFC6C6
        FFCECEF7C6CEF7CEC6F7D6D6F7CECEF7CECEF7C6C6EFD6CEEFE7E7FFF7F7F7FF
        FFF7F7EF000000C6C6C684848400C6C6C6000000F7F7FFF7F7F7F7F7F7F7F7F7
        F7F7F7EFEFE7EFDED6F7D6D6EFCECEEFCEC6EFC6CEF7DED6EFCEC6F7D6D6EFBD
        C6F7C6C6F7CECEEFCECEF7D6D6F7CED6E7C6CEF7F7F7EFFFEFF7FFF7F7E7E7F7
        C6C6F7C6C6F7C6CEF7C6C6FFBDC6F7DED6E7CEC6F7C6C6EFC6C6FFCECEF7D6D6
        F7C6C6F7CECEF7C6BDF7C6CEEFD6D6EFF7EFF7F7F7F7F7F7000000C6C6C68484
        8400C6C6C6000000F7F7F7F7FFF7F7F7F7F7FFF7FFF7FFEFDED6EFB5BDFFC6C6
        EFC6C6EFADB5F7B5BDF7ADBDF7C6CEFFBDC6EFB5ADF7B5BDF7BDBDF7B5B5F7B5
        B5F7A5ADEFBDBDF7E7E7F7F7EFEFF7FFE7EFEFF7C6C6F7CECEF7BDC6EFBDBDF7
        BDC6F7CECEFFC6CEEFB5B5F7BDC6F7CECEF7C6CEF7CECEFFBDC6F7C6CEF7CED6
        F7EFF7F7F7FFFFFFF7F7F7F7000000C6C6C684848400C6C6C6000000FFF7FFF7
        F7F7FFF7FFF7F7F7E7F7EFEFEFEFFFD6D6F7D6D6F7DEDEF7D6D6F7DED6EFD6CE
        F7D6D6EFCED6F7DEDEF7DEDEF7E7D6EFD6D6F7DECEF7E7DEF7F7F7F7F7FFEFFF
        F7FFF7F7F7EFEFEFE7DEF7EFEFFFE7EFF7EFE7F7EFE7EFEFEFEFEFE7F7E7E7EF
        E7E7EFEFE7EFEFE7EFEFEFEFEFEFEFFFFFEFF7F7EFF7F7F7FFF7F7F7F7F7F7FF
        000000C6C6C684848400C6C6C6000000F7FFF7F7F7F7F7F7F7F7FFF7F7F7F7F7
        E7E7EFBDBDF7B5C6EFC6BDF7B5BDFFADB5F7B5B5FFBDC6F7B5B5EFA5B5EFB5BD
        EFC6BDF7BDBDEFBDBDEFBDBDEFC6CEEFEFEFF7F7FFF7F7F7E7EFEFF7CECEF7D6
        CEF7D6D6F7D6D6EFCECEF7CED6F7D6D6F7D6D6F7D6CEF7CEC6F7D6D6EFD6D6F7
        D6D6F7EFEFFFEFE7F7F7F7FFF7F7F7F7F7FFF7F7000000C6C6C684848400C6C6
        C6000000FFF7FFF7F7F7F7F7FFFFF7F7E7F7EFD6D6DEA5ADA5C6BDB5ADB5ADA5
        ADA5CEDEDEFFFFFFEFFFFFF7FFFFFFFFFFFFFFFFFFF7FFFFF7F7FFFFFFF7FFFF
        F7F7FFF7FFF7F7F7F7F7F7F7F7E7E7EFB5B5EFB5BDF7CEC6F7C6C6EFBDCEF7BD
        C6F7C6C6F7CECEF7C6C6EFC6C6EFB5BDEFCECEF7DEDEEFCED6DED6D6F7EFF7F7
        FFFFF7F7F7F7FFFF000000C6C6C684848400C6C6C6000000F7F7F7FFFFF7F7F7
        F7F7FFF7EFF7F7E7E7E7B5ADADC6BDB5BDB5B5B5B5B5BDB5B5CEC6CED6C6CECE
        C6CEADADB5B5BDBDD6D6D6C6CECEBDBDC6C6BDC6D6C6BDE7EFE7F7FFF7F7F7FF
        EFE7E7F7BDC6FFC6D6EFCED6F7C6CEF7CECEFFCEC6F7CECEEFD6D6F7CEC6F7C6
        CEF7D6D6F7D6CEF7E7E7F7F7F7EFE7E7F7F7EFF7F7F7FFF7F7F7F7F7000000C6
        C6C684848400C6C6C6000000F7FFF7F7F7FFF7F7F7FFF7FFEFDEDEFFEFF7C6C6
        C6ADADB5BDC6C6BDBDBDA5A5ADADA5ADADB5ADC6B5B5C6B5ADB5ADB5B5ADB5B5
        A5A5ADADADC6CECED6C6CEE7E7E7FFF7F7FFFFF7EFEFEFF7BDBDEFC6C6F7CECE
        FFC6CEF7C6CEE7BDC6F7C6CEF7CED6EFC6C6EFCECEF7CEC6EFCECEF7CECEFFC6
        CEEFC6C6F7EFF7F7F7FFF7FFFFF7F7F7000000C6C6C684848400C6C6C6000000
        F7F7F7F7F7FFF7F7F7F7FFF7DEDEDEF7F7F7E7EFEFCECED6CECECEE7DED6CECE
        D6DEDEDEC6D6CEC6C6CECECECEC6D6D6D6E7DEBDC6CEC6C6CEE7E7E7FFF7F7F7
        F7F7F7F7F7F7F7FFEFEFE7F7BDC6F7CEC6FFC6D6F7CED6FFCECEEFCECEF7CEC6
        EFBDC6F7CECEF7CECEF7BDBDF7BDC6E7C6C6EFBDBDF7F7F7F7FFF7F7F7F7FFF7
        F7F7F7F7000000C6C6C684848400C6C6C6000000F7FFF7FFF7F7F7FFF7F7F7F7
        FFF7FFF7EFEFF7EFE7F7DEE7FFE7EFEFEFEFFFF7F7FFFFFFFFF7F7F7FFFFFFFF
        FFFFFFFFFFF7FFFFFFFFFFFFFFF7FFF7F7F7F7FFF7FFF7FFF7FFF7F7F7EFEFF7
        DEDEF7E7E7EFE7DEEFDEDEEFDEDEF7DEE7F7E7EFEFCEC6F7D6D6F7DEE7F7CED6
        F7DED6FFDED6DEC6C6EFE7EFEFF7F7F7F7F7F7FFFFF7F7F7000000C6C6C68484
        8400C6C6C6000000F7F7FFFFF7F7F7F7FFF7F7F7F7FFF7F7E7E7EFBDC6F7C6BD
        F7BDBDEFCECEE7C6C6EFE7E7EFDEDEEFD6D6E7D6D6F7DEDEF7DEDEF7D6CEF7CE
        D6EFDED6F7F7F7F7F7EFEFF7F7F7F7FFF7EFEFF7C6C6F7CECEF7CED6FFD6CEF7
        CED6F7D6CEEFD6D6FFDEDEF7CECEE7D6D6FFDEDEDECEC6F7EFEFFFFFF7F7FFF7
        EFFFFFF7F7F7FFF7F7F7FFFF000000C6C6C684848400C6C6C6000000F7F7F7F7
        F7F7F7FFF7FFF7F7F7F7FFF7EFE7EFC6CEF7C6CEEFC6C6F7CECEF7CED6EFCECE
        EFC6C6EFCED6F7CECEF7CECEF7D6DEEFCECEF7D6D6F7DEDEF7F7F7F7F7F7F7EF
        F7F7F7F7F7DEE7F7ADB5FFBDC6F7BDBDEFC6BDF7B5C6F7BDBDFFC6D6EFB5BDF7
        C6C6F7BDC6F7B5BDF7C6BDEFC6BDF7C6CEEFC6C6F7E7E7F7FFFFF7F7F7F7F7F7
        000000C6C6C684848400C6C6C6000000F7F7F7FFF7F7F7F7FFF7F7F7EFF7EFF7
        EFE7FFBDBDF7B5BDF7CEC6F7BDBDEFADB5FFCEC6EFB5B5EFB5B5EFA5ADF7B5BD
        F7ADB5F7ADB5FFB5B5F7C6C6E7D6DEF7E7E7F7FFFFEFF7EFF7F7FFE7F7EFEFF7
        F7F7F7FFEFF7EFF7FFF7F7FFF7F7F7EFEFFFF7F7F7F7F7FFF7F7FFEFEFFFEFEF
        F7F7F7F7EFF7EFF7F7F7F7FFF7F7F7F7F7F7FFF7000000C6C6C684848400C6C6
        C6000000F7F7FFF7FFF7F7F7F7F7FFFFFFFFF7EFD6E7CEBDBDD6CED6D6D6CED6
        BDBDE7DEDEF7EFE7F7E7EFF7EFEFF7E7EFF7EFEFEFE7DEEFDEDEEFE7DEEFE7E7
        EFE7DEEFEFEFF7F7F7F7F7F7F7EFF7F7E7F7F7E7EFF7D6EFF7D6FFE7C6EFFFCE
        FFF7D6FFEFCEF7F7C6F7F7C6F7EFCEF7F7D6F7F7D6F7F7E7F7F7EFF7F7FFF7F7
        F7F7F7F7FFF7F7F7000000C6C6C684848400C6C6C6000000F7FFF7FFF7F7F7F7
        F7FFF7F7FFEFEFEFEFEFA5ADADA5ADADB5ADB5A59CA5EFE7E7DEDEDEEFDEE7E7
        DEDEE7DED6DEDEE7DEDEDEE7DEE7DEDEDEDEDEDEF7E7E7F7F7FFF7F7EFFFE7F7
        EFDEEFF7D6F7F7D6F7F7DEF7F7DEF7DED6E7EFD6EFE7D6DEFFE7EFEFDEF7E7C6
        EFE7C6EFEFCEE7F7CEF7EFDEF7FFD6F7F7EFF7F7F7F7FFFFF7FFF7F7000000C6
        C6C684848400C6C6C6000000FFF7F7F7F7FFF7FFF7F7FFF7E7C6CEF7E7E7BDB5
        BDBDBDB5C6BDBDB5B5BDBDC6C694A5A5ADBDB5B5BDBDADBDC6B5B5B5ADADADBD
        C6BDBDBDB5A5ADADD6CECEF7FFFFEFF7EFF7F7F7F7DEEFF7F7EFFFF7EFFFF7FF
        BDADDE9C94DEEFE7EFE7E7E7F7E7E7E7E7DEE7DED6D6DEDEDEEFE7F7F7FFF7E7
        F7EFD6F7F7E7F7F7FFFFF7F7F7F7FFFF000000C6C6C684848400C6C6C6000000
        F7F7F7F7F7F7F7F7F7FFF7FFF7FFF7F7F7F7F7E7EFFFF7FFFFFFF7F7EFEFFFFF
        FFFFF7F7FFFFF7FFF7FFFFFFF7F7FFF7FFFFFFFFF7F7FFF7F7FFFFFFF7FFFFF7
        F7F7EFF7EFF7EFFFEFD6EFEFE7F7F7E7EFE7DEEFADA5CED6C6FFC6ADE7FFEFFF
        EFD6EFFFEFF7EFE7EFF7EFFFF7DEF7F7EFF7E7E7EFE7DEEFF7F7F7FFF7FFF7F7
        F7FFF7F7000000C6C6C684848400C6C6C6000000FFF7F7F7FFF7F7F7F7F7FFF7
        F7F7FFF7E7E7E7B5ADEFB5ADF7BDBDEFC6C6F7B5B5F7BDBDF7B5BDF7B5BDEFBD
        BDF7ADB5F7BDBDF7BDBDEFBDBDF7DEDEEFE7DEEFEFEFEFEFF7FFFFEFEFD6EFFF
        EFF7EFFFEFB5A5EFE7E7E7FFFFEFA594F7CEDEDEDEDEDECECECEFFFFF7EFEFEF
        F7F7EFEFEFF7F7F7E7F7EFEFF7E7F7F7FFF7F7F7F7F7F7F7000000C6C6C68484
        8400C6C6C6000000F7F7F7F7F7F7F7F7FFF7F7F7EFF7FFEFE7EFF7C6CEF7DEDE
        F7D6D6F7DED6E7CECEEFDEDEF7DEDEEFDED6EFD6D6F7D6D6F7DEDEF7DEDEF7D6
        CEEFD6CEF7DEDEEFE7EFF7F7F7F7F7F7F7D6EFF7F7DEDEE7D6C6BDEFEFF7F7EF
        F7DEB5BDE7D6CEF7F7FFEFEFEFF7CEBDCEFFF7FFF7F7FFF7F7F7E7DEEFE7CEE7
        FFFFF7FFF7FFF7F7F7FFFFF7000000C6C6C684848400C6C6C6000000F7FFF7FF
        F7FFF7F7F7FFFFF7FFF7F7F7DEDEEFB5B5FFB5B5EFB5BDEFB5BDF7ADB5F7BDBD
        E7A5ADF7ADB5F7C6BDF7BDC6EFB5BDEFADADF7C6C6F7B5BDEFC6BDF7EFEFF7F7
        F7F7F7FFDEC6EFE7DEDEEFF7F7C6ADF7DEE7F7E7E7E7EFE7EFAD9CE7DED6EFCE
        D6DEBDC6D6CECECEEFE7EFE7E7D6C6B5DEDEBDF7F7F7EFF7F7F7F7FFF7F7F7F7
        000000C6C6C684848400C6C6C6000000F7F7F7F7F7F7F7FFF7F7F7FFE7FFFFF7
        EFEFEFCEBDF7C6CEF7CECEF7DEDEEFCECEE7D6D6EFCECEEFD6D6EFCECEEFCEC6
        EFC6C6F7BDBDF7CECEF7BDC6EFB5BDFFDEE7F7FFEFF7F7FFB5A5CED6CEF7B5AD
        DEBDB5DEBDBDD6EFE7EFEFEFEFE7E7E7BDADF7CEC6EFC6BDF7B59CE7D6E7C6D6
        E7CEB58CF7D6BDEFFFF7EFF7F7F7F7F7F7F7F7FF000000C6C6C684848400C6C6
        C6000000F7F7FFF7F7F7F7F7F7FFF7F7F7FFF7EFE7E7EFBDBDF7BDBDEFBDC6F7
        BDCEF7C6C6F7BDC6F7C6C6F7C6C6EFBDBDF7CECEF7C6C6EFBDC6EFBDBDF7C6BD
        F7CEDEF7F7EFF7F7F7F7F7F7E7CEEF948CE7A59CDEDEDEE7E7E7D6E7E7DEDEDE
        DEDEE7D6E7EFDEF7F7F7FFFFF7ADADEFCED6F7B5B5EFCEC6E7EFE7EFF7EFF7F7
        F7F7FFF7F7F7FFF7000000C6C6C684848400C6C6C6000000F7F7F7FFFFF7F7F7
        FFF7F7F7DEF7F7F7EFE7F7DEDEF7CED6EFDEDEF7DED6EFD6D6F7D6CEEFCECEF7
        DEDEEFDED6F7DEE7EFDED6E7CECEEFDED6FFDEE7EFCECEEFF7EFF7FFF7EFDEF7
        EFD6F7F7EFF7F7FFF7F7FFFFF7F7F7F7FFFFFFF7FFEFEFEFEFEFEFEFEFEFEFE7
        E7C6BDE79484D6DED6EFF7FFFFEFD6EFF7F7EFFFF7F7F7F7FFFFF7F7000000C6
        C6C684848400C6C6C6000000F7F7F7F7F7F7F7FFF7F7F7FFFFFFF7E7DEDECEAD
        B5EFC6C6E7C6CEE7C6C6E7CECEE7B5C6DEBDBDE7BDC6EFCED6FFD6DEFFD6D6F7
        D6D6F7D6D6F7DEDEEFCED6EFE7DEF7F7F7F7EFF7EFDEFFF7FFF7FFF7FFF7F7F7
        F7EFF7FFFFF7EFEFF7D6D6D6C6C6C6C6C6C6CEC6C6CED6CEEFEFF7F7FFF7F7EF
        F7F7DEF7F7F7F7F7FFF7F7F7F7F7FFF7000000C6C6C684848400C6C6C6000000
        FFF7F7F7F7FFFFF7F7F7F7F7F7E7EFE7E7E7ADB5ADADC6BDBDBDB59C9C9CB5BD
        C6ADADADA59CA5BDC6CEE7EFEFDEEFE7DEE7E7DEEFE7DEE7EFDEE7DEE7E7DEEF
        EFF7EFEFF7F7E7F7E7C6E7F7E7F7F7EFEFF7EFF7EFF7F7F7F7F7F7F7F7F7F7F7
        F7EFF7F7FFF7F7F7F7F7F7EFF7F7F7EFEFEFF7EFF7E7CEEFF7EFFFFFF7F7F7F7
        FFF7F7F7000000C6C6C684848400C6C6C6000000F7FFF7F7F7F7F7F7F7F7FFFF
        E7CECEEFDEE7BDB5B5C6BDC6CEC6CECEBDBDD6D6CEBDB5BDCEBDCEC6C6C6BDBD
        BDC6BDC6CEBDC6C6BDBDCEC6C6CEC6C6BDB5B5F7EFF7EFFFFFCECECEBDADBDBD
        B5BDBDB5BDC6B5BDC6BDBDBDBDBDCECECEC6C6C6BDBDBDC6BDC6C6C6C6CEB5D6
        FFF7FFFFF7F7EFEFF7F7EFEFFFF7F7F7F7F7F7FFF7FFF7FF000000C6C6C68484
        8400C6C6C6000000F7F7FFFFFFF7F7F7FFFFF7F7F7FFFFEFF7F7EFF7F7F7FFFF
        EFF7F7EFFFFFFFFFFFFFFFFFF7FFF7FFFFF7F7FFFFFFFFFFF7FFFFF7F7FFF7F7
        FFEFFFFFE7FFF7EFF7F7F7F7F7F7FFFFF7FFF7FFFFFFFFFFFFFFFFFFF7FFFFF7
        FFFFF7FFF7FFFFFFFFFFFFFFFFFFF7FFFFEFEFF7F7F7E7EFEFF7F7F7EFF7F7EF
        EFEFF7F7F7F7FFF7F7F7F7F7000000C6C6C684848400C6C6C6000000F7F7F7F7
        F7F7F7FFF7F7F7F7F7F7FFF7F7F7F7F7FFF7F7F7FFF7EFF7EFEFF7FFF7FFF7F7
        EFF7F7F7F7F7F7F7F7EFFFEFEFF7F7EFF7EFEFF7F7F7F7EFFFEFF7F7F7F7F7F7
        FFEFFFF7EFF7F7F7F7FFF7F7F7F7F7F7F7F7F7F7EFF7EFF7F7F7F7FFF7F7F7EF
        FFF7F7F7F7EFFFF7E7F7E7F7F7F7EFF7EFF7FFF7F7F7F7F7F7FFF7FFF7F7F7FF
        000000C6C6C684848400C6C6C6000000F7F7F7FFF7F7F7F7FFF7F7FFF7DED6EF
        CECEEFD6CEFFD6D6F7CED6EFBDC6F7CED6EFC6CEEFCED6F7C6CEF7D6D6F7BDCE
        F7CED6EFBDC6EFB5B5F7D6DEEFCECEF7CECEF7D6CEEFD6D6EFD6CEEFFFFFF7FF
        F7FFF7FFF7F7F7F7F7F7F7FFFFFFF7FFF7F7F7F7FFFFFFEFF7F7F7FFF7F7F7FF
        FFF7F7F7FFF7F7FFF7F7EFF7FFF7FFF7F7F7F7F7000000C6C6C684848400C6C6
        C6000000F7F7F7F7F7F7F7FFF7FFF7FFF7C6CEF7BDBDF7BDC6F7BDC6F7C6C6EF
        CECEF7CECEEFCECEEFD6CEEFCEC6EFBDC6FFBDBDF7C6C6F7BDC6F7C6CEEFBDC6
        FFC6C6F7BDC6F7BDC6F7C6C6F7BDC6FFC6BDF7C6CEF7BDBDEFB5BDF7C6C6F7D6
        D6EFC6C6EFC6BDF7CEC6EFC6C6F7D6D6EFC6C6E7BDC6E7CECEEFF7F7F7F7F7F7
        F7FFF7F7F7F7FFFF000000C6C6C684848400C6C6C6000000F7F7FFF7FFF7F7F7
        FFF7FFFFF7D6CEF7D6D6F7D6CEF7C6C6F7CEC6F7D6D6F7C6C6F7CEC6FFCED6F7
        CED6E7C6CEEFCEC6EFCECEEFC6CEF7D6CEE7CECEF7CEC6EFC6CEEFCECEF7CECE
        F7D6CEF7D6CEEFC6C6EFC6CEEFD6CEEFCECEF7CECEF7C6C6EFC6CEFFCECEEFCE
        CEF7C6C6F7D6D6F7F7F7F7FFFFFFFFF7F7F7FFFFF7F7F7F7F7FFF7F7000000C6
        C6C684848400C6C6C6000000F7F7F7FFF7F7F7F7F7F7FFF7EFE7E7F7D6D6EFCE
        CEF7C6CEEFD6D6EFD6D6F7C6CEF7D6D6F7CEC6F7DEDEF7D6D6F7CECEF7CECEEF
        CECEFFDED6F7D6DEF7D6CEF7D6CEEFDED6EFCECEEFDED6F7CED6F7CECEEFCED6
        F7CED6F7CED6EFCECEFFCECEEFD6CEF7CED6F7D6CEF7D6D6EFD6D6F7D6D6F7DE
        D6F7D6DEF7DEE7EFFFF7F7F7F7F7F7FF000000C6C6C684848400C6C6C6000000
        FFF7F7F7F7F7F7F7FFF7F7FFF7D6D6F7CEC6F7C6C6EFCEC6F7CEC6E7CEC6E7C6
        C6EFCECEEFC6C6EFCEC6EFC6C6EFCEC6E7BDC6EFC6C6F7D6D6EFBDC6E7BDBDF7
        C6C6F7CED6F7CECEEFCEC6EFC6CEF7BDC6EFBDC6EFBDC6F7C6C6F7C6C6F7C6CE
        F7BDC6FFC6C6F7BDCEF7C6C6FFBDC6F7CED6F7E7EFF7EFE7F7EFEFF7F7F7FFF7
        F7F7FFF7000000C6C6C684848400C6C6C6000000F7F7F7F7FFF7F7F7F7FFFFF7
        F7EFE7F7EFE7F7EFEFF7EFEFF7EFEFF7EFE7FFE7E7F7EFE7F7EFE7FFE7E7F7F7
        EFFFF7E7F7E7E7FFEFE7F7EFE7FFE7E7F7E7DEF7EFEFF7EFEFF7EFEFFFEFE7F7
        EFEFF7EFE7F7EFE7F7EFEFF7EFE7F7EFEFFFF7EFEFDEE7E7E7E7F7EFEFF7E7EF
        E7EFEFEFF7EFEFFFF7E7F7FFEFFFF7F7F7F7F7F7F7FFFFF7000000C6C6C68484
        8400C6C6C6000000F7F7F7FFF7FFF7F7F7F7FFFFF7CECEF7C6CEF7C6C6FFC6D6
        F7CECEE7C6CEEFCECEF7D6D6E7C6C6E7CECEEFCECEEFCECEF7CED6EFCECEEFC6
        CEEFCECEE7CED6EFCECEE7CED6E7CEC6E7D6D6EFC6CEF7C6C6EFC6CEF7CECEF7
        C6CEDEC6CEEFEFEFF7FFFFF7F7F7FFEFF7F7FFF7F7FFF7EFFFFFFFF7F7F7EFF7
        F7F7F7F7FFFFF7F7F7F7F7F7000000C6C6C684848400C6C6C6000000F7F7F7F7
        FFF7F7F7F7F7F7FFEFE7E7EFDEDEEFD6CEEFD6DEEFDEDEF7D6D6F7DEDEFFDEE7
        F7D6D6FFD6DEF7D6DEF7CED6FFD6CEF7CED6FFD6D6F7DEDEF7D6D6F7DED6F7D6
        D6F7D6D6F7D6DEF7DEDEEFCED6EFD6D6F7DEDEF7DED6F7D6DEFFD6D6F7CEDEF7
        D6DEEFD6DEF7D6D6FFCEDEF7C6D6EFCED6EFDEDEF7EFF7FFF7F7F7F7F7F7F7FF
        000000C6C6C684848400C6C6C6000000F7F7F7F7F7FFF7F7F7FFF7FFF7EFEFF7
        E7EFF7E7E7F7EFEFF7E7EFF7EFE7F7EFF7F7EFF7F7EFE7F7EFEFFFEFEFF7EFF7
        F7EFEFFFE7EFF7EFEFF7EFEFFFEFEFF7E7E7FFEFE7F7EFE7F7E7EFF7EFEFF7E7
        E7F7E7EFF7E7EFF7E7EFF7E7EFF7E7EFF7E7E7EFEFEFF7EFE7EFEFE7F7EFEFF7
        E7E7F7EFF7EFEFEFF7F7EFF7FFF7F7F7F7FFFFF7000000C6C6C684848400C6C6
        C6000000F7F7FFFFFFF7F7F7F7F7FFF7DEEFEFF7F7EFE7EFE7EFEFF7DEEFE7EF
        EFF7EFEFE7D6D6D6EFE7EFEFF7F7E7E7EFEFEFEFEFF7EFE7EFEFEFEFF7DEEFE7
        E7E7EFE7EFE7E7EFEFE7E7EFF7F7EFEFF7F7F7F7F7EFF7F7F7FFF7E7F7F7F7FF
        F7EFF7F7F7F7F7F7FFFFF7F7F7EFFFF7EFF7F7F7FFF7EFF7F7F7EFF7F7FFF7F7
        F7FFF7F7F7F7F7FF000000C6C6C684848400C6C6C6000000F7F7F7F7F7F7F7F7
        FFFFFFFF9C949CB5ADB5949494ADA5A5A5ADADA5A5A5A5A5A59C949CBDBDBDA5
        9C9CB5ADADA59CA5BDB5BDADB5ADB5B5B5B5B5B594948CA59CA59C9C9C9C949C
        D6D6D6FFF7FFF7FFFFF7EFF7F7F7FFFFFFFFF7F7F7FFFFF7FFF7FFF7F7EFFFFF
        FFF7EFEFF7F7F7FFF7FFF7FFF7F7FFFFF7F7F7F7FFF7FFF7F7F7FFF7000000C6
        C6C684848400C6C6C6000000F7F7F7F7F7F7FFF7F7F7FFFFEFE7E7DEDEDEDEDE
        E7D6D6CEE7D6DEF7F7F7DED6D6EFE7E7BDC6BDE7DEE7DEDEE7E7DEDEDEDEDEE7
        D6DEF7F7FFE7DEE7D6DED6EFE7EFF7EFF7E7DEDEDED6D6D6D6D6DEDEDEDEDEDE
        D6D6CEBDBDBDE7E7E7D6D6D6DEDEDEE7E7E7D6D6D6D6D6D6D6D6CEDEDEE7E7E7
        DED6CED6EFE7E7F7F7F7F7F7FFF7F7F7000000C6C6C684848400C6C6C6000000
        F7FFF7FFF7FFF7F7F7FFFFFF847B84847B7B94848C948C94847B7BADA5AD847B
        7BC6BDC6736B6B847B7B8C8484948C948C84848C8C8CBDB5B58C8C94847B7B9C
        9494B5B5AD949494737373C6B5BD949494A5A5A5847B848484848C848C84847B
        8C8C94A5A5A5847384848484736B739C94948C9494848484C6CECEF7F7F7FFF7
        F7F7FFF7000000C6C6C684848400C6C6C6000000F7F7F7F7F7F7F7FFF7FFFFFF
        D6CECEC6B5B5CECEC6CECECEC6C6BDBDBDC6C6B5BDCEC6CEBDB5B5ADA5A5B5AD
        B5C6BDBDD6CED6BDB5BDB5ADADB5ADB5A59C9CC6C6BDDECED6948C94CEC6C6B5
        B5B5C6BDB5D6C6CEC6BDBDBDB5B5A5A5ADD6D6D6BDB5BDBDB5B5C6BDBDCECECE
        BDBDB5EFF7EFF7EFF7FFFFF7FFFFF7F7F7F7F7F7F7F7F7FF000000C6C6C68484
        8400C6C6C6000000FFFFF7F7F7F7F7F7FFFFFFFF7B7373847B849C949CC6B5BD
        B5ADADADADADA59C94CEC6C6A59CA5A59C9CA5A5A59C9C94CEBDC6B5ADADA59C
        A5948C94B5B5ADBDBDBDD6D6D6B5A5A5ADADAD948C8C7B7B7BC6C6C69C949CC6
        BDBDA59CA5CECEC69C9C948C848CADA5ADBDC6C6ADA5ADF7F7F7F7F7EFF7F7FF
        F7F7F7F7FFFFFFF7F7F7F7F7000000C6C6C684848400C6C6C6000000F7F7F7F7
        F7F7FFFFF7F7FFF7F7F7F7EFEFF7EFF7EFF7FFFFFFFFFFF7FFFFFFFFFFF7FFF7
        F7F7FFFFFFFFF7FFFFEFFFF7FFF7FFEFFFFFF7FFF7FFFFFFFFFFFFF7EFF7FFFF
        F7FFFFFFFFFFFFFFFFFFF7FFF7FFFFFFF7FFFFFFF7FFFFFFFFF7FFFFFFFFFFFF
        FFFFF7FFF7FFFFFFFFFFFFFFFFFFF7F7FFFFFFF7EFF7F7F7F7F7F7F7F7F7FFFF
        000000C6C6C684848400C6C6C6000000FFF7F7F7F7FFF7F7F7F7F7F7F7FFFFF7
        FFF7FFF7FFF7F7F7F7F7F7F7F7F7EFF7F7F7F7F7F7F7F7F7F7F7EFF7F7F7FFF7
        FFF7F7EFF7F7F7F7FFF7F7F7F7F7F7FFF7F7F7FFFFF7EFF7F7EFEFF7F7FFFFF7
        F7F7F7F7F7F7F7F7F7FFCECECEFFF7FFD6D6D6CEC6C6DED6DEC6C6C6BDC6BDBD
        C6C6BDBDBDC6C6C6F7F7F7F7F7F7FFF7F7F7F7F7000000C6C6C684848400C6C6
        C6000000F7F7F7F7FFF7FFF7F7F7F7F7FFF7F7F7EFF7EFEFEFFFF7EFEFEFEFFF
        F7EFF7F7EFF7F7F7F7EFEFFFF7EFEFF7F7EFEFEFF7F7F7F7F7EFEFF7EFFFF7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7FFF7F7F7F7F7FFF7FFF7F7F7F7F7F7F7F7BDB5
        B5FFFFFFE7D6DEC6CEC6DEDEDEBDBDC6D6CED6D6CED6D6CEC6D6CED6F7F7F7F7
        FFF7F7F7FFF7F7F7000000C6C6C684848400C6C6C6000000FFF7F7F7FFF7F7F7
        F7F7FFFFF7BDC6F7B5BDEFADBDF7BDC6F7B5C6F7BDC6F7C6C6F7C6CEEFADB5F7
        B5BDFFCECEEFADB5EF9CA5F7BDC6F7BDC6EFADB5D6B5BDEFDEE7F7F7F7F7F7F7
        F7F7FFFFF7F7F7F7F7F7F7FFF7FFF7FFF7FFBDB5B5FFFFFF9C8C8C8C8484A59C
        A594848C9C9C9C848484949494ADA5A5CECED6FFF7FFF7F7F7FFF7F7000000C6
        C6C684848400C6C6C6000000F7F7F7F7F7FFFFF7F7F7FFF7EFE7E7F7EFE7F7E7
        DEF7E7E7F7E7E7EFDEDEF7E7EFF7EFE7F7E7DEEFE7E7F7F7EFEFEFEFF7EFEFF7
        F7F7EFEFEFF7EFEFF7EFEFF7F7F7F7F7F7EFF7F7F7FFF7FFF7FFF7F7F7FFF7F7
        F7F7F7F7FFFFB5B5B5F7EFF7A59C9CDED6CEADA5A5BDBDBDC6BDBDCEC6CECEBD
        C6D6CECEEFEFE7F7FFFFF7F7F7F7FFF7000000C6C6C684848400C6C6C6000000
        FFF7F7F7FFF7F7F7F7F7FFFFEFC6C6F7C6CEFFBDC6F7D6CEF7C6C6F7BDBDF7D6
        D6F7C6C6EF9CA5EFBDBDF7FFF7F7FFFFF7F7FFFFFFFFE7F7FFF7FFFFF7FFFFFF
        F7F7FFEFF7F7FFF7EFFFFFF7F7FFF7FFF7F7F7F7F7F7FFEFFFFFBDBDC6F7F7EF
        8C84849C8C94A58C8CADA5A5ADA5A59C8C8CB5A5A5AD949CD6CED6FFF7FFF7F7
        F7FFF7FF000000C6C6C684848400C6C6C6000000F7F7F7F7F7FFFFF7F7FFF7FF
        D6D6D6C6CEC6C6D6CEADC6CEDECECEBDD6CED6CED6D6C6CEBDC6CED6D6CED6CE
        D6C6C6C6C6D6CEC6C6C6C6D6D6D6C6C6C6CECEBDCECECECECECECECEDEC6C6D6
        C6CECEC6CECED6CED6C6CEE7DED6C6B5BDFFEFEF6B63638C7B84AD9C9C84847B
        9C8C8C84847BA59C9C948C8CD6D6D6F7FFFFF7F7F7F7FFF7000000C6C6C68484
        8400C6C6C6000000FFF7F7F7F7F7F7FFF7FFF7F7F7FFFFE7F7F7EFFFF7EFFFFF
        FFD6E7EFFFFFEFF7FFFFFFF7F7FFFFE7F7F7F7FFFFFFFFFFF7FFFFF7FFF7FFF7
        F7EFF7FFFFFFFFEFFFFFE7FFFFF7FFFFEFFFFFF7FFFFEFFFFFD6FFFFFFFFFFDE
        FFFFB5B5B5FFFFFFADADADD6C6CEEFEFEFE7DEE7D6C6CEBDB5C6D6D6D6DED6D6
        EFE7E7FFFFF7F7F7F7F7F7F7000000C6C6C684848400C6C6C6000000F7FFFFF7
        F7F7F7F7F7F7FFFFF7B5B5FFCECEF7B5B5FFADADDE6B7BE79C9CEFA5ADEFADAD
        EFBDBDDEB5B5F7E7E7EFADB5EFB5B5F7B5BDEFC6C6DEEFE7DE7B7BF7848CEFCE
        CEF76B7BEFC6BDF77B7BF78484F7BDBDF77384F7D6D6C6BDBDEFE7EF10000894
        84847B73739C8C94000008392931B5A594525221BDB59CFFFFFFF7F7F7FFFFF7
        000000C6C6C684848400C6C6C6000000F7F7F7FFFFF7F7F7FFF7FFFFF77B7BDE
        635AFF847BDE525AF78484E76B6BFF7B7BD6847BF78C94F77384F7E7E7EF848C
        E7948CE76363EFA5ADE7F7EFF7B5B5EF525AEF5A63FF737BE77373EF4A4AF731
        39E76363EF4252FFC6C6B5C6BDFFFFF7A59494C6BDC6210010A59CA59C949494
        8473A59C6B525200D6D6A5FFFFFFF7F7F7F7F7FF000000C6C6C684848400C6C6
        C6000000F7F7F7F7F7FFF7F7F7F7FFFFEF848CE76B7BEFBDBDEF9CA5EFB5B5E7
        BDB5F7B5B5EFB5B5E7B5ADFF5A6BEFF7EFF7F7FFF7EFEFF7F7F7F7E7EFFFF7FF
        EFFFFFE75263FFCECEE79CA5F7D6D6DE394AE7B5ADF7CED6E7A5A5E7EFEFC6B5
        B5FFF7FF100008635252BDA5A5AD94A52908104A4239BDB58CBDCE73D6D6B5FF
        F7FFF7FFF7FFF7F7000000C6C6C684848400C6C6C6000000F7FFF7FFF7F7F7F7
        F7FFFFF7F7E7EFE7E7DEF7FFF7EFFFFFF7F7FFE7EFF7F7FFFFE7F7F7EFFFFFF7
        EFF7DEFFF7EFFFF7F7F7F7FFFFF7EFF7FFE7FFF7E7FFF7F7DEE7E7F7FFF7FFFF
        DEF7FFF7EFE7EFFFF7F7FFF7EFF7FFEFFFFFCECEC6F7F7F7736B6B9C8C94C6BD
        BDC6BDBD73636B7B7373D6D6B5CED6ADE7E7CEFFF7F7F7F7F7F7F7FF000000C6
        C6C684848400C6C6C6000000F7F7F7F7F7FFF7F7F7F7F7FFF7FFF7F7EFF7F7EF
        F7EFF7F7EFEFF7FFF7F7EFF7F7F7F7F7FFF7F7E7EFF7FFF7F7F7F7FFF7F7F7F7
        FFF7F7F7FFF7F7F7F7EFF7F7F7F7F7F7F7EFF7F7F7F7F7EFF7EFF7F7FFF7EFEF
        E7F7EFFFEFF7EFF7FFFFF7F7F7FFFFFFFFFFFFF7FFF7FFFFFFFFFFFFFFFFF7F7
        F7FFF7F7F7FFFFF7FFF7F7F7F7F7FFF7000000C6C6C684848400C6C6C6000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000C6C6C684848400C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C68484
        8400}
    end
    object LReport: TLabel
      Left = 112
      Top = 8
      Width = 78
      Height = 13
      Caption = 'Report manager'
    end
    object LAuthor: TLabel
      Left = 112
      Top = 76
      Width = 33
      Height = 13
      Caption = 'Author'
    end
    object LName: TLabel
      Left = 192
      Top = 76
      Width = 51
      Height = 13
      Caption = 'Toni Martir'
    end
    object Label2: TLabel
      Left = 112
      Top = 96
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object LEmail: TLabel
      Left = 192
      Top = 96
      Width = 93
      Height = 13
      Caption = 'toni@reportman.es'
    end
    object Label3: TLabel
      Left = 112
      Top = 116
      Width = 87
      Height = 13
      Caption = 'Palafrugell, SPAIN'
    end
    object LVersion: TLabel
      Left = 112
      Top = 44
      Width = 27
      Height = 13
      Caption = 'VNum'
    end
    object LProject: TLabel
      Left = 8
      Top = 168
      Width = 65
      Height = 13
      Caption = 'Project page:'
    end
    object Label5: TLabel
      Left = 112
      Top = 168
      Width = 164
      Height = 13
      Cursor = crHandPoint
      Caption = 'http://reportman.sourceforge.net'
      OnMouseDown = Label5MouseDown
    end
    object LContributors: TLabel
      Left = 8
      Top = 188
      Width = 60
      Height = 13
      Caption = 'Contributors'
    end
  end
end
