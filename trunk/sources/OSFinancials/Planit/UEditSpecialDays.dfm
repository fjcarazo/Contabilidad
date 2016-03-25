object fmEditSpecialDays: TfmEditSpecialDays
  Left = 45
  Top = 242
  Width = 763
  Height = 567
  Caption = 'Special days'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    755
    533)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 28
    Width = 38
    Height = 13
    Caption = 'Monday'
  end
  object Label2: TLabel
    Left = 32
    Top = 54
    Width = 41
    Height = 13
    Caption = 'Tuesday'
  end
  object Label3: TLabel
    Left = 32
    Top = 80
    Width = 57
    Height = 13
    Caption = 'Wednesday'
  end
  object Label4: TLabel
    Left = 32
    Top = 106
    Width = 44
    Height = 13
    Caption = 'Thursday'
  end
  object Label5: TLabel
    Left = 32
    Top = 134
    Width = 28
    Height = 13
    Caption = 'Friday'
  end
  object Label6: TLabel
    Left = 32
    Top = 160
    Width = 42
    Height = 13
    Caption = 'Saturday'
  end
  object Label7: TLabel
    Left = 32
    Top = 186
    Width = 36
    Height = 13
    Caption = 'Sunday'
  end
  object Label8: TLabel
    Left = 32
    Top = 4
    Width = 86
    Height = 13
    Caption = 'Standard workday'
  end
  object Monfrom: TDateTimePicker
    Left = 96
    Top = 24
    Width = 101
    Height = 21
    Date = 365245.291666666600000000
    Time = 365245.291666666600000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 0
  end
  object monto: TDateTimePicker
    Left = 208
    Top = 24
    Width = 100
    Height = 21
    Date = 365245.708333333400000000
    Time = 365245.708333333400000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 1
  end
  object TueFrom: TDateTimePicker
    Left = 96
    Top = 50
    Width = 101
    Height = 21
    Date = 365245.291666666600000000
    Time = 365245.291666666600000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 2
  end
  object TueTo: TDateTimePicker
    Left = 208
    Top = 50
    Width = 100
    Height = 21
    Date = 365245.708333333400000000
    Time = 365245.708333333400000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 3
  end
  object WenFrom: TDateTimePicker
    Left = 96
    Top = 76
    Width = 101
    Height = 21
    Date = 365245.291666666600000000
    Time = 365245.291666666600000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 4
  end
  object WenTo: TDateTimePicker
    Left = 208
    Top = 76
    Width = 100
    Height = 21
    Date = 365245.708333333400000000
    Time = 365245.708333333400000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 5
  end
  object ThuFrom: TDateTimePicker
    Left = 96
    Top = 102
    Width = 101
    Height = 21
    Date = 365245.291666666600000000
    Time = 365245.291666666600000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 6
  end
  object ThuTo: TDateTimePicker
    Left = 208
    Top = 102
    Width = 100
    Height = 21
    Date = 365245.708333333400000000
    Time = 365245.708333333400000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 7
  end
  object FriFrom: TDateTimePicker
    Left = 96
    Top = 128
    Width = 101
    Height = 21
    Date = 365245.291666666600000000
    Time = 365245.291666666600000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 8
  end
  object FriTo: TDateTimePicker
    Left = 208
    Top = 128
    Width = 100
    Height = 21
    Date = 365245.708333333400000000
    Time = 365245.708333333400000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 9
  end
  object SatFrom: TDateTimePicker
    Left = 96
    Top = 156
    Width = 101
    Height = 21
    Date = 365245.291666666600000000
    Time = 365245.291666666600000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 10
  end
  object SatTo: TDateTimePicker
    Left = 208
    Top = 156
    Width = 100
    Height = 21
    Date = 365245.708333333400000000
    Time = 365245.708333333400000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 11
  end
  object SunFrom: TDateTimePicker
    Left = 96
    Top = 182
    Width = 101
    Height = 21
    Date = 365245.291666666600000000
    Time = 365245.291666666600000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 12
  end
  object Sunto: TDateTimePicker
    Left = 208
    Top = 182
    Width = 100
    Height = 21
    Date = 365245.708333333400000000
    Time = 365245.708333333400000000
    Kind = dtkTime
    MaxDate = 365245.000000000000000000
    MinDate = 2.000000000000000000
    TabOrder = 13
  end
  object Bsave: TButton
    Left = 670
    Top = 504
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Save'
    TabOrder = 14
    OnClick = BsaveClick
  end
  object ETextMon: TEdit
    Left = 316
    Top = 24
    Width = 170
    Height = 21
    TabOrder = 15
  end
  object Button3: TButton
    Left = 616
    Top = 23
    Width = 93
    Height = 22
    Caption = 'Select color'
    TabOrder = 16
    OnClick = Button3Click
  end
  object PageControl1: TPageControl
    Left = 28
    Top = 216
    Width = 717
    Height = 275
    ActivePage = tsUserDates
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 17
    object tsUserDates: TTabSheet
      Caption = 'User dates'
      DesignSize = (
        709
        247)
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 0
        Width = 460
        Height = 33
        DataSource = dsUserDate
        TabOrder = 0
      end
      object Button1: TButton
        Left = 472
        Top = 4
        Width = 93
        Height = 25
        Caption = 'Select color'
        TabOrder = 1
        OnClick = Button1Click
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 36
        Width = 705
        Height = 207
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsUserDate
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'WCOLOR'
            Title.Caption = 'Color'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WPRIORITY'
            Title.Caption = 'Priority'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DSTARTDATETIME'
            Title.Caption = 'Startdatetime'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DENDDATETIME'
            Title.Caption = 'Enddatetime'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION'
            Title.Caption = 'Description'
            Visible = True
          end>
      end
    end
    object tsGeneralDates: TTabSheet
      Caption = 'General dates'
      ImageIndex = 1
      DesignSize = (
        709
        247)
      object DBNavigator2: TDBNavigator
        Left = 0
        Top = 0
        Width = 460
        Height = 33
        DataSource = DSGenDate
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 36
        Width = 705
        Height = 207
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DSGenDate
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'WCOLOR'
            Title.Caption = 'Color'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WPRIORITY'
            Title.Caption = 'Priority'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DSTARTDATETIME'
            Title.Caption = 'Startdatetime'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DENDDATETIME'
            Title.Caption = 'Enddatetime'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SDESCRIPTION'
            Title.Caption = 'Description'
            Visible = True
          end>
      end
      object Button2: TButton
        Left = 472
        Top = 4
        Width = 93
        Height = 25
        Caption = 'Select color'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  object ETextTue: TEdit
    Left = 316
    Top = 50
    Width = 170
    Height = 21
    TabOrder = 18
  end
  object Button4: TButton
    Left = 616
    Top = 49
    Width = 93
    Height = 22
    Caption = 'Select color'
    TabOrder = 19
    OnClick = Button4Click
  end
  object ETextWed: TEdit
    Left = 316
    Top = 76
    Width = 170
    Height = 21
    TabOrder = 20
  end
  object Button5: TButton
    Left = 616
    Top = 75
    Width = 93
    Height = 22
    Caption = 'Select color'
    TabOrder = 21
    OnClick = Button5Click
  end
  object ETextThu: TEdit
    Left = 316
    Top = 102
    Width = 170
    Height = 21
    TabOrder = 22
  end
  object Button6: TButton
    Left = 616
    Top = 101
    Width = 93
    Height = 22
    Caption = 'Select color'
    TabOrder = 23
    OnClick = Button6Click
  end
  object ETextFri: TEdit
    Left = 316
    Top = 128
    Width = 170
    Height = 21
    TabOrder = 24
  end
  object Button7: TButton
    Left = 616
    Top = 127
    Width = 93
    Height = 22
    Caption = 'Select color'
    TabOrder = 25
    OnClick = Button7Click
  end
  object ETextSat: TEdit
    Left = 316
    Top = 156
    Width = 170
    Height = 21
    TabOrder = 26
  end
  object Button8: TButton
    Left = 616
    Top = 155
    Width = 93
    Height = 22
    Caption = 'Select color'
    TabOrder = 27
    OnClick = Button8Click
  end
  object ETextSun: TEdit
    Left = 316
    Top = 182
    Width = 170
    Height = 21
    TabOrder = 28
  end
  object Button9: TButton
    Left = 616
    Top = 181
    Width = 93
    Height = 22
    Caption = 'Select color'
    TabOrder = 29
    OnClick = Button9Click
  end
  object EColorMon: TEdit
    Left = 488
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 30
    Text = '0'
  end
  object EColorTue: TEdit
    Left = 488
    Top = 50
    Width = 121
    Height = 21
    TabOrder = 31
    Text = '0'
  end
  object EColorWed: TEdit
    Left = 488
    Top = 76
    Width = 121
    Height = 21
    TabOrder = 32
    Text = '0'
  end
  object EColorThu: TEdit
    Left = 488
    Top = 102
    Width = 121
    Height = 21
    TabOrder = 33
    Text = '0'
  end
  object EColorFri: TEdit
    Left = 488
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 34
    Text = '0'
  end
  object EColorSat: TEdit
    Left = 488
    Top = 156
    Width = 121
    Height = 21
    TabOrder = 35
    Text = '0'
  end
  object EColorSun: TEdit
    Left = 488
    Top = 182
    Width = 121
    Height = 21
    TabOrder = 36
    Text = '0'
  end
  object ZQEvents: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select * from EVENTSPECIALDAYS where WRESOURCEID =:WRESOURCEID a' +
        'nd WTypeid = 1')
    UpdateObject = ZUSQLEvents
    AfterInsert = ZQEventsAfterInsert
    Left = 348
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WRESOURCEID'
      end>
    object ZQEventsWEVENTSPECIALDAY_ID: TIntegerField
      FieldName = 'WEVENTSPECIALDAY_ID'
      Required = True
    end
    object ZQEventsWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object ZQEventsWRESOURCEID: TIntegerField
      FieldName = 'WRESOURCEID'
    end
    object ZQEventsWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQEventsWPRIORITY: TIntegerField
      FieldName = 'WPRIORITY'
    end
    object ZQEventsDSTARTDATETIME: TDateTimeField
      FieldName = 'DSTARTDATETIME'
    end
    object ZQEventsDENDDATETIME: TDateTimeField
      FieldName = 'DENDDATETIME'
    end
    object ZQEventsSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 50
    end
  end
  object ZUSQLEvents: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO EVENTSPECIALDAYS'
      
        '  (EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID, EVENTSPECIALDAYS.WTYPEI' +
        'D, EVENTSPECIALDAYS.WRESOURCEID, '
      
        '   EVENTSPECIALDAYS.WCOLOR, EVENTSPECIALDAYS.WPRIORITY, EVENTSPE' +
        'CIALDAYS.DSTARTDATETIME, '
      '   EVENTSPECIALDAYS.DENDDATETIME, EVENTSPECIALDAYS.SDESCRIPTION)'
      'VALUES'
      
        '  (:WEVENTSPECIALDAY_ID, :WTYPEID, :WRESOURCEID, :WCOLOR, :WPRIO' +
        'RITY, :DSTARTDATETIME, '
      '   :DENDDATETIME, :SDESCRIPTION)')
    DeleteSQL.Strings = (
      'DELETE FROM EVENTSPECIALDAYS'
      'WHERE'
      
        '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = :OLD_WEVENTSPECIALDAY_I' +
        'D')
    ModifySQL.Strings = (
      'UPDATE EVENTSPECIALDAYS SET'
      '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = '
      ':WEVENTSPECIALDAY_ID,'
      '  EVENTSPECIALDAYS.WTYPEID = :WTYPEID,'
      '  EVENTSPECIALDAYS.WRESOURCEID = :WRESOURCEID,'
      '  EVENTSPECIALDAYS.WCOLOR = :WCOLOR,'
      '  EVENTSPECIALDAYS.WPRIORITY = :WPRIORITY,'
      '  EVENTSPECIALDAYS.DSTARTDATETIME = :DSTARTDATETIME,'
      '  EVENTSPECIALDAYS.DENDDATETIME = :DENDDATETIME,'
      '  EVENTSPECIALDAYS.SDESCRIPTION = :SDESCRIPTION'
      'WHERE'
      '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = '
      ':OLD_WEVENTSPECIALDAY_ID')
    Left = 444
    Top = 340
  end
  object ZQUserDate: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'select * from EVENTSPECIALDAYS where WRESOURCEID =:WRESOURCEID a' +
        'nd WTypeid = 3')
    UpdateObject = ZUSQLUserDate
    AfterInsert = ZQUserDateAfterInsert
    Left = 352
    Top = 404
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'WRESOURCEID'
      end>
    object ZQUserDateWEVENTSPECIALDAY_ID: TIntegerField
      FieldName = 'WEVENTSPECIALDAY_ID'
      Required = True
    end
    object ZQUserDateWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object ZQUserDateWRESOURCEID: TIntegerField
      FieldName = 'WRESOURCEID'
    end
    object ZQUserDateWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQUserDateWPRIORITY: TIntegerField
      FieldName = 'WPRIORITY'
    end
    object ZQUserDateDSTARTDATETIME: TDateTimeField
      FieldName = 'DSTARTDATETIME'
    end
    object ZQUserDateDENDDATETIME: TDateTimeField
      FieldName = 'DENDDATETIME'
    end
    object ZQUserDateSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 50
    end
  end
  object ZUSQLUserDate: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO EVENTSPECIALDAYS'
      
        '  (EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID, EVENTSPECIALDAYS.WTYPEI' +
        'D, EVENTSPECIALDAYS.WRESOURCEID, '
      
        '   EVENTSPECIALDAYS.WCOLOR, EVENTSPECIALDAYS.WPRIORITY, EVENTSPE' +
        'CIALDAYS.DSTARTDATETIME, '
      '   EVENTSPECIALDAYS.DENDDATETIME, EVENTSPECIALDAYS.SDESCRIPTION)'
      'VALUES'
      
        '  (:WEVENTSPECIALDAY_ID, :WTYPEID, :WRESOURCEID, :WCOLOR, :WPRIO' +
        'RITY, :DSTARTDATETIME, '
      '   :DENDDATETIME, :SDESCRIPTION)')
    DeleteSQL.Strings = (
      'DELETE FROM EVENTSPECIALDAYS'
      'WHERE'
      
        '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = :OLD_WEVENTSPECIALDAY_I' +
        'D')
    ModifySQL.Strings = (
      'UPDATE EVENTSPECIALDAYS SET'
      '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = '
      ':WEVENTSPECIALDAY_ID,'
      '  EVENTSPECIALDAYS.WTYPEID = :WTYPEID,'
      '  EVENTSPECIALDAYS.WRESOURCEID = :WRESOURCEID,'
      '  EVENTSPECIALDAYS.WCOLOR = :WCOLOR,'
      '  EVENTSPECIALDAYS.WPRIORITY = :WPRIORITY,'
      '  EVENTSPECIALDAYS.DSTARTDATETIME = :DSTARTDATETIME,'
      '  EVENTSPECIALDAYS.DENDDATETIME = :DENDDATETIME,'
      '  EVENTSPECIALDAYS.SDESCRIPTION = :SDESCRIPTION'
      'WHERE'
      '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = '
      ':OLD_WEVENTSPECIALDAY_ID')
    Left = 444
    Top = 408
  end
  object ZQGenDate: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      'select * from EVENTSPECIALDAYS where WTypeid = 2')
    UpdateObject = ZUSQLGenDate
    AfterInsert = ZQGenDateAfterInsert
    Left = 560
    Top = 408
    object ZQGenDateWEVENTSPECIALDAY_ID: TIntegerField
      FieldName = 'WEVENTSPECIALDAY_ID'
      Required = True
    end
    object ZQGenDateWTYPEID: TIntegerField
      FieldName = 'WTYPEID'
    end
    object ZQGenDateWRESOURCEID: TIntegerField
      FieldName = 'WRESOURCEID'
    end
    object ZQGenDateWCOLOR: TIntegerField
      FieldName = 'WCOLOR'
    end
    object ZQGenDateWPRIORITY: TIntegerField
      FieldName = 'WPRIORITY'
    end
    object ZQGenDateDSTARTDATETIME: TDateTimeField
      FieldName = 'DSTARTDATETIME'
    end
    object ZQGenDateDENDDATETIME: TDateTimeField
      FieldName = 'DENDDATETIME'
    end
    object ZQGenDateSDESCRIPTION: TStringField
      FieldName = 'SDESCRIPTION'
      Size = 50
    end
  end
  object ZUSQLGenDate: TUniUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO EVENTSPECIALDAYS'
      
        '  (EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID, EVENTSPECIALDAYS.WTYPEI' +
        'D, EVENTSPECIALDAYS.WRESOURCEID, '
      
        '   EVENTSPECIALDAYS.WCOLOR, EVENTSPECIALDAYS.WPRIORITY, EVENTSPE' +
        'CIALDAYS.DSTARTDATETIME, '
      '   EVENTSPECIALDAYS.DENDDATETIME, EVENTSPECIALDAYS.SDESCRIPTION)'
      'VALUES'
      
        '  (:WEVENTSPECIALDAY_ID, :WTYPEID, :WRESOURCEID, :WCOLOR, :WPRIO' +
        'RITY, :DSTARTDATETIME, '
      '   :DENDDATETIME, :SDESCRIPTION)')
    DeleteSQL.Strings = (
      'DELETE FROM EVENTSPECIALDAYS'
      'WHERE'
      
        '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = :OLD_WEVENTSPECIALDAY_I' +
        'D')
    ModifySQL.Strings = (
      'UPDATE EVENTSPECIALDAYS SET'
      '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = '
      ':WEVENTSPECIALDAY_ID,'
      '  EVENTSPECIALDAYS.WTYPEID = :WTYPEID,'
      '  EVENTSPECIALDAYS.WRESOURCEID = :WRESOURCEID,'
      '  EVENTSPECIALDAYS.WCOLOR = :WCOLOR,'
      '  EVENTSPECIALDAYS.WPRIORITY = :WPRIORITY,'
      '  EVENTSPECIALDAYS.DSTARTDATETIME = :DSTARTDATETIME,'
      '  EVENTSPECIALDAYS.DENDDATETIME = :DENDDATETIME,'
      '  EVENTSPECIALDAYS.SDESCRIPTION = :SDESCRIPTION'
      'WHERE'
      '  EVENTSPECIALDAYS.WEVENTSPECIALDAY_ID = '
      ':OLD_WEVENTSPECIALDAY_ID')
    Left = 640
    Top = 416
  end
  object DSGenDate: TDataSource
    DataSet = ZQGenDate
    Left = 624
    Top = 356
  end
  object dsUserDate: TDataSource
    DataSet = ZQUserDate
    Left = 656
    Top = 132
  end
  object ColorDialog1: TColorDialog
    Left = 524
    Top = 320
  end
end
