object fmWorkFlowHistory: TfmWorkFlowHistory
  Left = 184
  Top = 303
  Width = 955
  Height = 495
  Caption = 'Workflow History'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 53
    Width = 947
    Height = 408
    Align = alClient
    DataSource = dsHist
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USER'
        Title.Caption = 'User'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WSTATUS'
        Title.Caption = 'Status'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WLINKID'
        Title.Caption = 'Link'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDATEACTION'
        Title.Caption = 'Date action'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SSTEPNAME'
        Title.Caption = 'Stepname'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DISPLAYTEXT'
        Title.Caption = 'Description'
        Width = 200
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 947
    Height = 53
    Align = alTop
    TabOrder = 1
    object DBText1: TDBText
      Left = 20
      Top = 4
      Width = 93
      Height = 21
      DataField = 'WGROUPID'
      DataSource = dsHist
    end
    object DBText2: TDBText
      Left = 20
      Top = 28
      Width = 65
      Height = 17
      DataField = 'SWORFLOWNAME'
      DataSource = dsHist
    end
  end
  object dsHist: TDataSource
    DataSet = dmWorkflowData.ZQTaskHist
    Left = 208
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 192
    object Whereami1: TMenuItem
      Caption = 'Where am i'
      OnClick = Whereami1Click
    end
  end
end
