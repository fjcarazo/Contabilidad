unit DataEntry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons;

type
  TfmDataEntry = class(TForm)
    ButtonPanel: TPanel;
    rgDrCrFormat: TRadioGroup;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    BGReportingDecimals: TGroupBox;
    LAmount: TLabel;
    LDocQty: TLabel;
    edtDecimal: TEdit;
    edQuantity: TEdit;
    RGDataStorage: TGroupBox;
    rbRealBtn: TRadioButton;
    RBFixDecimals: TRadioButton;
    edtNbrDec: TEdit;
    CBUseCurSign: TCheckBox;
    CDDutchStyleNumbersToText: TCheckBox;
    LCBUseCurSign: TLabel;
    LCDDutchStyleNumbersToText: TLabel;
    RGSpeed: TGroupBox;
    CBNoCalcBatch: TCheckBox;
    RGSpecialSettings: TGroupBox;
    LCBViewAllBankStatements: TLabel;
    CBViewAllBankStatements: TCheckBox;
    CBShoCalendar: TCheckBox;
    LShowCalander: TLabel;
    CBNOWarningUnposted: TCheckBox;
    LCBNOUnpostedMessage: TLabel;
    LCBNoCalcBatch: TLabel;
    EDocRowDecimals: TEdit;
    LDocRow: TLabel;
    LcbContraISRef: TLabel;
    cbContraISRef: TCheckBox;
    LcbStrictTaxRef: TLabel;
    cbStrictTaxRef: TCheckBox;
    LProjects: TLabel;
    cbProjects: TCheckBox;
    LLogLevel: TLabel;
    cbLogLevel: TComboBox;
    LEDocRowDecimalsShow: TLabel;
    EDocRowDecimalsShow: TEdit;
    eDivsLedger: TEdit;
    BBSales: TBitBtn;
    Ldivsleder: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure rgDrCrFormatClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbRealBtnClick(Sender: TObject);
    procedure BBSalesClick(Sender: TObject);
  private
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDataEntry: TfmDataEntry;

implementation

uses Database, Main, HtmlHelpAPI,GlobalFunctions,XRoutines,databaseaccess,
  UDMTCCoreLink,variants, OSFGeneralRoutines, TcVariables;

{$R *.DFM}

procedure TfmDataEntry.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmDataEntry.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  LoadReoprtOp;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  if ((dmDatabase.tblReportingOptions.FieldByName('WDataEntryDrCrFormat').AsInteger >= 0) and
      (dmDatabase.tblReportingOptions.FieldByName('WDataEntryDrCrFormat').AsInteger <= 2)) then
   rgDrCrFormat.ItemIndex := dmDatabase.tblReportingOptions.FieldByName('WDataEntryDrCrFormat').AsInteger else
   rgDrCrFormat.ItemIndex := -1;
  if Str2Int(dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString)<0 then
    edtDecimal.Text:='2'
  else
    edtDecimal.text:=dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString;


  Application.Processmessages;

  CDDutchStyleNumbersToText.Checked := ReadReportOp('NumToTextDutchWay',false).AsBoolean ;


  lCDDutchStyleNumbersToText.Caption := gettextlang(2193);
  lCBUseCurSign.Caption := gettextlang(2194);
 { Label4.Caption := gettextlang(2195);
  Label1.Caption := gettextlang(2196);
  Caption := StringReplace(gettextlang(848),'&','',[rfReplaceAll]);}
  lCBViewAllBankStatements.Caption := gettextlang(2205);

  LcbStrictTaxRef.Caption := gettextlang(3169 );
  LProjects.Caption := gettextlang(3099 );

  LLogLevel.Caption := gettextlang(3335 );
  cbLogLevel.Items[0] :=  gettextlang(3257);

  rgDrCrFormat.Caption := gettextlang(2904 ); //Report ammounts with
  RGDataStorage.Caption := gettextlang(2905); // Data storage
  RGSpeed.Caption := gettextlang(2906 ); //Speed
  RGSpecialSettings.Caption := gettextlang(2907); //Special settings
  BGReportingDecimals.Caption := gettextlang(2908); //Reporting decimals

  Ldivsleder.Caption := gettextlang(3453);

  BtnOk.Caption := gettextlang(167);
  BtnCancel.Caption := gettextlang(168);

  rbRealBtn.Caption := gettextlang(2911); // Realnumbers
  RBFixDecimals.Caption  := gettextlang(2912); // Fixed Decimals
  rgDrCrFormat.Items[0]  := gettextlang(2913); // <>  for Credit
  rgDrCrFormat.Items[1]  := gettextlang(2914); // +/-  for Debit/Credit
  rgDrCrFormat.Items[2]  := gettextlang(2915 ); // D/C for Debit Credit
  LShowCalander.Caption := gettextlang(2916 ); // Show calander
  LCBNOUnpostedMessage.Caption := gettextlang(2917); //  No warning unposted

  LCBNoCalcBatch.Caption := gettextlang(2925);{Do not calc batch}
  LDocQty.Caption := gettextlang(2926);{Document Quantity}
  LAmount.Caption := gettextlang(1976);{Amount}
  LcbContraISRef.Caption := gettextlang(3041);{Contra ref as account Ref}
  LDocRow.Caption := gettextlang(3048);{Document row}

end;

procedure TfmDataEntry.btnOkClick(Sender: TObject);
begin
  SaveReoprtOp;
  dmDatabase.tblReportingOptions.Edit;
  if (Str2Int(edtDecimal.text)>=0) AND (Str2Int(edtDecimal.text)<=5) Then
    dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString:=edtDecimal.text
  else
    dmDatabase.tblReportingOptions.FieldByName('WDecimal').AsString:='2';
  dmDatabase.tblReportingOptions.Post;
  dmDatabase.tblReportingOptions.Close;
  WriteReportOp('NumToTextDutchWay',BoolToStr(CDDutchStyleNumbersToText.Checked,True));

  Close;
end;

procedure TfmDataEntry.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Close;
  Close;
end;

procedure TfmDataEntry.rgDrCrFormatClick(Sender: TObject);
begin
 dmDatabase.tblReportingOptions.FieldByName('WDataEntryDrCrFormat').AsInteger := rgDrCrFormat.ItemIndex;
end;

procedure TfmDataEntry.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then begin
  HtmlShowTopic(217);
  key := 0;
 end;
end;

Procedure TfmDataEntry.SaveReoprtOp;
begin

   DMTCCoreLink.WriteSysParam('SYSDIVLEDGER',IntToStr(eDivsLedger.Tag),0,0);
  DMTCCoreLink.ExtraOptions.Values['SYSDIVLEDGER'] := VarToStr(DMTCCoreLink.ReadSysParam('SYSDIVLEDGER',0,0,0)) ;


  DMTCCoreLink.WriteNwReportOp('WDataEntryDecQty', edQuantity.Text );
  DMTCCoreLink.WriteNwReportOp('WDataEntryNbrQty', edtNbrDec.Text );
  DMTCCoreLink.WriteNwReportOp('BDataEntryReal', Bool2Str(rbRealBtn.Checked));
//  DMTCCoreLink.WriteNwReportOp('SEdtDigSymb', EdtDigSymb.Text );
  DMTCCoreLink.WriteNwReportOp('BUseCurSign', Bool2Str(CBUseCurSign.Checked));
  DMTCCoreLink.WriteNwReportOp('WDocRowDecimals', IntToStr(StrToIntDef( EDocRowDecimals.Text,2)) );
  DMTCCoreLink.WriteNwReportOp('WDocRowDecimalsShow', IntToStr(StrToIntDef( EDocRowDecimalsShow.Text,2)) );

  DMTCCoreLink.WriteNwReportOp('SedtDecSymb', DecimalSeparator );
  DMTCCoreLink.WriteNwReportOp('CBViewAllBankState', Bool2Str(CBViewAllBankStatements.Checked));
  DMTCCoreLink.WriteNwReportOp('CBNoCalcBatch', Bool2Str(CBNoCalcBatch.Checked));
  DMTCCoreLink.WriteNwReportOp('CBShowCalendar', Bool2Str(CBShoCalendar.Checked));
  DMTCCoreLink.WriteNwReportOp('CBNOWarningUnposted', Bool2Str(CBNOWarningUnposted.Checked));
  DMTCCoreLink.WriteNwReportOp('cbContraISRef', Bool2Str(cbContraISRef.Checked));
  DMTCCoreLink.WriteNwReportOp('cbProjects', Bool2Str(cbProjects.Checked));
  DMTCCoreLink.WriteNwReportOp('cbLogLevel', IntToStr(cbLogLevel.ItemIndex));
  DMTCCoreLink.WriteNwReportOp('cbStrictTaxRef', Bool2Str(cbStrictTaxRef.Checked));
end;

Procedure TfmDataEntry.LoadReoprtOp;
begin
   eDivsLedger.Tag := DMTCCoreLink.ReadSysParam('SYSDIVLEDGER',0,0,0);
   eDivsLedger.Text := TDataBaseRoutines.GetAccountFullDescription( eDivsLedger.Tag);



  edQuantity.Text :=  DMTCCoreLink.ReadNwReportOp('WDataEntryDecQty','2');
  edtNbrDec.Text :=  DMTCCoreLink.ReadNwReportOp('WDataEntryNbrQty','2');
  EDocRowDecimals.Text := DMTCCoreLink.ReadNwReportOp('WDocRowDecimals','8');
  EDocRowDecimalsShow.Text := DMTCCoreLink.ReadNwReportOp('WDocRowDecimalsShow','2');



  rbRealBtn.Checked := DMTCCoreLink.ReadNwReportOp('BDataEntryReal',false);
//  EdtDigSymb.Text :=  DMTCCoreLink.ReadNwReportOp('SEdtDigSymb',ThousandSeparator);
//  edtDecSymb.Text :=  DMTCCoreLink.ReadNwReportOp('SedtDecSymb',DecimalSeparator);
  CBUseCurSign.Checked :=  DMTCCoreLink.ReadNwReportOp('BUseCurSign',false);
  CBViewAllBankStatements.Checked :=  DMTCCoreLink.ReadNwReportOp('CBViewAllBankState',false);
  CBNoCalcBatch.Checked :=  DMTCCoreLink.ReadNwReportOp('CBNoCalcBatch',false);
  CBShoCalendar.Checked :=  DMTCCoreLink.ReadNwReportOp('CBShowCalendar',false);
  CBNOWarningUnposted.Checked :=  DMTCCoreLink.ReadNwReportOp('CBNOWarningUnposted',false);
  cbContraISRef.Checked :=  DMTCCoreLink.ReadNwReportOp('cbContraISRef',false);
  cbProjects.Checked :=  DMTCCoreLink.ReadNwReportOp('cbProjects',false);

  cbLogLevel.ItemIndex := DMTCCoreLink.ReadNwReportOp('cbLogLevel',0);

  cbStrictTaxRef.Checked :=  DMTCCoreLink.ReadNwReportOp('cbStrictTaxRef',false);
end;

procedure TfmDataEntry.rbRealBtnClick(Sender: TObject);
begin
  edtNbrDec.Enabled := Not rbRealBtn.Checked;
end;

procedure TfmDataEntry.BBSalesClick(Sender: TObject);
var
  IncExp,
  HasSub : Boolean;
  OldText : String ;
begin


  ClearLookupModalType ;

 // if PnlAdjust.Visible then exit;
  eDivsLedger.Color := clHighlight;
  IncExp := False;
  HasSub := True;

  while  (HasSub)  do
  begin
     CallLookup(eDivsLedger.Text, 2,eDivsLedger.Tag);
    If ReturnLookup = 'ESC' then
     begin
     eDivsLedger.Color := clWindow;

     exit ;
     end;
    eDivsLedger.Tag := ReturnID ;
    eDivsLedger.Text := TDataBaseRoutines.GetAccountFullDescription( eDivsLedger.Tag);

    HasSub :=  TDataBaseRoutines.IsSubAccount(ReturnID) ;
    // done : Pieter this closes the lookup for accounts
    // dmDatabase.tblAccount.Close;
    begin
      if HasSub then OSFMessageDlg(GetTextLang(493), mterror, [mbok], 0);
    end ;
  end;
  eDivsLedger.Color := clWindow;

end;

end.
