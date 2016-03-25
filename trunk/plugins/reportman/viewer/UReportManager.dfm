object ReportManager: TReportManager
  Left = 332
  Top = 256
  Caption = 'Reportmanager'
  ClientHeight = 396
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 73
    Align = alTop
    TabOrder = 0
    object Image1: TImage
      Left = 546
      Top = 1
      Width = 105
      Height = 71
      Align = alRight
      Center = True
      ExplicitLeft = 635
    end
    object CBReport: TComboBox
      Left = 16
      Top = 32
      Width = 353
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = CBReportChange
    end
    object cbOpenInPdf: TCheckBox
      Left = 396
      Top = 33
      Width = 97
      Height = 17
      Caption = 'Open in PDF'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 652
    Height = 282
    Align = alClient
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 355
    Width = 652
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Panel4: TPanel
      Left = 399
      Top = 1
      Width = 252
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BtnCancel: TBitBtn
        Left = 136
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Cancel'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = BtnCancelClick
      end
      object BtnOk: TBitBtn
        Left = 10
        Top = 8
        Width = 103
        Height = 25
        Caption = 'OK'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = BtnOkClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    FileName = 'G:\OS\tcashsource\PluginsNL\GenSqlFromPardox\dddd'
    Filter = 
      'PDF|*.pdf|Excel|*.xls|Metafile|*.emf|Text|*.txt|Html|*.htm;*.htm' +
      'l|SVG|*.svg|CSV|*.csv'
    Left = 208
    Top = 32
  end
  object QExecSQL: TUniQuery
    DataTypeMap = <>
    Left = 264
    Top = 80
  end
  object tblOpReport: TUniTable
    TableName = 'OpReport'
    DataTypeMap = <>
    Left = 252
    Top = 142
    object tblOpReportWOptionID: TAutoIncField
      FieldName = 'WOptionID'
      ReadOnly = True
    end
    object tblOpReportStrOption: TStringField
      FieldName = 'StrOption'
      Size = 25
    end
    object tblOpReportSOptionValue: TStringField
      FieldName = 'SOptionValue'
      Size = 35
    end
    object tblOpReportWOptionTypeID: TIntegerField
      FieldName = 'WOptionTypeID'
    end
  end
  object TCLose: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TCLoseTimer
    Left = 196
    Top = 185
  end
end
