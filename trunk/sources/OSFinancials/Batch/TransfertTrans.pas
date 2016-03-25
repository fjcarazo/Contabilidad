(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit TransfertTrans;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls,  Mask,
  TcVariables, DB,TcashClasses, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar ;

type
  TfrmTransfertTrans = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    PageControl: TPageControl;
    Default: TTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    LblFromDescription: TLabel;
    Label2: TLabel;
    Shape3: TShape;
    Label8: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    Label6: TLabel;
    LblToDescription: TLabel;
    edtFromAccount: TEdit;
    edtToAccount: TEdit;
    RecPymt: TTabSheet;
    Shape5: TShape;
    Shape4: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    CBPrintReciept: TCheckBox;
    Shape1: TShape;
    Shape6: TShape;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    Label22: TLabel;
    EAlias: TEdit;
    BitBtn2: TBitBtn;
    mpercent: TMaskEdit;
    BitBtn4: TBitBtn;
    lpaymentmethode: TLabel;
    cbxPymtMethod: TComboBox;
    tPRocess: TTimer;
    edtDate1: TcxDateEdit;
    edtAccFrom: TcxComboBox;
    edtAccTo: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnCancelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure edtAccToEnter(Sender: TObject);
    procedure edtDate1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure tPRocessTimer(Sender: TObject);
  private
    //FOriginalPageControlWndProc: TWndMethod;
    Procedure ShowAccountDes(Lbledt:Tlabel;ID:integer);
   public
     orgAmount : Double ;
     prefix : String ;
    //procedure PageControlWndProc(var Message: TMessage);
  end;
var
  Printreciept : Boolean ;
  gl_lastpaymethode , gl_transdec,gl_reference: String ;
  gl_amounttrans : Double ;
Function AutoReceivePymt(aFromAcc:TAccountRec;WTransID:integer;aDocNo:String;Var aAmt:Real;AutoProcess:boolean = false;aPrefix : String = '' ):integer;

var
  frmTransfertTrans: TfrmTransfertTrans;
  ReturnFromID,
  ReturnToID,
  TrSACCOUNTTypeID:Integer;
  AuToShow:Integer=0;
  FromAcc,
  ToAcc:TAccountRec;
  FTranID,TWTranID:integer;
implementation

uses Main, LanguageChoice, GlobalFunctions,  Database,
  CommCtrl, DatabaseAccess, LedgerRoutines, XRoutines,OSFGeneralRoutines,
  Lookup, UDMTCCoreLink,variants, DBAccess , Uni;

{$R *.DFM}

procedure TfrmTransfertTrans.FormShow(Sender: TObject);

begin
CBPrintReciept.Checked := ReadReportOp(prefix+'AutoCBPrintReciept',false).AsBoolean;
edtAccTo.Text := ReadReportOp(prefix+'AutoedtAccTo','').AsString;
if edtAccTo.Text = '' then
  edtAccTo.Text :=   TDataBaseRoutines.AddDashInAccCode(DMTCCoreLink.OpenSqlReturnFirstColumn('select min(Saccountcode) from account where WaccountTypeid = 3'),True);

ToAcc.WAccountID := GetAccountIdFromCodeAndType(GetMainAccountCode(edtAccTo.Text)+GetSubAccountCode(edtAccTo.Text),3);
if ToAcc.WAccountID <> -1 then
  begin
  ShowAccountDes(Label21,ToAcc.WAccountID);
  {Get Current Balance}
  Label16.Caption:= FloatToStr(RoundAmount(LrGetAccountTotal(ToAcc,27,3)));
  Label17.Caption:= FloatToStr(RoundAmount(StrToFloatDef(Label16.Caption,0)+StrToFloatDef(Edit3.Text,0)));
  end;

  cbxPymtMethod.items.Clear;
  cbxPymtMethod.items.add(GetTextLang(792));
  cbxPymtMethod.items.add(GetTextLang(793));
  cbxPymtMethod.items.add(GetTextLang(823));
  cbxPymtMethod.items.add(GetTextLang(794));


   lpaymentmethode.Caption:= DMTCCoreLink.GetTextLang(1275) ;

  cbxPymtMethod.itemIndex:=0;

  mpercent.Text := FloatToStr(  DMTCCoreLink.ReadSysParam(0.00,prefix+'AUTOPAYPERC',0)) ;
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 ComboBox1.Items[0] :=  GetTextLang(3355) ;
 ComboBox1.Items[1] :=  GetTextLang(2959) ;
 //EAlias.Text := GetTextLang(3358) ;
 EAlias.Text := TDataBaseDocumentRoutines.GetAnnyNextNum(prefix+'TRANS_TRANS');



  PageControl.ActivePageindex:=AuToShow;
  ComboBox1.Enabled:=False;
  Case  AuToShow of
  1: Begin
       Edit1.SetFocus;
       ComboBox1.ItemIndex:=1;
     end;
   else
     Label3.Caption:= GetTextLang(1923)+ ' ' ;
     edtFromAccount.Text:='';
     edtToAccount.Text:='';
     Case TrSACCOUNTTypeID of
     0:Label3.Caption:= GetTextLang(32)+ ' ' ;
     1:Label3.Caption:=GetTextLang(32)+ ' ' ;
     2:Label3.Caption:=GetTextLang(30)+ ' ' ;
     3:Label3.Caption:= GetTextLang(1924)+ ' ' ;
     4:Label3.Caption:= GetTextLang(1925) + ' ' ;
     end;
     LblFromDescription.Caption:='';
     LblToDescription.Caption:='';
     Label3.Repaint;
     edtDate1.SetFocus;
  end;
  // done : Pieter Translations
  Label4.Caption := GetTextLang(1929);
  Label5.Caption := GetTextLang(238);
  Label10.Caption := GetTextLang(1930);

  Label9.Caption := GetTextLang(607);
  Label11.Caption := GetTextLang(178);
  Label12.Caption := GetTextLang(1712);


  Label19.Caption := GetTextLang(947);
  Label14.Caption := GetTextLang(1932);
  Label15.Caption := GetTextLang(194);
  Label18.Caption := GetTextLang(1000);

  CBPrintReciept.Caption := GetTextLang(1931);


  BtnOk.Caption := GetTextLang(167);
  BtnCancel.Caption := GetTextLang(168);

 Label1.Caption := GetTextLang(1933);
 Label2.Caption := GetTextLang(1934);
 Label6.Caption := GetTextLang(194);
 Caption := ComboBox1.text;
end;

Procedure TfrmTransfertTrans.ShowAccountDes(Lbledt:Tlabel;ID:integer);
begin
  dmdatabase.tblaccount.open;
  if dmdatabase.tblaccount.locate('WAccountID',ID,[]) then
    lblEdt.Caption:=dmdatabase.tblaccountSDescription.VAlue
  else
    lblEdt.Caption:='';
  dmdatabase.tblaccount.Close;
end;

procedure TfrmTransfertTrans.BtnOkClick(Sender: TObject);
Var
  bat:Integer;
  OldName  : String ;
  OldId,lastBatchCtrlID : Integer  ;
  WasOpen : Boolean ;
  LocalOpenAmount : Double ;
begin

 DMTCCoreLink.WriteSysParam(prefix+'AUTOPAYPERC',StringReplace(FloatToStr(strtofloatDef(mpercent.Text,0.025)),DecimalSeparator,'.',[rfReplaceAll] ));


  OldName  :=  dmDatabase.tblBatch.TableName ;
  OldId := dmDatabase.tblBatchWLINEID.AsInteger ;
  WasOpen := dmDatabase.tblBatch.Active ;
  lastBatchCtrlID := BatchCtrlID ;
  try

  gl_transdec := Edit2.text ;
  gl_reference:= Edit1.text ;
  gl_lastpaymethode :=  cbxPymtMethod.Text ;
  gl_amounttrans := StrToFloatDef(Edit3.text,0);

 Printreciept := CBPrintReciept.Checked ;
 Case AuToShow of
 1:begin
     if ToAcc.WAccountID = 0 then
        begin
            ToAcc.WAccountID := DMTCCoreLink.OpenSqlReturnFirstColumn('select min(waccountId) from account where WaccountTypeid = 3');
        end;
     {Get BatchID with Acc As Contra Account}
     Bat := GetBankBatch(ToAcc.WAccountID,False);
     if Bat <=0 then
       OSFMessageDlg(GetTextLang(1926), mtError, [mbOk], 0)
     else
     begin
     //  BatchCtrlID := GetBatchCtrlID( bat);
     //  if BatchCtrlID = 0 then
        BatchCtrlID := dmDatabase.AppendBatchControlId(currentUser,currentUser,dmDatabase.BatchType,0,0);
       dmDatabase.tblBatchFDEBIT.ReadOnly:=False;
       dmDatabase.tblBatchFCREDIT.ReadOnly:=False;
       dmDatabase.tblBatch.close;
       Randomize;

       dmDatabase.CreateBatch('POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser)) ;
       dmDatabase.tblBatch.TableName:= 'POSTBATCH_'+ IntToStr(CurrentUser)+'_'+ IntToStr(CurrentUser) ;
       try
       ClearTable(dmDatabase.tblBatch.TableName);
       dmDatabase.tblBatch.Open;
       dmDatabase.tblBatch.Append;
       dmDatabase.tblBatchSReference.Value:= Edit1.Text;
       dmDatabase.tblBatchDDAte.Value:= edtDate1.date;
       dmDatabase.tblBatchDAllocatedDate.Value := dmDatabase.tblBatchDDAte.Value;
       dmDatabase.tblBatchSDescription.Value := Edit2.Text;
       dmDatabase.tblBatchSTAX.Value :='';
       dmDatabase.tblBatchSACCOUNT.Value := FromAcc.SACCOUNTCODE;
       dmDatabase.tblBatchWAccountID.Value := FromAcc.WAccountID;
       dmDatabase.tblBatchFCREDIT.Value:= StrToFloatDef(Edit3.Text,0);
       dmDatabase.tblBatchFAmount.Value:= - dmDatabase.tblBatchFCREDIT.Value;
       dmDatabase.tblBatchFTaxAmount.Value := 0;
       dmDatabase.tblBatchWLineID.Value:=1;
       dmDatabase.tblBatchWLINKEDID.Value:=1;
       dmDatabase.tblBatchSCONTRAACCOUNT.Value := ToAcc.SACCOUNTCODE;
       dmDatabase.tblBatchBExclusive.Value := 0;
       dmDatabase.tblBatchBLINKED.AsInteger := 1 ;
       dmDatabase.tblBatch.Post;
      if FTranID <>0 then
      begin
       LocalOpenAmount := TDataBaseLedgerRoutines.GetopenItemAmountOnTransact(FTranID) ;
       if abs(LocalOpenAmount) < abs(dmDatabase.tblBatchFAmount.Value) then
          begin
             LocalOpenAmount := - LocalOpenAmount ;

          end else
          LocalOpenAmount :=  dmDatabase.tblBatchFAmount.Value ;
       dmDatabase.ZQOILinks.SQL.Text := 'Select OILinks.*,Messages.* from OILinks  join transact ' +
         ' on OILinks.WAmountTransactionID = transact.WtransactionID left join messages on ' +
         '  (transact.WDescriptionId = Messages.WMessageId) where  ' +
          '(OILinks.WBatchID=' + IntToStr(0)+')' ;
          dmDatabase.ZQOILinks.open ;
          dmDatabase.ZQOILinks.insert ;

        dmDatabase.ZQOILinksWAccountID.Asinteger:=FromAcc.WAccountID;
        dmDatabase.ZQOILinksWAmountTransactionID.Asinteger:=FTranID;
        dmDatabase.ZQOILinksSDESCRIPTION.AsString := TDataBaseLedgerRoutines.GetDescriptionFromTransaction(FTranID);
        dmDatabase.ZQOILinksWFullAmount.Value:=FixAmount(-LocalOpenAmount);
        dmDatabase.ZQOILinksWOutStandingAmount.Value:=0;

        dmDatabase.ZQOILinksDDate.Value:=  dmDatabase.tblBatchDDAte.Value ;
        dmDatabase.ZQOILinksDDocDate.Value := dmDatabase.tblBatchDDAte.Value ;


        dmDatabase.ZQOILinksWLinkedAmount.Value:= LocalOpenAmount;
        dmDatabase.ZQOILinksSReference.value := dmDatabase.tblBatchSReference.Value;
        dmDatabase.ZQOILinksSLinkedReference.value := dmDatabase.tblBatchSReference.Value ;

        dmDatabase.ZQOILinksWTaxID.value := 0;

        dmDatabase.ZQOILinksUnUsed1.Value :=-2;
        dmDatabase.ZQOILinksWUserID.Value := CurrentUser;
        dmDatabase.ZQOILinksWBatchID.value := BatchCtrlID;
        dmDatabase.ZQOILinksWLinkTransactionID.Value := 1  ;
        dmDatabase.ZQOILinks.post ;
        try
        DMTCCoreLink.ExecSql('INSERT INTO oilinkspre (WBATCHID, WLINEID, WBATCHTYPEID, WTRANSACTIONID, FAMOUNT) '+

        '  VALUES ('+IntToStr(BatchCtrlID)+', '+IntToStr(dmDatabase.ZQOILinksWLinkTransactionID.AsInteger)+', '+IntToStr(Bat)+
        ', '+IntToStr(dmDatabase.ZQOILinksWAmountTransactionID.Asinteger)+', '+TDatabaseTableRoutines.GetFirebirdsSqlForFloat(-LocalOpenAmount) +')') ;
       DMTCCoreLink.ExecSql('update ' + dmDatabase.tblBatch.TableName + ' set BLINKED = 1 where wlineid = ' + IntToStr(dmDatabase.ZQOILinksWLinkTransactionID.AsInteger)) ;
       except
       end;

        end;

     {  dmDatabase.tblBatch.ApplyUpdates ;
       dmDatabase.tblBatch.CommitUpdates ;   }


       {}
       dmDatabase.tblBatch.Append;
       dmDatabase.tblBatchSReference.Value:= Edit1.Text;
       dmDatabase.tblBatchDDAte.Value:= edtDate1.date;
       dmDatabase.tblBatchDAllocatedDate.Value := dmDatabase.tblBatchDDAte.Value;
       dmDatabase.tblBatchSDescription.Value := Edit2.Text;
       dmDatabase.tblBatchSTAX.Value :='';
       dmDatabase.tblBatchSACCOUNT.Value := ToAcc.SACCOUNTCODE;
       dmDatabase.tblBatchWAccountID.Value := ToAcc.WAccountID;
       dmDatabase.tblBatchFDEBIT.Value:=  StrToFloatDef(Edit3.Text,0);
       dmDatabase.tblBatchFAmount.Value:=  dmDatabase.tblBatchFDEBIT.Value;
       dmDatabase.tblBatchBExclusive.Value := 0;
       dmDatabase.tblBatchFTaxAmount.Value := 0;
       dmDatabase.tblBatchWLineID.Value:=2;
       dmDatabase.tblBatchWLINKEDID.Value:=1;
      // dmDatabase.tblBatchWLINKEDID.Value:=1;
       dmDatabase.tblBatchSCONTRAACCOUNT.Value := ToAcc.SACCOUNTCODE;
       dmDatabase.tblBatch.Post;
   {    dmDatabase.tblBatch.ApplyUpdates ;
       dmDatabase.tblBatch.CommitUpdates ; }



       
       {Post it Now}
       dmDatabase.ZMainconnection.StartTransaction ;
       try

        //         ChangeBatAlias(GetBatchCtrlID( bat),EAlias.Text);
        LrPostNewBatch(CurrentUser,bat,false,0,True);


        TWTranID :=  StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('select WTransactionid from transact where WAccountid = '+IntToStr(FromAcc.WAccountID)+' and WbatchId = ' + IntToStr(BatchCtrlID))),0);
        ChangeBatAlias(BatchCtrlID,EAlias.Text);



     dmDatabase.ZQBatControl.SQL.Text := dmDatabase.SQLList.GetFormatedSQLByName('DMCoreData_SelectBatchConOnBatcControlID') ;
     dmDatabase.ZQBatControl.Params[0].AsInteger := BatchCtrlID ;
     dmDatabase.ZQBatControl.Open;
     if not dmDatabase.ZQBatControl.IsEmpty then
     begin
     dmDatabase.ZQBatControl.Edit ;
     dmDatabase.ZQBatControlWUSERID.Value := CurrentUser  ;
     dmDatabase.ZQBatControlBPosted.Value := 1;
     dmDatabase.ZQBatControlBImported.Value := 0;
     dmDatabase.ZQBatControlDSYSDATE.AsDateTime := now ;
     dmDatabase.ZQBatControlWBATCHTYPEID.AsInteger := bat ;
     //dmDatabase.ZQBatControlSFILENAME.AsString := dmDatabase.tblBatch.TableName ;
     dmDatabase.ZQBatControlBDOCSOURCE.AsInteger := 0 ;
     dmDatabase.ZQBatControlWDOCID.AsInteger := 0 ;
     dmDatabase.ZQBatControlWLINECOUNT.AsInteger := 2 ;


     dmDatabase.ZQBatControl.Post;
     end;

       // LrPostInternalBatch(CurrentUser,bat,False,EAlias.Text,TWTranID,0) ;
       dmDatabase.ZMainconnection.Commit ;
       finally
         if dmDatabase.ZMainconnection.InTransaction then
           dmDatabase.ZMainconnection.Rollback ;
       end;

       dmDatabase.tblBatch.Close;
       finally
        clearTable(dmDatabase.tblBatch.TableName);
       end;
     end;
   end;
 else
  // Table Account must be open
    dmDatabase.tblAccount.Open;
    TransferTransactions(ReturnFromID,ReturnToID);
   // dmDatabase.tblAccount.Close;
 end;
 finally
  try
   dmDatabase.tblBatch.TableName := OldName ;
   BatchCtrlID := lastBatchCtrlID ;
   if WasOpen then
      begin
        dmDatabase.tblBatch.open ;
        dmDatabase.tblBatch.Locate('WLINEID',OldId,[]);
      end;
    except
    end;
 end ;
 modalresult := mrok;
end;

procedure TfrmTransfertTrans.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Case Key of
  #27:BtnCancelClick(Sender);
  end;
end;

procedure TfrmTransfertTrans.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTransfertTrans.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin

             HtmlShowTopic(240);
             key := 0;

        end;
end;

procedure TfrmTransfertTrans.BtnCancelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
        begin
             HtmlShowTopic(240);
             key := 0;

        end;
end;



{This will be used to Remove PageControl Border
procedure TfrmTransfertTrans.PageControlWndProc(var Message: TMessage);
begin
  FOriginalPageControlWndProc(Message);
  with Message do
    if (Msg = TCM_ADJUSTRECT) and (Message.WParam = 0) then
      InflateRect(PRect(LParam)^, 4, 4);
end;}

procedure TfrmTransfertTrans.FormCreate(Sender: TObject);
begin
CBPrintReciept.Checked := ReadReportOp('AutoCBPrintReciept',false).AsBoolean;
edtAccTo.Text := ReadReportOp('AutoedtAccTo','').AsString;
if edtAccTo.Text = '' then
  edtAccTo.Text :=   TDataBaseRoutines.AddDashInAccCode(DMTCCoreLink.OpenSqlReturnFirstColumn('select min(Saccountcode) from account where WaccountTypeid = 3'),True);

ToAcc.WAccountID := GetAccountIdFromCodeAndType(GetMainAccountCode(edtAccTo.Text)+GetSubAccountCode(edtAccTo.Text),3);
if ToAcc.WAccountID <> -1 then
  begin
  ShowAccountDes(Label21,ToAcc.WAccountID);
  {Get Current Balance}
  Label16.Caption:= FloatToStr(RoundAmount(LrGetAccountTotal(ToAcc,27,3)));
  Label17.Caption:= FloatToStr(RoundAmount(StrToFloatDef(Label16.Caption,0)+StrToFloatDef(Edit3.Text,0)));
  end;
(*
  with PageControl do
  begin
    // remove PageControl border
    FOriginalPageControlWndProc := WindowProc;
    WindowProc := PageControlWndProc;
    Realign;
  end;
*)  
end;

procedure TfrmTransfertTrans.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
  1: Begin
      PageControl.ActivePageindex:=1;
     end;
  else
    PageControl.ActivePageindex:=0;
  end;  
end;

procedure TfrmTransfertTrans.ComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.  if key = '.' then
     if sender = Edit3 then
       if key = '.' then
     key := DecimalSeparator ;
  if Key=#13 then
  begin
    Key:=#0;
    SelectNext(ActiveControl,True,True);
  end;
end;

Function AutoReceivePymt(aFromAcc:TAccountRec;WTransID:integer;aDocNo:String;Var aAmt:Real;AutoProcess:boolean = false;aPrefix : String = '' ):integer;
begin
  frmTransfertTrans := TfrmTransfertTrans.Create(Application);
  try
  SetUpForm(frmTransfertTrans);
  Result := -1 ;
 // aAmt := 0 ;
 
  with frmTransfertTrans do
  begin
    prefix := aPrefix ;
    FTranID :=  WTransID;
    ReturnFromID := aFromAcc.WAccountID;
    FromAcc :=  aFromAcc;
    AuToShow:=1;
    edtDate1.Date := now ;
    edtAccFrom.Text := aFromAcc.SACCOUNTCODE;
    Label13.Caption := aFromAcc.SDescription;
    edtAccFrom.Enabled:=False;
    Edit1.Text := aDocNo;
    Edit2.text := GetTextLang(1927)+  ' '+ aDocNo;
    orgAmount := RoundAmount(aAmt) ;
    Edit3.text := FloatToStr(RoundAmount(aAmt));

    // EAlias.Text := TDataBaseDocumentRoutines.GetAnnyNextNum('TRANS_TRANS');
    Label20.Caption:= Edit3.text;
    if AutoProcess then
       tPRocess.Enabled := True ;
    if ShowModal = mrok then
    begin
    Result := TWTranID;
    aAmt := StrToFloatDef(edit3.Text,0);
    end;
  end;
  finally
   FreeAndNil(frmTransfertTrans);
  end;
  AuToShow:=0;
end;

procedure TfrmTransfertTrans.edtAccToEnter(Sender: TObject);
begin
FmLookup.IsShowForm := false ;
//  Highlight(edtAccTo);
  dmDatabase.tblAccount.open ;
 
  ReturnLookup:=CallLookup(edtAccTo.Text, 5);
  dmDatabase.tblAccount.Close ;
  ToAcc.WAccountID:=ReturnID;
  LocateAccount(ToAcc);
  if (ReturnLookup <> 'ESC') and (ReturnLookup <> '-') then
  Begin
     edtAccTo.Text := ReturnLookup;
    if IsMainAccountWithSub(edtAccTo.Text) then
    begin
      OSFMessageDlg(GetTextLang(1928), mtError, [mbOk], 0);
      edtFromAccount.Text:='';
      edtAccToEnter(Sender);
      exit;
    end;
  end;
//  BackNormal(edtAccTo);
  ShowAccountDes(Label21,ToAcc.WAccountID);
  {Get Current Balance}
  Label16.Caption:= FloatToStr(RoundAmount(LrGetAccountTotal(ToAcc,27,3)));
  Label17.Caption:= FloatToStr(RoundAmount(StrToFloatDef(Label16.Caption,0)+StrToFloatDef(Edit3.Text,0)));
  SelectNext(ActiveControl,true,true);
end;

procedure TfrmTransfertTrans.edtDate1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    Case PageControl.ActivePageIndex of
    1:Edit1.SetFocus;
    else
      edtFromAccount.SetFocus;
    end;
    Key:=#0;
  end;
end;

procedure TfrmTransfertTrans.BitBtn1Click(Sender: TObject);

var
  aAcc :TAccountRec;
begin
  Highlight(edtToAccount);
  If TrSACCOUNTTypeID=5 then
  ReturnLookup:=CallLookup(edtFromAccount.Text, 10)
  else
  ReturnLookup:=CallLookup(edtToAccount.Text, TrSACCOUNTTypeID+2);
  ReturnToID:=ReturnID;
  aAcc.WAccountID := ReturnID ;
  if (ReturnLookup <> 'ESC') and (ReturnLookup <> '-') and (ReturnLookup <> '') then
  Begin
     edtToAccount.Text := ReturnLookup;
    if IsMainAccountWithSub(edtToAccount.Text) then
    begin
      OSFMessageDlg(GetTextLang(668){Cannot have budgets for an account which has sub-accounts}, mtconfirmation, [mbOk], 0);
      edtToAccount.Text:='';
      BitBtn1Click(Sender);
    end;
  end;
  BackNormal(edtToAccount);
  ShowAccountDes(LblToDescription,ReturnToID);
  Label8.Caption:= FloatToStr(RoundAmount(LrGetAccountTotal(aAcc,27,3)));
  SelectNext(ActiveControl,true,true);
end;


procedure TfrmTransfertTrans.BitBtn3Click(Sender: TObject);
var
  aAcc :TAccountRec;
begin
  Highlight(edtFromAccount);
  IF TrSACCOUNTTypeID=5 then
  ReturnLookup:=CallLookup(edtFromAccount.Text, 10)
  else
  ReturnLookup:=CallLookup(edtFromAccount.Text, TrSACCOUNTTypeID+2);
  ReturnFromID:=ReturnID;
  aAcc.WAccountID := ReturnID ;
  if (ReturnLookup <> 'ESC') and (ReturnLookup <> '-') and (ReturnLookup <> '') then
  Begin
     edtFromAccount.Text := ReturnLookup;
    if IsMainAccountWithSub(edtFromAccount.Text) then
    begin
      OSFMessageDlg(GetTextLang(668){Cannot have budgets for an account which has sub-accounts}, mtconfirmation, [mbOk], 0);
      edtFromAccount.Text:='';
      BitBtn3Click(Sender);
    end;
  end;
  BackNormal(edtFromAccount);
  ShowAccountDes(LblFromDescription,ReturnFromID);
  Label7.Caption:= FloatToStr(RoundAmount(LrGetAccountTotal(aAcc,27,3)));
  SelectNext(ActiveControl,true,true);
end;

procedure TfrmTransfertTrans.FormDestroy(Sender: TObject);
begin
 WriteReportOp(prefix+'AutoCBPrintReciept',BoolToStr(CBPrintReciept.Checked,true));
 WriteReportOp(prefix+'AutoedtAccTo',edtAccTo.Text);
end;

procedure TfrmTransfertTrans.BitBtn2Click(Sender: TObject);
begin
  Edit3.Text :=  FloatToStr(RoundAmount(orgAmount * StrToFloatDef(mpercent.Text,0.02)));
end;

procedure TfrmTransfertTrans.BitBtn4Click(Sender: TObject);
var
 Atotal : Variant ;
begin
if FTranID <> 0 then
   begin
      Atotal := DMTCCoreLink.OpenSqlReturnFirstColumn(' select sum(-a.famount) from transact a join transact b on a.Wbatchid = b.Wbatchid and a.Wlinkedid = b.Wlineid '+
      ' join account ac on a.Waccountid = ac.Waccountid and ac.WaccountTypeid =0 where b.Wtransactionid = ' + IntToStr(FTranID));
      if VarToStr(Atotal) <> '' then
        begin
             Edit3.Text :=  FloatToStr(RoundAmount(Atotal * StrToFloatDef(mpercent.Text,0.02)));
        end;
   end;
end;

procedure TfrmTransfertTrans.tPRocessTimer(Sender: TObject);
var
 Strcheck : String ;
begin
  tPRocess.Enabled := False ;
  if StrToFloatDef(mpercent.Text,0) <> 0 then
   begin
     Strcheck := Edit3.Text ;
     BitBtn4Click(self);
     if  Strcheck <> Edit3.Text then
          BtnOkClick(self) else
          BtnCancelClick(self) ;
   end;
 BtnOkClick(self) ;
end;

end.

