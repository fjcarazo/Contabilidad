unit ULookupPeriods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB,
   DBAccess , Uni, MemDS;

type
  TFrameLookupPeriods = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    LFromdate: TLabel;
    dtFromdate: TDateTimePicker;
    dtTodate: TDateTimePicker;
    lTodate: TLabel;
    rgPEriode: TRadioGroup;
    CBFromPeriode: TComboBox;
    Label3: TLabel;
    ZQuery1: TuniQuery;
    procedure rgPEriodeClick(Sender: TObject);
  private

    { Private declarations }
  public
     procedure Init ;
     procedure InitCaptions ;
     function GetPeriodText : String ;
      function GetPurePeriodText : String ;
     function GetDescText: String;
     function GetStartDate : TDateTime ;
     function GetEndDate : TDateTime ;
     function GetPeriodStartDate(APeriod : Integer) :TDate ;
     function GetPropString : String ;
     procedure SetPropString (aString : String) ;
    { Public declarations }
  end;

implementation

uses OSFGeneralRoutines, UDMTCCoreLink;

{$R *.dfm}

{ TFrame1 }

function TFrameLookupPeriods.GetEndDate: TDateTime;
          var

  i , Maanden : integer ;

begin
  if PageControl1.ActivePageIndex = 0 then
      begin

  Maanden := -12 ;
  if rgPEriode.ItemIndex =0 then
   Maanden := -1 ;

  if rgPEriode.ItemIndex =1 then
   Maanden := -2 ;
  if rgPEriode.ItemIndex =2 then
   Maanden := -3 ;
  if rgPEriode.ItemIndex =3 then
   Maanden := -4 ;
  if rgPEriode.ItemIndex =4 then
   Maanden := -6 ;

 if (Maanden = -1)  then
     result := GetPeriodStartDate(26)
  else
   if (Maanden = -2)  then
     result := GetPeriodStartDate(24)
  else
   if (Maanden = -3) then
     result := GetPeriodStartDate(23)
  else
   if (Maanden = -4) then
     result := GetPeriodStartDate(22)
  else
   if (Maanden = -6) then
     result := GetPeriodStartDate(20)
  else
  result := GetPeriodStartDate(14);

  for i := 1 to CBFromPeriode.ItemIndex do
     begin
       result := IncMonth(result,Maanden) ;
     end;

   result :=  IncMonth(result,-Maanden)-1 ;
  end else
   result := Trunc(dtTodate.Date);
   
end;

function TFrameLookupPeriods.GetPeriodText: String;
begin
  result := PageControl1.ActivePage.Caption + #9 ;
  result := result + DateToStr(GetStartDate) + ' / ' +  DateToStr(GetEndDate)  ;
end;

function TFrameLookupPeriods.GetDescText: String;
begin
  result := PageControl1.ActivePage.Caption + #9 ;
  if  PageControl1.ActivePageindex = 0 then
  result := result + rgPEriode.items[rgPEriode.itemindex] ;
end;

function TFrameLookupPeriods.GetStartDate: TDateTime;
  var

  i , Maanden : integer ;

begin
  if PageControl1.ActivePageIndex = 0 then
      begin

  Maanden := -12 ;
  if rgPEriode.ItemIndex =0 then
   Maanden := -1 ;

  if rgPEriode.ItemIndex =1 then
   Maanden := -2 ;
  if rgPEriode.ItemIndex =2 then
   Maanden := -3 ;
  if rgPEriode.ItemIndex =3 then
   Maanden := -4 ;
  if rgPEriode.ItemIndex =4 then
   Maanden := -6 ;

 if (Maanden = -1)  then
     result := GetPeriodStartDate(26)
  else
   if (Maanden = -2)  then
     result := GetPeriodStartDate(24)
  else
   if (Maanden = -3) then
     result := GetPeriodStartDate(23)
  else
   if (Maanden = -4) then
     result := GetPeriodStartDate(22)
  else
   if (Maanden = -6) then
     result := GetPeriodStartDate(20)
  else
  result := GetPeriodStartDate(14);

  for i := 1 to CBFromPeriode.ItemIndex do
     begin
       result := IncMonth(result,Maanden) ;

     end;

  end else
   result := Trunc(dtFromdate.Date);
end;


procedure TFrameLookupPeriods.Init;
    var
 FromDate , ToDate , LowDate: TDateTime ;
procedure initDropdown ;
  var
    Maanden,CurrIndex : integer ;
    Zqgen : TuniQuery ;

begin
  CurrIndex := -1 ;
    Zqgen := TuniQuery.create(self) ;
    try
    Zqgen.Connection := DMTCCoreLink.TheZConnection ;
  Maanden := -12 ;
  if rgPEriode.ItemIndex =0 then
   Maanden := -1 ;

  if rgPEriode.ItemIndex =1 then
   Maanden := -2 ;
  if rgPEriode.ItemIndex =2 then
   Maanden := -3 ;
  if rgPEriode.ItemIndex =3 then
   Maanden := -4 ;
  if rgPEriode.ItemIndex =4 then
   Maanden := -6 ;


   if (Maanden = -1)  then
     FromDate := GetPeriodStartDate(26)
  else
   if (Maanden = -2)  then
     FromDate := GetPeriodStartDate(24)
  else
   if (Maanden = -3) then
     FromDate := GetPeriodStartDate(23)
  else
   if (Maanden = -4) then
     FromDate := GetPeriodStartDate(22)
  else
   if (Maanden = -6) then
     FromDate := GetPeriodStartDate(20)
  else
  FromDate := GetPeriodStartDate(14);


      ZqGen.sql.text :='Select min(ddate) from transact where ddate > cast('+QuotedStr('1900/01/01')+' as date)' ;


     CBFromPeriode.Clear ;

     ZqGen.open ;
     LowDate := FromDate ;
     if not zqGen.IsEmpty and (zqGen.fields[0].AsDateTime <> 0 ) then
        LowDate := zqGen.fields[0].AsDateTime else
        LowDate := IncMonth(Date,-24)  ;

     CBFromPeriode.Items.Add(DateToStr(FromDate) + ' / ' + DateToStr(IncMonth(FromDate,-Maanden)-1) );
     while LowDate <= FromDate do
       begin
         FromDate := IncMonth(FromDate,Maanden) ;
         CBFromPeriode.Items.Add(DateToStr(FromDate) + ' / ' + DateToStr(IncMonth(FromDate,-Maanden)-1) );
         if CurrIndex = -1 then
         if FromDate < date then
            CurrIndex := CBFromPeriode.Items.Count -1 ;
       end;
       if CurrIndex > -1 then
        CBFromPeriode.ItemIndex := CurrIndex 
       else
      CBFromPeriode.ItemIndex := 0 ;
      // CBFromPeriodeChange(self);

     ZqGen.sql.text :='Select min(ddate) from transact where FAmount <> 0 and ddate is not null' ;
     ZqGen.open ;
     LowDate := FromDate ;
     if not zqGen.IsEmpty and (zqGen.fields[0].AsDateTime <> 0 ) then
        LowDate := zqGen.fields[0].AsDateTime ;

    finally
         Zqgen.free ;
    end;
   end;
begin

 CBFromPeriode.Items.BeginUpdate ;
 try
 initDropdown ;
 finally
   CBFromPeriode.Items.EndUpdate ;

     FromDate := TDataBaseRoutines.GetPeriodStartDate(14);

     ToDate := TDataBaseRoutines.GetPeriodEndDate(26);
   {  cbYears.Clear ;
     cbYears.Items.Add(FormatDateTime('yyyy-mm',FromDate) + ' / ' + FormatDateTime('yyyy-mm',ToDate) );

     while LowDate <= FromDate do
       begin
          FromDate := IncMonth(FromDate,-12) ;
          todate := IncMonth(todate,-12) ;
          cbYears.Items.Add(FormatDateTime('yyyy-mm',FromDate) + ' / ' + FormatDateTime('yyyy-mm',ToDate) );
       end;
    cbYears.ItemIndex := 0 ;}
    dtFromdate.Date :=  FromDate ;
    dtTodate.Date :=  ToDate ;

 end;

end;

procedure TFrameLookupPeriods.InitCaptions;
begin
  Label3.Caption := DMTCCoreLink.GetTextLang(2872);
  rgPEriode.Caption := DMTCCoreLink.GetTextLang(1046);
  rgPEriode.items[0] :=   DMTCCoreLink.GetTextLang(901019);
  rgPEriode.items[1] := '2 ' + DMTCCoreLink.GetTextLang(3313);
  rgPEriode.items[2] := DMTCCoreLink.GetTextLang(901020);
  rgPEriode.items[3] := '4 ' + DMTCCoreLink.GetTextLang(3313);
  rgPEriode.items[4] := DMTCCoreLink.GetTextLang(901021);
  rgPEriode.items[5] := DMTCCoreLink.GetTextLang(901022);

  TabSheet1.Caption := DMTCCoreLink.GetTextLang(3314);
  TabSheet2.Caption := DMTCCoreLink.GetTextLang(3315);
  lTodate.Caption := DMTCCoreLink.GetTextLang(287);
  LFromdate.Caption := DMTCCoreLink.GetTextLang(286);
end;

procedure TFrameLookupPeriods.rgPEriodeClick(Sender: TObject);
begin
 Init ;
end;

function TFrameLookupPeriods.GetPurePeriodText: String;
begin
  result := result + DateToStr(GetStartDate) + ' / ' +  DateToStr(GetEndDate)  ;
end;

function TFrameLookupPeriods.GetPropString: String;
begin
   result := 'PERIOD='+IntToStr(rgPEriode.ItemIndex) + #13+#10 +
   'FROMPERIOD=' + IntToStr(CBFromPeriode.ItemIndex) + #13+#10 +
   'FROMDATE=' + IntToStr(Trunc(dtFromdate.Date)) + #13+#10 +
   'TODATE=' + IntToStr(Trunc(dtTodate.Date)) ;
end;

procedure TFrameLookupPeriods.SetPropString(aString: String);
var
 AList : TStringlist ;
begin
 AList := TStringlist.Create ;
 try
  AList.Text := aString ;
  try
    rgPEriode.ItemIndex := StrToIntDef(AList.Values['PERIOD'],0) ;
    Init ;
    CBFromPeriode.ItemIndex := StrToIntDef(AList.Values['FROMPERIOD'],0) ;

    dtFromdate.Date := StrToIntDef(AList.Values['FROMDATE'],trunc(dtFromdate.Date)) ;
    dtTodate.Date := StrToIntDef(AList.Values['TODATE'],trunc(dtTodate.Date)) ;

  except

  end;

 finally
   AList.free ;
 end;
end;

function TFrameLookupPeriods.GetPeriodStartDate(APeriod : Integer): TDate;
begin
 Result := TDataBaseRoutines.GetPeriodStartDate(APeriod);
 Result := IncMonth(Result,48);
end;

end.
