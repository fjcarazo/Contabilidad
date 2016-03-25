object frmReportSetup: TfrmReportSetup
  Left = 381
  Top = 139
  BorderStyle = bsDialog
  Caption = 'Report Setup'
  ClientHeight = 131
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 51
    Height = 13
    Caption = 'Start Date:'
  end
  object Label2: TLabel
    Left = 20
    Top = 40
    Width = 48
    Height = 13
    Caption = 'End Date:'
  end
  object Label3: TLabel
    Left = 32
    Top = 76
    Width = 35
    Height = 13
    Caption = 'Format:'
  end
  object Button1: TButton
    Left = 84
    Top = 100
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 100
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = Button2Click
  end
  object VpPrintFormatComboBox1: TVpPrintFormatComboBox
    Left = 76
    Top = 72
    Width = 169
    Height = 21
    ItemHeight = 13
    Sorted = True
    TabOrder = 2
  end
  object VpDateEdit1: TVpDateEdit
    Left = 76
    Top = 12
    Width = 171
    Height = 21
    Epoch = 2000
    PopupCalColors.ActiveDay = clRed
    PopupCalColors.ColorScheme = cscalWindows
    PopupCalColors.DayNames = clMaroon
    PopupCalColors.Days = clBlack
    PopupCalColors.InactiveDays = clGray
    PopupCalColors.MonthAndYear = clBlue
    PopupCalColors.Weekend = clRed
    PopupCalColors.EventDays = clBlack
    PopupCalFont.Charset = DEFAULT_CHARSET
    PopupCalFont.Color = clWindowText
    PopupCalFont.Height = -11
    PopupCalFont.Name = 'MS Sans Serif'
    PopupCalFont.Style = []
    ReadOnly = False
    RequiredFields = [rfMonth, rfDay]
    TabOrder = 0
    TodayString = '/'
  end
  object VpDateEdit2: TVpDateEdit
    Left = 76
    Top = 36
    Width = 171
    Height = 21
    Epoch = 2000
    PopupCalColors.ActiveDay = clRed
    PopupCalColors.ColorScheme = cscalWindows
    PopupCalColors.DayNames = clMaroon
    PopupCalColors.Days = clBlack
    PopupCalColors.InactiveDays = clGray
    PopupCalColors.MonthAndYear = clBlue
    PopupCalColors.Weekend = clRed
    PopupCalColors.EventDays = clBlack
    PopupCalFont.Charset = DEFAULT_CHARSET
    PopupCalFont.Color = clWindowText
    PopupCalFont.Height = -11
    PopupCalFont.Name = 'MS Sans Serif'
    PopupCalFont.Style = []
    ReadOnly = False
    RequiredFields = [rfMonth, rfDay]
    TabOrder = 1
    TodayString = '/'
  end
end
