unit AccountSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,   StdCtrls, Buttons, ExtCtrls,
  TcVariables,  Menus, ComCtrls, ToolWin, TcashClasses,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCheckBox, MemDS, DBAccess, Uni;

type

  TfrmAccountSelect = class(TForm)
    Panel1: TPanel;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    DataSource1: TDataSource;
    ToolBar1: TToolBar;
    tblProcess: TToolButton;
    SelectionPopUp: TPopupMenu;
    SelectAll1: TMenuItem;
    InvertSelection1: TMenuItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxGrid1DBTableView1BSelected: TcxGridDBColumn;
    QryAccountList: TUniQuery;
    QryAccountListWACCOUNTID: TIntegerField;
    QryAccountListSMAINACCOUNTCODE: TStringField;
    QryAccountListSSUBACCOUNTCODE: TStringField;
    QryAccountListWACCOUNTTYPEID: TIntegerField;
    QryAccountListSDESCRIPTION: TStringField;
    QryAccountListWREPORTINGGROUP1ID: TIntegerField;
    QryAccountListWREPORTINGGROUP2ID: TIntegerField;
    QryAccountListBSUBACCOUNTS: TSmallintField;
    QryAccountListBINCOMEEXPENSE: TSmallintField;
    QryAccountListSACCOUNTCODE: TStringField;
    QryAccountListDSYSDATE: TDateTimeField;
    QryAccountListWPROFILEID: TIntegerField;
    QryAccountListSELECTED: TIntegerField;
    deselectall1: TMenuItem;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure DeselectAll1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QryAccountListSACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure InvertSelection1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }



  end;

var
  frmAccountSelect: TfrmAccountSelect;

Function SelectAccounts(aUserID:Integer=0):Integer;

implementation

uses  DatabaseAccess, XRoutines, UDMTCCoreLink,
  UDmQuantumGridDefs,UosfResources;

{$R *.dfm}



Function SelectAccounts(aUserID:Integer=0):Integer;
begin
  frmAccountSelect:= TfrmAccountSelect.Create(Application);
  Try
    frmAccountSelect.QryAccountList.Close;
    frmAccountSelect.QryAccountList.Params[0].AsInteger := aUserID ;
    frmAccountSelect.QryAccountList.Open;
    Result := frmAccountSelect.ShowModal;
  Finally
    frmAccountSelect.Free;
  end;
end;

procedure TfrmAccountSelect.BtnCancelClick(Sender: TObject);
begin
  Close;
end;



procedure TfrmAccountSelect.BtnOkClick(Sender: TObject);
begin
  DMTCCoreLink.ExecSql('Delete from sysparams where WTypeID=7002 AND wUserID= '+IntToStr(QryAccountList.Params[0].AsInteger));

  QryAccountList.DisableControls ;

  try
  QryAccountList.first ;
  while not QryAccountList.eof do
  begin
    if QryAccountListSELECTED.AsInteger = 1  then
      DMTCCoreLink.WriteSysParam('B'+IntToStr(QryAccountListWACCOUNTID.AsInteger),'True',QryAccountList.Params[0].AsInteger,7002);
      QryAccountList.next ;
  end;
  finally
     QryAccountList.EnableControls ;
  end;
  Close;
end;

procedure TfrmAccountSelect.DeselectAll1Click(Sender: TObject);
begin
  QryAccountList.DisableControls;
  Try
   QryAccountList.First;
   While Not QryAccountList.Eof do begin
      QryAccountList.edit ;
      QryAccountListSELECTED.AsInteger := 0 ;
      QryAccountList.post ;
      QryAccountList.Next;
   end;
  Finally
    QryAccountList.Enablecontrols;
  end;
end;

procedure TfrmAccountSelect.FormDeactivate(Sender: TObject);
begin
 if self.Visible then
  close ;
end;

procedure TfrmAccountSelect.SelectAll1Click(Sender: TObject);
begin
  QryAccountList.DisableControls;
  Try
   QryAccountList.First;
   While Not QryAccountList.Eof do begin
      QryAccountList.edit ;
      QryAccountListSELECTED.AsInteger := 1 ;
      QryAccountList.post ;
      QryAccountList.Next;
   end;
  Finally
    QryAccountList.Enablecontrols;
  end;
end;

procedure TfrmAccountSelect.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

 
   self.Caption := GetTextLang(1904) ; // account to block
   cxGrid1DBTableView1SACCOUNTCODE.Caption := GetTextLang(2123) ;
   cxGrid1DBTableView1SDESCRIPTION.Caption := GetTextLang(1708) ;
   OkCancel(BtnOk,BtnCancel);
end;

procedure TfrmAccountSelect.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

 if vartostr(AViewInfo.GridRecord.Values[cxGrid1DBTableView1BSelected.Index]) = '1' then
    ACanvas.Font.Color:=clBlue;
end;

procedure TfrmAccountSelect.FormCreate(Sender: TObject);
begin
DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TfrmAccountSelect.QryAccountListSACCOUNTCODEGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);

Var
 MyAcc:String;
begin
  if  Sender.DataSet.FieldByName('BSubAccounts').AsInteger = 1 then
    MyAcc:=Copy(Sender.DataSet.FieldByName('SACCOUNTCODE').AsString,1,DMTCCoreLink.MainAccountLength)
  else
    MyAcc:=Sender.DataSet.FieldByName('SACCOUNTCODE').AsString;
  Case Sender.DataSet.FieldByName('WAccountTypeID').AsInteger of
  1:Text:='D'+MyAcc;
  2:Text:='C'+MyAcc;
  3:Text:='B'+MyAcc;
  4:Text:='T'+MyAcc;
  else
    Text:='G'+MyAcc;
  end;
end;

procedure TfrmAccountSelect.InvertSelection1Click(Sender: TObject);
begin
  QryAccountList.DisableControls;
  Try
   QryAccountList.First;
   While Not QryAccountList.Eof do begin
      QryAccountList.edit ;
      if QryAccountListSELECTED.AsInteger  =0 then
        QryAccountListSELECTED.AsInteger := 1
               else
         QryAccountListSELECTED.AsInteger := 0 ;
      QryAccountList.post ;
      QryAccountList.Next;
   end;
  Finally
    QryAccountList.Enablecontrols;
  end;
end;

end.
