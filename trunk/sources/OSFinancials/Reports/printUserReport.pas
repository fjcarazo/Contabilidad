(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit printUserReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, StdCtrls, Buttons, ExtCtrls, wwdbdatetimepicker;

type
  TfmprintUserReport = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    StatusBar1: TStatusBar;
    lvReportWriter: TListView;
    ImageList1: TImageList;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    BitBtn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    Label12: TLabel;
    DReportDate: TwwDBDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    { Public declarations }
  end;

var
  fmprintUserReport: TfmprintUserReport;

implementation

uses Database, Main, LanguageChoice, GlobalFunctions,
  GetReportDate, UserReportReport, DatabaseAccess, UDMTCCoreLink;

{$R *.DFM}

procedure TfmprintUserReport.FormShow(Sender: TObject);
Var
  ListItem:TListItem;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  //DReportDate.Date:=Date;
  LoadReoprtOp;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  With DmDatabase do
  begin
    tblRepHead.Active:=True;
    tblRepHead.First;
    While not tblRepHead.Eof do
    begin
      if tblRepHeadWReportID.Value<>0 then
      With lvReportWriter do
      begin
        ListItem:=Items.Add;
        ListItem.ImageIndex:=0;
        ListItem.Caption:=tblRepHead.FieldByName('SReportName').AsString;
        ListItem.subitems.add(tblRepHead.FieldByName('STitle1').AsString);
      end;
      tblRepHead.Next;
    end;
  end;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmprintUserReport.BtnCancelClick(Sender: TObject);
begin
  CLose;
end;

procedure TfmprintUserReport.BtnOkClick(Sender: TObject);
Var
  vReportName:string;
  OK:Boolean;
begin
  SaveReoprtOp;
  if  lvReportWriter.ItemFocused=Nil then
  begin
     OSFMessageDlg(GetTextLang(804){'No Set of Books selected'}, mtinformation, [mbOk], 0);
     exit
  end;
  vReportName:=lvReportWriter.ItemFocused.Caption;

  With dmDatabase do begin
    tblRepHead.Locate('SreportName',vReportName,[]);
    tblRepLine.Open;
    tblRepCols.Open;
    tblAccount.Open;
    tblRepLine.Open;
    tblSysVars.Open;
    tblTotals.Open;
    tblReportingOptions.Open;
    tblAccount.Filter:='';
    tblRepLine.Filtered:=False;
    tblRepLine.Filter:='WreportID='+tblRepHeadWReportID.AsString;
    tblRepLine.Filtered:=True;
//    fmqrReportWriter.qrReportWriter.Preview;

   Ok:=True;

   qrUserReport := TqrUserReport.Create(self);
   qrUserReport.vDate:=Date;
   qrUserReport.vDate:=DReportDate.Date;
//     qrUserReport.ColNbr:=dmDatabase.tblRepHeadWNoOfColumns.Value;
   if Ok then
    PrintReportProcess(cbDestination.ItemIndex,qrUserReport ,edtCount.Text);
   qrUserReport.Free;


   (*
   fmqrReportWriter.vDate:='';
   if UpperCase(Trim(dmDatabase.tblRepHeadSTitle2.Value))='#E' then begin
     fmGetDateValue := TfmGetDateValue.Create(self);
     SetUpForm(fmGetDateValue);
     Ok:=fmGetDateValue.GetReportDate(vDate);
     fmqrReportWriter.vDate:=DateToStr(vDate);
     fmGetDateValue.Free;
   end;
   *)


    tblRepLine.Close;
    tblRepCols.Close;
    tblAccount.Close;
    tblRepLine.Close;
    tblSysVars.Close;
    tblRepHead.Close;
    tblReportingOptions.Close;    
    tblrepline.EnableControls;
    tblTotals.Close;
    tblTotals.Filtered:=False;
    tblTotals.Filter:='';
    tblTotals.EnableControls;
  end;
  Close;
end;

procedure TfmprintUserReport.cbDestinationChange(Sender: TObject);
begin
  if  cbDestination.ItemIndex=1 then
  begin
    lblCopies.Enabled:=True;
    EdtCount.Enabled:=True;
    UpDown1.Enabled:=True;
  end
  else
  begin
    lblCopies.Enabled:=False;
    EdtCount.Enabled:=False;
    UpDown1.Enabled:=False;
  end;
end;

procedure TfmprintUserReport.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmprintUserReport.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmprintUserReport.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmprintUserReport.BitBtn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmprintUserReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             HtmlShowTopic(211);
             key := 0;

        end;
end;

Procedure TfmprintUserReport.SaveReoprtOp;
begin
  WriteReportOp('DUserRepDate', DateToStr(DReportDate.Date) );
end;

Procedure TfmprintUserReport.LoadReoprtOp;
begin
  DReportDate.DAte :=  ReadReportOp('DUserRepDate',Date).AsDateTime;
end;


end.
