object fmEventList: TfmEventList
  Left = 219
  Top = 138
  Width = 915
  Height = 638
  Caption = 'Event List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 293
    Align = alTop
    TabOrder = 0
    DesignSize = (
      907
      293)
    object LFromdate: TLabel
      Left = 12
      Top = 3
      Width = 47
      Height = 13
      Caption = 'From date'
    end
    object l1: TLabel
      Left = 341
      Top = 83
      Width = 8
      Height = 13
      Alignment = taRightJustify
      Caption = 'l1'
    end
    object L2: TLabel
      Left = 337
      Top = 108
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'L2'
    end
    object L3: TLabel
      Left = 337
      Top = 132
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'L3'
    end
    object L4: TLabel
      Left = 337
      Top = 155
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'L4'
    end
    object L5: TLabel
      Left = 337
      Top = 180
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'L5'
    end
    object L6: TLabel
      Left = 337
      Top = 204
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'L6'
    end
    object L7: TLabel
      Left = 337
      Top = 228
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'L7'
    end
    object lUser: TLabel
      Left = 328
      Top = 8
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'lUser'
    end
    object LProject: TLabel
      Left = 318
      Top = 36
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Project'
    end
    object LClient: TLabel
      Left = 330
      Top = 252
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Client'
    end
    object Lproduct: TLabel
      Left = 502
      Top = 64
      Width = 42
      Height = 13
      Caption = 'Lproduct'
    end
    object LTime: TLabel
      Left = 418
      Top = 64
      Width = 29
      Height = 13
      Caption = 'LTime'
    end
    object Lstarttime: TLabel
      Left = 362
      Top = 64
      Width = 45
      Height = 13
      Caption = 'Lstarttime'
    end
    object Estart1: TEdit
      Left = 362
      Top = 79
      Width = 53
      Height = 21
      TabOrder = 0
      Text = '8:00'
    end
    object Estart2: TEdit
      Left = 362
      Top = 104
      Width = 53
      Height = 21
      TabOrder = 1
      Text = '8:00'
    end
    object Estart3: TEdit
      Left = 362
      Top = 128
      Width = 53
      Height = 21
      TabOrder = 2
      Text = '8:00'
    end
    object Estart4: TEdit
      Left = 362
      Top = 151
      Width = 53
      Height = 21
      TabOrder = 3
      Text = '8:00'
    end
    object Estart5: TEdit
      Left = 362
      Top = 176
      Width = 53
      Height = 21
      TabOrder = 4
      Text = '8:00'
    end
    object Estart6: TEdit
      Left = 362
      Top = 200
      Width = 53
      Height = 21
      TabOrder = 5
      Text = '8:00'
    end
    object Estart7: TEdit
      Left = 362
      Top = 224
      Width = 53
      Height = 21
      TabOrder = 6
      Text = '8:00'
    end
    object cbprod1: TComboBox
      Left = 502
      Top = 79
      Width = 288
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 7
    end
    object cbuser: TComboBox
      Left = 358
      Top = 3
      Width = 429
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 8
    end
    object cbprod2: TComboBox
      Left = 502
      Top = 104
      Width = 288
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 9
    end
    object cbprod3: TComboBox
      Left = 502
      Top = 128
      Width = 288
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 10
    end
    object cbprod6: TComboBox
      Left = 502
      Top = 200
      Width = 288
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 11
    end
    object cbProject: TComboBox
      Left = 358
      Top = 31
      Width = 429
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 12
      OnChange = cbProjectChange
    end
    object Ehoure1: TEdit
      Left = 418
      Top = 79
      Width = 53
      Height = 21
      TabOrder = 13
      Text = '8:00'
    end
    object Ehoure2: TEdit
      Left = 418
      Top = 104
      Width = 53
      Height = 21
      TabOrder = 14
      Text = '8:00'
    end
    object Ehoure3: TEdit
      Left = 418
      Top = 128
      Width = 53
      Height = 21
      TabOrder = 15
      Text = '8:00'
    end
    object Ehoure4: TEdit
      Left = 418
      Top = 151
      Width = 53
      Height = 21
      TabOrder = 16
      Text = '8:00'
    end
    object Ehoure5: TEdit
      Left = 418
      Top = 176
      Width = 53
      Height = 21
      TabOrder = 17
      Text = '8:00'
    end
    object Ehoure6: TEdit
      Left = 418
      Top = 200
      Width = 53
      Height = 21
      TabOrder = 18
      Text = '0:00'
    end
    object Ehoure7: TEdit
      Left = 418
      Top = 224
      Width = 53
      Height = 21
      TabOrder = 19
      Text = '0:00'
    end
    object cbprod4: TComboBox
      Left = 502
      Top = 150
      Width = 288
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 20
    end
    object cbprod5: TComboBox
      Left = 502
      Top = 175
      Width = 288
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 21
    end
    object cbprod7: TComboBox
      Left = 502
      Top = 224
      Width = 288
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      TabOrder = 22
    end
    object MonthCalendar1: TMonthCalendar
      Left = 8
      Top = 20
      Width = 169
      Height = 157
      Date = 41136.512325671300000000
      TabOrder = 23
      TabStop = True
      WeekNumbers = True
      OnClick = MonthCalendar1Exit
    end
    object bCreate: TButton
      Left = 12
      Top = 248
      Width = 109
      Height = 25
      Caption = 'Create hours'
      TabOrder = 24
      OnClick = bCreateClick
    end
    object EAccount: TEdit
      Left = 362
      Top = 248
      Width = 428
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 25
    end
    object Blookup: TButton
      Left = 796
      Top = 246
      Width = 106
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Lookup'
      TabOrder = 26
      OnClick = BlookupClick
    end
    object bClear: TButton
      Left = 792
      Top = 5
      Width = 106
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Clear'
      TabOrder = 27
      OnClick = bClearClick
    end
    object cbWeekview: TCheckBox
      Left = 20
      Top = 192
      Width = 97
      Height = 17
      Caption = 'Week'
      Checked = True
      State = cbChecked
      TabOrder = 28
      OnClick = cbWeekviewClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 563
    Width = 907
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BDelselected: TButton
      Left = 16
      Top = 8
      Width = 193
      Height = 25
      Caption = 'Delete selected'
      TabOrder = 0
      OnClick = BDelselectedClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 293
    Width = 907
    Height = 270
    Align = alClient
    TabOrder = 2
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 905
      Height = 268
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsEvents
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.Indicator = True
        Styles.StyleSheet = dmQuantumGridDefs.GridTableViewStyleSheetWindowsStandard
        object cxGrid1DBTableView1RECORDID: TcxGridDBColumn
          DataBinding.FieldName = 'RECORDID'
          Width = 91
        end
        object cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'DESCRIPTION'
          Width = 249
        end
        object cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn
          DataBinding.FieldName = 'WACCOUNTID'
          Width = 130
        end
        object cxGrid1DBTableView1USERFIELD5: TcxGridDBColumn
          DataBinding.FieldName = 'USERFIELD5'
          Width = 214
        end
        object cxGrid1DBTableView1STARTTIME: TcxGridDBColumn
          DataBinding.FieldName = 'STARTTIME'
          DateTimeGrouping = dtgByDate
        end
        object cxGrid1DBTableView1ENDTIME: TcxGridDBColumn
          DataBinding.FieldName = 'ENDTIME'
          DateTimeGrouping = dtgByDate
        end
        object cxGrid1DBTableView1ALARMSET: TcxGridDBColumn
          DataBinding.FieldName = 'ALARMSET'
          Width = 87
        end
        object cxGrid1DBTableView1USERFIELD0: TcxGridDBColumn
          DataBinding.FieldName = 'USERFIELD0'
          Width = 199
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object ActionManager1: TActionManager
    Left = 656
    Top = 276
    StyleName = 'XP Style'
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object ZQEvents: TUniQuery
    DataTypeMap = <>
    Connection = DMTCCoreLink.ZDesignConnectionPleaseDonotuse
    SQL.Strings = (
      
        'SELECT a.RECORDID, a.STARTTIME, a.ENDTIME, a.RESOURCEID, a.WCONT' +
        'ACTID, a.DESCRIPTION, a.NOTES, a.CATEGORY, a.ALLDAYEVENT, a.DING' +
        'PATH, a.ALARMSET, a.ALARMADVANCE, a.ALARMADVANCETYPE, a.SNOOZETI' +
        'ME, a.REPEATCODE, a.REPEATRANGEEND, a.CUSTOMINTERVAL, a.USERFIEL' +
        'D0, a.USERFIELD1, a.USERFIELD2, a.USERFIELD3, a.USERFIELD4, a.US' +
        'ERFIELD5, a.USERFIELD6, a.USERFIELD7, a.USERFIELD8, a.USERFIELD9' +
        ', a.WACCOUNTID'
      
        'FROM EVENTS a where a.RESOURCEID =:ID and CATEGORY = 4 and a.STA' +
        'RTTIME between :date1 and :date2')
    AfterInsert = ZQEventsAfterInsert
    Left = 268
    Top = 276
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
      end
      item
        DataType = ftUnknown
        Name = 'date1'
      end
      item
        DataType = ftUnknown
        Name = 'date2'
      end>
    object ZQEventsRECORDID: TIntegerField
      FieldName = 'RECORDID'
      Required = True
    end
    object ZQEventsSTARTTIME: TDateTimeField
      FieldName = 'STARTTIME'
    end
    object ZQEventsENDTIME: TDateTimeField
      FieldName = 'ENDTIME'
    end
    object ZQEventsRESOURCEID: TIntegerField
      FieldName = 'RESOURCEID'
    end
    object ZQEventsWCONTACTID: TIntegerField
      FieldName = 'WCONTACTID'
    end
    object ZQEventsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 255
    end
    object ZQEventsNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object ZQEventsCATEGORY: TIntegerField
      FieldName = 'CATEGORY'
    end
    object ZQEventsALLDAYEVENT: TSmallintField
      FieldName = 'ALLDAYEVENT'
    end
    object ZQEventsDINGPATH: TStringField
      FieldName = 'DINGPATH'
      Size = 255
    end
    object ZQEventsALARMSET: TSmallintField
      FieldName = 'ALARMSET'
    end
    object ZQEventsALARMADVANCE: TIntegerField
      FieldName = 'ALARMADVANCE'
    end
    object ZQEventsALARMADVANCETYPE: TIntegerField
      FieldName = 'ALARMADVANCETYPE'
    end
    object ZQEventsSNOOZETIME: TDateTimeField
      FieldName = 'SNOOZETIME'
    end
    object ZQEventsREPEATCODE: TIntegerField
      FieldName = 'REPEATCODE'
    end
    object ZQEventsREPEATRANGEEND: TDateTimeField
      FieldName = 'REPEATRANGEEND'
    end
    object ZQEventsCUSTOMINTERVAL: TIntegerField
      FieldName = 'CUSTOMINTERVAL'
    end
    object ZQEventsUSERFIELD0: TStringField
      FieldName = 'USERFIELD0'
      Size = 100
    end
    object ZQEventsUSERFIELD1: TStringField
      FieldName = 'USERFIELD1'
      Size = 100
    end
    object ZQEventsUSERFIELD2: TStringField
      FieldName = 'USERFIELD2'
      Size = 100
    end
    object ZQEventsUSERFIELD3: TStringField
      FieldName = 'USERFIELD3'
      Size = 100
    end
    object ZQEventsUSERFIELD4: TStringField
      FieldName = 'USERFIELD4'
      Size = 100
    end
    object ZQEventsUSERFIELD5: TStringField
      FieldName = 'USERFIELD5'
      OnGetText = ZQEventsUSERFIELD5GetText
      Size = 100
    end
    object ZQEventsUSERFIELD6: TStringField
      FieldName = 'USERFIELD6'
      Size = 100
    end
    object ZQEventsUSERFIELD7: TStringField
      FieldName = 'USERFIELD7'
      Size = 100
    end
    object ZQEventsUSERFIELD8: TStringField
      FieldName = 'USERFIELD8'
      Size = 100
    end
    object ZQEventsUSERFIELD9: TStringField
      FieldName = 'USERFIELD9'
      Size = 100
    end
    object ZQEventsWACCOUNTID: TIntegerField
      FieldName = 'WACCOUNTID'
      OnGetText = ZQEventsWACCOUNTIDGetText
    end
  end
  object dsEvents: TDataSource
    DataSet = ZQEvents
    Left = 492
    Top = 300
  end
end
