unit USearchTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,TcashClasses, StdCtrls, ComCtrls, Buttons;

type
  TFLookupTrans = class(TForm)
    BitBtn1: TBitBtn;
    lvITems: TListView;
    EFindText: TEdit;
    Bok: TButton;
    BAddTrn: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure lvITemsDblClick(Sender: TObject);
    procedure EFindTextKeyPress(Sender: TObject; var Key: Char);
    procedure lvITemsKeyPress(Sender: TObject; var Key: Char);
    procedure BAddTrnClick(Sender: TObject);
  private

    { Private declarations }
  public
   function GetselectedId : Integer ;
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink,DBAccess , Uni;



{$R *.dfm}

procedure TFLookupTrans.BitBtn1Click(Sender: TObject);
var
 i :  integer ;
begin
  lvITems.Clear ;
  for i := 0 to DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.Count -1 do
      begin
         if  (pos(UpperCase(EFindText.Text),UpperCase(DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.translation[i].Text)) > 0) or (EFindText.Text = '') then
            begin
               with lvITems.items.Add do
                 begin
                    Caption := IntToStr(DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.translation[i].IndexID) ;
                    SubItems.Add(DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.translation[i].Text) ;
                    SubItems.Add( DMTCCoreLink.TheGlobalDataObject.DefaultLanguage.GetTextLang(DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.translation[i].IndexID)) ;
                  //  Data :=  DMTCCoreLink.TheGlobalDataObject.CurrentLanguage.translation[i] ;
                 end;
            end ;
      end;
end;

function TFLookupTrans.GetselectedId: Integer;
begin
 result := 0 ;
 if lvITems.Selected <> nil then
    begin
      result := StrToIntDef(lvITems.Selected.Caption,0) ;
    end;
end;

procedure TFLookupTrans.lvITemsDblClick(Sender: TObject);
begin
 self.close ;
end;

procedure TFLookupTrans.EFindTextKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
    BitBtn1Click(self);
end;

procedure TFLookupTrans.lvITemsKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
     self.close ;
end;

procedure TFLookupTrans.BAddTrnClick(Sender: TObject);
var Retid : Integer ;
begin
   Retid := DMTCCoreLink.GetAddTextNum(EFindText.Text) ;

  lvITems.Clear ;
   with lvITems.items.Add do
         begin
          Caption := IntToStr(Retid) ;
          SubItems.Add(EFindText.Text) ;
          SubItems.Add( DMTCCoreLink.TheGlobalDataObject.DefaultLanguage.GetTextLang(Retid)) ;
         // Data :=  aTranslationCollectionItem ;
          Selected := true;
         end;
 
end;

end.

