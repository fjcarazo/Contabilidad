object qrAccountsMovements: TqrAccountsMovements
  Left = 0
  Top = 0
  Width = 794
  Height = 1123
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = QuickRepBeforePrint
  DataSet = dmDatabase.tblAccount
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE')
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = A4
  Page.Values = (
    100.000000000000000000
    2970.000000000000000000
    100.000000000000000000
    2100.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.OutputBin = First
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.UseStandardprinter = False
  PrinterSettings.UseCustomBinCode = False
  PrinterSettings.CustomBinCode = 0
  PrinterSettings.ExtendedDuplex = 0
  PrinterSettings.UseCustomPaperCode = False
  PrinterSettings.CustomPaperCode = 0
  PrinterSettings.PrintMetaFile = False
  PrinterSettings.PrintQuality = 0
  PrinterSettings.Collate = 0
  PrinterSettings.ColorOption = 0
  PrintIfEmpty = False
  SnapToGrid = True
  Units = MM
  Zoom = 100
  PrevFormStyle = fsNormal
  PreviewInitialState = wsNormal
  PrevInitialZoom = qrZoomToFit
  object QRBand1: TQRBand
    Left = 38
    Top = 38
    Width = 718
    Height = 75
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Frame.Width = 2
    AlignToBottom = False
    BeforePrint = QRBand1BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      198.437500000000000000
      1899.708333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbPageHeader
    object QRLabel1: TQRLabel
      Left = 8
      Top = 32
      Width = 122
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        84.666666666666680000
        322.791666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Creditor Movement'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      OnPrint = QRLabel1Print
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 8
      Top = 0
      Width = 99
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        0.000000000000000000
        261.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = dmDatabase.tblSysVars
      DataField = 'SCompanyName'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRSysData1: TQRSysData
      Left = 464
      Top = 0
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1227.666666666670000000
        0.000000000000000000
        179.916666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDateTime
      OnPrint = QRSysData1Print
      Transparent = False
      FontSize = 10
    end
    object QRSysData2: TQRSysData
      Left = 672
      Top = 0
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1778.000000000000000000
        0.000000000000000000
        121.708333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsPageNumber
      Transparent = False
      FontSize = 10
    end
    object QRLabel2: TQRLabel
      Left = 264
      Top = 48
      Width = 56
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        698.500000000000000000
        127.000000000000000000
        148.166666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'This Year'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel3: TQRLabel
      Left = 392
      Top = 48
      Width = 57
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1037.166666666670000000
        127.000000000000000000
        150.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Last Year'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 464
      Top = 48
      Width = 101
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1227.666666666670000000
        127.000000000000000000
        267.229166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Variance Amount'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel5: TQRLabel
      Left = 600
      Top = 48
      Width = 122
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1587.500000000000000000
        127.000000000000000000
        322.791666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Variance Percentage'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRGroup1: TQRGroup
    Left = 38
    Top = 113
    Width = 718
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      31.750000000000000000
      1899.708333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Expression = 'tblAccount.SMAINACCOUNTCODE+tblAccount.SSUBACCOUNTCODE'
    FooterBand = QRFoot1
    Master = Owner
    ReprintOnNewPage = False
  end
  object Detail1: TQRBand
    Left = 38
    Top = 125
    Width = 718
    Height = 266
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = Detail1BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      703.791666666666800000
      1899.708333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object QRDBText1: TQRDBText
      Left = 8
      Top = 8
      Width = 33
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        21.166666666666700000
        87.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmDatabase.tblAccount
      DataField = 'SMAINACCOUNTCODE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 40
      Top = 8
      Width = 33
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        105.833333333333000000
        21.166666666666700000
        87.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmDatabase.tblAccount
      DataField = 'SSUBACCOUNTCODE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 80
      Top = 8
      Width = 289
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        211.666666666667000000
        21.166666666666700000
        764.645833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = dmDatabase.tblAccount
      DataField = 'SDescription'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period1: TQRLabel
      Left = 8
      Top = 48
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        127.000000000000000000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period1'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period2: TQRLabel
      Left = 8
      Top = 64
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        169.333333333333300000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period2'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period3: TQRLabel
      Left = 8
      Top = 80
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        211.666666666666700000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period3'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period4: TQRLabel
      Left = 8
      Top = 96
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        254.000000000000000000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period4'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period5: TQRLabel
      Left = 8
      Top = 112
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        296.333333333333400000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period5'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period6: TQRLabel
      Left = 8
      Top = 128
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        338.666666666666700000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period6'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period7: TQRLabel
      Left = 8
      Top = 144
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        381.000000000000000000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period7'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period8: TQRLabel
      Left = 8
      Top = 160
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        423.333333333333000000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period8'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period9: TQRLabel
      Left = 8
      Top = 176
      Width = 45
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        465.666666666667000000
        119.062500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period9'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period10: TQRLabel
      Left = 8
      Top = 192
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        508.000000000000000000
        137.583333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period10'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period11: TQRLabel
      Left = 8
      Top = 208
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        550.333333333333000000
        137.583333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period11'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period12: TQRLabel
      Left = 8
      Top = 224
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        592.666666666667000000
        137.583333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period12'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Period13: TQRLabel
      Left = 8
      Top = 240
      Width = 52
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        21.166666666666700000
        635.000000000000000000
        137.583333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Period13'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total1: TQRLabel
      Left = 264
      Top = 48
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        127.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total1'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total2: TQRLabel
      Left = 264
      Top = 64
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        169.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total2'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total13: TQRLabel
      Left = 264
      Top = 240
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        635.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total13'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total12: TQRLabel
      Left = 264
      Top = 224
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        592.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total12'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total11: TQRLabel
      Left = 264
      Top = 208
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        550.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total11'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total10: TQRLabel
      Left = 264
      Top = 192
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        508.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total10'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total9: TQRLabel
      Left = 264
      Top = 176
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        465.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total9'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total8: TQRLabel
      Left = 264
      Top = 160
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        423.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total8'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total7: TQRLabel
      Left = 264
      Top = 144
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        381.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total7'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total6: TQRLabel
      Left = 264
      Top = 128
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        338.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total6'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total5: TQRLabel
      Left = 264
      Top = 112
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        296.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total5'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total4: TQRLabel
      Left = 264
      Top = 96
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        254.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total4'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Total3: TQRLabel
      Left = 264
      Top = 80
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        211.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Total3'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget1: TQRLabel
      Left = 376
      Top = 48
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        127.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget1'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget2: TQRLabel
      Left = 376
      Top = 64
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        169.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget2'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget3: TQRLabel
      Left = 376
      Top = 80
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        211.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget3'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget4: TQRLabel
      Left = 376
      Top = 96
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        254.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget4'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget5: TQRLabel
      Left = 376
      Top = 112
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        296.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget5'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget6: TQRLabel
      Left = 376
      Top = 128
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        338.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget6'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget7: TQRLabel
      Left = 376
      Top = 144
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        381.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget7'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget8: TQRLabel
      Left = 376
      Top = 160
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        423.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget8'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget9: TQRLabel
      Left = 376
      Top = 176
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        465.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget9'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget10: TQRLabel
      Left = 376
      Top = 192
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        508.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget10'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget11: TQRLabel
      Left = 376
      Top = 208
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        550.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget11'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget12: TQRLabel
      Left = 376
      Top = 224
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        592.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget12'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object Budget13: TQRLabel
      Left = 376
      Top = 240
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        635.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'Budget13'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt1: TQRLabel
      Left = 496
      Top = 48
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        127.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt1'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt2: TQRLabel
      Left = 496
      Top = 64
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        169.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt2'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt3: TQRLabel
      Left = 496
      Top = 80
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        211.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt3'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt4: TQRLabel
      Left = 496
      Top = 96
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        254.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt4'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt5: TQRLabel
      Left = 496
      Top = 112
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        296.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt5'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt6: TQRLabel
      Left = 496
      Top = 128
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        338.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt6'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt7: TQRLabel
      Left = 496
      Top = 144
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        381.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt7'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt8: TQRLabel
      Left = 496
      Top = 160
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        423.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt8'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt9: TQRLabel
      Left = 496
      Top = 176
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        465.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt9'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt10: TQRLabel
      Left = 496
      Top = 192
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        508.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt10'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt11: TQRLabel
      Left = 496
      Top = 208
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        550.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt11'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt12: TQRLabel
      Left = 496
      Top = 224
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        592.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt12'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarAmnt13: TQRLabel
      Left = 496
      Top = 240
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        635.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarAmnt13'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer1: TQRLabel
      Left = 640
      Top = 48
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        127.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer1'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer2: TQRLabel
      Left = 640
      Top = 64
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        169.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer2'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer3: TQRLabel
      Left = 640
      Top = 80
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        211.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer3'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer4: TQRLabel
      Left = 640
      Top = 96
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        254.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer4'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer5: TQRLabel
      Left = 640
      Top = 112
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        296.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer5'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer6: TQRLabel
      Left = 640
      Top = 128
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        338.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer6'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer7: TQRLabel
      Left = 640
      Top = 144
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        381.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer7'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer8: TQRLabel
      Left = 640
      Top = 160
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        423.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer8'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer9: TQRLabel
      Left = 640
      Top = 176
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        465.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer9'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer10: TQRLabel
      Left = 640
      Top = 192
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        508.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer10'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer11: TQRLabel
      Left = 640
      Top = 208
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        550.333333333333000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer11'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer12: TQRLabel
      Left = 640
      Top = 224
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        592.666666666667000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer12'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object VarPer13: TQRLabel
      Left = 640
      Top = 240
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        635.000000000000000000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer13'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel6: TQRLabel
      Left = 8
      Top = 28
      Width = 100
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        21.166666666666670000
        74.083333333333340000
        264.583333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Opening Balance'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrTotalOp: TQRLabel
      Left = 264
      Top = 28
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        74.083333333333300000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrTotalOp'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrTotalLastOp: TQRLabel
      Left = 376
      Top = 28
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        74.083333333333300000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrTotalLastOp'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrTotalVarOp: TQRLabel
      Left = 496
      Top = 28
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        74.083333333333300000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'qrTotalVarOp'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object qrTotalPerOp: TQRLabel
      Left = 640
      Top = 28
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        74.083333333333300000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'VarPer1'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object QRFoot1: TQRBand
    Left = 38
    Top = 391
    Width = 718
    Height = 32
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    BeforePrint = QRFoot1BeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      84.666666666666680000
      1899.708333333333000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbGroupFooter
    object AThisYear: TQRLabel
      Left = 264
      Top = 8
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        698.500000000000000000
        21.166666666666700000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'AThisYear'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object ALastYear: TQRLabel
      Left = 376
      Top = 8
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        994.833333333333000000
        21.166666666666700000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ALastYear'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object AVarAmnt: TQRLabel
      Left = 496
      Top = 8
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1312.333333333330000000
        21.166666666666700000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'AVarAmnt'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object AVarPer: TQRLabel
      Left = 640
      Top = 8
      Width = 70
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1693.333333333330000000
        21.166666666666700000
        185.208333333333000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'AVarPer'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
end
