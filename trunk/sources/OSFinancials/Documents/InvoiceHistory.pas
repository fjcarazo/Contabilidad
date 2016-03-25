(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit InvoiceHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls,  DBGrids, ExtCtrls, Buttons,  Main,

   DBCtrls, Mask,
   cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, MemDS, DBAccess, Uni, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, DB, cxContainer,
  cxListView, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmInvoiceHistory = class(TForm)
    PnlLeft: TPanel;
    NoName: TPanel;
    lbSearchBy: TLabel;
    ed: TEdit;
    btSearch: TBitBtn;
    BtnAddAll: TBitBtn;
    BtnAdd: TBitBtn;
    BtnDelete: TBitBtn;
    PnlSelectDbt: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    btnCancelDbt: TBitBtn;
    btnOkDbt: TBitBtn;
    edtFromAcc: TEdit;
    edtToAcc: TEdit;
    Edit1: TEdit;
    cbNewMessg: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    cbAddCmt: TCheckBox;
    Memo1: TMemo;
    GenDate: TDateTimePicker;
    CheckBox1: TCheckBox;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Bevel1: TBevel;
    BtnCancel: TBitBtn;
    BtnGenerate: TBitBtn;
    btnPubliPost: TBitBtn;
    lvRepeating: TcxListView;
    PnlPrg: TPanel;
    lblCount: TLabel;
    prgBar: TProgressBar;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qryDocHead: TUniQuery;
    qryDocHeadWDOCID: TIntegerField;
    qryDocHeadSDOCNO: TStringField;
    qryDocHeadDDATE: TDateTimeField;
    qryDocHeadBREPEATING: TSmallintField;
    qryDocHeadSMAINACCOUNTCODE: TStringField;
    qryDocHeadSSUBACCOUNTCODE: TStringField;
    qryDocHeadSACCOUNTCODE: TStringField;
    qryDocHeadSDESCRIPTION: TStringField;
    qryDocHeadWMESSAGE1ID: TIntegerField;
    qryDocHeadWMESSAGE2ID: TIntegerField;
    qryDocHeadWMESSAGE3ID: TIntegerField;
    qryDocHeadFINVOICEDISCOUNT: TFloatField;
    qryDocHeadWDELADDRESS1ID: TIntegerField;
    qryDocHeadWDELADDRESS2ID: TIntegerField;
    qryDocHeadWDELADDRESS3ID: TIntegerField;
    qryDocHeadWPOSTAL1ID: TIntegerField;
    qryDocHeadWPOSTAL2ID: TIntegerField;
    qryDocHeadWPOSTAL3ID: TIntegerField;
    qryDocHeadWPOSTALCODEID: TIntegerField;
    qryDocHeadWDELCODEID: TIntegerField;
    qryDocHeadWACCOUNTID: TIntegerField;
    qryDocHeadWSALESMANID: TIntegerField;
    qryDocHeadWCURRENCYID: TIntegerField;
    qryDocHeadWPAYMENTTYPEID: TIntegerField;
    qryDocHeadBPOSTED: TSmallintField;
    qryDocHeadBPRINTED: TSmallintField;
    qryDocHeadWUSERID: TIntegerField;
    qryDocHeadSREFERENCE: TStringField;
    qryDocHeadDDUEDATE: TDateTimeField;
    qryDocHeadWREPORTINGGROUP1ID: TIntegerField;
    qryDocHeadWREPORTINGGROUP2ID: TIntegerField;
    qryDocHeadWTERMS: TIntegerField;
    qryDocHeadWPOSTALNAME: TIntegerField;
    qryDocHeadWPOSTALCONTACT: TIntegerField;
    qryDocHeadWDELNAME: TIntegerField;
    qryDocHeadWDELCONTACT: TIntegerField;
    qryDocHeadWTAXNUMBER: TIntegerField;
    dsDocHead: TDataSource;
    tblAccount: TUniTable;
    tblAccountSACCOUNTCODE: TStringField;
    tblAccountSMAINACCOUNTCODE: TStringField;
    tblAccountSSUBACCOUNTCODE: TStringField;
    tblAccountSDESCRIPTION: TStringField;
    tblAccountWACCOUNTTYPEID: TIntegerField;
    tblAccountWREPORTINGGROUP1ID: TIntegerField;
    tblAccountWREPORTINGGROUP2ID: TIntegerField;
    tblAccountBSUBACCOUNTS: TSmallintField;
    tblAccountBOPENITEM: TSmallintField;
    tblAccountBINCOMEEXPENSE: TSmallintField;
    tblAccountBINACTIVE: TSmallintField;
    tblAccountDSYSDATE: TDateTimeField;
    tblAccountWPROFILEID: TIntegerField;
    tblAccountWTAXACCOUNT: TIntegerField;
    tblAccountWLINKACCOUNT: TIntegerField;
    tblAccountWACCOUNTID: TIntegerField;
    UniUpdateSQL1: TUniUpdateSQL;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1WDOCID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDOCNO: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BREPEATING: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SMAINACCOUNTCODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SSUBACCOUNTCODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SACCOUNTCODE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SDESCRIPTION: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WMESSAGE1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WMESSAGE2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WMESSAGE3ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1FINVOICEDISCOUNT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDELADDRESS1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDELADDRESS2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDELADDRESS3ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPOSTAL1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPOSTAL2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPOSTAL3ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPOSTALCODEID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDELCODEID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WACCOUNTID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WSALESMANID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WCURRENCYID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPAYMENTTYPEID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BPOSTED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BPRINTED: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WUSERID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1SREFERENCE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DDUEDATE: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WREPORTINGGROUP1ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WREPORTINGGROUP2ID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WTERMS: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPOSTALNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WPOSTALCONTACT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDELNAME: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WDELCONTACT: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1WTAXNUMBER: TcxGridDBBandedColumn;
    dsAccounts: TDataSource;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn;
    edDate: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btDebtorClick(ColID:Integer);
    procedure btSearchClick(Sender: TObject);
    procedure dbgInvoiceListTitleButtonClick(Sender: TObject;
      AFieldName: String);

    procedure dbgInvoiceListEnter(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnGenerateClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure lvRepeatingEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPubliPostClick(Sender: TObject);
    procedure lvRepeatingSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure PnlSelectDbtExit(Sender: TObject);
    procedure btnOkDbtClick(Sender: TObject);
    procedure wwDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelDbtClick(Sender: TObject);
    procedure BedtFromAccClick(Sender: TObject);
    procedure BedtToAccClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid2DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private

     ActColSort:Integer;

    { Private declarations }
  public
     LocateTmp:Integer;
    { Public declarations }
  end;

var
  fmInvoiceHistory: TfmInvoiceHistory;
  GenList  : TStringlist;
  ToAcc,
  FromAcc  : String;
  SelFrom  : Boolean;
implementation

uses  HtmlHelpAPI,  GlobalFunctions,
   TcVariables, UDMTCCoreLink, FreeReportsUnit, Variants,
  UDmQuantumGridDefs, UMsgBox,DatabaseAccess;

{$R *.DFM}


procedure TfmInvoiceHistory.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnGenerate.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BtnDelete.Glyph,'Cancel');

 DMTCCoreLink.LoadImage(BtnAdd.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnAddAll.Glyph,'Ok');
 DMTCCoreLink.LoadImage(btSearch.Glyph,'Search');


 DMTCCoreLink.LoadImage(btnOkDbt.Glyph,'Ok');
 DMTCCoreLink.LoadImage(btnCancelDbt.Glyph,'Cancel');





  //PnlSelectDbt.Left := 0 ;
  //PnlSelectDbt.top := 0 ;
  PnlSelectDbt.Align := alclient;
  ActColSort:=0;
  GenList.Clear;
  fmMain.mainProgressBar.StepBy(5);
  GenDate.DateTime:=Date;
  if not isRepeatingInv then
  begin
    width:=Width-Panel2.Width;
    Panel2.width:=0;
    Panel2.Visible:=False;
    cxGrid1DBBandedTableView1BREPEATING.VisibleForCustomization := False ;
    cxGrid1DBBandedTableView1BREPEATING.Visible := False ;
  end;
  with  qryDocHead do begin
   if  qryDocHead.Active then  qryDocHead.Close;
    qryDocHead.SQL.Clear;
    qryDocHead.filter := '' ;
    qryDocHead.Filtered := false ;
    qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
    SQL.Add('   and DocHead.WTypeID = 10');
    SQL.Add(' AND  COALESCE(DocHead.WSourceTYpeID,0) <>2 ' ) ;
    SQL.Add('order by DocHead.SDocNo');
    lbSearchBy.Caption := DMTCCoreLink.gettextlang(2167);
    edDate.Hide;
    ed.Show;
    Open;
    qryDocHead.locate('WDocID',LocateTmp,[])
  end;
  fmMain.mainProgressBar.StepBy(5);
  fmMain.mainProgressBar.Position := 0;
 self.Caption := DMTCCoreLink.GetTextLang(1886);
 Label1.Caption := DMTCCoreLink.GetTextLang(1886);
 lvRepeating.Columns[0].Caption := DMTCCoreLink.GetTextLang(234);
 lvRepeating.Columns[1].Caption := DMTCCoreLink.GetTextLang(31);
 lvRepeating.Columns[2].Caption := DMTCCoreLink.GetTextLang(238);
 lvRepeating.Columns[3].Caption := DMTCCoreLink.GetTextLang(2180);
 lvRepeating.Columns[4].Caption := DMTCCoreLink.GetTextLang(2181);
 lvRepeating.Columns[5].Caption := DMTCCoreLink.GetTextLang(2182);

 btnPubliPost.Caption := DMTCCoreLink.GetTextLang(1012);
 BtnGenerate.Caption := DMTCCoreLink.GetTextLang(1888);
 BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);
 lbSearchBy.Caption :=  DMTCCoreLink.GetTextLang(1889);
 btSearch.Caption :=  DMTCCoreLink.GetTextLang(1880);
 BtnAddAll.Caption :=  DMTCCoreLink.GetTextLang(1890);
 BtnAdd.Caption :=  DMTCCoreLink.GetTextLang(1872);
 BtnDelete.Caption :=  DMTCCoreLink.GetTextLang(1873);
 cxGrid1DBBandedTableView1SDOCNO.Caption := DMTCCoreLink.GetTextLang(234);
 cxGrid1DBBandedTableView1DDATE.Caption := DMTCCoreLink.GetTextLang(238);
 cxGrid1DBBandedTableView1SACCOUNTCODE.Caption := DMTCCoreLink.GetTextLang(34);
 cxGrid1DBBandedTableView1SDESCRIPTION.Caption := DMTCCoreLink.GetTextLang(31);
 cxGrid1DBBandedTableView1BREPEATING.Caption := DMTCCoreLink.GetTextLang(1891);

 

 Label6.Caption := DMTCCoreLink.GetTextLang(1892);
 Label2.Caption := DMTCCoreLink.GetTextLang(282);
 Label4.Caption := DMTCCoreLink.GetTextLang(208);
 Label5.Caption := DMTCCoreLink.GetTextLang(1893);
 Label3.Caption := DMTCCoreLink.GetTextLang(1879);
 cbNewMessg.Caption := DMTCCoreLink.GetTextLang(1894);
 CheckBox1.Caption := DMTCCoreLink.GetTextLang(1895);
 cbAddCmt.Caption := DMTCCoreLink.GetTextLang(1896);
 btnOkDbt.Caption := DMTCCoreLink.GetTextLang(167);
 btnCancelDbt.Caption := DMTCCoreLink.GetTextLang(168);

     cxGrid2DBTableView1SACCOUNTCODE.Caption := DMTCCoreLink.gettextlang(176);
     cxGrid2DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.gettextlang(185);
end;

procedure TfmInvoiceHistory.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 112 then
   begin
       //Result := (HTMLHelpShowHelp <> 0);
       HtmlShowTopic(163);
       key := 0;
   end;
end;

procedure TfmInvoiceHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// showmessage('closing..');
  tblAccount.Filtered:=False;
  tblAccount.Filter:='';
  qryDocHead.Close;
 isRepeatingInv:=False;
end;

procedure TfmInvoiceHistory.btDebtorClick(ColID:Integer);
begin
 cxGrid1.SetFocus;
 fmMain.mainProgressBar.Position := 0;
  dsDocHead.Enabled := false;
 fmMain.mainProgressBar.StepBy(1);
 with  qryDocHead do begin

   qryDocHead.SQL.Clear;
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
   qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
  SQL.Add('and DocHead.WTypeID = 10');
//  dbgInvoiceList.Columns[0].Color := clWindow;
//  dbgInvoiceList.Columns[1].Color := clWindow;
//  dbgInvoiceList.Columns[2].Color := clWindow;
//  dbgInvoiceList.Columns[3].Color := clWindow;
  edDate.Hide;
  ed.Show;
  if ColID = 1 then
    begin
     SQL.Add('order by DocHead.DDate');
//     dbgInvoiceList.Columns[1].Color := clAqua;
     ActColSort:=1;
     lbSearchBy.Caption := 'Search By Date';
     edDate.Show;
     ed.Hide;
    end else
  if ColID=2 then
    begin
     SQL.Add('order by Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE');
//     dbgInvoiceList.Columns[2].Color := clAqua;
     ActColSort:=2;
     lbSearchBy.Caption := 'Search By Account';
    end else
  if ColID=3 then
    begin
     SQL.Add('order by Account.SDescription');
//     dbgInvoiceList.Columns[3].Color := clAqua;
     ActColSort:=3;
     lbSearchBy.Caption := 'Search By Description';
    end else
  if ColID=4 then
    begin
     SQL.Add('order by DocHead.BRepeating');
//     dbgInvoiceList.Columns[3].Color := clAqua;
     ActColSort:=4;
     lbSearchBy.Caption := 'Search By Description';
    end else
    begin
     SQL.Add('order by DocHead.SDocNo');
//     dbgInvoiceList.Columns[0].Color := clAqua;
     ActColSort:=0;
     lbSearchBy.Caption := DMTCCoreLink.gettextlang(2167);
    end;
  fmMain.mainProgressBar.StepBy(3);
  Open;
  fmMain.mainProgressBar.StepBy(1);
 end;
  dsDocHead.Enabled := true;
 fmMain.mainProgressBar.StepBy(1);
 fmMain.mainProgressBar.Position := 0;
 cxGrid1.SetFocus;
end;

procedure TfmInvoiceHistory.btSearchClick(Sender: TObject);
var tmp : string;
begin
 with  qryDocHead do begin
   DisableControls;
   if Active then Close;
   SQL.Clear;
//   if dbgInvoiceList.Columns[0].Color = clAqua then
   if ActColSort =0 then
    begin
   qryDocHead.SQL.Clear;
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
   qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');

     SQL.Add('   AND DocHead.WTypeID = 10');
     SQL.Add('   AND DocHead.SDocNo LIKE ' + QuotedStr(ed.text + '%'));
    end else
//   if dbgInvoiceList.Columns[1].Color = clAqua then
   if ActColSort =1 then
    begin
     tmp := copy(edDate.Text,4,3) + copy(edDate.text,1,3) + copy(edDate.Text,7,4);
   qryDocHead.SQL.Clear;
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
   qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');

     SQL.Add('   AND DocHead.WTypeID = 10');
     SQL.Add('   AND DocHead.DDate = cast(' + QuotedStr(tmp) + ' as date)' );
    end else
//   if dbgInvoiceList.Columns[2].Color = clAqua then
   if ActColSort =2 then
    begin
   qryDocHead.SQL.Clear;
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
   qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');

     SQL.Add('   AND DocHead.WTypeID = 10');
     SQL.Add('   AND Account.SMAINACCOUNTCODE LIKE ' + QuotedStr(ed.text + '%'));
    end else
//   if dbgInvoiceList.Columns[3].Color = clAqua then
   if ActColSort =3 then
    begin
   qryDocHead.SQL.Clear;
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
   qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');

     SQL.Add('   AND DocHead.WTypeID = 10');
     SQL.Add('   AND Account.SDescription LIKE ' + QuotedStr(ed.text + '%'));
    end;
   Open;
   EnableControls;
 end;
end;

procedure TfmInvoiceHistory.dbgInvoiceListTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
  iField:integer;
begin
  iField:=0;
  if AFieldName='DDate' then
     iField:=1;
  if AFieldName='SACCOUNTCalc' then
     iField:=2;
  if AFieldName='SDescription' then
     iField:=3;
  if AFieldName='BRepeating' then
     iField:=4;
  btDebtorClick(iField);
end;



procedure TfmInvoiceHistory.dbgInvoiceListEnter(Sender: TObject);
begin
  BtnAdd.Enabled:=True;
  BtnDelete.Enabled:=False;
  BtnAddAll.Enabled:=True;  
  if  qryDocHead.RecordCount=0 then
  begin
    OSFMessageDlg(DMTCCoreLink.GetTextLang(678){There is No Invoice to Print},mtConfirmation,[mbOk],0);
//    Hide;
//    exit;
  end;
end;

procedure TfmInvoiceHistory.BtnAddClick(Sender: TObject);
Var
  i,Count:integer;
  Ok:Boolean;
  ListItem:TListItem;
begin



       for i:= 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
       begin
         cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;

            Ok:=True;
            For Count:=0 to lvRepeating.Items.Count-1 do
               if lvRepeating.Items[Count].SubItems.Strings[2]=qryDocHead.FieldByName('WDocID').AsString then Ok:=False;

            if Ok Then
           with lvRepeating do
           begin
             ListItem := Items.Add;
             ListItem.Caption:=qryDocHead.FieldByName('SDocNo').AsString;
             listItem.subitems.add(qryDocHead.FieldByName('SDescription').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('DDate').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('WDocID').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('SACCOUNTCODE').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('SACCOUNTCODE').AsString);
           end;

        end;

   if lvRepeating.Items.Count>0 then BtnGenerate.Enabled:=True;   
end;

procedure TfmInvoiceHistory.BtnDeleteClick(Sender: TObject);
var
  Count:Integer;
begin
  Count:=0;
  While Count<=lvRepeating.Items.Count-1 do
     if  (lvRepeating.Items[Count].selected) Then
     begin
       lvRepeating.Items.Delete(Count);
     end
     else
      Inc(Count);
    if lvRepeating.Items.Count<=0 then BtnGenerate.Enabled:=False;
end;

procedure TfmInvoiceHistory.BtnGenerateClick(Sender: TObject);
Var
  Count: Integer;
  TWDocID,ExtraMessage :String;
  MessID: Array[1..3] of String;
  NewDocId : Integer ;
begin
  PnlPrg.Visible:=True;

  begin
    if cbAddCmt.Checked then
        ExtraMessage :=   Memo1.Lines.text ;

     if cbNewMessg.Checked then
     begin
       MessID [1]:=  Edit1.Text ;
       MessID [2]:=  Edit2.Text ;
       MessID [3]:=  Edit3.Text ;
     end;
     tblAccount.close;
     tblAccount.open;
     // done : Translate 176
     cxGrid2DBTableView1SACCOUNTCODE.Caption := DMTCCoreLink.gettextlang(176);
     cxGrid2DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.gettextlang(185);
     For Count:=0 to lvRepeating.Items.Count-1 do
     begin
       lblCount.Caption:=IntToStr(Count+1)+ ' '+DMTCCoreLink.gettextlang(3005){of}+' '+IntToStr(lvRepeating.Items.Count);
       lblCount.Repaint;
       prgBar.Position:=0;
       prgBar.Repaint;
       TWDocID:=lvRepeating.Items[Count].SubItems[2];
       // Prepare Debtors list
       FromAcc:=lvRepeating.Items[Count].SubItems[3];
       ToAcc:=lvRepeating.Items[Count].SubItems[4];
       if FromAcc>ToAcc then ;// Just in Case
       tblAccount.filtered:=false;
       tblAccount.filter:='WAccountTypeID=1 and SACCOUNTCODE>='''+FromAcc+''' And SACCOUNTCODE<='''+ToAcc+'''';
       tblAccount.filtered:=True;
       // Creating Head Docs
       tblAccount.First;
       while not tblAccount.Eof do
        begin
         CopyDocument(StrToInt(TWDocID),tblAccountWaccountID.AsInteger,0,false,nil,GenDate.date,false,NewDocId,MessID[1],MessID [2],MessID [3],ExtraMessage);
         tblAccount.Next;
       end; // Next Debtor
     end; /// Next Count
  end;
  lvRepeating.Items.Clear;
  PnlPrg.Visible:=False;
end;

procedure TfmInvoiceHistory.BtnPrintClick(Sender: TObject);
Var
 i:Integer;
 TWDocID:String;
begin
       for i:= 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
       begin
         cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused := True ;
         ShowFrReport(0,0,1,10)  ;
         if i<cxGrid1DBBandedTableView1.Controller.SelectedRecordCount-1 then
            if OSFMessageDlg(DMTCCoreLink.GetTextLang(677){Continue},mtConfirmation,[mbYes,mbNo],0)=mrNo then Break
      end;
end;

procedure TfmInvoiceHistory.BtnAddAllClick(Sender: TObject);
Var
  Count:integer;
  Ok:Boolean;
  ListItem: TListItem;
begin
       qryDocHead.first ;
       while not qryDocHead.Eof do
       begin
         if qryDocHeadBrepeating.value =1 then
         begin
           Ok:=True;
           For Count:=0 to lvRepeating.Items.Count-1 do
//               if Copy(RepInvList.Items.Strings[Count],1,Pos(' ',RepInvList.Items.Strings[Count])-1)=qryDocHead.FieldByName('WDocID').AsString then Ok:=False;
               if lvRepeating.Items[Count].SubItems.Strings[2]=qryDocHead.FieldByName('WDocID').AsString then Ok:=False;

           if Ok Then //RepInvList.Items.add(qryDocHead.FieldByName('WDocID').AsString+' '+qryDocHead.FieldByName('SDocNo').AsString);
           with lvRepeating do
           begin
             ListItem := Items.Add;
             ListItem.Caption:=qryDocHead.FieldByName('SDocNo').AsString;
             listItem.subitems.add(qryDocHead.FieldByName('SDescription').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('DDate').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('WDocID').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('SACCOUNTCODE').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('SACCOUNTCODE').AsString);
           end;
         end;
         qryDocHead.Next;
        end;


  if lvRepeating.Items.Count>0 then BtnGenerate.Enabled:=True;
end;

procedure TfmInvoiceHistory.lvRepeatingEnter(Sender: TObject);
begin
  BtnAdd.Enabled:=False;
  BtnDelete.Enabled:=True;
  BtnAddAll.Enabled:=False;
  btnPubliPost.Enabled:=True;
end;

procedure TfmInvoiceHistory.FormCreate(Sender: TObject);
begin
  GenList:=TStringList.Create;
  cxGrid1.Align := alClient ;
  DMTCCoreLink.AssignConnectionToChilds(self);
  tblAccount.open ;
end;

procedure TfmInvoiceHistory.FormDestroy(Sender: TObject);
begin
  GenList.Free;
end;

procedure TfmInvoiceHistory.btnPubliPostClick(Sender: TObject);
begin
  if lvRepeating.selected = nil  then exit;
  FromAcc:=lvRepeating.selected.SubItems[3];
  ToAcc:=lvRepeating.selected.SubItems[4];
   tblAccount.close;
  // TODO : BDEINDEX
  //  tblAccount.IndexName:='Ind_AccountCode';
   tblAccount.open;

       
   tblAccount.filtered:=false;
   tblAccount.filter:='WAccountTypeID=1';
   tblAccount.filtered:=True;
  PnlSelectDbt.BringToFront;
  application.ProcessMessages;
  PnlSelectDbt.Visible:=True;
  edtFromAcc.text:=FromAcc;
  edtToAcc.text:=ToAcc;
  bedtFromAccClick(Sender) ;
     // done : Translate 176
  cxGrid2DBTableView1SACCOUNTCODE.Caption := DMTCCoreLink.gettextlang(176);
    cxGrid2DBTableView1SDESCRIPTION.Caption := DMTCCoreLink.gettextlang(185);
end;

procedure TfmInvoiceHistory.lvRepeatingSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  FromAcc:=item.SubItems[3];
  ToAcc:=item.SubItems[4];
end;

procedure TfmInvoiceHistory.PnlSelectDbtExit(Sender: TObject);
begin
  if PnlSelectDbt.Visible then PnlSelectDbt.visible:=false;
   tblAccount.close;
   tblAccount.filtered:=false;
   tblAccount.filter:='';
end;

procedure TfmInvoiceHistory.btnOkDbtClick(Sender: TObject);
begin
  lvRepeating.selected.SubItems[3]:=edtFromacc.Text;
  lvRepeating.selected.SubItems[4]:=edtToacc.Text;
  lvRepeating.setfocus;
end;

procedure TfmInvoiceHistory.wwDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
  #27:begin
       btnCancelDbtClick(Sender);
      end;
  #13:begin
         if SelFrom then
    bedtToAccClick(Sender)
  else
    btnOkDbtClick(Sender);
      end;
  end;
end;

procedure TfmInvoiceHistory.btnCancelDbtClick(Sender: TObject);
begin
  lvRepeating.setfocus;
end;

procedure TfmInvoiceHistory.BedtFromAccClick(Sender: TObject);
begin
  SelFrom:=True;
  HighLight(edtFromAcc);
  BackNormal(edtToAcc);
   tblAccount.Locate('SACCOUNTCODE',edtFromAcc.text,[]);
  cxGrid2.SetFocus;
end;

procedure TfmInvoiceHistory.BedtToAccClick(Sender: TObject);
begin
  SelFrom:=False;
  HighLight(edtToAcc);
  BackNormal(edtFromAcc);
   tblAccount.Locate('SACCOUNTCODE',edtToAcc.text,[]);
  cxGrid2.SetFocus;
end;

procedure TfmInvoiceHistory.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var
   aValue : String ;
begin
 aValue := VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1BREPEATING.Index]) ;
 if  aValue  = '1' then
  ACanvas.Font.Color:=clRed ;
end;

procedure TfmInvoiceHistory.cxGrid2DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if SelFrom then
    bedtToAccClick(Sender)
  else
    btnOkDbtClick(Sender);
end;

end.



