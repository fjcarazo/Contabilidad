(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchTypes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, Grids, DBGrids,db,  DBAccess , Uni,
  DBCtrls, dbcgrids, Mask, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfmBatchTypes = class(TForm)
    ButtonPanel: TPanel;
    BtnClose: TBitBtn;
    Panel1: TPanel;
    pTranslate: TPanel;
    BClose: TBitBtn;
    ZQTranslate: TuniQuery;
    tblBatchTypes: TuniTable;
    tblBatchTypesWBATCHTYPEID: TIntegerField;
    tblBatchTypesSDESCRIPTION: TStringField;
    tblBatchTypesBCASHBOOK: TSmallintField;
    tblBatchTypesWCONTRAACCOUNTID: TIntegerField;
    tblBatchTypesBCONTRAPERLINE: TSmallintField;
    tblBatchTypesBINCREMENTREFNO: TSmallintField;
    tblBatchTypesBREPEATDETAILS: TSmallintField;
    tblBatchTypesBCONSOLIDATEBALANCING: TSmallintField;
    tblBatchTypesWDEBITCREDIT: TIntegerField;
    tblBatchTypesWPAYMENTGROUPID: TIntegerField;
    tblBatchTypesWDEFAULTTAXID: TIntegerField;
    tblBatchTypesBVIEWEXCLUSIVE: TSmallintField;
    tblBatchTypesBLINKOI: TSmallintField;
    tblBatchTypesBINCLUSIVEMODE: TSmallintField;
    tblBatchTypesDSYSDATE: TDateTimeField;
    DSBAtchTypes: TDataSource;
    ZQTranslateWBATCHTYPEID: TIntegerField;
    ZQTranslateWLANGUAGEID: TIntegerField;
    ZQTranslateSDESCRIPTION: TStringField;
    ZUpdateSQL1: TUniUpdateSql;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    sbEdit: TSpeedButton;
    sbDelete: TSpeedButton;
    sbAdd: TSpeedButton;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbAddClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure edtNewBatchTypeKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BCloseClick(Sender: TObject);
    procedure pTranslateExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tblBatchTypesAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ZQTranslateWLANGUAGEIDGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure tblBatchTypesAfterInsert(DataSet: TDataSet);
    procedure cxGrid1DBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    LangList : Tstringlist ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBatchTypes: TfmBatchTypes;

implementation

Uses
  database,  Main, HtmlHelpAPI, LanguageChoice, GlobalFunctions,
  DatabaseAccess, UDMTCCoreLink, BatchOptions,TcVariables,uosfvisuals,
  TcashClasses, UDmQuantumGridDefs;

{$R *.DFM}

procedure TfmBatchTypes.FormShow(Sender: TObject);
begin
   DMTCCoreLink.LoadImage(BtnClose.Glyph,'Close');

    Caption := GetTextLang(241);//Header 241
    sbAdd.Caption := GetTextLang(292);//Add 292
      sbEdit.Caption := GetTextLang(356);//Edit 356
   sbDelete.Caption := GetTextLang(293);//Delete 293

   cxGrid1DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(355);
 
   btnClose.Caption := GetTextLang(169);//Close 169


   Memo1.Lines.Text :=  GetTextLang(443) ;


  tblBatchTypes.Open;
  While not tblBatchTypes.Eof do
     if Trim(tblBatchTypesSDescription.AsString)='' then
        tblBatchTypes.Delete
     else
        tblBatchTypes.Next;
end;

procedure TfmBatchTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tblBatchTypes.Close;
end;

procedure TfmBatchTypes.sbAddClick(Sender: TObject);
begin
  tblBatchTypes.Insert;


end;

procedure TfmBatchTypes.sbDeleteClick(Sender: TObject);
var
 doDelete : boolean ;

begin
  DoDelete := false ;
  //check if any transactions use this batch number
  if OSFMessageDlg(GetTextLang(1007){''}, mtconfirmation, [mbyes, mbno], 237) <>mryes Then
    exit;
  if OpenSqlAndGetFirtsColumnValue('select count(*) from batcon where WBatchTypeID=' + intToStr(tblBatchTypesWBatchTypeID.AsInteger) ) = '0' then
   if OpenSqlAndGetFirtsColumnValue('select count(*) from sysvars where WCREDITNOTEBATCHTYPEID =' + intToStr(tblBatchTypesWBatchTypeID.AsInteger) ) = '0' then
    if OpenSqlAndGetFirtsColumnValue('select count(*) from sysvars where WPURCHASESBATCHID =' + intToStr(tblBatchTypesWBatchTypeID.AsInteger) ) = '0' then
     if OpenSqlAndGetFirtsColumnValue('select count(*) from sysvars where WGOODSRETURNEDBATCHID =' + intToStr(tblBatchTypesWBatchTypeID.AsInteger) ) = '0' then
      if OpenSqlAndGetFirtsColumnValue('select count(*) from sysvars where WINVOICESBATCHID =' + intToStr(tblBatchTypesWBatchTypeID.AsInteger) ) = '0' then
       if OpenSqlAndGetFirtsColumnValue('select count(*) from bank where WRECEIPTSID =' + intToStr(tblBatchTypesWBatchTypeID.AsInteger) ) = '0' then
        if OpenSqlAndGetFirtsColumnValue('select count(*) from bank where WPAYMENTSID =' + intToStr(tblBatchTypesWBatchTypeID.AsInteger) ) = '0' then
           dodelete := true ;

  if doDelete then
     tblBatchTypes.Delete
  else
    OSFMessageDlg(GetTextLang(442){Cant delete this batch type , as it has batches associated with it}, mterror, [mbok], 0);
end;

procedure TfmBatchTypes.edtNewBatchTypeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    sbAddClick(Sender);
    Key := #0;
  end;
end;

procedure TfmBatchTypes.btnCloseClick(Sender: TObject);
begin
   if tblBatchTypes.State <> dsbrowse then
     tblBatchTypes.Post ;
  Close;
end;

//These are the batch edit routines

procedure TfmBatchTypes.sbEditClick(Sender: TObject);
begin
 if tblBatchTypes.State <> dsbrowse then
    tblBatchTypes.Post ;

  if (tblBatchTypesSDescription.Value <> '')  then
  begin

  dmDatabase.BatchType := tblBatchTypesWBATCHTYPEID.AsInteger ;
  BatchCtrlID := GetBatchCtrlID(tblBatchTypesWBatchTypeID.AsInteger) ;
  fmBatchOptions := TfmBatchOptions.Create(self);
  try
  // TfmBatchOptions
  fmBatchOptions.BatchnameText := tblBatchTypesSDescription.Value ;
   fmBatchOptions.ShowModal ;
   finally
  fmBatchOptions.Free;
  end;
 end; 
end;

procedure TfmBatchTypes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(225);
             key := 0;

        end;
end;

procedure TfmBatchTypes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmBatchTypes.BCloseClick(Sender: TObject);
begin
 if (ZQTranslate.State in [ dsedit,DsInsert]) then
    ZQTranslate.post ;

 pTranslate.Visible := False ;
end;

procedure TfmBatchTypes.pTranslateExit(Sender: TObject);
begin
  pTranslate.Visible := False ;
  cxGrid1.Visible := True ;
end;

procedure TfmBatchTypes.SpeedButton1Click(Sender: TObject);
begin
 pTranslate.Parent := Panel1 ;
 cxGrid1.Visible := False ;
 pTranslate.Visible := True ;
end;

procedure TfmBatchTypes.tblBatchTypesAfterScroll(DataSet: TDataSet);
var i : Integer ;
begin
if tblBatchTypesWBATCHTYPEID.AsInteger = 0 then exit ;
if (tblBatchTypes.State = dsInsert) then
tblBatchTypes.post ;

ZQTranslate.close ;
ZQTranslate.Params[0].AsInteger := tblBatchTypesWBATCHTYPEID.AsInteger ;
ZQTranslate.open ;

for i := 0 to LangList.Count -1 do
   begin
      if not ZQTranslate.Locate('WLANGUAGEID',integer(LangList.Objects[i]),[]) then
        begin
            ZQTranslate.Insert ;
            ZQTranslateWBATCHTYPEID.AsInteger :=   tblBatchTypesWBATCHTYPEID.AsInteger ;
            ZQTranslateWLANGUAGEID.AsInteger :=   integer(LangList.Objects[i]) ;
            ZQTranslateSDESCRIPTION.AsString := tblBatchTypesSDESCRIPTION.AsString ;
            ZQTranslate.post ;
        end;
   end;
end;

procedure TfmBatchTypes.FormCreate(Sender: TObject);
begin
 LangList  := TStringList.Create ;
 DMTCCoreLink.GroupsObject.FillListWithReportingGroup(1004,LangList);
 DMTCCoreLink.AssignConnectionToChilds(self);
  uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1); 
 SpeedButton1.Visible := LangList.Count <> 0 ;
end;

procedure TfmBatchTypes.ZQTranslateWLANGUAGEIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if LangList.IndexOfObject(Tobject(Sender.AsInteger)) <> -1 then
     text :=   LangList[LangList.IndexOfObject(Tobject(Sender.AsInteger))] ;
end;

procedure TfmBatchTypes.FormDestroy(Sender: TObject);
begin
 LangList.free ;
end;

procedure TfmBatchTypes.tblBatchTypesAfterInsert(DataSet: TDataSet);
begin
    tblBatchTypesWBatchTypeID.Value := DMTCCoreLink.GetNewId(tcidNEWBATCHTYPEID);
  tblBatchTypesBCashBook.Value := 0;
  tblBatchTypesBContraPerLine.Value := 0;
  tblBatchTypesBIncrementRefNo.Value := 0;
  tblBatchTypesBRepeatDetails.Value := 0;
  tblBatchTypesBConsolidateBalancing.Value := 0;
  tblBatchTypesBViewExclusive.Value := 1;
  tblBatchTypesWDebitCredit.Value := 0;
  tblBatchTypesWDefaultTaxID.Value := 0;
end;

procedure TfmBatchTypes.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 sbEditClick(self);
end;

end.
