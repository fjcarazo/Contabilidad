(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Periods;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TfmPeriods = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    xLabel1: TLabel;
    edtNoPeriods: TEdit;
    dtStartDate: TDateTimePicker;
    cboxLastYearPost: TCheckBox;
    edtPeriod1: TEdit;
    dtPeriod1: TDateTimePicker;
    cbPostl1: TCheckBox;
    edtPeriod2: TEdit;
    xLabel2: TLabel;
    dtPeriod2: TDateTimePicker;
    cbPostl2: TCheckBox;
    edtPeriod3: TEdit;
    xLabel3: TLabel;
    dtPeriod3: TDateTimePicker;
    cbPostl3: TCheckBox;
    edtPeriod4: TEdit;
    xLabel4: TLabel;
    dtPeriod4: TDateTimePicker;
    cbPostl4: TCheckBox;
    edtPeriod5: TEdit;
    xLabel5: TLabel;
    dtPeriod5: TDateTimePicker;
    cbPostl5: TCheckBox;
    edtPeriod6: TEdit;
    xLabel6: TLabel;
    dtPeriod6: TDateTimePicker;
    cbPostl6: TCheckBox;
    edtPeriod7: TEdit;
    xLabel7: TLabel;
    dtPeriod7: TDateTimePicker;
    cbPostl7: TCheckBox;
    edtPeriod8: TEdit;
    xLabel8: TLabel;
    dtPeriod8: TDateTimePicker;
    cbPostl8: TCheckBox;
    edtPeriod9: TEdit;
    xLabel9: TLabel;
    dtPeriod9: TDateTimePicker;
    cbPostl9: TCheckBox;
    edtPeriod10: TEdit;
    xLabel10: TLabel;
    dtPeriod10: TDateTimePicker;
    cbPostl10: TCheckBox;
    edtPeriod11: TEdit;
    xLabel11: TLabel;
    dtPeriod11: TDateTimePicker;
    cbPostl11: TCheckBox;
    edtPeriod12: TEdit;
    xLabel12: TLabel;
    dtPeriod12: TDateTimePicker;
    cbPostl12: TCheckBox;
    edtPeriod13: TEdit;
    xLabel13: TLabel;
    dtPeriod13: TDateTimePicker;
    cbPostl13: TCheckBox;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    cbPost1: TCheckBox;
    cbPost2: TCheckBox;
    cbPost3: TCheckBox;
    cbPost4: TCheckBox;
    cbPost5: TCheckBox;
    cbPost6: TCheckBox;
    cbPost7: TCheckBox;
    cbPost8: TCheckBox;
    cbPost9: TCheckBox;
    cbPost10: TCheckBox;
    cbPost11: TCheckBox;
    cbPost12: TCheckBox;
    cbPost13: TCheckBox;
    llastyear: TLabel;
    Shape1: TShape;
    procedure FormShow(Sender: TObject);
    procedure edtNoPeriodsExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dtStartDateExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    LastStartDate : TDateTime ;
    procedure CalcPeriods(StartDate : TDateTime);
    procedure LoadPeriods;
    procedure SavePeriods;

  end;

var
  fmPeriods: TfmPeriods;

implementation

uses
  Main, Database, GlobalFunctions, HtmlHelpAPI, LanguageChoice,
  DatabaseAccess,ledgerroutines, DB, UDMTCCoreLink, Variants;

{$R *.DFM}

procedure TfmPeriods.LoadPeriods;
begin
  dmDatabase.tblPeriods.close ;
  dmDatabase.tblPeriods.Filtered := false ;
  dmDatabase.tblPeriods.Filter := '(WyearID = 1) or (WYearid = 2)' ;
  dmDatabase.tblPeriods.Filtered := True ;
  dmDatabase.tblPeriods.IndexFieldNames := 'WPERIODID' ;
  dmDatabase.tblPeriods.Open;
  if dmDatabase.tblPeriods.RecordCount = 0 then
  begin
    showmessage('Periods are not here');
    edtNoPeriods.Text := '12';
    dmDatabase.tblPeriods.Close;
    exit;
  end;
  dmDatabase.tblSysVars.Open;
  edtNoPeriods.Text := dmDatabase.tblSysVarsWNoOfPeriods.AsString;
  {Load PostToLastYear}
  cboxLastYearPost.Checked := dmDatabase.tblSysVarsBPostToLastYear.AsInteger=1;
  dmDatabase.tblSysVars.Close;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 14, []) then
  begin
  dtStartDate.Date := dmDatabase.tblPeriodsDStartDate.AsDateTime;
  LastStartDate := dtStartDate.Date ;
  edtPeriod1.Text := dmDatabase.tblPeriodsSDescription.AsString;
  dtPeriod1.Date := dmDatabase.tblPeriodsDEndDate.AsDateTime;
  cbPost1.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 15, []) then
  begin
  edtPeriod2.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod2.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost2.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 16, []) then
  begin
  edtPeriod3.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod3.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost3.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 17, []) then
  begin
  edtPeriod4.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod4.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost4.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 18, []) then
  begin
  edtPeriod5.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod5.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost5.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;

  if dmDatabase.tblPeriods.Locate('WPeriodID', 19, []) then
  begin
  edtPeriod6.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod6.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost6.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 20, []) then
  begin
  edtPeriod7.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod7.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost7.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;

  if dmDatabase.tblPeriods.Locate('WPeriodID', 21, []) then
  begin
  edtPeriod8.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod8.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost8.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;

  if dmDatabase.tblPeriods.Locate('WPeriodID', 22, []) then
  begin
  edtPeriod9.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod9.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost9.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;

  end;

  if dmDatabase.tblPeriods.Locate('WPeriodID', 23, []) then
  begin
  edtPeriod10.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod10.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost10.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;

  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 24, []) then
  begin
  edtPeriod11.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod11.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost11.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 25, []) then
  begin
  edtPeriod12.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod12.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost12.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 26, []) then
  begin
  edtPeriod13.Text := dmDatabase.tblPeriodsSDescription.Value;
  dtPeriod13.Date := dmDatabase.tblPeriodsDEndDate.Value;
  cbPost13.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  // last year
    if dmDatabase.tblPeriods.Locate('WPeriodID',1, []) then
  begin
  cbPostl1.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID', 2, []) then
  begin
  cbPostl2.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',3, []) then
  begin
  cbPostl3.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',4, []) then
  begin
  cbPostl4.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',5, []) then
  begin
  cbPostl5.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',6, []) then
  begin
  cbPostl6.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',7, []) then
  begin
  cbPostl7.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',8, []) then
  begin
  cbPostl8.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',9, []) then
  begin
  cbPostl9.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',10, []) then
  begin
  cbPostl10.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',11, []) then
  begin
  cbPostl11.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',12, []) then
  begin
  cbPostl12.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;
  if dmDatabase.tblPeriods.Locate('WPeriodID',13, []) then
  begin
  cbPostl13.Checked := dmDatabase.tblPeriodsBShutdown.AsInteger <> 1 ;
  end;



  dmDatabase.tblPeriods.Close;
end;

procedure TfmPeriods.SavePeriods;
  Function LYDate(aDate:TDate):TDate;
  begin
    Result := incMonth(aDate+1,-12)-1;
  end;
begin
  with dmDatabase do
  begin
    //verify the dates
    if dtPeriod1.Date < dtStartDate.Date then
    begin
      OSFMessageDlg(GetTextLang(476){'Date conflict !!!! Check date 1'}, mterror, [mbok], 0);
      exit;
    end;
    if StrToInt(edtNoPeriods.Text) > 1 then
      if dtPeriod2.Date < dtPeriod1.Date then
      begin
        OSFMessageDlg(GetTextLang(477){'Date conflict !!!! Check date 2'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 2 then
      if dtPeriod3.Date < dtPeriod2.Date then
      begin
        OSFMessageDlg(GetTextLang(478){'Date conflict !!!! Check date 3'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 3 then
      if dtPeriod4.Date < dtPeriod3.Date then
      begin
        OSFMessageDlg(GetTextLang(479){'Date conflict !!!! Check date 4'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 4 then
      if dtPeriod5.Date < dtPeriod4.Date then
      begin
        OSFMessageDlg(GetTextLang(480){'Date conflict !!!! Check date 5'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 5 then
      if dtPeriod6.Date < dtPeriod5.Date then
      begin
        OSFMessageDlg(GetTextLang(481){'Date conflict !!!! Check date 6'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 6 then
      if dtPeriod7.Date < dtPeriod6.Date then
      begin
        OSFMessageDlg(GetTextLang(482){'Date conflict !!!! Check date 7'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 7 then
      if dtPeriod8.Date < dtPeriod7.Date then
      begin
        OSFMessageDlg(GetTextLang(483){'Date conflict !!!! Check date 8'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 8 then
      if dtPeriod9.Date < dtPeriod8.Date then
      begin
        OSFMessageDlg(GetTextLang(484){'Date conflict !!!! Check date 9'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 9 then
      if dtPeriod10.Date < dtPeriod9.Date then
      begin
        OSFMessageDlg(GetTextLang(485){'Date conflict !!!! Check date 10'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 10 then
      if dtPeriod11.Date < dtPeriod10.Date then
      begin
        OSFMessageDlg(GetTextLang(486){'Date conflict !!!! Check date 11}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 11 then
      if dtPeriod12.Date < dtPeriod11.Date then
      begin
        OSFMessageDlg(GetTextLang(487){'Date conflict !!!! Check date 12'}, mterror, [mbok], 0);
        exit;
      end;
    if StrToInt(edtNoPeriods.Text) > 12 then
      if dtPeriod13.Date < dtPeriod12.Date then
      begin
        OSFMessageDlg(GetTextLang(488){'Date conflict !!!! Check date 13'}, mterror, [mbok], 0);
        exit;
      end;
    //If they pass, write them to the table
    tblPeriods.Close;    
    tblSysVars.Open;
    tblSysVars.Edit;
    tblSysVarsWNoOfPeriods.AsString := edtNoPeriods.Text;
    tblSysVarsBPostToLastYear.Value := ord(cboxLastYearPost.Checked);
    tblSysVars.Post;
    tblSysVars.Close;
    //ClearTable(tblPeriods.TableName);
   { if ExecSql('Delete from Periods Where WYearID in (1,2)') <> 0 then
       begin
         showmessage('Periods in use!');
       end;}

    tblPeriods.Open;
    //1st period
    //this year

    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,14]),[]) then
       tblPeriods.edit else
    tblPeriods.Insert;
    tblPeriodsWYEARID.AsInteger := 2 ;
    tblPeriodsWPeriodID.Value := 14;
    tblPeriodsDStartDate.Value := dtStartDate.Date;
    tblPeriodsDEndDate.Value := dtPeriod1.Date;
    tblPeriodsSDescription.Value := edtPeriod1.Text;
    if cbPost1.Checked then
      tblPeriodsBShutdown.Value := 0
    else
      tblPeriodsBShutdown.Value := 1;
    tblPeriods.Post;
    //last year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,1]),[]) then
       tblPeriods.edit else
    tblPeriods.Insert;
    tblPeriodsWPeriodID.Value := 1;
    tblPeriodsWYEARID.AsInteger := 1 ;
    tblPeriodsDStartDate.Value := LYDate(dtStartDate.Date) ;
    tblPeriodsDEndDate.Value := LYDate(dtPeriod1.Date) ;
    tblPeriodsSDescription.Value := edtPeriod1.Text;
     if cbPostl1.Checked then
      tblPeriodsBShutdown.Value := 0
    else
      tblPeriodsBShutdown.Value := 1;
      {
    if cboxLastYearPost.Checked then
      tblPeriodsBShutdown.Value := 0
    else
      tblPeriodsBShutdown.Value := 1; }
    tblPeriods.Post;
    //2nd period
    if StrToInt(edtNoPeriods.Text) > 1 then
    begin
    //This year
     if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,15]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 15;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod1.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod2.Date;
      tblPeriodsSDescription.Value := edtPeriod2.Text;
      if cbPost2.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //Last year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,2]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 2;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod1.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod2.Date) ;
      tblPeriodsSDescription.Value := edtPeriod2.Text;
    {  if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1; }
    if cbPostl2.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    end;
    //3rd period
    if StrToInt(edtNoPeriods.Text) > 2 then
    begin
    //this year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,16]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 16;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod2.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod3.Date;
      tblPeriodsSDescription.Value := edtPeriod3.Text;
      if cbPost3.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,3]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 3;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod2.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod3.Date) ;
      tblPeriodsSDescription.Value := edtPeriod3.Text;
     { if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;}
         if cbPostl3.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;

      tblPeriods.Post;
    end;
    //4th period
    if StrToInt(edtNoPeriods.Text) > 3 then
    begin
    //this year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,17]),[]) then
       tblPeriods.edit else

      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 17;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod3.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod4.Date;
      tblPeriodsSDescription.Value := edtPeriod4.Text;
      if cbPost4.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,4]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 4;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod3.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod4.Date) ;
      tblPeriodsSDescription.Value := edtPeriod4.Text;
        if cbPostl4.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
        {
      if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;  }
      tblPeriods.Post;
    end;
    //5th period
    if StrToInt(edtNoPeriods.Text) > 4 then
    begin
    //this year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,18]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 18;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod4.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod5.Date;
      tblPeriodsSDescription.Value := edtPeriod5.Text;
      if cbPost5.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,5]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 5;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod4.Date)  + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod5.Date) ;
      tblPeriodsSDescription.Value := edtPeriod5.Text;
       if cbPostl5.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
    {  if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;     }
      tblPeriods.Post;
    end;
    //6th period
    if StrToInt(edtNoPeriods.Text) > 5 then
    begin
    //this year
          if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,19]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 19;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod5.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod6.Date;
      tblPeriodsSDescription.Value := edtPeriod6.Text;
      if cbPost6.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
        if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,6]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 6;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod5.Date)  + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod6.Date) ;
      tblPeriodsSDescription.Value := edtPeriod6.Text;
      if cbPostl6.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
    {
      if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1; }
      tblPeriods.Post;
    end;
    //7th period
    if StrToInt(edtNoPeriods.Text) > 6 then
    begin
    //this year
         if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,20]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 20;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod6.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod7.Date;
      tblPeriodsSDescription.Value := edtPeriod7.Text;
      if cbPost7.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
          if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,7]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 7;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod6.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod7.Date);
      tblPeriodsSDescription.Value := edtPeriod7.Text;
       if cbPostl7.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
        {
      if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;}
      tblPeriods.Post;
    end;
    //8th period
    if StrToInt(edtNoPeriods.Text) > 7 then
    begin
    //this year
     if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,21]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 21;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod7.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod8.Date;
      tblPeriodsSDescription.Value := edtPeriod8.Text;
      if cbPost8.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
      if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,8]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 8;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod7.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod8.Date);
      tblPeriodsSDescription.Value := edtPeriod8.Text;
       if cbPostl8.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
        {
      if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;}
      tblPeriods.Post;
    end;
    //9th period
    if StrToInt(edtNoPeriods.Text) > 8 then
    begin
    //this year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,22]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 22;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod8.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod9.Date;
      tblPeriodsSDescription.Value := edtPeriod9.Text;
      if cbPost9.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,9]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 9;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod8.Date)  + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod9.Date);
      tblPeriodsSDescription.Value := edtPeriod9.Text;
       if cbPostl9.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;

    {  if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;}
      tblPeriods.Post;
    end;
    //10th period
    if StrToInt(edtNoPeriods.Text) > 9 then
    begin
    //this year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,23]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 23;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod9.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod10.Date;
      tblPeriodsSDescription.Value := edtPeriod10.Text;
      if cbPost10.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,10]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 10;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod9.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod10.Date);
      tblPeriodsSDescription.Value := edtPeriod10.Text;

      if cbPostl10.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      {
      if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;  }
      tblPeriods.Post;
    end;
    //11th period
    if StrToInt(edtNoPeriods.Text) > 10 then
    begin
    //this year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,24]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 24;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod10.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod11.Date;
      tblPeriodsSDescription.Value := edtPeriod11.Text;
      if cbPost11.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,11]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 11;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod10.Date)+ 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod11.Date);
      tblPeriodsSDescription.Value := edtPeriod11.Text;
      if cbPostl11.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;

      {if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;}
      tblPeriods.Post;
    end;
    //12th period
    if StrToInt(edtNoPeriods.Text) > 11 then
    begin
    //this year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,25]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 25;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod11.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod12.Date;
      tblPeriodsSDescription.Value := edtPeriod12.Text;
      if cbPost12.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,12]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 12;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod11.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod12.Date);
      tblPeriodsSDescription.Value := edtPeriod12.Text;
       if cbPostl12.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
        {
      if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;}
      tblPeriods.Post;
    end;
    //13th period
    if StrToInt(edtNoPeriods.Text) > 12 then
    begin
    //this year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([2,26]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 26;
      tblPeriodsWYEARID.AsInteger := 2 ;
      tblPeriodsDStartDate.Value := dtPeriod12.Date + 1;
      tblPeriodsDEndDate.Value := dtPeriod13.Date;
      tblPeriodsSDescription.Value := edtPeriod13.Text;
      if cbPost13.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;
      tblPeriods.Post;
    //last year
    if tblPeriods.Locate('WYEARID;WPeriodID',VarArrayOf([1,13]),[]) then
       tblPeriods.edit else
      tblPeriods.Insert;
      tblPeriodsWPeriodID.Value := 13;
      tblPeriodsWYEARID.AsInteger := 1 ;
      tblPeriodsDStartDate.Value := LYDate(dtPeriod12.Date) + 1;
      tblPeriodsDEndDate.Value := LYDate(dtPeriod13.Date);
      tblPeriodsSDescription.Value := edtPeriod13.Text;
      if cbPostl13.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;

    {  if cboxLastYearPost.Checked then
        tblPeriodsBShutdown.Value := 0
      else
        tblPeriodsBShutdown.Value := 1;  }
      tblPeriods.Post;
    end;
    tblPeriods.Close;
  end;
end;

procedure TfmPeriods.CalcPeriods(StartDate : TDateTime);
var
  count, Year, TempYear,
  Month, TempMonth, TempDay, Day : Word;
  MonthName                      : String;
  tmpDate:TDateTime;
begin
  if Trim(edtNoPeriods.Text)='' then
    edtNoPeriods.Text:='12';
  TempDay := 0;
  tmpDate:=StartDate;
  DecodeDate(StartDate, Year, Month, Day);
  for count := 0 to StrToInt(edtNoPeriods.Text) - 1 do

  begin

    StartDate:= IncMonth(tmpDate,Count+1);
    DecodeDate(StartDate - 1 , TempYear, TempMonth, TempDay);

    DecodeDate(StartDate - 1 , Year, Month, TempDay);
    case TempMonth of
      1 : begin
        MonthName := GetTextLang(3); //january;

      end;
      2 : begin
        MonthName :=  GetTextLang(4);//'February';
        if TempDay>28 then
        if IsLeapYear(TempYear) then
          TempDay := 29
        else
          TempDay := 28;
      end;
      3 : begin
        MonthName :=  GetTextLang(5);// 'March';

      end;
      4 : begin
        MonthName := GetTextLang(6);//'April';

      end;
      5 : begin
        MonthName := GetTextLang(7);//'May';

      end;
      6 : begin
        MonthName := GetTextLang(8);//'June';

      end;
      7 : begin
        MonthName := GetTextLang(9);// 'July';

      end;
      8 : begin
        MonthName := GetTextLang(10);//'August';

      end;
      9 : begin
        MonthName := GetTextLang(11);//'September';

      end;
      10: begin
        MonthName := GetTextLang(13);//'October';

      end;
      11: begin
        MonthName := GetTextLang(14);//'November';

      end;
      12: begin
        MonthName := GetTextLang(15);//'December';

      end;
    end;
    case count of
      0 : begin
        edtPeriod1.Text := MonthName;
        dtPeriod1.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      1 : begin
        edtPeriod2.Text := MonthName;
        dtPeriod2.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      2 : begin
        edtPeriod3.Text := MonthName;
        dtPeriod3.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      3 : begin
        edtPeriod4.Text := MonthName;
        dtPeriod4.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      4 : begin
        edtPeriod5.Text := MonthName;
        dtPeriod5.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      5 : begin
        edtPeriod6.Text := MonthName;
        dtPeriod6.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      6 : begin
        edtPeriod7.Text := MonthName;
        dtPeriod7.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      7 : begin
        edtPeriod8.Text := MonthName;
        dtPeriod8.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      8 : begin
        edtPeriod9.Text := MonthName;
        dtPeriod9.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      9 : begin
        edtPeriod10.Text := MonthName;
        dtPeriod10.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      10 : begin
        edtPeriod11.Text := MonthName;
        dtPeriod11.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      11 : begin
        edtPeriod12.Text := MonthName;
        dtPeriod12.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
      12 : begin
        edtPeriod13.Text := MonthName;
        dtPeriod13.Date  := EncodeDate(TempYear, TempMonth, TempDay);
      end;
    end;
  end;
end;

procedure TfmPeriods.FormShow(Sender: TObject);
Var
  i:Integer;
  Y,D,M:Word;
begin
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'cancel');


  // Added by SYlvain
  // Init Dates to Now;
  DecodeDate(Date,y,m,d);
  dtStartDate.date := EncodeDate(y,m,1);
  CalcPeriods(dtStartDate.Date);
//  for i:=1 to 13 do
//    (FindComponent('dtPeriod'+IntToStr(i)) as TDateTimePicker).Date:= Date;
  // My End
  dmDatabase.tblTransaction.Open;
  if dmDatabase.tblTransaction.RecordCount <> 0 then
  begin
    LoadPeriods;
    edtNoPeriodsExit(Sender);
//  Disable(edtNoPeriods);
    edtNoPeriods.Enabled := False;
    dtStartDateExit(Sender);
//    dtStartDate.Color := clGray;
    dtStartDate.Enabled := False;
//    dtStartDate.Font.Color := clwhite;
    edtPeriod1.SetFocus;
  end
  else
  begin
    LoadPeriods;
    edtNoPeriodsExit(Sender);
    edtNoPeriods.SetFocus;
  end;
  dmDatabase.tblTransaction.Close;


   Caption := GetTextLang(576) ; // Reporting Dates
   OkCancel(BtnOk,BtnCancel);
   Label1.Caption := GetTextLang(575) ;// Number
   Label2.Caption := GetTextLang(577) ; // Start date
   cboxLastYearPost.Caption := GetTextLang(578) ; // Post to last year?
   xLabel1.Caption := GetTextLang(579) ; // Ends on
   xLabel2.Caption :=  GetTextLang(579) ;
   xLabel3.Caption :=  GetTextLang(579) ;
   xLabel4.Caption := GetTextLang(579) ;
   xLabel5.Caption := GetTextLang(579) ;
   xLabel6.Caption := GetTextLang(579) ;
   xLabel7.Caption :=  GetTextLang(579) ;
   xLabel8.Caption := GetTextLang(579) ;
   xLabel9.Caption := GetTextLang(579) ;
   xLabel10.Caption := GetTextLang(579) ;
   xLabel11.Caption :=  GetTextLang(579) ;
   xLabel12.Caption := GetTextLang(579) ;
   xLabel13.Caption :=  GetTextLang(579) ;

   cbPost1.Caption :=  GetTextLang(580) ;  // Open for posting
   cbPost2.Caption := GetTextLang(580) ;  // Open for posting
   cbPost3.Caption :=GetTextLang(580) ;  // Open for posting
   cbPost4.Caption := GetTextLang(580) ;  // Open for posting
   cbPost5.Caption := GetTextLang(580) ;  // Open for posting
   cbPost6.Caption := GetTextLang(580) ;  // Open for posting
   cbPost7.Caption := GetTextLang(580) ;  // Open for posting
   cbPost8.Caption := GetTextLang(580) ;  // Open for posting
   cbPost9.Caption := GetTextLang(580) ;  // Open for posting
   cbPost10.Caption := GetTextLang(580) ;  // Open for posting
   cbPost11.Caption := GetTextLang(580) ;  // Open for posting
   cbPost12.Caption := GetTextLang(580) ;  // Open for posting
   cbPost13.Caption := GetTextLang(580) ;  // Open for posting


   cbPostl1.Caption :=  GetTextLang(580) ;  // Open for posting
   cbPostl2.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl3.Caption :=GetTextLang(580) ;  // Open for posting
   cbPostl4.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl5.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl6.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl7.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl8.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl9.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl10.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl11.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl12.Caption := GetTextLang(580) ;  // Open for posting
   cbPostl13.Caption := GetTextLang(580) ;  // Open for posting
   llastyear.Caption := GetTextLang(2348);
end;

procedure TfmPeriods.edtNoPeriodsExit(Sender: TObject);
{******
       This just makes the form taller or shorter to hide the
       extra period fields
******}
Const
  Len : Array [1..13] of Integer
       = (130,160,195,227,255,290,320,350,385,415,450,480,515);
  Len2 : Array [1..13] of Integer
       = (120,160,195,227,255,290,320,350,385,410,545,590,625);
Var
  i,j:Byte;
  bv:Boolean;
begin
  if (edtNoPeriods.Text = '0') or (edtNoPeriods.Text = '') or (StrToInt(edtNoPeriods.Text) > 13) then
  begin
    OSFMessageDlg(Gettextlang(1970), mterror, [mbok], 0);
    edtNoPeriods.SetFocus;
  end;
  {Enable Controls}
  {Changed by Sylvain Sept 2001}
  bv := True;
  for i:=1 to 13 do
  begin


    if i=(Str2Int(edtNoPeriods.Text) +1 ) then
    begin
      bv := False;
      Height := 100 + (i*32);
      //Height := Len[i];
      if Self.Canvas.TextHeight(caption) = 16 then
      Height := 120 + (i*40);
    end;
    with FindComponent('edtPeriod'+IntToStr(i)) as TEdit do
    begin
      Visible := bv;
      j:= top ;
    end;
    with FindComponent('dtPeriod'+IntToStr(i)) as TDateTimePicker do
      Visible := bv;
    with FindComponent('cbPost'+IntToStr(i)) as TCheckBox do
      Visible := bv;
    with FindComponent('cbPostl'+IntToStr(i)) as TCheckBox do
      Visible := bv;
    with FindComponent('xLabel'+IntToStr(i)) as TLabel do
      Visible := bv;


    with FindComponent('edtPeriod'+IntToStr(i)) as TEdit do
    begin
      Visible := bv;
      j:= top ;
    end;
  end;
end;

procedure TfmPeriods.btnOkClick(Sender: TObject);
begin
  if (edtPeriod1.Text='') or (edtNoPeriods.Text='') then exit;
  SavePeriods;
  ReadLedgerPeriodes(dmDatabase.SetOfBooksPropertys.LedgerPeriodes);
  Close;
end;

procedure TfmPeriods.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPeriods.dtStartDateExit(Sender: TObject);
begin
 if LastStartDate <> dtStartDate.Date then
   begin
    CalcPeriods(dtStartDate.Date);
    LastStartDate := dtStartDate.Date ;
   end;
end;

procedure TfmPeriods.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(gettextlang(1971), mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOKClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmPeriods.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edtNoPeriods.Enabled := True;
  edtNoPeriods.Color   := clWindow;
end;

procedure TfmPeriods.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(230);
             key := 0;

        end;
end;

end.
