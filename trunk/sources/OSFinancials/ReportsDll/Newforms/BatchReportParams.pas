(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchReportParams;

interface            

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, ComCtrls,db,
  CheckLst, ZAbstractRODataset, DBAccess , Uni,UReportBasis ;

type
  TfmBatchReportParams = class(TFormReportOptionsBase)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    dbcomboxWhichYear: TComboBox;
    dbcboxPeriodsSeperate: TCheckBox;
    dbcboxBalancingEntries: TCheckBox;
    GBUseNumbers: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    cbUseNbr: TCheckBox;
    GBUSePeriods: TGroupBox;
    cboxUsePeriods: TCheckBox;
    Label4: TLabel;
    edtFromDate: TEdit;
    Label5: TLabel;
    edtToDate: TEdit;
    edtBatTo: TEdit;
    edtBatFrom: TEdit;
    CBShowContra: TCheckBox;
    CBBatchTypes: TCheckListBox;
    CBEatchBatchSep: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    tblBatchTypes: TuniQuery;
    cbTaxOnly: TCheckBox;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcomboxWhichYearKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtFromDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtToDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboxUsePeriodsClick(Sender: TObject);
    procedure cbUseNbrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbcboxPeriodsSeperateClick(Sender: TObject);
    procedure CBEatchBatchSepClick(Sender: TObject);
    procedure dbcboxBalancingEntriesClick(Sender: TObject);
    procedure CBShowContraClick(Sender: TObject);
    procedure cbTaxOnlyClick(Sender: TObject);
  private
    { Private declarations }

    Procedure SetVisib;
  public
    CBBatchTypesList : TStringList ;
    FromID , ToID : Integer ;
    function BuildFilterFromChecked(DoAll:Boolean) : String ;
    procedure LoadSysvars ;
    procedure SaveSysvars ;

    { Public declarations }
  end;

var
  fmBatchReportParams: TfmBatchReportParams;
//  FromID, ToID,
  BatchID   : Integer;

implementation

Uses
  HtmlHelpAPI , UDMTCCoreLink, UDMReportsGlobals, osfLookup, UMsgBox, Math,shellapi;

{$R *.DFM}

procedure TfmBatchReportParams.FormShow(Sender: TObject);
begin

  Caption := DMTCCoreLink.GetTextLang(261);
  dbcomboxWhichYear.Clear;
  dbcomboxWhichYear.Items.Add(DMTCCoreLink.GetTextLang(603){'This Year'});
  dbcomboxWhichYear.Items.Add(DMTCCoreLink.GetTextLang(604){'Last Year'});
  dbcomboxWhichYear.Items.Add(DMTCCoreLink.GetTextLang(3012){'All Years'});
  CBEatchBatchSep.Caption := DMTCCoreLink.GetTextLang(2190);
  Label3.Caption := DMTCCoreLink.GetTextLang(242);
  //get the periods

  dbcboxPeriodsSeperate.Caption := DMTCCoreLink.GetTextLang(244);
  dbcboxBalancingEntries.Caption := DMTCCoreLink.GetTextLang(2126);

  tblBatchTypes.Open;
  CBBatchTypesList.Clear;
  CBBatchTypesList.AddObject(DMTCCoreLink.GetTextLang(1098){'All'},Tobject(-1));
  tblBatchTypes.First;

  While not tblBatchTypes.eof do begin
    CBBatchTypesList.AddObject(tblBatchTypes.fieldByName('SDescription').AsString,TObject(tblBatchTypes.fieldByName('WBatchTypeID').AsInteger));
    tblBatchTypes.next;
  end;
  CBBatchTypes.Items.Assign(CBBatchTypesList);

  // load Print Modes

  GBUseNumbers.Caption := DMTCCoreLink.GetTextLang(2090) ;
  GBUSePeriods.Caption := DMTCCoreLink.GetTextLang(2091) ;
  CBShowContra.Caption := DMTCCoreLink.GetTextLang(2092) ;
  Label1.Caption := DMTCCoreLink.GetTextLang(2010) ;
  Label6.Caption := DMTCCoreLink.GetTextLang(2011) ;

  LoadSysvars ;
  SetVisib;  
end;

procedure TfmBatchReportParams.btnOkClick(Sender: TObject);
Var
  Params , FileName : String ;
  ShowType : Integer ;
begin
 inherited ;
 hide ;
 try
  if FromID > ToID then
  begin

    OSFMessageDlg(DMTCCoreLink.GetTextLang(631) + edtFromDate.Text  + ' '+DMTCCoreLink.GetTextLang(208)+' ' + edtToDate.Text , mterror, [mbok], 0);
    edtFromDate.SetFocus;
    exit;
  end;

  ShowType := GetPrintType ;


  SaveSysvars ;
  Params := 'STARTPERIOD=' + IntToStr(FromID) +#13 ;
  Params := Params + 'ENDPERIOD=' + IntToStr(ToID) +#13 ;
  if CBBatchTypes.Checked[0] then
  Params := Params + 'BATCHTYPEID=' + BuildFilterFromChecked(true)  +#13  else
  Params := Params + 'BATCHTYPEID=' + BuildFilterFromChecked(False)  +#13  ;
  Params := Params + 'SHOWBALANCE=' +  booltoStr(dbcboxBalancingEntries.Checked)+#13;
  Params := Params + 'SHOWCONTRA=' +  booltoStr(CBShowContra.Checked);
  FileName := '' ;
  if ShowType = 3 then
    begin
      FileName := DMTCCoreLink.GetLocalSaveDir  +'Printout\' ;
      ForceDirectories(FileName);
      Randomize ;
      FileName := FileName + IntToStr(RandomRange(0,999999)) +'.pdf' ;
    end;
     if dbcboxPeriodsSeperate.Checked then
       DMReportsGlobals.ShowReport('REPORTS\BATCHREPORT\PERIODS_PERIOD',Caption,params,ShowType,FileName)
     else
     if CBEatchBatchSep.Checked then
      DMReportsGlobals.ShowReport('REPORTS\BATCHREPORT\PERIODS_BATCHSEP',Caption,params,ShowType,FileName)
     else
     if cbTaxOnly.Checked then
       DMReportsGlobals.ShowReport('REPORTS\BATCHREPORT\PERIODS_BATCHTAX',Caption,params,ShowType,FileName)
     else
     DMReportsGlobals.ShowReport('REPORTS\BATCHREPORT\PERIODS_DATE',Caption,params,ShowType,FileName);

   finally
    show ;
  end;
end;

procedure TfmBatchReportParams.btnCancelClick(Sender: TObject);
begin
  inherited ;
  Close;
end;

procedure TfmBatchReportParams.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 112 then
  begin

    HtmlHelpShowContentID(167);
    key := 0;
  end;
  if ssCtrl in Shift then
  begin
    if Key=32 then
    begin
      Key:=0;
      cboxUsePeriods.Checked :=  Not cboxUsePeriods.Checked;
    end;
  end;
end;

procedure TfmBatchReportParams.dbcomboxWhichYearKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if Key = 13 then
     begin
       SelectNext(ActiveControl, True, True);
       Key:=0;
     end;
     if Key = 112 then
     begin

         HtmlHelpShowTopic('BatchType.htm');
         key := 0;

     end;
end;

procedure TfmBatchReportParams.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmBatchReportParams.edtFromDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
     begin

         HtmlHelpShowTopic('BatchType.htm');
         key := 0;

     end;
end;

procedure TfmBatchReportParams.edtToDateKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
     begin

         HtmlHelpShowTopic('BatchType.htm');
         key := 0;

     end;
end;

procedure TfmBatchReportParams.cboxUsePeriodsClick(Sender: TObject);
begin
  if cboxUsePeriods.Checked=cbUseNbr.Checked then
  cbUseNbr.Checked:=Not cboxUsePeriods.Checked;
  SetVisib;
end;

procedure TfmBatchReportParams.cbUseNbrClick(Sender: TObject);
begin
  if cbUseNbr.Checked=cboxUsePeriods.Checked then
    cboxUsePeriods.Checked:=Not cbUseNbr.Checked;
  SetVisib;
end;

Procedure TfmBatchReportParams.SetVisib;
begin
  edtBatFrom.Enabled := cbUseNbr.Checked;
  edtBatTo.Enabled := cbUseNbr.Checked;
  Label1.Enabled := cbUseNbr.Checked;
  Label6.Enabled := cbUseNbr.Checked;
  edtFromDate.Enabled := cboxUsePeriods.Checked;
  edtToDate.Enabled := cboxUsePeriods.Checked;
  Label4.Enabled := cboxUsePeriods.Checked;
  Label5.Enabled := cboxUsePeriods.Checked;
end;


function TfmBatchReportParams.BuildFilterFromChecked(DoAll:Boolean): String;
var
 i : Integer ;
begin
 result := '' ;
 for i := 1 to CBBatchTypes.Items.Count -1 do
  begin
   if CBBatchTypes.Checked[i] or DoAll then
     begin
     if result = '' then
        result := IntToStr(Integer(CBBatchTypes.Items.Objects[i]))
       else
       result := result +  ',' +  IntToStr(Integer(CBBatchTypes.Items.Objects[i]))
     end;
  end;
end;

procedure TfmBatchReportParams.LoadSysvars;
var
 i : Integer ;
begin
  dbcomboxWhichYear.ItemIndex := DMTCCoreLink.ReadNwReportOp('BatchRepYear',0) ;
  dbcboxPeriodsSeperate.Checked := DMTCCoreLink.ReadNwReportOp('BatchRepPeriodsSep',false);
  dbcboxBalancingEntries.Checked := DMTCCoreLink.ReadNwReportOp('BatchRepalancingEn',true);
  FromID :=  DMTCCoreLink.ReadNwReportOp('BatchRepFromDateID',14);
  ToID := DMTCCoreLink.ReadNwReportOp('BatchRepToDateID',14);
  edtFromDate.Text := DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDescription||substring(Cast(DSTARTDate as char(35)) from 1 for 7) From Periods where Wyearid in (1,2) and WPeriodID = ' + IntToStr(FromID)) ;
  edtToDate.Text := DMTCCoreLink.OpenSqlReturnFirstColumn('Select SDescription||substring(Cast(DSTARTDate as char(35)) from 1 for 7) From Periods where Wyearid in (1,2) and WPeriodID = ' + IntToStr(ToId)) ;
  CBShowContra.Checked := DMTCCoreLink.ReadNwReportOp('BatchRepShowContra',False);
  CBEatchBatchSep.Checked := DMTCCoreLink.ReadNwReportOp('BatchRepShowBatchSep',true);
  CBBatchTypes.Checked[0] := DMTCCoreLink.ReadNwReportOp('BatchRepLB0',False) ;
 for i := 1 to CBBatchTypes.Items.Count -1  do
   begin
      CBBatchTypes.Checked[i] := DMTCCoreLink.ReadNwReportOp('BatchRepLB'+IntToStr(Integer(CBBatchTypes.Items.Objects[i])),False) ;
   end;
end;

procedure TfmBatchReportParams.SaveSysvars;
var
 i : Integer ;
begin
 DMTCCoreLink.WriteNwReportOp('BatchRepYear',IntToStr(dbcomboxWhichYear.ItemIndex));
 DMTCCoreLink.WriteNwReportOp('BatchRepFromDateID',IntToStr(FromID));
 DMTCCoreLink.WriteNwReportOp('BatchRepToDateID',IntToStr(ToID));
 DMTCCoreLink.WriteNwReportOp('BatchRepPeriodsSep',BoolToStr(dbcboxPeriodsSeperate.Checked,true));
 DMTCCoreLink.WriteNwReportOp('BatchRepalancingEn',BoolToStr(dbcboxBalancingEntries.Checked,true));
 DMTCCoreLink.WriteNwReportOp('BatchRepShowContra',BoolToStr(CBShowContra.Checked,true));
 DMTCCoreLink.WriteNwReportOp('BatchRepShowBatchSep',BoolToStr(CBEatchBatchSep.Checked,true));
 DMTCCoreLink.WriteNwReportOp('BatchRepLB0',BoolToStr(CBBatchTypes.Checked[0],true));

 for i := 1 to CBBatchTypes.Items.Count -1  do
   begin
      DMTCCoreLink.WriteNwReportOp('BatchRepLB'+IntToStr(Integer(CBBatchTypes.Items.Objects[i])),BoolToStr(CBBatchTypes.Checked[i],true));
   end;
end;

procedure TfmBatchReportParams.FormCreate(Sender: TObject);

begin
inherited ;
CBBatchTypesList := TStringList.Create ;
DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TfmBatchReportParams.FormDestroy(Sender: TObject);
begin
inherited ;
CBBatchTypesList.free ;
end;

procedure TfmBatchReportParams.BitBtn1Click(Sender: TObject);

begin
  edtFromDate.Color:=clHighlight;

  if dbcomboxWhichYear.ItemIndex = 0 then
    DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstTHISYEAR,tcltPeriods,FromID)
  else
  if dbcomboxWhichYear.ItemIndex = 2 then
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,FromID)
  else
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstLASTYEAR,tcltPeriods,FromID);

  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    FromID := DMReportsGlobals.Alookup.ReturnID ;
    edtFromDate.Text := DMTCCoreLink.GetPeriodDescription(FromID) ;
    edtFromDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBatchReportParams.BitBtn2Click(Sender: TObject);
begin
  edtToDate.Color:=clHighlight;
  if dbcomboxWhichYear.ItemIndex = 0 then
    DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstTHISYEAR,tcltPeriods,ToID)
  else
  if dbcomboxWhichYear.ItemIndex = 2 then
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,ToID)
  else
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstLASTYEAR,tcltPeriods,ToID) ;


  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    ToID := DMReportsGlobals.Alookup.ReturnID ;
    edtToDate.Text := DMTCCoreLink.GetPeriodDescription(ToID) ;
    edtToDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmBatchReportParams.BitBtn3Click(Sender: TObject);
begin
 (* edtFromDate.Color:=clHighlight;
  if CallNewLookup(30,True) then
  {The result Is in ReturnBatch record}
    FromBatch:= ReturnBatch;
  edtBatFrom.tag := FromBatch.WBatchID ;
  edtBatFrom.Text :=FromBatch.SAlias + ' (' + IntToStr(FromBatch.WBatchID) +')';
  edtFromDate.Color:=clWindow;
  SelectNext(ActiveControl, True, True);   *)
end;

procedure TfmBatchReportParams.BitBtn4Click(Sender: TObject);
begin
(*  edtBatTo.Color:=clHighlight;
  if CallNewLookup(30,True) then
  {The result Is in ReturnBatch record}
    ToBatch:= ReturnBatch;
    edtBatTo.Tag := ToBatch.WBatchID;
  edtBatTo.Text := ToBatch.SAlias + ' (' + IntToStr(ToBatch.WBatchID) +')';
  edtBatTo.Color:=clWindow;
  SelectNext(ActiveControl, True, True);*)
end;

procedure TfmBatchReportParams.dbcboxPeriodsSeperateClick(Sender: TObject);
begin
 if dbcboxPeriodsSeperate.Checked then
   begin
    CBEatchBatchSep.Checked := false ;
    cbTaxOnly.Checked := false ;
   end;
end;

procedure TfmBatchReportParams.CBEatchBatchSepClick(Sender: TObject);
begin
 if CBEatchBatchSep.Checked then
    begin
    dbcboxPeriodsSeperate.Checked := false ;
    cbTaxOnly.Checked := false ;
    end;
end;

procedure TfmBatchReportParams.dbcboxBalancingEntriesClick(
  Sender: TObject);
begin
 if dbcboxBalancingEntries.Checked then
   CBShowContra.Checked := false ;
end;

procedure TfmBatchReportParams.CBShowContraClick(Sender: TObject);
begin
 if CBShowContra.Checked then
   dbcboxBalancingEntries.Checked := false ;
end;

procedure TfmBatchReportParams.cbTaxOnlyClick(Sender: TObject);
begin
 if cbTaxOnly.Checked then
   begin
    CBEatchBatchSep.Checked := false ;
    dbcboxPeriodsSeperate.Checked := false ;
   end;
end;

end.
