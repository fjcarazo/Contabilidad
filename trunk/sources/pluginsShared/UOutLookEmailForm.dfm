object fmOutlookEmail: TfmOutlookEmail
  Left = 335
  Top = 261
  Caption = 'Outllook Sync'
  ClientHeight = 524
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 53
    Width = 1009
    Height = 471
    ActivePage = tsEmail
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1017
    ExplicitHeight = 473
    object tsEmail: TTabSheet
      Caption = 'Email'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1001
        Height = 443
        Align = alClient
        DataSource = DSEmail
        PopupMenu = PopupMenu1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'DDATE'
            Title.Caption = 'Date'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SFROM'
            Title.Caption = 'email link'
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION'
            Title.Caption = 'Description'
            Width = 247
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WACCOUNTID'
            Title.Caption = 'Account'
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WSTATUS'
            Title.Caption = 'Status'
            Width = 195
            Visible = True
          end>
      end
    end
    object tsAgenda: TTabSheet
      Caption = 'Agenda'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 1009
        Height = 445
        Align = alClient
        DataSource = dsAgenda
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DDATE'
            Title.Caption = 'Date'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SAPPOINTMENT'
            Title.Caption = 'Description'
            Width = 461
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WSTATUS'
            Title.Caption = 'Status'
            Width = 228
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1009
    Height = 53
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1017
    object Lfromdate: TLabel
      Left = 194
      Top = 8
      Width = 49
      Height = 13
      Caption = 'From Date'
    end
    object LTodate: TLabel
      Left = 298
      Top = 8
      Width = 39
      Height = 13
      Caption = 'To Date'
    end
    object BSyncToosF: TButton
      Left = 16
      Top = 20
      Width = 155
      Height = 25
      Caption = 'Sync to osF'
      TabOrder = 0
      OnClick = BSyncToosFClick
    end
    object dFromdate: TDateTimePicker
      Left = 192
      Top = 24
      Width = 93
      Height = 21
      Date = 41107.621835937500000000
      Time = 41107.621835937500000000
      TabOrder = 1
    end
    object dToDate: TDateTimePicker
      Left = 296
      Top = 24
      Width = 93
      Height = 21
      Date = 41107.621835937500000000
      Time = 41107.621835937500000000
      TabOrder = 2
    end
    object BOsFTOOutlook: TButton
      Left = 396
      Top = 20
      Width = 185
      Height = 25
      Caption = 'From osf To outlook'
      TabOrder = 3
      OnClick = BOsFTOOutlookClick
    end
    object bMail: TButton
      Left = 604
      Top = 20
      Width = 177
      Height = 25
      Caption = 'Sync Email'
      TabOrder = 4
      OnClick = bMailClick
    end
  end
  object dsAgenda: TDataSource
    Left = 204
    Top = 136
  end
  object DSEmail: TDataSource
    Left = 288
    Top = 160
  end
  object QGen: TUniQuery
    DataTypeMap = <>
    Connection = dmDatabase.ZMainconnection
    Left = 680
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    Left = 480
    Top = 209
    object Selectaccount1: TMenuItem
      Caption = 'Link reference to account'
      OnClick = Selectaccount1Click
    end
    object Copytoaccount1: TMenuItem
      Caption = 'Copy this email to account'
      OnClick = Copytoaccount1Click
    end
  end
end
