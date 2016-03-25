(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit PrintDocuments;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DB,Buttons, ComCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker,Quickrpt,QRExport, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdblook;

type
  TfmPrintDocs = class(TForm)
    ButtonPanel: TPanel;
    Panel1: TPanel;
    dbgInvoiceList: TwwDBGrid;
    PnlPrg: TPanel;
    lblCount: TLabel;
    prgBar: TProgressBar;
    StBar: TStatusBar;
    Panel2: TPanel;
    CbDocTypeNew: TComboBox;
    Label3: TLabel;
    Panel3: TPanel;
    RbRange: TRadioButton;
    RbSelect: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    lbSearchBy: TLabel;
    edDate: TwwDBDateTimePicker;
    btSearch: TButton;
    ed: TEdit;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel4: TPanel;
    DestLbl: TLabel;
    cbDestination: TComboBox;
    lblCopies: TLabel;
    edtCount: TEdit;
    UpDown1: TUpDown;
    Bitprn1: TBitBtn;
    Label4: TLabel;
    cboxFromInvoice: TwwDBLookupCombo;
    cboxToInvoice: TwwDBLookupCombo;
    cbUnPrinted: TCheckBox;
    cbUnposted: TCheckBox;
    ChkService: TwwDBComboBox;
    CBDocLayout: TComboBox;
    Label20: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RbRangeClick(Sender: TObject);
    procedure RbSelectClick(Sender: TObject);
    procedure CbDocTypeNewChange(Sender: TObject);
    procedure dbgInvoiceListEnter(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure dbgInvoiceListCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btSearchClick(Sender: TObject);
    procedure edDateChange(Sender: TObject);
    procedure edChange(Sender: TObject);
    procedure dbgInvoiceListTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgInvoiceListDblClick(Sender: TObject);
    procedure cboxFromInvoicexExit(Sender: TObject);
    procedure cboxFromInvoiceKeyPress(Sender: TObject; var Key: Char);
    procedure cbUnPrintedClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    UpOrder:Boolean;
    Procedure OrderDocTbl;
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    { Public declarations }
  end;

var
  fmPrintDocs: TfmPrintDocs;
  sOrder     :String;
implementation

uses Database, Main, GlobalFunctions, LanguageChoice, DocumentsReport,
  PrePrinted, PosRoutines, TcVariables, DosTextReports, DatabaseAccess,
  XRoutines, FreeReportsUnit;

{$R *.DFM}

Procedure TfmPrintDocs.OrderDocTbl;
Var
  SqlW,SQlO:String;
begin
///
  UpOrder:=Not UpOrder;
  pnlPrg.Visible:=True;
  lblCount.Caption:='Wait ....';
  prgBar.Position:=20;
  SqlW :=' DocHead.WTypeID ='''+ IntToStr(idDocType)+''' ';
//   SQL.Add('       and DocHead.WTypeID ='''+ IntToStr(idDocType)+''' ');
   if cbUnposted.Checked then
//     SQL.Add('       and DocHead.BPosted ='''+ Bool2Str(Not cbUnposted.Checked)  + ''' ');
    SqlW := SqlW +' and DocHead.BPosted ='''+ BoolToStr(Not cbUnposted.Checked)  + ''' ';
   if cbUnPrinted.Checked then
//     SQL.Add('       and DocHead.BPrinted ='''+ Bool2Str(Not cbUnPrinted.Checked) + ''' ');
    SqlW := SqlW +' and DocHead.BPrinted ='''+ BoolToStr(Not cbUnPrinted.Checked) + ''' ';

   if sOrder='' then sOrder:='SdocNo';
//     SQL.Add('Order By ');
   if UpperCase(sOrder)=UpperCase('SDescription') then
//     SQL.Add(' Account.'+sOrder)
     SQlO:=' Account.'+sOrder
   else if UpperCase(sOrder)=UpperCase('SACCOUNTCODE') then
//     SQL.Add(' Account.SACCOUNTCODE')
     SQlO:=' Account.SACCOUNTCODE'
   else
//     SQL.Add(' DocHead.'+sOrder);
     SQlO:=' DocHead.'+sOrder;
   if Not UpOrder then
//     SQL.Add(' DESC ');
   SQlO:= SQlO + ' DESC ';
   prgBar.Position:=80;
   pnlPrg.Repaint;
   OpenDocSql(SQlW,SQlO);
   if SOrder='DDate' then begin
     lbSearchBy.Caption := GetTextLang(944)+' '{'Search By '}+ dbgInvoiceList.Columns[1].DisplayLabel{' Date'} ;
     edDate.Show;
     ed.Hide;
   end
   else begin
     lbSearchBy.Caption := GetTextLang(944)+' '{'Search By '}+dbgInvoiceList.Columns[0].DisplayLabel {' Number'} ;
     edDate.Hide;
     ed.Show;
   end;
//   end;
     prgBar.Position:=100;
     pnlPrg.Visible:=False;
     prgBar.Position:=0;
end;

procedure TfmPrintDocs.FormShow(Sender: TObject);
Var
  i:Integer;
begin
 // Document Type
 Label3.Caption := GetTextLang(1087);
 //UnPrinted
 cbUnPrinted.Caption:= GetTextLang(1096);
 //UnPosted
 cbUnposted.Caption:= GetTextLang(1097);
 //From ... To
 RbRange.Caption:= GetTextLang(1069);
 //Selected
 RbSelect.Caption:= GetTextLang(1070);
 ChangePrnlbls(DestLbl,lblCopies,Bitprn1);
 //Paper Type
 Label4.Caption:= GetTextLang(323);
 //btSearch
 btSearch.Caption:= GetTextLang(952);
 //Print
 BtnOk.Caption:= GetTextLang(52);
 //BtnCancel
 BtnCancel.Caption:= GetTextLang(168);




  LoadReoprtOp;
  dmDatabase.tblAccount.Close;
  dmDatabase.tblAccount.Filtered:= False;
  dmDatabase.tblAccount.Filter:='';
  LoadPrintOutModes(cbDestination);
  FillFreeReportLayoutBox(CBDocLayout.Items);
  CBDocLayout.Items.Insert(0,gettextlang(1341));
  CBDocLayout.ItemIndex := 0 ;
  Label20.Caption :=  GetTextLang(1910) ;
  LoadPaperType(ChkService);
  Label4.Enabled:=False;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  //To Invoice 208
  Label2.Caption :=GetTextLang(208);
  Caption := GetTExtLang(1095){'Print Documents'};
  if idDocType<10 then idDocType:=10;
  if CbDocTypeNew.Items.Count<=0 then
     LoadDocTypes(CbDocTypeNew.Items,false,true) ;
  if CbDocTypeNew.ItemIndex<0 then
     CbDocTypeNew.ItemIndex:=0;

  ChkService.ItemIndex:=GetDefaultDocPaperID(idDocType)-50;
  //
  dmDatabase.qryDocHead.DisableControls;
  // Filter and Sort source Tbale
  OrderDocTbl;
  dmDatabase.qryDocHead.EnableControls;
  dbgInvoiceList.Columns[1].DisplayLabel:= GetTExtLang(238);
  dbgInvoiceList.Columns[2].DisplayLabel:= GetTExtLang(34);
  //
  if cbDestination.ItemIndex<0 then cbDestination.ItemIndex:=0;
  Case IdDocType of
  10:begin
      (* Print Invoice*)
        //From Invoice 230
       Label1.Caption := GetTextLang(230);
       dbgInvoiceList.Columns[0].DisplayLabel:= GetTextLang(234);
       dbgInvoiceList.Columns[3].DisplayLabel:= GetTextLang(31);
//       ChkService.Enabled:=True;
       Label4.Enabled:=True;
     end;
  12:Begin
      (* Print Purchase *)
       Label1.Caption := GetTextLang(694);
       dbgInvoiceList.Columns[0].DisplayLabel:= GetTextLang(703);
       dbgInvoiceList.Columns[3].DisplayLabel:= GetTextLang(30);
     end;
  13:begin
      (* Print Stock Returns *)
        //From Return 230
       Label1.Caption := GetTextLang(702);
       dbgInvoiceList.Columns[0].DisplayLabel:= GetTextLang(704);
       dbgInvoiceList.Columns[3].DisplayLabel:= GetTextLang(30);
     end;
  14:begin
      (* Print Quotes *)
        //From Return 702
       Label1.Caption := GetTextLang(772);
       dbgInvoiceList.Columns[0].DisplayLabel:= GetTextLang(771);
       dbgInvoiceList.Columns[3].DisplayLabel:= GetTextLang(31);
     end;
  15:begin
      (* Print Order*)
        //From Return 773
       Label1.Caption := GetTextLang(773);
       dbgInvoiceList.Columns[0].DisplayLabel:= GetTextLang(762);
       dbgInvoiceList.Columns[3].DisplayLabel:= GetTextLang(30);
     end;

  else
     (* Print Credit Notes *)
       //From Note 675
      Label1.Caption := GetTextLang(675);
      dbgInvoiceList.Columns[0].DisplayLabel:= GetTextLang(299);
      dbgInvoiceList.Columns[3].DisplayLabel:= GetTextLang(31);
  end;
  // Chek the First Doc Number
  if dmDatabase.qryDocHead.RecordCount>0 then
  begin
    cboxFromInvoice.Text := dmDatabase.qryDocHeadSDocNo.Value;
    cboxToInvoice.Text := dmDatabase.qryDocHeadSDocNo.Value;
  end
  else
  begin
    cboxFromInvoice.Text:='';
    cboxToInvoice.text:='';
  end;
  dmDatabase.qryDocHead.First;
  if cboxFromInvoice.Enabled=True then
     cboxFromInvoice.SetFocus
  else
     dbgInvoiceList.SetFocus;
  lbSearchBy.Caption:=GetTExtLang(944)+' '{'Search By '} +dbgInvoiceList.Columns[0].DisplayLabel {' Number'} ;
  dbgInvoiceList.RefreshDisplay;
  edtCount.Text := IntToStr(PrnVars.NumCopies);
end;


procedure TfmPrintDocs.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmPrintDocs.btnOKClick(Sender: TObject);
Var
  Count,
  TotCount:LongInt;
  vCustReport:TQuickRep;
  lst,Hst:String;
begin
  try
  DocDraft := ReadNwReportOp('WDocQuality',1).AsInteger=0;
  dmdatabase.tblOpReport.Close;  
  dmDatabase.CalledFromBatch:=False;
  Count:=0;
  EmailList.Clear;
  lst:=cboxFromInvoice.Text;
  Hst:=cboxToInvoice.Text;
  if SwapStr(lst,Hst) then begin
    cboxFromInvoice.Text:=lst;
    cboxToInvoice.Text:=Hst;
  end;
  if rbRange.Checked then begin
    TotCount:=0;
    if dmDatabase.qryDocHead.Locate('SDocNo',Lst,[loCaseInsensitive]) then
      TotCount := dmDatabase.qryDocHead.RecNo;
    if dmDatabase.qryDocHead.Locate('SDocNo',Hst,[loCaseInsensitive]) then
      TotCount := ABS(TotCount-dmDatabase.qryDocHead.RecNo)
    else
      TotCount := ABS(dmDatabase.qryDocHead.RecordCount-TotCount);
    if (totCount=0) and (Hst='') then exit;
    TotCount:=TotCount+1;
    dmDatabase.qryDocHead.Locate('SDocNo',Lst,[]);
  end
  else
    TotCount:=dbgInvoiceList.SelectedList.Count;
  if TotCount=0 then exit ; // try finally wil deal with end procedures
  PnlPrg.Visible:=True;
  lblCount.Caption:='';
  lblCount.Repaint;
  NbrAddDocAtt:=0;
//Open Infos for Print
  dmDatabase.tblMessage.Open;
  dmDatabase.tblUnit.Open;
  dmDatabase.tblStock.Open;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblDocLine.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocHeader.Filtered:=False;
  dmDatabase.tblDocHeader.Filter:='';
  qrPrintDocuments := TqrPrintDocuments.Create(Self);
  qrPrePrinted := TqrPrePrinted.Create(Self);
  try
  SetupQrFm(qrPrintDocuments);
//  SetSQlLine('')
  if ((ChkService.ItemIndex=0) or (ChkService.ItemIndex=4)) then
  begin
    vCustReport:=qrPrePrinted;
  end
  else if ChkService.ItemIndex in [5] then
  else
  begin
    vCustReport:=qrPrintDocuments;
    Application.ProcessMessages;
  end;
  if (idDocType<>19) AND Not(50+ChkService.ItemIndex in [55] ) then
  begin
    DocModel:=50+ChkService.ItemIndex;

  end
  else if Not(50+ChkService.ItemIndex in [55] ) then
  begin
    DocModel:=0;

  end;

   While  Count<TotCount  do
   begin
      dmDatabase.tblSysVars.Open;
      if ((Count Mod 10)=0) And (Count>9) and (cbDestination.itemIndex<1) then begin
        if OSFMessageDlg(GetTextLang(801{Do you want to cancel documents printing?}), mtinformation, [mbYes,mbNo], 0)=mrYes then
        Break;
      end;
      Inc(Count);
      StBar.Panels[0].Text:=dmDatabase.qryDocHeadSDocNo.AsString;
      prgBar.Position:=0;
      prgBar.Repaint;
      if rbSelect.Checked then
      begin
        dbgInvoiceList.datasource.dataset.GotoBookmark(dbgInvoiceList.SelectedList.items[Count-1]);
      end;

      // Printing Documents
      dmDatabase.tblDocHeader.Locate('SDocNo;WTypeID',VarArrayOf([dmDatabase.qryDocHeadSDocNo.AsString,idDocType]) ,[]);
      dmDatabase.tblDocHeader.Edit;
      dmDatabase.tblDocHeaderBPrinted.Value := 1;
      dmDatabase.tblDocHeader.Post;

      dmDatabase.tblDocLine.filtered:=False;
      dmDatabase.tblDocLine.filter:='WDocID='''+dmDatabase.qryDocHeadWDocID.AsString+''' ';
      dmDatabase.tblDocLine.filtered:=True;
      if ChkService.ItemIndex=4 then
        SetGrSQlLine(' AND WDocID='+IntToStr(dmDatabase.tblDocHeaderWDocID.Asinteger))
      else
        SetSQlLine(' AND WDocID='+IntToStr(dmDatabase.tblDocHeaderWDocID.Asinteger));
      dmDatabase.qrPrnDocLines.Open;

      if cbDestination.ItemIndex in [3,4] then
        begin
          // Prepareing e-mail List
          lblCount.Caption:='Preparing Documents '+IntToStr(Count)+ ' '+gettextlang(3005){of}+' '+IntToStr(TotCount);
          lblCount.Repaint;
         // Structure: DocTypeID, DocID, DocNo , AccountID , Report File No
          RepNbr:=NextEmailFileNo;
          EmailList.Add(IntToStr(idDocType)+','+dmDatabase.qryDocHeadWDocID.AsString + ','
            + dmDatabase.qryDocHeadSDocno.AsString +','
            + dmDatabase.qryDocHeadWAccountID.AsString +','
            + IntToStr(RepNbr));
          //
         if COunt>=TotCount Then
            begin
            if CBDocLayout.ItemIndex > 0 then
            ShowFrReport(cbDestination.ItemIndex,0,StrToIntDef(edtCount.Text,1),dmDatabase.tblDocHeaderWTypeID.AsInteger,CBDocLayout.Text)
            else
            ShowFrReport(cbDestination.ItemIndex,0,StrToIntDef(edtCount.Text,1),dmDatabase.tblDocHeaderWTypeID.AsInteger);
            Application.ProcessMessages ;
            end
          else // Repare email
            begin
            if CBDocLayout.ItemIndex > 0 then
            AddReportForSend(cbDestination.ItemIndex,0,dmDatabase.tblDocHeaderWTypeID.asinteger,CBDocLayout.Text)
            else
            AddReportForSend(cbDestination.ItemIndex,0,dmDatabase.tblDocHeaderWTypeID.asinteger);
            Application.ProcessMessages ;
            end;
        end
      else
      begin
        lblCount.Caption:='Printing '+IntToStr(Count)+ ' '+gettextlang(3005){of}+' '+IntToStr(TotCount);
        lblCount.Repaint;
        if ChkService.ItemIndex in [5] then
        begin
          PrintTillDoc(dmDatabase.qryDocHeadWDocID.Value);
        end
        else
        begin
          ReportID:=0;
          if ((ChkService.ItemIndex=0) or (ChkService.ItemIndex=4)) then
            ReportID:=10;
          if DocDraft AND (cbDestination.ItemIndex=1) AND (ReportID=10) then
            PrintDocTotext80('',dmDatabase.qryDocHeadWDocID.Value,50+ChkService.ItemIndex)
          else
          begin
            if Not (ChkService.ItemIndex in [0,4,5]) then
              begin
              if CBDocLayout.ItemIndex > 0 then
              ShowFrReport(cbDestination.ItemIndex,0,StrToIntDef(edtCount.Text,1),dmDatabase.tblDocHeaderWTypeID.asinteger,CBDocLayout.text)
              else
              ShowFrReport(cbDestination.ItemIndex,0,StrToIntDef(edtCount.Text,1),dmDatabase.tblDocHeaderWTypeID.asinteger)
              end
            else
              PrintReportProcess(cbDestination.ItemIndex,vCustReport,edtCount.Text);
          end;
          ReportID:=0;
        end;
      end;
      // end Printing Documents
      if rbRange.Checked then
        dmDatabase.qryDocHead.FindNext
      else
        if Count>=dbgInvoiceList.SelectedList.Count then break;
      if (TotCount=1)  then
        break;
  end;
// Close Tbales
  finally
   FreeAndNil(qrPrintDocuments);
   FreeAndNil(qrPrePrinted);
  end;
  finally
  PnlPrg.Visible:=False;
  dmDatabase.tblMessage.Close;
  dmDatabase.tblUnit.close;
  dmDatabase.tblStock.close;
  dmDatabase.tblSysVars.close;
  dmDatabase.tblDocLine.Close;
  dmDatabase.tblDocHeader.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.qrPrnDocLines.Close;
  end;
      

end;

procedure TfmPrintDocs.btnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TfmPrintDocs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveReoprtOp;
  dmDatabase.qryDocHead.Close;
  dmDatabase.tblDocHeader.Close;
  dmDatabase.tblDocHeader.filtered:=False;
  dmDatabase.tblDocHeader.Filter:='';



end;

procedure TfmPrintDocs.RbRangeClick(Sender: TObject);
begin
  rbSelect.Checked:=False;
  Label1.Enabled:=True;
  Label2.Enabled:=True;
  cboxFromInvoice.Enabled:=True;
  cboxToInvoice.Enabled:=True;
end;

procedure TfmPrintDocs.RbSelectClick(Sender: TObject);
begin
  RbRange.Checked:=False;
  Label1.Enabled:=False;
  Label2.Enabled:=False;
  cboxFromInvoice.Enabled:=False;
  cboxToInvoice.Enabled:=False;
end;

procedure TfmPrintDocs.CbDocTypeNewChange(Sender: TObject);
begin

  idDocType:=  Integer(CbDocTypeNew.Items.Objects[cbDocTypeNew.ItemIndex])  ;
  if idDocType<10 then idDocType:=10;
  FormShow(Sender)
end;

procedure TfmPrintDocs.dbgInvoiceListEnter(Sender: TObject);
begin
   RbSelect.Checked:=True;
   RbSelectClick(Sender);
end;

procedure TfmPrintDocs.cbDestinationChange(Sender: TObject);
begin
  if  cbDestination.ItemIndex=1 then
  begin
    lblCopies.Enabled:=True;
    EdtCount.Enabled:=True;
    UpDown1.Enabled:=True;
  end
  else
  begin
    lblCopies.Enabled:=False;
    EdtCount.Enabled:=False;
    UpDown1.Enabled:=False;
  end;
end;

procedure TfmPrintDocs.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmPrintDocs.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position := Nb;
  PrnVars.NumCopies := Nb;
end;

procedure TfmPrintDocs.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmPrintDocs.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmPrintDocs.dbgInvoiceListCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin

  if Highlight then exit;
  if Not (dmDatabase.qryDocHead.FieldByName('BPrinted').Asinteger = 1) then
    ABrush.Color:=clInfoBk
  else if Not (dmDatabase.qryDocHead.FieldByName('BPosted').Asinteger = 1) And not Highlight  then
   AFont.Color:=clRed;

end;

procedure TfmPrintDocs.btSearchClick(Sender: TObject);
begin
  with dmDatabase do begin
    if sOrder='DDate' then
      qryDocHead.locate(sOrder,edDate.Date,[loPartialKey])
   else if UpperCase(sOrder)=UpperCase('SACCOUNTCODE') then
     qryDocHead.locate('SACCOUNTCODE',VarArrayOf([GetMainAccountCode(ed.Text)+GetSubAccountCode(ed.Text)]),[loPartialKey,loCaseInsensitive])
   else
     qryDocHead.locate(sOrder,ed.Text,[loPartialKey,loCaseInsensitive])
  end;
end;

procedure TfmPrintDocs.edDateChange(Sender: TObject);
begin
  btSearchClick(Sender);
end;

procedure TfmPrintDocs.edChange(Sender: TObject);
begin
  btSearchClick(Sender);
end;

procedure TfmPrintDocs.dbgInvoiceListTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  sOrder:=AFieldName;
  OrderDocTbl;
end;

procedure TfmPrintDocs.dbgInvoiceListDblClick(Sender: TObject);
begin
  btnOKClick(Sender);
end;

procedure TfmPrintDocs.cboxFromInvoicexExit(Sender: TObject);
begin
//  FitIndex(cboxFromInvoice);
end;

procedure TfmPrintDocs.cboxFromInvoiceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmPrintDocs.cbUnPrintedClick(Sender: TObject);
begin
  dmDatabase.qryDocHead.DisableControls;
  // Filter and Sort source Tbale
  OrderDocTbl;
  dmDatabase.qryDocHead.EnableControls;
  dbgInvoiceList.RefreshDisplay;  
end;

Procedure TfmPrintDocs.LoadReoprtOp;
begin
  cbUnPrinted.Checked := ReadReportOp('BDocPrtUnprinted').AsBoolean;
  cbUnposted.Checked := ReadReportOp('BDocPrtUnposted').AsBoolean;
end;

Procedure TfmPrintDocs.SaveReoprtOp;
begin
  WriteReportOp('BDocPrtUnprinted',Bool2Str(cbUnPrinted.Checked));
  WriteReportOp('BDocPrtUnposted',Bool2Str(cbUnposted.Checked));
end;


procedure TfmPrintDocs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 112 then
  begin
     HtmlShowTopic(154);
     key := 0;
  end;
end;

end.


