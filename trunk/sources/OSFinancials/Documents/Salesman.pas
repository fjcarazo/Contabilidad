(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Salesman;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls,  db, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfmSalesman = class(TForm)
    ButtonPanel: TPanel;
    BtnClose: TBitBtn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    sbDelete: TSpeedButton;
    sbAdd: TSpeedButton;
    cxGrid1DBTableView1WGROUPID: TcxGridDBColumn;
    cxGrid1DBTableView1WGROUPTYPEID: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1WPARENTGROUP2ID: TcxGridDBColumn;
    cxGrid1DBTableView1WPARENTGROUP1ID: TcxGridDBColumn;
    cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid1DBTableView1WSORTNO: TcxGridDBColumn;
    cxGrid1DBTableView1BDISABLE: TcxGridDBColumn;
    cxGrid1DBTableView1WCOLOR: TcxGridDBColumn;
    cxGrid1DBTableView1WTEXTCOLOR: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbAddClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure edtNewSalesmanKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSalesman: TfmSalesman;

implementation

Uses
  Database, Main, HtmlHelpAPI, GlobalFunctions, LanguageChoice,
  DatabaseAccess, UDMTCCoreLink, UDmQuantumGridDefs;

{$R *.DFM}

procedure TfmSalesman.FormShow(Sender: TObject);
begin

  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Filter := 'WGroupTypeID = 31';//Search for the salesman type
  dmDatabase.tblGroups.Filtered := True;
  // done : Pieter Translation
  self.Caption :=  GetTextLang(198);
  cxGrid1DBTableView1SDESCRIPTION.Caption := GetTextLang(185);
  sbAdd.Caption := GetTextLang(292);
  sbDelete.Caption := GetTextLang(24);
  BtnClose.Caption := GetTextLang(169);

 DMTCCoreLink.LoadImage(BtnClose.Glyph,'Close');

end;

procedure TfmSalesman.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblGroups.Filtered := False;
  dmDatabase.tblGroups.Close;
end;

procedure TfmSalesman.sbAddClick(Sender: TObject);
begin
    dmDatabase.tblGroups.Insert;
    dmDatabase.tblGroupsWGroupTypeID.Value := 31;//Salesman type
    dmDatabase.tblGroupsSDESCRIPTION.AsString := 'Change name';
end;

procedure TfmSalesman.sbDeleteClick(Sender: TObject);
begin
  if  OSFMessageDlg(GetTextLang(1055){' Do you want to delete the sales person'} +': ' + dmDatabase.tblGroupsSDescription.Value , mtinformation, [mbyes,mbOk], 0)= mrYes then
    dmDatabase.tblGroups.Delete;
end;

procedure TfmSalesman.edtNewSalesmanKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    sbAddClick(Sender);
    Key := #0;
  end;
end;

procedure TfmSalesman.btnCloseClick(Sender: TObject);
begin
  if dmDatabase.dsGroups.DataSet.State <> dsbrowse then
     dmDatabase.dsGroups.DataSet.post ;

  Close;

end;

procedure TfmSalesman.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(231);
             key := 0;

        end;
     if Key = 27 then
        begin
             Close;
             key := 0;

        end;
end;

end.
