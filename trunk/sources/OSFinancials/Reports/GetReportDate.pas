(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit GetReportDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfmGetDateValue = class(TForm)
    Label1: TLabel;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    dtpReportDate: TDateTimePicker;
    procedure dtpReportDateKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    MyResult:Boolean;
    Function GetReportDate(Var vDate:TDate):Boolean;
    { Public declarations }
  end;

var
  fmGetDateValue: TfmGetDateValue;

implementation

uses Database, Main, UDMTCCoreLink;

{$R *.DFM}

Function TfmGetDateValue.GetReportDate(Var vDate:TDate):Boolean;
begin
  with dmDatabase do begin
    tblPeriods.open;
    tblPeriods.First;
    dtpReportDate.MinDate:=tblPeriodsDStartDate.Value;
    tblPeriods.Last;
    dtpReportDate.MaxDate:=tblPeriodsDEndDate.Value;
    tblPeriods.Close;
  end;
  ShowModal;
  Result:=MyResult;
  vDate:=dtpReportDate.Date;
end;

procedure TfmGetDateValue.dtpReportDateKeyPress(Sender: TObject;
  var Key: Char);
begin
   Case Key of
   #13:Begin
         Key:=#0;
         SelectNext(ActiveControl,True,True);
       end;
   end;
end;

procedure TfmGetDateValue.BtnOkClick(Sender: TObject);
begin
  MyResult:=True;
  Close;
end;

procedure TfmGetDateValue.BtnCancelClick(Sender: TObject);
begin
  MyResult:=False;
  Close;
end;

procedure TfmGetDateValue.FormShow(Sender: TObject);
begin
  dtpReportDate.Date:= Date;
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
   
end;

end.
