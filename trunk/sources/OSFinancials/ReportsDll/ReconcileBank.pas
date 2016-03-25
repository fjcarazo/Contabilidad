unit ReconcileBank;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, ToolWin, ComCtrls, Buttons,
  Db,  Wwquery, ImgList, Menus, DBCtrls, wwDataInspector, fcImager;

type
  TfmReconcileBank = class(TForm)
    ButtonPanel: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtReference: TEdit;
    edtAmount: TEdit;
    dtpDate: TDateTimePicker;
    PnB: TPanel;
    Pna: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    fcImager1: TfcImager;
    lblMes1: TLabel;
    BankAmt: TLabel;
    lblOutRec: TLabel;
    LblPymOut: TLabel;
    lblBankBal: TLabel;
    LblDif: TLabel;
    lblMes2: TLabel;
    lblMes6: TLabel;
    lblMes5: TLabel;
    lblMes4: TLabel;
    lblRecBal: TStaticText;
    Shape3: TShape;
    lblMes3: TLabel;
    DataSource1: TDataSource;
    Panel3: TPanel;
    dbgridRecon: TwwDBGrid;
    Panel4: TPanel;
    Label5: TLabel;
    gridBank: TwwDBGrid;
    Splitter1: TSplitter;
    PopupMenu1: TPopupMenu;
    Generatebankbookings1: TMenuItem;
    ToolBar1: TToolBar;
    sbConsolidate: TToolButton;
    sbShowamount: TToolButton;
    ToolButton2: TToolButton;
    sbReconcile: TToolButton;
    sbUnReconcile: TToolButton;
    ToolButton3: TToolButton;
    sbSearch: TToolButton;
    ToolButton1: TToolButton;
    sbProcess: TToolButton;
    TBReport: TToolButton;
    pnpProcess: TPopupMenu;
    ApplyRecon: TMenuItem;
    TransferUnreconciledtoBaches1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReferenceKeyPress(Sender: TObject; var Key: Char);
    procedure edtAmountKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDateKeyPress(Sender: TObject; var Key: Char);
    procedure sbShowamountClick(Sender: TObject);
    procedure sbUnReconcileClick(Sender: TObject);
    procedure dbgridReconIButtonClick(Sender: TObject);
    procedure sbSearchClick(Sender: TObject);
    procedure PnBEnter(Sender: TObject);
    procedure PnaEnter(Sender: TObject);
    procedure Panel2Enter(Sender: TObject);
    procedure dbgridReconRowChanged(Sender: TObject);
    procedure sbConsolidateClick(Sender: TObject);
    procedure dbgridReconCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure sbReconcileClick(Sender: TObject);
    procedure dbgridReconFieldChanged(Sender: TObject; Field: TField);
    procedure dbgridReconKeyPress(Sender: TObject; var Key: Char);
    procedure Panel2Exit(Sender: TObject);
    procedure dsProcessInfoEnter(Sender: TObject);
    procedure sbProcessClick(Sender: TObject);
    procedure gridBankCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure gridBankDblClick(Sender: TObject);
    procedure gridBankTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure gridBankCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure Generatebankbookings1Click(Sender: TObject);
    procedure TBReportClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ApplyReconClick(Sender: TObject);
    procedure TransferUnreconciledtoBaches1Click(Sender: TObject);
  private
    ConsolBat,
    ConsolRef:String;
    { Private declarations }
    Procedure UpDateThemes;    
    Procedure AffTotAmount;
    Procedure RunBlockRecon(ReCon:Boolean);
    Procedure UpDateAmts;
  public
    { Public declarations }
  end;

var
  fmReconcileBank: TfmReconcileBank;
  Filter         : String;

implementation

uses Main, Database, ReconOptions, HtmlHelpAPI, GlobalFunctions,
  UnReconcileOptions, LanguageChoice, DatabaseAccess, TcVariables,
  XRoutines,Variants;

{$R *.DFM}
Var
  BankAccountID:integer;

Procedure UpDateRecon;
begin
  with dmDatabase do begin
    tblreconBank.DisableControls;
    tblTransaction.Open;
    tblreconBank.First;
    While not tblreconBank.Eof do begin
      if (tblreconBankSCONTRAACCOUNT.Asinteger =1) and tblTransaction.Locate('WTransactionID',tblreconBankFCREDIT.Value,[]) then begin
        tblTransaction.edit;
        tblTransactionBReconciled.Value:=tblreconBankBReconciled.Value;
        tblTransaction.Post;
      end;
      tblreconBank.Next;
    end;
//Pymt
    if TableExist('bat' + IntToStr(CurrentUser) + PymtID ) then
    begin
      tblBatch.close;
      tblBatch.Filtered:=False;
      tblBatch.TableName := 'bat' + IntToStr(CurrentUser) + PymtID ;
      tblreconBank.First;
      tblBatch.Open;
      tblreconBank.First;

      While not tblreconBank.Eof do begin
        if ( tblreconBankSCONTRAACCOUNT.Asinteger =0) and (tblreconBankFDEBIT.AsString=PymtID)then begin
          tblBatch.First;
          tblBatch.Moveby(Str2Int(tblreconBankFCREDIT.AsString)-1);
          tblBatch.Edit;
          tblBatchBReconciled.Value:=tblreconBankBReconciled.Value;
          tblBatch.Post;
        end;
        tblreconBank.Next;
      end;
    end;
//Rcpt
    if TableExist('bat' + IntToStr(CurrentUser) + RcptID ) then
    begin
      tblBatch.close;
      tblBatch.Filtered:=False;
      tblBatch.TableName :='bat' + IntToStr(CurrentUser) + RcptID;
      tblreconBank.First;
      tblBatch.Open;
      tblreconBank.First;
      tblBatch.First;
      While not tblreconBank.Eof do begin
        if not (tblreconBankSCONTRAACCOUNT.AsInteger = 1) and (tblreconBankFDEBIT.AsString=RcptID)then begin
          tblBatch.First;
          tblBatch.Moveby(Str2Int(tblreconBankFCREDIT.AsString)-1);
          tblBatch.Edit;
          tblBatchBReconciled.Value:=tblreconBankBReconciled.Value;
          tblBatch.Post;
        end;
        tblreconBank.Next;
      end;
    end;
    tblreconBank.EnableControls;
  end;
end;

Procedure TfmReconcileBank.RunBlockRecon(ReCon:Boolean);
begin
  fmUnReconcileOptions := TfmUnReconcileOptions.Create(self);
  SetUpForm(fmUnReconcileOptions);
  fmUnReconcileOptions.Reconcile:=ReCon;
  fmUnReconcileOptions.ShowModal;
  fmUnReconcileOptions.Free;
  GetReconData(BankAccountID,PymtID,RcptID,vTotalUnposted)
end;

Procedure TfmReconcileBank.AffTotAmount;
Var
  Tot:real;
begin
  if sbConsolidate.Down And (ConsolRef<>'') and (ConsolBat<>'') then begin
    dmDatabase.qGen.Close;
    dmDatabase.qGen.sql.Clear;
    dmDatabase.qGen.sql.Add('Select sum(Famount) from '+dmDatabase.RConBankTableName +
                            ' Where SReference="'+ConsolRef +'"'+
                            ' And FDEBIT='+ConsolBat);
    dmDatabase.qGen.Open;
    Tot:=dmDatabase.qGen.Fields[0].AsFloat;
    dmDatabase.qGen.Close;
  end
  else
    Tot:=dmDatabase.TblReconBankFAmount.Value;
  dbgridRecon.Columns[5].FooterValue:=FloatToStr(FixAmount(Tot));
end;

procedure TfmReconcileBank.FormShow(Sender: TObject);
begin
    // Caption 259
   Caption := GetTextLang(259) ;

    //Showamount
   sbShowamount.Caption := '&' +GetTextLang(949);
    // &Consolidate 948
   sbConsolidate.Caption := '&' + GetTextLang(948);
    // &Reconcile 950
   sbReconcile.Caption := '&' + GetTextLang(950);
    // &unReconcile 118
   sbunReconcile.Caption := '&' + GetTextLang(118);
    // &&Search 952
   sbSearch.Caption := GetTextLang(952);
    // &Process 953
   sbProcess.Caption := '&' + GetTextLang(953);
    // Messages (6)
   LblMes1.Caption := GetTextLang(233);
   LblMes2.Caption := GetTextLang(182);
   LblMes3.Caption := GetTextLang(181);
   LblMes4.Caption := GetTextLang(954);
   LblMes5.Caption := GetTextLang(74);
   LblMes6.Caption := GetTextLang(955);

   //Search by date

   Label4.Caption :=  GetTextLang(956);
   Label2.Caption := GetTextLang(957);
   Label1.Caption := GetTextLang(958);
   
  BankAmt.Caption := fmReconOptions.dbedtBankBal.Field.AsString;
  UpDateThemes;
  dmDatabase.tblTransaction.Open;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  Caption :=Caption+ '          '+GetTextLang(959)+': ' + dmDatabase.tblAccountSMAINACCOUNTCODE.Value + '-' + dmDatabase.tblAccountSSUBACCOUNTCODE.Value + ' ' + dmDatabase.tblAccountSDescription.Value;
  TBReport.Caption := GetTextLang(1754);
  BankAccountID:=dmDatabase.tblAccountWAccountID.Value;
  dtpDate.Date :=fmReconOptions.dbdtUntilDate.Date;
  Filter := dmDatabase.tblTransaction.Filter;
  dmDatabase.tblTransaction.Edit;
  ConsolRef:='';
  ConsolBat:='';
  UpDateAmts;
 // dbgridReconIButton.Caption := GetTextLang(1098);
  With dbgridRecon do
  begin
    Columns[0].DisplayLabel:=GetTextLang(241);
    Columns[1].DisplayLabel:=GetTextLang(607);
    Columns[2].DisplayLabel:=GetTextLang(238); {Date}
    Columns[3].DisplayLabel:=GetTextLang(608); {Account}
    Columns[4].DisplayLabel:=GetTextLang(178); {Description}
    Columns[5].DisplayLabel:=GetTextLang(946); {Amount}
    Columns[6].DisplayLabel:=GetTextLang(954); {Reconciled}
    ApplySelected;
  end;
  
  sbShowamountClick(Sender);


end;

procedure TfmReconcileBank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin



  dmDatabase.tblTransaction.Filtered := False;
  dmDatabase.tblTransaction.Filter := '';
  dmDatabase.tblTransaction.Close;
  Close;
  dmDatabase.TblReconBank.Close;
  dmDatabase.CdsBankDnl.Close;
  dmDatabase.CdsBankDnl.IndexName:='';
end;

procedure TfmReconcileBank.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
 if Key = 112 then
 begin
    //Result := (HTMLHelpShowHelp <> 0);
    HtmlShowTopic(149);
    key := 0;

 end
 else if Key = 116 then begin
    if ssAlt in Shift then begin
     if WindowState=wsNormal then
       WindowState:=wsMaximized
     else
       WindowState:=wsNormal;
   end;
   key := 0;
 end;
end;

procedure TfmReconcileBank.edtReferenceKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if Trim(edtAmount.Text)<>'' then begin
//      if FloatToStrF((dmDatabase.tblreconBankFAmount.Value),ffFixed,18,2)=FloatToStrF(Str2Float(edtAmount.text),ffFixed,18,2)then
      if dmDatabase.tblreconBankSReference.Value=edtReference.Text then
      begin
        if sbConsolidate.Down=False then
          dmDatabase.tblreconBank.DisableControls;
        dmDatabase.tblreconBank.edit;
        dmDatabase.tblreconBankBReconciled.Value:=1;
        dmDatabase.tblreconBank.Post;
        dbgridRecon.RefreshDisplay;
        edtAmount.Text:='';
        edtReference.Text:='';
        if sbConsolidate.Down=False then
          dmDatabase.tblreconBank.EnableControls;
      end
      else
        if (dmDatabase.tblreconBankBReconciled.Value =0) then begin
          OSFMessageDlg(edtReference.text+#13#10+
              GetTextLang(799)+#13#10{'Reference is not the same as the transaction Reference.'}+
              dmDatabase.tblreconBankSReference.Value, mtconfirmation, [mbOk], 0);
              edtReference.Text:='';
        end
        else begin
          edtAmount.Text:='';
          edtReference.Text:='';
        end;
      edtAmount.SetFocus;
    end
    else begin
      if edtReference.Text <> '' then
       if dmDatabase.tblreconBank.Locate('SReference',edtReference.text,[]) then begin
         edtAmount.Text:=FloatToStrF((dmDatabase.tblreconBankFAmount.Value),ffFixed,18,2);
         EdtAmount.SetFocus;
       end
       else begin
          OSFMessageDlg('Reference: '+edtReference.text+#13#10+
              GetTextLang(491)+#13#10{'No item to reconcile'}, mtconfirmation, [mbOk], 0);
         EdtAmount.SetFocus;
         edtReference.SetFocus;
       end;
    end;
    Key := #0;
  end;
  if Key = #27 then
  begin
    edtReference.Text := '';
    edtAmount.Text := '';
    dmDatabase.tblreconBank.Filtered := False;
    dmDatabase.tblreconBank.Filter := '';
    Key := #0;
  end;
end;

procedure TfmReconcileBank.edtAmountKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if Trim(edtReference.text)='' then begin
     if dmDatabase.tblreconBank.Locate('FAmount',edtAmount.text,[]) then begin
       edtReference.Text:=dmDatabase.tblreconBankSReference.Value;
       edtReference.SetFocus;
     end
     else begin
       OSFMessageDlg(GetTextLang(946)+': '+edtAmount.text+#13#10+
         GetTextLang(491)+#13#10{'No item to reconcile'}, mtconfirmation, [mbOk], 0);
       edtReference.SetFocus;
       EdtAmount.SetFocus;
     end;
    end
    else begin
      if FloatToStrF((dmDatabase.tblreconBankFAmount.Value),ffFixed,18,2)=FloatToStrF(Str2Float(edtAmount.text),ffFixed,18,2)then
      begin
        if sbConsolidate.Down=False then
          dmDatabase.tblreconBank.DisableControls;
        dmDatabase.tblreconBank.edit;
        dmDatabase.tblreconBankBReconciled.Value:=1;
        dmDatabase.tblreconBank.Post;
        dbgridRecon.RefreshDisplay;
        edtAmount.Text:='';
        edtReference.Text:='';
        if sbConsolidate.Down=False then
          dmDatabase.tblreconBank.EnableControls;
      end
      else
        if (dmDatabase.tblreconBankBReconciled.Value =0)then begin
          OSFMessageDlg(FloatToStrF(Str2Float(edtAmount.text),ffFixed,18,2)+#13#10+
              GetTextLang(797)+#13#10{'Amount is not the same as the transaction amount.'}+
              FloatToStrF((dmDatabase.tblreconBankFAmount.Value),ffFixed,18,2), mtconfirmation, [mbOk], 0);
             edtAmount.Text:='';
        end     
        else begin
          edtAmount.Text:='';
          edtReference.Text:='';
        end;
      edtReference.SetFocus;
    end;
    Key := #0;
  end;
  if Key = #27 then
  begin
    edtReference.Text := '';
    edtAmount.Text := '';
      dmDatabase.tblreconBank.Filtered := False;
      dmDatabase.tblreconBank.Filter :='';
    Key := #0;
  end;
end;

procedure TfmReconcileBank.dtpDateKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    dmDatabase.tblreconBank.Filtered := False;
    dmDatabase.tblreconBank.Filter :='';
     if dmDatabase.tblreconBank.Locate('DDate',dtpDate.Date,[]) then begin
       edtAmount.Text:=FloatToStrF((dmDatabase.tblreconBankFAmount.Value),ffFixed,18,2);
       edtReference.Text := dmDatabase.tblreconBankSreference.Value ;
       EdtAmount.SetFocus;
     end
     else begin
       EdtAmount.SetFocus;
       dtpDate.SetFocus;
       edtReference.Text := '';
       edtAmount.Text := '';
     end;
    Key := #0;
  end;
  if Key = #27 then
  begin
    edtReference.Text := '';
    edtAmount.Text := '';
      dmDatabase.tblreconBank.Filtered := False;
      dmDatabase.tblreconBank.Filter :='';
      dmDatabase.tblreconBank.Filtered := True;
    Key := #0;
  end;
end;

procedure TfmReconcileBank.sbShowamountClick(Sender: TObject);
begin
  if Not sbShowamount.Down then
  begin
    Panel4.Visible := False;
    Splitter1.Visible := False;
    dmDatabase.CdsBankDnl.Close;
    dmDatabase.CdsBankDnl.IndexName:='';
  end
  Else
  begin
    Panel4.Visible:=True;
    gridBank.Height:=120;
    gridBank.Visible:=True;
    Splitter1.Visible:=True;
    try dmDatabase.CdsBankDnl.Close except end;
    dmDatabase.CdsBankDnl.IndexName:='';
    dmDatabase.CdsBankDnl.CreateDataSet;
    if ReadReportOp('CBViewAllBankState',true).AsBoolean then
        LoadSqlinCds('Select * From DnlBanks where WLineTypeID<>2 And BReconciled<>1 ',dmDatabase.CdsBankDnl)
      else
        LoadSqlinCds('Select * From DnlBanks where WLineTypeID<>2 And BReconciled<>1 and WBankID=' + IntToStr(BankAccountID)+' ',dmDatabase.CdsBankDnl);
    Label5.Visible:=True;
    FieldBy2 := 'Sreference';
    SortClientDataSet(dmDatabase.CdsBankDnl,FieldBy2,BDesc2);
  end;


  Label5.Caption := GetTextLang(2061) ;
  gridBank.Columns[0].DisplayLabel:=GetTextLang(607);
  gridBank.Columns[1].DisplayLabel:=GetTextLang(238); {Date}
  gridBank.Columns[2].DisplayLabel:=GetTextLang(606);
  gridBank.Columns[3].DisplayLabel:=GetTextLang(946);
  gridBank.Columns[4].DisplayLabel:=GetTextLang(954);
  gridBank.Columns[5].DisplayLabel:=GetTextLang(166);
  Generatebankbookings1.Caption := GetTextLang(2060) ;
  {There is a problem with this ?}
//  sbShowamount.Down := Not sbShowamount.Down;
end;


procedure TfmReconcileBank.sbUnReconcileClick(Sender: TObject);
begin
   dmDatabase.tblreconBank.DisableControls;
   RunBlockRecon(False);
   dmDatabase.tblreconBank.EnableControls;
   UpDateAmts;
end;

procedure TfmReconcileBank.dbgridReconIButtonClick(Sender: TObject);
begin
  dmDatabase.tblreconBank.Filtered := False;
  dmDatabase.tblreconBank.Filter :='';
  dmDatabase.tblreconBank.Filtered := True;
end;

procedure TfmReconcileBank.sbSearchClick(Sender: TObject);
begin
  If sbSearch.Down then
  begin
    dbgridRecon.options:=dbgridRecon.options+ [Wwdbigrd.dgAlwaysShowSelection];
    Panel2.Visible:=true;
    Panel2.SetFocus
  end
  else
  begin
    dbgridRecon.options:=dbgridRecon.options - [Wwdbigrd.dgAlwaysShowSelection];  
    Panel2.Visible:=False;
    dbgridRecon.Setfocus;
  end;
end;

procedure TfmReconcileBank.PnBEnter(Sender: TObject);
begin
  If edtReference.Visible Then edtReference.SetFocus;
end;

procedure TfmReconcileBank.PnaEnter(Sender: TObject);
begin
  If dtpDate.Visible Then dtpDate.SetFocus;
end;

procedure TfmReconcileBank.Panel2Enter(Sender: TObject);
begin
   If edtReference.Visible Then edtReference.SetFocus;
end;

procedure TfmReconcileBank.dbgridReconRowChanged(Sender: TObject);
Var
  Msg:String;
begin
  Msg:='';
  if sbConsolidate.Down then
    Msg:=GetTextLang(960);//'Total ';
  if dmDatabase.TblReconBankSCONTRAACCOUNT.AsString = '1' then
    Msg:=Msg+GetTextLang(961)//'Posted'
  else
    Msg:=Msg+GetTextLang(962);//'Unposted';
  if dmDatabase.TblReconBankFDEBIT.AsString=PymtID then
    Msg:=Msg+' '+GetTextLang(963)//' Payment item'
  else
    Msg:=Msg+' '+GetTextLang(964);//'Receipt item';
  dbgridRecon.Columns[4].FooterValue:=Msg;
  sbConsolidateClick(Sender);
end;

procedure TfmReconcileBank.sbConsolidateClick(Sender: TObject);
begin
  if sbConsolidate.Down then begin
    ConsolRef:=dmDatabase.tblreconBankSReference.Value;
    ConsolBat:=dmDatabase.TblReconBankFDEBIT.AsString;
  end
  else
  begin
    ConsolRef:='';
    ConsolBat:='';
  end;
  dbgridRecon.RefreshDisplay;
  AffTotAmount;
end;

procedure TfmReconcileBank.dbgridReconCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if sbConsolidate.Down and
     (ConsolRef=dmDatabase.tblreconBankSReference.Value) and
     (ConsolBat=dmDatabase.TblReconBankFDEBIT.AsString) then begin
     AFont.Color:=clBlue;
  end;
  if dmDatabase.tblreconBankFDEBIT.AsString=PymtID then
  begin
    ABrush.Color:=clCream;
    if  sameText(Field.FieldName,'FAmount') then
     AFont.Color:=clRed;
  end;
end;

procedure TfmReconcileBank.sbReconcileClick(Sender: TObject);
begin
   dmDatabase.tblreconBank.DisableControls;
   RunBlockRecon(True);
   dmDatabase.tblreconBank.EnableControls;
   UpDateAmts;      
end;

procedure TfmReconcileBank.dbgridReconFieldChanged(Sender: TObject;
  Field: TField);
Var
  SavePlace:TBookMark;
  HoldValue:Boolean;
begin
  if sbConsolidate.Down and (Field.FieldName='BReconciled') then
  with dmDatabase do
    begin
    HoldValue:=Field.Value;
    SavePlace:=tblreconBank.GetBookmark;
    tblreconBank.DisableControls;
    try
    tblreconBank.First;
    while not tblreconBank.Eof do begin
      if (ConsolRef=dmDatabase.tblreconBankSReference.Value) and
        (ConsolBat=dmDatabase.TblReconBankFDEBIT.AsString) then begin
        tblreconBank.Edit;
        tblreconBankBReconciled.Value:=ord(HoldValue);
        tblreconBank.Post;
      end;
      tblreconBank.Next;
    end;
    finally
    if tblreconBank.BookmarkValid(SavePlace) then
    tblreconBank.GotoBookmark(SavePlace);
    tblreconBank.FreeBookmark(SavePlace);
    tblreconBank.EnableControls;
    end;
    tblreconBank.Edit;
  end
  else
    dmDatabase.tblreconBank.Post;
  UpDateAmts;
end;

procedure TfmReconcileBank.dbgridReconKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if Key=#13 then begin
//    key:=#0;
//  end;
  if Key=#27 then
  begin
    if OSFMessageDlg(GetTextLang(642){'Do you wish to continue ?'} , mtinformation, [mbYes,mbNo], 0)<>mrYes then
//      if OSFMessageDlg(GetTextLang(490){'Are you sure you want to cancel the changes ?'}, mtconfirmation, [mbyes, mbno], 0) = mryes then
      Close;
  end;
  
end;

procedure TfmReconcileBank.Panel2Exit(Sender: TObject);
begin
  edtReference.Text:='';
  edtAmount.Text:='';
end;

procedure TfmReconcileBank.dsProcessInfoEnter(Sender: TObject);
begin
  try
    dbgridRecon.SetFocus;
  except end;
end;

procedure TfmReconcileBank.UpDateAmts;
Var
  RecBal,BankTotal:Real;
  PymOut,RecOut:real;
begin
  dmDatabase.qGen.Close;
  dmDatabase.qGen.SQL.Text:='Select * From '+ dmDatabase.RConBankTableName;
  dmDatabase.qGen.DisableControls;
  dmDatabase.qGen.Open;
  dmDatabase.qGen.First;
  BankTotal:=0;
  PymOut := 0;
  RecOut := 0;
  While Not dmDatabase.qGen.Eof do
  begin
    if DmDatabase.qGen.FieldByname('BReconciled').AsInteger = 0 then
    begin
      if DmDatabase.qGen.FieldByname('FDEBIT').AsString=RcptID then
        RecOut := RecOut + DmDatabase.qGen.FieldByname('FAmount').AsFloat
      else
        PymOut := PymOut - DmDatabase.qGen.FieldByname('FAmount').AsFloat;
    end;
    dmDatabase.qGen.Next;
  end;
  dmDatabase.qGen.Close;
  dmDatabase.qGen.EnableControls;
  lblOutRec.Caption := FloatToStrF(FixAmount(RecOut),ffFixed,18,2);
  LblPymOut.Caption := FloatToStrF(FixAmount(PymOut),ffFixed,18,2);
  RecBal := RecOut + PymOut + dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat;
  BankTotal:= CalcReconAmts(dmDatabase.tblReportingOptions.FieldByName('DReconUntil').AsDateTime,
                dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat,
                vTotalUnposted,BankAccountID);
  lblRecBal.Caption := FloatToStrF(FixAmount(RecBal),ffFixed,18,2);
  lblBankBal.Caption := FloatToStrF(FixAmount(BankTotal),ffFixed,18,2);
  LblDif.Caption := FloatToStrF(FixAmount(BankTotal-RecBal),ffFixed,18,2)
end;

Procedure TfmReconcileBank.UpDateThemes;
begin
    if fmMain.SetupTheme.Count<=1 then Exit;
    LoadT3image(image1,ThemePath+'backGround2.Jpg');
end;

procedure TfmReconcileBank.sbProcessClick(Sender: TObject);
var
  OldName:String;
begin
  OldName:=dmDatabase.tblBatch.TableName;
  //UpDateRecon;
  UpDateBankRecon(PymtID,RcptID);

  dmDatabase.tblbatch.Close;
  dmDatabase.tblBatch.TableName:=OldName;
  GetReconData(BankAccountID,PymtID,RcptID,vTotalUnposted);
  Try
    sbShowamountClick(Sender);
  except end;  

end;

procedure TfmReconcileBank.gridBankCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if gridBank.DataSource.DataSet.FieldByName('WAmtSgn').AsInteger<0 then
  begin
    ABrush.Color:=clCream;
    if  sameText(Field.FieldName,'FAmount') then
     AFont.Color:=clRed;
  end;
end;

procedure TfmReconcileBank.gridBankDblClick(Sender: TObject);
begin
  {Edit }
end;

procedure TfmReconcileBank.gridBankTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  FieldBy2 := AFieldName;
  SortClientDataSet(dmDatabase.CdsBankDnl,aFieldName,BDesc2);
end;

procedure TfmReconcileBank.gridBankCalcTitleImage(Sender: TObject;
  Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
    if SameText(Field.FieldName,FieldBy2) then
     TitleImageAttributes.ImageIndex:=GetArrowIdx(BDesc2);
end;

procedure TfmReconcileBank.Generatebankbookings1Click(Sender: TObject);
  // done : Pieter Generate these bookings to the Bank payments and recieptions
Var
  OK,ISReverse:Boolean;
  DummyId : Integer ;
begin
  // order on date
  if  (PymtID = '0' )or(RcptID = '0' ) then
      begin
      OSFMessageDlg(GetTextLang(1926),mtWarning,[mbok],0) ;
      Exit ;
      end;
  GetReconData(BankAccountID,PymtID,RcptID,vTotalUnposted);

  OK := true ;
  SortClientDataSet(dmDatabase.CdsBankDnl,'DPostedDate',OK);
  if ok then
  SortClientDataSet(dmDatabase.CdsBankDnl,'DPostedDate',OK);

  OK := false ;
  with dmDatabase do
  begin
    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(PymtID),OK,False);
    if ok then
      tmpstrs1 := OpenBatch(GetBatchTypeName(StrTOInt(PymtID)),DummyId,False);
          tblBatch.DisableControls ;
          try
    //if FileExists(dmDatabase.tblAccount.Connection + '\bat' + IntToStr(CurrentUser) + PymtID + '.db') then
    begin
      ISReverse := ReadReportOp(PymtID + 'BReverseContra',false).AsBoolean ;
      tblBatch.close;
      tblBatch.Filtered:=False;
      //tblBatch.TableName :=dmDatabase.tblAccount.Connection + '\bat' + IntToStr(CurrentUser) + PymtID + '.db';tblreconBank.First;
      tblBatch.TableName := tmpstrs1;
      tblBatch.Open;
      CdsBankDnl.First;

      While not CdsBankDnl.Eof do
        begin

          if CdsBankDnlFAmount.AsFloat < 0 then
           begin

            tblBatch.Insert ;
            if ISReverse then
            begin
            tblBatchFDEBIT.AsFloat :=  0 ;
            tblBatchFCREDIT.AsFloat := - CdsBankDnlFAmount.AsFloat ;
            tblBatchFTaxAmount.AsFloat := 0 ;
            tblBatchFAmount.AsFloat :=   CdsBankDnlFAmount.AsFloat ;
            end else
            begin
            tblBatchFCREDIT.AsFloat :=  0 ;
            tblBatchFDEBIT.AsFloat := - CdsBankDnlFAmount.AsFloat ;
            tblBatchFTaxAmount.AsFloat := 0 ;
            tblBatchFAmount.AsFloat :=  - CdsBankDnlFAmount.AsFloat ;
            end;
            tblBatchSDescription.AsString := CdsBankDnlSDescription.AsString ;
            tblBatchBReconciled.AsInteger := 1 ;
            tblBatchSReference.AsString := CdsBankDnlSReference.AsString ;
            tblBatchDDate.AsDateTime :=  CdsBankDnlDPostedDate.AsDateTime ;
            tblBatchBExclusive.AsInteger := 0 ;
            tblBatch.Post;
            CdsBankDnl.edit ;
            dmdatabase.CdsBankDnlBReconciled.AsInteger := 1 ;
            CdsBankDnl.post ;
           end ;
          CdsBankDnl.Next;
        end;


      end;

//Rcpt
    ok := false ;
    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(RcptID),OK,False);
    if ok then
      tmpstrs1 :=  OpenBatch(GetBatchTypeName(StrToInt(RcptID)),DummyId,False);
    begin
      ISReverse := ReadReportOp(RcptID + 'BReverseContra',false).AsBoolean ;
      tblBatch.close;
      tblBatch.Filtered:=False;
      tblBatch.TableName := tmpstrs1;
      tblBatch.Open;
      CdsBankDnl.First;

      While not CdsBankDnl.Eof do
        begin
          if CdsBankDnlFAmount.AsFloat > 0 then
           begin
            tblBatch.Insert ;
            if ISReverse then
            begin
            tblBatchFCREDIT.AsFloat := 0 ;
            tblBatchFDEBIT.AsFloat :=  CdsBankDnlFAmount.AsFloat ;
            tblBatchFAmount.AsFloat :=   CdsBankDnlFAmount.AsFloat ;
            tblBatchFTaxAmount.AsFloat :=  0 ;
            end else
            begin
            tblBatchFCREDIT.AsFloat := CdsBankDnlFAmount.AsFloat ;
            tblBatchFDEBIT.AsFloat :=  0 ;
            tblBatchFAmount.AsFloat :=  - CdsBankDnlFAmount.AsFloat ;
            tblBatchFTaxAmount.AsFloat :=  0 ;
            end;
            tblBatchSDescription.AsString := CdsBankDnlSDescription.AsString ;
            tblBatchSReference.AsString := CdsBankDnlSReference.AsString ;
            tblBatchDDate.AsDateTime :=  CdsBankDnlDPostedDate.AsDateTime ;
            tblBatchBExclusive.AsInteger := 0 ;
            tblBatch.Post;
            CdsBankDnl.edit ;
            dmdatabase.CdsBankDnlBReconciled.AsInteger := 1 ;
            CdsBankDnl.post ;
           end ;
          CdsBankDnl.Next;
        end;
      end;
         finally
           tblBatch.enableControls ;
        end;
       tblBatch.close;
    end;
// set it to reconcield
    if dmdatabase.CdsBankDnl.Active then
    begin
      dmdatabase.tblBankdnl.open;
      dmdatabase.CdsBankDnl.DisableControls;
      dmdatabase.CdsBankDnl.First;
      While not dmdatabase.CdsBankDnl.eof do
      begin
        if dmdatabase.tblBankdnl.Locate('StransID;WlineID;SACCOUNTCODE',VarArrayof([dmdatabase.CdsBankDnlStransID.AsString,dmdatabase.CdsBankDnlWlineID.AsInteger,dmdatabase.CdsBankDnlSACCOUNTCODE.AsString]),[]) then
        begin
          dmdatabase.tblBankdnl.Edit;
          dmdatabase.tblBankDnlBReconciled.Value := ord(dmdatabase.CdsBankDnlBReconciled.Value);
          dmdatabase.tblBankdnl.Post;
        end;
        dmdatabase.CdsBankDnl.Next;
      end;
      dmdatabase.CdsBankDnl.EnableControls;
      dmdatabase.tblBankdnl.Close;
    end;

end;

procedure TfmReconcileBank.TBReportClick(Sender: TObject);
var
fmReconOptions : TfmReconOptions ;
TempFilter , TempSql,TempTableName : String ;
begin
  // Re-used as 1= Input Recon and 2=Report Recon
  idDocType:=2;
  TempFilter := dmDatabase.tblAccount.Filter ;
  TempTableName := dmDatabase.RConBankTableName ;
  fmReconOptions := TfmReconOptions.Create(self);
  try
  SetUpForm(fmReconOptions);
  fmReconOptions.ShowModal;
  finally
  FreeAndNil(fmReconOptions);
  end;
  idDocType:=1;

  dmDatabase.tblReportingOptions.open;
  dmDatabase.tblAccount.Filter := TempFilter;
  dmDatabase.tblAccount.Filtered := TempFilter <> '' ;
  dmDatabase.tblAccount.open;
  dmDatabase.RConBankTableName := TempTableName ;
  dmDatabase.tblReconBank.sql.text := 'Select * from '  + dmDatabase.RConBankTableName ;
 // dmDatabase.tblReconBank.Query.Text:=TempSql;
  dmDatabase.tblReconBank.open;
end;

procedure TfmReconcileBank.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 CanClose := true ;
   if (dmDatabase.TblReconBank.state = dsedit) then
    CanClose :=  OSFMessageDlg(gettextlang(2096),mtConfirmation,[mbyes,mbno],0) <> mryes ;

end;

procedure TfmReconcileBank.ApplyReconClick(Sender: TObject);
 var
  OldName:String;
begin
  OldName:=dmDatabase.tblBatch.TableName;
  //UpDateRecon;
  UpDateBankRecon(PymtID,RcptID);

  dmDatabase.tblbatch.Close;
  dmDatabase.tblBatch.TableName:=OldName;
  GetReconData(BankAccountID,PymtID,RcptID,vTotalUnposted);
  Try
    sbShowamountClick(Sender);
  except end;  
//  Close;
end;

procedure TfmReconcileBank.TransferUnreconciledtoBaches1Click(
  Sender: TObject);
Var
  OK,ISReverse:Boolean;
  DummyId : Integer ;
  Amt : Real;
begin
(*
  // order on date
  if  (PymtID = '0' )or(RcptID = '0' ) then
      begin
      OSFMessageDlg(GetTextLang(1926),mtWarning,[mbok],0) ;
      Exit ;
      end;
  GetReconData(BankAccountID,PymtID,RcptID,vTotalUnposted);

  OK := true ;
  SortClientDataSet(dmDatabase.CdsBankDnl,'DPostedDate',OK);
  if ok then
  SortClientDataSet(dmDatabase.CdsBankDnl,'DPostedDate',OK);

*)
  OK := false ;
  with dmDatabase do
  begin
    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(PymtID),OK,False);
    if ok then
      tmpstrs1 := OpenBatch(GetBatchTypeName(StrTOInt(PymtID)),DummyId,False);
          tblBatch.DisableControls ;
          try
      ISReverse := ReadReportOp(PymtID + 'BReverseContra',false).AsBoolean ;
      tblBatch.close;
      tblBatch.Filtered:=False;
      tblBatch.TableName := tmpstrs1;
      tblBatch.Open;
      CdsBankDnl.First;

      While not CdsBankDnl.Eof do
        begin
          Amt := CdsBankDnl.FieldByName('WAmtSgn').AsInteger * CdsBankDnlFAmount.AsFloat;
          if amt < 0 then
           begin

            tblBatch.Insert ;
            if ISReverse then
            begin
            tblBatchFDEBIT.AsString :=  '' ;
            tblBatchFCREDIT.AsFloat := ABS(amt) ;
            tblBatchFTaxAmount.AsFloat := 0 ;
            tblBatchFAmount.AsFloat :=   amt ;
            end else
            begin
            tblBatchFCREDIT.AsString :=  '' ;
            tblBatchFDEBIT.AsFloat := Abs(amt) ;
            tblBatchFTaxAmount.AsFloat := 0 ;
            tblBatchFAmount.AsFloat :=  - amt ;
            end;
            tblBatchSDescription.AsString := CdsBankDnlSDescription.AsString ;
            tblBatchBReconciled.AsInteger := 1 ;
            tblBatchSReference.AsString := CdsBankDnlSReference.AsString ;
            tblBatchDDate.AsDateTime :=  CdsBankDnlDPostedDate.AsDateTime ;
            tblBatchBExclusive.AsInteger := 0 ;
            tblBatch.Post;
            CdsBankDnl.edit ;
            dmdatabase.CdsBankDnlBReconciled.AsInteger := 1 ;
            CdsBankDnl.post ;
           end ;
          CdsBankDnl.Next;
        end;


//Rcpt
    ok := false ;
    tmpstrs1 := ComposeBatName(CurrentUser,StrToInt(RcptID),OK,False);
    if ok then
      tmpstrs1 :=  OpenBatch(GetBatchTypeName(StrToInt(RcptID)),DummyId,False);
    begin
      ISReverse := ReadReportOp(RcptID + 'BReverseContra',false).AsBoolean ;
      tblBatch.close;
      tblBatch.Filtered:=False;
      tblBatch.TableName := tmpstrs1;
      tblBatch.Open;
      CdsBankDnl.First;

      While not CdsBankDnl.Eof do
        begin
          Amt := CdsBankDnl.FieldByName('WAmtSgn').AsInteger * CdsBankDnlFAmount.AsFloat;
          if amt > 0 then
           begin
            tblBatch.Insert ;
            if ISReverse then
            begin
            tblBatchFCREDIT.AsSTring := '' ;
            tblBatchFDEBIT.AsFloat :=  ABS(amt) ;
            tblBatchFAmount.AsFloat :=   amt ;
            tblBatchFTaxAmount.AsFloat :=  0 ;
            end else
            begin
            tblBatchFCREDIT.AsFloat :=  Abs(amt) ;
            tblBatchFDEBIT.AsString :=  '' ;
            tblBatchFAmount.AsFloat :=  - amt ;
            tblBatchFTaxAmount.AsFloat :=  0 ;
            end;
            tblBatchSDescription.AsString := CdsBankDnlSDescription.AsString ;
            tblBatchSReference.AsString := CdsBankDnlSReference.AsString ;
            tblBatchDDate.AsDateTime :=  CdsBankDnlDPostedDate.AsDateTime ;
            tblBatchBExclusive.AsInteger  := 0 ;
            tblBatch.Post;
            CdsBankDnl.edit ;
            dmdatabase.CdsBankDnlBReconciled.AsInteger := 1 ;
            CdsBankDnl.post ;
           end ;
          CdsBankDnl.Next;
        end;
      end;
         finally
           tblBatch.enableControls ;
        end;
       tblBatch.close;
    end;
// set it to reconcield
    if dmdatabase.CdsBankDnl.Active then
    begin
      dmdatabase.tblBankdnl.open;
      dmdatabase.CdsBankDnl.DisableControls;
      dmdatabase.CdsBankDnl.First;
      While not dmdatabase.CdsBankDnl.eof do
      begin
        if dmdatabase.tblBankdnl.Locate('StransID;WlineID;SACCOUNTCODE',VarArrayof([dmdatabase.CdsBankDnlStransID.AsString,dmdatabase.CdsBankDnlWlineID.AsInteger,dmdatabase.CdsBankDnlSACCOUNTCODE.AsString]),[]) then
        begin
          dmdatabase.tblBankdnl.Edit;
          dmdatabase.tblBankDnlBReconciled.Value := ord(dmdatabase.CdsBankDnlBReconciled.Value);
          dmdatabase.tblBankdnl.Post;
        end;
        dmdatabase.CdsBankDnl.Next;
      end;
      dmdatabase.CdsBankDnl.EnableControls;
      dmdatabase.tblBankdnl.Close;
    end;


end;

end.
