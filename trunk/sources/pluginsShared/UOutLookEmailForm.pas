unit UOutLookEmailForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,VirtualTable, DB, Grids, DBGrids, ComCtrls,comobj,NewProgress,
  VpBase, VpMisc, VpNavBar, VpContactGrid, VpBaseDS, VpTaskList, VpDBDS, VpBDEDS,
  VpMonthView, VpDayView, VpDlg, VpResEditDlg, VpTaskEditDlg, VpContactEditDlg,
  VpEvntEditDlg, VpData, VpLEDLabel, VpClock, VpWeekView, VpPrtPrvDlg, VpPrtFmt,
  VpPrtFmtCBox, VpEdPop, VpDateEdit, VpPrtFmtDlg, VpContactButtons,
  VpFlxDS, StdCtrls, ExtCtrls,
  DBAccess , Uni, Menus, MemDS ;

type
  TfmOutlookEmail = class(TForm)
    PageControl1: TPageControl;
    tsEmail: TTabSheet;
    tsAgenda: TTabSheet;
    DBGrid1: TDBGrid;
    dsAgenda: TDataSource;
    DBGrid2: TDBGrid;
    DSEmail: TDataSource;
    Panel1: TPanel;
    BSyncToosF: TButton;
    dFromdate: TDateTimePicker;
    Lfromdate: TLabel;
    dToDate: TDateTimePicker;
    LTodate: TLabel;
    BOsFTOOutlook: TButton;
    QGen: TuniQuery;
    bMail: TButton;
    PopupMenu1: TPopupMenu;
    Selectaccount1: TMenuItem;
    Copytoaccount1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BOsFTOOutlookClick(Sender: TObject);
    procedure BSyncToosFClick(Sender: TObject);
    procedure bMailClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Selectaccount1Click(Sender: TObject);
    procedure Copytoaccount1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure BoutlookClick(Sender: TObject);
    procedure bOutlookToosFClick(Sender: TObject);
    procedure OnDbOpen (Sender : TDataSet);
    function GetOutlookObject: OleVariant;
    { Private declarations }
  public
     AEmailDataset : TVirtualTable ;
     AAppointmenDataset : TVirtualTable ;
     AosfProgress : TfmNewProgress ;
     VpFlexDataStore1 : TVpFlexDataStore ;
     oOutlook,oNameSpace   : OLEvariant;
     procedure GenTypeGetText(Sender: TField;  var Text: String; DisplayText: Boolean);
     function GetOutlookFolder(AOutlookfolder :Integer) : OleVariant;
     procedure GenAccountGetText(Sender: TField;  var Text: String; DisplayText: Boolean);
    { Public declarations }
  end;

var
  fmOutlookEmail: TfmOutlookEmail;

implementation

uses OSFGeneralRoutines, UDMTCCoreLink,DateUtils, NewLookup, osfLookup;

const
 maxdaysahead : integer = 30 ;
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
{$R *.dfm}

function  TfmOutlookEmail.GetOutlookObject:OleVariant;
begin
	try
		Result := GetActiveOleObject('Outlook.Application');
	except
		Result := CreateOleObject('Outlook.Application');
	end;
end;

procedure TfmOutlookEmail.GenTypeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  case sender.AsInteger of
  0 : Text := 'Delete from outlook' ;
  1 : Text := 'Inserted into outlook' ;
  2 : Text := 'Inserted into osF' ;
  3 : Text := '->Found new email' ;
  4 : Text := '->Unmatched' ;
  5 : Text := '->Found new email' ;
  6 : Text := '->Unmatched' ;
  7 : Text := 'Ref added refresh for link' ;
  8 : Text := '<-Found new email' ;
  9 : Text := '<-Unmatched' ;
  10 : Text := '<-Found new email' ;
  11 : Text := '<-Unmatched' ;
  end;
end;


procedure TfmOutlookEmail.BoutlookClick(Sender: TObject);
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
  AAppointmenDataset.Insert ;
  AAppointmenDataset.FieldByName('DDATE').AsDateTime := oAppoint.Start ;
  AAppointmenDataset.FieldByName('SAPPOINTMENT').AsString := oAppoint.Subject ;
  AAppointmenDataset.FieldByName('WSTATUS').AsInteger := 1 ;
  AAppointmenDataset.Post ;
end;


procedure RemoveOldAppointments( folder:OleVariant ); var
	oAppoint,resultItems  : OLEvariant;
	Criteria,StrResult:string;
  i : Integer ;
begin
  maxdaysahead := DaysBetween(dToDate.Date,Date) ;
	 try  // "[Start] >= '03/01/2004 08:00 PM' and [Start] <= '03/30/2004 08:00 AM'"
       Criteria := '[Start] >=  ' + QuotedStr(DateToStr(date) +' 00:00')+' and [Start] <= ' + QuotedStr(DateToStr(date+maxdaysahead) +' 00:00');
       resultItems := folder.Items.Restrict(Criteria);
       AosfProgress.initProgress('Deleting old appointents',resultItems.Count);
        for i := resultItems.Count   downto 1 do
        begin
         oAppoint := resultItems.Item[i] ;
         try
          AosfProgress.SetProgress('',i);
        if  not VarIsNull( oAppoint ) and not VarIsClear(oAppoint) then
          begin
             StrResult := '' ;
             try
             StrResult := VarToStr( oAppoint.UserProperties('OSF').value) ;
             except
             end;
             if  StrResult = 'OSFINANCIALS' then
               begin
                 AAppointmenDataset.Insert ;
                 AAppointmenDataset.FieldByName('DDATE').AsDateTime := oAppoint.Start ;
                 AAppointmenDataset.FieldByName('SAPPOINTMENT').AsString := oAppoint.Subject ;
                 AAppointmenDataset.FieldByName('WSTATUS').AsInteger := 0 ;
                 AAppointmenDataset.Post ;
                 oAppoint.Delete;
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
  maxdaysahead := DaysBetween(dToDate.Date,Date) ;
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
 AosfProgress := TfmNewProgress.Create(Application);
 try
 AAppointmenDataset.Close ;
 AAppointmenDataset.Open ;
 tsAgenda.TabVisible := True ;
 PageControl1.ActivePage := tsAgenda ;
 ToOutlook ;
 dsAgenda.DataSet := AAppointmenDataset ;
 finally
   FreeAndNil(AosfProgress);
 end;
end;

procedure TfmOutlookEmail.FormCreate(Sender: TObject);
begin
  AEmailDataset := TVirtualTable.Create(self) ;
  AAppointmenDataset := TVirtualTable.Create(self);
  AEmailDataset.AfterOpen := OnDbOpen ;
  AAppointmenDataset.AfterOpen := OnDbOpen ;
  AAppointmenDataset.FieldDefs.Add('DDATE',ftDate);
  AAppointmenDataset.FieldDefs.Add('SAPPOINTMENT',ftString,255);
  AAppointmenDataset.FieldDefs.Add('WSTATUS',ftInteger);
  AAppointmenDataset.open ;
  AEmailDataset.FieldDefs.Add('DDATE',ftDate);
  AEmailDataset.FieldDefs.Add('SFROM',ftString,255);
  AEmailDataset.FieldDefs.Add('SDESCRIPTION',ftString,255);
  AEmailDataset.FieldDefs.Add('FUID',ftString,255);
  AEmailDataset.FieldDefs.Add('WACCOUNTID',ftInteger);
  AEmailDataset.FieldDefs.Add('WSTATUS',ftInteger);
  AEmailDataset.FieldDefs.Add('DSENDON',ftDatetime);
  AEmailDataset.open ;
  dFromdate.Date := date - 30 ;
  dToDate.Date := date + 30 ;
  bMail.Visible :=  DMTCCoreLink.IsRegistered('{7408300F-E57A-45C2-978A-6B0C282665A4}') ;
end;

procedure TfmOutlookEmail.FormDestroy(Sender: TObject);
begin
  AEmailDataset.free ;
  AAppointmenDataset.free ;

end;

procedure TfmOutlookEmail.BOsFTOOutlookClick(Sender: TObject);
begin
 BoutlookClick(nil);
end;

procedure TfmOutlookEmail.bOutlookToosFClick(Sender: TObject);
var
 DoMail : Boolean ;
 


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
        Criteria := '[ReceivedTime] >=  '  + QuotedStr(DateToStr(dFromdate.Date)+' 00:00') ;
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
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := aQuery.Fields[0].AsInteger ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 3 ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.Post ;

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
                             end else // end aQ empty
                             begin
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := 0 ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 4 ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.Post ;
                             end;
                              
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
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := bQuery.Fields[0].AsInteger ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 5 ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.Post ;


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
                             end else   // end aQ empty
                             begin
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := 0 ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 6 ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.Post ;
                             end;
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
        Criteria := '[Criteria] >=  ' + QuotedStr(DateToStr(dFromdate.Date))  ;
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
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := aQuery.Fields[0].AsInteger ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 8 ;
                                        AEmailDataset.Post ;
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
                             end else // end aQ empty
                             begin
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := 0 ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 9 ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.Post ;
                             end;
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
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := bQuery.Fields[0].AsInteger ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 10 ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.Post ;

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
                             end else // end aQ empty
                             begin
                                        AEmailDataset.Insert ;
                                        AEmailDataset.FieldByName('DDATE').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('DSENDON').AsDateTime := oEmail.SentOn ;
                                        AEmailDataset.FieldByName('SFROM').AsString := LowerCase( SenderName) ;
                                        AEmailDataset.FieldByName('SDESCRIPTION').AsString := oEmail.Subject;
                                        AEmailDataset.FieldByName('WACCOUNTID').AsInteger := 0 ;
                                        AEmailDataset.FieldByName('WSTATUS').AsInteger := 11 ;
                                        AEmailDataset.FieldByName('FUID').AsString :=  oEmail.EntryID ;
                                        AEmailDataset.Post ;
                             end;
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
procedure FromOutlookRec( folder:OleVariant ); var
	oAfspraak,resultItems,reaccurence  : OLEvariant;
	Criteria,PropString:string;
  i,x: Integer ;
  aEvent : TVpEvent ;
  BFound:Boolean ;
begin
 	 try  // "[Start] >= '03/01/2004 08:00 PM' and [Start] <= '03/30/2004 08:00 AM'"
    Criteria := '[Start] >=  ' + QuotedStr(DateToStr(Date) +' 00:00')+' and [Start] <= ' + QuotedStr(DateToStr(date+maxdaysahead+1) +' 00:00');
     //  Criteria := '[Start] >=  '  + QuotedStr(DateToStr(date-30)+' 00:00') ;
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
             if PropString <> 'OSFINANCIALS' then
             // if oAfspraak.Start > date then
               begin
                  AAppointmenDataset.Insert ;
                  AAppointmenDataset.FieldByName('DDATE').AsDateTime := oAfspraak.Start ;
                  AAppointmenDataset.FieldByName('SAPPOINTMENT').AsString := oAfspraak.Subject ;
                  AAppointmenDataset.FieldByName('WSTATUS').AsInteger := 2 ;
                  AAppointmenDataset.Post ;

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
    try
      oOutlook := GetOutlookObject;
      oNameSpace := oOutLook.GetNamespace('MAPI');
      oNameSpace.Logon(EmptyParam, EmptyParam, False, True);
      oFolder    := oNameSpace.GetDefaultFolder(olFolderCalendar);
      try

        try
          if not DoMail then
             FromOutlookRec( oFolder );

          if DoMail  then
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

	end;
  finally
     EventList.free ;
  end;
end;



begin
 AosfProgress := TfmNewProgress.Create(Application);
 try
 AAppointmenDataset.Close ;
 AAppointmenDataset.Open ;
 AEmailDataset.Close ;
 AEmailDataset.Open ;

  maxdaysahead := DaysBetween(dToDate.Date,Date) ;
   DoMail := (Sender <> nil) ;
 FromOutlook ;
 dsAgenda.DataSet := AAppointmenDataset ;
 DSEmail.DataSet := AEmailDataset ;

 tsAgenda.TabVisible := not DoMail ;
 tsEmail.TabVisible := DoMail ;
 if not DoMail then
  PageControl1.ActivePage := tsAgenda
  else
  PageControl1.ActivePage := tsEmail  ;
 finally
   FreeAndNil(AosfProgress);
 end;
 VpFlexDataStore1.PostEvents ;
end;


procedure TfmOutlookEmail.BSyncToosFClick(Sender: TObject);
begin
 bOutlookToosFClick(nil);
end;

procedure TfmOutlookEmail.bMailClick(Sender: TObject);
begin
 bOutlookToosFClick(self);
end;

procedure TfmOutlookEmail.OnDbOpen(Sender: TDataSet);
begin
 Sender.FindField('WSTATUS').OnGetText := GenTypeGetText ;
 if sender.FindField('WACCOUNTID') <> nil then
  Sender.FindField('WACCOUNTID').OnGetText := GenAccountGetText ;
end;

procedure TfmOutlookEmail.GenAccountGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
 Text := TDataBaseRoutines.GetAccountFullDescription(Sender.AsInteger);
end;

procedure TfmOutlookEmail.DBGrid1DblClick(Sender: TObject);

 var
	oAfspraak,resultItems,reaccurence  : OLEvariant;
	Criteria,PropString,ToFilename,AFile,TempString,SLinkname,Orgfilename,TempStr:string;
  i,x: Integer ;
  aEvent : TVpEvent ;
  BFound:Boolean ;
  Adate : TdateTime ;
   MMQuery : TuniQuery ;

begin


        //   Criteria := '[ReceivedTime] >=  ' + QuotedStr(DateToStr(date-30) +' 00:00')+' and [ReceivedTime] <= ' + QuotedStr(DateToStr(date+max
 if (AEmailDataset.FieldByName('WSTATUS').AsInteger in [3,4,5,6]) then
  begin
  reaccurence := GetOutlookFolder(olFolderInbox);
  // Criteria := '[ReceivedTime]  =  ' + QuotedStr(AEmailDataset.FieldByName('DDATE').AsString ) ;

  //Criteria := '[ReceivedTime]  >=  ' + QuotedStr(AEmailDataset.FieldByName('DDATE').AsString ) + ' and [ReceivedTime]  <=  ' + QuotedStr(DateToStr(AEmailDataset.FieldByName('DDATE').AsDateTime+1) )  ;
  Criteria := '[SentOn]  >=  ' + QuotedStr(AEmailDataset.FieldByName('DDATE').AsString ) + ' and [SentOn]  <=  ' + QuotedStr(DateToStr(AEmailDataset.FieldByName('DDATE').AsDateTime+1) )  ;
  end else
  begin
  reaccurence := GetOutlookFolder(olFolderSentMail) ;


  Criteria := '[SentOn]  >=  ' + QuotedStr(AEmailDataset.FieldByName('DDATE').AsString ) + ' and [SentOn]  <=  ' + QuotedStr(DateToStr(AEmailDataset.FieldByName('DDATE').AsDateTime+1) )  ;

  end;

 	 try  // "[Start] >= '03/01/2004 08:00 PM' and [Start] <= '03/30/2004 08:00 AM'"


    resultItems := reaccurence.Items .Restrict(Criteria);
    //AosfProgress.initProgress('Importing',resultItems.Count);
        for i := 1 to  resultItems.Count do
        begin
           oAfspraak := resultItems.Item[i] ;
            if  not VarIsNull( oAfspraak ) and not VarIsClear(oAfspraak) then
            begin
             // showmessage(DateTimeToStr(oAfspraak.SentOn) +'<->' +DateTimeToStr(AEmailDataset.FieldByName('DSENDON').AsDateTime)) ;
              if DateTimeToStr(oAfspraak.SentOn) = DateTimeToStr(AEmailDataset.FieldByName('DSENDON').AsDateTime) then
               if AEmailDataset.FieldByName('SDESCRIPTION').AsString = copy(oAfspraak.Subject,1,255) then
                begin
                 if sender = nil then
                   begin
                   MMQuery:= TuniQuery.Create(self) ;
                      try

                      MMQuery.Connection := DMTCCoreLink.TheZConnection ;
                      MMQuery.SQL.Text:='select * from MULTIMEDIA where STYPE= ' +  QuotedStr('DEBCR') + ' and SORGFILENAME = :ORGFILE and  WREFID = :REFID' ;


                          if (AEmailDataset.FieldByName('WSTATUS').AsInteger in [9,11]) then
                          begin
                         SLinkname :=  'Email send';
                         Adate     :=  oAfspraak.SentOn ;
                         end else
                         begin
                         SLinkname :=   'Email';
                         Adate     :=  oAfspraak.SentOn ;
                         end;
                         AFile := FormatDateTime('YYYYMMDDHHNNSS',Adate)+'_'+  LowerCase(  AEmailDataset.FieldByName('SFROM').AsString) +'.msg' ;
                         Orgfilename := FormatDateTime('YYYYMMDDHHNNSS',Adate)+'_'+  LowerCase( AEmailDataset.FieldByName('SFROM').AsString) +'.msg' ;
                         MMQuery.Insert ;
                         MMQuery.FieldByName('WMMID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_MULTIM_ID') ;
                         TempStr :=  FormatDateTime('YYYY',now) + '\'+ FormatDateTime('mm',now) +'\'+ MMQuery.FieldByName('WMMID').AsString +'_'+Orgfilename;
                         ToFilename := IncludeTrailingPathDelimiter(DMTCCoreLink.GetLocalSaveDir) +'files\'  + TempStr ;
                          MMQuery.Params[1].AsInteger :=  AEmailDataset.FieldByName('WACCOUNTID').AsInteger ;
                          MMQuery.Params[0].AsString :=  Orgfilename ;
                          MMQuery.open ;
                         if  MMQuery.IsEmpty then
                         begin
                         ForceDirectories(ExtractFilePath(ToFilename)) ;
                         oAfspraak.SaveAs(ToFilename);
                         MMQuery.FieldByName('SGROUP').AsString := SLinkname ;
                         MMQuery.FieldByName('STYPE').AsString := 'DEBCR' ;
                         MMQuery.FieldByName('WREFID').AsInteger := AEmailDataset.FieldByName('WACCOUNTID').AsInteger ;
                         MMQuery.FieldByName('SDESCRIPTION').AsString := oAfspraak.Subject ;
                         MMQuery.FieldByName('SORGFILENAME').AsString := Orgfilename ;
                         MMQuery.FieldByName('SPATH').AsString := 'file:' + TempStr;
                         MMQuery.FieldByName('DFILEDATE').AsDateTime :=Adate ;
                         MMQuery.Post ;
                         end ;
                         AEmailDataset.Edit ;
                         AEmailDataset.FieldByName('WSTATUS').AsInteger := AEmailDataset.FieldByName('WSTATUS').AsInteger - 1 ;
                         AEmailDataset.Post ;

                      finally
                         MMQuery.Free ;
                      end;
                   end else
                  oAfspraak.Display;
                end;
         end;
       end;
      Except

      end;

   // AEmailDataset.FieldByName('FUID').AsString

   //  EntryID
end;



procedure TfmOutlookEmail.Selectaccount1Click(Sender: TObject);
  var
 aReturn : String ;
 AReturnId : Integer ;
begin
 if not (AEmailDataset.FieldByName('WSTATUS').AsInteger in [4,6,9,11]) then exit ;
    AReturnId := 0 ;
    osflookup.OSFGetLookupValue(aReturn,AReturnId,'Select account','OULACC',tcstDEBCRED,tcltAccount,AReturnId,0);
    if AReturnId >0 then
      begin
         TDatabaseDebtorCreditorRoutines.AddRef(AEmailDataset.FieldByName('SFROM').AsString,AReturnId);
         AEmailDataset.Edit ;
         AEmailDataset.FieldByName('WACCOUNTID').AsInteger := AReturnId ;
         AEmailDataset.Post ;
         DBGrid1DblClick(nil);
      end;
end;
function TfmOutlookEmail.GetOutlookFolder(AOutlookfolder :Integer) : OleVariant;
 


begin
   oOutlook := GetOutlookObject;
   oNameSpace := oOutLook.GetNamespace('MAPI');
   oNameSpace.Logon(EmptyParam, EmptyParam, False, True);
   Result   := oNameSpace.GetDefaultFolder(AOutlookfolder);
end;

procedure TfmOutlookEmail.Copytoaccount1Click(Sender: TObject);
var
 aReturn : String ;
 AReturnId : Integer ;
begin
 if not (AEmailDataset.FieldByName('WSTATUS').AsInteger in [4,6,9,11]) then exit ;
    AReturnId := 0 ;
    osflookup.OSFGetLookupValue(aReturn,AReturnId,'Select account','OULACC',tcstDEBCRED,tcltAccount,AReturnId,0);
    if AReturnId >0 then
      begin
 
         AEmailDataset.Edit ;

         AEmailDataset.FieldByName('WACCOUNTID').AsInteger := AReturnId ; 
         AEmailDataset.Post ;
         DBGrid1DblClick(nil);
      end;

end;

procedure TfmOutlookEmail.FormShow(Sender: TObject);
begin
 BSyncToosF.Caption := DMTCCoreLink.GetTextLang( 3476) ;
 BOsFTOOutlook.Caption := DMTCCoreLink.GetTextLang( 3477) ;
 Lfromdate.Caption := DMTCCoreLink.GetTextLang( 243) ;
 LTodate.Caption := DMTCCoreLink.GetTextLang( 287) ;

 bMail.Caption := DMTCCoreLink.GetTextLang( 3478) ;
 DBGrid1.Columns[0].Title.Caption :=DMTCCoreLink.GetTextLang( 1802) ;
 DBGrid2.Columns[0].Title.Caption :=DMTCCoreLink.GetTextLang( 1802) ;
 DBGrid1.Columns[1].Title.Caption :=DMTCCoreLink.GetTextLang( 3479) ;

 DBGrid1.Columns[2].Title.Caption :=DMTCCoreLink.GetTextLang( 178) ;
 DBGrid2.Columns[1].Title.Caption :=DMTCCoreLink.GetTextLang( 178) ;

 DBGrid1.Columns[3].Title.Caption :=DMTCCoreLink.GetTextLang( 31) +' / ' + DMTCCoreLink.GetTextLang( 30) ;


  DBGrid1.Columns[4].Title.Caption :=DMTCCoreLink.GetTextLang( 1293) ;
 DBGrid2.Columns[2].Title.Caption :=DMTCCoreLink.GetTextLang( 1293) ;
 self.Caption := DMTCCoreLink.GetTextLang( 3480);
end;

end.
