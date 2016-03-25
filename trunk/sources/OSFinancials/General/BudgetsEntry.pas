(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BudgetsEntry;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfmBudgetsEntry = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    BtnRestore: TBitBtn;
    LeftPanel: TPanel;
    Label1: TLabel;
    edtAccount: TEdit;
    Label2: TLabel;
    edtAnnual: TEdit;
    Label5: TLabel;
    Edit27: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Period1: TLabel;
    Period2: TLabel;
    Period3: TLabel;
    Period4: TLabel;
    Period5: TLabel;
    Period6: TLabel;
    Period7: TLabel;
    Period8: TLabel;
    Period9: TLabel;
    Period10: TLabel;
    Period11: TLabel;
    Period12: TLabel;
    Period13: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    BntPreview: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtAccountEnter(Sender: TObject);
    procedure edtAnnualKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure Edit16Exit(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure Edit19Exit(Sender: TObject);
    procedure Edit20Exit(Sender: TObject);
    procedure Edit21Exit(Sender: TObject);
    procedure Edit22Exit(Sender: TObject);
    procedure Edit23Exit(Sender: TObject);
    procedure Edit24Exit(Sender: TObject);
    procedure Edit25Exit(Sender: TObject);
    procedure Edit26Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnRestoreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BntPreviewClick(Sender: TObject);
    procedure edtAccountExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CalcBudget(Amount : Real; NoOfPeriods : Integer);
    procedure CalcTotal;
    Procedure ClearEdts;
    Procedure LoadBudget;

  end;

var
  fmBudgetsEntry: TfmBudgetsEntry;

implementation

uses Main, Database, Lookup, HtmlHelpAPI, LanguageChoice, GlobalFunctions,
  AccMovementReport, TcVariables, DatabaseAccess,LedgerRoutines,XRoutines,
  DB;

{$R *.DFM}

Procedure TfmBudgetsEntry.LoadBudget;
// Added By Sylvain

Var
  Total:real;
  I:Integer;
begin
  total:=0;
  ClearEdts;
  with dmDatabase do
  begin
    tblAccount.Open;

    tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(edtAccount.Text)+ GetSubAccountCode(edtAccount.Text)]), []);
    tblTotals.Open;
    tblTotals.Filtered:=false;
    tblTotals.Filter := 'WAccountID = ''' + tblAccountWAccountID.AsString + ''' and BActual <> 1 ';
    tblTotals.Filtered:=true;
    if tblTotals.RecordCount <> 0 then
    begin
    // Get Opening Balance(Badget)
      tblTotals.Locate('WPeriodID',0,[]);
      Edit27.Text:=FloatToStrF(tblTotalsFAmount.Value,ffFixed,18,2);
    //Period i
    for i:=1 to 13 do begin
      tblTotals.Locate('WPeriodID',13+i,[]);
      if  tblTotalsFAmount.Value>=0 then
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2-1)) as TEdit do
          text:=FloatToStrF(tblTotalsFAmount.Value,ffFixed,18,2)
      else
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2)) as TEdit do
          text:=FloatToStrF(-tblTotalsFAmount.Value,ffFixed,18,2);
      Total:=Total+tblTotalsFAmount.Value;
    end;
    end;
  end;
  edtAnnual.Text:=FloatToStr(Total);
end;

Procedure TfmBudgetsEntry.ClearEdts;
Var
  i:Byte;
begin
  // By Sylvain
   edtAnnual.text:='';
    for i:=1 to 27 do
     with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i)) as TEdit do
        text:=''
end;

procedure TfmBudgetsEntry.CalcBudget(Amount : Real; NoOfPeriods : Integer);
var
  Temp : Real;
  i:Integer;
begin
  // Changed by Sylvain
  //10-4-2000
  Temp := Amount / NoOfPeriods;
  with dmDatabase do
  if Temp > 0 then
  begin
    for i:=1 to 13 do Begin
      tblTotals.Locate('WPeriodID',13+i,[]);
      if  i<=NoOfPeriods then Begin
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2-1)) as TEdit do
          text:=FloatToStrF(Temp, ffFixed, 18, 2);
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2)) as TEdit do
          text:='';
      end
      else begin
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2-1)) as TEdit do
          text:='';
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2)) as TEdit do
          text:='';
      end;
    end;
  end
  else
  begin
    for i:=1 to 13 do Begin
      tblTotals.Locate('WPeriodID',13+i,[]);
      if  i<=NoOfPeriods then Begin
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2-1)) as TEdit do
          text:='';
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2)) as TEdit do
          text:=FloatToStrF(Temp * -1, ffFixed, 18, 2);
      end
      else begin
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2-1)) as TEdit do
          text:='';
        with fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2)) as TEdit do
          text:='';
      end;
    end;

  end;
end;

procedure TfmBudgetsEntry.CalcTotal;
var
  NewTotal : Real;
begin
  NewTotal := 0;
  if Edit1.Text <> '' then NewTotal := NewTotal + Str2Float(Edit1.Text);
  if Edit3.Text <> '' then NewTotal := NewTotal + Str2Float(Edit3.Text);
  if Edit5.Text <> '' then NewTotal := NewTotal + Str2Float(Edit5.Text);
  if Edit7.Text <> '' then NewTotal := NewTotal + Str2Float(Edit7.Text);
  if Edit9.Text <> '' then NewTotal := NewTotal + Str2Float(Edit9.Text);
  if Edit11.Text <> '' then NewTotal := NewTotal + Str2Float(Edit11.Text);
  if Edit13.Text <> '' then NewTotal := NewTotal + Str2Float(Edit13.Text);
  if Edit15.Text <> '' then NewTotal := NewTotal + Str2Float(Edit15.Text);
  if Edit17.Text <> '' then NewTotal := NewTotal + Str2Float(Edit17.Text);
  if Edit19.Text <> '' then NewTotal := NewTotal + Str2Float(Edit19.Text);
  if Edit21.Text <> '' then NewTotal := NewTotal + Str2Float(Edit21.Text);
  if Edit23.Text <> '' then NewTotal := NewTotal + Str2Float(Edit23.Text);
  if Edit25.Text <> '' then NewTotal := NewTotal + Str2Float(Edit25.Text);
  if Edit2.Text <> '' then NewTotal := NewTotal - Str2Float(Edit2.Text);
  if Edit4.Text <> '' then NewTotal := NewTotal - Str2Float(Edit4.Text);
  if Edit6.Text <> '' then NewTotal := NewTotal - Str2Float(Edit6.Text);
  if Edit8.Text <> '' then NewTotal := NewTotal - Str2Float(Edit8.Text);
  if Edit10.Text <> '' then NewTotal := NewTotal - Str2Float(Edit10.Text);
  if Edit12.Text <> '' then NewTotal := NewTotal - Str2Float(Edit12.Text);
  if Edit14.Text <> '' then NewTotal := NewTotal - Str2Float(Edit14.Text);
  if Edit16.Text <> '' then NewTotal := NewTotal - Str2Float(Edit16.Text);
  if Edit18.Text <> '' then NewTotal := NewTotal - Str2Float(Edit18.Text);
  if Edit20.Text <> '' then NewTotal := NewTotal - Str2Float(Edit20.Text);
  if Edit22.Text <> '' then NewTotal := NewTotal - Str2Float(Edit22.Text);
  if Edit24.Text <> '' then NewTotal := NewTotal - Str2Float(Edit24.Text);
  if Edit26.Text <> '' then NewTotal := NewTotal - Str2Float(Edit26.Text);
  edtAnnual.Text := FloatToStrF(NewTotal, ffFixed, 18, 2);
end;

procedure TfmBudgetsEntry.FormShow(Sender: TObject);
Var
  i,aHeight:integer;
begin
  ClearEdts;
  dmDatabase.tblSysVars.Open;
  // Changed by Sylvain
  aHeight := Self.Canvas.TextHeight(Caption);
  aHeight := aHeight * 2 ;
  if dmDatabase.tblSysVarsWNoOfPeriods.Value>7 then begin
    ClientHeight:=234+aHeight*(dmDatabase.tblSysVarsWNoOfPeriods.Value-7);
  end;
  For i:=1 to 26 do
    if i<=2*dmDatabase.tblSysVarsWNoOfPeriods.Value then
     (FindComponent('Edit'+IntToStr(i)) as TEdit).visible:=True
    else
      (FindComponent('Edit'+IntToStr(i)) as TEdit).visible :=False;

  // Changed by Sylvain
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblPeriods.IndexFieldNames := dmDatabase.tblPeriodsWPERIODID.FieldName ;
  dmDatabase.tblPeriods.Locate('WPERIODID' ,14,[]);
 // dmDatabase.tblPeriods.First;
  for i:=1 to 13 do begin
    if dmDatabase.tblPeriods.Locate('WPERIODID' ,i+13,[]) then
     begin
    (FindComponent('Period'+IntToStr(i)) as TLabel).Caption:=dmDatabase.tblPeriodsSDescription.Value;
     end else
     begin
       (FindComponent('Period'+IntToStr(i)) as TLabel).Visible := false ;
 
     end;
   // dmDatabase.tblPeriods.Next;
  end;
  dmDatabase.tblPeriods.Close;
   BtnCancel.Caption := GetTextLang(169) ;
end;

procedure TfmBudgetsEntry.btnOkClick(Sender: TObject);
Var
  i:Integer;
begin
  if edtAccount.Text='' then
  begin
   OSFMessageDlg(GetTextLang(452){Account cannot be blank}, mtError, [mbOk], 0);
   edtAccount.SetFocus;
   exit;
  end;
  with dmDatabase do
  begin
    tblAccount.Open;
    tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(edtAccount.Text) + GetSubAccountCode(edtAccount.Text)]), []);
    tblTotals.Filtered:=false;
    tblTotals.Filter := 'WAccountID = ''' + tblAccountWAccountID.AsString + ''' and BActual <> 1';
    tblTotals.Filtered:=true;
    tblTotals.Open;
    if tblTotals.RecordCount <> 0 then
    // Begin
// Modify By Sylvain 4-4-2000
      // Save Opening Bal
      tblTotals.Locate('WPeriodID',0,[]);
      tblTotals.Edit;
      tblTotalsFAmount.Value :=Str2Float(Edit27.Text);
      tblTotals.Post;
      For i:=1 to 13 do
      Begin
      //Period i
      tblTotals.Locate('WPeriodID',13+i,[]);
      tblTotals.Edit;
      tblTotalsFAmount.Value := 0;
      with (fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2-1)) as TEdit) do
        if Text <> '' then
          tblTotalsFAmount.Value := Str2Float(Text);
      With (fmBudgetsEntry.FindComponent('Edit'+IntToStr(i*2)) as TEdit) do
        if Text <> '' then
          tblTotalsFAmount.Value := -Str2Float(Text) ;
      tblTotals.Post;
    end;
  tblTotals.close ;
      // if its a sub accout recal the toals.
      if edtAccount.Text <> '000'then
        begin
                tblAccount.Open;
                if tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(edtAccount.Text)+ '000']), []) then
                 begin
                  tblTotals.Filtered:=false;
                  tblTotals.Filter := 'WAccountID = ''' + tblAccountWAccountID.AsString + ''' and BActual <> 1';
                  tblTotals.Filtered:=true;
                  tblTotals.Open;
                  if tblTotals.RecordCount <> 0 then
                  // Begin
              // Modify By Sylvain 4-4-2000
                    // Save Opening Bal
                    tblTotals.Locate('WPeriodID',0,[]);
                    tblTotals.Edit;
                    qGen.SQL.Text := 'Select Sum(FAmount) from totals,Account where Account.WAccountid = Totals.Waccountid and SMAINACCOUNTCODE = '+ QuotedStr(GetMainAccountCode(edtAccount.Text)) +' and (WAccounttypeId not in (1,2))and BActual <> 1 and SMAINACCOUNTCODE <> ' + QuotedStr('000') +' and WPeriodId = 0 ';
                    qGen.open ;
                    tblTotalsFAmount.Value :=qGen.Fields[0].AsFloat ;
                    qGen.close ;
                    tblTotals.Post;

                    For i:=1 to 13 do
                    Begin
                    //Period i

                    tblTotals.Locate('WPeriodID',13+i,[]);
                    tblTotals.Edit;
                    qGen.SQL.Text := 'Select Sum(FAmount) from totals,Account where Account.WAccountid = Totals.Waccountid and SMAINACCOUNTCODE = '+ QuotedStr(GetMainAccountCode(edtAccount.Text)) +' and (WAccounttypeId not in (1,2))and BActual <> 1 and SMAINACCOUNTCODE <> ' + QuotedStr('000') + ' and WPeriodId = ' + IntToStr(13+i);
                    qGen.open ;
                    tblTotalsFAmount.Value :=qGen.Fields[0].AsFloat ;
                    qGen.close ;
                    tblTotals.Post;
                    end;
                 end;
           tblTotals.close ;
      end;
  end; // With database
  if sender <> nil then
  begin
  FormShow(Sender);
  edtAccount.SetFocus;
  end;
end;

procedure TfmBudgetsEntry.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmBudgetsEntry.edtAccountEnter(Sender: TObject);
Var
  BIncExp:Boolean;
begin
  //make the box a nice colour
//  edtAccount.Color := clHighlight;
   Highlight(edtAccount);
  ReturnLookup:=CallLookup(edtAccount.Text, 1);
  if (ReturnLookup <> 'ESC') and (ReturnLookup <> '-') then
  Begin
     edtAccount.Text := ReturnLookup;
//  if (edtAccount.Text<>'') Then
//  begin
    if IsMainAccountWithSub(edtAccount.Text,BIncExp) then
    begin
      OSFMessageDlg(GetTextLang(668){Cannot have budgets for an account which has sub-accounts}, mtconfirmation, [mbOk], 0);
      edtAccount.Text:='';
      edtAccountEnter(Sender);
    end;
  end;
  if BIncExp then
    edit27.Enabled:=False
  else
    edit27.Enabled:=True;
  LoadBudget;
//  edtAccount.Color := clWindow;
  BackNormal(edtAccount);
  edtAnnual.SetFocus;
end;

procedure TfmBudgetsEntry.edtAnnualKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    dmDatabase.tblSysVars.Open;
    CalcBudget(Str2Float(edtAnnual.Text), dmDatabase.tblSysVarsWNoOfPeriods.Value);
    dmDatabase.tblSysVars.Close;
//    Edit27.SetFocus;
    SelectNext(ActiveControl,true,true);
    Key := #0;
  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmBudgetsEntry.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(435){Do you want to save the changes ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmBudgetsEntry.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    Edit2.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text <> '' then
    Edit1.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit3Exit(Sender: TObject);
begin
  if Edit3.Text <> '' then
    Edit4.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit4Exit(Sender: TObject);
begin
  if Edit4.Text <> '' then
    Edit3.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit5Exit(Sender: TObject);
begin
  if Edit5.Text <> '' then
    Edit6.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit6Exit(Sender: TObject);
begin
  if Edit6.Text <> '' then
    Edit5.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit7Exit(Sender: TObject);
begin
  if Edit7.Text <> '' then
    Edit8.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit8Exit(Sender: TObject);
begin
  if Edit8.Text <> '' then
    Edit7.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit9Exit(Sender: TObject);
begin
  if Edit9.Text <> '' then
    Edit10.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit10Exit(Sender: TObject);
begin
  if Edit10.Text <> '' then
    Edit9.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit11Exit(Sender: TObject);
begin
  if Edit11.Text <> '' then
    Edit12.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit12Exit(Sender: TObject);
begin
  if Edit12.Text <> '' then
    Edit11.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit13Exit(Sender: TObject);
begin
  if Edit13.Text <> '' then
    Edit14.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit14Exit(Sender: TObject);
begin
  if Edit14.Text <> '' then
    Edit13.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit15Exit(Sender: TObject);
begin
  if Edit15.Text <> '' then
    Edit16.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit16Exit(Sender: TObject);
begin
  if Edit16.Text <> '' then
    Edit15.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit17Exit(Sender: TObject);
begin
  if Edit17.Text <> '' then
    Edit18.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit18Exit(Sender: TObject);
begin
  if Edit18.Text <> '' then
    Edit17.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit19Exit(Sender: TObject);
begin
  if Edit19.Text <> '' then
    Edit20.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit20Exit(Sender: TObject);
begin
  if Edit20.Text <> '' then
    Edit19.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit21Exit(Sender: TObject);
begin
  if Edit21.Text <> '' then
    Edit22.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit22Exit(Sender: TObject);
begin
  if Edit22.Text <> '' then
    Edit21.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit23Exit(Sender: TObject);
begin
  if Edit23.Text <> '' then
    Edit24.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit24Exit(Sender: TObject);
begin
  if Edit24.Text <> '' then
    Edit23.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit25Exit(Sender: TObject);
begin
  if Edit25.Text <> '' then
    Edit26.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.Edit26Exit(Sender: TObject);
begin
  if Edit26.Text <> '' then
    Edit25.Text := '';
  CalcTotal;
end;

procedure TfmBudgetsEntry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(117);
             key := 0;

        end;
end;

procedure TfmBudgetsEntry.BtnRestoreClick(Sender: TObject);
begin
  LoadBudget;
end;

procedure TfmBudgetsEntry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblTotals.Filtered:=false;
  dmDatabase.tblTotals.Filter:='';
end;

procedure TfmBudgetsEntry.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=80) and (ssCtrl in Shift) then begin
    BntPreviewClick(Sender);
    Key:=0;
  end;
end;

procedure TfmBudgetsEntry.BntPreviewClick(Sender: TObject);
begin
  btnOkClick(nil);
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Open;

  dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(edtAccount.Text) + GetSubAccountCode(edtAccount.Text)]), []);
  dmDatabase.tblAccount.Filter :='WAccountID='+  dmDatabase.tblAccountWAccountID.AsString;
  dmDatabase.tblAccount.Filtered := True;
  dmDatabase.tblSysVars.Open;
//  dmDatabase.tblTotals.Open;
  dmDatabase.tblPeriods.Open;
  idDocType:=255;
  qrAccountsMovements := TqrAccountsMovements.Create(Self);
  try
  PrintReportProcess(0,qrAccountsMovements,'1');
  finally
  FreeAndNil(qrAccountsMovements);
  end;
  dmDatabase.tblAccount.Filtered := False;
  dmDatabase.tblAccount.Filter := '';
  dmDatabase.tblAccount.Close;
  dmDatabase.tblSysVars.Close;
//  dmDatabase.tblTotals.Close;
  dmDatabase.tblPeriods.Close;
end;

procedure TfmBudgetsEntry.edtAccountExit(Sender: TObject);
begin
  if BtnCancel.Focused then exit;
  if edtAccount.Text = '' then begin
    OSFMessageDlg(GetTextLang(748){Illegal account Number?}, mterror, [mbOk], 0);
    edtAccount.Setfocus;
     exit ;
  end;
end;



end.
