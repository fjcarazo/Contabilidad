{*********************************************************}
{*                VPEVNTEDITDLG.PAS 1.03                 *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Visual PlanIt                              *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (C) 2002        *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I Vp.INC}

unit VpTCEvntEditDlg;
  { The default event edit dialog }

interface

uses
  Windows, Messages, SysUtils, {$IFDEF VERSION6}Variants,{$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, VpData, VpEdPop,
  VpDateEdit, ComCtrls, Mask, VpBase, VpClock, VpBaseDS, VpDlg, VpConst,
  Buttons,VpSRVars, Grids, DBGrids, DB,UpluginsSharedUnit,DBAccess , Uni;
const
  SQLEventAction : String = 'SELECT taskaction.TaskActionID, taskaction.EventId, taskaction.InvoiceID, taskaction.AccountId, taskaction.WGroupId, taskaction.WTypeId, Groups.SDescription, Dochead.SDocNo, Dochead.FDocAmount, '+
                   ' Dochead.SReference, Groups.WGroupTypeID, Account.SDescription, Account.SACCOUNTCODE FROM taskaction LEFT OUTER JOIN Account Account ON  (taskaction.AccountId = Account.WAccountID) LEFT OUTER JOIN DocHead Dochead ' +
                   ' ON  (taskaction.InvoiceID = Dochead.WDocID) LEFT OUTER JOIN Groups Groups ON  (taskaction.WGroupId = Groups.WGroupID)' +
                   ' where EventId = :EventID ';

  type                                  
  { forward declarations }
  TVpEventTCEditDialog = class;
  TEventEditDlgRtnType = (rtCommit, rtAbandon);

  TVpRightAlignedEdit = class(TEdit)
  private
  public
    procedure CreateParams(var Params : TCreateParams); override;
  end;

  TDlgEventTCEdit = class(TForm)
    Panel1: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    ResourceNameLbl: TLabel;
    FileDialog: TOpenDialog;
    pgEvent: TPageControl;
    tabEvent: TTabSheet;
    AppointmentGroupBox: TGroupBox;
    DescriptionLbl: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    CategoryLbl: TLabel;
    StartTimeLbl: TLabel;
    EndTimeLbl: TLabel;
    Image2: TImage;
    RecurringLbl: TLabel;
    Bevel3: TBevel;
    IntervalLbl: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    DescriptionEdit: TEdit;
    AlarmSet: TCheckBox;
    StartTime: TComboBox;
    EndTime: TComboBox;
    Category: TComboBox;
    RecurringType: TComboBox;
    IntervalUpDown: TUpDown;
    AlarmAdvType: TComboBox;
    AdvanceUpDown: TUpDown;
    AlarmAdvance: TMaskEdit;
    CBAllDay: TCheckBox;
    StartDate: TVpDateEdit;
    EndDate: TVpDateEdit;
    NotesMemo: TMemo;
    edtUnusedPlaceholder: TEdit;
    imgClock: TImage;
    RepeatUntil: TVpDateEdit;
    RecurrenceEndsLbl: TLabel;
    TSRepeatInvoice: TTabSheet;
    LSaveAndReopen: TLabel;
    DSTaskAction: TDataSource;
    LProcessList: TLabel;
    Panel2: TPanel;
    BNew: TButton;
    BEdit: TButton;
    BDelete: TButton;
    BProcessSelected: TButton;
    BProcessAll: TButton;
    DTInvoiceDate: TDateTimePicker;
    LInvoiceDate: TLabel;
    EAccount: TEdit;
    LEAccount: TLabel;
    DBGrid1: TDBGrid;
    EMessage1: TEdit;
    EMessage2: TEdit;
    EMessage3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbSalesmen: TComboBox;
    EQuote: TEdit;
    Label3: TLabel;
    cbProject: TComboBox;
    LProject: TLabel;
    tsplugins: TTabSheet;
    cbLocation: TComboBox;
    Location: TLabel;
    Lproduct: TLabel;
    cbProduct: TComboBox;
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StartDateChange(Sender: TObject);
    procedure StartTimeChange(Sender: TObject);
    procedure EndTimeChange(Sender: TObject);
    procedure AlarmAdvanceChange(Sender: TObject);
    procedure AdvanceUpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure CustomIntervalChange(Sender: TObject);
    procedure IntervalUpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure RecurringTypeChange(Sender: TObject);
    procedure AlarmSetClick(Sender: TObject);
    procedure EndDateChange(Sender: TObject);
    procedure CategoryDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure CBAllDayClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StartTimeExit(Sender: TObject);
    procedure EndTimeExit(Sender: TObject);
    procedure CategoryChange(Sender: TObject);
    procedure BNewClick(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure pgEventChange(Sender: TObject);
    procedure BProcessSelectedClick(Sender: TObject);
    procedure BProcessAllClick(Sender: TObject);
    procedure EAccountEnter(Sender: TObject);
    procedure InitLocationList ;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure EndTimeDropDown(Sender: TObject);
    procedure StartTimeDropDown(Sender: TObject);
    procedure cbSalesmenChange(Sender: TObject);
    procedure cbProjectChange(Sender: TObject);
  private { Private declarations }
    AAVerifying: Boolean;
    CIVerifying: Boolean;
    FCustomInterval : TVpRightAlignedEdit;
    procedure PopLists;
    procedure LoadCaptions;
    procedure InitAccountText;
  public { Public declarations }
    Event: TVpEvent;
    CatColorMap: TVpCategoryColorMap;
    Resource: TVpResource;
    ReturnCode: TEventEditDlgRtnType;
    Conflicts : Integer;
    TimeFormat: TVpTimeFormat;
    AlarmWavPath: string;
    FLastEndTime : TDateTime;
    OrderIndex : Integer ;
    Direction : Boolean ;
    Look : String ;
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;


    procedure PopulateDialog;
    procedure DePopulateDialog;
    procedure RefreshTaskActionData ;
    procedure HandelTaskActionRecord ;
    procedure SetReadonly ;
  end;

  TVpEventTCEditDialog = class(TVpBaseDialog)
  private
    FOnInitPlugins: TNotifyEvent;
    FOnSavePlugin: TNotifyEvent;
    FOnClosePlugins: TNotifyEvent;
    procedure SetOnInitPlugins(const Value: TNotifyEvent);
    procedure SetOnSavePlugin(const Value: TNotifyEvent);
    procedure SetOnClosePlugins(const Value: TNotifyEvent);
  protected {private}
    ceEditDlg         : TDlgEventTCEdit;
    FTimeFormat       : TVpTimeFormat;
    ceEvent           : TVpEvent;
  public
    AddInvoiceId : Integer ;
     MyDlgEventEdit: TDlgEventTCEdit;
    constructor Create(AOwner : TComponent); override;
    function Execute(Event: TVpEvent;
      TimeFormat: TVpTimeFormat = tf12Hour): Boolean; reintroduce;
    function AddNewEvent(StartTime, EndTime: TDateTime): Boolean;
  published
    {properties}

    property TimeFormat: TVpTimeFormat
      read FTimeFormat write FTimeFormat default tf12Hour;
    property DataStore;
    property Options;
    property Placement;
    procedure AfterSave(sender : TDataset) ;
    property OnInitPlugins : TNotifyEvent  read FOnInitPlugins write SetOnInitPlugins;
    property OnSavePlugin : TNotifyEvent   read FOnSavePlugin write SetOnSavePlugin;
    property OnClosePlugins : TNotifyEvent   read FOnClosePlugins write SetOnClosePlugins;
  end;

implementation

uses
  VpSR, VpWavDlg,databaseaccess, Database, VpTaskActionEditDlg,TcVariables,GlobalFunctions,
  TypInfo, OSFGeneralRoutines, Lookup, TCDayPlanner, UDMTCCoreLink,menus;

{$R *.dfm}

{ TVpRightAlignedEdit }



procedure TVpRightAlignedEdit.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or ES_MULTILINE or ES_RIGHT;
end;

{=====}

{ TDlgEventEdit }

procedure TDlgEventTCEdit.FormCreate(Sender: TObject);
begin
  ReturnCode := rtAbandon;
  PopLists;
  LoadCaptions;
  StartTime.ItemIndex := -1;
  EndTime.ItemIndex := -1;
  EndDate.Enabled := False;

  FCustomInterval := TVpRightAlignedEdit.Create(Self);
  with FCustomInterval do begin
    Parent := AppointmentGroupbox;
    Top := IntervalUpDown.Top + 1;
    Left := IntervalUpDown.Left - 65;
    Height := IntervalUpDown.Height - 1;
    Width := 65;
    MaxLength := 5;
    OnChange := CustomIntervalChange;
    TabOrder := edtUnusedPlaceholder.TabOrder;
  end;
  IntervalUpDown.Associate := FCustomInterval;
end;
{=====}

procedure TDlgEventTCEdit.OKBtnClick(Sender: TObject);
var
  AEvent : TvpEvent;
begin
 { if (Category.ItemIndex = 4) and (Event.Category <> 4) then
      begin
          if RecurringType.ItemIndex <> 0 then
             begin
                RecurringType.ItemIndex := 0 ;

                AEvent := Event.Owner.AddEvent(-1,Event.StartTime,Event.EndTime) ;
                AEvent.AlarmWavPath := Event.AlarmWavPath ;
                AEvent.AlertDisplayed := Event.AlertDisplayed ;
                AEvent.AllDayEvent := Event.AllDayEvent ;
                AEvent.Changed := true ;
                AEvent.Deleted := false ;
                StartDate.Date := Event.Popupstart ;
                EndDate.date := Event.PopupEnd ; 
                AEvent.StartTime := Event.Popupstart ;
                AEvent.EndTime := Event.PopupEnd ;
                AEvent.Description := Event.Description ;
                AEvent.Note := Event.Note ;
                AEvent.Category := Event.Category ;
                AEvent.AlarmSet := Event.AlarmSet ;
                AEvent.AlarmAdv := Event.AlarmAdv ;
                AEvent.Loading := Event.Loading ;
                AEvent.AlarmAdvType := Event.AlarmAdvType ;
                AEvent.SnoozeTime := Event.SnoozeTime ;
                AEvent.RepeatCode := Event.RepeatCode ;
                AEvent.RepeatRangeEnd := Event.RepeatRangeEnd ;
                AEvent.CustInterval := Event.CustInterval ;
                AEvent.UserField0 := Event.UserField0 ;
                AEvent.UserField1 := Event.UserField1 ;
                AEvent.UserField2 := Event.UserField2 ;
                AEvent.UserField3 := Event.UserField3 ;
                AEvent.UserField4 := Event.UserField4 ;
                AEvent.UserField5 := Event.UserField5 ;
                AEvent.UserField6 := Event.UserField6 ;
                AEvent.UserField7 := Event.UserField7 ;
                AEvent.UserField8 := Event.UserField8 ;
                AEvent.UserField9 := Event.UserField9 ;
                AEvent.WAccountID := Event.WAccountID ;
                Event := AEvent;
             end;
      end;
            }
  if (Category.ItemIndex = 4) and (RecurringType.ItemIndex <> 0 ) then
     begin
        pgEvent.ActivePageIndex := 0 ;
        RecurringType.SetFocus ;
        raise Exception.Create('Type houres cannot be repeated!');
     end;

  ReturnCode := rtCommit;
  Close;
end;
{=====}

procedure TDlgEventTCEdit.CancelBtnClick(Sender: TObject);
begin
  Close;
end;
{=====}

procedure TDlgEventTCEdit.PopulateDialog;
var
  I: Integer;
begin
  { Resource }
   LProject.Visible := DMTCCoreLink.ReadNwReportOp('cbProjects',false) ;
   cbProject.Visible := LProject.Visible  ;
   TDataBaseStringRoutines.FillStringListWithSelect(cbProject.Items,'SELECT WJOBPROJECTID, SJOBPROJECTCODE || SDESCRIPTION SJOBPROJECTCODE  FROM JOBPROJECT where BENABLED =1');
   cbProduct.Visible := DMTCCoreLink.IsRegistered('{273891C5-DFC3-464C-8FEB-64DA85B2FFC0}');
   Lproduct.Visible := cbProduct.Visible ;
   if cbProduct.Visible then
   if DMTCCoreLink.SQLList.GetFormatedSQLByName('EVENT_PRODS') <> '' then
   TDataBaseStringRoutines.FillStringListWithSelect(cbProduct.Items,DMTCCoreLink.SQLList.GetFormatedSQLByName('EVENT_PRODS'));

  ResourceNameLbl.Caption := Resource.Description;

  { Events }
  StartDate.Date := Event.StartTime;
  EndDate.Date := Event.EndTime;
  RepeatUntil.Date := Event.RepeatRangeEnd;
  StartTime.Text := FormatDateTime('hh:mm', Event.StartTime);
  EndTime.Text := FormatDateTime('hh:mm', Event.EndTime);

  StartTimeChange(Self);
  CBAllDay.Checked := Event.AllDayEvent;
  AlarmWavPath := Event.AlarmWavPath;


  StartDate.Enabled := not CBAllDay.Checked;
//  EndDate.Enabled := not CBAllDay.Checked;
  EndTime.Enabled := not CBAllDay.Checked;
  StartTime.Enabled := not CBAllDay.Checked;

  DescriptionEdit.Text := Event.Description;
  NotesMemo.Text :=  StringReplace(StringReplace(Event.Note,#13,'',[rfReplaceAll]),#10,#13+#10,[rfReplaceAll]) ;
  AlarmSet.Checked := Event.AlarmSet;
  AlarmSetClick(Self);
  if not Event.AlarmSet then
    AlarmAdvance.Text := '15'
  else
    AlarmAdvance.Text := IntToStr(Event.AlarmAdv);
  AlarmAdvType.ItemIndex := Ord(Event.AlarmAdvType);
  RecurringType.ItemIndex := Ord(Event.RepeatCode);
  RecurringTypeChange(Self);
  FCustomInterval.Text := IntToStr(Event.CustInterval);

  Category.Items.Clear;

//  for I := 0 to 2 do
//    if (CatColorMap.GetName(I) <> '') then
 //     Category.Items.Add(CatColorMap.GetName(I));
 Category.Items.Add('0');
 Category.Items.Add('1');
 Category.Items.Add('2');
 Category.Items.Add('3');
 Category.Items.Add('4');
 CatColorMap.Category0.Description := gettextlang(2857);
 CatColorMap.Category1.Description := gettextlang(2858);
 CatColorMap.Category2.Description := gettextlang(2859);
 CatColorMap.Category3.Description := gettextlang(2860);
 CatColorMap.Category4.Description := gettextlang(2330);
 Category.Items.Add('5');
 CatColorMap.Category5.Description := gettextlang(2858) + ' 2';
 Category.Items.Add('6');
 CatColorMap.Category6.Description := gettextlang(2858) + ' 3';
 Category.Items.Add('7');
 CatColorMap.Category7.Description := gettextlang(2858) + ' 4';
  Category.Items.Add('8');
 CatColorMap.Category8.Description := gettextlang(2858) + ' 5';;
  Category.Items.Add('9');
 CatColorMap.Category9.Description := gettextlang(2858) + ' 6';

 tsplugins.Caption := gettextlang(1805);
  Label1.Caption := gettextlang(239);

 LSaveAndReopen.caption :=  gettextlang(2880);
  Category.ItemIndex := Event.Category;

  FLastEndTime := Event.EndTime;
 TSRepeatInvoice.TabVisible := false ;

 TDataBaseRoutines.FillStringsWithReportingGroups(cbSalesmen.Items,31);
 if cbSalesmen.Items.Count <> 0 then
  cbSalesmen.ItemIndex := 0 ;
 if cbSalesmen.Items.IndexOf(Event.UserField0) <> -1 then
  cbSalesmen.ItemIndex := cbSalesmen.Items.IndexOf(Event.UserField0);
 EQuote.Text := Event.UserField1 ;
 // Edit1.Text := Event.UserField0;
 if Event.RecordID <> -1 then
   begin
     TSRepeatInvoice.TabVisible := Event.Category = 1 ;
   end;
 CategoryChange(self);
 cbProject.ItemIndex := GetItemIndexFromId(cbProject.Items,StrTOIntDef(Event.UserField2,0));

 cbProduct.ItemIndex := GetItemIndexFromId(cbProduct.Items,StrTOIntDef(Event.UserField5,0));



 EAccount.Tag := Event.WAccountID ;
 if EAccount.Tag = 0then EAccount.Tag := -1 ;
 InitAccountText ;

 cbLocation.Text := Event.UserField3 ;

 if Event.UserField4 <> '' then
   Self.Caption := Self.Caption +' READONLY OUTLOOK' ;
end;
{=====}

procedure TDlgEventTCEdit.DePopulateDialog;
begin
  { Events }
  Event.StartTime := StartDate.Date + StrToDateTime(StartTime.Text);
  Event.EndTime := EndDate.Date + StrToDateTime(EndTime.Text);
  Event.RepeatRangeEnd := RepeatUntil.Date;
  Event.Description := DescriptionEdit.Text;
  Event.Note := NotesMemo.Text;
  Event.Category := Category.ItemIndex;
  Event.AlarmSet := AlarmSet.Checked;
  Event.AlarmAdv := StrToIntDef(AlarmAdvance.Text, 0);
  Event.AlarmAdvType := TVpAlarmAdvType(AlarmAdvType.ItemIndex);
  Event.RepeatCode := TVpRepeatType(RecurringType.ItemIndex);
  Event.CustInterval := StrToIntDef(FCustomInterval.Text, 0);
  Event.AllDayEvent := CBAllDay.Checked;
  Event.AlarmWavPath := AlarmWavPath;
  Event.WAccountID := EAccount.Tag ;
  Event.UserField0 := cbSalesmen.Text ;
  Event.UserField1 := EQuote.Text ;
  Event.UserField2 := '' ;
  if cbProject.ItemIndex <> -1 then
    Event.UserField2 := IntToStr(Integer(cbProject.items.Objects[cbProject.ItemIndex])) ;
  if cbProduct.ItemIndex <> -1 then
    Event.UserField5 := IntToStr(Integer(cbProduct.items.Objects[cbProduct.ItemIndex])) ;

  Event.UserField3 := cbLocation.Text;
  Event.Changed := True ; 

  //Event.UserField0 := Edit1.Text ;
end;
{=====}

procedure TDlgEventTCEdit.StartDateChange(Sender: TObject);
begin
  if StartDate.Date > EndDate.Date then
    EndDate.Date := StartDate.Date;
end;
{=====}

procedure TDlgEventTCEdit.EndDateChange(Sender: TObject);
begin
  if StartDate.Date > EndDate.Date then
    StartDate.Date := EndDate.Date;
end;
{=====}

procedure TDlgEventTCEdit.StartTimeChange(Sender: TObject);
{var                                                                   } 
{  ST: TDateTime;                                                      }                                                       
begin
  { Verify the value is valid }
  try
    {ST :=} StrToDateTime(StartTime.Text);                               
  except
    StartTime.Color := clRed;
    StartTime.SetFocus;
    Exit;
  end;
  StartTime.Color := clWindow;

  { if the end time is less than the start time then change the end time to }
  { follow the start time by 30 minutes }
  {if ST > StrToDateTime(EndTime.Text) then begin                      } 
  {  if TimeFormat = tf24Hour then                                     } 
  {    EndTime.Text := FormatDateTime ('h:mm',                         } 
  {                                    ST + (30/MinutesInDay))         } 
  {  else                                                              } 
  {    EndTime.Text := FormatDateTime ('hh:mm AM/PM',                  } 
  {                                    ST + (30/MinutesInDay));        } 
  {end;                                                                } 

end;
{=====}

procedure TDlgEventTCEdit.EndTimeChange(Sender: TObject);

  function IsMidnight (ATime : TDateTime) : Boolean;                     
  begin                                                                  
    Result := ATime = Trunc (ATime);                                     
  end;                                                                   

var                                                                      
  ET: TDateTime;                                                         

begin
  { Verify the value is valid }
  try
    ET := StrToDateTime (EndTime.Text);                                  
    if (IsMidnight (ET)) and (not IsMidnight (FLastEndTime)) then        
      EndDate.Date := EndDate.Date + 1                                   
    else if (not IsMidnight (ET)) and (IsMidnight (FLastEndTime)) then   
      EndDate.Date := EndDate.Date - 1;                                  

    FLastEndTime := ET;                                                  
  except
    EndTime.Color := clRed;
    EndTime.SetFocus;
    Exit;
  end;
  EndTime.Color := clWindow;

  { if the end time is less than the start time then change the start time to }
  { precede the end time by 30 minutes }
  {if ET < StrToDateTime(StartTime.Text) then begin                    } 
  {  if TimeFormat = tf24Hour then                                     } 
  {    StartTime.Text := FormatDateTime ('h:mm',                       } 
  {                                      ET - (30/MinutesInDay))       } 
  {  else                                                              } 
  {    StartTime.Text := FormatDateTime ('h:mm AM/PM',                 } 
  {                                      ET - (30/MinutesInDay));      } 
  {end;                                                                } 
end;
{=====}

procedure TDlgEventTCEdit.PopLists;
var
  StringList: TStringList;
  I, Hour, Minute: Integer;
  MinStr, AMPMStr: string;
begin
 { Time Lists }
  StringList := TStringList.Create;
  try
    Minute := 0;
    AMPMStr := ' AM';
    for I := 0 to 96 do
     begin
      if I > 0 then Inc(Minute, 15);
      Hour := (Minute div 15) div 4;
      MinStr := IntToStr(Minute mod 60);
      if MinStr = '0' then MinStr := '00';
      StringList.Add(FormatFloat('00',Hour) + ':' + MinStr)
    end;
    StartTime.Items.Assign(StringList);
    StartTime.ItemIndex := 0;

    EndTime.Items.Assign(StringList);
    EndTime.ItemIndex := 0;
  finally
    StringList.Free;
  end;

  { RecurringList }
  RecurringType.Items.Add(RSNone);
  RecurringType.Items.Add(RSDaily);
  RecurringType.Items.Add(RSWeekly);
  RecurringType.Items.Add(RSMonthlyByDay);
  RecurringType.Items.Add(RSMonthlyByDate);
  RecurringType.Items.Add(RSYearlyByDay);
  RecurringType.Items.Add(RSYearlyByDate);
  RecurringType.Items.Add(RSCustom);
  RecurringType.ItemIndex := 0;

  { Alarm Advance Type }
  AlarmAdvType.Items.Add(RSMinutes);
  AlarmAdvType.Items.Add(RSHours);
  AlarmAdvType.Items.Add(RSDays);
  AlarmAdvType.ItemIndex := 0;
end;
{=====}

procedure TDlgEventTCEdit.LoadCaptions;
begin
  OKBtn.Caption := RSOKBtn;
  CancelBtn.Caption := RSCancelBtn;
  AppointmentGroupBox.Caption := RSAppointmentGroupBox;
  DescriptionLbl.Caption := RSDescriptionLbl;
  
  Label2.Caption := DMTCCoreLink.GetTextLang(1718) ;
  CategoryLbl.Caption := RSCategoryLbl;
  StartTimeLbl.Caption := RSStartTimeLbl;
  EndTimeLbl.Caption := RSEndTimeLbl;
  AlarmSet.Caption := RSAlarmSet;
  RecurringLbl.Caption := RSRecurringLbl;
  IntervalLbl.Caption := RSIntervalLbl;
  RecurrenceEndsLbl.Caption := RSRecurrenceEndsLbl;
  CBAllDay.Caption := RSAllDayEvent;
end;
{=====}

procedure TDlgEventTCEdit.AlarmAdvanceChange(Sender: TObject);
var
  I: Integer;
  Str: string;
begin
  if AAVerifying then exit;
  AAVerifying := true;
  { Don't allow non numeric values. }
  Str := AlarmAdvance.Text;
  I := Length(Str);
  if (Str[I] > #57) or (Str[I] < #48) then
    Delete(Str, I, 1);
  AlarmAdvance.Text := Str;
  AAVerifying := false;

  if Str <> '' then
    AdvanceUpDown.Position := StrToInt(Str);
end;
{=====}

procedure TDlgEventTCEdit.AdvanceUpDownClick(Sender: TObject; Button: TUDBtnType);
begin
  { Inc or Dec AlarmAdvance according to which button was pressed }

  AlarmAdvance.Text := IntToStr(AdvanceUpDown.Position);
end;
{=====}

procedure TDlgEventTCEdit.CustomIntervalChange(Sender: TObject);
var
  I: Integer;
  Str: string;
begin
  { Don't allow non numeric values. }
  if CIVerifying then Exit;
  CIVerifying := true;
  Str := FCustomInterval.Text;
  for I := 1 to Length(Str) do
    if (Ord(Str[I]) in [48..57]) then
      Continue
    else
      Delete(Str, I, 1);
  FCustomInterval.Text := Str;
  if Str <> '' then
    IntervalUpDown.Position := StrToInt(Str);
  CIVerifying := false;
end;
{=====}

procedure TDlgEventTCEdit.IntervalUpDownClick(Sender: TObject; Button: TUDBtnType);
begin
  FCustomInterval.Text := IntToStr(IntervalUpDown.Position);
end;
{=====}

procedure TDlgEventTCEdit.RecurringTypeChange(Sender: TObject);
begin
  if (RecurringType.ItemIndex > 0)
  and (RepeatUntil.Date <= StartDate.Date)
  then
    RepeatUntil.Date := StartDate.Date + 365;

  RecurrenceEndsLbl.Enabled := (RecurringType.ItemIndex > 0);
  RepeatUntil.Enabled := RecurrenceEndsLbl.Enabled;

  FCustomInterval.Enabled := RecurringType.ItemIndex = 7;
  IntervalLbl.Enabled := FCustomInterval.Enabled;
  IntervalUpDown.Enabled := FCustomInterval.Enabled;
  if FCustomInterval.Enabled then begin
    FCustomInterval.Text := IntToStr(IntervalUpDown.Position);
    if Visible then
      FCustomInterval.SetFocus;
  end;

end;
{=====}

procedure TDlgEventTCEdit.AlarmSetClick(Sender: TObject);
begin
  AlarmAdvance.Enabled  := AlarmSet.Checked;
  AlarmAdvType.Enabled  := AlarmSet.Checked;
  AdvanceUpDown.Enabled := AlarmSet.Checked;
  Event.SnoozeTime := 0.0;
end;
{=====}

procedure TDlgEventTCEdit.CategoryDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Color, SaveColor: TColor;
  Name: string;
  ColorRect: TRect;
begin
  Category.Canvas.FillRect(Rect);
  Color := clBlack;
  case Index of
    0: begin
      Color := CatColorMap.Category0.Color;
      Name := CatColorMap.Category0.Description;
    end;
    1:  begin
      Color := CatColorMap.Category1.Color;
      Name := CatColorMap.Category1.Description;
    end;
    2:  begin
      Color := CatColorMap.Category2.Color;
      Name := CatColorMap.Category2.Description;
    end;
    3:  begin
      Color := CatColorMap.Category3.Color;
      Name := CatColorMap.Category3.Description;
    end;
    4:  begin
      Color := CatColorMap.Category4.Color;
      Name := CatColorMap.Category4.Description;
    end;
    5:  begin
      Color := CatColorMap.Category5.Color;
      Name := CatColorMap.Category5.Description;
    end;
    6:  begin
      Color := CatColorMap.Category6.Color;
      Name := CatColorMap.Category6.Description;
    end;
    7:  begin
      Color := CatColorMap.Category7.Color;
      Name := CatColorMap.Category7.Description;
    end;
    8:  begin
      Color := CatColorMap.Category8.Color;
      Name := CatColorMap.Category8.Description;
    end;
    9:  begin
      Color := CatColorMap.Category9.Color;
      Name := CatColorMap.Category9.Description;
    end;
  end; {Case}

  SaveColor := Category.Canvas.Brush.Color;
  Category.Canvas.Brush.Color := Color;
  Category.Canvas.Pen.Color := clBlack;
  ColorRect.Left := Rect.Left + 3;
  ColorRect.Top := Rect.Top + 2;
  ColorRect.Bottom := Rect.Bottom - 2;
  ColorRect.Right := ColorRect.Left + 20;
  Category.Canvas.FillRect(ColorRect);
  {$IFDEF VERSION5}
  Category.Canvas.Rectangle(ColorRect);
  {$ELSE}
  Category.Canvas.Rectangle(ColorRect.Left, ColorRect.Top, ColorRect.Right,
    ColorRect.Bottom);
  {$ENDIF}
  Rect.Left := ColorRect.Right + 5;
  Category.Canvas.Brush.Color := SaveColor;
  Category.Canvas.TextOut(Rect.Left, Rect.Top, Name);
end;
{=====}

procedure TDlgEventTCEdit.CBAllDayClick(Sender: TObject);
begin
  StartDate.Enabled := not CBAllDay.Checked;
  {EndDate.Enabled := not CBAllDay.Checked;                            } 
  EndTime.Enabled := not CBAllDay.Checked;
  StartTime.Enabled := not CBAllDay.Checked;
end;
{=====}

procedure TDlgEventTCEdit.SpeedButton1Click(Sender: TObject);
begin
  ExecuteSoundFinder(AlarmWavPath);
end;
{=====}

procedure TDlgEventTCEdit.FormShow(Sender: TObject);
begin
pgEvent.ActivePageIndex := 0 ;
OrderIndex := 13 ;
DBGrid1.Columns[0].Title.Caption := gettextlang(176);
DBGrid1.Columns[1].Title.Caption := gettextlang(606);
DBGrid1.Columns[2].Title.Caption := GetGroupDisplayName(rgtdoc1) ;
DBGrid1.Columns[3].Title.Caption := gettextlang(1120);
DBGrid1.Columns[4].Title.Caption := gettextlang(607);
Lproduct.Caption := DMTCCoreLink.gettextlang(37);
LProject.Caption :=  DMTCCoreLink.GetTextLang(3099);

  DTInvoiceDate.Date := now ;
  if DescriptionEdit.CanFocus then
  DescriptionEdit.SetFocus;
  EditBtns(BNew,BEdit,BDelete);
  BProcessSelected.Caption := GetTextLang(2887) ;
  BProcessAll.Caption := GetTextLang(2885) ;
  LProcessList.Caption := GetTextLang(2886) ;
  LInvoiceDate.Caption := GetTextLang(2884) ;
  TSRepeatInvoice.Caption := GetTextLang(2883) ;
  tabEvent.Caption := GetTextLang(2403) ;
  self.Height := 484 ;

   


end;
{=====}

{ TVpEventEditDialog }

constructor TVpEventTCEditDialog.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  FPlacement.Position := mpCenterTop;
  FPlacement.Height := 415;
  FPlacement.Width  := 710;
end;
{=====}

function TVpEventTCEditDialog.Execute(Event: TVpEvent;
  TimeFormat: TVpTimeFormat = tf12Hour): Boolean;
var
 
  ResID : Integer ;
  DisableOk : Boolean ;
begin
  DisableOk := false ;
  if not ReadSysParam('BEditCalender',true,CurrentUser).AsBoolean then
     if Event.RecordID = -1 then exit
     else DisableOk := true  ;

  if DMTCCoreLink.ReadSysParam('cbEditOnlyOwnCalander',false,CurrentUser) then
     begin
       if DataStore.Resource.ResourceID <> DMTCCoreLink.ReadSysParam('CAL_USERDEF',-1,DMTCCoreLink.currentuser)  then
         if Event.RecordID = -1 then exit
          else
          DisableOk := true ;
     end;                                  

  ceEvent := Event;
  Application.CreateForm(TDlgEventTCEdit, MyDlgEventEdit);
  try

    DoFormPlacement(MyDlgEventEdit);
    SetFormCaption(MyDlgEventEdit, Event.Description, RSDlgEventEdit);
    MyDlgEventEdit.Event := Event;
    MyDlgEventEdit.TimeFormat := FTimeFormat;
    MyDlgEventEdit.Resource := DataStore.Resource;
    MyDlgEventEdit.CatColorMap := DataStore.CategoryColorMap;
    MyDlgEventEdit.PopulateDialog;
    MyDlgEventEdit.tsplugins.tag := Event.RecordID ;
    if Assigned(OnInitPlugins) then
      OnInitPlugins(MyDlgEventEdit.tsplugins) ;
    if DisableOk then
      begin
         MyDlgEventEdit.SetReadonly ;
      end;
     if AddInvoiceId <> 0 then
     begin
        MyDlgEventEdit.StartDate.Date := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select ddate from dochead where WDocid =' + IntToStr(AddInvoiceId)) ;
        MyDlgEventEdit.EndDate.Date :=MyDlgEventEdit.StartDate.Date ;


     end;
    MyDlgEventEdit.ShowModal;
    result := (MyDlgEventEdit.ReturnCode = rtCommit);
    if Result then begin
      MyDlgEventEdit.DePopulateDialog;
      DataStore.PostEvents;
    end;
    if Assigned(OnClosePlugins) then
      OnClosePlugins(MyDlgEventEdit.tsplugins) ;   
  finally
    MyDlgEventEdit.Free;
  end;
end;
{=====}

function TVpEventTCEditDialog.AddNewEvent(StartTime, EndTime: TDateTime): Boolean;
begin
  Result := false;
  if DataStore <> nil then begin
    ceEvent := DataStore.Resource.Schedule.AddEvent(
      DataStore.GetNextID(EventsTableName), StartTime, EndTime);
    if ceEvent <> nil then begin
      Result := Execute(ceEvent);
      if (not Result) or (ceEvent = nil) then
        ceEvent.Free;
    end;
  end;
end;
{=====}

procedure TDlgEventTCEdit.StartTimeExit(Sender: TObject);
var                                                                      
  ST : TDateTime;                                                        

begin                                                                    
  { Verify the value is valid                                          } 
  try                                                                    
    ST := StrToDateTime (StartDate.Text) +                               
          StrToDateTime (StartTime.Text);                                
  except                                                                 
    StartTime.Color := clRed;                                            
    StartTime.SetFocus;                                                  
    Exit;                                                                
  end;                                                                   
  StartTime.Color := clWindow;                                           

  { if the end time is less than the start time then change the end    } 
  {  time to  follow the start time by 30 minutes                      } 

  if ST > StrToDateTime (EndDate.Text) +                                 
          StrToDateTime (EndTime.Text) then begin                        
    if TimeFormat = tf24Hour then                                        
      EndTime.Text := FormatDateTime ('h:mm', ST + (30/MinutesInDay))    
    else                                                                 
      EndTime.Text := FormatDateTime ('hh:mm AM/PM',                     
                                      ST + (30/MinutesInDay));           
  end;                                                                   
end;                                                                     

procedure TDlgEventTCEdit.EndTimeExit(Sender: TObject);
var                                                                      
  ET : TDateTime;                                                        

begin                                                                    
  { Verify the value is valid                                          } 
  try                                                                    
    ET := STrToDateTime (EndDate.Text) + StrToDateTime (EndTime.Text);   
  except                                                                 
    EndTime.Color := clRed;                                              
    EndTime.SetFocus;                                                    
    Exit;                                                                
  end;                                                                   
  EndTime.Color := clWindow;                                             

  { if the end time is less than the start time then change the        } 
  { start time to precede the end time by 30 minutes                   } 

  if ET < StrToDateTime (StartDate.Text) +                               
          StrToDateTime (StartTime.Text) then begin                      
    if TimeFormat = tf24Hour then                                        
      StartTime.Text := FormatDateTime ('h:mm', ET - (30/MinutesInDay))
    else                                                                 
      StartTime.Text := FormatDateTime ('h:mm AM/PM',                    
                                        ET - (30/MinutesInDay));         
  end;                                                                   
end;                                                                     

procedure TDlgEventTCEdit.CategoryChange(Sender: TObject);
begin
  LSaveAndReopen.Visible := (Event.RecordID = -1) and (Category.ItemIndex = 1) ;
  TSRepeatInvoice.TabVisible := (Event.RecordID <> -1) and (Category.ItemIndex = 1) ;
  LEAccount.Visible := (Category.ItemIndex in [2,3,4,5,6,7,8,9 ]) ;
  EAccount.Visible := (Category.ItemIndex in [2,3,4,5,6,7,8,9 ]) ;
  case Category.ItemIndex of
   0 : begin

         // Standard appointment (no linkages)
       end;
   1 : begin
         DescriptionEdit.Text := gettextlang(2858);
       end;
   2 ,5,6,7,8,9 : begin
         LEAccount.Caption :=  gettextlang(31)+ ':';
        // Debtors appointment
       end;
   3 : begin
        LEAccount.Caption :=  gettextlang(30) + ':' ;
        // Creditors appointment
       end;
    4 : begin
        LEAccount.Caption :=  gettextlang(2330) + ':' ;
        // Houres registration
       end;
   end;
end;

procedure TDlgEventTCEdit.BNewClick(Sender: TObject);
var
  FormTaskEditDlg: TFormTaskEditDlg;
  ANode : TTreeNode ;
begin
  FormTaskEditDlg:= TFormTaskEditDlg.create(self);
    try
     dmDatabase.QTaskAction.Insert ;
     dmDatabase.QTaskActionEventId.AsInteger := Event.RecordID ;
     dmDatabase.QTaskActionWTypeId.AsInteger := 0 ;
     FormTaskEditDlg.showmodal ;
    finally

      FormTaskEditDlg.free ;
    end;
  RefreshTaskActionData ;
end;

procedure TDlgEventTCEdit.BEditClick(Sender: TObject);
var
  FormTaskEditDlg: TFormTaskEditDlg;
begin
  if dmDatabase.QTaskAction.IsEmpty then exit ;
  FormTaskEditDlg:= TFormTaskEditDlg.create(self);
    try
     dmDatabase.QTaskAction.Edit ;
     FormTaskEditDlg.showmodal ;
    finally

      FormTaskEditDlg.free ;
   end;
 RefreshTaskActionData ;
end;

procedure TDlgEventTCEdit.BDeleteClick(Sender: TObject);
begin
  if dmDatabase.QTaskAction.IsEmpty then exit ;
    dmDatabase.QTaskAction.delete ;
   RefreshTaskActionData ;
end;

procedure TDlgEventTCEdit.RefreshTaskActionData;
Var
 LastSelecteData : integer ;
begin
 LastSelecteData :=  dmDatabase.QTaskActionTaskActionID.AsInteger ;
 dmDatabase.QTaskAction.close ;
 dmDatabase.QTaskAction.sql.Text := SQLEventAction ;
 if Direction then
  dmDatabase.QTaskAction.sql.Add(' order by ' + IntToStr(OrderIndex))
else                                                 
  dmDatabase.QTaskAction.sql.Add(' order by ' + IntToStr(OrderIndex) +' desc')  ;
 dmDatabase.QTaskAction.Params[0].AsInteger := Event.RecordID ;
 dmDatabase.QTaskAction.Open ;
 dmDatabase.QTaskAction.Locate('TaskActionID',LastSelecteData,[]);
 {dmDatabase.QTaskAction.First ;
 while not dmDatabase.QTaskAction.Eof do
  begin
    if TaskArry[dmDatabase.QTaskActionWTypeId.AsInteger] = nil then
      begin
         case TActionType(dmDatabase.QTaskActionWTypeId.AsInteger) of
             atCopyInvoice : TaskArry[dmDatabase.QTaskActionWTypeId.AsInteger] := TVTasksAction.Items.AddObject(nil,'Copy invoice',Pointer(-1)) ;
             acCopyInvoiceToGroup : TaskArry[dmDatabase.QTaskActionWTypeId.AsInteger] := TVTasksAction.Items.AddObject(nil,'Copy invoice to group1',Pointer(-2))  ;
         end;
      end;
    case TActionType(dmDatabase.QTaskActionWTypeId.AsInteger) of
         atCopyInvoice : begin
                            TVTasksAction.Items.AddChildObject(TaskArry[dmDatabase.QTaskActionWTypeId.AsInteger],dmDatabase.QTaskActionSACCOUNTCODE.AsString +' \ ' + dmDatabase.QTaskActionSDescription_1.AsString  + '->' + dmDatabase.QTaskActionSDocNo.AsString,Pointer(dmDatabase.QTaskActionTaskActionID.AsInteger));
                         end;
         acCopyInvoiceToGroup : begin
                                  TVTasksAction.Items.AddChildObject(TaskArry[dmDatabase.QTaskActionWTypeId.AsInteger],dmDatabase.QTaskActionSDescription.AsString +   '->' + dmDatabase.QTaskActionSDocNo.AsString,Pointer(dmDatabase.QTaskActionTaskActionID.AsInteger));
                                end;
    end;
     dmDatabase.QTaskAction.next ;
  end; // end while

  for i:= 0 to TVTasksAction.Items.Count -1 do
    begin
       if Integer(TVTasksAction.Items[i].Data) = LastSelecteData then
          begin
             TVTasksAction.Items[i].Selected := true ;
             TVTasksAction.Items[i].Expand(true);
             exit ;
          end;
    end;   }
end;

procedure TDlgEventTCEdit.pgEventChange(Sender: TObject);
begin
  RefreshTaskActionData ;
  Event.Changed := true ;
end;

procedure TDlgEventTCEdit.BProcessSelectedClick(Sender: TObject);
begin
  SetProgress(gettextlang(1255),1);
  try
  if dmDatabase.QTaskAction.IsEmpty then exit ;
  HandelTaskActionRecord ;
  finally
     SetProgress(-1);
  end;
  OSFMessageDlg(gettextlang(2894),mtConfirmation,[mbyes],0);
end;

procedure TDlgEventTCEdit.HandelTaskActionRecord;
var i,NewDocId : Integer ;
    
begin
    i := 0 ;
    case TActionType(dmDatabase.QTaskActionWTypeId.AsInteger) of
         atCopyInvoice : begin
                            CopyDocument(dmDatabase.QTaskActionInvoiceID.AsInteger,dmDatabase.QTaskActionAccountId.AsInteger, 0,false,nil,DTInvoiceDate.date,false,NewDocId,EMessage1.text,EMessage2.text,EMessage3.text);
                         end;
         acCopyInvoiceToGroup : begin

                                   try
                                  dmDatabase.qGenII.sql.Text := 'Select WAccountId from Account where WAccountTypeID = 1 and WReportingGroup1ID = ' + InTTOStr(dmDatabase.QTaskActionWGroupId.AsInteger) ;
                                  dmDatabase.qGenII.open ;
                                  SetProgress(gettextlang(1255),dmDatabase.qGenII.RecordCount);
                                  while not dmDatabase.qGenII.eof do
                                     begin
                                        inc(i);
                                       SetProgress('',i);
                                       CopyDocument(dmDatabase.QTaskActionInvoiceID.AsInteger,dmDatabase.qGenII.fields[0].AsInteger, 0,false,nil,DTInvoiceDate.date,false,NewDocId,EMessage1.text,EMessage2.text,EMessage3.text,'',true);
                                       dmDatabase.qGenII.Next ;
                                     end;
                                   dmDatabase.qGenII.close ;
                                   finally
                                      SetProgress(-1);
                                   end ;
                                end;
    end;
end;

procedure TDlgEventTCEdit.BProcessAllClick(Sender: TObject);
begin
  if dmDatabase.QTaskAction.IsEmpty then exit ;
  dmDatabase.QTaskAction.first ;
  While not dmDatabase.QTaskAction.eof do
    begin
      HandelTaskActionRecord ;
      dmDatabase.QTaskAction.next ;
    end;
  OSFMessageDlg(gettextlang(2894),mtConfirmation,[mbyes],0);
end;

procedure TDlgEventTCEdit.EAccountEnter(Sender: TObject);
var
  oldCode,oldDesc : String ;
begin
 FmLookup.IsShowForm := false ;
  case Category.ItemIndex of
   2,5,6,7,8,9 :  CallLookup(EAccount.Tag, 3);
   3 :  CallLookup(EAccount.Tag, 4);
   4 :  CallLookup(EAccount.Tag, 3);
   end;
GetAccountCodeDesc(EAccount.Tag,oldCode,oldDesc);
EAccount.Tag := ReturnID ;
if EAccount.Tag = 0 then EAccount.tag := -1 ;
InitAccountText ;
if (DescriptionEdit.Text <> '')
  and (DescriptionEdit.Text =  oldCode +' | ' +  oldDesc + ' | ' + cbSalesmen.Text + ' | ' + cbProject.Text) then
   DescriptionEdit.Text :=  EAccount.Text + ' | ' + cbSalesmen.Text + ' | ' + cbProject.Text;

CBAllDay.SetFocus ;
end;

procedure TDlgEventTCEdit.InitAccountText;
var
 Code,Desc : String ;
begin
GetAccountCodeDesc(EAccount.Tag,Code,Desc);
EAccount.Text :=  '' ;
if  (Code <> '') or (Desc <> '' ) then
EAccount.Text :=  Code +' | ' +  Desc ;
if DescriptionEdit.Text = '' then
 if EAccount.Text <> '' then
   DescriptionEdit.Text :=  EAccount.Text + ' | ' + cbSalesmen.Text + ' | ' + cbProject.Text ;
InitLocationList;
end;


procedure TDlgEventTCEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmDatabase.QTaskAction.close ;
end;

procedure TDlgEventTCEdit.DBGrid1TitleClick(Column: TColumn);
begin
 OrderIndex := Column.Field.Index + 1 ;
 Direction := not Direction ;
 RefreshTaskActionData ;
end;

procedure TDlgEventTCEdit.DBGrid1DblClick(Sender: TObject);
begin
 BEditClick(self);
end;

procedure TDlgEventTCEdit.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 Look  := look + Key ;
 if DBGrid1.SelectedField <> nil then
    begin
      if not dmDatabase.QTaskAction.Locate(DBGrid1.SelectedField.FieldName,look,[loCaseInsensitive, loPartialKey]) then
        look := '' ;
    end;
end;

procedure TDlgEventTCEdit.DBGrid1ColEnter(Sender: TObject);
begin
 look := '' ;
end;

procedure TDlgEventTCEdit.SetReadonly;
var
 i : integer ;
begin
  for i := 0 to Componentcount -1 do
    if IsPublishedProp(Components[i],'enabled') then
     if not ((Components[i] is TPanel)
          or (Components[i] is TButton)
          or (Components[i] is TTabSheet)
          or (Components[i] is TPageControl)) then
     begin
       SetOrdProp(Components[i],'enabled',0);
     end;
  NotesMemo.enabled := true ;
end;

procedure TDlgEventTCEdit.EndTimeDropDown(Sender: TObject);
begin
  EndTime.ItemIndex := EndTime.Items.IndexOf(EndTime.text);
end;

procedure TDlgEventTCEdit.StartTimeDropDown(Sender: TObject);
begin
  StartTime.ItemIndex := StartTime.Items.IndexOf(StartTime.text);
end;

procedure TDlgEventTCEdit.cbSalesmenChange(Sender: TObject);
begin
if Category.ItemIndex <  2 then exit ;


if EAccount.Text <> '' then
if (DescriptionEdit.Text <> '')
  and (pos(EAccount.Text,DescriptionEdit.Text) = 1) then
      DescriptionEdit.Text :=  EAccount.Text + ' | ' + cbSalesmen.Text + ' | ' + cbProject.Text;
end;

procedure TDlgEventTCEdit.cbProjectChange(Sender: TObject);
begin
if EAccount.Text <> '' then 
if (DescriptionEdit.Text <> '')
  and (pos(EAccount.Text,DescriptionEdit.Text) = 1) then
      DescriptionEdit.Text :=  EAccount.Text + ' | ' + cbSalesmen.Text + ' | ' + cbProject.Text;

end;

procedure TVpEventTCEditDialog.AfterSave(sender : TDataset);
var
 i : Integer ;
begin
 
   if Assigned(OnSavePlugin) then
      OnSavePlugin(sender) ;
end;

procedure TVpEventTCEditDialog.SetOnInitPlugins(const Value: TNotifyEvent);
begin
  FOnInitPlugins := Value;
end;

procedure TVpEventTCEditDialog.SetOnSavePlugin(const Value: TNotifyEvent);
begin
  FOnSavePlugin := Value;
end;

procedure TVpEventTCEditDialog.SetOnClosePlugins(
  const Value: TNotifyEvent);
begin
  FOnClosePlugins := Value;
end;

procedure TDlgEventTCEdit.InitLocationList;
var
 aQuery : TuniQuery ;
begin
  cbLocation.Clear ;
  aQuery := TuniQuery.Create(nil) ;
  try
    aQuery.Connection := DMTCCoreLink.TheZConnection ;
    aQuery.SQL.Text := 'select debtor.SPOSTAL1 ,debtor.SPOSTAL2,debtor.SPOSTAL3,debtor.SPOSTALCODE '+
    ' from debtor where SPOSTAL1 <> '+QuotedStr('')+' and  debtor.Waccountid = ' + IntToStr(EAccount.Tag) +
    ' union select debtor.SDELIVERY1 ,debtor.SDELIVERY2,debtor.SDELIVERY3,debtor.SDELIVERYCODE '+
    ' from debtor where SDELIVERY1 <> '+QuotedStr('')+' and  debtor.Waccountid = ' + IntToStr(EAccount.Tag) +
    ' union select debtor.SPOSTAL1 ,debtor.SPOSTAL2,debtor.SPOSTAL3,debtor.SPOSTALCODE ' +
    ' from creditor debtor where SPOSTAL1 <> '+QuotedStr('')+' and  debtor.Waccountid = ' + IntToStr(EAccount.Tag) +
    ' union select debtor.SDELIVERY1 ,debtor.SDELIVERY2,debtor.SDELIVERY3,debtor.SDELIVERYCODE '+ 
    ' from creditor debtor where SDELIVERY1 <> '+QuotedStr('')+' and  debtor.Waccountid = ' + IntToStr(EAccount.Tag) ;
    aQuery.open ;
    while not aQuery.Eof do
       begin
         cbLocation.AddItem(trim(trim(aQuery.Fields[0].AsString) + ' ' + aQuery.Fields[3].AsString) +' ' + Trim(Trim(aQuery.Fields[2].AsString)  +' ' + aQuery.Fields[1].AsString) ,nil);
         aQuery.next ;
       end;
  finally
   aQuery.free ;
  end;
 
end;

end.


