unit InvoicePayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,VirtualTable, DB,
  DBAccess , Uni,ExtCtrls, StdCtrls, Buttons,UPOSSHARED ,TcashClasses,
  MemDS;

type
  TfmInvocePayment = class(TForm)
    ZQGetPaymentTypes: TuniQuery;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    LTotal: TLabel;
    LTotalEntered: TLabel;
    LLTotal: TLabel;
    LLTotalEntered: TLabel;
    PAbcParent: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure LTotalDblClick(Sender: TObject);
    procedure LabelDblClick(Sender: TObject);
    procedure LabelExit(Sender: TObject);
    procedure EnterControl(Sender: TObject);
    procedure SpeedBtnClick(Sender: TObject);
    procedure ControlDblClick(Sender: TObject);
    procedure ControlChange(Sender: TObject);
    procedure LTotalEnteredDblClick(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);


  private
    procedure OnAbcBtnClick(Sender: TObject);
    procedure OpenDrawerNow;
    procedure PrintOnComPort(aDevice: TComPort; aText: String);

    { Private declarations }
  public
    CashDrawer:TComPort;
    aabc : TABCBar ;
    PaymentDetails : TVirtualTable ;
    MainPanel : TPanel ;
    isReadonly : Boolean ;
    Total : Double ;
    TotWithoutControl : Double ;
    BJusPayment : Boolean ;
    BHasPin : Boolean ;
    BignorePin : Boolean ;
    PaymentIndex : Integer ;
    function CalCurrentTotal(const AMinusControl : Tobject) : Double ;
    procedure SetIsHandheld;
    function GetChange : Double ;
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink, OSFGeneralRoutines , UMsgBox;

{$R *.dfm}

procedure TfmInvocePayment.SetIsHandheld ;
begin
  self.WindowState := wsMaximized ;
end;

procedure TfmInvocePayment.FormShow(Sender: TObject);
 var
    y : Integer ;
    aLabel : TEdit ;
    AAmount,FirstAmount : TEdit ;
    AspeedBtn : TSpeedButton ;
    DetailsFound : Boolean ;
    CummTotal : Double ;
    aCheckBox : TCheckBox ;
begin
    TDatabaseRegistyRoutines.ReadFormPos(self,'POSINV');
   FirstAmount := nil ;

   LLtotal.Caption := DMTCCoreLink.GetTextLang(2228 );
   LLtotal.Parent := nil ;
   LTotal.Parent := nil ;

   LLTotalEntered.Caption := DMTCCoreLink.GetTextLang(906008);

   LLTotalEntered.Parent := nil ;
   LTotalEntered.Parent := nil ;

   CummTotal := 0 ;
   self.Caption := DMTCCoreLink.GetTextLang(2232);
   LTotal.Caption := FormatFloat('#,##0.00',Total);

   DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
   DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
   //BtnCancel
   BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);
   //Ok
   BtnOk.Caption := DMTCCoreLink.GetTextLang(167);
   BtnOk.Enabled := not IsReadonly ;

   BtnCancel.Left := (ButtonPanel.Width - (BtnCancel.Width + 10)) ;
   BtnOk.Left := (BtnCancel.Left - (BtnOk.Width + 10) );

  y :=   LlTotal.Top + LTotal.Height + 10 ; ;
  if assigned(MainPanel) then
    FreeAndNil(MainPanel);


  MainPanel := TPanel.Create(Self) ;
  MainPanel.parent := self ;
  MainPanel.Align := alClient ;

  LTotal.Parent := MainPanel ;
  LlTotal.Parent := MainPanel ;

  LTotalEntered.Parent := MainPanel ;
  LLTotalEntered.Parent := MainPanel ;
  ZQGetPaymentTypes.open ;
  ZQGetPaymentTypes.First ;
  DetailsFound := false ;

  while not ZQGetPaymentTypes.eof do
    Begin
      aLabel := TEdit.create(MainPanel) ;
      aLabel.parent := MainPanel ;
      aLabel.left := 10 ;
      aLabel.Width := 110 ;
      aLabel.TabStop := false ;
      aLabel.Top := y ;
      aLabel.OnEnter := LabelDblClick ;
      aLabel.OnExit := LabelExit ;
      aLabel.Text := ZQGetPaymentTypes.fieldByName('SDDESCRIPTION').AsString ;
      aLabel.name := 'l' + InttoStr(ZQGetPaymentTypes.fieldByName('WPAYMENTTYPEID').AsInteger) ;
      if BHasPin then
        if ZQGetPaymentTypes.RecNo = PaymentIndex then
          begin
            aCheckBox := TCheckBox.create(MainPanel) ;
            aCheckBox.parent := MainPanel ;
            aCheckBox.left := 0 ;
            aCheckBox.Width := 10 ;
            aCheckBox.TabStop := false ;
            aCheckBox.Top := y ;
            aCheckBox.OnClick := CheckBoxClick ;
            aCheckBox.Caption := '' ;
            aCheckBox.name := 'cb' + InttoStr(ZQGetPaymentTypes.fieldByName('WPAYMENTTYPEID').AsInteger) ;
          end;

      AspeedBtn := TSpeedButton.create(MainPanel) ;
      AspeedBtn.parent := MainPanel ;
      AspeedBtn.left := Trunc(190 * glScaleByPerc) ;
      AspeedBtn.Width := 30 ;
      AspeedBtn.Height := 30 ;
      AspeedBtn.Top := y ;
      AspeedBtn.Caption := 'X' ;
      AspeedBtn.name := 'bt' + InttoStr(ZQGetPaymentTypes.fieldByName('WPAYMENTTYPEID').AsInteger) ;
      AspeedBtn.OnClick := SpeedBtnClick ;

      AAmount := TEdit.create(MainPanel) ;
      aLabel.tag := Integer(AAmount);
      AspeedBtn.tag := Integer(AAmount);

      AAmount.parent := MainPanel ;
      AAmount.left := Trunc(120 * glScaleByPerc) ;
      AAmount.Width := Trunc(60 * glScaleByPerc) ;
      AAmount.OnEnter := EnterControl;
      AAmount.OnChange := ControlChange;
      AAmount.OnDblClick := ControlDblClick ;

      AAmount.Top := y ;
      AAmount.Text :=  FormatFloat('0.00',0) ;
      AAmount.name := 'e' + InttoStr(ZQGetPaymentTypes.fieldByName('WPAYMENTTYPEID').AsInteger) ;
      if FirstAmount = nil then FirstAmount := AAmount ;
      PaymentDetails.First ;
      While not PaymentDetails.Eof do
         begin
           if PaymentDetails.Fields[2].AsInteger = ZQGetPaymentTypes.fieldByName('WACCOUNTID').AsInteger then
             begin
                aLabel.Text := PaymentDetails.Fields[1].AsString ;
                AAmount.Text := FormatFloat('0.00',-PaymentDetails.Fields[0].AsFloat) ;
                CummTotal := CummTotal + (-PaymentDetails.Fields[0].AsFloat) ;

                DetailsFound := true ;
                break ;
             end;
           PaymentDetails.next ;
         end;
      y := y + Trunc(25 * glScaleByPerc) ;
      ZQGetPaymentTypes.next ;
    end;
    if FirstAmount <> nil then
      begin
       if not DetailsFound then
       begin
         {if (Total > 0 ) then}
          begin
           FirstAmount.Text := FormatFloat('#,##0.00',Total);
           LTotalEntered.Caption := FormatFloat('#,##0.00',Total);
          end  ;
       end else
       begin
         LTotalEntered.Caption := FormatFloat('#,##0.00',CummTotal);
       end;
       FirstAmount.SelectAll ;
       FirstAmount.SetFocus ;

      end;


      aLabel := TEdit.create(MainPanel) ;
      aLabel.parent := MainPanel ;
      aLabel.left := 10 ;
      aLabel.Width := Trunc(110 * glScaleByPerc) ;
      aLabel.TabStop := false ;
      aLabel.Top := y ;
      aLabel.OnDblClick := LabelDblClick ;
      aLabel.OnExit := LabelExit ;
      aLabel.Text := DMTCCoreLink.GetTextLangNoAmp(2042) ; // Change ;
      aLabel.Visible := not BJusPayment ;
      aLabel.name := 'change' ;
      aLabel.ReadOnly := true ;


      AAmount := TEdit.create(MainPanel) ;
      aLabel.tag := Integer(AAmount);
      AAmount.parent := MainPanel ;
      AAmount.Visible := not BJusPayment ;
      AAmount.left := Trunc(120 * glScaleByPerc) ;
      AAmount.Width := Trunc(60 * glScaleByPerc) ;
   //   AAmount.OnEnter := EnterControl;
   //   AAmount.OnChange := ControlChange;
   //   AAmount.OnDblClick := ControlDblClick ;
      AAmount.ReadOnly := true ;
      AAmount.Top := y ;
     // if (Total > 0 ) then
          AAmount.Text :=  FormatFloat('0.00',0);
     //     else
     //     AAmount.Text :=  FormatFloat('0.00',-Total)  ;

      AAmount.name := 'echange' ;
      y := y + Trunc(25 * glScaleByPerc) ;

      LTotalEntered.top  := y ;
      LLTotalEntered.top  := y ;


  // self.Height := PAbcParent.Height + LTotalEntered.top + ButtonPanel.Height + LTotalEntered.Height + 35 ;

end;

procedure TfmInvocePayment.FormCreate(Sender: TObject);
begin

 aabc := TABCBar.create(self) ;

 aabc.Visible := false ;
 aabc.OnBtnClick := OnAbcBtnClick ;
 aabc.Align := alTop ;
    aabc.Parent := PAbcParent ;
 aabc.Height := 66 ;
  DMTCCoreLink.AssignConnectionToChilds(self) ;
  ZQGetPaymentTypes.close ;
  ZQGetPaymentTypes.open ;

  CashDrawer.Connected := DMTCCoreLink.ReadSysParam('SDrwConnect',False,0);
  if CashDrawer.Connected then
    begin
      CashDrawer.Name:= DMTCCoreLink.ReadSysParam('SDrwComName','1',0);
      CashDrawer.parity := Copy(VarToStr(DMTCCoreLink.ReadSysParam('SDrwParity','N',0))+'N',1,1)[1] ;
      CashDrawer.baud := DMTCCoreLink.ReadSysParam('SDrwBaud',9600,0);
      CashDrawer.data := DMTCCoreLink.ReadSysParam('SDrwData',8,0);
      CashDrawer.stop := DMTCCoreLink.ReadSysParam('SDrwStop',1,0);
      CashDrawer.IsComPort := DMTCCoreLink.ReadSysParam('SDrwIsCom',True,0);
      CashDrawer.ControlStr := DMTCCoreLink.ReadSysParam('SDrwControlStr','07',0);
    end;
end;

procedure TfmInvocePayment.BtnCancelClick(Sender: TObject);
begin
 ModalResult := mrcancel ;
end;

procedure TfmInvocePayment.PrintOnComPort(aDevice:tcashclasses.TComPort;aText:String);
Const
   RxBufferSize = 256;
   TxBufferSize = 256;
Var
   DCB: TDCB;
   Config : String;
   CommTimeouts : TCommTimeouts;
   DeviceName: Array[0..80] of Char;
   ComFile: THandle;
   BytesWritten: Cardinal;

   Function SafePortCall(Value:Boolean;PrtErrCode:Byte):Boolean;
   begin
     Result := False;
     if Not Value then
     begin
       case PrtErrCode of
       1: ;

       else

       end;
       CloseHandle(ComFile);
       Result := True;
     end;
   end;

begin
  StrPCopy(DeviceName,'COM'+aDevice.Name+':');
  ComFile := CreateFile(DeviceName, GENERIC_READ or GENERIC_WRITE, 0, Nil,
                                    OPEN_EXISTING,
                                    FILE_ATTRIBUTE_NORMAL, 0);
  Try
    Try
       if SafePortCall(Not(ComFile = INVALID_HANDLE_VALUE),0) then  exit;
       if SafePortCall(SetupComm(ComFile, RxBufferSize, TxBufferSize),1) then Exit;
       if SafePortCall(GetCommState(ComFile, DCB),2) then exit;
       Config := 'baud='+ IntToStr(aDevice.baud)+' parity='+aDevice.parity +
             ' Data='+ IntToStr(aDevice.data)+' stop='+IntToStr(aDevice.stop)+ #0;
       if SafePortCall(BuildCommDCB(@Config[1], DCB),6) then exit;
       if SafePortCall(SetCommState(ComFile, DCB),3) then exit;
       with CommTimeouts do
       begin
         ReadIntervalTimeout := 0;
         ReadTotalTimeoutMultiplier := 0;
         ReadTotalTimeoutConstant := 1000;
         WriteTotalTimeoutMultiplier := 0;
         WriteTotalTimeoutConstant := 1000;
       end;
       if SafePortCall(SetCommTimeouts(ComFile, CommTimeouts),4) then;
       if SafePortCall(WriteFile (ComFile, aText[1], Length(aText), BytesWritten, Nil),5) then;
     except
     end;
   Finally
     CloseHandle(ComFile);
   end;
end;

Procedure TfmInvocePayment.OpenDrawerNow;
Var
  S,DrwText:String;
  i,x:Integer;
begin
 x := 0 ;
  s := Trim(CashDrawer.ControlStr)+'+';
  DrwText := '';
  Repeat
    i := Pos('+',s);
    if i>0 then begin
      x := StrToIntDef(Copy(s,1,i-1),-1);
      Delete(s,1,i);
    end else s :='' ;
    if x>=0 then
      DrwText := DrwText + Chr(x);
  Until s='';
  if CashDrawer.Connected then begin
    if CashDrawer.IsComPort then begin
      if DrwText='' then DrwText:=#7;
      PrintOnComPort(CashDrawer,DrwText)
    end ;
  end;
end;


procedure TfmInvocePayment.BtnOkClick(Sender: TObject);
var
    aLabel : TEdit ;
    AAmount,BAmount : TEdit ;
    ItemFound , Needsopen : Boolean ;
begin
 TDatabaseRegistyRoutines.WriteFormPos(self,'POSINV');
 // if BMustBeExact then

  ItemFound := false ;

  ZQGetPaymentTypes.First ;

  while not ZQGetPaymentTypes.eof do
    Begin
      aLabel := TEdit(MainPanel.FindComponent('l' + InttoStr(ZQGetPaymentTypes.fieldByName('WPAYMENTTYPEID').AsInteger)));
      AAmount := TEdit(MainPanel.FindComponent('e' + InttoStr(ZQGetPaymentTypes.fieldByName('WPAYMENTTYPEID').AsInteger)));
      ItemFound := false ;
      PaymentDetails.First ;
      While not PaymentDetails.Eof do
         begin
           if PaymentDetails.Fields[2].AsInteger = ZQGetPaymentTypes.fieldByName('WACCOUNTID').AsInteger then
             begin

                PaymentDetails.edit ;
                PaymentDetails.Fields[1].AsString := aLabel.Text ;
                PaymentDetails.Fields[0].AsFloat := -StrToFloatDef( TDataBaseStringRoutines.StripNotNumeric( AAmount.Text),0) ;
                if (PaymentDetails.RecNo = 1)  and not BJusPayment then
                   begin
                     BAmount := TEdit(MainPanel.FindComponent('echange'));
                     PaymentDetails.Fields[0].AsFloat := PaymentDetails.Fields[0].AsFloat + (-StrToFloatDef( TDataBaseStringRoutines.StripNotNumeric( BAmount.Text),0)) ;
                   end;

                PaymentDetails.Post ;
                ItemFound := True ;
                break ;
             end;
           PaymentDetails.next ;
         end;
      if not ItemFound then
         begin
           // add
                PaymentDetails.Append ;
                PaymentDetails.Fields[1].AsString := aLabel.Text ;
                PaymentDetails.Fields[0].AsFloat :=   - StrToFloatDef(TDataBaseStringRoutines.StripNotNumeric( AAmount.Text),0) ;
                PaymentDetails.Fields[2].AsInteger :=  ZQGetPaymentTypes.fieldByName('WACCOUNTID').AsInteger ;
                if (PaymentDetails.RecNo = 1)  and not BJusPayment then
                   begin
                     BAmount := TEdit(MainPanel.FindComponent('echange'));
                     PaymentDetails.Fields[0].AsFloat := PaymentDetails.Fields[0].AsFloat + (-StrToFloatDef( TDataBaseStringRoutines.StripNotNumeric(BAmount.Text),0)) ;
                   end;
                PaymentDetails.Post ;
         end;
      ZQGetPaymentTypes.next ;
    end;
   ModalResult := mrOk ;
   ZQGetPaymentTypes.First ;
   if ZQGetPaymentTypes.Fields[0].AsFloat <> 0 then
      begin
       OpenDrawerNow ;
       BAmount := TEdit(MainPanel.FindComponent('echange'));

      end;
end;

procedure TfmInvocePayment.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13)  then
  begin
    SelectNext(Screen.ActiveControl, True, True);
    Key := #0;
  end;
 if (Key = '.')  then
  begin
    Key := DecimalSeparator;
  end;
end;

procedure TfmInvocePayment.LTotalDblClick(Sender: TObject);
begin
 if ActiveControl is TEdit then
 (ActiveControl as TEdit ).Text := LTotal.Caption ;
end;

function TfmInvocePayment.CalCurrentTotal(const AMinusControl : Tobject) : Double;
var

    AAmount : TEdit ;

begin
 ZQGetPaymentTypes.first ;
 result := 0 ;
 while not ZQGetPaymentTypes.eof do
    Begin
      AAmount := TEdit(MainPanel.FindComponent('e' + InttoStr(ZQGetPaymentTypes.fieldByName('WPAYMENTTYPEID').AsInteger)));
      if not (AAmount = AMinusControl) then
      result := result + StrToFloatDef( StringReplace(AAmount.Text,ThousandSeparator,'',[rfReplaceAll]),0) ;
      ZQGetPaymentTypes.next ;
     end;


    {  AAmount := TEdit(MainPanel.FindComponent('echange'));
      if not (AAmount = AMinusControl) then
      result := result + StrToFloatDef( StringReplace(AAmount.Text,ThousandSeparator,'',[rfReplaceAll]),0) ; }

end;

procedure TfmInvocePayment.ControlChange(Sender: TObject);
var
 ANewTotal : Double ;
 AAmount : TEdit ;
begin
 ANewTotal := TotWithoutControl+ StrToFloatDef( StringReplace((Sender as TEdit).Text,ThousandSeparator,'',[rfReplaceAll]),0) ;

 LTotalEntered.Caption := FormatFloat('#,##0.00',ANewTotal);
 AAmount := TEdit(MainPanel.FindComponent('echange'));
 if AAmount <> nil then
 begin
 if (ANewTotal > Total) then
    begin

      AAmount.Text := FormatFloat('#,##0.00',Total-ANewTotal);
    end else
    AAmount.Text := FormatFloat('#,##0.00',0);
  end;  
end;

procedure TfmInvocePayment.EnterControl(Sender: TObject);
begin
    TotWithoutControl := CalCurrentTotal(Sender) ;
end;

procedure TfmInvocePayment.LTotalEnteredDblClick(Sender: TObject);
begin
 if ActiveControl is TEdit then
 (ActiveControl as TEdit ).Text :=   FormatFloat('#,##0.00',
  StrToFloatDef(StringReplace(LTotal.Caption ,ThousandSeparator,'',[rfReplaceAll]),0) - StrToFloatDef(StringReplace(LTotalEntered.Caption ,ThousandSeparator,'',[rfReplaceAll]),0)) ;


end;

procedure TfmInvocePayment.ControlDblClick(Sender: TObject);
begin

 if ActiveControl is TEdit then
 (ActiveControl as TEdit ).Text :=   FormatFloat('#,##0.00',
  StrToFloatDef(StringReplace(LTotal.Caption ,ThousandSeparator,'',[rfReplaceAll]),0) - TotWithoutControl) ;

end;

function TfmInvocePayment.GetChange: Double;
begin
  result := 0 ;
  if BJusPayment then exit ;
  if MainPanel.FindComponent('echange') <> nil then
   begin
      result := - StrToFloatDef( StringReplace(TEdit(MainPanel.FindComponent('echange')).Text,ThousandSeparator,'',[rfReplaceAll]),0) ;
   end;
end;

procedure TfmInvocePayment.LabelDblClick(Sender: TObject);
begin
  aabc.Visible:= true ;
  aabc.BringToFront ;
  aabc.Init(PAbcParent,1) ;  
  (TObject(TComponent(sender).Tag) as TCustomEdit).SelectAll ;

end;

procedure TfmInvocePayment.OnAbcBtnClick(Sender: TObject);
begin
  if (TObject(ActiveControl.tag) is TCustomEdit) then
     begin

        if (TObject(ActiveControl.tag) as TCustomEdit).SelLength > 0 then
          (TObject(ActiveControl.tag) as TCustomEdit).Text := '' ;
       if aabc.lastChar = '@' then
         (TObject(ActiveControl.tag) as TCustomEdit).Text := ''
         else
       if aabc.lastChar = '~' then
         (TObject(ActiveControl.tag) as TCustomEdit).Text := ''
         else
       if aabc.lastChar = '«' then
         (TObject(ActiveControl.tag) as TCustomEdit).Text := copy((TObject(ActiveControl.tag) as TCustomEdit).Text,1,length((TObject(ActiveControl.tag) as TCustomEdit).Text)-1)
         else
         (TObject(ActiveControl.tag) as TCustomEdit).Text := (TObject(ActiveControl.tag) as TCustomEdit).Text + aabc.lastChar ;
        if (TObject(ActiveControl.tag) is TEdit) then
         if Assigned((TObject(ActiveControl.tag) as TEdit).OnChange) then
           (TObject(ActiveControl.tag) as TEdit).OnChange(TObject(ActiveControl.tag));
     end;

end;

procedure TfmInvocePayment.LabelExit(Sender: TObject);
begin
  aabc.Visible := false ;
end;

procedure TfmInvocePayment.SpeedBtnClick(Sender: TObject);
begin
 TCustomEdit(TComponent(sender).tag).SetFocus ;

 if StrToFloatDef(StringReplace((TObject(TComponent(sender).tag) as TCustomEdit).Text,ThousandSeparator,'',[rfReplaceAll]),0) = 0 then
   (TObject(TComponent(sender).tag) as TCustomEdit).Text :=   FormatFloat('#,##0.00',
  StrToFloatDef(StringReplace(LTotal.Caption ,ThousandSeparator,'',[rfReplaceAll]),0) - TotWithoutControl)

 else
  (TObject(TComponent(sender).tag) as TCustomEdit).Text := FormatFloat('#,##0.00',0) ;

 ControlChange(TObject(TComponent(sender).tag));
end;

procedure TfmInvocePayment.CheckBoxClick(Sender: TObject);
begin
  BignorePin := Tcheckbox(Sender).Checked ;
end;

end.
