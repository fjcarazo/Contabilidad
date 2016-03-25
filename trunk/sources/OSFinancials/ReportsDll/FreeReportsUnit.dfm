object frmFreeReports: TfrmFreeReports
  Left = 323
  Top = 317
  Width = 407
  Height = 250
  Caption = 'frmFreeReports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    PageSettings.Width = 2100
    PageSettings.Height = 2969
    PageSettings.Apply = False
    PageSettings.Orientation = frPortrait
    OnBeginDoc = frReport1BeginDoc
    OnUserFunction = frReport1UserFunction
    Left = 16
    Top = 80
    ReportForm = {17000000}
  end
  object DocHeaderDb: TfrDBDataSet
    DataSet = dmDatabase.tblSysVars
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    Left = 40
    Top = 8
  end
  object DocLinesDB: TfrDBDataSet
    DataSet = dmDatabase.qrPrnDocLines
    OpenDataSource = False
    Left = 136
    Top = 80
  end
  object frShapeObject1: TfrShapeObject
    Left = 320
    Top = 8
  end
  object frRTFExport1: TfrRTFExport
    Left = 320
    Top = 40
  end
  object frCSVExport1: TfrCSVExport
    Left = 320
    Top = 72
  end
  object frHTMExport1: TfrHTMExport
    Left = 320
    Top = 104
  end
  object frTextExport1: TfrTextExport
    Left = 320
    Top = 136
  end
  object frDesigner1: TfrDesigner
    Left = 288
    Top = 8
  end
  object DataSource1: TDataSource
    Left = 72
    Top = 8
  end
  object DataSource2: TDataSource
    Left = 144
    Top = 8
  end
  object frChartObject1: TfrChartObject
    Left = 288
    Top = 104
  end
  object frdbChart: TfrDBDataSet
    CloseDataSource = True
    Left = 72
    Top = 80
  end
  object frRichObject1: TfrRichObject
    Left = 280
    Top = 144
  end
  object frTNPDFExport1: TfrTNPDFExport
    Left = 288
    Top = 56
  end
  object frDBDSDebits: TfrDBDataSet
    DataSet = dmDatabase.wwqryOpenDebits
    OpenDataSource = False
    Left = 64
    Top = 152
  end
  object frDBDSCredits: TfrDBDataSet
    DataSet = dmDatabase.wwqryOpenCredits
    OpenDataSource = False
    Left = 144
    Top = 152
  end
end
