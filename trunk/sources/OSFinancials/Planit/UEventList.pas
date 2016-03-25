unit UEventList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,    DBAccess , Uni, ActnList, XPStyleActnCtrls, ActnMan, ExtCtrls, StdCtrls,
  ComCtrls, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfmEventList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ActionManager1: TActionManager;
    Action1: TAction;
    ZQEvents: TuniQuery;
    dsEvents: TDataSource;
    ZQEventsRECORDID: TIntegerField;
    ZQEventsSTARTTIME: TDateTimeField;
    ZQEventsENDTIME: TDateTimeField;
    ZQEventsRESOURCEID: TIntegerField;
    ZQEventsWCONTACTID: TIntegerField;
    ZQEventsDESCRIPTION: TStringField;
    ZQEventsNOTES: TStringField;
    ZQEventsCATEGORY: TIntegerField;
    ZQEventsALLDAYEVENT: TSmallintField;
    ZQEventsDINGPATH: TStringField;
    ZQEventsALARMSET: TSmallintField;
    ZQEventsALARMADVANCE: TIntegerField;
    ZQEventsALARMADVANCETYPE: TIntegerField;
    ZQEventsSNOOZETIME: TDateTimeField;
    ZQEventsREPEATCODE: TIntegerField;
    ZQEventsREPEATRANGEEND: TDateTimeField;
    ZQEventsCUSTOMINTERVAL: TIntegerField;
    ZQEventsUSERFIELD0: TStringField;
    ZQEventsUSERFIELD1: TStringField;
    ZQEventsUSERFIELD2: TStringField;
    ZQEventsUSERFIELD3: TStringField;
    ZQEventsUSERFIELD4: TStringField;
    ZQEventsUSERFIELD5: TStringField;
    ZQEventsUSERFIELD6: TStringField;
    ZQEventsUSERFIELD7: TStringField;
    ZQEventsUSERFIELD8: TStringField;
    ZQEventsUSERFIELD9: TStringField;
    ZQEventsWACCOUNTID: TIntegerField;
    Panel3: TPanel;
    LFromdate: TLabel;
    Estart1: TEdit;
    l1: TLabel;
    Estart2: TEdit;
    L2: TLabel;
    Estart3: TEdit;
    L3: TLabel;
    Estart4: TEdit;
    L4: TLabel;
    Estart5: TEdit;
    L5: TLabel;
    Estart6: TEdit;
    L6: TLabel;
    Estart7: TEdit;
    L7: TLabel;
    cbprod1: TComboBox;
    cbuser: TComboBox;
    cbprod2: TComboBox;
    cbprod3: TComboBox;
    cbprod6: TComboBox;
    cbProject: TComboBox;
    Ehoure1: TEdit;
    Ehoure2: TEdit;
    Ehoure3: TEdit;
    Ehoure4: TEdit;
    Ehoure5: TEdit;
    Ehoure6: TEdit;
    Ehoure7: TEdit;
    cbprod4: TComboBox;
    cbprod5: TComboBox;
    cbprod7: TComboBox;
    MonthCalendar1: TMonthCalendar;
    lUser: TLabel;
    LProject: TLabel;
    bCreate: TButton;
    EAccount: TEdit;
    Blookup: TButton;
    LClient: TLabel;
    bClear: TButton;
    BDelselected: TButton;
    Lproduct: TLabel;
    LTime: TLabel;
    Lstarttime: TLabel;
    cbWeekview: TCheckBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1RECORDID: TcxGridDBColumn;
    cxGrid1DBTableView1STARTTIME: TcxGridDBColumn;
    cxGrid1DBTableView1ENDTIME: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1ALARMSET: TcxGridDBColumn;
    cxGrid1DBTableView1USERFIELD0: TcxGridDBColumn;
    cxGrid1DBTableView1USERFIELD5: TcxGridDBColumn;
    cxGrid1DBTableView1WACCOUNTID: TcxGridDBColumn;
    procedure ZQEventsWACCOUNTIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ZQEventsUSERFIELD5GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure MonthCalendar1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BlookupClick(Sender: TObject);
    procedure bCreateClick(Sender: TObject);
    procedure ZQEventsAfterInsert(DataSet: TDataSet);
    procedure bClearClick(Sender: TObject);
    procedure cbProjectChange(Sender: TObject);
    procedure BDelselectedClick(Sender: TObject);
    procedure cbWeekviewClick(Sender: TObject);
  private
    FResource: Integer;
    procedure SetResource(const Value: Integer);
    procedure InitAccountText;
    { Private declarations }
  public
   property Resource : Integer  read FResource write SetResource;
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink, TcashClasses, OSFGeneralRoutines, Lookup, osfLookup,
  UMsgBox, UDmQuantumGridDefs;

{$R *.dfm}

procedure TfmEventList.ZQEventsWACCOUNTIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
text := DMTCCoreLink.AccObject.getAccountFullDescription(Sender.AsInteger);
end;

procedure TfmEventList.FormCreate(Sender: TObject);
begin
  DMTCCoreLink.AssignConnectionToChilds(self);
  TDataBaseStringRoutines.FillStringListWithSelect(cbProject.Items,'SELECT WJOBPROJECTID, SJOBPROJECTCODE || SDESCRIPTION SJOBPROJECTCODE  FROM JOBPROJECT where BENABLED =1');
  if DMTCCoreLink.SQLList.GetFormatedSQLByName('EVENT_PRODS') <> '' then
  begin
  TDataBaseStringRoutines.FillStringListWithSelect(cbprod1.Items,DMTCCoreLink.SQLList.GetFormatedSQLByName('EVENT_PRODS'));
  cbprod2.Items.Assign(cbprod1.Items);
  cbprod3.Items.Assign(cbprod1.Items);
  cbprod4.Items.Assign(cbprod1.Items);
  cbprod5.Items.Assign(cbprod1.Items);
  cbprod6.Items.Assign(cbprod1.Items);
  cbprod7.Items.Assign(cbprod1.Items);
  end;
  TDataBaseRoutines.FillStringsWithReportingGroups(cbuser.Items,31);
end;

procedure TfmEventList.SetResource(const Value: Integer);
begin
   FResource := Value;
   ZQEvents.close ;
   ZQEvents.Params[0].AsInteger := FResource ;
   ZQEvents.Params[1].AsDate := MonthCalendar1.Date  ;
   if cbWeekview.Checked then
   ZQEvents.Params[2].AsDate := MonthCalendar1.Date +7 
   else
   ZQEvents.Params[2].AsDate := MonthCalendar1.Date +1 ;
   ZQEvents.open ;
end;

procedure TfmEventList.ZQEventsUSERFIELD5GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
text := DMTCCoreLink.stockObject.GetStockCodeAndDescription(StrToIntDef(Sender.AsString,0));
end;

procedure TfmEventList.MonthCalendar1Exit(Sender: TObject);
var
 i : Integer ;
  days : array[1..7] of string;
begin
 Resource := FResource ;
  days[1] := DMTCCoreLink.GetTextLang(2300);
  days[2] := DMTCCoreLink.GetTextLang(2301);// Mon';
  days[3] := DMTCCoreLink.GetTextLang(2302);//'Tue';
  days[4] := DMTCCoreLink.GetTextLang(2303);//'Wed';
  days[5] := DMTCCoreLink.GetTextLang(2304);//'Thu';
  days[6] := DMTCCoreLink.GetTextLang(2305);//'Fri';
  days[7] := DMTCCoreLink.GetTextLang(2306);//'Sat';

 if cbWeekview.Checked then
  begin



 l1.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 l2.Caption :=  days[DayOfWeek(MonthCalendar1.Date+1)] +' ' + DateToStr(MonthCalendar1.Date+1) ;
 l3.Caption :=  days[DayOfWeek(MonthCalendar1.Date+2)] +' ' + DateToStr(MonthCalendar1.Date+2) ;
 l4.Caption :=  days[DayOfWeek(MonthCalendar1.Date+3)] +' ' + DateToStr(MonthCalendar1.Date+3) ;
 l5.Caption :=  days[DayOfWeek(MonthCalendar1.Date+4)] +' ' + DateToStr(MonthCalendar1.Date+4) ;
 l6.Caption :=  days[DayOfWeek(MonthCalendar1.Date+5)] +' ' + DateToStr(MonthCalendar1.Date+5) ;
 l7.Caption :=  days[DayOfWeek(MonthCalendar1.Date+6)] +' ' + DateToStr(MonthCalendar1.Date+6) ;
 end else
 begin
 l1.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 l2.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 l3.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 l4.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 l5.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 l6.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 l7.Caption :=  days[DayOfWeek(MonthCalendar1.Date)] +' ' + DateToStr(MonthCalendar1.Date) ;
 end;
end;

procedure TfmEventList.FormShow(Sender: TObject);
begin
Lproduct.Caption := DMTCCoreLink.gettextlang(37);
Lstarttime.Caption := DMTCCoreLink.gettextlang(2407);
LTime.Caption := DMTCCoreLink.gettextlang(3436);

bClear.Caption := DMTCCoreLink.gettextlang(1016);

  LFromdate.Caption := DMTCCoreLink.gettextlang(286);

  lUser.Caption := DMTCCoreLink.gettextlang(1072);

  LProject.Caption := DMTCCoreLink.gettextlang(3556);


  LClient.Caption := DMTCCoreLink.gettextlang(31);
  bCreate.Caption := DMTCCoreLink.gettextlang(3557);

  BDelselected.Caption := DMTCCoreLink.gettextlang(1842);


  Blookup.Caption := DMTCCoreLink.GetTextLangNoAmp(1880);
 

  cxGrid1DBTableView1RECORDID.Caption := DMTCCoreLink.GetTextLangNoAmp(20076);
  cxGrid1DBTableView1DESCRIPTION.Caption := DMTCCoreLink.GetTextLangNoAmp(1860);
  cxGrid1DBTableView1WACCOUNTID.Caption := DMTCCoreLink.GetTextLangNoAmp(31);
  cxGrid1DBTableView1USERFIELD5.Caption := DMTCCoreLink.GetTextLangNoAmp(37);
  cxGrid1DBTableView1STARTTIME.Caption := DMTCCoreLink.GetTextLangNoAmp(2407);
  cxGrid1DBTableView1ENDTIME.Caption := DMTCCoreLink.GetTextLangNoAmp(2408);
  cxGrid1DBTableView1ALARMSET.Caption := DMTCCoreLink.GetTextLangNoAmp(2433);
  cxGrid1DBTableView1USERFIELD0.Caption := DMTCCoreLink.GetTextLangNoAmp(1326);



  self.Caption := DMTCCoreLink.GetTextLangNoAmp(3559);


MonthCalendar1.Date := date ;
while DayOfWeek(MonthCalendar1.Date) <> 2 do
  MonthCalendar1.Date := MonthCalendar1.Date -1 ;
MonthCalendar1Exit(self);
end;

procedure TfmEventList.BlookupClick(Sender: TObject);
var
 ReturnID : Integer ;
 ReturnStr : String ;
 TaGComponent : TEdit ;
begin
  TaGComponent :=      EAccount ;
  TaGComponent.Color := clHighlight;
  try

    osflookup.OSFGetLookupValue(ReturnStr,ReturnID,'Debtor','STKS',tcstDEB,tcltAccount,  TaGComponent.tag,0,'');


    If ReturnStr = 'ESC' then
     begin
      TaGComponent.Color := clWindow ;
      exit ;
     end;
     TaGComponent.tag := ReturnID ;
   finally
     TaGComponent.Color := clWindow;
   end;
 InitAccountText ;
end;
procedure TfmEventList.InitAccountText;
var
 Code,Desc : String ;
begin
 TDataBaseRoutines.GetAccountCodeAndDescription(EAccount.Tag,Code,Desc);
EAccount.Text :=  '' ;
if  (Code <> '') or (Desc <> '' ) then
EAccount.Text :=  Code +' | ' +  Desc ;
end;

procedure TfmEventList.bCreateClick(Sender: TObject);
var
 aProd : Integer  ;
 AProjectID : Integer ;
 function GetValue (Astring : String):Double ;
 begin
   Result := StrToTimeDef(Astring,0) ;
 end;
 procedure AddRow(Astartdate : TDateTime ;AHoure: Double ;AProduct : Integer) ;
 begin
   if AProduct = 0 then exit ;
   ZQEvents.Insert ;
   ZQEventsSTARTTIME.AsDateTime := Astartdate ;
   ZQEventsENDTIME.AsDateTime := Astartdate + AHoure ;
   ZQEventsRESOURCEID.AsInteger := Resource ;
   //ZQEventsWCONTACTID
   ZQEventsDESCRIPTION.AsString := EAccount.Text + ' | ' + cbuser.Text + ' | ' + cbProject.Text   ;
   ZQEventsCATEGORY.AsInteger := 4 ;
   ZQEventsALLDAYEVENT.AsInteger := 0 ;
   ZQEventsDINGPATH.AsString := '' ;
   ZQEventsALARMSET.AsInteger := 0 ;
   ZQEventsALARMADVANCE.AsInteger := 0 ;
   ZQEventsALARMADVANCETYPE.AsInteger := 0 ;
   ZQEventsSNOOZETIME.AsDateTime := 0 ;
   ZQEventsREPEATCODE.AsInteger := 0 ;
   ZQEventsREPEATRANGEEND.AsDateTime := 0 ;
   ZQEventsCUSTOMINTERVAL.AsInteger := 0 ;
   ZQEventsUSERFIELD0.AsString := cbuser.Text ;
   ZQEventsUSERFIELD2.AsInteger := AProjectID ;
   ZQEventsUSERFIELD5.AsInteger := AProduct ;
   ZQEventsWACCOUNTID.AsInteger := EAccount.Tag ;
   ZQEvents.Post ;
 end;
 function GetDateAddResult(AAdd : Integer):Integer ;
 begin
    if cbWeekview.Checked then
      result :=  AAdd else
      Result := 0 ;
 end;
begin
 if  EAccount.Tag = 0 then
    begin
       EAccount.SetFocus ;
       raise Exception.Create(DMTCCoreLink.GetTextLang(1347){ 'You must select a account!'});
    end;

 AProjectID := 0 ;
 if cbProject.ItemIndex <> -1 then
      AProjectID :=  Integer(cbProject.items.Objects[cbProject.ItemIndex])  ;

 aProd := 0 ;
 if cbprod1.ItemIndex <> -1 then
      aProd :=  Integer(cbprod1.items.Objects[cbprod1.ItemIndex])  ;
 if  GetValue(Ehoure1.Text) <> 0 then
        AddRow(Trunc(MonthCalendar1.Date) + (GetValue(Estart1.Text) ),GetValue(Ehoure1.Text),aProd) ;

 aProd := 0 ;
 if cbprod2.ItemIndex <> -1 then
      aProd :=  Integer(cbprod2.items.Objects[cbprod2.ItemIndex])  ;
 if  GetValue(Ehoure2.Text) <> 0 then
        AddRow(Trunc(MonthCalendar1.Date+GetDateAddResult(1)) + (GetValue(Estart2.Text) ),GetValue(Ehoure2.Text),aProd) ;


 aProd := 0 ;
 if cbprod3.ItemIndex <> -1 then
      aProd :=  Integer(cbprod3.items.Objects[cbprod3.ItemIndex])  ;
 if  GetValue(Ehoure3.Text) <> 0 then
        AddRow(Trunc(MonthCalendar1.Date+GetDateAddResult(2)) + (GetValue(Estart3.Text) ),GetValue(Ehoure3.Text),aProd) ;


 aProd := 0 ;
 if cbprod4.ItemIndex <> -1 then
      aProd :=  Integer(cbprod4.items.Objects[cbprod4.ItemIndex])  ;
 if  GetValue(Ehoure4.Text) <> 0 then
        AddRow(Trunc(MonthCalendar1.Date+GetDateAddResult(3)) + (GetValue(Estart4.Text) ),GetValue(Ehoure4.Text),aProd) ;


 aProd := 0 ;
 if cbprod5.ItemIndex <> -1 then
      aProd :=  Integer(cbprod5.items.Objects[cbprod5.ItemIndex])  ;
 if  GetValue(Ehoure5.Text) <> 0 then
        AddRow(Trunc(MonthCalendar1.Date+GetDateAddResult(4)) + (GetValue(Estart5.Text) ),GetValue(Ehoure5.Text),aProd) ;


 aProd := 0 ;
 if cbprod6.ItemIndex <> -1 then
      aProd :=  Integer(cbprod6.items.Objects[cbprod6.ItemIndex])  ;
 if  GetValue(Ehoure6.Text) <> 0 then
        AddRow(Trunc(MonthCalendar1.Date+GetDateAddResult(5))+ (GetValue(Estart6.Text) ),GetValue(Ehoure6.Text),aProd) ;


 aProd := 0 ;
 if cbprod7.ItemIndex <> -1 then
      aProd :=  Integer(cbprod7.items.Objects[cbprod7.ItemIndex])  ;
 if  GetValue(Ehoure7.Text) <> 0 then
        AddRow(Trunc(MonthCalendar1.Date+GetDateAddResult(6)) + (GetValue(Estart7.Text) ),GetValue(Ehoure7.Text),aProd) ;


  bClearClick(self);
  OSFMessageDlg(DMTCCoreLink.GetTextLang(3558),mtConfirmation,[mbok],0) ;
end;

procedure TfmEventList.ZQEventsAfterInsert(DataSet: TDataSet);
begin
 ZQEventsRECORDID.AsInteger :=   DMTCCoreLink.GetNewIdStr('GEN_EVENTS_ID');
end;

procedure TfmEventList.bClearClick(Sender: TObject);
 procedure SetToDefaults(AStartEdit,AHoureEdit : TEdit ; AProdlist : TComboBox ) ;
 begin
   // AStartEdit.Text :=  '8:00' ;
   // AHoureEdit.Text :=  '0:00' ;
    AProdlist.ItemIndex := -1 ;
 end;
begin
   SetToDefaults(Estart1,Ehoure1,cbprod1);
   SetToDefaults(Estart2,Ehoure2,cbprod2);
   SetToDefaults(Estart3,Ehoure3,cbprod3);
   SetToDefaults(Estart4,Ehoure4,cbprod4);
   SetToDefaults(Estart5,Ehoure5,cbprod5);
   SetToDefaults(Estart6,Ehoure6,cbprod6);
   SetToDefaults(Estart7,Ehoure7,cbprod7);
end;

procedure TfmEventList.cbProjectChange(Sender: TObject);
var
 AProjectID : Integer ;
begin
 AProjectID := 0 ;
 if cbProject.ItemIndex <> -1 then
      AProjectID :=  Integer(cbProject.items.Objects[cbProject.ItemIndex])  ;

 if AProjectID <> 0 then
    if EAccount.tag = 0 then
      begin
       EAccount.tag := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WDEFAULTACCOUNT from JOBPROJECT where WJOBPROJECTID =' +IntToStr(AProjectID) )),0);
       InitAccountText ;
      end;
end;

procedure TfmEventList.BDelselectedClick(Sender: TObject);
var
 i : Integer ;
begin
 if OSFMessageDlg(DMTCCoreLink.GetTextLang(20003),mtConfirmation,[mbYes,mbNo],0) = mrno then exit ;

 if ZQEvents.IsEmpty then exit ;

 for i := cxGrid1DBTableView1.Controller.SelectedRecordCount -1 downto 0 do
    begin
     cxGrid1DBTableView1.Controller.SelectedRecords[i].Focused := True ;
     ZQEvents.Delete ;
    end;
end;

procedure TfmEventList.cbWeekviewClick(Sender: TObject);
begin
 MonthCalendar1Exit(self);
end;

end.

