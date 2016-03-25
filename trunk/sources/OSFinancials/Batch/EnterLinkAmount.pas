(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit EnterLinkAmount;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,Math, Buttons;

type
  TfmEnterLinkAmount = class(TForm)
    ButtonPanel: TPanel;
    Label1: TLabel;
    edtAmount: TEdit;
    BtnOk: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    { Private declarations }
  public
    AOpenDebitAmount ,
    AOpenCreditAmount,
    ADebitAmount ,
    ACreditAmount : Double ;
    { Public declarations }
  end;

var
  fmEnterLinkAmount: TfmEnterLinkAmount;
  vOk:Boolean;
implementation

uses Main, OpenLink, Database, LanguageChoice, GlobalFunctions,
  DatabaseAccess, XRoutines, UDMTCCoreLink;

{$R *.DFM}

procedure TfmEnterLinkAmount.FormKeyPress(Sender: TObject; var Key: Char);
begin
 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.
   if key = '.' then
     if sender = edtAmount then
    key :=  DecimalSeparator ;
  if (Key = #13) then
  begin
    Vok:=True;
    Close;
    Key := #0;
  end;
  if (Key = #27) then
  begin
    Vok:=False;
    Close;
    Key := #0;
  end;
end;

procedure TfmEnterLinkAmount.btnOkClick(Sender: TObject);
begin
  edtAmount.Text:=FloatToStrF(ABS(Str2Float(edtAmount.Text)), ffFixed, 18, 2);
  Vok:=True;
  Close;
end;

procedure TfmEnterLinkAmount.FormShow(Sender: TObject);
Var
  Tmp,AccMin:Real;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');


  Vok:=False;

//  if LinkMode Then
//    AccMin:=Min(Abs(dmDatabase.wwqryOpenDebitsFOutstandingAmount.Value),Abs(dmDatabase.wwqryOpenCreditsFOutstandingAmount.Value))
//  else
//  begin
//    AccMin:=Abs(dmDatabase.wwqryOpenDebitsFAmount.Value)-Abs(dmDatabase.wwqryOpenDebitsFOutstandingAmount.Value);
//    Tmp:=Abs(dmDatabase.wwqryOpenCreditsFAmount.Value)-Abs(dmDatabase.wwqryOpenCreditsFOutstandingAmount.Value);
//    AccMin:=Min(Tmp,AccMin);
//  end;
  fmEnterLinkAmount.edtAmount.Text :=FloatToStrF(LinkAmount, ffFixed, 18, 2);
  Caption := GetTextLang(2961) ; // Enter amount to link
  Label1.Caption := GetTextLang(1978) ; // Enter amount to link
  BtnOk.Caption := GetTextLang(167) ; // OK
end;

procedure TfmEnterLinkAmount.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  Tmp,AccMin:Real;
begin
  if not Vok Then
  begin
    LinkAmount:=0;
    Exit;
  end;
  if LinkMode Then

  begin
    AccMin:=FixAmount(Min(Abs(FixAmount(AOpenDebitAmount,2)),Abs(FixAmount(AOpenCreditAmount,2))));
    Tmp:=FixAmount(Str2Float(edtAmount.Text));
  end
  else
  begin
    AccMin:=Abs(FixAmount(ADebitAmount,2))-Abs(FixAmount(AOpenDebitAmount,2));
    Tmp:=Abs(FixAmount(ACreditAmount,2))-Abs(FixAmount(AOpenCreditAmount,2));
    AccMin:=FixAmount(Min(Tmp,AccMin),2);
    Tmp:=Str2Float(edtAmount.Text);
  end;
  if (tmp>AccMin) And (AccMin<>0) then
  begin
      OSFMessageDlg(GetTextLang(470){'The link amount has to be less than or equal to } + '   ' +FloatToStrF(AccMin, ffFixed, 18, 2), mterror, [mbok], 0);
      edtAmount.SetFocus;
      Action := caNone;
      Exit;
  end;
  LinkAmount := StrToFloat(edtAmount.Text);
  Close;

end;

end.
