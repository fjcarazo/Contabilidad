unit PaymentType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TfmPaymentType = class(TForm)
    DBGrid1: TDBGrid;
    ButtonPanel: TPanel;
    edtNewPaymentType: TEdit;
    sbAdd: TSpeedButton;
    sbDelete: TSpeedButton;
    BtnClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbAddClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure edtNewPaymentTypeKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPaymentType: TfmPaymentType;

implementation

Uses
  Database, Main, HtmlHelpAPI, UDMTCCoreLink;

{$R *.DFM}

procedure TfmPaymentType.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnClose.Glyph,'Ok');


  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID = 30';//Payment Type
  dmDatabase.tblGroups.Filtered := True;
  edtNewPaymentType.Text := '';
  edtNewPaymentType.SetFocus;
end;

procedure TfmPaymentType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Close;
end;

procedure TfmPaymentType.sbAddClick(Sender: TObject);
begin
  if edtNewPaymentType.Text <> '' then
  begin
    dmDatabase.tblGroups.Insert;
    dmDatabase.tblGroupsSDescription.Value := edtNewPaymentType.Text;
    dmDatabase.tblGroupsWGroupTypeID.Value := 30;//Payment Type
    dmDatabase.tblGroups.Post;
    edtNewPaymentType.Text := '';
  end
  else
    edtNewPaymentType.SetFocus;
end;

procedure TfmPaymentType.sbDeleteClick(Sender: TObject);
begin
  dmDatabase.tblGroups.Delete;
end;

procedure TfmPaymentType.edtNewPaymentTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    sbAddClick(Sender);
    Key := #0;
  end;
  if Key = #27 then
  begin
    edtNewPaymentType.Text := '';
    Key := #0;
  end;
end;

procedure TfmPaymentType.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPaymentType.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlHelpShowTopic('sPaymentTypes.htm');
             key := 0;

        end;
end;

end.
