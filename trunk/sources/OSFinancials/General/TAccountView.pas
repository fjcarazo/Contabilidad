(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
  Fully changed unit for Osfinancials.

*)
unit TAccountView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask,  ExtCtrls,
  Grids,  Buttons,
    DBAccess , Uni, ComCtrls,ShellAPI,
  UPluginsSharedUnit, Menus, MemDS, DBGrids, VirtualTable;

type
  TfmTAccountView = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    DsDr: TDataSource;
    QryTAccountDr: TuniQuery;
    QryTAccountDrDDATE: TDateTimeField;
    QryTAccountDrSREFERENCE: TStringField;
    QryTAccountDrFAMOUNT: TFloatField;
    QryTAccountDrWACCOUNTID: TIntegerField;
    QryTAccountDrBRECONCILED: TSmallintField;
    QryTAccountDrFOUTSTANDINGAMOUNT: TFloatField;
    QryTAccountDrWTRANSACTIONID: TIntegerField;
    QryTAccountDrWDESCRIPTIONID: TIntegerField;
    qGen: TuniQuery;
    QryTAccountDrSALIAS: TStringField;
    Panel1: TPanel;
    Label8: TLabel;
    DtStart: TDateTimePicker;
    Label9: TLabel;
    dbedtFromAccount: TEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Panel6: TPanel;
    lblOpBal: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Panel7: TPanel;
    Label6: TLabel;
    Shape5: TShape;
    QryTAccountDrSDESCRIPTION: TStringField;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    lblOpBalCt: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    dtEndDate: TDateTimePicker;
    QryTAccountDrWBATCHID: TIntegerField;
    QryTAccountDrWDOCID: TIntegerField;
    QryTAccountDrWPERIODID: TIntegerField;
    EFilter: TEdit;
    Label11: TLabel;
    QryTAccountDrWREPORTINGGROUP1ID: TIntegerField;
    QryTAccountDrBLASTYEAR: TSmallintField;
    Button2: TButton;
    pPRogress: TPanel;
    pbExp: TProgressBar;
    LText: TLabel;
    PopupMenu1: TPopupMenu;
    CostGroup11: TMenuItem;
    QryTAccountDrACCDESC: TStringField;
    Costgroup21: TMenuItem;
    QryTAccountDrWREPORTINGGROUP2ID: TIntegerField;
    Gotodocument1: TMenuItem;
    bBack: TBitBtn;
    N1: TMenuItem;
    Plugins: TMenuItem;
    wwDBGrid1: TDBGrid;
    Label2: TLabel;
    Label1: TLabel;
    QryTAccountDrBINCOMEEXPENSE: TSmallintField;
    VirtualTable1: TVirtualTable;
    procedure FormShow(Sender: TObject);
    procedure DtStartChange(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DtEndxChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
    procedure FormDestroy(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure EFilterExit(Sender: TObject);
    procedure EFilterChange(Sender: TObject);
    procedure QryTAccountDrWREPORTINGGROUP1IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure  OnMenuClickGroup1(Sender: TObject);
    procedure  OnMenuClickGroup2(Sender: TObject);
    procedure DsDrDataChange(Sender: TObject; Field: TField);
    procedure QryTAccountDrWREPORTINGGROUP2IDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure Gotodocument1Click(Sender: TObject);
    procedure bBackClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButtonPanelDblClick(Sender: TObject);
    procedure AdatasetGenAfterOpen(DataSet: TDataSet);
  private
    AFormPluginRecordArray : array [0..15] of TFormPluginRecord ;
    { Private declarations }
    AccID:integer;
    CurrentSqlIndex : Integer ;
    BalDr,BalCR:real;
    CanGo,BDoStop,InGoBack:Boolean;
    TrFilter:string;
    LastEditSearch : String ;
    AAccGroepList : TStringlist ;
    AAccGroepList2 : TStringlist ;
    Procedure GenUpdate;

    procedure ChangeQryTAcc(aFilter, aSort: String; DStart,
      DEnd: Tdate);
    function FilterSubAccIn(aAccID: Integer): String;
    procedure MYUpDate;
    procedure UpDateAll;
    procedure OnMenuPluginAct1(Sender: TObject);
    procedure InitPluginsMenu;
    procedure loadPlugins;

  public
     GoToId : Integer ;
 
     GoToSql : String ;
     GoSubSql : String ;
     GoForceSql  : String ;
     aFromDate,aTodate : TDatetime ;
     ADetailDataset : TVirtualTable ;
     RepGroup1Id,RepGroup2id : Integer ;
     LastSqlList : TStringlist ;
     OpenbalD,OpenBalC : Double ;
     Budget  : boolean ;
     function GetTransactName : String ;
     procedure onosFProgressEvent (Var Stop :Boolean ; AText : String ; AMax , APostition : Integer;aTransId : Integer );
    { Public declarations }
  end;

var
  fmTAccountView: TfmTAccountView;

implementation

uses GlobalFunctions, DatabaseAccess, TcVariables,
  LedgerRoutines, StrUtils, Database, OSFGeneralRoutines, UDMTCCoreLink,
  osfLookup,UReportManager, Math, InvoiceEntryGrid;

{$R *.dfm}


Function  TfmTAccountView.FilterSubAccIn(aAccID:Integer):String;

begin
 result := '' ;

  if GoSubSql <> '' then
     begin
       result := GoSubSql ;
       GoToSql := '' ;
       Exit ;
     end;

 if aAccID = dmDatabase.SetOfBooksPropertys.CompanyInfo.DebtorsControlAccount then
   begin
   result := '(b.WaccountTypeid=1 or b.Waccountid = '+IntToStr(aAccID)+')' ;
   exit ;
   end;
 if aAccID = dmDatabase.SetOfBooksPropertys.CompanyInfo.CreditorsControlAccount then
   begin
   result := '(b.WaccountTypeid=2 or b.Waccountid = '+IntToStr(aAccID)+')' ;
   exit ;
   end;


  qGen.Close;
  qGen.Sql.Text :='Select * From Account Where WLinkAccount = ' + IntToStr(aAccID) ;
  qGen.Open;
  qGen.First;
  if qGen.RecordCount > 1 then
  begin
  Result := 'a.WAccountID in (' ;
  While Not qGen.Eof do
    begin
      Result := Result +' '+qGen.FieldByName('WAccountID').AsString;
      qGen.Next;
      if not qGen.eof then Result := Result +' , ' else
        Result := Result + ')' ;
      dmDatabase.qGen.Close;
    end;
  end else
  result := 'a.WAccountid = ' + IntToStr(aAccID) ;

  if (GoToSql <> '') and(GoToSql <> 'usegosub') then
    result := 'a.WAccountid in (' + GoToSql +')' ;

end;


Procedure TfmTAccountView.ChangeQryTAcc(aFilter,aSort:String;DStart,DEnd:Tdate);
Var
  s,SEndDateStr : String ;
begin
 SEndDateStr := ' dateadd(-1 millisecond to cast(' + quotedStr(formatDateTime('yyyy-mm-dd',dtEndDate.Date+1))+' as timestamp)) ' ;
  if Budget then
  s:='  Select b.BINCOMEEXPENSE,b.SDescription AccDesc, a.BLASTYEAR, a.WReportingGroup1id, a.WReportingGroup2id, 0 WDocid,0 WBATCHID, '+
  ' a.DDate,a.SReference,a.FAmount ,a.WAccountID, 0 BReconciled, 0.00 FOutStandingAmount,0 WDescriptionID,0 Wperiodid, a.WtransactionID, '+ QuotedStr('')+' SAlias , ' +
  ' a.SDescription,0 PeriodID From '
  else

  s:=' Select b.BINCOMEEXPENSE, b.SDescription AccDesc, a.BLASTYEAR, a.WReportingGroup1id, a.WReportingGroup2id, a.WDocid,a.WBATCHID,a.DDate,a.SReference,' +
   'a.FAmount'

  +' ,a.WAccountID,'+
     ' a.BReconciled, a.FOutStandingAmount,a.WtransactionID,A.WDescriptionID,BatCon.SAlias'+
     ' ,messages.SDescription,a.WPeriodID' +
     ' From ';

   s:= s +GetTransactName+' a  ' ;

      if not Budget then
      begin


       s:= s +  'left join Batcon on (Batcon.WbatchID= a.WBatchId) left join messages on (messages.WMessageId = a.WDescriptionId) ' ;
    end;
    s:= s + ' left join v_Account b on (a.WAccountID = b.Waccountid)' + ' Where a.DDate  between :DtStart And  ' + SEndDateStr ;
     if RepGroup1Id <> 0 then
        begin
          s:= s + ' and a.WReportingGroup1id = ' + intToStr(RepGroup1Id) ;
        end;
     if RepGroup2id  <> 0 then
        begin
          s:= s + ' and a.WReportingGroup2id = ' + intToStr(RepGroup2Id) ;
        end;


  if trim(aFilter)<>'' then
  s:= s +' AND (' +aFilter+')';
  if Trim(aSort)='' then
    S:=S + ' Order by a.DDate,a.SReference'
  else
    s:=S + aSort;

  QryTAccountdr.Close;
  QryTAccountdr.SQL.Text:=s;
  QryTAccountdr.ParamByName('DtStart').AsDateTime:= DStart;
//  QryTAccountdr.ParamByName('dtEndDate').AsDate:= DEnd;
end;


Procedure TfmTAccountView.GenUpdate;
Var
  V:Variant;
SGroepStr,StrLocfilter : String ;
begin
 SGroepStr := '' ;

     if RepGroup1Id <> 0 then
        begin
          SGroepStr := SGroepStr + ' and a.WReportingGroup1id = ' + intToStr(RepGroup1Id) ;
        end;
     if RepGroup2id  <> 0 then
        begin
          SGroepStr := SGroepStr + ' and a.WReportingGroup2id = ' + intToStr(RepGroup2Id) ;
        end;

 StrLocfilter :=  'Select sum(FAmount) from '+GetTransactName+' a join  account b on (a.WaccountId = b.WaccountID and (b.BINCOMEEXPENSE = 0 or b.BINCOMEEXPENSE is null )) where DDate  < cast(' + QuotedStr(formatDateTime('yyyy-mm-dd',DtStart.Date))  + ' as timestamp) ' + SGroepStr ;
 if TrFilter <> ' 1 = 1 ' then
   StrLocfilter := StrLocfilter+ ' and ' +  TrFilter ;

 screen.Cursor := crHourGlass ;
 try
   v := OpenSqlAndGetFirtsColumnValue(StrLocfilter ) ;

 if VarToStr(v) ='' then
 v := 0 ;

 lblOpBalCt.Caption:='';
 lblOpBal.Caption:='';
 OpenbalD :=0;
 OpenBalC :=0;
 if v>=0 then
   begin
   lblOpBal.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ,v);
   OpenbalD := v ;
   end else
   begin
   lblOpBalCt.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ,-v) ;
   OpenBalC := -v ;
   end

  finally
     Screen.Cursor := crDefault ;
  end;

end;


procedure TfmTAccountView.FormShow(Sender: TObject);
begin
self.Width := Min(Screen.Width,1230) ;
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
Caption := GetTextLang(1265); // T Account Viewer
Label3.Caption := GetTextLang(34);// Account
Label9.Caption := GetTextLang(286);// From Date:
Label8.Caption := GetTextLang(287);// To Date
Label1.Caption := GetTextLang(211);// Debit
Label2.Caption := GetTextLang(212);// Credit
Label6.Caption := GetTextLang(2234);// Balance :
Label10.Caption := GetTextLang(1066);// Opening Balance
OkCancel(BtnOk,BtnCancel);
Caption := GetTextLang(1265); // T Account Viewer
Label3.Caption := GetTextLang(34);// Account
TrFilter:='';
CanGo:=False;
// ChangeQryTAcc('','',Now,Now);
Button2.Caption := DMTCCoreLink.GetTextLang(52 );
Button1.Caption := DMTCCoreLink.GetTextLang(2013);

if (IncMonthT(Now,-1)) < dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetHighYear then
  DtStart.Date := IncMonthT(Now,-1)
else
 begin
  DtStart.Date := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetHighYear;
 end;

if aTodate > 1 then
  dtEndDate.Date := aTodate
  else
if ((Now) < dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetHighYear) then
  dtEndDate.Date := Now
else
  dtEndDate.Date := dmDatabase.SetOfBooksPropertys.LedgerPeriodes.GetHighYear;
CanGo:=True;


if (GoToId <> 0)   then
   begin

      AccID:=GoToId;

      dbedtFromAccount.Text := GetAccountCode(GoToId);
      LAbel7.Caption := TDataBaseRoutines.GetAccountFullDescription(GoToId);
      Caption := GetTextLang(1265) + ' ' + TDataBaseRoutines.GetAccountFullDescription(GoToId);

      if aTodate > 1 then
        begin
         dtEndDate.Date := aTodate ;
        end;
      if aFromDate > 1 then
         DtStart.Date := aFromDate ;

      UpDateAll ;

      Label3.Visible := false ;
      dbedtFromAccount.Visible := false ;
      BitBtn1.Visible := false ;
    end;

 if GoToSql <> '' then
    begin
      if aTodate > 1 then
        begin
         dtEndDate.Date := aTodate ;

        end;
      if aFromDate > 1 then
         DtStart.Date := aFromDate ;
      UpDateAll ;

      Label3.Visible := false ;
      dbedtFromAccount.Visible := false ;
      BitBtn1.Visible := false ;
      Label6.Visible := false ;
      Label5.Visible := false ;
      Label4.Visible := false ;
    //  Label10.Visible := false ;
    //  lblOpBal.Visible := false ;
    //  lblOpBalCt.Visible := false ;
    end;
    loadPlugins ;
end;

Procedure TfmTAccountView.MyUpDate;
var SAccount,SEndDateStr,SStartDateStr : String ;
begin
 SStartDateStr :='   cast(' + quotedStr(formatDateTime('yyyy-mm-dd',DtStart.Date))+' as timestamp)' ;
 SEndDateStr := ' dateadd(-1 millisecond to cast(' + quotedStr(formatDateTime('yyyy-mm-dd',dtEndDate.Date+1))+' as timestamp)) ' ;

     if RepGroup1Id <> 0 then
        begin
          SEndDateStr := SEndDateStr + ' and a.WReportingGroup1id = ' + intToStr(RepGroup1Id) ;
        end;

     if RepGroup2id  <> 0 then
        begin
          SEndDateStr := SEndDateStr + ' and a.WReportingGroup2id = ' + intToStr(RepGroup2Id) ;
        end;

  if (GoToSql = '')   then
 begin
       qGen.Sql.Text :='Select sum(FAmount) FAmount from '+GetTransactName+' a join account b on (a.WAccountId = b.Waccountid) where FAmount > 0 and  DDate   between ' + SStartDateStr + ' and '+
       SEndDateStr + ' and ' + TrFilter ;
 end else
 begin
       qGen.Sql.Text :='Select sum(FAmount) FAmount from '+GetTransactName+' a join account b on (a.WAccountId = b.Waccountid) where FAmount > 0 and  DDate   between ' + SStartDateStr + '  and '+
       SEndDateStr ;
 end;


  qGen.Close;
  qGen.Sql.Add(' AND ('+TrFilter+')') ;
  qGen.Open;
  BalDr := qGen.Fields[0].AsFloat;
  BalDr := BalDr + OpenbalD ;
  Label5.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,BalDr);
  qGen.Close;

 if (GoToSql = '')   then
 begin
       qGen.Sql.Text :='Select sum(-FAmount) FAmount from '+GetTransactName+' a join account b on (a.WAccountId = b.Waccountid) where FAmount < 0 and cast(DDate as date)  between ' + SStartDateStr +'  and '+
       SEndDateStr + ' and ' + TrFilter ;
 end else
 begin
   qGen.Sql.Text :='Select sum(-FAmount) FAmount from '+GetTransactName+' a join account b on (a.WAccountId = b.Waccountid) where FAmount < 0 and cast(DDate as date) between ' + SStartDateStr +'  and '+
       SEndDateStr  ;
 end;

 // qGen.Sql.Add(' AND ('+TrFilter+')') ;




  qGen.Open;
  BalCr := qGen.Fields[0].AsFloat;
  BalCr := BalCr + OpenBalC ;
  Label4.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ,abs(BalCr));
  qGen.CLose;

  ChangeQryTAcc(TrFilter,'',DtStart.Date,dtEndDate.Date);
  if GoForceSql <> '' then
    QryTAccountDr.sql.Text := GoForceSql ;
  QryTAccountDr.Open ;

  if ADetailDataset.Active then
     while not ADetailDataset.IsEmpty do
     ADetailDataset.Delete ;
       ADetailDataset.Open ;
  LastEditSearch := EFilter.Text ;
   While not QryTAccountDr.Eof do
      begin
       SAccount := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(QryTAccountDr.FieldByName('WACCOUNTID').Asinteger) ;
           if EFilter.Text <> '' then
              begin
                   if   Pos(UpperCase(EFilter.Text),upperCase(
                   SAccount +' ' +
                   QryTAccountDr.FieldByName('FAMOUNT').AsString +' ' +
                   QryTAccountDrWREPORTINGGROUP1ID.DisplayText  +' ' +
                   QryTAccountDr.FieldByName('WBATCHID').AsString +' ' +
                   QryTAccountDr.FieldByName('DDATE').AsString +' ' + QryTAccountDr.FieldByName('SREFERENCE').AsString + '  ' +
                   QryTAccountDr.FieldByName('SDESCRIPTION').AsString +' ' +  QryTAccountDr.FieldByName('SALIAS').AsString +' ' +  QryTAccountDr.FieldByName('ACCDESC').AsString +' ' +  SAccount )) = 0  then
                   begin
                   QryTAccountDr.Next ;
                   Continue ;
                   end;
              end;

         ADetailDataset.Append ;
         ADetailDataset.FieldByName('ACCDESC').Value := QryTAccountDr.FieldByName('ACCDESC').Value  ;
         ADetailDataset.FieldByName('DDATE').Value := trunc(QryTAccountDr.FieldByName('DDATE').AsDateTime);
         IF  QryTAccountDrBLASTYEAR.AsInteger = 1 THEN
         ADetailDataset.FieldByName('SREFERENCE').Value := '#> ' +QryTAccountDr.FieldByName('SREFERENCE').Value
          else
         ADetailDataset.FieldByName('SREFERENCE').Value := QryTAccountDr.FieldByName('SREFERENCE').Value;
         if QryTAccountDr.FieldByName('FAMOUNT').AsFloat < 0 then
         ADetailDataset.FieldByName('FAMOUNTCR').AsFloat := -QryTAccountDr.FieldByName('FAMOUNT').AsFloat
         else
         ADetailDataset.FieldByName('FAMOUNTDE').Value := QryTAccountDr.FieldByName('FAMOUNT').Value;
         ADetailDataset.FieldByName('WACCOUNTID').Value := QryTAccountDr.FieldByName('WACCOUNTID').Value;
         ADetailDataset.FieldByName('BRECONCILED').Value := QryTAccountDr.FieldByName('BRECONCILED').Value;
         ADetailDataset.FieldByName('FOUTSTANDINGAMOUNT').Value := QryTAccountDr.FieldByName('FOUTSTANDINGAMOUNT').Value;
         ADetailDataset.FieldByName('WTRANSACTIONID').Value := QryTAccountDr.FieldByName('WTRANSACTIONID').Value;
         ADetailDataset.FieldByName('WDESCRIPTIONID').Value := QryTAccountDr.FieldByName('WDESCRIPTIONID').Value;
         ADetailDataset.FieldByName('SDESCRIPTION').Value := QryTAccountDr.FieldByName('SDESCRIPTION').Value;
         ADetailDataset.FieldByName('WREPORTINGGROUP1ID').AsString := QryTAccountDrWREPORTINGGROUP1ID.DisplayText;
         ADetailDataset.FieldByName('WWREPORTINGGROUP1ID').AsInteger := QryTAccountDrWREPORTINGGROUP1ID.AsInteger;
         ADetailDataset.FieldByName('WREPORTINGGROUP2ID').AsString := QryTAccountDrWREPORTINGGROUP2ID.DisplayText;
         ADetailDataset.FieldByName('WWREPORTINGGROUP2ID').AsInteger := QryTAccountDrWREPORTINGGROUP2ID.AsInteger;
         ADetailDataset.FieldByName('SALIAS').Value := QryTAccountDr.FieldByName('SALIAS').Value;
         ADetailDataset.FieldByName('WTRANSACTIONID').Value := QryTAccountDr.FieldByName('WTRANSACTIONID').Value;
         ADetailDataset.FieldByName('WDOCID').Value := QryTAccountDr.FieldByName('WDOCID').Value;
         ADetailDataset.FieldByName('WBATCHID').Value := QryTAccountDr.FieldByName('WBATCHID').Value;
         if QryTAccountDr.FieldByName('BINCOMEEXPENSE').AsInteger = 1 then
          ADetailDataset.FieldByName('SACCOUNT').AsString := SAccount + '*'

         else
         ADetailDataset.FieldByName('SACCOUNT').AsString := SAccount;
                       
         ADetailDataset.FieldByName('CONTRAACCOUNTS').AsString := TDataBaseLedgerRoutines.GetContraOnTransactionid(QryTAccountDrWTRANSACTIONID.AsInteger) ;
         ADetailDataset.post ;
         QryTAccountDr.Next ;
      end;
   ADetailDataset.FieldByName('WREPORTINGGROUP1ID').DisplayWidth := 15;
    ADetailDataset.FieldByName('WREPORTINGGROUP2ID').DisplayWidth := 15;     
   TFloatField(ADetailDataset.FieldByName('FAMOUNTDE')).DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;
   TFloatField(ADetailDataset.FieldByName('FAMOUNTCR')).DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;

end;


Procedure TfmTAccountView.UpDateAll;
begin
 timer1.Enabled := false ;
 TrFilter := FilterSubAccIn(AccID);
 GenUpdate;
 Myupdate  ;

 Label6.Caption := GetTextLang(1361){'Balance:}+' ' + FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,FixAmount(BalDr - BalCR,2));
 try
 wwDBGrid1.SetFocus
 except
 end;
 wwDBGrid1.SelectedField := ADetailDataset.FieldByName('FAMOUNTCR') ;
 self.HorzScrollBar.Position := 1200 ;
end;



procedure TfmTAccountView.DtStartChange(Sender: TObject);
begin
//  GenUpdate;
  Timer1.Enabled := false ;
  Timer1.Enabled := true ;
end;

procedure TfmTAccountView.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmTAccountView.BtnOkClick(Sender: TObject);
var AlineLink : String ;
begin
  if Not CanGo then exit;
  if not InGoBack then
  begin
  AlineLink := QryTAccountDr.SQL.Text ;
  AlineLink := StringReplace(AlineLink,#10,'',[rfReplaceAll]);
  AlineLink := StringReplace(AlineLink,#13,' ',[rfReplaceAll]);
  LastSqlList.Add(AlineLink);
   CurrentSqlIndex := CurrentSqlIndex + 1 ;
   bBack.Visible := True ;
  end; 
   UpDateAll ;




end;

procedure TfmTAccountView.DtEndxChange(Sender: TObject);
begin
  Timer1.Enabled := false ;
  Timer1.Enabled := true ;
end;

procedure TfmTAccountView.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := false ;
 BtnOkClick(Sender);
end;



procedure TfmTAccountView.BitBtn1Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  OSFGetLookupValue(ReturnLookup,ReturnID,'','ACVIEW',tcstALL,tcltAccount,AccID,0,'ALL');
  if (ReturnLookup <> 'ESC') AND (ReturnLookup <> 'NEW') and (ReturnLookup <> '') then
    begin
    GoSubSql := '' ;
    dbedtFromAccount.Text := ReturnLookup;
    AccID:=ReturnID;
    LAbel7.Caption := TDataBaseRoutines.GetAccountFullDescription(AccID);

    end;
  dbedtFromAccount.Color := clWindow;
  UpDateAll ;
end;

procedure TfmTAccountView.FormCreate(Sender: TObject);
Var
  s:string;
begin
CurrentSqlIndex := -1 ;
LastSqlList := TStringlist.create ;
AAccGroepList := TStringlist.create ;
AAccGroepList2 := TStringlist.create ;
TDataBaseRoutines.FillStringsWithReportingGroups(AAccGroepList,1002);
TDataBaseRoutines.FillStringsWithReportingGroups(AAccGroepList2,1003);

  s:='Select b.SDescription AccDesc, a.WReportingGroup1id,a.WReportingGroup2id,  a.DDate,a.SReference,' +
   'a.FAmount'
  +' ,a.WAccountID,'+
     ' a.BReconciled, a.FOutStandingAmount,a.WtransactionID,A.WDescriptionID,BatCon.SAlias'+
     ' ,messages.SDescription,a.Wperiodid ' +
     ' From TRANSACT a left join Batcon on (Batcon.WbatchID= a.WBatchId)'+
     ' left join v_Account b on (a.WAccountID = b.Waccountid)'+
     ' left join messages on (messages.WMessageId = a.WDescriptionId) ' +
     ' Where 1 = 0';
DMTCCoreLink.InitFieldLengtsForDatasetfields(QryTAccountDr,s);

ADetailDataset := TVirtualTable.Create(self) ;
DsDr.DataSet := ADetailDataset ;
ADetailDataset.AfterOpen  := AdatasetGenAfterOpen ;

ADetailDataset.FieldDefs.Add(QryTAccountDrWREPORTINGGROUP1ID.FieldName,ftString,200);
ADetailDataset.FieldDefs.Add('W'+QryTAccountDrWREPORTINGGROUP1ID.FieldName,QryTAccountDrWREPORTINGGROUP1ID.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrWREPORTINGGROUP2ID.FieldName,ftString,200);
ADetailDataset.FieldDefs.Add('W'+QryTAccountDrWREPORTINGGROUP2ID.FieldName,QryTAccountDrWREPORTINGGROUP2ID.DataType);

ADetailDataset.FieldDefs.Add(QryTAccountDrWBATCHID.FieldName,QryTAccountDrWBATCHID.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrWDOCID.FieldName,QryTAccountDrWDOCID.DataType);

ADetailDataset.FieldDefs.Add(QryTAccountDrDDATE.FieldName,QryTAccountDrDDATE.DataType);
ADetailDataset.FieldDefs.Add('SACCOUNT',ftString,DMTCCoreLink.MainAccountLength+5);
ADetailDataset.FieldDefs.Add(QryTAccountDrSREFERENCE.FieldName,QryTAccountDrSREFERENCE.DataType,QryTAccountDrSREFERENCE.Size);
ADetailDataset.FieldDefs.Add(QryTAccountDrFAMOUNT.FieldName+'DE',QryTAccountDrFAMOUNT.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrFAMOUNT.FieldName+'CR',QryTAccountDrFAMOUNT.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrWACCOUNTID.FieldName,QryTAccountDrWACCOUNTID.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrBRECONCILED.FieldName,QryTAccountDrBRECONCILED.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrFOUTSTANDINGAMOUNT.FieldName,QryTAccountDrFOUTSTANDINGAMOUNT.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrWTRANSACTIONID.FieldName,QryTAccountDrWTRANSACTIONID.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrWDESCRIPTIONID.FieldName,QryTAccountDrWDESCRIPTIONID.DataType);
ADetailDataset.FieldDefs.Add(QryTAccountDrSALIAS.FieldName,QryTAccountDrSALIAS.DataType,QryTAccountDrSALIAS.Size);
ADetailDataset.FieldDefs.Add(QryTAccountDrSDESCRIPTION.FieldName,QryTAccountDrSDESCRIPTION.DataType,QryTAccountDrSDESCRIPTION.Size);
ADetailDataset.FieldDefs.Add(QryTAccountDrACCDESC.FieldName,QryTAccountDrACCDESC.DataType,QryTAccountDrACCDESC.Size);
ADetailDataset.FieldDefs.Add('CONTRAACCOUNTS',ftString,255);


end;



procedure TfmTAccountView.FormDestroy(Sender: TObject);
begin
LastSqlList.free ;
AAccGroepList.free ;
AAccGroepList2.free ;
ADetailDataset.free ;
end;

procedure TfmTAccountView.Panel1Click(Sender: TObject);
begin
  Panel1.Color := clNavy ;
end;

procedure TfmTAccountView.Button1Click(Sender: TObject);
Var
 AStrings : TStringList ;
 i : Integer ;
 AddLine ,OpenWithApp,aFilename : String ;
begin
 AddLine := '' ;
 for i := 0 to wwDBGrid1.Columns.Count -1 do
   begin
      if i <> 0  then AddLine := AddLine + #9 ;

      AddLine := AddLine + wwDBGrid1.Columns[i].Field.DisplayLabel  ;
   end;

 if not SaveDialog1.Execute then exit ;
 AStrings := TStringList.Create ;
 try
   AStrings.Add(AddLine);
   ADetailDataset.First ;
   while not ADetailDataset.Eof do
     begin
       AddLine := '' ;
       for i := 0 to wwDBGrid1.Columns.Count -1 do
         begin
            if i <> 0 then AddLine := AddLine + #9 ;

            if ADetailDataset.FindField(wwDBGrid1.Columns[i].FieldName) <> nil then
            AddLine := AddLine + ADetailDataset.FindField(wwDBGrid1.Columns[i].FieldName).AsString ;
         end;
       AStrings.Add(AddLine);
       ADetailDataset.next ;
     end;
   AStrings.SaveToFile(SaveDialog1.FileName);
      AddLine := SaveDialog1.FileName ;
      OpenWithApp := TDatabaseRegistyRoutines.GetAppToOpenExtention('.csv') ;
      if FileExists(OpenWithApp) then
         begin
          aFilename := AnsiQuotedStr(AddLine ,'"');
          AddLine := OpenWithApp ;
         end;
      ShellExecute(Handle, 'open',pchar(AddLine) , pchar(aFilename), nil, SW_SHOW);



      
 finally
   AStrings.Free ;
 end;
end;

procedure TfmTAccountView.wwDBGrid1DblClick(Sender: TObject);
var
  ALine,AlineLink : String ;
begin


 EFilter.Text := '' ;
 if wwDBGrid1.SelectedField = ADetailDataset.FindField('WREPORTINGGROUP1ID') then
    begin
       GoToSql := 'usegosub' ;
       GoSubSql := ' a.WReportingGroup1ID = ' + IntToStr(ADetailDataset.FindField('WWREPORTINGGROUP1ID').AsInteger);
       BtnOkClick(self);
    end else

 if wwDBGrid1.SelectedField = ADetailDataset.FindField('WBATCHID') then
    begin
       GoToSql := 'usegosub' ;
       GoSubSql := ' a.WBatchid = ' + IntToStr(ADetailDataset.FindField('WBATCHID').AsInteger);
       BtnOkClick(self);
    end else
 if wwDBGrid1.SelectedField = ADetailDataset.FindField('DDATE') then
    begin
       GoToSql := 'usegosub' ;
       if ADetailDataset.FindField('DDATE').AsDateTime <> 0 then
       DtStart.Date := ADetailDataset.FindField('DDATE').AsDateTime ;
       if ADetailDataset.FindField('DDATE').AsDateTime <> 0 then
       dtEndDate.Date := ADetailDataset.FindField('DDATE').AsDateTime ;
       GoSubSql := ' 1 = 1 ' ;
       BtnOkClick(self);
    end else
 if wwDBGrid1.SelectedField = ADetailDataset.FindField('SACCOUNT') then
    begin
       GoToSql := '' ;
       GoSubSql := '';
       AccID :=  ADetailDataset.FindField('Waccountid').AsInteger  ;
       BtnOkClick(self);
    end else

 if (wwDBGrid1.SelectedField = ADetailDataset.FindField('FAMOUNTDE')) or (wwDBGrid1.SelectedField = ADetailDataset.FindField('FAMOUNTCR'))  then
    begin
       GoToSql := 'usegosub' ;
       ALine := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select Wlineid from '+GetTransactName+' where WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger))) ;
       AlineLink := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WLINKEDID from '+GetTransactName+' where WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger))) ;
       GoSubSql := ' a.WBatchid = ' + IntToStr(ADetailDataset.FindField('WBATCHID').AsInteger)+' and (a.WLineID = ' + ALine + ' or a.WLINKEDID  = ' + ALine + ' or a.WLineID = ' + AlineLink + ' or a.WLINKEDID  = ' + AlineLink + ')' ;
       AccID :=  ADetailDataset.FindField('Waccountid').AsInteger  ;
       BtnOkClick(self);
    end;

end;

procedure TfmTAccountView.EFilterExit(Sender: TObject);
begin
 if LastEditSearch <> EFilter.Text then
 begin
  Timer1.Enabled := false ;
  BtnOkClick(self);
 end;
end;

procedure TfmTAccountView.EFilterChange(Sender: TObject);
begin
 if LastEditSearch <> EFilter.Text then
 begin
 Timer1.Enabled := false ;
 Timer1.Enabled := True ;
 end;

end;

procedure TfmTAccountView.QryTAccountDrWREPORTINGGROUP1IDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := DMTCCoreLink.GroupsObject.GetGroupNesteldName(Sender.AsInteger)  ;
  {
  if AAccGroepList.IndexOfObject(TObject(Sender.AsInteger)) <> -1 then
    Text := AAccGroepList[AAccGroepList.IndexOfObject(TObject(Sender.AsInteger))]
    else
    text := '' ;}
end;

procedure TfmTAccountView.Button2Click(Sender: TObject);

Var

 i ,x,MaxLevel : Integer ;
 AddLine,aFilename,OpenWithApp : String ;
 TotalAmt : Double ;
begin
 pPRogress.Visible := true ;
 BDoStop := false ;
  self.Enabled := false ;
  try
   TDatabaseTableRoutines.DumpToReportmanTransport(ADetailDataset,true,0,onosFProgressEvent);
    ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\ledgerview\ledgerdetail.rep','');
 finally
    Self.Enabled := true ;
    pPRogress.Visible := False ;
 end;
end;
procedure TfmTAccountView.onosFProgressEvent(var Stop: Boolean;
  AText: String; AMax, APostition, aTransId: Integer);
begin
 pbExp.Position := 0 ;
 pbExp.Max := AMax ;
 pbExp.Position := APostition ;
 LText.Caption := DMTCCoreLink.GetTextLang(aTransId) + ' '+  IntToStr(AMax) + ' / ' + IntToStr(APostition) ;
 Application.ProcessMessages ;
 Stop := BDoStop ;
end;

procedure TfmTAccountView.PopupMenu1Popup(Sender: TObject);

Procedure   RecurceTree(AItem : TMenuItem ;GroupType : Integer ) ;
Var
  AQuery : TuniQuery ;
  AMenuitem : TMenuItem ;
  ExtraSql : String ;
begin
  AQuery := TuniQuery.create(nil) ;
   try
    AQuery.Connection := DMTCCoreLink.TheZConnection ;
    // if its root its 0 but we need to include the parent id is null
    ExtraSql := '' ;
    if AItem.Tag = 0 then ExtraSql := ' or WParentGroup2ID is null ';
    // back cast to integer( if its root it wil be 0);
    AQuery.sql.Text := format('Select * From v_groups Groups where WGroupTypeID = %s and (WParentGroup2ID = %s %s) Order by WSortNo ',[IntToStr(GroupType),IntToStr(AItem.Tag),ExtraSql]);
    AQuery.open ;
    while not AQuery.Eof do
      begin
       //  done : Pieter Just remeber the ID in the data property by casting it to Tobject
       AMenuitem := TMenuItem.Create(AItem);
       AItem.Add(AMenuitem) ;
       AMenuitem.Caption := AQuery.FieldByName('SDescription').AsString;
       AMenuitem.Tag := AQuery.FieldByName('WGroupID').AsInteger;
       RecurceTree(AMenuitem,GroupType);
       if AMenuitem.Count = 0 then
        begin
       If GroupType = 1002 then
       AMenuitem.OnClick := OnMenuClickGroup1 ;
       If GroupType = 1003 then
       AMenuitem.OnClick := OnMenuClickGroup2 ;
         end;
       AQuery.next ;
      end;
   finally
     AQuery.free ;
   end;
end;

 
begin
 if (CostGroup11.Count = 0) and ((OpenSqlAndGetFirtsColumnValue('Select BSYSTEMSETUP from users where Wuserid =  ' + IntToStr(DMTCCoreLink.currentuser)) = '1') or (DMTCCoreLink.currentuser = 0)) then
    begin
       RecurceTree(CostGroup11,1002);
    end ;
 if (Costgroup21.Count = 0) and ((OpenSqlAndGetFirtsColumnValue('Select BSYSTEMSETUP from users where Wuserid =  ' + IntToStr(DMTCCoreLink.currentuser)) = '1') or (DMTCCoreLink.currentuser = 0)) then
    begin
       RecurceTree(Costgroup21,1003);
    end ;
  Gotodocument1.Caption := GetTextLang(2899);
  Gotodocument1.Visible := ADetailDataset.FieldByName('WDOCID').AsInteger <> 0 ;


end;

procedure TfmTAccountView.OnMenuClickGroup1(Sender: TObject);
var
  ALine,AlineLink,OldSub,OldGoTo : String ;
  HighDate,LowDate : TDateTime ;
  FromPeriod,ToPeriod : Integer ;
  i ,oldAcc: Integer ;
  Total : Double ;
begin
 if ADetailDataset.isempty then exit ;

 OldSub :=  GoSubSql ;
 OldGoTo := GoToSql ;
 oldAcc := AccID ;


        GoToSql := 'usegosub' ;
       ALine := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select Wlineid from '+GetTransactName+' where WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger))) ;
       AlineLink := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WLINKEDID from '+GetTransactName+' where WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger))) ;

       if not Budget then
       GoSubSql := ' a.WBatchid = ' + IntToStr(ADetailDataset.FindField('WBATCHID').AsInteger)+' and (a.WLineID = ' + ALine + ' or a.WLINKEDID  = ' + ALine + ' or a.WLineID = ' + AlineLink + ' or a.WLINKEDID  = ' + AlineLink + ')'
       else
       GoSubSql := ' a.WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger)  ;


       AccID :=  ADetailDataset.FindField('Waccountid').AsInteger  ;
       BtnOkClick(self);



 if ADetailDataset.isempty then exit ;

 if OSFMessageDlg(DMTCCoreLink.gettextlang(3022){set reporting group ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
 begin
   ADetailDataset.First ;
   // Check to see if the periodes are open.
   HighDate := ADetailDataset.fieldByName('DDATE').AsDateTime ;
   LowDate  := ADetailDataset.fieldByName('DDATE').AsDateTime ;
  Total := 0 ;
    while not ADetailDataset.Eof do
     begin
      if HighDate <  ADetailDataset.fieldByName('DDATE').AsDateTime then
         HighDate := ADetailDataset.fieldByName('DDATE').AsDateTime ;
      if LowDate >  ADetailDataset.fieldByName('DDATE').AsDateTime then
         LowDate := ADetailDataset.fieldByName('DDATE').AsDateTime ;
      Total := Total + ADetailDataset.fieldByName('FAMOUNTDE').AsFloat - ADetailDataset.fieldByName('FAMOUNTCR').AsFloat ;
      ADetailDataset.next ;
     end;
    FromPeriod := TDataBaseRoutines.GetPeriodFromDate(LowDate) ;
    ToPeriod := TDataBaseRoutines.GetPeriodFromDate(HighDate) ;
    if ToPeriod < 14 then
      begin
       FromPeriod := 0 ;
       ToPeriod := 0 ;
      end;
    for i := FromPeriod to ToPeriod do
         begin
            if not TDataBaseRoutines.GetPeriodActive(i) then
              raise Exception.Create('Period ' + TDataBaseRoutines.GetPeriodDescription(i,0,true) +' is closed!');
         end;
    if (trunc(Total*100)/100) <> 0 then
      begin
       if Not Budget then 
         if OSFMessageDlg('Contra lines not found or inbalance ! continue ?',mtConfirmation,[mbyes,mbno],0) = mrno then
             raise Exception.Create('User stop!');
      end;
    ADetailDataset.first ;
    while not ADetailDataset.Eof do
     begin
      ExecSql('update '+GetTransactName+' set WReportingGroup1id = ' +  IntToStr(TComponent(Sender).tag) + ' where WTransactionid = ' +  ADetailDataset.FieldByName('WTRANSACTIONID').AsString);
      ADetailDataset.next ;
     end;

    GoSubSql  := OldSub  ;
    GoToSql  := OldGoTo ;
    AccID := oldAcc ;

    DtStartChange(self);
 end;
end;

procedure TfmTAccountView.DsDrDataChange(Sender: TObject; Field: TField);
begin
 Button1.Enabled := (DsDr.DataSet <> nil) and (not DsDr.DataSet.IsEmpty) ;
 Button2.Enabled :=  Button1.Enabled ;
end;

procedure TfmTAccountView.OnMenuClickGroup2(Sender: TObject);
var
  ALine,AlineLink,OldSub,OldGoTo : String ;
  HighDate,LowDate : TDateTime ;
  FromPeriod,ToPeriod : Integer ;
  i ,oldAcc: Integer ;
  Total : Double ;
begin
 if ADetailDataset.isempty then exit ;

 OldSub :=  GoSubSql ;
 OldGoTo := GoToSql ;
 oldAcc := AccID ;

        GoToSql := 'usegosub' ;
       ALine := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select Wlineid from '+GetTransactName+' where WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger))) ;
       AlineLink := VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select WLINKEDID from '+GetTransactName+' where WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger))) ;
       if not Budget then
       GoSubSql := ' a.WBatchid = ' + IntToStr(ADetailDataset.FindField('WBATCHID').AsInteger)+' and (a.WLineID = ' + ALine + ' or a.WLINKEDID  = ' + ALine + ' or a.WLineID = ' + AlineLink + ' or a.WLINKEDID  = ' + AlineLink + ')' 
              else
       GoSubSql := ' a.WTransactionid = ' + IntToStr(ADetailDataset.FindField('WTRANSACTIONID').AsInteger)  ;

       AccID :=  ADetailDataset.FindField('Waccountid').AsInteger  ;
       BtnOkClick(self);


 if ADetailDataset.isempty then exit ;

 if OSFMessageDlg(DMTCCoreLink.gettextlang(3023){set reporting group ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
 begin
   ADetailDataset.First ;
   // Check to see if the periodes are open.
   HighDate := ADetailDataset.fieldByName('DDATE').AsDateTime ;
   LowDate  := ADetailDataset.fieldByName('DDATE').AsDateTime ;
  Total := 0 ;
    while not ADetailDataset.Eof do
     begin
      if HighDate <  ADetailDataset.fieldByName('DDATE').AsDateTime then
         HighDate := ADetailDataset.fieldByName('DDATE').AsDateTime ;
      if LowDate >  ADetailDataset.fieldByName('DDATE').AsDateTime then
         LowDate := ADetailDataset.fieldByName('DDATE').AsDateTime ;
      Total := Total + ADetailDataset.fieldByName('FAMOUNTDE').AsFloat - ADetailDataset.fieldByName('FAMOUNTCR').AsFloat ;
      ADetailDataset.next ;
     end;
    FromPeriod := TDataBaseRoutines.GetPeriodFromDate(LowDate) ;
    ToPeriod := TDataBaseRoutines.GetPeriodFromDate(HighDate) ;
    if ToPeriod < 14 then
      begin
       FromPeriod := 0 ;
       ToPeriod := 0 ;
      end;
    for i := FromPeriod to ToPeriod do
         begin
            if not TDataBaseRoutines.GetPeriodActive(i) then
              raise Exception.Create('Period ' + TDataBaseRoutines.GetPeriodDescription(i,0,true) +' is closed!');
         end;
    if (trunc(Total*100)/100) <> 0 then
      begin
       if Not Budget then
         if OSFMessageDlg('Contra lines not found or inbalance ! continue ?',mtConfirmation,[mbyes,mbno],0) = mrno then
             raise Exception.Create('User stop!');
      end;
    ADetailDataset.first ;
    while not ADetailDataset.Eof do
     begin
      ExecSql('update '+GetTransactName+' set WReportingGroup2id = ' +  IntToStr(TComponent(Sender).tag) + ' where WTransactionid = ' +  ADetailDataset.FieldByName('WTRANSACTIONID').AsString);
      ADetailDataset.next ;
     end;

    GoSubSql  := OldSub  ;
    GoToSql  := OldGoTo ;
    AccID := oldAcc ;

    DtStartChange(self);
 end;
end;

procedure TfmTAccountView.QryTAccountDrWREPORTINGGROUP2IDGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
 Text := DMTCCoreLink.GroupsObject.GetGroupNesteldName(Sender.AsInteger)  ;
 {
  if AAccGroepList2.IndexOfObject(TObject(Sender.AsInteger)) <> -1 then
    Text := AAccGroepList2[AAccGroepList2.IndexOfObject(TObject(Sender.AsInteger))]
    else
    text := '' ;}
end;

procedure TfmTAccountView.loadPlugins;

var
 i , IncArr,Ins : Integer ;
  ImageIndex : Integer ;
 IsEnable : Boolean ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
begin
  IncArr := 0 ;
  IsEnable := false ;
  for i := 0 to  LoadedPluginList.Count -1 do
    begin
       if IncArr > 15 then exit ;
       Ins := Integer(LoadedPluginList.Objects[i]) ;
       @AFormPluginRecordArray[IncArr].aLoadFormPlugin := GetProcAddress(Ins, OSFEditAddItemToBatchRoutineName);
       if @AFormPluginRecordArray[IncArr].aLoadFormPlugin <> nil then
        begin
            AFormPluginRecordArray[IncArr].ainst := Ins ;
            @AFormPluginRecordArray[IncArr].aMessageFormPlugin := GetProcAddress(Ins, OSFSTOCKMESSAGEFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aUnLoadFormPlugin := GetProcAddress(Ins, OSFSTOCKUNLOADFORMRoutineName);
            @AFormPluginRecordArray[IncArr].aMessageGetDisplayText := GetProcAddress(Ins, OSFSTOCKDISPLAYTEXTRoutineName);
            @AFormPluginRecordArray[IncArr].aPluginEnabled := GetProcAddress(Ins, OSFPLUGINENABLEDRoutineName);
            @AFormPluginRecordArray[IncArr].aContextmenuEnabled := GetProcAddress(Ins, OSFPLUGINCONTEXTRoutineName);




            if  assigned(AFormPluginRecordArray[IncArr].aPluginEnabled) then
              begin
                 APChar := ReturnName ;
                 AFormPluginRecordArray[IncArr].aPluginEnabled('STOCK',APChar,ImageIndex);
                 IsEnable := DMTCCoreLink.ReadNwReportOp(APChar,false);
              end;
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
 InitPluginsMenu ;

end;

procedure TfmTAccountView.InitPluginsMenu;
var
 i :  Integer ;
 AForm: TForm ;

 ReturnString : Array [0..1025] of char ;
 APChar : PChar ;
 AMenuitem : TMenuitem ;
 ACaption : String ;
begin
  for i := low(AFormPluginRecordArray) to high(AFormPluginRecordArray) do
    if @AFormPluginRecordArray[i].aLoadFormPlugin <> nil then
      begin
       try
         // ShowMessage(GetModuleName(AFormPluginRecordArray[i].aInst));
         AForm := AFormPluginRecordArray[i].aLoadFormPlugin(Application,'STOCK');

         APChar := ReturnString ;
         AFormPluginRecordArray[i].aMessageGetDisplayText(AForm,'PLUGINNAME',APChar);
         ACaption :=  ReturnString ;
          AFormPluginRecordArray[i].aUnLoadFormPlugin(AForm);

         if Assigned(AFormPluginRecordArray[i].aContextmenuEnabled) then
            begin
             AMenuitem := TMenuitem.Create(Plugins) ;
             Plugins.Add(AMenuitem);
             AMenuitem.Caption := ACaption ;
             AMenuitem.tag := i ;
             AMenuitem.OnClick := OnMenuPluginAct1;
            end;



        except
           on e : Exception do
             begin
                OSFMessageDlg(GetModuleName(AFormPluginRecordArray[i].aInst) + ' Error ! ' + e.Message,mtError,[mbok],0);
             end;
        end;
      end;
  Plugins.Caption := DMTCCoreLink.GetTextLang(3282);
  Plugins.Visible := Plugins.Count <> 0 ;
  N1.Visible := Plugins.Visible ;


end;
procedure TfmTAccountView.OnMenuPluginAct1(Sender: TObject);
var
 AMessage : String ;
  AForm : TForm ;
   aQuery : TuniQuery ;
begin
 if ADetailDataset.IsEmpty then exit ;


 AForm := AFormPluginRecordArray[(Sender as tcomponent).tag ].aLoadFormPlugin(Application,'') ;
 aQuery := TuniQuery.create(nil) ;
 try
 aQuery.Connection := DMTCCoreLink.TheZConnection ;
 aQuery.sql.Text := 'SELECT WBATCHID , WLINKEDID FROM TRANSACT   where  WTRANSACTIONID = ' + ADetailDataset.FieldByName('WTRANSACTIONID').AsString ;
 aQuery.open ;
 if   aQuery.IsEmpty then exit ;
 AMessage := 'CONTEXT=' + IntToStr(aQuery.fields[0].AsInteger) + #13+#10 + 'SUB=' + IntToStr(aQuery.fields[1].AsInteger) ;
 AFormPluginRecordArray[(Sender as tcomponent).tag ].aMessageFormPlugin(AForm,PChar(AMessage));
 finally
   aQuery.free ;
   AFormPluginRecordArray[(Sender as tcomponent).tag ].aUnLoadFormPlugin(AForm) ;
 end;

end;

procedure TfmTAccountView.Gotodocument1Click(Sender: TObject);

var
 aInv : TfmInvoiceEntryGrid ;
procedure LocalShowmodal ;

begin
 with  aInv do
 begin
   Show ;
   Application.ProcessMessages ;
   if QDocHead.IsEmpty then
      begin
        hide ;
        exit ;
      end;
   Application.ProcessMessages ;
   BEditClick(self);
   repeat
   Application.ProcessMessages ;
   until ((aInv.Visible = false) or (aInv.NBDocuments.PageIndex <> 1)) ;
 end;
end;
begin
  if ADetailDataset.FieldByName('WDOCID').AsInteger <> 0 then
     begin
       aInv := TfmInvoiceEntryGrid.create(nil) ;
       try
        aInv.GoToDocId := ADetailDataset.FieldByName('WDOCID').AsInteger ;
        
        LocalShowmodal ;
       finally
         aInv.free ;
       end;

     end;
end;

procedure TfmTAccountView.bBackClick(Sender: TObject);
var
 SAccount: String ;
begin

if CurrentSqlIndex < 0 then
  begin
   exit ;
  end;
InGoBack := True ;
try
if CurrentSqlIndex = 0 then
      bBack.Visible := False ;

 GoForceSql :=LastSqlList[CurrentSqlIndex];

 BtnOkClick(self);
 finally
   LastSqlList.Delete(CurrentSqlIndex);
   dec(CurrentSqlIndex) ;
   InGoBack := False ;
   GoForceSql := '' ;
 end;
end;

procedure TfmTAccountView.FormResize(Sender: TObject);
begin


   panel6.Width := 1400 ;
   wwDBGrid1.Top := 42 ;
    wwDBGrid1.Width := 1200;//1800 - 253
    wwDBGrid1.Height := Panel6.Height - 64 ;
    wwDBGrid1.Left := (panel6.Width -wwDBGrid1.Width) - 8;//-253 ; // (self.ClientWidth - wwDBGrid1.Width)+310  ;
end;

procedure TfmTAccountView.ButtonPanelDblClick(Sender: TObject);
begin
 wwDBGrid1.Options := (wwDBGrid1.Options + [dgTitles]) ;
end;

function TfmTAccountView.GetTransactName: String;
begin
if Budget then
 result := 'TRANSACT_BUDGET' else
 result := 'TRANSACT' ;
end;

procedure TfmTAccountView.AdatasetGenAfterOpen(DataSet: TDataSet);
begin
 if DataSet.findfield('ACCDESC') <> nil then
   DataSet.findfield('ACCDESC').DisplayLabel := DMTCCoreLink.GetTextLang(2047);
  if DataSet.findfield('DDATE') <> nil then
   DataSet.findfield('DDATE').DisplayLabel := DMTCCoreLink.GetTextLang(238);
  if DataSet.findfield('SREFERENCE') <> nil then
   DataSet.findfield('SREFERENCE').DisplayLabel := DMTCCoreLink.GetTextLang(1719);
  if DataSet.findfield('FAMOUNTCR') <> nil then
   DataSet.findfield('FAMOUNTCR').DisplayLabel := DMTCCoreLink.GetTextLang(212);
 if DataSet.findfield('FAMOUNTDE') <> nil then
   DataSet.findfield('FAMOUNTDE').DisplayLabel := DMTCCoreLink.GetTextLang(211);
 if DataSet.findfield('FOUTSTANDINGAMOUNT') <> nil then
   DataSet.findfield('FOUTSTANDINGAMOUNT').DisplayLabel := DMTCCoreLink.GetTextLang(947);
  if DataSet.findfield('SDESCRIPTION') <> nil then
   DataSet.findfield('SDESCRIPTION').DisplayLabel := DMTCCoreLink.GetTextLang(178);
 if DataSet.findfield('WREPORTINGGROUP1ID') <> nil then
   DataSet.findfield('WREPORTINGGROUP1ID').DisplayLabel := DMTCCoreLink.GetTextLang(906071);
 if DataSet.findfield('WREPORTINGGROUP2ID') <> nil then
   DataSet.findfield('WREPORTINGGROUP2ID').DisplayLabel := DMTCCoreLink.GetTextLang(906072);
 if DataSet.findfield('SALIAS') <> nil then
   DataSet.findfield('SALIAS').DisplayLabel := DMTCCoreLink.GetTextLang(906003);
 if DataSet.findfield('WTRANSACTIONID') <> nil then
   DataSet.findfield('WTRANSACTIONID').DisplayLabel := DMTCCoreLink.GetTextLang(20059);
 if DataSet.findfield('WBATCHID') <> nil then
   DataSet.findfield('WBATCHID').DisplayLabel := DMTCCoreLink.GetTextLang(20060);
 if DataSet.findfield('SACCOUNT') <> nil then
   DataSet.findfield('SACCOUNT').DisplayLabel := DMTCCoreLink.GetTextLang(34);
 if DataSet.findfield('CONTRAACCOUNTS') <> nil then
   DataSet.findfield('CONTRAACCOUNTS').DisplayLabel := DMTCCoreLink.GetTextLang(906102);
end;

end.
