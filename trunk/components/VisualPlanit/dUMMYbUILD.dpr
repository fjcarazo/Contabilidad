program dUMMYbUILD;

uses
  Forms,
  Unit6 in 'dUMMY\Unit6.pas' {Form6},
  VpAbout in 'VpAbout.pas' {frmAbout},
  VpWavDlg in 'VpWavDlg.pas' {FrmSoundDialog},
  VpTaskEditDlg in 'VpTaskEditDlg.pas' {TaskEditForm},
  VpSelResDlg in 'VpSelResDlg.pas' {frmSelectResource},
  VpBDEDS in 'VpBDEDS.pas',
  VpXChrFlt in 'VpXChrFlt.pas',
  VpXBase in 'VpXBase.pas',
  VpWeekView in 'VpWeekView.pas',
  VpWavPE in 'VpWavPE.pas',
  VpTimerPool in 'VpTimerPool.pas',
  VpTaskList in 'VpTaskList.pas',
  VpSRVars in 'VpSRVars.pas',
  VpSR in 'VpSR.pas',
  VPSQLParadoxDialect in 'VPSQLParadoxDialect.pas',
  VPSQLDS in 'VPSQLDS.pas',
  VPSQLDialect in 'VPSQLDialect.pas',
  VPSQLBDE in 'VPSQLBDE.pas',
  VpResEditDlg in 'VpResEditDlg.pas' {ResEditForm},
  VpRegIs in 'VpRegIs.pas',
  VpRegF2 in 'VpRegF2.pas',
  VpRegAd in 'VpRegAd.pas',
  VpReg in 'VpReg.pas',
  VpPrtPrvDlg in 'VpPrtPrvDlg.pas' {frmPrintPreview},
  VpPrtPrv in 'VpPrtPrv.pas',
  VpPrtFmtEd in 'VpPrtFmtEd.pas',
  VpPrtFmtDlg in 'VpPrtFmtDlg.pas',
  VpPrtFmtCBox in 'VpPrtFmtCBox.pas',
  VpPrtFmt in 'VpPrtFmt.pas',
  VpNavBar in 'VpNavBar.pas',
  VpNabEd in 'VpNabEd.pas' {frmNavBarEd},
  VpMonthView in 'VpMonthView.pas',
  VpMisc in 'VpMisc.pas',
  VpLocalize in 'VpLocalize.pas',
  VpLEDLabel in 'VpLEDLabel.pas',
  VpFlxDsEd1 in 'VpFlxDsEd1.pas' {frmFieldMapper},
  VpFlxDS in 'VpFlxDS.pas',
  VpFF2DS in 'VpFF2DS.pas',
  VpException in 'VpException.pas',
  VpEvntEditDlg in 'VpEvntEditDlg.pas' {DlgEventEdit},
  VpEventRpt in 'VpEventRpt.pas',
  VpEdShape in 'VpEdShape.pas' {frmEditShape},
  VpEdPop in 'VpEdPop.pas',
  VpEdFmtLst in 'VpEdFmtLst.pas' {frmPrnFormat},
  VpEdFmt in 'VpEdFmt.pas' {frmEditFormat},
  VpEdElem in 'VpEdElem.pas' {frmEditElement},
  VpDlg in 'VpDlg.pas',
  VpDBIsamDS in 'VpDBIsamDS.pas',
  VPDbIntf in 'VPDbIntf.pas',
  VpDBDS in 'VpDBDS.pas',
  VpDayView in 'VpDayView.pas',
  VpDatePropEdit in 'VpDatePropEdit.pas',
  VpDateEdit in 'VpDateEdit.pas',
  VpData in 'VpData.pas',
  VpContactGrid in 'VpContactGrid.pas',
  VpContactEditDlg in 'VpContactEditDlg.pas' {ContactEditForm},
  VpContactButtons in 'VpContactButtons.pas',
  VpConst in 'VpConst.pas',
  VpClock in 'VpClock.pas',
  VpCanvasUtils in 'VpCanvasUtils.pas',
  VpCalendar in 'VpCalendar.pas',
  VpBaseDS in 'VpBaseDS.pas',
  VpBase in 'VpBase.pas',
  VpAlarmDlg in 'VpAlarmDlg.pas' {AlarmNotifyForm},
  VpAdvDS in 'VpAdvDS.pas',
  VpXParsr in 'VpXParsr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.