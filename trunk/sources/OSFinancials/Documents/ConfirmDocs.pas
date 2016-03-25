(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ConfirmDocs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, Buttons, ToolWin,
   Db,    DBCtrls, Mask,
   DBAccess, Uni, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxContainer, cxListView,  cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  TfmConfirmDocs = class(TForm)
    PnlLeft: TPanel;
    lbSearchBy: TLabel;
    ed: TEdit;
    btSearch: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    lvRepeating: TcxListView;
    PnlPrg: TPanel;
    prgBar: TProgressBar;
    lblCount: TLabel;
    GenDate: TDateTimePicker;
    Label3: TLabel;
    Bevel1: TBevel;
    BtnAdd: TBitBtn;
    BtnDelete: TBitBtn;
    BtnCancel: TBitBtn;
    BtnGenerate: TBitBtn;
    btnPubliPost: TBitBtn;
    PnlSelectDbt: TPanel;
    RgDocType: TRadioGroup;
    Pnlt: TPanel;
    CBUseDocDate: TCheckBox;
    Splitter1: TSplitter;
    cbShowPosted: TCheckBox;
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
    dsAccounts: TDataSource;
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
    UniUpdateSQL1: TUniUpdateSQL;
    dsDocHead: TDataSource;
    cxdocsDBTableView1: TcxGridDBTableView;
    cxdocsLevel1: TcxGridLevel;
    cxdocs: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxdocsDBTableView1SDOCNO: TcxGridDBColumn;
    cxdocsDBTableView1DDATE: TcxGridDBColumn;
    cxdocsDBTableView1BREPEATING: TcxGridDBColumn;
    cxdocsDBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxdocsDBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxdocsDBTableView1SREFERENCE: TcxGridDBColumn;
    cxdocsDBTableView1WDOCID: TcxGridDBColumn;
    cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn;
    edDate: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgInvoiceListDblClick(Sender: TObject);
    procedure btDebtorClick(ColID:Integer);
    procedure btSearchClick(Sender: TObject);
    procedure dbgInvoiceListTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgInvoiceListCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgInvoiceListEnter(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnGenerateClick(Sender: TObject);
    procedure lvRepeatingEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPubliPostClick(Sender: TObject);
    procedure lvRepeatingSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure PnlSelectDbtExit(Sender: TObject);
    procedure btnCancelDbtClick(Sender: TObject);
    procedure RgDocTypeClick(Sender: TObject);
    procedure PnlSelectDbtEnter(Sender: TObject);
    procedure lvRepeatingKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvRepeatingCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvRepeatingColumnClick(Sender: TObject; Column: TListColumn);
    procedure edKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edDateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbShowPostedClick(Sender: TObject);
    procedure cxdocsDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
  private

     ActColSort:Integer;

    { Private declarations }
  public
     LocateTmp,LastIndex:Integer;
     SortDirection : Boolean ;
    { Public declarations }
  end;

var
  fmConfirmDocs: TfmConfirmDocs;
  GenList  : TStringlist;
  ToAcc,
  FromAcc  : String;
 
implementation

uses  HtmlHelpAPI, GlobalFunctions, LanguageChoice,
  DatabaseAccess, TcVariables, UDMTCCoreLink, Database, UDmQuantumGridDefs,
  Variants;

{$R *.DFM}


procedure TfmConfirmDocs.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BtnDelete.Glyph,'Cancel');

 DMTCCoreLink.LoadImage(BtnAdd.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnGenerate.Glyph,'Ok');
 DMTCCoreLink.LoadImage(btSearch.Glyph,'Search');



 


  ActColSort:=0;
  GenList.Clear;

  GenDate.DateTime:=Date;
  if not isRepeatingInv then
  begin
    width:=Width-Panel2.Width;
    Panel2.width:=0;
    Panel2.Visible:=False;
    cxdocsDBTableView1BREPEATING.VisibleForCustomization := False ;
    cxdocsDBTableView1BREPEATING.Visible := False ;
    
  end;
  
  with qryDocHead do begin
   qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;


   SQL.Add('   and DocHead.WTypeID = '+IntToStr(RgDocType.ItemIndex+14));
   if not cbShowPosted.Checked then
     SQL.Add('and DocHead.BPosted = 0');

   SQL.Add('order by DocHead.SDocNo');
   lbSearchBy.Caption := GetTextLang(1227);//'Search By Number';
   edDate.Hide;
   ed.Show;
   Open;
   qryDocHead.locate('WDocID',LocateTmp,[])
  end;

 
  Case RgDocType.ItemIndex of
   0:Begin
       lvRepeating.Columns[0].Caption := GetTextLang(771);// 'Quote No ';
       lvRepeating.Columns[1].Caption := GetTextLang(31);// 'Debtor ';
        cxdocsDBTableView1SDOCNO.Caption := GetTextLang(771);//'Quote No';
       cxdocsDBTableView1SDESCRIPTION.Caption := GetTextLang(31);// 'Debtor ';
       btnPubliPost.Caption := GetTextLang(1222);// '&Select Debtor';
       Label1.Caption :=GetTextLang(1223);//'Quotes to Convert to Invoice';
     end;
   1:Begin
       lvRepeating.Columns[0].Caption := GetTextLang(1224);//'Order No ';
       lvRepeating.Columns[1].Caption := GetTextLang(552);//'Creditor ';
       cxdocsDBTableView1SDOCNO.Caption :=GetTextLang(1224);//'Order No';
       cxdocsDBTableView1SDESCRIPTION.Caption :=GetTextLang(552);//'Creditor ';



       btnPubliPost.Caption := GetTextLang(1226);// '&Select Creditor';
       Label1.Caption :=GetTextLang(1225);//'Order to Convert to Purchase';

     end;
  end;
  lvRepeating.Columns[4].Caption := GetTextLang(1706);//nr
  lvRepeating.Columns[4].Caption := GetTextLang(2010);//from
  lvRepeating.Columns[5].Caption := GetTextLang(208);//to
  lvRepeating.Columns[2].Caption := GetTextLang(238);//date

 

  // translations
  CBUseDocDate.Caption := GetTextLang(3040);// use doc date

  RgDocType.Caption := GetTextLang(1869);
  RgDocType.Items[0] := GetTextLang(1870);
  RgDocType.Items[1] := GetTextLang(1871);
  BtnAdd.Caption := GetTextLang(1872);
  BtnDelete.Caption := GetTextLang(1873);
  Caption :=  GetTextLang(1874);
  BtnCancel.Caption := GetTextLang(168);
  btSearch.Caption := GetTextLang(1880);
  cxdocsDBTableView1DDATE.Caption := GetTextLang(1875);
  cxdocsDBTableView1SACCOUNTCODE.Caption := GetTextLang(1876);
  cxdocsDBTableView1BREPEATING.Caption := GetTextLang(1877);
  BtnGenerate.Caption := GetTextLang(1878);
  Label3.Caption := GetTextLang(1879);
end;

procedure TfmConfirmDocs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);


begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(105);
             key := 0;

        end;
end;

procedure TfmConfirmDocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// showmessage('closing..');
 tblAccount.Filtered:=False;
 tblAccount.Filter:='';
 qryDocHead.Close;
 isRepeatingInv:=False;
end;

procedure TfmConfirmDocs.dbgInvoiceListDblClick(Sender: TObject);
begin
  BtnAddClick(Sender);
end;

procedure TfmConfirmDocs.btDebtorClick(ColID:Integer);
begin
 cxdocs.SetFocus;

 dsDocHead.Enabled := false;
 
 with qryDocHead do begin
  ChargeDocSql;
  SQL.Add('and DocHead.WTypeID = '+IntToStr(RgDocType.ItemIndex+14));
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
     lbSearchBy.Caption := GetTextLang(958); // 'Search By Date';
     edDate.Show;
     ed.Hide;
    end else
  if ColID=2 then
    begin
     SQL.Add('order by Account.SMAINACCOUNTCODE, Account.SSUBACCOUNTCODE');
//     dbgInvoiceList.Columns[2].Color := clAqua;
     ActColSort:=2;
     lbSearchBy.Caption := GetTextLang(1228); //'Search By Account';
    end else
  if ColID=3 then
    begin
     SQL.Add('order by Account.SDescription');
//     dbgInvoiceList.Columns[3].Color := clAqua;
     ActColSort:=3;
     lbSearchBy.Caption :=GetTextLang(1229); // 'Search By Description';
    end else
  if ColID=4 then
    begin
     SQL.Add('order by DocHead.BRepeating');
//     dbgInvoiceList.Columns[3].Color := clAqua;
     ActColSort:=4;
     lbSearchBy.Caption := GetTextLang(1229); //'Search By Description';
    end else
    begin
     SQL.Add('order by DocHead.SDocNo');
//     dbgInvoiceList.Columns[0].Color := clAqua;
     ActColSort:=0;
     lbSearchBy.Caption := GetTextLang(1227); //'Search By Number';
    end;
 ;
  Open;

 end;
 dsDocHead.Enabled := true;

 cxdocs.SetFocus;
end;

procedure TfmConfirmDocs.btSearchClick(Sender: TObject);
var tmp : TDateTime;
begin
 with qryDocHead do begin
   DisableControls;
   try
   if Active then Close;
   SQL.Clear;
//   if dbgInvoiceList.Columns[0].Color = clAqua then
   if ActColSort =0 then
    begin
     qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
     qryDocHead.filter := '' ;
     qryDocHead.Filtered := false ;
     SQL.Add('   AND DocHead.WTypeID = '+IntToStr(RgDocType.ItemIndex+14));
     SQL.Add('   AND DocHead.SDocNo LIKE ' +   QuotedStr(ed.text + '%'));
    end else
//   if dbgInvoiceList.Columns[1].Color = clAqua then
   if ActColSort =1 then
    begin

     qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
     qryDocHead.filter := '' ;
     qryDocHead.Filtered := false ;
     SQL.Add('   AND DocHead.WTypeID = '+IntToStr(RgDocType.ItemIndex+14));
     if edDate.Text <> '' then
     begin
     tmp := StrToDate(edDate.Text);// copy(edDate.Text,4,3) + copy(edDate.text,1,3) + copy(edDate.Text,7,4);
     SQL.Add('   AND DocHead.DDate = ' + QuotedStr(formatDateTime('yyyy-mm-dd',tmp)  ));
     end;
    end else
//   if dbgInvoiceList.Columns[2].Color = clAqua then
   if ActColSort =2 then
    begin
        qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
     SQL.Add('   AND DocHead.WTypeID = '+IntToStr(RgDocType.ItemIndex+14));
     SQL.Add('   AND Account.SMAINACCOUNTCODE LIKE ' + QuotedStr(ed.text + '%'));
    end else
//   if dbgInvoiceList.Columns[3].Color = clAqua then
   if ActColSort =3 then
    begin
        qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
     SQL.Add('   AND DocHead.WTypeID = '+IntToStr(RgDocType.ItemIndex+14));
     SQL.Add('   AND Account.SDescription LIKE ' + QuotedStr(ed.text + '%'));
    end;
   if ActColSort =4 then
    begin
        qryDocHead.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('Dataaccess_docheadsql');
   qryDocHead.filter := '' ;
   qryDocHead.Filtered := false ;
     SQL.Add('   AND DocHead.WTypeID = '+IntToStr(RgDocType.ItemIndex+14));
     if StrToIntDef(ed.text,-1) <> -1 then
     SQL.Add('   AND DocHead.BREPEATING = ' + IntToStr(StrToIntDef(ed.text,-1)));
    end;
   Open;
   finally
   EnableControls;
   end;
 end;
end;

procedure TfmConfirmDocs.dbgInvoiceListTitleButtonClick(Sender: TObject;
  AFieldName: String);

begin
  ActColSort:=0;
  if AFieldName='DDATE' then
     ActColSort:=1;
  if AFieldName='SACCOUNTCODE' then
     ActColSort:=2;
  if AFieldName='SDESCRIPTION' then
     ActColSort:=3;
  if AFieldName='BREPEATING' then
     ActColSort:=4;
  btDebtorClick(ActColSort);
end;

procedure TfmConfirmDocs.dbgInvoiceListCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
 if GenList.IndexOf(qryDocHeadWDocID.AsString)>-1 then
   AFont.Color:=clRed
 else
 Case ActColSort of
 0:if Field.Name='qryDocHeadSDocNo' then  Abrush.Color:=clAqua;
 1:if Field.Name='qryDocHeadDDate' then  Abrush.Color:=clAqua;
 2:if Field.Name='qryDocHeadSACCOUNTCODE' then  Abrush.Color:=clAqua;
 3:if Field.Name='qryDocHeadSDescription' then  Abrush.Color:=clAqua;
 end
end;

procedure TfmConfirmDocs.dbgInvoiceListEnter(Sender: TObject);
begin
  BtnAdd.Enabled:=True;
  BtnDelete.Enabled:=False;

end;

procedure TfmConfirmDocs.BtnAddClick(Sender: TObject);
Var
  j,i,Count:integer;
  Ok:Boolean;
  ListItem:TListItem;
begin

//       tblDocHeader.Filtered:=False;
       // tblDocHeader.Active:=True;
       for i:= 0 to cxdocsDBTableView1.Controller.SelectedRecordCount -1 do
       begin
         cxdocsDBTableView1.Controller.SelectedRecords[i].Focused := True ;
         dmdatabase.tblDocHeader.SQL.Text :=' Select * from dochead where WDocId =' + IntToStr(cxdocsDBTableView1.DataController.DataSource.DataSet.FieldByName('WDocID').AsInteger);
         dmdatabase.tblDocHeader.open ;

         If not dmdatabase.tblDocHeader.IsEmpty then
         begin
           dmdatabase.tblDocHeader.Edit;
           dmdatabase.tblDocHeaderBrepeating.AsInteger:= 1;
           dmdatabase.tblDocHeader.Post;
           Ok:=True;
            For Count:=0 to lvRepeating.Items.Count-1 do
               if lvRepeating.Items[Count].SubItems.Strings[2]=qryDocHead.FieldByName('WDocID').AsString then Ok:=False;
//
           if ok then
           with lvRepeating do
           begin
             ListItem := Items.Add;
             ListItem.Caption:= qryDocHead.FieldByName('SDocNo').AsString;
             listItem.subitems.add(qryDocHead.FieldByName('SDescription').AsString);
             listItem.subitems.add(FormatDateTime(ShortDateFormat,qryDocHead.FieldByName('DDate').AsDateTime));
             listItem.subitems.add(qryDocHead.FieldByName('WDocID').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('SACCOUNTCODE').AsString);
             listItem.subitems.add(qryDocHead.FieldByName('SACCOUNTCODE').AsString);
           end;
         end;
        end;
       dmdatabase.tblDocHeader.Active:=False;
       qryDocHead.Active:=False;
       qryDocHead.Active:=True;


   if lvRepeating.Items.Count>0 then begin
     BtnGenerate.Enabled := True;
     RgDocType.Enabled := False;
     lvRepeating.AlphaSort ;
    end;
end;

procedure TfmConfirmDocs.BtnDeleteClick(Sender: TObject);

begin

  While Count<=lvRepeating.Items.Count-1 do
     if  (lvRepeating.Items[Count].selected) Then

     begin
 
       lvRepeating.Items.Delete(Count);

     end
     else
      Inc(Count);
 
    qryDocHead.Active:=False;
    qryDocHead.Active:=True;
    if lvRepeating.Items.Count<=0 then begin
      BtnGenerate.Enabled:=False;
      RgDocType.Enabled := True;
    end;
end;

procedure TfmConfirmDocs.BtnGenerateClick(Sender: TObject);
Var
  Count : Integer ;
  ToAccount,NewDocId         :Integer;
  TWDocID          :String;
  DoDelete : Boolean ;
begin
  if lvRepeating.Items.Count = 0 then exit ;
  if lvRepeating.Items.Count > 1 then
  DoDelete := OSFMessageDlg(format(gettextlang(2882),[RgDocType.items[RgDocType.itemindex]]),mtConfirmation,[mbyes,mbno],0) = mryes
  else
  DoDelete := OSFMessageDlg(format(gettextlang(2881),[RgDocType.items[RgDocType.itemindex]]),mtConfirmation,[mbyes,mbno],0) = mryes ;

  PnlPrg.Visible:=True;
     // tblAccount.close;

     tblAccount.open;
     For Count:=0 to lvRepeating.Items.Count-1 do
     begin
       lblCount.Caption:=IntToStr(Count+1)+ ' '+gettextlang(3005){of}+' '+IntToStr(lvRepeating.Items.Count);
       lblCount.Repaint;
       prgBar.Position:=0;
       prgBar.Repaint;
       TWDocID:=lvRepeating.Items[Count].SubItems[2];
       // Prepare Debtors list
       FromAcc:=lvRepeating.Items[Count].SubItems[3];
       ToAcc:=lvRepeating.Items[Count].SubItems[4];
      // if FromAcc>ToAcc then ;// Just in Case
       tblAccount.filtered:=false;
       tblAccount.filter:='WAccountTypeID='+IntToStr(RgDocType.ItemIndex+1)+' and SACCOUNTCODE>='''+FromAcc+''' And SACCOUNTCODE<='''+ToAcc+'''';
       tblAccount.filtered:=True;
       // Creating Header Docs
       tblAccount.First;
       while not tblAccount.Eof do
         begin
           ToAccount := tblAccountWAccountID.AsInteger ;

           CopyDocument(StrToInt(TWDocID),ToAccount,RgDocType.ItemIndex,DoDelete,genlist,GenDate.Date,CBUseDocDate.Checked,NewDocId);
          
           tblAccount.next ;
         end; // Next Debtor
     end; /// Next Count
     qryDocHead.Active:=False;
     qryDocHead.Active:=True;
     tblAccount.Close;

  lvRepeating.Items.Clear;
  BtnGenerate.Enabled:=False;
  RgDocType.Enabled := True;
  PnlPrg.Visible:=False;
end;

procedure TfmConfirmDocs.lvRepeatingEnter(Sender: TObject);
begin
  BtnAdd.Enabled:=False;
  BtnDelete.Enabled:=True;
  btnPubliPost.Enabled:=True;
end;

procedure TfmConfirmDocs.FormCreate(Sender: TObject);
begin
  DMTCCoreLink.AssignConnectionToChilds(self);
  GenList:=TStringList.Create;
  cxdocs.Align := alClient ;
end;

procedure TfmConfirmDocs.FormDestroy(Sender: TObject);
begin
  GenList.Free;
end;

procedure TfmConfirmDocs.btnPubliPostClick(Sender: TObject);
begin
  if lvRepeating.SelCount<=0 then exit;
  FromAcc:=lvRepeating.selected.SubItems[3];
  ToAcc:=lvRepeating.selected.SubItems[4];
  tblAccount.close;
 
  tblAccount.open;
  tblAccount.filtered:=True;
  PnlSelectDbt.BringToFront;

  application.ProcessMessages;
  PnlSelectDbt.Visible:=True;


  tblAccount.Locate('SACCOUNTCODE',FromAcc,[]);
  cxGrid2.SetFocus;

end;

procedure TfmConfirmDocs.lvRepeatingSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  FromAcc:=item.SubItems[3];
  ToAcc:=item.SubItems[4];
end;

procedure TfmConfirmDocs.PnlSelectDbtExit(Sender: TObject);
begin
  if PnlSelectDbt.Visible then PnlSelectDbt.visible:=false;
  tblAccount.close;
  tblAccount.filtered:=false;
  tblAccount.filter:='';
end;

procedure TfmConfirmDocs.btnCancelDbtClick(Sender: TObject);
begin
  lvRepeating.setfocus;
end;

procedure TfmConfirmDocs.RgDocTypeClick(Sender: TObject);
begin
   FormShow(Sender);
end;

procedure TfmConfirmDocs.PnlSelectDbtEnter(Sender: TObject);
begin
  cxGrid2DBTableView1SACCOUNTCODE.Caption := GetTextLang(34); // 'Account;
  Case RgDocType.ItemIndex of
   0:cxGrid2DBTableView1SDESCRIPTION.Caption := GetTextLang(31); // 'Debtor';
   1:cxGrid2DBTableView1SDESCRIPTION.Caption := GetTextLang(30); //'Creditor';
  end;
end;

procedure TfmConfirmDocs.lvRepeatingKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
   45: btnPubliPostClick(Sender);
   46: BtnDeleteClick(Sender);
  end;
end;

procedure TfmConfirmDocs.lvRepeatingCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
 if  (Item2.SubItems.Count < 1) or(Item1.SubItems.Count < 1) then exit ;

 if LastIndex = 0 then
  begin
   Compare :=  CompareStr(Item1.Caption,Item2.Caption) ;
  end else
   if LastIndex = 2 then
  begin
   if StrToDate(Item1.SubItems[1]) =   StrToDate(Item2.SubItems[1]) then
     Compare := 0 else
   if  StrToDate(Item1.SubItems[1]) < StrToDate(Item2.SubItems[1]) then
     Compare := -1 else
     Compare := 1 ;
  end else
  begin
   Compare :=   CompareStr(Item1.SubItems[LastIndex-1],item2.SubItems[LastIndex-1]) ;
  end;
  if SortDirection then
     Compare := - Compare ;
end;

procedure TfmConfirmDocs.lvRepeatingColumnClick(Sender: TObject;
  Column: TListColumn);
begin
 SortDirection := not SortDirection ;

 LastIndex :=  Column.Index ;
 lvRepeating.AlphaSort  ;


end;

procedure TfmConfirmDocs.edKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = ord(#13) then
    btSearchClick(self);
end;

procedure TfmConfirmDocs.edDateKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = ord(#13) then
    btSearchClick(self);
end;

procedure TfmConfirmDocs.cbShowPostedClick(Sender: TObject);
begin
 FormShow(Sender);
end;

procedure TfmConfirmDocs.cxdocsDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

 if GenList.IndexOf( VarToStr(AViewInfo.GridRecord.Values[cxdocsDBTableView1WDOCID.Index]))>-1 then
   ACanvas.Font.Color:=clRed
end;

procedure TfmConfirmDocs.cxGrid2DBTableView1DblClick(Sender: TObject);
begin
 lvRepeating.selected.SubItems[4] :=  tblAccountSACCOUNTCODE.AsString ;
 lvRepeating.selected.SubItems[3] :=  tblAccountSACCOUNTCODE.AsString ;
 PnlSelectDbt.Visible := False ;

end;

end.



