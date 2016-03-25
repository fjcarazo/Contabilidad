unit PosSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Printers, Buttons, ExtCtrls, ComCtrls,
       Mask,
     Spin,XRoutines;

type

  TfmPosSetup = class(TForm)
    MainPageControl: TPageControl;
    tab1: TTabSheet;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    tab2: TTabSheet;
    tab3: TTabSheet;
    tab4: TTabSheet;
    tab5: TTabSheet;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtSaleSACCOUNT: TEdit;
    edtPaidoutAccount: TEdit;
    edtCashCtrlAccount: TEdit;
    Edit4: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    Label1: TLabel;
    NextNo: TEdit;
    RadioButton2: TRadioButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    cbBatchList: TComboBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    Button2: TButton;
    GroupBox9: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cbPrinter1: TComboBox;
    cbPrinter2: TComboBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Label3: TLabel;
    edtDescr: TEdit;
    Label15: TLabel;
    ComboBox2: TComboBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    Label14: TLabel;
    cbTypePrint2: TComboBox;
    Label4: TLabel;
    cbTypePrint1: TComboBox;
    Label21: TLabel;
    cbChqBatchList: TComboBox;
    cbprnComf: TCheckBox;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    gbdPort: TGroupBox;
    Label16: TLabel;
    rbDwrPPort: TRadioButton;
    rbDwrSPort: TRadioButton;
    Edit7: TEdit;
    gbdParam: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Edit8: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    GroupBox7: TGroupBox;
    Label22: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit1: TEdit;
    GroupBox8: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit15: TEdit;
    Button3: TButton;
    TabSheet5: TTabSheet;
    CheckBox10: TCheckBox;
    CheckBox2: TCheckBox;
    gbdOpen: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button1: TButton;
    CheckBox14: TCheckBox;
    Edit16: TEdit;
    Label27: TLabel;
    CBUseinvoice: TCheckBox;
    Label28: TLabel;
    seFeed2: TSpinEdit;
    Label29: TLabel;
    seFeed1: TSpinEdit;
    Label30: TLabel;
    edtDrawerCtr: TComboBox;
    CBUseDebtorPricelevel: TCheckBox;
    CBPasswordDiscount: TCheckBox;
    EDiscountPassword: TEdit;
    CBShowQtyOnhand: TCheckBox;
    ERoundAmount: TEdit;
    Label31: TLabel;
    LEDiscountPassword: TLabel;
    CBFastSwitchSalesMan: TCheckBox;
    TSWeightDish: TTabSheet;
    CBWeightDishConnected: TCheckBox;
    CBWeightDishCom: TComboBox;
    Label32: TLabel;
    EWeightDishResult: TEdit;
    BWeightDishtest: TButton;
    Label33: TLabel;
    CBPollDiplayType: TComboBox;
    LedtChequeCtrlAccount: TLabel;
    edtChequeCtrlAccount: TEdit;
    Label35: TLabel;
    EPapercut1: TEdit;
    Label34: TLabel;
    Label36: TLabel;
    EPapercut2: TEdit;
    cbForceCutprn2: TCheckBox;
    cbForceCutprn1: TCheckBox;
    Label37: TLabel;
    docLayout: TComboBox;
    EAutoLogoutTimer: TEdit;
    LEAutoLogoutTimer: TLabel;
    cbShoPReview: TCheckBox;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure edtSaleSACCOUNTEnter(Sender: TObject);
    procedure edtPaidoutAccountEnter(Sender: TObject);
    procedure edtCashCtrlAccountEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure BWeightDishtestClick(Sender: TObject);
    procedure edtChequeCtrlAccountEnter(Sender: TObject);
  private
    { Private declarations }
    Printer : TPrinter;
    aComPort : TComPort ;

    Procedure SetPolCfg;
    Procedure ApplyChanges;
    procedure myReceiveWeightDishProc(Data: string);
    
  public
    { Public declarations }
  end;

var
  fmPosSetup: TfmPosSetup;

implementation

uses Main, GlobalFunctions, PosRoutines, TcVariables, DatabaseAccess, DB,
  OSFGeneralRoutines, UDMTCCoreLink, TcashClasses;

{$R *.dfm}

procedure TfmPosSetup.myReceiveWeightDishProc(Data: string);
begin
   if Data <> '' then
   begin
     EWeightDishResult.text := StripNotNumericReturnZero(StringReplace(Data,'.',DecimalSeparator,[rfreplaceAll])) ;
   end;
end;


Procedure TfmPosSetup.ApplyChanges;
begin
  WriteReportOp('SDocLayoutName',docLayout.Text);


  DMTCCoreLink.WriteSysParam('POSAUTOLOGOUT',StrToIntDef(EAutoLogoutTimer.Text,0));


  CashLimit := AmtFix(StrToFloatDef(Edit4.Text,0));
  Pos_PrintCustomer := CheckBox8.Checked;
  Pos_PrintInvAddress := CheckBox9.Checked;
  UseScanner := CheckBox10.Checked;
  UsePosMess := RadioButton1.Checked;
  APrinter1:=cbPrinter1.Text;
  APrinter2:=cbPrinter2.Text;
  usePrn1:=CheckBox6.Checked;
  usePrn2:=CheckBox7.Checked;
  UseSNtrk := CheckBox12.Checked;
  PymtDet := CheckBox13.Checked;
  SNextPOSInv := NextNo.Text;
  DefDesc:=edtDescr.Text;
  aPrnType1 := cbTypePrint1.ItemIndex;
  aPrnType2 := cbTypePrint2.ItemIndex;
  PosBatchID := GetBatchTypeID(cbBatchList.Text);
  PosChqBatchID := GetBatchTypeID(cbChqBatchList.Text);
  PosMess1 := edit9.Text;
  PosMess2 := edit10.Text;
  PosMess3 := edit11.Text;
  PosPrnConf :=  cbprnComf.Checked;
  AllowCashFloat := CheckBox1.Checked;
  SetPolCfg;
  PosFloatLimit := AmtFix(StrToFloatDef(Edit6.Text,0));
  UseInvoice := CBUseinvoice.Checked ;
  Prn2Feed := seFeed2.Value;
  Prn1Feed := seFeed1.Value;
  ChangeDiscountPW := trim(EDiscountPassword.Text) ;
  UseDebtorSellingPrice := CBUseDebtorPricelevel.Checked ;
  ChangeDiscount        := CBPasswordDiscount.Checked ;
  POSShowQtyOnhand    := CBShowQtyOnhand.Checked ;
  POSRoundAmount :=  StrToFloat(ERoundAmount.Text);
  POSFastSwitchSalesMan := CBFastSwitchSalesMan.Checked ;
  POSWeightDishConnected := CBWeightDishConnected.Checked ;
  POSWeightDishPORT := CBWeightDishCom.Text ;
  SPaperCut2 := EPapercut2.Text ;
  SPaperCut1 := EPapercut1.Text ;
  SavePrintersVars;
  Application.ProcessMessages;




  WriteSysParam('cbShoPReview',BoolToStr(cbShoPReview.Checked,true),0);

  WriteSysParam('SPolType',CBPollDiplayType.ItemIndex,0);
  WriteSysParam('cbForceCutprn1',BoolToStr(cbForceCutprn1.Checked,true),0);
  WriteSysParam('cbForceCutprn2',BoolToStr(cbForceCutprn1.Checked,true),0);

  SavePosInputVars;
end;

procedure TfmPosSetup.BtnOkClick(Sender: TObject);
begin
  ApplyChanges;
  Close;
end;

procedure TfmPosSetup.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPosSetup.FormShow(Sender: TObject);
Var
  I:integer;
  ACode , ADescription : String ;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');



  FillFreeReportLayoutBox(docLayout.Items);
  PageControl2.ActivePage := TabSheet3;

  MainPageControl.ActivePageIndex:=0;
 

  LoadBatchList(cbBatchList);
  cbChqBatchList.Items:=cbBatchList.Items;
  LoadPaperType(cbTypePrint1);
  LoadPaperType(cbTypePrint2);
  LoadPrintersVars;
  LoadPosInputVars;
 {}
  try
    with Printer do
      for I := 0 to Printers.Count - 1 do
      begin
        cbPrinter1.Items.Add(printers[i]);
        cbPrinter2.Items.Add(printers[i]);
      end;
  except
    raise;
  end;
  cbPrinter1.ItemIndex:=0;
  cbPrinter2.ItemIndex:=0;
  CheckBox8.Checked := Pos_PrintCustomer;
  CheckBox9.Checked := Pos_PrintInvAddress;
  CBFastSwitchSalesMan.Checked  :=POSFastSwitchSalesMan  ;
  CheckBox13.Checked := PymtDet;
  cbprnComf.Checked  := PosPrnConf;
  EDiscountPassword.Text   := ChangeDiscountPW ;
  CBUseDebtorPricelevel.Checked  := UseDebtorSellingPrice;
  CBPasswordDiscount.Checked := ChangeDiscount ;
  CBShowQtyOnhand.Checked := POSShowQtyOnhand ;
  NextNo.Text:=SNextPOSInv;
  CheckBox1.Checked := AllowCashFloat;
  Edit6.Text := FloatToStr(PosFloatLimit);
  edtDescr.Text:=DefDesc;
  if cbPrinter1.Items.IndexOf(APrinter1)<0 then
    APrinter1:=cbPrinter1.Text
  else
   cbPrinter1.ItemIndex := cbPrinter1.Items.IndexOf(APrinter1);
  if cbPrinter2.Items.IndexOf(APrinter2)<0 then
    APrinter2:=cbPrinter2.Text
  else
   cbPrinter2.ItemIndex := cbPrinter2.Items.IndexOf(APrinter2);
  CheckBox6.Checked:=usePrn1;
  CheckBox7.Checked:=usePrn2;
  CheckBox10.Checked:= UseScanner ;
  TDataBaseRoutines.GetAccountCodeAndDescription(DftSaleSACCOUNT,ACode , ADescription) ;
  if ACode <> '' then
  begin
    edtSaleSACCOUNT.Text:= copy(ACode,2,length(ACode));
    Label11.Caption:=ADescription;
  end;
  TDataBaseRoutines.GetAccountCodeAndDescription(PaidOutID,ACode , ADescription) ;
  if ACode <> '' then
  begin
    edtPaidoutAccount.Text:= copy(ACode,2,length(ACode));
    Label12.Caption:=ADescription;
  end;

  TDataBaseRoutines.GetAccountCodeAndDescription(ChequeID,ACode , ADescription) ;
  if ACode <> '' then
  begin
    edtChequeCtrlAccount.Text:= copy(ACode,2,length(ACode));
    LedtChequeCtrlAccount.Caption:=ADescription;
  end;

  TDataBaseRoutines.GetAccountCodeAndDescription(TillAccountID,ACode , ADescription) ;
  if ACode <> '' then
  begin
    edtCashCtrlAccount.Text:=  copy(ACode,2,length(ACode));
    Label13.Caption:=ADescription;
  end;
  Edit4.Text:=FloatToStr(CashLimit);
  cbTypePrint1.ItemIndex:=aPrnType1;
  cbTypePrint2.ItemIndex:=aPrnType2;
  edit9.Text :=PosMess1;
  edit10.Text :=PosMess2;
  edit11.Text :=PosMess3;
  RadioButton2.Checked:=Not UsePosMess;
  seFeed2.Value := Prn2Feed;
  seFeed1.Value := Prn1Feed;

  EPapercut2.Text := SPaperCut2 ;
  EPapercut1.Text := SPaperCut1 ;



  //RadioButton2Click(Self);
  {This Fct Close the BatchTypes Table !!!}
  cbBatchList.ItemIndex:=cbBatchList.Items.IndexOf(GetBatchTypeName(PosBatchID));
  cbChqBatchList.ItemIndex:=cbChqBatchList.Items.IndexOf(GetBatchTypeName(PosChqBatchID));
  Edit1.Text := PollDispl.name;
  Edit15.Text := PollDispl.parity ;
  Edit2.Text := IntToStr(PollDispl.baud);
  CBPollDiplayType.ItemIndex :=  readSysParam('SPolType',0,0).AsInteger ;

  cbShoPReview.Checked := readSysParam('cbShoPReview',True,0).AsBoolean ;



  cbForceCutprn1.Checked := readSysParam('cbForceCutprn1',True,0).AsBoolean ;
  cbForceCutprn2.Checked := readSysParam('cbForceCutprn2',True,0).AsBoolean ;


  Edit3.Text := IntToStr(PollDispl.data);
  Edit5.Text := IntToStr(PollDispl.stop);
  CheckBox14.Checked := PollDispl.Connected;
  RadioButton6.Checked := PollDispl.IsComPort ;
  RadioButton5.Checked := not RadioButton6.Checked ;
  docLayout.Text:= ReadReportOp('SDocLayoutName','DefaultA4').AsString;
  Edit7.Text := CashDrawer.Name;
  Edit14.Text := CashDrawer.parity ;
  Edit8.Text := IntToStr(CashDrawer.baud);
  Edit12.Text := IntToStr(CashDrawer.data);
  Edit13.Text := IntToStr(CashDrawer.stop);
  CheckBox2.Checked := CashDrawer.Connected;
  edtDrawerCtr.Text := CashDrawer.ControlStr;
  rbDwrSPort.Checked := CashDrawer.IsComPort;
  rbDwrPPort.Checked := Not rbDwrSPort.Checked;
  CBUseinvoice.Checked :=  UseInvoice  ;
  CBUseinvoice.Caption := Gettextlang(2056);
  Label29.Caption := Gettextlang(2057);
  Label28.Caption := Gettextlang(2057);
  cbShoPReview.Caption := Gettextlang(2425);
  ERoundAmount.Text :=  FloatToStr(POSRoundAmount);
  CBWeightDishConnected.Checked := POSWeightDishConnected;
  CBWeightDishCom.Text :=POSWeightDishPORT ;
  {TabSheet3
  TabSheet4   }
    Caption := Gettextlang(1409); //POS Setup
    OkCancel(BtnOk,BtnCancel);
    BtnCancel.Caption := Gettextlang(169);
    CheckBox12.Caption := Gettextlang(1363);// Use Serial number Tracking
    Label15.Caption := Gettextlang(1364);// Default Payment Method
    Label2.Caption := Gettextlang(1365);// Float Limit
    CheckBox1.Caption := Gettextlang(1366);// Allow Cash Float
    GroupBox3.Caption := Gettextlang(1366);// General
    tab1.Caption := Gettextlang(1368);// Settings
    tab2.Caption := Gettextlang(1369);// Entry
    tab3.Caption := Gettextlang(1370);// Peripherals
    tab4.Caption := Gettextlang(986);// Printer
    GroupBox4.Caption := Gettextlang(1371);// Entry Screen
    GroupBox1.Caption := Gettextlang(1372);// Ledger
    GroupBox2.Caption := Gettextlang(38);// Documents
    CheckBox8.Caption := Gettextlang(1373);// Print Customer Details
    CheckBox9.Caption := Gettextlang(1374);// Print Delivery Address
    CheckBox13.Caption := Gettextlang(1375);// Print Payment Details
    Label6.Caption := Gettextlang(1376);// Sales Batch Entry
    Label21.Caption := Gettextlang(1377);// Receipts Batch Entry
    Label3.Caption := Gettextlang(1378);// Payment Description Entry
    Label7.Caption := Gettextlang(1379);// Cash Sales Account
    Label8.Caption := Gettextlang(1380);// Cash Transfer Account
    Label9.Caption := Gettextlang(1381);// Till Account
    Label10.Caption := Gettextlang(1382);// Max Cash in Till
    Label1.Caption := Gettextlang(1383);// Next Number
    RadioButton1.Caption := Gettextlang(1384);// &Use POS Messages
    RadioButton2.Caption := Gettextlang(1410);// &Use Invoice Messages
    CheckBox2.Caption := Gettextlang(1385);// Drawer Connected
    CheckBox10.Caption := Gettextlang(1386);// Barcode Scanner Connected
    CheckBox3.Caption := Gettextlang(1172);// Cheques
    CheckBox4.Caption := Gettextlang(1170);// Credit Cards
    CheckBox5.Caption := Gettextlang(1173);// Vouchers
    Button1.Caption := Gettextlang(1387);// &Test Drawer
    gbdParam.Caption := Gettextlang(1388);// Serial Port Parameters
    gbdPort.Caption := Gettextlang(1389);// Port
    gbdOpen.Caption := Gettextlang(1390);// Open Cash Drawer For
    rbDwrPPort.Caption := Gettextlang(1391);// Parallel Port
    rbDwrSPort.Caption := Gettextlang(1392);// Serial Port
    Label17.Caption := Gettextlang(1393);// Baud Rate
    Label18.Caption := Gettextlang(1394);// Data Bits
    Label19.Caption := Gettextlang(1395);// Stop Bits
    Label20.Caption := Gettextlang(1396);// Parity
    Label16.Caption := Gettextlang(1397);// Port Number
    cbprnComf.Caption := Gettextlang(1398);// Comfirm printing
    CheckBox6.Caption := Gettextlang(1399);// Use First Printer
    CheckBox7.Caption := Gettextlang(1400);// Use Second Printer
    TabSheet2.Caption := Gettextlang(1401);// Second Printer
    TabSheet1.Caption := Gettextlang(1402);// First Printer
    Button2.Caption := Gettextlang(1403);// &Test Printers
    Label4.Caption := Gettextlang(323);// Paper Type
    Label14.Caption := Gettextlang(323);// Paper Type
   // GroupBox12.Caption := Gettextlang(1404);// Printer Control Code
   // GroupBox6.Caption := Gettextlang(1404);// Printer Control Code
    GroupBox9.Caption := Gettextlang(1411);// Printers
    TabSheet4.Caption :=  Gettextlang(2935);// Pol display
    GroupBox8.Caption := Gettextlang(1388);// Serial Port Parameters
    CheckBox14.Caption :=  Gettextlang(2936);//  Pol DIsplay Connected
    Edit16.Text :=  Gettextlang(2937);// Can you see this ??
    CBPollDiplayType.Items[0] := Gettextlang(2938);//Default pos pol
    CBPollDiplayType.Items[1] := Gettextlang(2939);//2 X 20 chars pos pol

    RadioButton5.Caption := Gettextlang(1391);// Parallel Port
    RadioButton6.Caption := Gettextlang(1392);// Serial Port
    Label23.Caption := Gettextlang(1393);// Baud Rate
    Label24.Caption := Gettextlang(1394);// Data Bits
    Label25.Caption := Gettextlang(1395);// Stop Bits
    Label26.Caption := Gettextlang(1396);// Parity
    Label22.Caption := Gettextlang(1397);// Port Number
    GroupBox7.Caption := Gettextlang(1389);// Port
    TSWeightDish.Caption := Gettextlang(2940);// Weightdish
    CBWeightDishConnected.Caption := Gettextlang(2941);//Weightdish connected
    Label32.Caption :=  Gettextlang(1397);// Port Number
    Label33.Caption :=  Gettextlang(2942);// Return value from weight dish
    BWeightDishtest.Caption :=  Gettextlang(2943);// Test
    Button3.Caption :=  Gettextlang(2943);//Test
    Button1.Caption :=  Gettextlang(2943);//Test

CBFastSwitchSalesMan.Caption :=  Gettextlang(2945);//Fast switch sales man
Label31.Caption :=  Gettextlang(2946);//Round pos end amount
CBShowQtyOnhand.Caption :=  Gettextlang(2947);//Show qty on hand
LEDiscountPassword.Caption :=  Gettextlang(2948);//Discount PW
CBPasswordDiscount.Caption :=  Gettextlang(2949);//Use password for discount
CBUseDebtorPricelevel.Caption :=  Gettextlang(2950);//Use debtor sellingprice
TabSheet3.Caption :=  Gettextlang(2951);//Drawer

Label35.Caption := Gettextlang(1172);

MainPageControl.ActivePage := tab1 ;
EAutoLogoutTimer.Text := DMTCCoreLink.ReadSysParam('POSAUTOLOGOUT',0,0);

end;

procedure TfmPosSetup.CheckBox2Click(Sender: TObject);
begin
  gbdPort.Enabled:= CheckBox2.Checked;
  gbdParam.Enabled:= CheckBox2.Checked;
  gbdOpen.Enabled:= CheckBox2.Checked;
end;

procedure TfmPosSetup.edtSaleSACCOUNTEnter(Sender: TObject);
begin
  edtSaleSACCOUNT.Color := clHighlight;
  ReturnLookup:=CallLookup(edtSaleSACCOUNT.Text, 3,DftSaleSACCOUNT);
  if (ReturnLookup <> 'ESC') AND (ReturnLookup <> 'NEW') then
  begin
    edtSaleSACCOUNT.Text := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(ReturnID);
    DftSaleSACCOUNT:= ReturnID;
  end;
  edtSaleSACCOUNT.Color := clWindow;
  Label11.Caption:=ReturnLookupDesc;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmPosSetup.edtPaidoutAccountEnter(Sender: TObject);
begin
  edtPaidoutAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(edtPaidoutAccount.Text, 1,PaidOutID);
  if (ReturnLookup <> 'ESC') AND (ReturnLookup <> 'NEW') then
  begin
    edtPaidoutAccount.Text := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(ReturnID);
    PaidOutID := ReturnID;
  end;
  edtPaidoutAccount.Color := clWindow;
  Label12.Caption:=ReturnLookupDesc;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmPosSetup.edtCashCtrlAccountEnter(Sender: TObject);
begin
  edtCashCtrlAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(edtCashCtrlAccount.Text, 1,TillAccountID);
  if (ReturnLookup <> 'ESC') AND (ReturnLookup <> 'NEW') then
  begin
    edtCashCtrlAccount.Text := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(ReturnID);
    TillAccountID:=ReturnID;
  end;
  edtCashCtrlAccount.Color := clWindow;
  Label13.Caption:=ReturnLookupDesc;  
  SelectNext(ActiveControl, True, True);
end;

procedure TfmPosSetup.FormCreate(Sender: TObject);
begin
  Printer:=TPrinter.Create;
end;

procedure TfmPosSetup.Button2Click(Sender: TObject);
begin
  ApplyChanges;
  TestPrintes;
end;

procedure TfmPosSetup.RadioButton2Click(Sender: TObject);
begin
  Edit9.Visible:=RadioButton1.Checked;
  Edit10.Visible:=RadioButton1.Checked;
  Edit11.Visible:=RadioButton1.Checked;
end;

procedure TfmPosSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Printer.Free ;
  CloseSysParams;
end;

procedure TfmPosSetup.Button1Click(Sender: TObject);
begin
  ApplyChanges;
  OpenDrowerNow;
end;

Procedure TfmPosSetup.SetPolCfg;
begin
  if Edit15.Text='' then Edit15.Text:='N';
  PollDispl.Name := Copy(Trim(Edit1.Text),1,1) ;
  PollDispl.parity := Edit15.Text[1];
  PollDispl.baud := StrToIntDef(Edit2.Text,9600);
  PollDispl.data := StrToIntDef(Edit3.Text,8);
  PollDispl.stop := StrToIntDef(Edit5.Text,1);
  PollDispl.Connected := CheckBox14.Checked;
  PollDispl.IsComPort := RadioButton6.Checked ;

  if Edit14.Text='' then Edit14.Text:='N';
  CashDrawer.Name := Copy(Trim(Edit7.Text),1,1) ;
  CashDrawer.parity := Edit14.Text[1];
  CashDrawer.baud := StrToIntDef(Edit8.Text,9600);
  CashDrawer.data := StrToIntDef(Edit12.Text,8);
  CashDrawer.stop := StrToIntDef(Edit13.Text,1);
  CashDrawer.Connected := CheckBox2.Checked;
  CashDrawer.ControlStr := edtDrawerCtr.Text;
  CashDrawer.IsComPort := rbDwrSPort.Checked;
end;

procedure TfmPosSetup.Button3Click(Sender: TObject);
begin
  ApplyChanges;
  SetPolCfg ;
  PrintOnPoll(0,'', #13+StringOfChar(' ',40)+#13);
  PrintOnPoll(0,'',Edit16.Text+#13);
end;

procedure TfmPosSetup.PageControl2Change(Sender: TObject);
begin
 if assigned(acomport) then
   FreeAndNil(acomport);
 if PageControl2.ActivePage = TSWeightDish then
   begin
       aComPort := XRoutines.TComPort.create(self) ;
       aComPort.ReceiveCallBack :=  myReceiveWeightDishProc ;
   end;
end;

procedure TfmPosSetup.BWeightDishtestClick(Sender: TObject);
begin
aComPort.Port := CBWeightDishCom.Text ;
aComPort.Open ;
end;

procedure TfmPosSetup.edtChequeCtrlAccountEnter(Sender: TObject);
begin
  edtChequeCtrlAccount.Color := clHighlight;
  ReturnLookup:=CallLookup( edtChequeCtrlAccount.Text, 1);
  if (ReturnLookup <> 'ESC') AND (ReturnLookup <> 'NEW') then
  begin
    edtChequeCtrlAccount.Text := TDataBaseRoutines.GetAccountCodeWithDashFromAccountId(ReturnID);
    ChequeID := ReturnID;
  end;
  edtChequeCtrlAccount.Color := clWindow;
  LedtChequeCtrlAccount.Caption:=ReturnLookupDesc;
  SelectNext(ActiveControl, True, True);
end;

end.
