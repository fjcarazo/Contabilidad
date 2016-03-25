object qrLabelsReport: TqrLabelsReport
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
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE'
    'QRLOOPBAND1'
    'QRHGAP')
  Functions.DATA = (
    '0'
    '0'
    #39#39
    '0'
    #39#39)
  OnNeedData = QuickRepNeedData
  Options = []
  Page.Columns = 3
  Page.Orientation = poPortrait
  Page.PaperSize = A4
  Page.Values = (
    100.000000000000000000
    2970.000000000000000000
    50.000000000000000000
    2100.000000000000000000
    0.000000000000000000
    0.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.OutputBin = Auto
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
  object LabelBand: TQRBand
    Left = 0
    Top = 19
    Width = 264
    Height = 115
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Frame.Style = psDashDotDot
    AlignToBottom = False
    BeforePrint = LabelBandBeforePrint
    Color = clWhite
    TransparentBand = False
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      304.270833333333400000
      698.500000000000000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    BandType = rbDetail
    object qrTLabel: TQRMemo
      Left = 3
      Top = 1
      Width = 256
      Height = 111
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        293.687500000000000000
        7.937500000000000000
        2.645833333333330000
        677.333333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Color = clNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        'dasfkjh'
        'dsaf'
        'dsf'
        'dsf'
        'ds'
        '')
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 9
    end
    object qrStkCode: TQRLabel
      Left = 16
      Top = 4
      Width = 62
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        42.333333333333340000
        10.583333333333330000
        164.041666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrStkCode'
      Color = clWhite
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object qrDescription: TQRLabel
      Left = 19
      Top = 92
      Width = 77
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        50.270833333333330000
        243.416666666666700000
        203.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrDescription'
      Color = clWhite
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object qrPrice: TQRLabel
      Left = 216
      Top = 2
      Width = 42
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        571.500000000000000000
        5.291666666666667000
        111.125000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'qrPrice'
      Color = clWhite
      Transparent = True
      WordWrap = False
      FontSize = 10
    end
    object QRBarcode: TQRImage
      Left = 16
      Top = 24
      Width = 1
      Height = 1
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        2.645833333333330000
        42.333333333333300000
        63.500000000000000000
        2.645833333333330000)
      AutoSize = True
      Picture.Data = {
        07544269746D61703A000000424D3A0000000000000036000000280000000100
        000001000000010018000000000004000000130B0000130B0000000000000000
        0000FFFFFF02}
      Stretch = True
    end
  end
  object qrHGap: TQRStringsBand
    Left = 0
    Top = 134
    Width = 264
    Height = 20
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
    LinkBand = LabelBand
    Size.Values = (
      52.916666666666660000
      698.500000000000000000)
    PreCaluculateBandHeight = False
    KeepOnOnePage = False
    Master = Owner
    PrintBefore = False
  end
end
