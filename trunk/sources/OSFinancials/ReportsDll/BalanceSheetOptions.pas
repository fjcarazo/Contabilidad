(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BalanceSheetOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRPrntr,StdCtrls, DBCtrls, ExtCtrls, Buttons, ComCtrls,UReportBasis;

type
  TfmBalanceSheetOptions = class(TFormReportOptionsBase)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbcboxShowSubAccounts: TCheckBox;
    dbcboxIncNilBal: TCheckBox;
    dbcomboxSequence: TComboBox;
    edtFromDate: TEdit;
    edtToDate: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    dbcomboxWhichYear: TComboBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbcomboxWhichYearChange(Sender: TObject);
  private
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    procedure ShowToAndFromInGui;
    { Private declarations }
  public
     FromID, ToID : Integer ;
  end;

var
  fmBalanceSheetOptions: TfmBalanceSheetOptions;
 

implementation

uses Lookup, HTMLHelpAPI , UDMTCCoreLink, UDMReportsGlobals, UMsgBox, Math ,shellapi;
{$R *.DFM}



procedure TfmBalanceSheetOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlHelpShowContentID(166);
             key := 0;

        end;
end;

procedure TfmBalanceSheetOptions.FormShow(Sender: TObject);
begin
  Caption := DMTCCoreLink.GetTextLang(978);
  BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);
  BtnOk.Caption := DMTCCoreLink.GetTextLang(167);
  Label1.Caption := DMTCCoreLink.GetTextLang(282);
  Label2.Caption := DMTCCoreLink.GetTextLang(208);
  Label3.Caption := DMTCCoreLink.GetTextLang(247);
  dbcboxShowSubAccounts.Caption := DMTCCoreLink.GetTextLang(276);
  dbcboxIncNilBal.Caption := DMTCCoreLink.GetTextLang(248);
  dbcomboxWhichYear.Items[0] := DMTCCoreLink.GetTextLang(603);//Thisyear
  dbcomboxWhichYear.Items[1] := DMTCCoreLink.GetTextLang(604);//Lastyear
  Label4.Caption := DMTCCoreLink.GetTextLang(242);//Which year 242
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(DMTCCoreLink.OpenSqlReturnFirstColumn('Select SACCOUNTReportName1 from SysVars'));
  dbcomboxSequence.Items.Add(DMTCCoreLink.OpenSqlReturnFirstColumn('Select SACCOUNTReportName2 from SysVars'));
  LoadReoprtOp;
  ShowToAndFromInGui ;

end;

procedure TfmBalanceSheetOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBalanceSheetOptions.edtFromDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(441), mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmBalanceSheetOptions.btnOKClick(Sender: TObject);
var
 IncludeOpeningBals : Boolean ;
  Params , FileName : String ;
  ShowType : Integer ;
begin
Hide ;
 try
  if FromID > ToID then
  begin
    OSFMessageDlg(DMTCCoreLink.GetTextLang(631) + edtFromDate.Text  + ' '+DMTCCoreLink.GetTextLang(208)+' ' + edtToDate.Text , mterror, [mbok], 0);
    edtFromDate.SetFocus;
    exit;
  end;
  if ((FromID = 14) and (ToID = 14)) then
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(637){'Include opening balances?'},mtConfirmation,[mbYes,mbNo],0) = mrYes then
     IncludeOpeningBals := true else
     IncludeOpeningBals := false;
  if ((FromID = 14) and (ToID > 14)) then
    IncludeOpeningBals := true;
  if (FromID > 14) then
    IncludeOpeningBals := false;

  Params := 'STARTPERIOD=' + IntToStr(FromID) +#13 ;
  Params := Params + 'ENDPERIOD=' + IntToStr(ToID) +#13 ;
  Params := Params + 'INCLOPENBALANCE=' +  booltoStr(IncludeOpeningBals)+#13;
  Params := Params + 'INCLNILBALANCE=' +  booltoStr(dbcboxIncNilBal.Checked)+#13;
  Params := Params + 'DISPLAYSUBACC=' +  booltoStr(dbcboxShowSubAccounts.Checked);
  ShowType := GetPrintType ;
  FileName := '' ;
  if ShowType = 3 then
    begin
      FileName := DMTCCoreLink.GetLocalSaveDir  +'Printout\' ;
      ForceDirectories(FileName);
      Randomize ;
      FileName := FileName + IntToStr(math.RandomRange(0,999999)) +'.pdf' ;
    end;

  case dbcomboxSequence.ItemIndex of
  0 : DMReportsGlobals.ShowReport('GL\BALANCE\GROUP1',Caption,params,ShowType,FileName) ;
  1 : DMReportsGlobals.ShowReport('GL\BALANCE\GROUP2',Caption,params,ShowType,FileName) ;
  end;
  if ShowType = 3 then
     ShellExecute(Application.Handle,'open',pchar(FileName),'','',1);
  SaveReoprtOp;
 finally
  show ;
 end;
end;

procedure TfmBalanceSheetOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

Procedure TfmBalanceSheetOptions.LoadReoprtOp;
begin
  dbcomboxWhichYear.ItemIndex := DMTCCoreLink.ReadNwReportOp('BAL_YEAR',0) ;
  FromID := DMTCCoreLink.ReadNwReportOp('BAL_FROMDATE',14);
  ToID := DMTCCoreLink.ReadNwReportOp('BAL_TODATE',14);
  dbcomboxSequence.ItemIndex := DMTCCoreLink.ReadNwReportOp('BAL_SEQ',0) ;
end;


Procedure TfmBalanceSheetOptions.SaveReoprtOp;
begin
  DMTCCoreLink.WriteNwReportOp('BAL_YEAR',IntToStr(dbcomboxWhichYear.ItemIndex) ) ;
  DMTCCoreLink.WriteNwReportOp('BAL_FROMDATE',IntToStr(FromID));
  DMTCCoreLink.WriteNwReportOp('BAL_TODATE',IntToStr(ToID));
  DMTCCoreLink.WriteNwReportOp('BAL_SEQ',IntToStr(dbcomboxSequence.ItemIndex));
end;


procedure TfmBalanceSheetOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmBalanceSheetOptions.BitBtn1Click(Sender: TObject);
begin
  edtFromDate.Color:=clHighlight;

  if dbcomboxWhichYear.ItemIndex = 0 then
    DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstTHISYEAR,tcltPeriods,FromID)
  else
  if dbcomboxWhichYear.ItemIndex = 2 then
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,FromID)
  else
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,FromID);

  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    FromID := DMReportsGlobals.Alookup.ReturnID ;
    edtFromDate.Text := DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDescription||substring(Cast(DSTARTDate as char(35)) from 1 for 7) From Periods where Wyearid in (1,2) and WPeriodID = ' + IntToStr(FromID)) ;
    edtFromDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBalanceSheetOptions.BitBtn2Click(Sender: TObject);
begin
  edtToDate.Color:=clHighlight;
  if dbcomboxWhichYear.ItemIndex = 0 then
    DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstTHISYEAR,tcltPeriods,ToID)
  else
  if dbcomboxWhichYear.ItemIndex = 2 then
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,ToID)
  else
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,ToID) ;


  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    ToID := DMReportsGlobals.Alookup.ReturnID ;
    edtToDate.Text := DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDescription||substring(Cast(DSTARTDate as char(35)) from 1 for 7) From Periods where Wyearid in (1,2) and WPeriodID = ' + IntToStr(ToID)) ;
    edtToDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBalanceSheetOptions.dbcomboxWhichYearChange(Sender: TObject);
begin
 if dbcomboxWhichYear.ItemIndex = 0 then
 if FromID < 14 then
    begin
      FromID := FromID + 13 ;
      ToID := ToID + 13 ;
    end;
 // lastyear
 if dbcomboxWhichYear.ItemIndex = 1 then
 if FromID > 13 then
    begin
      FromID := FromID - 13 ;
      ToID := ToID - 13 ;
    end;

 ShowToAndFromInGui ;
end;

procedure TfmBalanceSheetOptions.ShowToAndFromInGui;
begin
  edtFromDate.Text := DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDescription||substring(Cast(DSTARTDate as char(35)) from 1 for 7) From Periods where Wyearid in (1,2) and WPeriodID = ' + IntToStr(FromID)) ;
  edtToDate.Text :=  DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDescription||substring(Cast(DSTARTDate as char(35)) from 1 for 7) From Periods where Wyearid in (1,2) and WPeriodID = ' + IntToStr(ToID)) ;
end;



end.
