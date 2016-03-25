unit PosInvoiceInfo;

interface

uses
  TcVariables,Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask,    ExtCtrls, StdCtrls, ComCtrls,
  Buttons,TcashClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxButtonEdit;

type
  TfmPosInvoiceInfo = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image2: TImage;
    Label14: TLabel;
    Shape1: TShape;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Shape2: TShape;
    Shape3: TShape;
    Label1: TLabel;
    lblCustName: TLabel;
    Label15: TLabel;
    StatusBar1: TStatusBar;
    Label19: TLabel;
    Shape4: TShape;
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    lblPostBal: TStaticText;
    ShdlblPostBal: TLabel;
    lblAvailable: TStaticText;
    ShdlblAvailable: TLabel;
    lblCredLimit: TStaticText;
    ShdlblCredLimit: TLabel;
    Shape5: TShape;
    Edit8: TEdit;
    CBCountry: TComboBox;
    CBDelCountry: TComboBox;
    SpeedButton1: TSpeedButton;
    edtCustCode: TcxButtonEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtCustCodeDropDown(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FID:Integer;
  public
    { Public declarations }
    pt:Pointer;
    procedure ObjToGui(Debtor:TDtAccountRec) ;
  end;
  Procedure SelectPosCustomer(Var Debtor:TDtAccountRec;Const aType:Byte;JustFill:boolean = false;DoDebScreen : boolean = False);
  Procedure ChangeCustomer(Var Debtor:TDtAccountRec);

var
  fmPosInvoiceInfo: TfmPosInvoiceInfo;

implementation

uses GlobalFunctions, Main, PosRoutines, DatabaseAccess, Debtor;

{$R *.dfm}
Var
  scrType:PByte;


Procedure ChangeCustomer(Var Debtor:TDtAccountRec);
Var
  V:Byte;
begin
  V:=1;
  SelectPosCustomer(Debtor,V);
  //fmPosInvoiceInfo.edtCustCodeDropDown(Application);
end;

Procedure SelectPosCustomer(Var Debtor:TDtAccountRec;Const aType:Byte;JustFill:boolean = false;DoDebScreen : boolean = False);
begin
  scrType:= @aType;
  fmPosInvoiceInfo.FID:= Debtor.WaccountID;
  fmPosInvoiceInfo.pt:= @Debtor;
  fmPosInvoiceInfo.ObjToGui(Debtor) ;
  if not justfill then
  begin
  if DoDebScreen then
    begin
       fmPosInvoiceInfo.Show ;
       fmPosInvoiceInfo.SpeedButton1Click(nil);
       fmPosInvoiceInfo.Hide ;
    end else
  fmPosInvoiceInfo.ShowModal;


  Debtor.SACCOUNTCODE:=fmPosInvoiceInfo.edtCustCode.Text;
  Debtor.SPostal1 := fmPosInvoiceInfo.Edit1.Text;
  Debtor.SPostal2 := fmPosInvoiceInfo.Edit2.Text;
  Debtor.SPostal3 := fmPosInvoiceInfo.Edit3.Text;
  Debtor.SPostalCode := fmPosInvoiceInfo.Edit4.Text;
  Debtor.SPostCounty := fmPosInvoiceInfo.CBCountry.Text;

  Debtor.SDelAddress1 := fmPosInvoiceInfo.Edit5.Text;
  Debtor.SDelAddress2 := fmPosInvoiceInfo.Edit6.Text ;
  Debtor.SDelAddress3 := fmPosInvoiceInfo.Edit7.Text;
  Debtor.SDelCode := fmPosInvoiceInfo.Edit8.Text;
  Debtor.SDelCounty := fmPosInvoiceInfo.CBDelCountry.Text;
  Debtor.SMessage1 := fmPosInvoiceInfo.Edit9.Text;
  Debtor.SMessage2 := fmPosInvoiceInfo.Edit10.Text;
  Debtor.SMessage3 := fmPosInvoiceInfo.Edit11.Text;
  end;

end;

procedure TfmPosInvoiceInfo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Case Key of
  #27:begin
        Key:=#0;
        Close;
      end;

  end;
end;





procedure TfmPosInvoiceInfo.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  Case Key of
  #13:begin
       Key:=#0;
       if Sender is TEdit then
         if SameText(TEdit(Sender).Name,'Edit8') And (scrType^=1) then
          Close;
       SelectNext(ActiveControl,true,true);
    end;
  end;
end;

procedure TfmPosInvoiceInfo.FormShow(Sender: TObject);
begin
  if edtCustCode.Text='' then edtCustCode.SetFocus;
  StatusBar1.SimpleText:= getTextLang(1347);
    Caption := GetTextLang(1347); // Select Customer
    Label1.Caption := GetTextLang(1346);// Customer
    Label14.Caption := GetTextLang(235);// Postal Address
    Label15.Caption := GetTextLang(199);//Delivery Address
    Label19.Caption := GetTextLang(239);//Message

    Label16.Caption := GetTextLang(194); //current balans
    Label18.Caption := GetTextLang(236); //Availeble
    Label17.Caption := GetTextLang(192); //Creditlimit
end;

procedure TfmPosInvoiceInfo.edtCustCodeDropDown(Sender: TObject);
Var
  tmp:String;
begin
  edtCustCode.Style.Color := clHighlight;
  tmp:=CallLookup(edtCustCode.Text, 3);


  if (ReturnID<>TDtAccountRec(Pt^).WaccountID) and (ReturnID <> 0) then
  begin
    TDtAccountRec(Pt^).WaccountID:=ReturnID;
    LoadDebtorInfo(TDtAccountRec(Pt^));
    ObjToGui(TDtAccountRec(pt^));
  end;


  
  edtCustCode.Style.Color := clWindow;
  Repaint;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmPosInvoiceInfo.FormCreate(Sender: TObject);
begin
   FillStringListWithSelect(CBCountry.Items,'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');
  FillStringListWithSelect(CBDelCountry.Items,'select COUNTRIES_ID,COUNTRIES_NAME from COUNTRIES');
end;

procedure TfmPosInvoiceInfo.ObjToGui(Debtor:TDtAccountRec);
begin
  Edit1.Text:=Debtor.SPostal1;
  Edit2.Text:=Debtor.SPostal2;
  Edit3.Text:=Debtor.SPostal3;
  Edit4.Text:=Debtor.SPostalCode;
  CBCountry.ItemIndex := fmPosInvoiceInfo.CBCountry.Items.IndexOf(Debtor.SPostCounty);

  Edit5.Text:=Debtor.SDelAddress1;
  Edit6.Text:=Debtor.SDelAddress2;
  Edit7.Text:=Debtor.SDelAddress3;
  Edit8.Text:=Debtor.SDelCode;
  CBDelCountry.ItemIndex := fmPosInvoiceInfo.CBDelCountry.Items.IndexOf(Debtor.SDelCounty);

  Edit9.Text:=Debtor.SMessage1;
  Edit10.Text:=Debtor.SMessage2;
  Edit11.Text:=Debtor.SMessage3;

  lblCustName.Caption:=Debtor.SDescription;
  edtCustCode.Text := Debtor.SACCOUNTCODE;
  lblPostBal.Caption := FormatFloat('0.00',Debtor.FCurrentBalance);
  lblAvailable.Caption := FormatFloat('0.00',Debtor.FCreditLimit - Debtor.FCurrentBalance);
  lblCredLimit.Caption := FormatFloat('0.00',Debtor.FCreditLimit);
end;

procedure TfmPosInvoiceInfo.SpeedButton1Click(Sender: TObject);
var
  fmDebtor: TfmDebtor;
begin
   fmDebtor := TfmDebtor.Create(self);
    try
      fmDebtor.UseCreditor:=False;
      fmDebtor.AsFindScreen(True);
      SetUpForm(fmDebtor);
      if fmDebtor.ShowModal <> mrok then
        exit ;
      if fmDebtor.QDebtorCreditor.IsEmpty then exit ;
        begin
         TDtAccountRec(Pt^).WaccountID:=fmDebtor.QDebtorCreditorWAccountID.AsInteger;
         LoadDebtorInfo(TDtAccountRec(Pt^));
         ObjToGui(TDtAccountRec(pt^));
        end;
    finally
      FreeAndNil(fmDebtor);
    end;
end;


procedure TfmPosInvoiceInfo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
     begin
        edtCustCodeDropDown(self);

     end;
end;

procedure TfmPosInvoiceInfo.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
edtCustCodeDropDown(self);
end;

end.

