(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DebtorAgeAnalysisReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Dialogs;

type
  TqrDebtorAgeAnalysis = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    lblCurrent: TQRLabel;
    lbl30: TQRLabel;
    lbl60: TQRLabel;
    lbl90: TQRLabel;
    QRDBText5: TQRDBText;
    Detail1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    Foot1: TQRBand;
    qrlTotal: TQRLabel;
    qrlCurrent: TQRLabel;
    qrl30days: TQRLabel;
    qrl60days: TQRLabel;
    qrl90days: TQRLabel;
    QRDBText7: TQRDBText;
    qrlCurrentAmnt: TQRLabel;
    qrl30Amnt: TQRLabel;
    qrl60Amnt: TQRLabel;
    qrl90Amnt: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand2: TQRBand;
    qrlTotalTotal: TQRLabel;
    qrlTotalCurrent: TQRLabel;
    qrlTotal30: TQRLabel;
    qrlTotal60: TQRLabel;
    qrlTotal90: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlAccount: TQRLabel;
    qrlFAmount: TQRLabel;
    qrlTotalg: TQRLabel;
    qrlCurrentg: TQRLabel;
    qrl30daysg: TQRLabel;
    qrl60daysg: TQRLabel;
    qrl90daysg: TQRLabel;
    AccTel: TQRLabel;
    AccFax: TQRLabel;
    AccEmail: TQRLabel;
    AccCrLimit: TQRLabel;
    qrOpenItenLoopBand: TQRLoopBand;
    qrlnkTotalAmt: TQRLabel;
    qrlnkCurrent: TQRLabel;
    qrlnk30: TQRLabel;
    qrlnk60: TQRLabel;
    qrlnk90: TQRLabel;
    qrOiDescript: TQRLabel;
    qrOiReference: TQRLabel;
    qrOiDate: TQRLabel;
    qrContact: TQRLabel;
    RepGrpFoot: TQRBand;
    RepGrpHead: TQRGroup;
    QRGroup1: TQRGroup;
    QRLabel10: TQRLabel;
    qrlGrpTotal: TQRLabel;
    qrlGrpCurrent: TQRLabel;
    qrlGrp30days: TQRLabel;
    qrlGrp60days: TQRLabel;
    qrlGrp90days: TQRLabel;
    QRLabel9: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Foot1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Detail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDebtorAgeAnalysisBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure qrOpenItenLoopBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepGrpHeadBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepGrpFootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
     LanguageText_DebitorAgeAnalysis ,
     LanguageText_To : String ;
     ShowRepGrp : Integer;
    Procedure EvalAllDays;
  end;


var
  qrDebtorAgeAnalysis: TqrDebtorAgeAnalysis;
  TotalTotal,
  TotalCurrent,
  Total30, Total60,
  Total90            : Real;
  _CurrentGrpTotal,
  _30daysGrpTotal,
  _60daysGrpTotal,
  _90daysGrpTotal,
  CurrentTotal,
  _30daysTotal,
  _60daysTotal,
  _90daysTotal   : Real;
  ShowTransac :Boolean;

Function MkFieldName:String;

implementation

Uses
  GlobalFunctions, Database, DebtorAgeAnalysisOptions, DatabaseAccess, DB,
  UDMTCCoreLink, OSFGeneralRoutines;

{$R *.DFM}

Procedure TqrDebtorAgeAnalysis.EvalAllDays;
// Added by Sylvain 14/01/2000
// For Open Item option.
Var
  OiBool:Boolean;
  Date1,Date2,Date3,Date4:TDate;
  _AccountID:integer;
begin
  Date1:=fmDebtorAgeAnalysisOptions.wwDBDateTimePickerAgeDate.Date;
  Date2:=fmDebtorAgeAnalysisOptions.wwDBDateTimePicker30Days.Date;
  Date3:=fmDebtorAgeAnalysisOptions.wwDBDateTimePicker60Days.Date;
  Date4:=fmDebtorAgeAnalysisOptions.wwDBDateTimePicker90Days.Date;
  OiBool:=fmDebtorAgeAnalysisOptions.dbcbOpenItem.Checked;
  _AccountID:=dmDatabase.qryDebtAgeWAccountID.Value;

  dmDatabase.tblTmpAgeAnal.Locate('WaccountID',_AccountID,[]);
  CurrentTotal := dmDatabase.tblTmpAgeAnalFCurrent.Value;
  _30daysTotal := dmDatabase.tblTmpAgeAnalF30Days.Value;
  _60daysTotal := dmDatabase.tblTmpAgeAnalF60Days.Value;
  _90daysTotal := dmDatabase.tblTmpAgeAnalF90Days.Value;
end;

procedure TqrDebtorAgeAnalysis.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  DmDatabase.tblSysVars.Open;
  QRLabel1.Caption := LanguageText_DebitorAgeAnalysis +   ' '+
                      dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit1').AsString;

  lblCurrent.Caption := dmDatabase.tblReportingOptions.FieldByName('SDebtorAgeRangeName0').AsString +
                        ' '+ LanguageText_To + ' ' +
                        dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit1').AsString;
  lbl30.Caption := dmDatabase.tblReportingOptions.FieldByName('SDebtorAgeRangeName1').AsString +
                   ' '+ LanguageText_To + ' ' +
                   dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').AsString;
  lbl60.Caption := dmDatabase.tblReportingOptions.FieldByName('SDebtorAgeRangeName2').AsString +
                   ' '+ LanguageText_To + ' ' +
                   dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit3').AsString;
  lbl90.Caption := dmDatabase.tblReportingOptions.FieldByName('SDebtorAgeRangeName3').AsString +
                   ' '+ LanguageText_To + ' ' +
                   dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit4').AsString;

  if (dmDatabase.tblReportingOptions.FieldByName('BDebtorAgeAccountDetail').Asinteger = 1) then
    Self.QRGroup1.Height:=50
  else
     Self.QRGroup1.Height:=20;

end;

procedure TqrDebtorAgeAnalysis.Foot1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  if ((Abs(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat)< Abs(dmDatabase.tblReportingOptions.FieldByName('FDebtorAgeMinimumAmount').AsFloat)) AND (dmDatabase.tblReportingOptions.FieldByName('FDebtorAgeMinimumAmount').AsFloat<>0))
     Or
     ((dmDatabase.tblReportingOptions.FieldByName('BDebtorAgeIgnoreZeroBal').Asinteger = 1) AND (FixAmount(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat)=0))
      then begin
   PrintBand:=False;
   exit;
  end;

 // if Abs(CurrentTotal + _30daysTotal + _60daysTotal + _90daysTotal)<0.001 then PrintBand:=False;
  qrlCurrent.Caption := FormatFloat(getviewmask(0),CurrentTotal );
  qrl30days.Caption := FormatFloat(getviewmask(0),_30daysTotal );
  qrl60days.Caption := FormatFloat(getviewmask(0),_60daysTotal );
  qrl90days.Caption := FormatFloat(getviewmask(0),_90daysTotal );
  qrlTotal.Caption := FormatFloat(getviewmask(0),dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat );


end;

procedure TqrDebtorAgeAnalysis.Detail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  TmpInt:LongInt;
  Temp:Real;
begin
  if ((Abs(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat)< Abs(dmDatabase.tblReportingOptions.FieldByName('FDebtorAgeMinimumAmount').AsFloat)) AND (dmDatabase.tblReportingOptions.FieldByName('FDebtorAgeMinimumAmount').AsFloat<>0))
     Or
     ((dmDatabase.tblReportingOptions.FieldByName('BDebtorAgeIgnoreZeroBal').Asinteger = 1) AND (FixAmount(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat)=0))
      then begin
   PrintBand:=False;
   exit;
  end;

  qrlCurrentAmnt.Caption := '';
  qrlFAmount.Caption := '';
  qrl30Amnt.Caption := '';
  qrl60Amnt.Caption := '';
  qrl90Amnt.Caption := '';
  if dmDatabase.qryDebtAgeWTransactionID.Isnull Then
    Exit;
  qrlCurrentAmnt.Caption := FormatFloat(getviewmask(0),0 );;
  qrl30Amnt.Caption := FormatFloat(getviewmask(0),0 );;
  qrl60Amnt.Caption := FormatFloat(getviewmask(0),0 );;
  qrl90Amnt.Caption := FormatFloat(getviewmask(0),0 );;
  if (fmDebtorAgeAnalysisOptions.dbcbOpenItem.Checked=False) AND (
     (dmDatabase.qryDebtAgeDDate.Value <= dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').AsdateTime) or
     (dmDatabase.qryDebtAgeDDate.Value > dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeCurrentDate').AsdateTime ) ) then
    begin
      // PrintBand:=False;
      // Exit;
    end;
// added 28/01/2001
  if fmDebtorAgeAnalysisOptions.dbcbOpenItem.Checked=False then
  begin
    temp:= dmDatabase.qryDebtAgeFAmount.AsFloat
  end
  else
  begin
   if dmDatabase.qryDebtAgeFOutStandingAmount.AsFloat = 0 then
      begin
       PrintBand:=False;
       exit;
      end;
    if dmDatabase.qryDebtAgeFAmount.AsFloat>0 then
      temp:= dmDatabase.qryDebtAgeFOutStandingAmount.AsFloat
    else
      temp:= dmDatabase.qryDebtAgeFAmount.AsFloat;
  end;
  if (dmDatabase.qryDebtAgeDDate.Value <=
     dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit1').Asdatetime) and
     (dmDatabase.qryDebtAgeDDate.Value >
     dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').Asdatetime) then
  begin
    qrlCurrentAmnt.Caption := FormatFloat(getviewmask(0),Temp );

//    qrl30Amnt.Caption := '';
//    qrl60Amnt.Caption := '';
//    qrl90Amnt.Caption := '';
  end;
  if (dmDatabase.qryDebtAgeDDate.Value <=
     dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit2').Asdatetime) and
     (dmDatabase.qryDebtAgeDDate.Value >
     dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit3').Asdatetime) then
  begin
//    qrlCurrentAmnt.Caption := '';
    qrl30Amnt.Caption := FormatFloat(getviewmask(0),Temp );
//    qrl60Amnt.Caption := '';
//    qrl90Amnt.Caption := '';
  end;
  if (dmDatabase.qryDebtAgeDDate.Value <=
     dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit3').Asdatetime) and
     (dmDatabase.qryDebtAgeDDate.Value >
     dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit4').Asdatetime) then
  begin
//    qrlCurrentAmnt.Caption := '';
//    qrl30Amnt.Caption := '';
    qrl60Amnt.Caption := FormatFloat(getviewmask(0),Temp );
//    qrl90Amnt.Caption := '';
  end;
  if (dmDatabase.qryDebtAgeDDate.Value <=
     dmDatabase.tblReportingOptions.FieldByName('DDebtorAgeDateLimit4').Asdatetime) then
  begin
//    qrlCurrentAmnt.Caption := '';
//    qrl30Amnt.Caption := '';
//    qrl60Amnt.Caption := '';
    qrl90Amnt.Caption := FormatFloat(getviewmask(0),Temp );
  end;
  qrlFAmount.Caption := FormatFloat(getviewmask(0),Temp );

  dmDatabase.ZQOILinks.sql.text := 'Select OILinks.*,Messages.* from OILinks  join transact on OILinks.WAmountTransactionID = transact.WtransactionID join messages on (transact.WDescriptionId = Messages.WMessageId) ' +
    ' where OILinks.WAmountTransactionID=:id';
  dmDatabase.ZQOILinks.params[0].AsInteger := dmDatabase.qryDebtAgeWTransactionID.AsInteger ;
  dmDatabase.ZQOILinks.open ;
  TmpInt:=dmDatabase.ZQOILinks.RecordCount;
  if (Tmpint>0)
//  AND (dmDatabase.qryDebtStatementDDate.Value<=fmDebtorAgeAnalysisOptions.wwDBDateTimePicker30Days.Date)
  AND (fmDebtorAgeAnalysisOptions.dbcbOpenItem.Checked) Then  // Statment
//  or ((Tmpint<0) AND (idDocType = 2 )) then // remittance
  begin
    qrOpenItenLoopBand.PrintCount:=TmpInt;
    qrOpenItenLoopBand.Height:=16;
    dmDatabase.ZQOILinks.First;
  end
  else
  begin
    qrOpenItenLoopBand.PrintCount:=0;
    qrOpenItenLoopBand.Height:=0;
  end;
end;

procedure TqrDebtorAgeAnalysis.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlTotalCurrent.Caption := FormatFloat(getviewmask(0),TotalCurrent );
  qrlTotal30.Caption := FormatFloat(getviewmask(0),Total30 );
  qrlTotal60.Caption := FormatFloat(getviewmask(0),Total60 );
  qrlTotal90.Caption := FormatFloat(getviewmask(0),Total90 );
  qrlTotalTotal.Caption := FormatFloat(getviewmask(0),TotalTotal );
end;

procedure TqrDebtorAgeAnalysis.qrDebtorAgeAnalysisBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  ShowTransac:= dmDatabase.tblReportingOptions.FieldByName('BDebtorAgeShowTransac').Asinteger = 1;
  Detail1.Enabled :=ShowTransac;
  Foot1.Enabled:=ShowTransac;
  QRLabel2.Enabled:=ShowTransac;
  QRLabel4.Enabled:=ShowTransac;
  qrOpenItenLoopBand.Height:=0;  
  TotalTotal := 0;
  TotalCurrent := 0;
  Total30 := 0;
  Total60 := 0;
  Total90 := 0;
end;

procedure TqrDebtorAgeAnalysis.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlCurrentg.Caption :='';
  qrl30daysg.Caption := '';
  qrl60daysg.Caption := '';
  qrl90daysg.Caption := '';
  qrlTotalg.Caption := '';
  with dmdatabase.qryDebtAge do
   qrlAccount.Caption :=FullAccountCode(FieldByName('SACCOUNTCODE').AsString,1);
  EvalAllDays;
  if ((Abs(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat)< Abs(dmDatabase.tblReportingOptions.FieldByName('FDebtorAgeMinimumAmount').AsFloat)) AND (dmDatabase.tblReportingOptions.FieldByName('FDebtorAgeMinimumAmount').AsFloat<>0))
     Or
     ((dmDatabase.tblReportingOptions.FieldByName('BDebtorAgeIgnoreZeroBal').Asinteger = 1) AND (FixAmount(dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat)=0))
      then begin
   PrintBand:=False;
   exit;
  end;

  TotalTotal := TotalTotal + dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat;
  TotalCurrent := TotalCurrent + CurrentTotal;
  Total30 := Total30 + _30daysTotal;
  Total60 := Total60 + _60daysTotal;
  Total90 := Total90 + _90daysTotal;
  // Sylvain: Provision for ReprtingGroup Totals
  _CurrentGrpTotal :=  _CurrentGrpTotal + dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat;
  _30daysGrpTotal :=  _30daysGrpTotal + _30daysTotal;
  _60daysGrpTotal := _60daysGrpTotal + _60daysTotal;
  _90daysGrpTotal := _90daysGrpTotal + _90daysTotal;
  if ShowTransac then
  begin
   qrlCurrentg.Caption :='';
   qrl30daysg.Caption := '';
   qrl60daysg.Caption := '';
   qrl90daysg.Caption := '';
   qrlTotalg.Caption := '';
  end
  else
  begin
   qrlCurrentg.Caption := FormatFloat(getviewmask(0),CurrentTotal );
   qrl30daysg.Caption := FormatFloat(getviewmask(0),_30daysTotal );
   qrl60daysg.Caption := FormatFloat(getviewmask(0),_60daysTotal );
   qrl90daysg.Caption := FormatFloat(getviewmask(0),_90daysTotal );
   qrlTotalg.Caption := FormatFloat(getviewmask(0),dmDatabase.tblTmpAgeAnalFTOTAL.AsFloat );
  end;
  if (dmDatabase.tblReportingOptions.FieldByName('BDebtorAgeAccountDetail').Asinteger = 1) then
  begin
    dmDatabase.tblDebtor.Locate('WAccountID',dmDatabase.qryDebtAgeWAccountID.AsString,[]);
    AccTel.Caption:='Tel : '+dmDatabase.tblDebtorSTelephone1.AsString;
    AccFax.Caption:='Fax : '+dmDatabase.tblDebtorSFax.AsString;
    AccCrLimit.Caption:='Credit Limit: '+dmDatabase.tblDebtorFCREDITLimit.AsString;
    AccEmail.Caption:='E-Mail : '+dmDatabase.tblDebtorSEmail.AsString;
    qrContact.Caption := 'Contact :'+ReadContactNAme(dmDatabase.tblDebtorWContactID.AsInteger);
  end
  else
  Begin
    AccTel.Caption:='';
    AccFax.Caption:='';
    AccCrLimit.Caption:='';
    AccEmail.Caption:='';
    qrContact.Caption:='';    
  end;
end;

procedure TqrDebtorAgeAnalysis.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  Value:=FormatDateTime('dd/mm/yyyy "at" hh:nn:ss ',StrToDateTime(Value));
end;

procedure TqrDebtorAgeAnalysis.qrOpenItenLoopBandBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
Var
  TmpFAmt:Real;
begin
  //need redo in reportman 
  PrintBand := false ;
  exit ;

  qrlnkTotalAmt.Caption:='';
  qrlnkCurrent.Caption:='';
  qrlnk30.Caption:='';
  qrlnk60.Caption:='';
  qrlnk90.Caption:='';
  qrOiDate.Caption:=dmDatabase.qryDebtAgeDDAte.AsString;
  qrOiReference.Caption:=dmDatabase.qryDebtAgeSReference.Value;
  qrOiDescript.Caption:=dmDatabase.qryDebtAgeSDescription_1.Value;
//  TmpFAmt:= dmdatabase.ZQOILinksWLinkedAmount.Value-dmdatabase.ZQOILinksWOutstandingAmount.Value;
  TmpFAmt:= dmdatabase.ZQOILinksWLinkedAmount.Value;

  dmDatabase.ZQTransAction.SQL.Text := 'select * from transact where WTransactionId = :Id ';
  dmDatabase.ZQTransAction.Params[0].AsInteger :=  dmdatabase.ZQOILinksWLinkTransactionID.AsInteger ;


  dmDatabase.ZQTransAction.Open;

  qrOiDate.Caption:=dmDatabase.ZQTransActionDDATE.AsString;
  qrOiReference.Caption:=dmDatabase.ZQTransActionSREFERENCE.Value;
  qrOiDescript.Caption:=   DMTCCoreLink.ReadDescription(dmDatabase.ZQTransActionWDescriptionID.AsInteger);
  dmDatabase.ZQTransAction.Close;


 if (Abs(GetPeriod(dmdatabase.ZQOILinksDDocDate.Value) - GetPeriod(dmdatabase.ZQOILinksDDate.Value))<=1)
     AND (dmDatabase.qryDebtAgeFAmount.Value>0) then
   begin
     Printband := False ;
  end;
  dmdatabase.ZQOILinks.Next;
  qrlnkCurrent.Caption := FloatToStrTD2C(-TmpFAmt, ffFixed, 18, -1)
end;


Function MkFieldName:String;
begin
  Result := 'WReportingGroup'+IntToStr(qrDebtorAgeAnalysis.ShowRepGrp)+'ID'
end;

procedure TqrDebtorAgeAnalysis.RepGrpHeadBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
   lvl : Integer ;
begin

  _CurrentGrpTotal := 0;
  _30daysGrpTotal := 0;
  _60daysGrpTotal := 0;
  _90daysGrpTotal := 0;
  PrintBand:=ShowRepGrp>0;
  lvl := 0 ;
   if qrDebtorAgeAnalysis.ShowRepGrp <> 0 then
  QRLabel10.caption := TDataBaseRoutines.GetNesteldNameFromGroupID(dmDatabase.qryDebtAge.fieldByName(MkFieldName).asinteger,lvl)
  else
  QRLabel10.caption := '' ;

end;

procedure TqrDebtorAgeAnalysis.RepGrpFootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlGrpCurrent.Caption := FormatFloat(getviewmask(0),_CurrentGrpTotal );
  qrlGrp30days.Caption := FormatFloat(getviewmask(0),_30daysGrpTotal );
  qrlGrp60days.Caption := FormatFloat(getviewmask(0),_60daysGrpTotal );
  qrlGrp90days.Caption := FormatFloat(getviewmask(0),_90daysGrpTotal );
  qrlGrpTotal.Caption := FormatFloat(getviewmask(0),_CurrentGrpTotal );
end;

end.
