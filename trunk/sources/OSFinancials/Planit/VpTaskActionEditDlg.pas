unit VpTaskActionEditDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormTaskEditDlg = class(TForm)
    CBType: TComboBox;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    LType: TLabel;
    EAccount: TEdit;
    LEAccount: TLabel;
    CBGroup: TComboBox;
    LCBQuotes: TLabel;
    CBQuotes: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure EAccountEnter(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure InitInvoiceList ;
    procedure InitAccountText ;
    { Public declarations }
  end;



implementation

uses Database, Lookup,DatabaseAccess,TCVariables,GlobalFunctions;

{$R *.dfm}

procedure TFormTaskEditDlg.FormShow(Sender: TObject);
begin
//EAccount.Text := GetAccountCode(dmDatabase.QTaskActionAccountId.AsInteger);
EAccount.Tag := dmDatabase.QTaskActionAccountId.AsInteger ;
if EAccount.Tag = 0 then EAccount.tag := -1 ;
InitAccountText ;
FillStringsWithReportingGroups(CBGroup.Items,22);
CBGroup.ItemIndex := CBGroup.Items.IndexOfObject(TObject(dmDatabase.QTaskActionWGroupId.AsInteger)) ;


CBType.ItemIndex := dmDatabase.QTaskActionWTypeId.AsInteger ;
CBTypeChange(self);
InitInvoiceList ;

CBQuotes.ItemIndex := CBQuotes.Items.IndexOfObject(TObject(dmDatabase.QTaskActionInvoiceID.AsInteger)) ;
caption := Gettextlang(2883);
LType.caption := Gettextlang(1079);
LCBQuotes.caption := Gettextlang(38);
end;

procedure TFormTaskEditDlg.CancelBtnClick(Sender: TObject);
begin
dmDatabase.QTaskAction.Cancel ;
ModalResult := mrcancel ;
end;

procedure TFormTaskEditDlg.EAccountEnter(Sender: TObject);
begin
fmLookup.IsShowForm := false ;
CallLookup(EAccount.Text, 3);
EAccount.Tag := ReturnID ;
if EAccount.Tag = 0 then EAccount.tag := -1 ;
InitAccountText ;
InitInvoiceList ;
CBQuotes.SetFocus ; 
end;

procedure TFormTaskEditDlg.CBTypeChange(Sender: TObject);
begin
 EAccount.Visible := false ;
 lEAccount.Visible := false ;
 LCBQuotes.Visible := false ;
 CBQuotes.Visible := false ;
 CBGroup.Visible := false ;

 if CBType.ItemIndex = -1 then exit ;

 case TActionType(CBType.ItemIndex) of
 atCopyInvoice : begin
                   LEAccount.Caption := Gettextlang(31) ;
                   EAccount.Visible := True ;
                   lEAccount.Visible := True ;
                   CBQuotes.Visible := True ;
                   LCBQuotes.Visible := True ;
                 end ;
 acCopyInvoiceToGroup : begin
                         
                         LEAccount.Caption :=  GetGroupDisplayName(rgtDebtor1) ;
                         lEAccount.Visible := True ;
                         CBGroup.Visible := True ;
                         CBQuotes.Visible := True ;
                         LCBQuotes.Visible := True ;
                        end;

 end ;
OkCancel(OKBtn,CancelBtn);
end;

procedure TFormTaskEditDlg.OKBtnClick(Sender: TObject);
begin
dmDatabase.QTaskActionAccountId.AsInteger := EAccount.Tag ;
if CBGroup.ItemIndex <> -1 then
dmDatabase.QTaskActionWGroupId.AsInteger := Integer(CBGroup.Items.Objects[CBGroup.ItemIndex])
else
dmDatabase.QTaskActionWGroupId.AsInteger := 0 ;
dmDatabase.QTaskActionWTypeId.AsInteger := CBType.ItemIndex ;

if CBQuotes.ItemIndex <> -1 then
dmDatabase.QTaskActionInvoiceID.AsInteger := Integer(CBQuotes.Items.Objects[CBQuotes.ItemIndex])
else
dmDatabase.QTaskActionInvoiceID.AsInteger := 0 ;
dmDatabase.QTaskAction.Post ;
ModalResult := mrok ;

end;

procedure TFormTaskEditDlg.InitInvoiceList;
var
 LastId : Integer ;
begin
lastID := -1 ;
if CBQuotes.Itemindex <> -1 then
LastId :=  Integer(CBQuotes.Items.Objects[CBQuotes.ItemIndex]) ;


CBQuotes.Items.Clear ;
dmDatabase.qGen.SQL.Text := 'Select WDocId,SDocNo,SReference from DocHead where WTypeID = 14' ;
dmDatabase.qGen.open ;
while not dmDatabase.qGen.eof do
begin
CBQuotes.Items.AddObject(dmDatabase.qGen.Fields[1].AsString+' | ' + dmDatabase.qGen.Fields[2].AsString ,TObject(dmDatabase.qGen.Fields[0].AsInteger));
dmDatabase.qGen.Next ;
end;
dmDatabase.qGen.SQL.Text := 'Select WDocId,SDocNo,SReference from DocHead where WAccountId = ' + IntTOStr(EAccount.Tag) ;
dmDatabase.qGen.open ;
while not dmDatabase.qGen.eof do
begin
CBQuotes.Items.AddObject(dmDatabase.qGen.Fields[1].AsString+' | ' + dmDatabase.qGen.Fields[2].AsString,TObject(dmDatabase.qGen.Fields[0].AsInteger));
dmDatabase.qGen.Next ;
end;
dmDatabase.qGen.close ;
if lastID <> -1 then
   CBQuotes.ItemIndex := CBQuotes.Items.IndexOfObject(TObject(lastID)) ;

end;

procedure TFormTaskEditDlg.InitAccountText;
var
 Code,Desc : String ;
begin
GetAccountCodeDesc(EAccount.Tag,Code,Desc);
EAccount.Text :=  Code +' | ' +  Desc ;
end;

end.
