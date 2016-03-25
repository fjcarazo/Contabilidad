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

unit TCDayPlanner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Menus, Buttons, ImgList, Printers, TypInfo,

  VpBase, VpMisc, VpNavBar, VpContactGrid, VpBaseDS, VpTaskList, VpDBDS, VpBDEDS,
  VpMonthView, VpDayView, VpDlg, VpResEditDlg, VpTaskEditDlg, VpContactEditDlg,
  VpEvntEditDlg, VpData, VpLEDLabel, VpClock, VpWeekView, VpPrtPrvDlg, VpPrtFmt,
  VpPrtFmtCBox, VpEdPop, VpDateEdit, VpPrtFmtDlg, VpContactButtons,
  ToolWin, ActnMan, ActnCtrls, DB, VpFlxDS, ActnList,VpResTCEditDlg, VpTaskTCEditDlg,
  VpContactTCEditDlg,VpTCEvntEditDlg,VpSRVars,VpTCAlarmDlg,
  XPStyleActnCtrls,   DBAccess , Uni, Tabs,TcashClasses,UpluginsSharedUnit,NewProgress,
  MemDS, cxGraphics;
                                  
type
 twf_TosFDayView  = class (TWorkFlowImplementBase)
  public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
 end;

  TosFDayView = class(TVpDayView) ;
  TPlanerMainForm = class(TForm)
    ImageList1: TImageList;
    mnuAddScheduleItem: TMenuItem;
    mnuDeleteScheduleItem: TMenuItem;
    mnuDeleteTask: TMenuItem;
    mnuEditScheduleItem: TMenuItem;
    mnuEditTask: TMenuItem;
    mnuNewTask: TMenuItem;
    OpenDialog1: TOpenDialog;
    PanelHeader: TPanel;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SchedulePopup: TPopupMenu;
    StatusBar1: TStatusBar;
    TaskPopup: TPopupMenu;
    VpControlLink1: TVpControlLink;
    VpNavBar1: TVpNavBar;
    VpPrintFormatEditDialog1: TVpPrintFormatEditDialog;
    VpPrintPreviewDialog1: TVpPrintPreviewDialog;
    VpFlexDataStore1: TVpFlexDataStore;
    DSTasks: TDataSource;
    DSContacts: TDataSource;
    DSEvents: TDataSource;
    DSResources: TDataSource;
    QGen: TuniQuery;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    PMUren: TPopupMenu;
    CreateInvoiceOnHoures: TMenuItem;
    BaddEdit: TBitBtn;
    TSResAction: TTabSet;
    ScrollBox1: TScrollBox;
    PanelBase: TPanel;
    PanelContacts: TPanel;
    VpContactGrid1: TVpContactGrid;
    VpContactButtonBar1: TVpContactButtonBar;
    PanelTasks: TPanel;
    VpTaskList1: TVpTaskList;
    PanelFunction: TPanel;
    PanelDisplay: TPanel;
    LabelHeader: TLabel;
    HeaderImage: TImage;
    PanelCalendar: TPanel;
    Splitter1: TSplitter;
    PanelCalSplit2: TPanel;
    Splitter2: TSplitter;
    VpMonthView1: TVpMonthView;
    VpTaskList2: TVpTaskList;
    PanelCalSplit1: TPanel;
    VpDayView1: TVpDayView;
    PanelDayCount: TPanel;
    LabelDayCount: TLabel;
    Ltimeslot: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    PanelMaintResources: TPanel;
    Bevel1: TBevel;
    BtnAddRes: TSpeedButton;
    BtnDelRes: TSpeedButton;
    LabelResID: TLabel;
    LabelDescription: TLabel;
    LabelNotes: TLabel;
    LabelResource: TLabel;
    EditResID: TEdit;
    EditResDescr: TEdit;
    MemoResNotes: TMemo;
    VpResourceCombo1: TVpResourceCombo;
    BitBtn7: TBitBtn;
    BEditSpecialDayEvents: TButton;
    BitBtn8: TBitBtn;
    Plugins1: TMenuItem;
    ChangetoAgenda1: TMenuItem;
    PChangeResource: TPanel;
    BokResChange: TBitBtn;
    bCancelResChange: TBitBtn;
    Label2: TLabel;
    cbChangeToBox: TComboBox;
    BCreateInvoiceOnHoures: TButton;
    BitBtn3: TBitBtn;
    Boutlook: TButton;
    bManual: TBitBtn;
    Invoice1: TMenuItem;

    procedure FormCreate(Sender: TObject);

    procedure BtnAddResClick(Sender: TObject);
    procedure BtnDelResClick(Sender: TObject);
    procedure EditResDescrChange(Sender: TObject);

    procedure mnuAddScheduleItemClick(Sender: TObject);
    procedure mnuDeleteScheduleItemClick(Sender: TObject);
    procedure mnuDeleteTaskClick(Sender: TObject);
    procedure mnuEditScheduleItemClick(Sender: TObject);
    procedure mnuEditTaskClick(Sender: TObject);
    procedure mnuFileExitClick(Sender: TObject);
    procedure mnuFileLoadPrintFormatsClick(Sender: TObject);
    procedure mnuFilePrintClick(Sender: TObject);
    procedure mnuFilePrintPreviewClick(Sender: TObject);
    procedure mnuFilePrintSetupClick(Sender: TObject);
    procedure mnuFileReportSetupClick(Sender: TObject);
    procedure mnuHelpAboutClick(Sender: TObject);
    procedure mnuMaintResourcesClick(Sender: TObject);
    procedure mnuNewTaskClick(Sender: TObject);

    procedure ResChange(Sender: TObject);

    procedure TrackBar1Change(Sender: TObject);

    procedure VpFlexDataStore1ResourceChange(Sender: TObject; Resource: TVpResource);
    procedure VpNavBar1FolderChange(Sender: TObject; Index: Integer; var AllowChange: Boolean; Dragging: Boolean);
    procedure VpNavBar1ItemClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; Index: Integer);
    procedure mnuFileEditPrintFormatsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure VpDayView1OwnerEditEvent(Sender: TObject; Event: TVpEvent;
      Resource: TVpResource; var AllowIt: Boolean);
    procedure VpTaskList2OwnerEditTask(Sender: TObject; Task: TVpTask;
      Resource: TVpResource; var AllowIt: Boolean);
    procedure VpContactGrid1OwnerEditContact(Sender: TObject;
      Contact: TVpContact; Resource: TVpResource; var AllowIt: Boolean);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure VpControlLink1NoLocalizationFile(Sender: TObject;
      FileName: String);
    procedure VpFlexDataStore1Alert(Sender: TObject; Event: TVpEvent);
    procedure TrackBar2Change(Sender: TObject);
    procedure VpDayView1OwnerDrawColHeader(Sender: TObject;
      const Canvas: TCanvas; R: TRect; var Drawn: Boolean);
    procedure CreateInvoiceOnHouresClick(Sender: TObject);
    procedure TSResActionChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure MemoResNotesDblClick(Sender: TObject);
    procedure BEditSpecialDayEventsClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure VpFlexDataStore1Connect(Sender: TObject);
    procedure ChangetoAgenda1Click(Sender: TObject);
    procedure TaskPopupPopup(Sender: TObject);
    procedure PChangeResourceExit(Sender: TObject);
    procedure bCancelResChangeClick(Sender: TObject);
    procedure BokResChangeClick(Sender: TObject);
    procedure cbChangeToBoxKeyPress(Sender: TObject; var Key: Char);
    procedure VpFlexDataStore1SetFilterCriteria(aTable: TDataSet;
      aUseDateTime: Boolean; aResourceID: Integer; aStartDateTime,
      aEndDateTime: TDateTime);
    procedure BoutlookClick(Sender: TObject);
    procedure bOutlookToosFClick(Sender: TObject);
    function VpFlexDataStore1GetNextID(Sender: TObject;
      TableName: String): Integer;
    procedure bManualClick(Sender: TObject);
    procedure Invoice1Click(Sender: TObject);

  private
    APluginList : TStringlist ;
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;
    VpNotificationDialog : TTCVpNotificationDialog ;
    VpEventEditDialog1: TVpEventTCEditDialog;
    VpResourceEditDialog1 : TVpResourceEditTCDialog;
    VpTaskEditDialog1   : TVpTaskTCEditDialog;
    VpContactEditDialog1 : TVpContactTCEditDialog ;
    LastResourceID,LastPage : Integer ;
    AosfProgress : TfmNewProgress ;
    aOSFSpecialDaysCollection : TOSFSpecialDaysCollection ;
    DefUserResID : Integer ;
    procedure DoPrintCurrent;
    procedure SetActivePage(Page: Integer);
    procedure LoadFormats;
    procedure MakeDefaultFormats;
    procedure InitPlugins;
    procedure InitPluginsOnPagecontrol;
    procedure OnMenuPluginAct1(Sender: TObject);

    procedure InitpluginsInEvent(Sender : Tobject) ;
    procedure SavepluginsInEvent(Sender : Tobject) ;
    procedure UnloadpluginsInEvent(Sender : Tobject) ;

  public
    AddInvoiceId : Integer ;
    procedure VpOnGetSpecialDate (Sender : TObject; ADate  : TDateTime; var IsSpecialDate  : Boolean;var DayText : String ;var SpecialColor : Integer ) ;
  end;



const
  CalendarPage      = 0;
  ContactsPage      = 1;
  TasksPage         = 2;
  MaintResourcePage = 10;

implementation

uses
  ExVpRptSetup, ExVpAbout, Database,DatabaseAccess, TcVariables,
  UDMTCCoreLink, DateUtils, UFromToDates, OSFGeneralRoutines, variants,
  UEditSpecialDays,comobj, UOutLookEmailForm, UEventList, InvoiceEntryGrid;


{$R *.DFM}
 procedure TPlanerMainForm.InitPluginsOnPagecontrol;
var
 i :  Integer ;
 AForm: TForm ;
 ReturnString : Array [0..1025] of char ;
 APChar : PChar ;
  AMenuitem : TMenuitem ;
begin




  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
         AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'EVENTS');
         APChar := ReturnString ;
         AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
         AFormPluginRecordArray[i].aUnLoadFormPlugin(AForm) ;
         if Assigned(AFormPluginRecordArray[i].aContextmenuEnabled) then
            begin
             AMenuitem := TMenuitem.Create(Plugins1) ;
             Plugins1.Add(AMenuitem);
             AMenuitem.Caption := ReturnString ;
             AMenuitem.tag := i ;
             AMenuitem.OnClick := OnMenuPluginAct1;
            end;
            
      end;

  Plugins1.Caption := DMTCCoreLink.GetTextLangNoAmp(1805);
  Plugins1.Visible := Plugins1.Count > 0 ;

 mnuNewTask.Caption := RSDayPopupAdd ;
 mnuEditTask.Caption := RSDayPopupEdit ;
 mnuDeleteTask.Caption := RSDayPopupDelete ;

end;

procedure TPlanerMainForm.Invoice1Click(Sender: TObject);
var
ainf : TfmInvoiceEntryGrid ;
begin
 if not Assigned(VpDayView1.ActiveEvent) then exit ;
 if VpDayView1.ActiveEvent.WAccountID = 0 then exit ;
 ainf := TfmInvoiceEntryGrid.Create(self) ;
 try
    idDocType := 10 ;
    ainf.AddInvoiceForAccount := VpDayView1.ActiveEvent.WAccountID ;
    ainf.ShowModal ;
 finally
  ainf.free ;
 end;
end;

procedure TPlanerMainForm.OnMenuPluginAct1(Sender: TObject);
var
 AMessage : String ;
  AForm : TForm ;

begin
 if not Assigned(VpDayView1.ActiveEvent) then exit ;

 AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'EVENTS') ;
 try


 AMessage := 'CONTEXT=' + IntToStr(VpDayView1.ActiveEvent.RecordID) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));
 finally
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aUnLoadFormPlugin(AForm) ;
 end;

end;


procedure TPlanerMainForm.InitPlugins;
var
 i , IncArr,Ins : Integer ;
 ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin

  IncArr := 0 ;
  IsEnable := false ;
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
   if AFormPluginRecordArray[i].aForm <> nil then
    begin
       AFormPluginRecordArray[i].aUnLoadFormPlugin(AFormPluginRecordArray[i].aForm);
       AFormPluginRecordArray[i].aInst := 0 ;
       AFormPluginRecordArray[i].aForm := nil ;

    end;
 


  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > high(AFormPluginRecordArray)  then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToAgendaRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormPluginRecordArray[IncArr].ainst := Ins ;
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aDocSearch := GetProcAddress(Ins, OSFDEBTORSEARCHRoutineName);
            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('EVENTS',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);



              end ;

             if IsEnable then
               begin
               inc(IncArr) ;
               end else
            begin
              @AFormPluginRecordArray[IncArr].aLoadFormPlugin := nil ;
              @AFormPluginRecordArray[IncArr].aMessageFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin  := nil ;
              @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := nil ;
              @AFormPluginRecordArray[IncArr].aPluginEnabled   := nil ;
            end;
        end;
    end;
   InitPluginsOnPagecontrol ;
end;

procedure TPlanerMainForm.FormCreate(Sender: TObject);
var
  //Bmp : TBitmap;
   i,GotoIndex : Integer ;

begin
 Boutlook.Visible := DMTCCoreLink.IsRegistered('{53E33124-F821-47DE-AE00-31CCB785B228}');
 APluginList := TStringlist.create ;
 Boutlook.Caption := DMTCCoreLink.GetTextLang(3475);
 if Uppercase(TDatabaseRegistyRoutines.ReadOsfIni('settings','smallicons','')) = 'TRUE' then
 begin
   ImageList1.Height := 32 ;
   ImageList1.Width := 32 ;
   bManual.Width := 60 ;
   VpNavBar1.Width := 70 ;
 end else
  if Uppercase(TDatabaseRegistyRoutines.ReadOsfIni('settings','largeicons','')) = 'TRUE' then
 begin
   ImageList1.Height := 48 ;
   ImageList1.Width := 48 ;
   bManual.Width := 140 ;
   VpNavBar1.Width := 150 ;
 end;
 aOSFSpecialDaysCollection := TOSFSpecialDaysCollection.create(self,TOSFSpecialDaysItem) ;
  { Load ImageList from the resource }
 { Bmp := TBitmap.Create;
  try
    Bmp.Handle := LoadBitmap(hInstance, 'ROLODEX');
    ImageList1.AddMasked(Bmp, clOlive);
    Bmp.Handle := LoadBitmap(hInstance, 'TODOLIST');
    ImageList1.AddMasked(Bmp, clOlive);
    Bmp.Handle := LoadBitmap(hInstance, 'JOURNAL');
    ImageList1.AddMasked(Bmp, clOlive);
    Bmp.Handle := LoadBitmap(hInstance, 'CALENDAR');
    ImageList1.AddMasked(Bmp, clOlive);
    Bmp.Handle := LoadBitmap(hInstance, 'PEOPLE');
    ImageList1.AddMasked(Bmp, clOlive);
  finally
    Bmp.Free;
  end;    }

  SetActivePage(CalendarPage);
  MakeDefaultFormats;
  HeaderImage.AutoSize := True;
  VpEventEditDialog1 := TVpEventTCEditDialog.Create(self) ;
  dmDatabase.QEvents.AfterEdit := VpEventEditDialog1.AfterSave;
  VpEventEditDialog1.OnSavePlugin := SavepluginsInEvent ;
  VpEventEditDialog1.OnInitPlugins := InitpluginsInEvent  ;
  VpEventEditDialog1.OnClosePlugins := UnloadpluginsInEvent ;
  VpResourceEditDialog1 := TVpResourceEditTCDialog.Create(self) ;
  VpTaskEditDialog1   := TVpTaskTCEditDialog.Create(self) ;
  VpContactEditDialog1 := TVpContactTCEditDialog.Create(self) ;
  VpContactEditDialog1.Placement.Height := 500 ;
  VpNotificationDialog := TTCVpNotificationDialog.Create(self) ;
  VpNotificationDialog.DataStore := VpFlexDataStore1;
  VpEventEditDialog1.DataStore := VpFlexDataStore1;
  VpResourceEditDialog1.DataStore := VpFlexDataStore1;
  VpTaskEditDialog1.DataStore := VpFlexDataStore1;
  VpContactEditDialog1.DataStore := VpFlexDataStore1;
  self.Color := MainPanelColor ;
   VpNavBar1.BackgroundColor := MainPanelColor ;
   VpTaskList1.TaskHeadAttributes.Color := MainPanelColor ;
   VpDayView1.HeadAttributes.Color := MainPanelColor ;
   VpMonthView1.DayHeadAttributes.Color := MainPanelColor ;
   VpTaskList2.TaskHeadAttributes.Color := MainPanelColor ;
   VpContactButtonBar1.Color:= MainColor ;
   //VpContactGrid1.Color:= MainPanelColor ;
   PanelDayCount.Color:= MainColor ;
  PanelDisplay.Color := MainPanelColor ;
   for i:= 0 to ComponentCount -1 do
    if Components[i] is TPanel then
       TPanel(Components[i]).Color := MainPanelColor ;


 //   VpDayView1.NumDays := ;
 TrackBar1.Position  := DMTCCoreLink.ReadNwReportOp('PLAN_DAYPOS',1) ;
 TrackBar2.Position  := DMTCCoreLink.ReadNwReportOp('PLAN_TIMESLOT',5) ;
 PanelCalSplit1.Width :=  DMTCCoreLink.ReadNwReportOp('PLAN_PANELCAL',PanelCalSplit1.Width) ;


 VpMonthView1.Height  :=  DMTCCoreLink.ReadNwReportOp('PLAN_MONTHVIEW',VpMonthView1.Height) ;
 PanelHeader.Visible := DMTCCoreLink.ReadNwReportOp('AGENDA_MUON',false) ;
{ if PanelHeader.Visible then
  begin
   PanelHeader.Visible := not DMTCCoreLink.ReadSysParam('cbEditOnlyOwnCalander',false,WUserID) ;
  end;}
  VpDayView1.OnGetSpecialDate := VpOnGetSpecialDate ;
  GotoIndex := 0 ;
  VpFlexDataStore1.Load  ;
  if VpFlexDataStore1.Resources.Count > 1 then
  begin
  TSResAction.Tabs.clear ;
   for i := 0 to VpFlexDataStore1.Resources.count -1 do
     begin
       if VpFlexDataStore1.Resources.Items[i].Description <> '' then
          TSResAction.Tabs.AddObject(VpFlexDataStore1.Resources.Items[i].Description,TObject(VpFlexDataStore1.Resources.Items[i].ResourceID)) ;
     if VpFlexDataStore1.Resource <> nil then
       if VpFlexDataStore1.Resource.ResourceID =  VpFlexDataStore1.Resources.Items[i].ResourceID then
         GotoIndex := i   ;

     end;
    TSResAction.TabIndex := GotoIndex ;

  end;
  InitPlugins ;


end;
{=====}
procedure TPlanerMainForm.BtnAddResClick(Sender: TObject);
begin
  VpResourceEditDialog1.AddNewResource;
  VpResourceCombo1.DataStore := nil ;
  VpResourceCombo1.DataStore := VpFlexDataStore1;

end;
{=====}
procedure TPlanerMainForm.BtnDelResClick(Sender: TObject);
begin
 If VpFlexDataStore1.Resource.ResourceID < 2 then
    raise Exception.Create('You cannot delete this resource!');
   VpFlexDataStore1.Resource.Deleted := true ;
   VpFlexDataStore1.PostResources ;
   VpFlexDataStore1.RefreshResource ;
end;
{=====}
procedure TPlanerMainForm.DoPrintCurrent;
begin


  if PrintDialog1.Execute then begin
    Printer.BeginDoc;

    VpControlLink1.Printer.DayView := VpDayView1 ;
  if ReportData.Format <> '' then
      begin
       VpControlLink1.Printer.CurFormat := VpControlLink1.Printer.Find(ReportData.Format);
       VpControlLink1.Printer.Print(Printer, ReportData.StartDate, ReportData.EndDate) ;
       ReportData.Format:= '' ;
    end
    else
    VpControlLink1.Printer.Print(Printer, trunc(VpDayView1.Date), trunc(VpDayView1.Date + (TrackBar1.Position-1))) ;
    Printer.EndDoc;
  end;
end;
{=====}
procedure TPlanerMainForm.EditResDescrChange(Sender: TObject);
begin

end;
{=====}
procedure TPlanerMainForm.LoadFormats;
begin
  if OpenDialog1.Execute then begin
    VpControlLink1.Printer.LoadFromFile(OpenDialog1.FileName, False);
  end;
end;
{=====}
procedure TPlanerMainForm.MakeDefaultFormats;
var
  NewFormat : TVpPrintFormatItem;
  NewElement : TVpPrintFormatElementItem;
  it : TVpItemType;
  Nm : string;
begin
  for it := Low(TVpItemType) to High(TVpItemType) do begin
    { portrait layout }
    NewFormat := TVpPrintFormatItem(VpControlLink1.Printer.PrintFormats.Add);
    Nm := GetEnumName(TypeInfo(TVpItemType), Ord(it));
    NewFormat.FormatName := Copy(Nm, 3, Length(Nm) - 2) + ' Format Test (portrait)';
    NewElement := TVpPrintFormatElementItem(NewFormat.Elements.Add);
    NewElement.ElementName := 'Element 1';
    NewElement.ItemType := it;

    { landscape layout }
    NewFormat := TVpPrintFormatItem(VpControlLink1.Printer.PrintFormats.Add);
    Nm := GetEnumName(TypeInfo(TVpItemType), Ord(it));
    NewFormat.FormatName := Copy(Nm, 3, Length(Nm) - 2) + ' Format Test (landscape)';
    NewElement := TVpPrintFormatElementItem(NewFormat.Elements.Add);
    NewElement.ElementName := 'Element 1';
    NewElement.ItemType := it;
    NewElement.Rotation := ra270;
  end;
end;
{=====}
procedure TPlanerMainForm.mnuAddScheduleItemClick(Sender: TObject);
var
  StartTime, EndTime : TDateTime;
begin
  StartTime := LineToStartTime(vpDayView1.ActiveRow, vpDayView1.Granularity);
  EndTime := LineToStartTime(vpDayView1.ActiveRow + 1, vpDayView1.Granularity);
  VpEventEditDialog1.AddInvoiceId := AddInvoiceId ;
  AddInvoiceId := 0 ;
  VpEventEditDialog1.AddNewEvent(StartTime, EndTime);
end;
{=====}
procedure TPlanerMainForm.mnuDeleteScheduleItemClick(Sender: TObject);
begin
  if (VpDayView1.ActiveRow > -1) and (VpDayView1.ActiveCol > -1) then
    VpDayView1.DeleteActiveEvent(True)
  else
    ShowMessage('You must select a schedule item to delete');
end;
{=====}
procedure TPlanerMainForm.mnuDeleteTaskClick(Sender: TObject);
begin
  TosFDayView(VpDayView1).PopupDeleteEvent(Sender);
end;
{=====}
procedure TPlanerMainForm.mnuEditScheduleItemClick(Sender: TObject);
var
  StartTime, EndTime : TDateTime;
begin
  StartTime := LineToStartTime(VpDayView1.ActiveRow, VpDayView1.Granularity);
  EndTime := LineToStartTime(VpDayView1.ActiveRow + 1, VpDayView1.Granularity);

  if Assigned(VpDayView1.ActiveEvent) then
    VpEventEditDialog1.Execute(VpDayView1.ActiveEvent)
  else
    VpEventEditDialog1.AddNewEvent(StartTime, EndTime);
end;
{=====}
procedure TPlanerMainForm.mnuEditTaskClick(Sender: TObject);
begin

  TosFDayView( VpDayView1).PopupEditEvent(Sender);
end;
{=====}
procedure TPlanerMainForm.mnuFileExitClick(Sender: TObject);
begin
  Close;
end;
{=====}
procedure TPlanerMainForm.mnuFileLoadPrintFormatsClick(Sender: TObject);
begin
  LoadFormats;
end;
{=====}
procedure TPlanerMainForm.mnuFilePrintClick(Sender: TObject);
begin
  DoPrintCurrent;
end;
{=====}
procedure TPlanerMainForm.mnuFilePrintPreviewClick(Sender: TObject);
begin

end;
{=====}
procedure TPlanerMainForm.mnuFilePrintSetupClick(Sender: TObject);
begin

end;
{=====}
procedure TPlanerMainForm.mnuFileReportSetupClick(Sender: TObject);
var
  frmReportSetup: TfrmReportSetup;
begin
  frmReportSetup:= TfrmReportSetup.Create(nil);
  try
  frmReportSetup.StartDate := VpMonthView1.Date;
  frmReportSetup.EndDate := VpMonthView1.Date;
  frmReportSetup.ControlLink := VpControlLink1;
  frmReportSetup.Execute;
  finally
    frmReportSetup.Free ;
  end;
end;
{=====}
procedure TPlanerMainForm.mnuHelpAboutClick(Sender: TObject);
var
  frmAbout : TfrmAbout;
begin
   frmAbout := TfrmAbout.create(nil);
   try
  // Display about box
  frmAbout.Execute;
   finally
     frmAbout.free ;
   end;
end;
{=====}
procedure TPlanerMainForm.mnuMaintResourcesClick(Sender: TObject);
begin
  SetActivePage(10);
 // VpNavBar1.ActiveFolder := 1;
end;
{=====}
procedure TPlanerMainForm.mnuNewTaskClick(Sender: TObject);
begin
  TosFDayView(VpDayView1).PopupAddEvent(Sender);
end;
{=====}
procedure TPlanerMainForm.ResChange(Sender: TObject);
begin

end;
{=====}
procedure TPlanerMainForm.SetActivePage(Page: Integer);
var
  Bmp: TBitmap;
  i : Integer ;
begin
  PanelCalendar.Visible := False;
  PanelCalendar.Align := alClient;

  PanelContacts.Visible := False;
  PanelContacts.Align := alClient;


  PanelTasks.Visible := False;
  PanelTasks.Align := alClient;

  PanelMaintResources.Visible := False;
  PanelMaintResources.Align := alClient;
  if (LastPage = 1) and (Page <> 1) then
     begin
      for i := 0 to VpFlexDataStore1.Resources.Count -1 do
       if VpFlexDataStore1.Resources.Items[i].ResourceID  = LastResourceID then
        begin
          VpFlexDataStore1.Resource :=  VpFlexDataStore1.Resources.Items[i] ;
          VpResourceCombo1.ItemIndex := i ;
          PanelHeader.Visible := DMTCCoreLink.ReadNwReportOp('AGENDA_MUON',false) ;
          TSResAction.Tabs.Assign(VpResourceCombo1.Items) ;
          TSResAction.TabIndex :=  VpResourceCombo1.ItemIndex ;

        end;
     end;

  Bmp := TBitmap.Create;
  try
        HeaderImage.Picture.Bitmap.TransparentColor := clwhite ;
        HeaderImage.Picture.Bitmap.Canvas.Brush.Color := clwhite ;
        HeaderImage.Picture.Bitmap.Canvas.FillRect(rect(0,0,HeaderImage.Picture.Bitmap.Width,HeaderImage.Picture.Bitmap.Height));

    case Page of
      CalendarPage : begin
      dmDatabase.TblEvents.Close ;
      dmDatabase.TblTasks.Close ;
      dmDatabase.TblEvents.Open ;
      dmDatabase.TblTasks.Open ;
      VpFlexDataStore1.RefreshEvents;
      VpFlexDataStore1.RefreshTasks;
        PanelCalendar.Visible := True;

        ImageList1.GetBitmap(3,HeaderImage.Picture.Bitmap);
      //  HeaderImage.Picture.Bitmap.TransparentColor := HeaderImage.Picture.Bitmap.Canvas.Pixels[0,HeaderImage.Picture.Bitmap.Height-1] ;
      //  HeaderImage.Picture.Bitmap.Transparent := true ;
      //  Bmp.Handle := ImageList1. LoadBitmap(hInstance, 'CALENDAR');
        LabelHeader.Caption := gettextLang(2879);
      end;

      ContactsPage : begin
        // set contacts to std res
        LastResourceID := VpFlexDataStore1.ResourceID ;
        if VpFlexDataStore1.ResourceID <> 1 then
           VpFlexDataStore1.ResourceID := 1 ;
         PanelHeader.Visible := false ;
        dmDatabase.TblContacts.Close ;
        dmDatabase.TblContacts.Open ;
        VpFlexDataStore1.RefreshContacts;
        PanelContacts.Visible := True;
        imageList1.GetBitmap(0,HeaderImage.Picture.Bitmap);
     //   Bmp.Handle := LoadBitmap(hInstance, 'ROLODEX');
        LabelHeader.Caption := gettextLang(2876);
      end;

      TasksPage    : begin
        dmDatabase.TblEvents.Close ;
        dmDatabase.TblEvents.Open ;
        VpFlexDataStore1.RefreshTasks;
        PanelTasks.Visible := True;
        imageList1.GetBitmap(1,HeaderImage.Picture.Bitmap);
    //    Bmp.Handle := LoadBitmap(hInstance, 'TODOLIST');
        LabelHeader.Caption := gettextLang(2875);
      end;
        MaintResourcePage: begin
        PanelMaintResources.Visible := True;
        imageList1.GetBitmap(4,HeaderImage.Picture.Bitmap);
   //     Bmp.Handle := LoadBitmap(hInstance, 'PEOPLE');
        LabelHeader.Caption := 'Resource Maintenance';
    //    BtnAddRes.Glyph.Handle := LoadBitmap(hInstance, 'VPPLUS');
       // if VpFlexDataStore1.Resource <> nil then
       //   LoadMaintResFields
      //  else
      begin
          ImageList1.GetBitmap(5,HeaderImage.Picture.Bitmap);
          EditResDescr.Enabled := False;
          EditResDescr.Color := clBtnFace;
          MemoResNotes.Enabled := False;
          MemoResNotes.Color := clBtnFace;
        end;
      end;
    end;
    { paint the image in the corner }
    HeaderImage.Canvas.Brush.Color := clBtnFace;
    HeaderImage.Canvas.BrushCopy(Rect(0, 0, 32, 32), Bmp, Rect(0, 0, 32, 32),
      clOlive);
  LastPage := Page ;
  finally
    Bmp.Free;
  end;
end;
{=====}
procedure TPlanerMainForm.TrackBar1Change(Sender: TObject);
begin
  VpDayView1.NumDays := TrackBar1.Position;
  //VpDayView1.ShowEventTimes
end;
{=====}
procedure TPlanerMainForm.VpFlexDataStore1ResourceChange(Sender: TObject;
  Resource: TVpResource);
begin
if Resource <> nil then
 begin
   EditResID.Text := IntToStr(Resource.ResourceID);
   EditResDescr.Text := Resource.Description;
   MemoResNotes.Lines.Text := Resource.Notes;
   aOSFSpecialDaysCollection.Init(Resource.ResourceID);
    if DMTCCoreLink.ReadSysParam('cbEditOnlyOwnCalander',false,CurrentUser) then
      begin
         VpDayView1.ReadOnly := (Resource.ResourceID <> DMTCCoreLink.ReadSysParam('CAL_USERDEF',-1,DMTCCoreLink.currentuser)) ;
         VpTaskList1.ReadOnly :=  VpDayView1.ReadOnly ;
      end;
   VpDayView1.NoDragDrop := VpFlexDataStore1.Resources.Count > 1
 end;
 // try to find active
 if VpResourceCombo1.Items.Count <> 0 then
   begin
    TSResAction.Tabs.Assign(VpResourceCombo1.Items);
    TSResAction.TabIndex :=  VpResourceCombo1.ItemIndex ;
   end;
end;
{=====}
procedure TPlanerMainForm.VpNavBar1FolderChange(Sender: TObject; Index: Integer;
  var AllowChange: Boolean; Dragging: Boolean);
begin


end;
{=====}
procedure TPlanerMainForm.VpNavBar1ItemClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; Index: Integer);
begin
  if VpNavBar1.ActiveFolder = 0 then
    SetActivePage(Index)
  else if VpNavBar1.ActiveFolder = 1 then
    SetActivePage(Index + 10);
end;
{=====}
procedure TPlanerMainForm.mnuFileEditPrintFormatsClick(Sender: TObject);
begin
//  ShowMessage(IntToStr(VpControlLink1.Printer.PrintFormats.Count));

end;

procedure TPlanerMainForm.FormShow(Sender: TObject);
Var
  i: Integer ;
begin
  bManual.Visible :=  DMTCCoreLink.IsRegistered('{273891C5-DFC3-464C-8FEB-64DA85B2FFC0}');
  VpFlexDataStore1.Load ;
  if VpFlexDataStore1.Resources.Count > 0 then
    VpFlexDataStore1.Resource := VpFlexDataStore1.Resources.Items[0];

 VpResourceCombo1.DataStore := nil ;
 VpResourceCombo1.DataStore := VpFlexDataStore1;
        VpNavBar1.Folders[0].Caption := GetTextLang(2872 );
       // VpNavBar1.Folders[1].Caption  := GetTextLang(2873 );

        VpNavBar1.Folders[0].Items[0].Caption := GetTextLang(2879 );
        VpNavBar1.Folders[0].Items[1].Caption := GetTextLang(2876 );
        VpNavBar1.Folders[0].Items[2].Caption := GetTextLang(2875 );
        //LabelLoadedEvents.Caption :=  GetTextLang(2877 )  ;
     //   LabelContacts.Caption :=  GetTextLang(2876 )  ;
     //   LabelTasks.Caption :=  GetTextLang(2875 )  ;
        LabelDayCount.Caption := GetTextLang(2878 )  ;
        Action1.Caption := gettextlang(2867);
        Action2.Caption := gettextlang(2398); //2425);
       // Action4.Caption := gettextlang(2398);
        Action5.Caption := gettextlang(864);
        Action6.Caption := gettextlang(124);
        Action7.Caption := gettextlang(20080);
        CreateInvoiceOnHoures.Caption := gettextlang(3096);
        bCreateInvoiceOnHoures.Caption := gettextlang(3096);
        bManual.Caption := gettextlang(3559);

        SetActivePage(0);

        Ltimeslot.Caption := gettextlang(3347);

        BaddEdit.Visible :=  DMTCCoreLink.ReadSysParam('BEditCalender',true,DMTCCoreLink.currentuser) ;
        BaddEdit.Visible :=  VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select BSystemSetup from users where WUserid =' + IntToStr(DMTCCoreLink.currentuser))) = '1' ;



        DefUserResID := DMTCCoreLink.ReadSysParam('CAL_USERDEF',1,DMTCCoreLink.currentuser) ;
        for i := 0 to VpFlexDataStore1.Resources.Count -1 do
          begin
            if VpFlexDataStore1.Resources.Items[i].ResourceID = DefUserResID then
               begin
               VpResourceCombo1.ItemIndex := i ;
               LastResourceID := DefUserResID ;
               VpFlexDataStore1ResourceChange(Self,VpFlexDataStore1.Resources.Items[i]);
               end;

          end ;




        if Assigned(TComboBox(VpResourceCombo1).OnChange) then
            TComboBox(VpResourceCombo1).OnChange(VpResourceCombo1);

 if PanelCalSplit1.Width > (PanelBase.ClientWidth - 10) then
   PanelCalSplit1.Width := (PanelBase.ClientWidth - 10) ;

VpNavBar1.Images := ImageList1 ;
Invoice1.Caption := DMTCCoreLink.GetTextLangNoAmp(174) + ' ' + DMTCCoreLink.GetTextLangNoAmp(165) ;
end;

procedure TPlanerMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.QTasks.close ;
    dmDatabase.QContacts.close ;
    dmDatabase.QEvents.close ;
    dmDatabase.QResources.close ;

    dmDatabase.tblTasks.close ;
    dmDatabase.tblContacts.close ;
    dmDatabase.tblEvents.close ;
    dmDatabase.tblResources.close ;
end;

procedure TPlanerMainForm.Action1Execute(Sender: TObject);
begin
  VpPrintFormatEditDialog1.Execute;
end;

procedure TPlanerMainForm.Action2Execute(Sender: TObject);
begin
  if VpControlLink1.Printer.PrintFormats.Count > 0 then begin
    VpDayView1.RowHeadAttributes.HourFont.Size := 8 ;


    VpPrintPreviewDialog1.StartDate := trunc(VpDayView1.Date);

    VpPrintPreviewDialog1.EndDate := trunc(VpDayView1.Date + (TrackBar1.Position-1)) ;
     VpControlLink1.Printer.DayView := VpDayView1 ;
     VpControlLink1.Printer.DayStart := h_07 ;
       
     VpControlLink1.Printer.DayEnd := h_23 ;

    if VpPrintPreviewDialog1.Execute then
     begin

      // ReportData.Format :=  VpPrintPreviewDialog1.VpPrintFormatComboBox1.
       DoPrintCurrent;
     end;
     VpDayView1.RowHeadAttributes.HourFont.Size := 12 ; 
  end
  else
    ShowMessage('No print format defined');
end;

procedure TPlanerMainForm.FormDestroy(Sender: TObject);
begin
 APluginList.free;
 DMTCCoreLink.WriteNwReportOp('PLAN_DAYPOS',IntToStr(TrackBar1.Position)) ;
 DMTCCoreLink.WriteNwReportOp('PLAN_TIMESLOT',IntToStr(TrackBar2.Position)) ;

 DMTCCoreLink.WriteNwReportOp('PLAN_PANELCAL',IntToStr(PanelCalSplit1.Width)) ;
 DMTCCoreLink.WriteNwReportOp('PLAN_MONTHVIEW',IntToStr(VpMonthView1.Height)) ;

 dmDatabase.QEvents.AfterEdit := nil ;
 VpEventEditDialog1.free ;
 VpResourceEditDialog1.free;
 VpTaskEditDialog1.free;
 VpContactEditDialog1.free;
 aOSFSpecialDaysCollection.free ;
end;

procedure TPlanerMainForm.VpDayView1OwnerEditEvent(Sender: TObject;
  Event: TVpEvent; Resource: TVpResource; var AllowIt: Boolean);
begin
 Event.Popupstart := VpDayView1.StartTime ;
 Event.PopupEnd := VpDayView1.EndTime ;
 AllowIt := VpEventEditDialog1.Execute(Event) ;

end;

procedure TPlanerMainForm.VpTaskList2OwnerEditTask(Sender: TObject;
  Task: TVpTask; Resource: TVpResource; var AllowIt: Boolean);
begin

AllowIt :=  VpTaskEditDialog1.Execute(Task) ;

end;

procedure TPlanerMainForm.VpContactGrid1OwnerEditContact(Sender: TObject;
  Contact: TVpContact; Resource: TVpResource; var AllowIt: Boolean);
begin

 AllowIt :=  VpContactEditDialog1.Execute(Contact) ;

end;

procedure TPlanerMainForm.Action3Execute(Sender: TObject);
begin
  LoadFormats;
end;

procedure TPlanerMainForm.Action4Execute(Sender: TObject);
begin
 DoPrintCurrent;
end;

procedure TPlanerMainForm.Action5Execute(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TPlanerMainForm.Action6Execute(Sender: TObject);
var
  frmReportSetup: TfrmReportSetup;
begin
  frmReportSetup:= TfrmReportSetup.Create(nil);
  try
  frmReportSetup.StartDate := VpMonthView1.Date;
  frmReportSetup.EndDate := VpMonthView1.Date;
  VpControlLink1.Printer.DayStart := h_02 ;
  frmReportSetup.ControlLink := VpControlLink1;
  frmReportSetup.Execute;
  finally
    frmReportSetup.Free ;
  end;
end;

procedure TPlanerMainForm.Action7Execute(Sender: TObject);
var
  frmAbout : TfrmAbout;
begin
   frmAbout := TfrmAbout.create(nil);
   try
  // Display about box
  frmAbout.Execute;
   finally
     frmAbout.free ;
   end;
end;



procedure TPlanerMainForm.VpControlLink1NoLocalizationFile(Sender: TObject;
  FileName: String);
begin

  if FileExists(IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'VpLocalize.xml') then
     FileName :=  IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName))+'VpLocalize.xml' ;
end;

procedure TPlanerMainForm.VpFlexDataStore1Alert(Sender: TObject;
  Event: TVpEvent);
begin
 VpNotificationDialog.Execute(Event);
end;

procedure TPlanerMainForm.TrackBar2Change(Sender: TObject);
begin
 VpDayView1.Granularity :=  TvpGranularity(TrackBar2.Position);

end;

procedure TPlanerMainForm.VpDayView1OwnerDrawColHeader(Sender: TObject;
  const Canvas: TCanvas; R: TRect; var Drawn: Boolean);
  var
   ATekst : String ;
begin
  Canvas.Brush.Color :=  self.Color ;
  Canvas.Font.Color :=   VpDayView1.HeadAttributes.Font.Color ;
  ATekst := DMTCCoreLink.GetTextLang(2460) ;
  Delete(ATekst,1,2);
  Canvas.TextOut(r.Left +   5,r.top+3, ATekst + '  ' + IntToStr(WeekOf(VpDayView1.TheRenderDate)) );
  Canvas.TextOut(r.Left +   5,r.top+(3 + ((-Canvas.Font.Height) + 8)) ,FormatDatetime('dddd, mmmm dd',VpDayView1.TheRenderDate));
  Drawn := true ;
end;

procedure TPlanerMainForm.CreateInvoiceOnHouresClick(Sender: TObject);
var
  FormReportingDates: TFormReportingDates;
  i , x ,Z, NextNum: Integer ;
  EventList : TList ;
  AInvoiceList : TStringList ;
  AStockRec : TStockRec ;
  TaxRate : Double ;
  Houres,Minutes,Seconds,MSec : Word ;

begin
  NextNum := 0 ;
  VpFlexDataStore1.PostResources ;
  FormReportingDates := TFormReportingDates.Create(nil);
  try
    if FormReportingDates.ShowModal = mrok then
      begin
          AStockRec.WStockID := FormReportingDates.EStockCode.Tag ;
          TDataBaseStockRoutines. StockLoadItem(AStockRec) ;
          AInvoiceList := TStringList.Create;
          EventList := TList.Create;
          EventList.Clear ;
          try
             for z := 0 to VpDayView1.DataStore.Resources.Count -1 do
               begin
                VpDayView1.DataStore.PostEvents ;
                VpDayView1.DataStore.Resource := VpDayView1.DataStore.Resources.Items[z] ;

               for  i:= round(FormReportingDates.DTFromdate.DateTime) to round(FormReportingDates.DTToDate.DateTime) do
                 begin
                {Get all of the events for this day}
                VpDayView1.DataStore.Resource.Schedule.EventsByDate(i, EventList);
                for x := 0 to EventList.Count-1 do
                  begin
                     if  TVpEvent(EventList[x]).Category = 4 then
                      if TVpEvent(EventList[x]).WAccountID <> 0 then
                      // never the ones that are done.
                       if (TVpEvent(EventList[x]).UserField1 = '') or (TVpEvent(EventList[x]).RepeatCode <> rtNone) then
                       begin
                          if AInvoiceList.IndexOf(IntToStr(TVpEvent(EventList[x]).WAccountID)+'_'+TVpEvent(EventList[x]).UserField2) = -1 then
                            begin
                               // add invoice to list
                               dmDatabase.ZQDocHead.SQL.Text :=  'Select * from dochead where WDocId = -1';
                               dmDatabase.ZQDocHead.open ;

                               dmDatabase.ZQDocHead.Insert ;
                               dmDatabase.ZQDocHeadWTYPEID.AsInteger := 14 ;
                               dmDatabase.ZQDocHeadDDATE.AsDateTime := date ;
                               dmDatabase.ZQDocHeadDDUEDATE.AsDateTime := date + 14 ;
                               dmDatabase.ZQDocHeadSDOCNO.AsString :=  TDataBaseDocumentRoutines.GetDocNextNum(dmDatabase.ZQDocHeadWTYPEID.AsInteger) ;
                               dmDatabase.ZQDocHeadWACCOUNTID.AsInteger := TVpEvent(EventList[x]).WAccountID ;
                               dmDatabase.ZQDocHeadBPOSTED.AsInteger := 0 ;
                               dmDatabase.ZQDocHeadBPRINTED.AsInteger := 0 ;
                               dmDatabase.ZQDocHeadBREPEATING.AsInteger := 0 ;
                               dmDatabase.ZQDocHeadBEXCLUSIVE.AsInteger := 1 ;
                               dmDatabase.ZQDocHeadWJOBCODEID.AsInteger :=  StrToIntDef(TVpEvent(EventList[x]).UserField2,0);
                               if dmDatabase.ZQDocHeadWJOBCODEID.AsInteger = 0 then
                                  dmDatabase.ZQDocHeadWJOBCODEID.Clear ;
                               dmDatabase.ZQDocHead.post ;

                               AInvoiceList.AddObject(IntToStr(TVpEvent(EventList[x]).WAccountID)+'_'+TVpEvent(EventList[x]).UserField2,TObject(dmDatabase.ZQDocHeadWDOCID.AsInteger)) ;
                            end;

                           dmDatabase.ZQDocLine.SQL.Text := 'Select * from docline left join account on (docline.WTaxId = Account.WaccountId) where WDocid = :WDocId';
                           dmDatabase.ZQDocLine.Params[0].AsInteger := Integer(AInvoiceList.objects[AInvoiceList.IndexOf(IntToStr(TVpEvent(EventList[x]).WAccountID)+'_'+TVpEvent(EventList[x]).UserField2)]) ;
                           dmDatabase.ZQDocLine.open ;
                           dmDatabase.ZQDocLine.Insert ;
                           dmDatabase.ZQDocLineWACCOUNTID.AsInteger := 0 ;
 
                           dmDatabase.ZQDocLineWACCOUNTTYPEID.AsInteger := 0 ;
                           dmDatabase.ZQDocLineWREPORTINGGROUP1ID.AsInteger := 0 ;
                           dmDatabase.ZQDocLineWREPORTINGGROUP2ID.AsInteger := 0 ;
                           dmDatabase.ZQDocLineBSUBACCOUNTS.AsInteger := 0 ;
                           dmDatabase.ZQDocLineBINCOMEEXPENSE.AsInteger := 0 ;
                           dmDatabase.ZQDocLineWDOCID.AsInteger :=   dmDatabase.ZQDocLine.Params[0].AsInteger ;
                           inc(NextNum);
                           dmDatabase.ZQDocLineWDOCLINEID.AsInteger := NextNum ;
                           if (StrTOIntDef( TVpEvent(EventList[x]).UserField5,0) <> 0) and (DMTCCoreLink.IsRegistered('{273891C5-DFC3-464C-8FEB-64DA85B2FFC0}')) then
                             dmDatabase.ZQDocLineWSTOCKID.AsInteger :=  StrTOIntDef( TVpEvent(EventList[x]).UserField5,0)
                            else
                           dmDatabase.ZQDocLineWSTOCKID.AsInteger := AStockRec.WStockID ;
                           dmDatabase.ZQDocLineWLINETYPEID.AsInteger := 90 ;
                           dmDatabase.ZQDocLineWDESCRIPTIONID.AsInteger := DMTCCoreLink.GetAddDescription(formatDateTime('dd-mm-yyyy',i) + ' ' + TVpEvent(EventList[x]).UserField0);
                           dmDatabase.ZQDocLineWTAXID.AsInteger := AStockRec.WOutputTaxID ;

                           DecodeTime((TVpEvent(EventList[x]).EndTime - TVpEvent(EventList[x]).StartTime),Houres,Minutes,Seconds,MSec);
                           dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat := Houres + ((1 / 60) * Minutes);
                           dmDatabase.ZQDocLineFQTYORDERED.AsFloat := dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat ;
                           dmDatabase.ZQDocLineFSELLINGPRICE.AsFloat := TDataBaseStockRoutines.getStockPrice(TVpEvent(EventList[x]).WAccountID,dmDatabase.ZQDocLineWSTOCKID.AsInteger,dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat) ;


                           TaxRate := TDataBaseRoutines.GetTaxRateOnId(dmDatabase.ZQDocLineWTAXID.AsInteger,true);
                           dmDatabase.ZQDocLineFInclusiveAmt.Value := FixAmount((dmDatabase.ZQDocLineFSELLINGPRICE.Value * dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat) *TaxRate,dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
                           dmDatabase.ZQDocLineFExclusiveAmt.Value := FixAmount((dmDatabase.ZQDocLineFSELLINGPRICE.Value * dmDatabase.ZQDocLineFQTYSHIPPED.AsFloat),dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
                           dmDatabase.ZQDocLineFTAXAMOUNT.Value :=FixAmount((dmDatabase.ZQDocLineFInclusiveAmt.Value - dmDatabase.ZQDocLineFExclusiveAmt.Value),dmDatabase.SetOfBooksPropertys.DataParameter.wDocRowDecimals);
                           dmDatabase.ZQDocLineWREPORTINGGROUP1ID.AsInteger := 0 ;
                           dmDatabase.ZQDocLineWREPORTINGGROUP2ID.AsInteger := 0 ;

                           dmDatabase.ZQDocLine.Post ;
                           if TVpEvent(EventList[x]).UserField1 <> '' then
                             begin
                              if pos(dmDatabase.ZQDocLineWDOCID.AsString,TVpEvent(EventList[x]).UserField1) = 0 then
                              TVpEvent(EventList[x]).UserField1 :=  TVpEvent(EventList[x]).UserField1 + ',' + dmDatabase.ZQDocLineWDOCID.AsString
                             end
                           else
                           TVpEvent(EventList[x]).UserField1 :=  dmDatabase.ZQDocLineWDOCID.AsString ;
                           TVpEvent(EventList[x]).Changed := true ;

                          end;
                       end;
              end;
           end;
        finally

          for i := 0 to AInvoiceList.Count -1 do
            begin
               TDataBaseDocumentRoutines.FillAccountInfoInDocHead(Integer(AInvoiceList.Objects[i]),-1,True);
               TDataBaseDocumentRoutines.CleanupDochead(Integer(AInvoiceList.Objects[i])) ;
            end;
          if AInvoiceList.Count <> 0 then
            OSFMessageDlg(DMTCCoreLink.GetTextLang(3079){'Quote(s) are generated!'},mtInformation,[mbok],0);

          EventList.free ;
          AInvoiceList.free ;
        end;
         VpDayView1.DataStore.PostResources ;
      end;
  finally
    FormReportingDates.free ;
  end;
end;

procedure TPlanerMainForm.TSResActionChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
  if newtab <> VpResourceCombo1.ItemIndex then
     begin


        VpResourceCombo1.ItemIndex := newtab ;
        if Assigned(TComboBox(VpResourceCombo1).OnChange) then
            TComboBox(VpResourceCombo1).OnChange(VpResourceCombo1);
     end;
end;

procedure TPlanerMainForm.MemoResNotesDblClick(Sender: TObject);
begin
  VpResourceEditDialog1.Execute;
end;



procedure TPlanerMainForm.VpOnGetSpecialDate(Sender: TObject;
  ADate: TDateTime; var IsSpecialDate: Boolean;var DayText : String ;var SpecialColor : Integer );
  var

   aOSFSpecialDaysItem : TOSFSpecialDaysItem ;
begin
  aOSFSpecialDaysItem := aOSFSpecialDaysCollection.GetitemOnDate(ADate) ;
  IsSpecialDate :=  aOSFSpecialDaysItem <> nil ;
  if IsSpecialDate then
     begin

       DayText := aOSFSpecialDaysItem.SDESCRIPTION ;
       SpecialColor := aOSFSpecialDaysItem.WCOLOR ;
     end;

  { IsSpecialDate := true;
    DecodeTime(ADate,Hour,Minute,Sec,Milsec);

   if (EncodeTime(Hour,Minute,Sec,Milsec) >= EncodeTime(10,0,0,0)) and
      (EncodeTime(Hour,Minute,Sec,Milsec) < EncodeTime(11,0,0,0)) then
   DayText := DatetimeToSTR(ADate) else
   DayText := '*' + DatetimeToSTR(ADate) ;
   SpecialColor := clred ;   }
end;

procedure TPlanerMainForm.BEditSpecialDayEventsClick(Sender: TObject);
begin
  fmEditSpecialDays := TfmEditSpecialDays.Create(self);
  try
    fmEditSpecialDays.init(StrToInt(EditResID.Text));
    fmEditSpecialDays.showmodal ;
     aOSFSpecialDaysCollection.Init(StrToInt(EditResID.Text));
  finally
    fmEditSpecialDays.free ;
  end;
end;

procedure TPlanerMainForm.FormResize(Sender: TObject);
begin
 if not Assigned(ScrollBox1) then exit ;
  if ScrollBox1.Width < 629 then
     begin
       ScrollBox1.HorzScrollBar.Range := 629 ;
     end ;
  if ScrollBox1.Height < 444 then
     begin
       ScrollBox1.VertScrollBar.Range := 444 ;
     end ;
end;

procedure TPlanerMainForm.VpFlexDataStore1Connect(Sender: TObject);
begin
VpFlexDataStore1ResourceChange(sender,VpFlexDataStore1.Resource)
end;

procedure TPlanerMainForm.ChangetoAgenda1Click(Sender: TObject);
var
i : Integer ;
begin
 if not Assigned(VpDayView1.ActiveEvent) then exit ;
cbChangeToBox.Items.Clear ;
for i := 0 to TSResAction.Tabs.Count -1 do
   begin
    if VpFlexDataStore1.Resource <> nil then
       if VpFlexDataStore1.Resource.ResourceID <>  integer(TSResAction.Tabs.Objects[i]) then
          cbChangeToBox.AddItem(TSResAction.Tabs[i],TSResAction.Tabs.Objects[i]);
   end;
  if cbChangeToBox.Items.Count <> 0 then
     cbChangeToBox.ItemIndex := 0 ;
   PChangeResource.Visible := true ;
   cbChangeToBox.SetFocus ;

end;

procedure TPlanerMainForm.TaskPopupPopup(Sender: TObject);
begin
 ChangetoAgenda1.Visible := TSResAction.Tabs.Count > 0 ;
 
end;

procedure TPlanerMainForm.PChangeResourceExit(Sender: TObject);
begin
  PChangeResource.Visible := false ;
end;

procedure TPlanerMainForm.bCancelResChangeClick(Sender: TObject);
begin
  PChangeResource.Visible := false ;
end;

procedure TPlanerMainForm.BokResChangeClick(Sender: TObject);
begin
 if not Assigned(VpDayView1.ActiveEvent) then
   begin
   PChangeResource.Visible := false ;
   exit ;
   end;
 if VpFlexDataStore1.Resource <> nil then
  if cbChangeToBox.ItemIndex <> -1 then
    begin
      ExecSql('update Events set resourceid =' +  IntToStr(Integer(cbChangeToBox.Items.Objects[cbChangeToBox.ItemIndex])) + ' where RECORDID = '+ IntToStr( VpDayView1.ActiveEvent.RecordID));
      VpDayView1.Refresh ;
    end;
  PChangeResource.Visible := false ;
  VpFlexDataStore1.RefreshResource ;
end;

procedure TPlanerMainForm.cbChangeToBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
   begin
     key := #0 ;
     BokResChangeClick(self); 
   end;
end;

procedure TPlanerMainForm.VpFlexDataStore1SetFilterCriteria(
  aTable: TDataSet; aUseDateTime: Boolean; aResourceID: Integer;
  aStartDateTime, aEndDateTime: TDateTime);
begin
 if aTable  = dmDatabase.QEvents then
   if aUseDateTime then
     With aTable as TuniQuery do
       begin
         Active := false ;
         SQL.Text := 'select * from events where RESOURCEID = ' + IntToStr(aResourceID) + ' and ((STARTTIME >= ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(aStartDateTime) +
           ' and STARTTIME <= ' + TDatabaseTableRoutines.GetFirebirdsSqlForDate(aEndDateTime)+ ') or REPEATCODE <> 0  )'  ;
         Open ;
       end;
    if aTable  = dmDatabase.QTasks then
      With aTable as TuniQuery do
        begin
          Active := false ;
          SQL.Text := 'select * from tasks where RESOURCEID = ' + IntToStr(aResourceID)  ;
          Open ;
        end;
    if aTable  = dmDatabase.QContacts then
     With aTable as TuniQuery do
        begin
          Active := false ;
          SQL.Text := 'select * from contacts'  ;
          Filtered := false ;
          Open ;
        end;
end;

procedure TPlanerMainForm.InitpluginsInEvent(Sender: Tobject);
var
 i :  Integer ;
 AForm: TForm ;
 ReturnString : Array [0..1025] of char ;
 APChar : PChar ;

  AMessage : String ;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
         AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'EVENTS');
         APChar := ReturnString ;
         AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
         AFormPluginRecordArray[i].aForm := AForm ;
         AForm.Parent := sender as TWinControl ;
         AForm.Align := alClient ;
         AForm.BorderStyle := bsNone ;
         AForm.Show ;
         AMessage := 'EDIT=' +  IntToStr((sender as TWinControl).tag);
         AFormPluginRecordArray[i].aMessageFormPlugin(AForm,pchar(AMessage)) ;
      end;
end;

procedure TPlanerMainForm.SavepluginsInEvent(Sender: Tobject);
var
 AMessage : String ;
  i :  Integer ;
   AForm: TForm ;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
         if (Sender as TDataSet).FindField('RECORDID') <> nil then
            begin
             AMessage := 'POST=' +  (Sender as TDataSet).FindField('RECORDID').AsString ;
            end;

         AForm := AFormPluginRecordArray[i].aForm;
         AFormPluginRecordArray[i].aMessageFormPlugin(AForm,pchar(AMessage)) ;

      end;
end;

procedure TPlanerMainForm.UnloadpluginsInEvent(Sender: Tobject);
var
 i :  Integer ;
   AForm: TForm ;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
         AForm := AFormPluginRecordArray[i].aForm;
         AFormPluginRecordArray[i].aUnLoadFormPlugin(AForm);
         AFormPluginRecordArray[i].aForm := nil ;
      end;
end;

{ twf_TosFDayView }

constructor twf_TosFDayView.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'planner';
  Description := 'Calander function RESOURCE_ID is the calender to show and dat is the date to use if 0 then its today.';
  with Inparams.Add as TParam do
     begin
        Name := 'RESOURCE_ID' ;
        DataType := ftinteger ;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'DDATE' ;
        DataType := ftdate ;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
end;

procedure twf_TosFDayView.WorkflowEnd(AForm: TForm);
begin
  inherited;
  AForm.free ;
end;

function twf_TosFDayView.WorkFlowStart: TForm;
Var
  aIcon : TIcon ;
begin
    result := TPlanerMainForm.Create(self) ;
           with result do
            begin
               TPlanerMainForm(result).VpNavBar1.Visible := False ;
               if TPlanerMainForm(result).VpFlexDataStore1.ResourceID <> Inparams.paramByName('RESOURCE_ID').AsInteger then
               TPlanerMainForm(result).VpFlexDataStore1.ResourceID := Inparams.paramByName('RESOURCE_ID').AsInteger;
               dmtccorelink.LoadT3Glyph(TPlanerMainForm(result).ImageList1,5,'Form.ico',TPlanerMainForm(result).ImageList1.Height);
               dmtccorelink.LoadT3Glyph(TPlanerMainForm(result).ImageList1,3,'Agenda.ico',TPlanerMainForm(result).ImageList1.Height);
               dmtccorelink.LoadT3Glyph(TPlanerMainForm(result).ImageList1,0,'Contacts.ico',TPlanerMainForm(result).ImageList1.Height);
               dmtccorelink.LoadT3Glyph(TPlanerMainForm(result).ImageList1,1,'Screenlist.ico',TPlanerMainForm(result).ImageList1.Height);
               result.parent :=  self.Parent ;
               BorderStyle := bsNone ;
               show ;
              
               Align := alclient;
            end;
end;
procedure TPlanerMainForm.BoutlookClick(Sender: TObject);
const
  olMailItem = $00000000;
  olAppointmentItem = $00000001;
  olContactItem = $00000002;
  olTaskItem = $00000003;
  olJournalItem = $00000004;
  olNoteItem = $00000005;
  olPostItem = $00000006;
  olDistributionListItem = $00000007;

const

	olFolderCalendar  = 9;
	olUserProperty    = 39;
	olText            = 1;
  crDragCopy        = 5;
  maxdaysahead : integer = 30 ;
procedure  AddNewAppointment( outlook:OleVariant; subject,
	location,body:string; start:TDateTime; QtyMin:double;Reminder:Boolean );
var
	oAppoint,
	oUserProp: OleVariant;
begin
	oAppoint := outlook.CreateItem(olAppointmentItem);
	oAppoint.Subject := subject;
	oAppoint.Location := location;
  oAppoint.ReminderSet := Reminder ;
	oAppoint.Start := start;
	oAppoint.Duration := QtyMin ;
  //oAppoint.UnRead := True;
  //oAppoint.Mileage := 'test';
  oAppoint.Body := body  + #13+#10 + 'Updated ' + DateTimeToStr(now);
	oUserProp := oAppoint.UserProperties.Add('OSF', olText, false);
	oUserProp.Value := 'OSFINANCIALS';
	oAppoint.Save;
end;

function  GetOutlookObject:OleVariant;
begin
	try
		Result := GetActiveOleObject('Outlook.Application');
	except
		Result := CreateOleObject('Outlook.Application');
	end;
end;
procedure RemoveOldAppointments( folder:OleVariant ); var
	oAfspraak,resultItems  : OLEvariant;
	Criteria,StrResult:string;
  i : Integer ;
 
begin

	 try  // "[Start] >= '03/01/2004 08:00 PM' and [Start] <= '03/30/2004 08:00 AM'"
      Criteria := '[Start] >=  ' + QuotedStr(DateToStr(date) +' 00:00')+' and [Start] <= ' + QuotedStr(DateToStr(date+maxdaysahead) +' 00:00');
       resultItems := folder.Items.Restrict(Criteria);
         AosfProgress.initProgress('Deleting old appointents',resultItems.Count);
        for i := resultItems.Count   downto 1 do
        begin
         oAfspraak := resultItems.Item[i] ;
         try
          AosfProgress.SetProgress('',i);
        if  not VarIsNull( oAfspraak ) and not VarIsClear(oAfspraak) then
          begin
             StrResult := '' ;
             try
             StrResult := VarToStr( oAfspraak.UserProperties('OSF').value) ;
             except
             end;
             if  StrResult = 'OSFINANCIALS' then
               begin
                 oAfspraak.Delete;

               end;
          end;
          except

          end;

        end;
  except
  end;

end;

procedure ToOutlook  ;
var oOutlook   : OLEvariant;
		oNameSpace : OLEvariant;
		oFolder    : OLEvariant;
 
		cBeginTijd : string;
		nDuration : Double;
		cSubject   : string;
		cLocation  : string;
		cStart     : string;

    var
     EventList: TList ;
     i,day : Integer  ;
begin
 EventList:= TList.Create ;
 try
	try
    try
      oOutlook := GetOutlookObject;
      oNameSpace := oOutLook.GetNamespace('MAPI');
      oNameSpace.Logon(EmptyParam, EmptyParam, False, True);
      oFolder    := oNameSpace.GetDefaultFolder(olFolderCalendar);
      try
        try
          RemoveOldAppointments( oFolder );
          AosfProgress.initProgress('Writing to outlook',maxdaysahead);
          for day := 0 to maxdaysahead do
          begin
             EventList.Clear ;
             AosfProgress.SetProgress('',day);
             VpFlexDataStore1.Resource.Schedule.EventsByDate(date +  day,EventList) ;

             AosfProgress.InitSubProgress('Day '+ DateToStr(date +  day),EventList.Count);
            for i := 0 to EventList.Count  -1 do
            if TVpEvent(EventList.Items[i]).Category <> 1 then
            if TVpEvent(EventList.Items[i]).UserField4 = '' then
            begin
             AosfProgress.SetSubProgress(i);
            nDuration    :=  MinutesBetween(TVpEvent(EventList.Items[i]).EndTime,TVpEvent(EventList.Items[i]).StartTime);
            if nDuration = 0 then nDuration := 60;
            cSubject :=  TVpEvent(EventList.Items[i]).Description ;
            cLocation := TVpEvent(EventList.Items[i]).UserField3 ;
            AddNewAppointment( oOutlook, cSubject, cLocation, TVpEvent(EventList.Items[i]).Note , date +  day + (TVpEvent(EventList.Items[i]).StartTime - trunc(TVpEvent(EventList.Items[i]).StartTime)), nDuration, TVpEvent(EventList.Items[i]).AlarmSet);
            end;
          end;
        except
          on e:Exception do
            ShowMessageFmt( 'Error in export to oulook!' + #10#13#10#13 + '%s', [ e.Message ] );
        end;
      finally
        oFolder := UnAssigned;
        oNameSpace := UnAssigned;
      end;
    except
      on e:Exception do
      	ShowMessageFmt( '(Outlook) was not found!' + #10#13#10#13 + '%s', [ e.Message ] );
    end;
	finally
	end;
  finally
     EventList.free ;
  end;
end;
begin
 fmOutlookEmail:= TfmOutlookEmail.Create(Application);
 try
  fmOutlookEmail.VpFlexDataStore1 := VpFlexDataStore1 ;
  fmOutlookEmail.ShowModal;
 finally
  fmOutlookEmail.free  ;
 end;
 exit ;
 AosfProgress := TfmNewProgress.Create(Application);
 try
 ToOutlook ;
 finally
   FreeAndNil(AosfProgress);
 end;
end;

procedure TPlanerMainForm.bOutlookToosFClick(Sender: TObject);
const
  olMailItem = $00000000;
  olAppointmentItem = $00000001;
  olContactItem = $00000002;
  olTaskItem = $00000003;
  olJournalItem = $00000004;
  olNoteItem = $00000005;
  olPostItem = $00000006;
  olDistributionListItem = $00000007;
  olFolderInbox = $00000006;
  olFolderSentMail = $00000005;
  olVCal = $00000007;
const
	olFolderCalendar  = 9;
	olUserProperty    = 39;
	olText            = 1;
  crDragCopy        = 5;
  maxdaysahead : integer = 30 ;

function  GetOutlookObject:OleVariant;
begin
	try
		Result := GetActiveOleObject('Outlook.Application');
	except
		Result := CreateOleObject('Outlook.Application');
	end;
end;

procedure FromEmailOutlookRec( folder,oNameSpace:OleVariant ); var
	oEmail,resultItems,reaccurence,ObjectRef,objField  : OLEvariant;
	Criteria,PropString,SenderName:string;
  i,x: Integer ;
  aEvent : TVpEvent ;
  BFound:Boolean ;
  aQuery,BQuery, MMQuery : TuniQuery ;
  AFile,TempStr,Orgfilename,ToFilename : String ;
begin
    aQuery := TuniQuery.Create(self) ;
    bQuery := TuniQuery.Create(self) ;
    MMQuery:= TuniQuery.Create(self) ;
    try
    aQuery.Connection := DMTCCoreLink.TheZConnection ;
    bQuery.Connection := DMTCCoreLink.TheZConnection ;
    MMQuery.Connection := DMTCCoreLink.TheZConnection ;
	 try  // "[Start] >= '03/01/2004 08:00 PM' and [Start] <= '03/30/2004 08:00 AM'"
   aQuery.SQL.Text := 'select Waccountid from debtor where lower(SEMAIL) = :email' ;
   aQuery.SQL.Add( ' union select Waccountid from creditor  where lower(SEMAIL) = :email') ;

   if TDatabaseTableRoutines.FieldExists('dochead','X_CUSTOMERS_EMAIL_ADDRESS') then
     begin
        aQuery.SQL.Add( ' union select Waccountid from dochead  where lower(X_CUSTOMERS_EMAIL_ADDRESS) = :email') ;
     end;
     bQuery.SQL.Text := 'SELECT a.WACCOUNTID FROM ACCOUNTREF a join account b on a.WACCOUNTID=b.WACCOUNTID '+
     ' and b.WACCOUNTTYPEID in (1,2) where lower(a.SREFERENCE) = :REF' ;
      MMQuery.SQL.Text:='select * from MULTIMEDIA where STYPE= ' +  QuotedStr('DEBCR') + ' and SORGFILENAME = :ORGFILE and  WREFID = :REFID' ;
    //   Criteria := '[ReceivedTime] >=  ' + QuotedStr(DateToStr(date-30) +' 00:00')+' and [ReceivedTime] <= ' + QuotedStr(DateToStr(date+maxdaysahead+1) +' 00:00');
       Criteria := '[ReceivedTime] >=  '  + QuotedStr(DateToStr(date-30)+' 00:00') ;
        resultItems := folder.Items.Restrict(Criteria);
        AosfProgress.initProgress('Importing email',resultItems.Count);
        for i := 1 to  resultItems.Count do
          begin
           oEmail := resultItems.Item[i] ;
            try
              if  not VarIsNull( oEmail ) and not VarIsClear(oEmail) then
                  begin
                    aQuery.close ;
                    try
                      SenderName :=  LowerCase( oEmail.SenderEmailAddress) ;
                    except
                       SenderName := LowerCase( oEmail.SenderName );
                     end;
                    if pos('@',SenderName) > 0 then
                      begin
                          aQuery.ParamByName('email').AsString := LowerCase( SenderName) ;
                          aQuery.open;
                          if not aQuery.IsEmpty then
                            begin
                               MMQuery.close ;
                               MMQuery.Params[0].AsString := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                               MMQuery.Params[1].AsInteger := aQuery.Fields[0].AsInteger ;
                               MMQuery.open ;
                               if MMQuery.IsEmpty then
                                 begin
                                         AFile := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         Orgfilename := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         MMQuery.Insert ;
                                         MMQuery.FieldByName('WMMID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_MULTIM_ID') ;
                                         TempStr :=  FormatDateTime('YYYY',now) + '\'+ FormatDateTime('mm',now) +'\'+ MMQuery.FieldByName('WMMID').AsString +'_'+Orgfilename;
                                         ToFilename := IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalSaveDir) +'files\'  + TempStr ;
                                         ForceDirectories(ExtractFilePath(ToFilename)) ;
                                         oEmail.SaveAs(ToFilename);
                                         MMQuery.FieldByName('SGROUP').AsString := 'Email';
                                         MMQuery.FieldByName('STYPE').AsString := 'DEBCR' ;
                                         MMQuery.FieldByName('WREFID').AsInteger := aQuery.Fields[0].AsInteger ;
                                         MMQuery.FieldByName('SDESCRIPTION').AsString := oEmail.Subject ;
                                         MMQuery.FieldByName('SORGFILENAME').AsString := Orgfilename ;
                                         MMQuery.FieldByName('SPATH').AsString := 'file:' + TempStr;
                                         MMQuery.FieldByName('DFILEDATE').AsDateTime := oEmail.SentOn ;
                                         MMQuery.Post ;
                                   end;
                             end; // end aQ empty
                            end else // end pos
                          begin
                           bQuery.Close;
                             bQuery.ParamByName('REF').AsString := trim(LowerCase( SenderName)) ;
                           bQuery.open;
                          if not bQuery.IsEmpty then
                            begin
                               MMQuery.close ;
                               MMQuery.Params[0].AsString := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                               MMQuery.Params[1].AsInteger := bQuery.Fields[0].AsInteger ;
                               MMQuery.open ;
                               if MMQuery.IsEmpty then
                                 begin

                                         AFile := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         Orgfilename := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         MMQuery.Insert ;
                                         MMQuery.FieldByName('WMMID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_MULTIM_ID') ;
                                         TempStr :=  FormatDateTime('YYYY',now) + '\'+ FormatDateTime('mm',now) +'\'+ MMQuery.FieldByName('WMMID').AsString +'_'+Orgfilename;
                                         ToFilename := IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalSaveDir) +'files\'  + TempStr ;
                                         ForceDirectories(ExtractFilePath(ToFilename)) ;
                                         oEmail.SaveAs(ToFilename);
                                         MMQuery.FieldByName('SGROUP').AsString := 'Email';
                                         MMQuery.FieldByName('STYPE').AsString := 'DEBCR' ;
                                         MMQuery.FieldByName('WREFID').AsInteger := bQuery.Fields[0].AsInteger ;
                                         MMQuery.FieldByName('SDESCRIPTION').AsString := oEmail.Subject ;
                                         MMQuery.FieldByName('SORGFILENAME').AsString := Orgfilename ;
                                         MMQuery.FieldByName('SPATH').AsString := 'file:' + TempStr;
                                         MMQuery.FieldByName('DFILEDATE').AsDateTime := oEmail.SentOn ;
                                         MMQuery.Post ;
                                   end;
                             end; // end aQ empty
                          end; 
                        end ; // end var is null
                    // aQuery.ParamByName('email').AsString := LowerCase(oEmail.)
                    AosfProgress.SetProgress(oEmail.subject,i);
            except
            end;
          end;
  except
  end;
  finally
     aQuery.free ;
     bQuery.free ;
     MMQuery.free ;
  end;
end;

procedure FromEmailOutlookRecInBox( folder,oNameSpace:OleVariant ); var
	oEmail,resultItems,reaccurence,ObjectRef,objField  : OLEvariant;
	Criteria,PropString,SenderName:string;
  i,x: Integer ;
  aEvent : TVpEvent ;
  BFound:Boolean ;
  aQuery,BQuery, MMQuery : TuniQuery ;
  AFile,TempStr,Orgfilename,ToFilename : String ;
begin
    aQuery := TuniQuery.Create(self) ;
    bQuery := TuniQuery.Create(self) ;
    MMQuery:= TuniQuery.Create(self) ;
    try
    aQuery.Connection := DMTCCoreLink.TheZConnection ;
    bQuery.Connection := DMTCCoreLink.TheZConnection ;
    MMQuery.Connection := DMTCCoreLink.TheZConnection ;
	 try  // "[Start] >= '03/01/2004 08:00 PM' and [Start] <= '03/30/2004 08:00 AM'"
   aQuery.SQL.Text := 'select Waccountid from debtor where lower(SEMAIL) = :email' ;
   aQuery.SQL.Add( ' union select Waccountid from creditor  where lower(SEMAIL) = :email') ;

   if TDatabaseTableRoutines.FieldExists('dochead','X_CUSTOMERS_EMAIL_ADDRESS') then
     begin
        aQuery.SQL.Add( ' union select Waccountid from dochead  where lower(X_CUSTOMERS_EMAIL_ADDRESS) = :email') ;
     end;
     bQuery.SQL.Text := 'SELECT a.WACCOUNTID FROM ACCOUNTREF a join account b on a.WACCOUNTID=b.WACCOUNTID '+
     ' and b.WACCOUNTTYPEID in (1,2) where lower(a.SREFERENCE) = :REF' ;
      MMQuery.SQL.Text:='select * from MULTIMEDIA where STYPE= ' +  QuotedStr('DEBCR') + ' and SORGFILENAME = :ORGFILE and  WREFID = :REFID' ;
    //   Criteria := '[ReceivedTime] >=  ' + QuotedStr(DateToStr(date-30) +' 00:00')+' and [ReceivedTime] <= ' + QuotedStr(DateToStr(date+maxdaysahead+1) +' 00:00');
       Criteria := '[SentOn] >=  '  + QuotedStr(DateToStr(date-30)+' 00:00') ;

        resultItems := folder.Items.Restrict(Criteria);
        AosfProgress.initProgress('Importing email',resultItems.Count);
        for i := 1 to  resultItems.Count do
          begin
           oEmail := resultItems.Item[i] ;
            try
              if  not VarIsNull( oEmail ) and not VarIsClear(oEmail) then
                  begin
                    aQuery.close ;
                    try
                      SenderName :=  LowerCase(oEmail.To);
                    except
                      // SenderName :=  oEmail.SenderName ;
                     end;
                    if pos(';',SenderName) > 0 then
                      delete(SenderName,pos(';',SenderName),length(SenderName)) ;
                     if Copy(SenderName,1,1) ='''' then
                        SenderName := copy(SenderName,2,length(SenderName)-2);

                    if pos('@',SenderName) > 0 then
                      begin
                          aQuery.ParamByName('email').AsString := LowerCase( SenderName) ;
                          aQuery.open;
                          if not aQuery.IsEmpty then
                            begin
                               MMQuery.close ;
                               MMQuery.Params[0].AsString := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                               MMQuery.Params[1].AsInteger := aQuery.Fields[0].AsInteger ;
                               MMQuery.open ;
                               if MMQuery.IsEmpty then
                                 begin
                                         AFile := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         Orgfilename := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         MMQuery.Insert ;
                                         MMQuery.FieldByName('WMMID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_MULTIM_ID') ;
                                         TempStr :=  FormatDateTime('YYYY',now) + '\'+ FormatDateTime('mm',now) +'\'+ MMQuery.FieldByName('WMMID').AsString +'_'+Orgfilename;
                                         ToFilename := IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalSaveDir) +'files\'  + TempStr ;
                                         ForceDirectories(ExtractFilePath(ToFilename)) ;
                                         oEmail.SaveAs(ToFilename);
                                         MMQuery.FieldByName('SGROUP').AsString := 'Email send';
                                         MMQuery.FieldByName('STYPE').AsString := 'DEBCR' ;
                                         MMQuery.FieldByName('WREFID').AsInteger := aQuery.Fields[0].AsInteger ;
                                         MMQuery.FieldByName('SDESCRIPTION').AsString := oEmail.Subject ;
                                         MMQuery.FieldByName('SORGFILENAME').AsString := Orgfilename ;
                                         MMQuery.FieldByName('SPATH').AsString := 'file:' + TempStr;
                                         MMQuery.FieldByName('DFILEDATE').AsDateTime := oEmail.SentOn ;
                                         MMQuery.Post ;
                                   end;
                             end; // end aQ empty
                            end else // end pos
                          begin
                           bQuery.Close;
                             bQuery.ParamByName('REF').AsString := trim(LowerCase( SenderName)) ;
                           bQuery.open;
                          if not bQuery.IsEmpty then
                            begin
                               MMQuery.close ;
                               MMQuery.Params[0].AsString := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                               MMQuery.Params[1].AsInteger := bQuery.Fields[0].AsInteger ;
                               MMQuery.open ;
                               if MMQuery.IsEmpty then
                                 begin
                                         AFile := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         Orgfilename := FormatDateTime('YYYYMMDDHHNNSS',oEmail.SentOn)+'_'+  LowerCase( SenderName) +'.msg' ;
                                         MMQuery.Insert ;
                                         MMQuery.FieldByName('WMMID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_MULTIM_ID') ;
                                         TempStr :=  FormatDateTime('YYYY',now) + '\'+ FormatDateTime('mm',now) +'\'+ MMQuery.FieldByName('WMMID').AsString +'_'+Orgfilename;
                                         ToFilename := IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalSaveDir) +'files\'  + TempStr ;
                                         ForceDirectories(ExtractFilePath(ToFilename)) ;
                                         oEmail.SaveAs(ToFilename);
                                         MMQuery.FieldByName('SGROUP').AsString := 'Email send';
                                         MMQuery.FieldByName('STYPE').AsString := 'DEBCR' ;
                                         MMQuery.FieldByName('WREFID').AsInteger := bQuery.Fields[0].AsInteger ;
                                         MMQuery.FieldByName('SDESCRIPTION').AsString := oEmail.Subject ;
                                         MMQuery.FieldByName('SORGFILENAME').AsString := Orgfilename ;
                                         MMQuery.FieldByName('SPATH').AsString := 'file:' + TempStr;
                                         MMQuery.FieldByName('DFILEDATE').AsDateTime := oEmail.SentOn ;
                                         MMQuery.Post ;
                                   end;
                             end; // end aQ empty
                          end; 
                        end ; // end var is null
                    AosfProgress.SetProgress(oEmail.subject,i);
            except
            end;
          end;
  except
  end;
  finally
     aQuery.free ;
     bQuery.free ;
     MMQuery.free ;
  end;
end;
procedure FromOutlookRec( folder:OleVariant ); var
	oAfspraak,resultItems,reaccurence  : OLEvariant;
	Criteria,PropString:string;
  i,x: Integer ;
  aEvent : TVpEvent ;
  BFound:Boolean ;
begin

	 try  // "[Start] >= '03/01/2004 08:00 PM' and [Start] <= '03/30/2004 08:00 AM'"
       Criteria := '[Start] >=  ' + QuotedStr(DateToStr(date-30) +' 00:00')+' and [Start] <= ' + QuotedStr(DateToStr(date+maxdaysahead+1) +' 00:00');
        resultItems := folder.Items .Restrict(Criteria);
        AosfProgress.initProgress('Importing',resultItems.Count);
        for i := 1 to  resultItems.Count do
        begin
         oAfspraak := resultItems.Item[i] ;
         try
        if  not VarIsNull( oAfspraak ) and not VarIsClear(oAfspraak) then
          begin
           AosfProgress.SetProgress(oAfspraak.subject,i);
               PropString := '';
               try
              if  (oAfspraak.UserProperties.Count <> 0 ) then
              PropString := VarToStr( oAfspraak.UserProperties('OSF').value) ;
              except
              end;
             if PropString <>'OSFINANCIALS' then
             // if oAfspraak.Start > date then
               begin
                 BFound := false ;
                 for x := 0 to VpFlexDataStore1.Resource.Schedule.EventCount -1 do
                   if VpFlexDataStore1.Resource.Schedule.GetEvent(x).UserField4 = oAfspraak.EntryID then
                    begin
                      aEvent := VpFlexDataStore1.Resource.Schedule.GetEvent(x) ;
                      BFound := True ;
                      Break ;
                    end;
                 if not BFound then
                 aEvent := VpFlexDataStore1.Resource.Schedule.AddEvent(VpFlexDataStore1.GetNextID('tasks'),oAfspraak.Start,IncMinute(oAfspraak.Start,oAfspraak.Duration)) ;
                 aEvent.Description := oAfspraak.subject;
                 aEvent.StartTime := oAfspraak.Start ;
                 aEvent.EndTime := IncMinute(oAfspraak.Start,oAfspraak.Duration) ;
                 if oAfspraak.RecurrenceState  <> $00000000 then//olApptNotRecurring = $00000000;
                      begin
                      reaccurence := oAfspraak.GetRecurrencePattern ;
                      case  reaccurence.RecurrenceType of
                      {olRecursDaily = }
                      $00000000 :  aEvent.RepeatCode := rtDaily ;
                      { olRecursWeekly =}
                      $00000001 : aEvent.RepeatCode := rtWeekly ;
                      {olRecursMonthly = }
                      $00000002 : aEvent.RepeatCode := rtMonthlyByDate ;
                      { olRecursMonthNth = }
                      $00000003 : aEvent.RepeatCode := rtMonthlyByDay ;
                      { olRecursYearly =}
                      $00000005 : aEvent.RepeatCode := rtYearlyByDate ;
                      { olRecursYearNth = }
                      $00000006 : aEvent.RepeatCode := rtYearlyByDay ;
                      end;
                     aEvent.RepeatRangeEnd := reaccurence.PatternEndDate ;
                    end;
                 aEvent.Note := oAfspraak.Body;
                 aEvent.AlarmSet := oAfspraak.ReminderSet;
                 aEvent.UserField3 := oAfspraak.Location;
                 aEvent.UserField4 := oAfspraak.EntryID;
               end;
          end;
          except

          end;

        end;
  except
  end;
end;

procedure FromOutlook  ;
var oOutlook   : OLEvariant;
		oNameSpace : OLEvariant;
		oFolder    : OLEvariant;
		cSubject   : string;
		cLocation  : string;
		cStart     : string;
    var
     EventList: TList ;
     i,day : Integer  ;
begin
 EventList:= TList.Create ;
 try
    try
      oOutlook := GetOutlookObject;
      oNameSpace := oOutLook.GetNamespace('MAPI');
      oNameSpace.Logon(EmptyParam, EmptyParam, False, True);
      oFolder    := oNameSpace.GetDefaultFolder(olFolderCalendar);
      try
        try
          FromOutlookRec( oFolder );
          if DMTCCoreLink.IsRegistered('{7408300F-E57A-45C2-978A-6B0C282665A4}') then
           begin
            oFolder := UnAssigned;
            oFolder := oNameSpace.GetDefaultFolder(olFolderInbox);
            FromEmailOutlookRec(oFolder,oNameSpace);
            oFolder := UnAssigned;
            oFolder := oNameSpace.GetDefaultFolder(olFolderSentMail);
            FromEmailOutlookRecInBox(oFolder,oNameSpace);
           end;
        except
          on e:Exception do
            ShowMessageFmt( 'Error in export to outlook!' + #10#13#10#13 + '%s', [ e.Message ] );
        end;
      finally
        oFolder := UnAssigned;
        oNameSpace := UnAssigned;
      end;
    except
      on e:Exception do
      	ShowMessageFmt( '(Outlook) was not found!' + #10#13#10#13 + '%s', [ e.Message ] );
    end;
  finally
     EventList.free ;
  end;
end;



begin
 AosfProgress := TfmNewProgress.Create(Application);
 try
  FromOutlook ;

 finally
   FreeAndNil(AosfProgress);
 end;

 VpFlexDataStore1.PostEvents ;
end;

function TPlanerMainForm.VpFlexDataStore1GetNextID(Sender: TObject;
  TableName: String): Integer;
begin
result := -1 ;
end;

procedure TPlanerMainForm.bManualClick(Sender: TObject);
var
  fmEventList: TfmEventList;
begin
  fmEventList:= TfmEventList.Create(self);
  try
    fmEventList.Resource := VpFlexDataStore1.ResourceID ;
    fmEventList.ShowModal ;
  finally
    fmEventList.free ;

  end;
  VpFlexDataStore1.PostEvents ;
  VpFlexDataStore1.RefreshEvents ; 

end;

initialization
twf_TosFDayView.Create(nil);
end.

