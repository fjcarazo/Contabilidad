(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit UnReconcileOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TfmUnReconcileOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    GroupBox2: TGroupBox;
    cboxUsePeriods: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    dtpFromDate: TDateTimePicker;
    dtpToDate: TDateTimePicker;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    cbUseNbr: TCheckBox;
    Label4: TLabel;
    edtReference: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dtpFromDateEnter(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboxUsePeriodsClick(Sender: TObject);
    procedure cbUseNbrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure SetVisib;
  public
    Reconcile:Boolean;
    { Public declarations }
  end;

var
  fmUnReconcileOptions: TfmUnReconcileOptions;

implementation

uses Main, Database, ReconcileBank, ReconOptions, GlobalFunctions,
  TcVariables, DatabaseAccess, OSFGeneralRoutines, UDMTCCoreLink;

{$R *.DFM}

procedure TfmUnReconcileOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  dtpFromDate.Date:=Date;
  dtpToDate.date:=date;
  //From
  Label2.Caption := GetTextLang(282);
  //To
  Label3.Caption := GetTextLang(208);
  // Cancel
  BtnCancel.Caption := GetTextLang(168);
  // Ok
  BtnOk.Caption :=  GetTextLang(167);
  if Reconcile then begin
    Caption:=GetTextLang(1104){'Reconcile Options'};
    Label1.Caption:=GetTextLang(1105){'Reconcile by date'};
    Label4.Caption:=GetTextLang(1106){'Reconcile by reference'};
  end
  else
  begin
    Caption := GetTextLang(1101);{'UnReconcile Options';}
    Label1.Caption:=GetTextLang(1102){'UnReconcile by date'};
    Label4.Caption:=GetTextLang(1103){'UnReconcile by reference'};
  end;

  SetVisib;  
end;

procedure TfmUnReconcileOptions.btnOkClick(Sender: TObject);
var
  OldFilter : String;
  Ok : Boolean;
begin
   // Todo : SQLOPTIMIZE
   if edtReference.Text = '' then
   begin
   dmDatabase.ZQTransAction.SQL.text := 'update transact set BReconciled = ' + IntToStr(ord(Reconcile)) +' where CAST(DDate AS DATE) >= :FromDate and CAST(DDate AS DATE) <= :Todate ' ;
   dmDatabase.ZQTransAction.Params[0].AsDate := dtpFromDate.Date ;
   dmDatabase.ZQTransAction.Params[1].AsDate := dtpToDate.Date ;
   dmDatabase.ZQTransAction.ExecSQL ;
   end  else
   begin
   dmDatabase.ZQTransAction.SQL.text := 'update transact set BReconciled = ' + IntToStr(ord(Reconcile)) +' where SReference = :SReference ';
   dmDatabase.ZQTransAction.Params[0].AsString := edtReference.Text ;
   dmDatabase.ZQTransAction.ExecSQL ;
   end;
    fmReconcileBank.dtpDate.Date := dtpToDate.Date;
    // Added by sylvain
    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(PymtID),OK,False);
    if not Ok then
    begin
      dmDatabase.tblBatch.close;
      dmDatabase.tblBatch.TableName := tmpstrs1;
    With DmDatabase do
    begin

       dmDatabase.tblBatch.Open;
       dmDatabase.tblBatch.Filtered:=False;
       if edtReference.Text = '' then
         dmDatabase.tblBatch.Filter:='(DDate >= ''' + FormatDateTime('yyyy/mm/dd',dtpFromDate.Date) + ''' AND DDate <= ''' + FormatDateTime('yyyy/mm/dd',dtpToDate.Date) + ''')'
       else
         dmDatabase.tblBatch.Filter:='SReference = ''' + edtReference.Text + '''';
       dmDatabase.tblBatch.Filtered:=True;
       While not dmDatabase.tblBatch.Eof do begin
         dmDatabase.tblBatch.Edit;
         dmDatabase.tblBatchBReconciled.Value:=ord(Reconcile);
         dmDatabase.tblBatch.Post;
         dmDatabase.tblBatch.Next;
       end;
    end;
    end;
/// done : Pieter I gess this must me the reciept id.

    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(RcptID),OK,False);
    if not Ok then
    begin
      dmDatabase.tblBatch.close;
      dmDatabase.tblBatch.TableName := tmpstrs1;
    With DmDatabase do
    begin
       dmDatabase.tblBatch.Open;
       dmDatabase.tblBatch.Filtered:=False;
       if edtReference.Text = '' then
         dmDatabase.tblBatch.Filter:='(DDate >= ''' + FormatDateTime('yyyy/mm/dd',dtpFromDate.Date) + ''' AND DDate <= ''' + FormatDateTime('yyyy/mm/dd',dtpToDate.Date) + ''')'
       else
         dmDatabase.tblBatch.Filter:='SReference = ''' + edtReference.Text + '''';
       dmDatabase.tblBatch.Filtered:=True;
       While not dmDatabase.tblBatch.Eof do begin
         dmDatabase.tblBatch.Edit;
         dmDatabase.tblBatchBReconciled.Value:=ord(Reconcile);
         dmDatabase.tblBatch.Post;
         dmDatabase.tblBatch.Next;
       end;
    end;
    end;
////
  dmDatabase.tblBatch.Filtered:=False;
  dmDatabase.tblBatch.Filter:='';
  Close;
end;

procedure TfmUnReconcileOptions.dtpFromDateEnter(Sender: TObject);
begin
  edtReference.Text := '';
end;

procedure TfmUnReconcileOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUnReconcileOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblTransaction.Close;
end;

procedure TfmUnReconcileOptions.cboxUsePeriodsClick(Sender: TObject);
begin
  if cboxUsePeriods.Checked=cbUseNbr.Checked then
  cbUseNbr.Checked:=Not cboxUsePeriods.Checked;
  SetVisib;
end;

procedure TfmUnReconcileOptions.cbUseNbrClick(Sender: TObject);
begin
  if cbUseNbr.Checked=cboxUsePeriods.Checked then
  cboxUsePeriods.Checked:=Not cbUseNbr.Checked;
  SetVisib;
end;

Procedure TfmUnReconcileOptions.SetVisib;
begin
  EdtReference.Enabled := cbUseNbr.Checked;
  dtpFromDate.Enabled := cboxUsePeriods.Checked;
  dtpToDate.Enabled := cboxUsePeriods.Checked;
  Label2.Enabled := cboxUsePeriods.Checked;
  Label3.Enabled := cboxUsePeriods.Checked;
  if cboxUsePeriods.Checked then
    dtpFromDate.SetFOcus
  else
    EdtReference.SetFocus;
end;

procedure TfmUnReconcileOptions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
  begin
    if Key=32 then
    begin
      Key:=0;
      cboxUsePeriods.Checked :=  Not cboxUsePeriods.Checked;
    end;
  end
  else If Key=13 then
  begin
    Key:=0;
    SelectNext(ActiveControl,True,True);
  end;
end;

end.
