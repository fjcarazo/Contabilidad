(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SelectAccountType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxListView;

type
  TfrmSelectAccountType = class(TForm)
    LstAccountView: TcxListView;
    ButtonPanel: TPanel;
    Panel1: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure LstAccountViewKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure LstAccountViewCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure LstAccountViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure LstAccountViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
   JustSelect : Boolean;
   { Public declarations }
  end;

var
  frmSelectAccountType: TfrmSelectAccountType;
  myResult:integer;

implementation

uses GlobalFunctions, Xroutines,Main, tcVariables,TransfertTrans,Databaseaccess,
     Debtor, UGeneralEditAccount, UDMTCCoreLink;

{$R *.DFM}





procedure TfrmSelectAccountType.FormShow(Sender: TObject);
Var
  vItem:TListItem;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


  with LstAccountView do
  begin
    vItem:=Items.Add;
    vItem.Caption:=  gettextlang(31); //'Debtor';
    vItem.SubItems.Add(Bool2Str(CanUserAccesSACCOUNT(CurrentUser,1)));
    vItem:=Items.Add;
    vItem.Caption:= gettextlang(30); //'Creditors';
    vItem.SubItems.Add(Bool2Str(CanUserAccesSACCOUNT(CurrentUser,2)));
    vItem:=Items.Add;
    vItem.Caption:=gettextlang(29); //'Bank Account';
    vItem.SubItems.Add(Bool2Str(CanUserAccesSACCOUNT(CurrentUser,3)));
    vItem:=Items.Add;
    vItem.Caption:=gettextlang(33); //'Tax Account';
    vItem.SubItems.Add(Bool2Str(CanUserAccesSACCOUNT(CurrentUser,4)));
    // GL accounts
    vItem:=Items.Add;
    vItem.Caption:= gettextlang(32);
    vItem.SubItems.Add(Bool2Str(CanUserAccesSACCOUNT(CurrentUser,0)));

    // done : Pieter just check the bounds
    if ( MyResult > -1 )and (MyResult < LstAccountView.Items.Count) then
       LstAccountView.Items[MyResult].Selected:=True
      else LstAccountView.Items[0].Selected:=True;
  end;
 BtnOk.caption := GetTextLang(167);
 BtnCancel.caption := GetTextLang(168);
 self.caption := GetTextLang(1935);
end;

procedure TfrmSelectAccountType.LstAccountViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    BtnOkClick(Sender);
  end;
  if Key=#27 then
  begin
    BtnCancelClick(Sender);
  end;
end;

procedure TfrmSelectAccountType.BtnOkClick(Sender: TObject);
var
 aGeneralEditAccount : TGeneralEditAccount ;
  fmDebtor: TfmDebtor;
begin
  If LstAccountView.Selected.Index>=0 then
    MyResult:=LstAccountView.Selected.Index +1 
  Else
    MyResult:=-1;
  // letsmimic the edit from here the click to the main form make strange thing happen like disapering
  // lists etc.
  if JustSelect then
     begin
     close;
     exit ;
     end;
   case  MyResult of
   1: begin

        fmDebtor := TfmDebtor.Create(self);
        try
        fmDebtor.UseCreditor:=False;
        SetUpForm(fmDebtor);
        fmDebtor.ShowModal;
        tcvariables.LastSelectedAccount := fmDebtor.QDebtorCreditorWAccountID.AsInteger ;
        finally
        FreeAndNil(fmDebtor);
        end;
      end;
   2: begin
        
        fmDebtor := TfmDebtor.Create(self);
        try
        SetUpForm(fmDebtor);
        fmDebtor.UseCreditor:=True;
        fmDebtor.ShowModal;
        tcvariables.LastSelectedAccount := fmDebtor.QDebtorCreditorWAccountID.AsInteger ;
        finally
        FreeAndNil(fmDebtor);
        end;
      end;
   3,4,5 : Begin
              aGeneralEditAccount := TGeneralEditAccount.Create(self);
              try
                aGeneralEditAccount.ShowModal;
              finally
                FreeAndNil(aGeneralEditAccount);
              end;
           end;
  
   end;

  close;
end;

procedure TfrmSelectAccountType.BtnCancelClick(Sender: TObject);
begin
  MyResult:=-1;
  close;
end;

procedure TfrmSelectAccountType.LstAccountViewCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
   if Not Str2Bool(item.SubItems[0]) then
     Sender.Canvas.Font.Color:=ClGray;
end;

procedure TfrmSelectAccountType.LstAccountViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  btnOk.Enabled := Str2Bool(iTem.SubItems[0]);
end;

procedure TfrmSelectAccountType.LstAccountViewDblClick(Sender: TObject);
begin
BtnOkClick(self);
end;

end.
