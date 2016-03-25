object FrmBatchPeriodTotals: TFrmBatchPeriodTotals
  Left = 386
  Top = 251
  BorderStyle = bsDialog
  Caption = 'Totals for each Period'
  ClientHeight = 269
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormShow
  OnDeactivate = FormDeactivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 269
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object GridTotalsBat: TStringGrid
      Left = 1
      Top = 1
      Width = 392
      Height = 267
      Align = alClient
      ColCount = 4
      DefaultColWidth = 80
      FixedCols = 0
      RowCount = 35
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = FormKeyPress
    end
  end
  object qBatPeriodTotals: TUniQuery
    DataTypeMap = <>
    SQL.Strings = (
      'SELECT FDEBIT,FCREDIT, DAllocatedDate'
      'FROM Batch;'
      ' '
      '')
    Left = 193
    Top = 106
  end
end
