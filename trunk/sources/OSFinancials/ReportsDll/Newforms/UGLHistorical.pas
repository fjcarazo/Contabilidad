unit UGLHistorical;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UReportBasis, DB, ZAbstractRODataset, ZAbstractDataset,
  DBAccess , Uni, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfmGLHistorical = class(TFormReportOptionsBase)
    cbyear: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ZQGetLowDate: TuniQuery;
    dbcbShowDetails: TCheckBox;
    cbRepType: TComboBox;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbyearChange(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmGLHistorical: TfmGLHistorical;

implementation

uses UDMTCCoreLink, OSFGeneralRoutines,math, UDMReportsGlobals;

{$R *.dfm}

procedure TfmGLHistorical.FormShow(Sender: TObject);
var
 FromDate , ToDate , LowDate: TDateTime ;

begin
  inherited;
  FromDate := TDataBaseRoutines.GetPeriodStartDate(14);
  ToDate := TDataBaseRoutines.GetPeriodEndDate(26) ;

 cbyear.Clear ;
 ZQGetLowDate.Connection := DMTCCoreLink.TheZConnection ;
 ZQGetLowDate.open ;
 LowDate := FromDate ;
 if not ZQGetLowDate.IsEmpty and (ZQGetLowDate.fields[0].AsDateTime <> 0 ) then
    LowDate := ZQGetLowDate.fields[0].AsDateTime ;
 cbyear.Items.Add(DateToStr(FromDate) + ' / ' + DateToStr(ToDate) );
 while LowDate < FromDate do
   begin
     FromDate := IncMonth(FromDate,-12) ;
     ToDate := IncMonth(ToDate,-12) ;
     cbyear.Items.Add(DateToStr(FromDate) + ' / ' + DateToStr(ToDate) );
   end;
  cbyear.ItemIndex := 0 ;
  cbyearChange(self); 
end;

procedure TfmGLHistorical.cbyearChange(Sender: TObject);
var
 FromDate , ToDate : TDateTime ;
  i : integer ;
begin
  inherited;
  FromDate := TDataBaseRoutines.GetPeriodStartDate(14);
  ToDate := TDataBaseRoutines.GetPeriodEndDate(26) ;



// cbyear.Items.Add(DateToStr(FromDate) + ' / ' + DateToStr(ToDate) );
 for i := 1 to  cbyear.ItemIndex do
   begin
     FromDate := IncMonth(FromDate,-12) ;
     ToDate := IncMonth(ToDate,-12) ;

   end;
  DateTimePicker1.Date := FromDate ;
  DateTimePicker2.Date := ToDate ;



end;

procedure TfmGLHistorical.BtnOkClick(Sender: TObject);
Var
  Params , FileName : String ;
  ShowType : Integer ;
  aDateTimeSetting : TFormatSettings ;
begin
 inherited ;

 hide ;
 try

  aDateTimeSetting.ShortDateFormat := 'yyyy/mm/dd' ;
  aDateTimeSetting.DateSeparator := '/' ;
  ShowType := GetPrintType ;
  Params := 'FROMPERIOD=' + DateToStr(DateTimePicker1.Date,aDateTimeSetting) +#13 ;
  Params := Params + 'TOPERIOD=' +  DateToStr(DateTimePicker2.date,aDateTimeSetting) +#13 ;
  Params := Params + 'SHOWNILBALANCE=' + booltoStr(dbcbShowDetails.Checked,true)  +#13 ;
   Params := Params + 'REPORTTYPE=' +  IntToStr(cbRepType.ItemIndex) +#13 ;
  Params := Params + 'DEBCONTROLID=' +  IntToStr(DMTCCoreLink.DebtorsControlAccountid) +#13 ;
  Params := Params + 'CREDCONTROLID=' +  IntToStr(DMTCCoreLink.CreditorsControlAccountid) +#13 ;
  Params := Params + 'RETAINEDINCOME=' +  IntToStr(DMTCCoreLink.RetaindIncomeControlAccountid)  ;

  FileName := '' ;
  if ShowType = 3 then
    begin
      FileName := DMTCCoreLink.GetLocalSaveDir  +'Printout\' ;
      ForceDirectories(FileName);
      Randomize ;
      FileName := FileName + IntToStr(RandomRange(0,999999)) +'.pdf' ;
    end;
 
      DMReportsGlobals.ShowReport('REPORTS\GL\TRIAL_BALANCE\Historical',Caption,params,ShowType,FileName);
   finally
    show ;
  end;
end;

procedure TfmGLHistorical.BtnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
