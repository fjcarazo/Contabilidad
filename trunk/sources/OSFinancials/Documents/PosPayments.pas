unit PosPayments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar ;

type
TEdit = class(StdCtrls.TEdit)
private
FAlignment : TAlignment;
procedure SetAlignment(Value: TAlignment);
protected
procedure CreateParams(var Params: TCreateParams); override;
public
property Alignment: TAlignment read FAlignment write SetAlignment;
end;

  TfmPosPayments = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    gbPayAmt: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    LbltoPay: TStaticText;
    Label2: TLabel;
    lblChange: TStaticText;
    Shape2: TShape;
    PcDetails: TPageControl;
    CashPage: TTabSheet;
    CardPage: TTabSheet;
    AccPage: TTabSheet;
    VouPage: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Edit2: TEdit;
    Label12: TLabel;
    Edit3: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label17: TLabel;
    tbsCheques: TTabSheet;
    Label18: TLabel;
    Edit4: TEdit;
    Label19: TLabel;
    edtBankCode: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    MComment: TMemo;
    LComment: TLabel;
    edtCash: TEdit;
    edtCard: TEdit;
    edtCheque: TEdit;
    edtAccount: TEdit;
    edtVouch: TEdit;
    cbIgnoreDevice: TCheckBox;
    wwDBDateTimePicker1: TcxDateEdit;
    edtCustAcc: TcxComboBox;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCashExit(Sender: TObject);
    procedure edtCashKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCashEnter(Sender: TObject);
    procedure PcDetailsExit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure edtCustAccDropDown(Sender: TObject);
    procedure wwDBDateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure edtCustAccKeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtCashDblClick(Sender: TObject);
    procedure cxComboBox1PropertiesPopup(Sender: TObject);
  private
    { Private declarations }
    Procedure UpDateLbls;
    Function SumPayed:Real;
    Procedure ActivatePage(Sender:TObject);


  public
    DutchWay  : Boolean ;
    { Public declarations }
    TotalAmount:real;
    Function AmtChange:Real;
    Procedure ReadAmt;
    Function StillToPay:Real;
  end;

var
  fmPosPayments: TfmPosPayments;

implementation

uses PosRoutines, PosEntry, GlobalFunctions, PosInvoiceInfo, DatabaseAccess,
  Database, TcVariables, UDMTCCoreLink, DBAccess , Uni;



{$R *.dfm}


procedure TEdit.CreateParams(var Params: TCreateParams);
const
Alignments : array[TAlignment] of LongWord= (ES_Left,ES_Right, ES_Center);
begin
inherited CreateParams(Params);
Params.Style := Params.Style or Alignments[FAlignment];
end;

procedure TEdit.SetAlignment(Value: TAlignment);
begin
if FAlignment <> Value then
begin
FAlignment := Value;
RecreateWnd;
end;
end;


Function TfmPosPayments.StillToPay:Real;
begin
  Result := round((TotalAmount-SumPayed)*100) / 100 ;
 // if Result<0 then Result := 0;
end;

procedure TfmPosPayments.BtnCancelClick(Sender: TObject);
begin
  NextDoc:=False;
  Close;
end;

procedure TfmPosPayments.BtnOkClick(Sender: TObject);
var
 pOutput : array [0..1536] of char ;
 PpOutput : pchar ;
 inString : String ;
 AList : TStringlist;
 i : integer ;
begin
  BtnOk.OnClick := nil ;
  BtnCancel.OnClick := nil ;
 // gbPayAmt.Enabled := false ;

 // PcDetails.Enabled := false ;
  try




  if StillToPay>0 then
  begin
    OSFMessageDlg(format(gettextlang(2098),[#13#10+FloatToStr(StillToPay)+#13#10]), mtError, [mbok], 0);
    try
    if edtCash.CanFocus then
    edtCash.SetFocus;
    except

    end;
    exit;
  end;


  if Assigned(AExternalPOSPointsPlugin) and (DMTCCoreLink.ReadNwReportOp('POSPOINTSPLUGIN',false)) then
         begin
          dmDatabase.tblBatch.close ;
          try
          FillChar(pOutput,1536,#0);
          PpOutput := @pOutput[0] ;
          inString := 'CASH=' + edtCash.Text + #13+#10 +
          'CARD=' + edtCard.Text + #13+#10 +
          'CHEQUE=' + edtCheque.Text + #13+#10 +
          'ACCOUNT=' + edtAccount.Text + #13+#10 +
          'VOUCHER=' + edtVouch.Text + #13+#10 +
          'CUSTID=' + IntToStr(CurCustAccount.WaccountID) + #13+#10 +
          'BATCH=' + dmDatabase.tblBatch.TableName ;


          AExternalPOSPointsPlugin(Application,1,pchar(inString),PpOutput);
          if pOutput <> '' then
            begin
               AList := TStringlist.create;
                       try
                         AList.Text := pOutput ;
                         edtCash.Text := AList.Values['CASH'] ;
                         edtCard.Text := AList.Values['CARD'] ;
                         edtCheque.Text := AList.Values['CHEQUE'] ;
                         edtAccount.Text := AList.Values['ACCOUNT'] ;
                         edtVouch.Text := AList.Values['VOUCHER'] ;
                         TotalAmount := TotalAmount - StrToFloatDef(AList.Values['POINTSUSED'],0) ;
                       finally
                        AList.free ;
                       end;


            end;
           finally
          dmDatabase.tblBatch.Open ;
          end;
       end;

  NextDoc:=True;
  AmtChange;{This will force Re-Calculation}
  if StrToFloatDef(edtCash.Text,0)<>0 then
   begin
     PymtMethod[0]:=True;
   end;
  if StrToFloatDef(edtCard.Text,0)<>0 then
     begin
     PymtMethod[1]:=True;
     end;
  if StrToFloatDef(edtAccount.Text,0)<>0 then PymtMethod[2]:=True;
  if StrToFloatDef(edtVouch.Text,0)<>0 then PymtMethod[3]:=True;
  if StrToFloatDef(edtCheque.Text,0)<>0 then
     begin
     PymtMethod[4]:=True;
     if edtBankCode.Text <> ''  then
     MComment.Lines.Add(Label19.Caption + ' ' + edtBankCode.Text);
     if Edit4.Text <> '' then
     MComment.Lines.Add(Label18.Caption + ' ' + Edit4.Text);
     // handel points




     // handel PIN
      if Assigned(AExternalPinPlugin) and AExternalPinIsReady and not cbIgnoreDevice.Checked then
         begin
         FillChar(pOutput,1536,#0);
         PpOutput := @pOutput[0] ;
         inString := FloatToStr(StrToFloatDef(edtCheque.Text,0)) + #13+#10 + IntTostr(0);
         AExternalPinPlugin(Application,1,pchar(inString),PpOutput);

         if pOutput <> '' then
           begin
             if pos('ERROR:',pOutput) = 1 then
               begin
                  if Length(inString) > 20 then
                     insert(#13+#10,inString ,20);
                  inString := StringReplace(StringReplace(copy(pOutput,7,length(pOutput)),#13+#10,#13,[rfReplaceAll]),#10,#13,[rfReplaceAll]);
                  inString := StringReplace(inString,#13,#13+#10,[rfReplaceAll]) ;



                  if not DMTCCoreLink.ReadNwReportOp('PINSHOWFULLMES',false) then
                     begin
                       AList := TStringlist.create;
                       try
                         AList.Text := inString ;
                        for i := 0 to AList.Count -2 do
                          if pos('CODE ',AList[i]) <> 0 then
                             inString := AList[i]+#13+#10+AList[i+1];
                       finally
                        AList.free ;
                       end;
                     end;

                  Raise Exception.Create(inString) ;

               end else
               begin
                    MComment.Lines.Add('PIN:');
                    MComment.Lines.Add(pOutput);
                   // MComment.Lines.SavetoFile('c:\test.txt');
               end; 
           end;
         end;

     end;

  // adjust payment data from plugin

  //
  Application.ProcessMessages;
  fmPosInvoiceEntry.FAmtPayed:=0;
  fmPosInvoiceEntry.FAmtChange := AmtChange;

  finally
  BtnOk.OnClick := BtnOkClick ;
  BtnCancel.OnClick := BtnCancelClick ;
  gbPayAmt.Enabled := True ;
  PcDetails.Enabled := True ;
  end;
  Close;
  OpenDrowerNow;

end;

Procedure TfmPosPayments.UpDateLbls;
Var
 S:String;
 ToPay:real;
begin
//  topay := TotalAmount-SumPayed;
  topay := StillToPay;
  {After Calling SumPayed it's value is stored in Payed}
 // if ToPay<0 then ToPay:=0;
  LbltoPay.Caption := FloatToStrF(ToPay,ffFixed,10,2);
  lblChange.Caption := FloatToStrF(AmtChange,ffFixed,10,2);
  s := FormatLeft(GetTextLang(2893),20)+FormatRight(FloatToStrF(TotalAmount,ffFixed,10,2),20);
  s := s + FormatLeft(gettextlang(2041),20)+FormatRight(FloatToStrF(PosCash,ffFixed,10,2),20);
  s := s + FormatLeft(gettextlang(2042),20)+FormatRight(FloatToStrF(AmtChange,ffFixed,10,2),20);
  fmPosInvoiceEntry.PosLcd.Caption := s;
end;

procedure TfmPosPayments.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 edtCash.Alignment :=   taRightJustify ;
 edtCard.Alignment :=   taRightJustify ;
 edtCheque.Alignment :=   taRightJustify ;
 edtAccount.Alignment :=   taRightJustify ;
 edtVouch.Alignment :=   taRightJustify ;

  cbIgnoreDevice.Checked := not AExternalPinIsReady ;
  cbIgnoreDevice.Visible := Assigned(AExternalPinPlugin)  ;

  DutchWay := not dmDatabase.SetOfBooksPropertys.DataParameter.CBViewAllBankState ;
  Label8.Caption:=CurCustAccount.SACCOUNTCODE;
  Label9.Caption:=CurCustAccount.SDescription;
  LComment.caption := gettextlang(2050);
  MComment.clear ;
  Label15.Caption:=CurCustAccount.SACCOUNTCODE+'   '+CurCustAccount.SDescription;
  PosCash:=0;
  edtCash.Text:=formatfloat('0.00',0);
  edtCard.Text:=formatfloat('0.00',0);
  edtAccount.Text:=formatfloat('0.00',0);
  edtVouch.Text:=formatfloat('0.00',0);
  UpDateLbls;
  fmPosPayments.edtCash.Text := fmPosPayments.LbltoPay.Caption ;
  ActivatePage(edtCash);

    Caption := GetTextLang(181); // Payments
    Label1.Caption := GetTextLang(1349);// Still to pay
    Label2.Caption := GetTextLang(538);// Change
    Label20.Caption := GetTextLang(792);// CASH
    Label21.Caption := GetTextLang(823);// CreditCard
    Label22.Caption := GetTextLang(793);// Cheque
    Label23.Caption := GetTextLang(34);// Account
    Label24.Caption := GetTextLang(1173);// Voucher
    Label14.Caption := GetTextLang(1350);// Charge to Account:
    Label19.Caption := GetTextLang(1351);// Bank Account Code
    Label18.Caption := GetTextLang(1352);// Cheque Number
    Label7.Caption := GetTextLang(1346);// Customer
    Label10.Caption := GetTextLang(1353);// Card Number
    Label11.Caption := GetTextLang(1354);// Holder Name
    Label12.Caption := GetTextLang(1355);// Card Type
    Label13.Caption := GetTextLang(1356);// Expire Date
    BtnOK.Caption := GetTextLang(729);// &Next
    BtnCancel.Caption := GetTextLang(879);// &Back

end;

Function TfmPosPayments.SumPayed:Real;
Var
  i:Byte;
begin
  ReadAmt;
  Result :=0;
  For i:=0 to 4 do
    Result := Result + PymtAmount[i];
  PosCash:=Result;
end;

Function TfmPosPayments.AmtChange:Real;
begin
  Result := round((SumPayed - TotalAmount)*100) / 100;
  if Result<0 then Result := 0;
  PosChange := Result ;
end;

procedure TfmPosPayments.edtCashExit(Sender: TObject);
Var
  Dif:Real;
begin
  if Sender.ClassType<>TEdit then exit;
  Dif := SumPayed-TotalAmount;
//  if (Dif>0) And (Not SameText((Sender As TEdit).Name,'edtCash'))
//    AND (Str2Float(TEdit(Sender).Text))<>0 then
//  begin
//     edtCash.Text := Dif;
//  end;
  UpDateLbls;
end;

procedure TfmPosPayments.edtCashKeyPress(Sender: TObject; var Key: Char);
begin
  try
  if key = '.' then key  := DecimalSeparator ;
  if Key=#13 then
  begin
     if (StillToPay<=0) AND  ((Sender = edtCash) or (Sender = edtCard)) then
     begin
      if BtnOk.CanFocus then
       BtnOk.SetFocus
     end
     else if StrToFloatDef(TEdit(Sender).Text,0)<=0 then
     begin
        if DutchWay then
         begin
          if Sender = edtCash then
            edtCheque.SetFocus
          else if Sender = edtCheque then
            edtCard.SetFocus
           else if Sender = edtCard then
            edtAccount.SetFocus
          else if Sender = edtCheque then
            edtAccount.SetFocus
          else if Sender = edtAccount then
            edtVouch.SetFocus
          else if Sender = edtVouch then
            edtCash.SetFocus;
         end
        else
        begin
        if Sender = edtCash then
          edtCard.SetFocus
        else if Sender = edtCard then
          edtCheque.SetFocus
        else if Sender = edtCheque then
          edtAccount.SetFocus
        else if Sender = edtAccount then
          edtVouch.SetFocus
        else if Sender = edtVouch then
          edtCash.SetFocus;
        end;
     end
     else
     begin
        if DutchWay then
         begin
          if Sender = edtCash then
            edtCheque.SetFocus
          else if Sender = edtCheque then
            edtCard.SetFocus
          else if Sender = edtCard then
            Edit1.SetFocus
          else if Sender = edtAccount then
            edtCustAcc.SetFocus
          else if Sender = edtVouch then
            Edit5.SetFocus
         end else
         begin
          if Sender = edtCash then
            edtCard.SetFocus
          else if Sender = edtCard then
            Edit1.SetFocus
          else if Sender = edtAccount then
            edtCustAcc.SetFocus
          else if Sender = edtVouch then
            Edit5.SetFocus
         end;
     end;
    Key:=#0;
  end;

  except

  end ;
end;

Procedure TfmPosPayments.ActivatePage;
begin
  if Not (Sender is TEdit) then exit;
  if Sender = EDTCard  then
    PcDetails.ActivePageIndex:=1
  else if Sender = edtAccount then
    PcDetails.ActivePageIndex:=2
  else if Sender = edtVouch then
    PcDetails.ActivePageIndex:=3
  else if Sender = edtCheque then
    PcDetails.ActivePageIndex:=4
  else PcDetails.ActivePageIndex:=0;
end;

Procedure TfmPosPayments.ReadAmt;
begin
  PymtAmount[0]:= StrToFloatDef(edtCash.Text,0);
  PymtAmount[1]:= StrToFloatDef(edtCard.Text,0);
  PymtAmount[2]:= StrToFloatDef(edtAccount.Text,0);
  PymtAmount[3]:= StrToFloatDef(edtVouch.Text,0);
  PymtAmount[4]:= StrToFloatDef(edtCheque.Text,0);;
end;

procedure TfmPosPayments.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then
  begin
    Key:=#0;
    if BtnOk.Enabled then
    BtnCancelClick(Sender);
  end;
end;

procedure TfmPosPayments.edtCashEnter(Sender: TObject);
begin
  ActivatePage(Sender);
  if Not (sender is TEdit) then exit;
  if (StillToPay>0) and (StrToFloatDef(TEdit(sender).Text,0)<=0) then
    TEdit(sender).Text := FloatToStr(StillToPay);
  TEdit(sender).SelectAll ;
end;

procedure TfmPosPayments.PcDetailsExit(Sender: TObject);
begin
  if StrToFloatDef(LbltoPay.Caption,0)<>0 then
  begin
    if StrToFloatDef(edtCard.Text,0)=0 then
       edtCard.SetFocus
    else if StrToFloatDef(edtAccount.Text,0)=0 then
       edtAccount.SetFocus
    else if StrToFloatDef(edtVouch.Text,0)=0 then
       edtVouch.SetFocus
    else  edtCash.SetFocus;
  end;

end;



procedure TfmPosPayments.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    Self.SelectNext(ActiveControl,true,True);
    Key:=#0;
  end;
end;

procedure TfmPosPayments.edtCustAccDropDown(Sender: TObject);
begin
  ChangeCustomer(CurCustAccount);
  Label15.Caption:=CurCustAccount.SACCOUNTCODE+'   '+CurCustAccount.SDescription;
end;

procedure TfmPosPayments.wwDBDateTimePicker1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    if StillToPay<=0 then
      btnOk.SetFocus
    else
      edtAccount.SetFocus;
    Key:=#0;
  end;
end;

procedure TfmPosPayments.edtCustAccKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    if StillToPay<=0 then
      btnOk.SetFocus
    else
      edtVouch.SetFocus;
    Key:=#0;
  end;
end;

procedure TfmPosPayments.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    if StillToPay<=0 then
      btnOk.SetFocus
    else
      EdtCash.SetFocus;
    Key:=#0;
  end;
end;

procedure TfmPosPayments.FormActivate(Sender: TObject);
begin
  BtnOk.SetFocus;
  edtCash.SetFocus;
end;

procedure TfmPosPayments.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := BtnOk.Enabled ;
end;

procedure TfmPosPayments.edtCashDblClick(Sender: TObject);
var
 AOldValue : Double ;
begin
  if DMTCCoreLink.ReadSysParam('LookupButtons',false,CurrentUser) then
    begin
      AOldValue := StrToFloat(TEdit(Sender).Text) ;
      if CallCalc(AOldValue) then
          TEdit(Sender).Text := FloatToStr(AOldValue) ;
    end;
end;

procedure TfmPosPayments.cxComboBox1PropertiesPopup(Sender: TObject);
begin
edtCustAccDropDown(self);
end;

end.
