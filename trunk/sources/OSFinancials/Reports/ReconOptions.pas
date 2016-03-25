(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ReconOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, Mask,
  Buttons, ComCtrls,DatabaseAccess, DB,
   DBAccess , Uni, TcashClasses, MemDS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCalendar,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit;

type
 TBalansViewerControl = class(TStringGrid)
  private
    { Private declarations }
  protected
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect;
              AState: TGridDrawState); override;
  public

  published
    { Published declarations }
  end;
  TfmReconOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    BtnOk: TBitBtn;
    DSBankBook: TDataSource;
    QbankLastBooking: TuniQuery;
    QbankLastBookingSReference: TStringField;
    QbankLastBookingSDescription: TStringField;
    QbankLastBookingFAmount: TFloatField;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dbedtBankBal: TDBEdit;
    LCurBalance: TStaticText;
    BRecon: TBitBtn;
    DataSource1: TDataSource;
    tblAccount: TuniQuery;
    tblAccountWACCOUNTID: TIntegerField;
    tblAccountSACCOUNTCODE: TStringField;
    tblAccountSMAINACCOUNTCODE: TStringField;
    tblAccountSSUBACCOUNTCODE: TStringField;
    tblAccountSDESCRIPTION: TStringField;
    tblAccountWACCOUNTTYPEID: TIntegerField;
    tblAccountWREPORTINGGROUP1ID: TIntegerField;
    tblAccountWREPORTINGGROUP2ID: TIntegerField;
    tblAccountBSUBACCOUNTS: TSmallintField;
    tblAccountBINCOMEEXPENSE: TSmallintField;
    tblAccountBOPENITEM: TSmallintField;
    tblAccountBINACTIVE: TSmallintField;
    tblAccountDSYSDATE: TDateTimeField;
    tblAccountWPROFILEID: TIntegerField;
    tblAccountWLINKACCOUNT: TIntegerField;
    ZUSQLAccount: TUniUpdateSql;
    DSAccount: TDataSource;
    QGetLastBookingsDate: TuniQuery;
    QGetLastBookingsDateWBATCHTYPEID: TIntegerField;
    Timer1: TTimer;
    QGetLastBookingsDateMAXDATE: TDateField;
    QbankLastBookingDDATE: TDateField;
    dbdtUntilDate: TcxDBDateEdit;
    dbdtFromDate: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Refreshgrid ;
    procedure dbdtUntilDateChange(Sender: TObject);
    procedure dbdtUntilDateExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtBankBalChange(Sender: TObject);
  private
    { Private declarations }
  public
    sgColumnBalans : TBalansViewerControl ;
    AsaveList : TSaveClientDatasetCallList;
    goToAccount : Integer ;
    inWorkFlow : Boolean ;
    WorkflowParent : TWincontrol ; 
    { Public declarations }
  end;

var
  fmReconOptions: TfmReconOptions;
  PymtID,RcptID:String;
  vTotalUnposted:Double;
implementation

uses GlobalFunctions, Main, Database, ReconcileBank, HtmlHelpAPI,
   LanguageChoice,  TcVariables,
   BatchEntryBank,LedgerRoutines, UDMTCCoreLink, OSFGeneralRoutines,
  UReportManager;

{$R *.DFM}

procedure TBalansViewerControl.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);
var
   sCellText, sLine: string;
   iAantalRegels, i: integer;
begin
     sCellText := Cells[Acol, ARow];
     if gdFixed in AState then
     begin
          Canvas.Brush.Color := FixedColor;
          Canvas.Font.Color := Font.Color;
     end
     else if (gdSelected in AState) and not (gdFocused in AState) then
     begin
          Canvas.Brush.Color := clNavy;
          Canvas.Font.Color := clWhite;
     end
     else
     begin
          Canvas.Brush.Color := Color;
          Canvas.Font.Color := Font.Color;
     end;

     i := 1;
     iAantalRegels:= 0;

     while i <= Length(sCellText) do
     begin
          //Maak indien nodig de tekst in meedere regels
          while (i <= Length(sCellText)) and (sCellText[i] <> #13) and (sCellText[i] <> #10) do
          begin
               sLine := sLine + sCellText[i];
               inc(i);
          end;
          inc(iAantalRegels);

          //Kijk of de length aangepas moet worden
          if Canvas.TextExtent(sLine).cx + 4 > ColWidths[ACol] then
          begin
               ColWidths[ACol] := Canvas.TextExtent(sLine).cx + 4;
          end;

          //Schijf de regel in de cell eerste regel altijd links outlined
          // en de  clom ook
      //    if (BiDiMode = bdRightToLeft) and (aRow <> 0) and not (acol in [0,1] ) then
      //    begin
               Canvas.TextOut(ColWidths[ACol] + ARect.Left - Canvas.TextExtent(sLine).cx - 2, ARect.Top + ((Canvas.TextExtent(sLine).cy+2)*(iAantalRegels-1)), sLine);
       //   end
      //    else
      //    begin
      //        Canvas.TextOut(ARect.Left +1, ARect.Top + ((Canvas.TextExtent(sLine).cy+1)*(iAantalRegels-1)), sLine);
     //     end;

          sLine := '';
          if (i <= Length(sCellText)) and (sCellText[i] = #13) then
             inc(i);
          if (i <= Length(sCellText)) and (sCellText[i] = #10) then
             inc(i);
     end;

     //Als er al text staat in de cell, pas de hoogte aan

     if (iAantalRegels > 1) and (RowHeights[ARow] <  iAantalRegels * DefaultRowHeight) then
     begin
            RowHeights[ARow] := iAantalRegels * DefaultRowHeight //DefaultRowHeight + ((Canvas.TextExtent(sLine).cy+1)*(iAantalRegels-1));
     end;

end;


procedure TfmReconOptions.FormShow(Sender: TObject);
var
 aDateInt : Integer ;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BRecon.Glyph,'Ok');

 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
 DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');


 dmDatabase.tblReportingOptionsFRECONBANKBALANCE.DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDataEntryNbrQty) ;




 Caption := GetTextLang(259);//Header 259
 Label1.Caption := GetTextLang(29);//Bank Account 29
 Label2.Caption := GetTextLang(232);//Include items until 232
 Label3.Caption := GetTextLang(233);//Bank balance 233
 btnOK.Caption := GetTextLang(167);//OK 167
 btnCancel.Caption := GetTextLang(168);//Cancel 168
 ChangePrnlbls(DestLbl,lblCopies,Bitprn1);
 BRecon.Caption := GetTextLang(950);

       if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
           begin
             BRecon.Visible := DMTCCoreLink.ReadSysParam('RCONISON',true,0) ;
           end else
           begin
             BRecon.Visible := DMTCCoreLink.ReadSysParam('RCONISON',false,0) ;
           end;


  tblAccount.Open;

  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  if goToAccount <> 0 then
   begin
   tblAccount.Locate('WACCOUNTID',goToAccount,[]);
   DBLookupComboBox1.KeyValue := tblAccountSDESCRIPTION.AsString ;


   DBLookupComboBox1.Enabled := false ;
   DBLookupComboBox1Click(self);
   end;
  sgColumnBalans.Visible := false ;
  if idDocType=1 then
  begin
    fmReconOptions.Height:=249-TopPnl.Height;
    TopPnl.Visible:=False;
    if DBLookupComboBox1.Enabled then
    DBLookupComboBox1.SetFocus;
  end
  else begin
    TopPnl.Visible:=True;
    // load Print Modes
    LoadPrintOutModes(cbDestination);
    cbDestination.SetFocus;
  end;
   Caption := gettextlang(2186);
   Bitprn1.Caption := gettextlang(864);////&Printer Setup
   BtnOk.Caption := gettextlang(163);
   BtnCancel.Caption := gettextlang(169);
   lblCopies.Caption := gettextlang(732);
   Label1.Caption := gettextlang(29);
   Label2.Caption := gettextlang(232);
   Label3.Caption := gettextlang(233);
   DestLbl.Caption := gettextlang(240);
      Label6.Caption := gettextlang(2234);
  if not (ReadReportOp('CBViewAllBankState',false).AsBoolean or ReadReportOp('CBViewForceBankState',false).AsBoolean) then

    begin


       if idDocType <> 2 then
       begin
        dbdtUntilDate.Date :=  date  ;
        dbdtFromDate.Date := EncodeDate(1900,1,1)  ;
         Label2.Visible := false ;
         dbdtUntilDate.Visible := false ;
         dbdtFromDate.Visible := false ;

       end;  
      Height:= 350 ;
      Width:= 600 ;
      sgColumnBalans.Visible := true;
    end  else
    begin
        dbdtFromDate.Visible := ReadReportOp('CBViewForceBankState',false).AsBoolean ;
        if not dbdtFromDate.Visible then
        dbdtUntilDate.Left := dbdtFromDate.Left ;
    end;
  if DBLookupComboBox1.Enabled then
  DBLookupComboBox1.SetFocus ;
  DBLookupComboBox1Click(self);
  if dbedtBankBal.CanFocus then
   dbedtBankBal.SetFocus ;
 dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat :=
 StrToFloat(StringReplace(ReadReportOp(tblAccountWAccountID.AsString+'BankBal',0).AsString,'.',DecimalSeparator,[rfReplaceAll])) ;
 LCurBalance.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,GetAccountTotal(tblAccountWAccountID.AsInteger,27,3)) ;


 aDateInt := DMTCCoreLink.ReadNwReportOp('RConFromDate',round(date - 30));
 dbdtFromDate.Date := aDateInt ;
 // Timer1.Enabled := True ;
end;

procedure TfmReconOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblReconBank.Close;
  //dmDatabase.tblReconBank.Query.Text:='';
end;

procedure TfmReconOptions.btnOkClick(Sender: TObject);
Var
  BankAccountID:integer;
  OldName,ParamString:String;
  GoRecon:Boolean;
  tmpInt1 ,AAccId: Integer;
  
begin
  if dbedtBankBal.Focused then
      BtnOk.SetFocus ;
  if DBLookupComboBox1.Text = '' then
    raise exception.Create('Select a account first!');
  AAccId := tblAccountWAccountID.AsInteger ;
  writeReportOp(tblAccountWAccountID.AsString+'BankBal',StringReplace(FloatToStr(dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat),DecimalSeparator,'.',[rfReplaceAll])) ;


  writeReportOp('RConFromDate',IntToStr(round(dbdtFromDate.Date))) ;




  if dmDatabase.tblReportingOptions.State = dsedit then
  dmDatabase.tblReportingOptions.Post;

  tblAccount.Locate('WACCOUNTID',AAccId,[]);
  BankAccountID:= tblAccountWAccountID.value;

  dmDatabase.tblBank.close ;
  dmDatabase.tblBank.Open;
  if  dmDatabase.tblBank.Locate('WAccountID', BankAccountID, []) then
  begin
    PymtID:=dmDatabase.tblBankWPaymentsID.AsString;
    RcptID:=dmDatabase.tblBankWReceiptsID.AsString;
  end;
  dmDatabase.tblBank.Close;

  if not ReadReportOp('CBViewAllBankState',false).AsBoolean and (sender <> BRecon) then
  begin
  GoRecon := true ;



  end else
  begin  // else dutch bank
    if idDocType=1 then
    begin
     if not (ReadReportOp('CBViewAllBankState',false).AsBoolean or ReadReportOp('CBViewForceBankState',false).AsBoolean) then
       begin
        dmDatabase.tblReportingOptions.edit ;
        dmDatabase.tblReportingOptionsDRECONUNTIL.AsDateTime := date + 900 ;
        dmDatabase.tblReportingOptions.post ;
        dmDatabase.tblTransaction.Open;
        GoRecon := GetReconData(0,dbdtUntilDate.Date,BankAccountID,PymtID,RcptID,vTotalUnposted,True);
        dmDatabase.tblReconBank.Open;

       end else
    begin
    dmDatabase.tblTransaction.Open;
    if ReadReportOp('CBViewForceBankState',false).AsBoolean then
    GoRecon := GetReconData(dbdtFromDate.Date,dbdtUntilDate.Date,BankAccountID,PymtID,RcptID,vTotalUnposted)
    else
    GoRecon := GetReconData(0,dbdtUntilDate.Date,BankAccountID,PymtID,RcptID,vTotalUnposted);
    dmDatabase.tblReconBank.Open;
    end;
   end;
  end;
  dmDatabase.tblBank.Open;
  if  dmDatabase.tblBank.Locate('WAccountID', BankAccountID, []) then
  begin
    PymtID:=dmDatabase.tblBankWPaymentsID.AsString;
    RcptID:=dmDatabase.tblBankWReceiptsID.AsString;
  end;
  dmDatabase.tblBank.Close;
  
  if  PymtID = '' then Raise Exception.Create(gettextlang(815){'No batch linked to this bank!});
  tblAccount.Locate('WaccountID',BankAccountID,[]);
  if (idDocType=1) or inWorkFlow then
  begin
      if Not GoRecon then
      if OSFMessageDlg(GetTextLang(491)+#13#10{'No item to reconcile'}+ GetTextLang(1054), mtconfirmation, [mbYes,mbOk], 0)=mrNo then
        GoRecon:=True;
//      begin
      if GoRecon then
      begin
        if (ReadReportOp('CBViewAllBankState',false).AsBoolean or (sender = BRecon))  then
          begin
          fmReconcileBank := TfmReconcileBank.Create(Application);
          try
            fmReconcileBank.BankAccountID := BankAccountID ;
            SetUpForm(fmReconcileBank);
            Visible := False;

            fmReconcileBank.ShowModal;
            finally
               Visible := True;
               FreeAndNil(fmReconcileBank);
             end;
         end else
          begin
           if inWorkFlow then

           fmBatchEntryBank := TfmBatchEntryBank.Create(self)
           else
            fmBatchEntryBank := TfmBatchEntryBank.Create(Application);
            try
            fmBatchEntryBank.paymentID := StrToInt(PymtID);
            fmBatchEntryBank.EnterdStamentAmount := dmDatabase.TblReportingOptions.FieldByName('FReconBankBalance').AsFloat ;
            fmBatchEntryBank.EnterItemsUntil   := dmDatabase.TblReportingOptions.FieldByName('DReconUntil').AsDateTime ;
            if inWorkFlow then
              begin
              fmBatchEntryBank.BorderStyle := bsNone ;
              fmBatchEntryBank.Parent := WorkflowParent ; 
              fmBatchEntryBank.Align := alClient ;
              fmBatchEntryBank.show ;
              exit ;
             end else
            fmBatchEntryBank.ShowModal;
            dmDatabase.tblReportingOptions.edit ;
            dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat :=
            StrToFloat(StringReplace(ReadReportOp(IntToStr(AAccId)+'BankBal',0).AsString,'.',DecimalSeparator,[rfReplaceAll])) ;
            LCurBalance.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,GetAccountTotal(AAccId,27,3)) ;
            dmDatabase.tblReportingOptions.post ;

            finally
              if not inWorkFlow then
                 FreeAndNil(fmBatchEntryBank);
             end;
         end
      end;
  end
  else
  begin  // report mode
     self.Hide ;
    try
    dmDatabase.tblSysVars.Open;

    if  not (ReadReportOp('CBViewAllBankState',false).AsBoolean or ReadReportOp('CBViewForceBankState',false).AsBoolean) then
    GoRecon := GetReconData(dbdtFromDate.Date,dbdtUntilDate.Date,BankAccountID,PymtID,RcptID,vTotalUnposted)
    else
    GoRecon := GetReconData(0,dbdtUntilDate.Date,BankAccountID,PymtID,RcptID,vTotalUnposted);

    if dmDatabase.RConBankTableName <> '' then
      begin
        dmdatabase.tblReconBank.Close;
        dmdatabase.tblReconBank.sql.Text:='Select * from '+dmDatabase.RConBankTableName+' Order by ddate';
        dmdatabase.tblReconBank.Open;
      end;

    ParamString := 'currentuser=' + IntToStr(DMTCCoreLink.currentuser) + #13 +#10 +
    'fromdate=' + FloatToStr(dbdtFromDate.Date) + #13 +#10 +
    'todate=' + FloatToStr(dbdtUntilDate.Date) + #13 +#10 +
    'payment=' + IntToStr(StrToIntDef(PymtID,-1)) + #13 +#10 +
    'paymenttbl=BAT'+ IntToStr(DMTCCoreLink.currentuser)+'T' + IntToStr(StrToIntDef(PymtID,0)) + #13 +#10 +
    'reciept=' + IntToStr(StrToIntDef(RcptID,-1)) + #13 +#10 +
    'reciepttbl=BAT' + IntToStr(DMTCCoreLink.currentuser)+'T' + IntToStr(StrToIntDef(RcptID,0)) + #13 +#10 +
    'bankaccount=' + IntToStr(BankAccountID) ;

       ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\documents\recon.rep',ParamString )
    
     finally
       self.Show ;
     end;

  end;

    if idDocType <> 2 then
    idDocType := 1 ;
    FormShow(self);
end;

procedure TfmReconOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReconOptions.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.   if key = '.' then
    if sender = dbedtBankBal then
     if key = '.' then
    key :=  DecimalSeparator ;
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

procedure TfmReconOptions.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             if idDocType=1 then
               HtmlShowTopic(149)
             else
               HtmlShowTopic(164);
             key := 0;

        end;
   

end;

procedure TfmReconOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmReconOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmReconOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmReconOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmReconOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmReconOptions.DBLookupComboBox1Click(Sender: TObject);
begin
 RefreshGrid ;
 dmDatabase.tblReportingOptions.FieldByName('FReconBankBalance').AsFloat :=
 StrToFloat(StringReplace(ReadReportOp(tblAccountWAccountID.AsString+'BankBal',0).AsString,'.',DecimalSeparator,[rfReplaceAll])) ;
 LCurBalance.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask,GetAccountTotal(tblAccountWAccountID.AsInteger,27,3)) ;

end;

procedure TfmReconOptions.FormCreate(Sender: TObject);
begin
//self.DoubleBuffered := True ;


sgColumnBalans := TBalansViewerControl.Create(self) ;
// sgColumnBalans.BiDiMode := bdRightToLeft ;
sgColumnBalans.Visible := false ;
sgColumnBalans.Parent := Panel1 ;
sgColumnBalans.Top := 124 ;
sgColumnBalans.Left := 4 ;
sgColumnBalans.Width := 435 ;
sgColumnBalans.ColCount := 5 ;
sgColumnBalans.FixedCols := 0 ;

sgColumnBalans.Height := 65 ;
sgColumnBalans.Anchors := [akLeft,akTop,akRight,akBottom] ;


QbankLastBooking.Connection := dmDatabase.ZMainconnection ;

AsaveList := TSaveClientDatasetCallList.Create;
with dmDatabase do
 begin
 AsaveList.AddclientObject(tblOpReport,false);
 AsaveList.AddclientObject(tblTransaction,false);
 AsaveList.AddclientObject(tblBank,false);
 AsaveList.AddclientObject(tblType,false);
 AsaveList.AddclientObject(tblGroups,false);
 AsaveList.AddclientObject(tblTax,false);
 end;

{ DBGrid1.Columns[0].Title.Caption := GetTextLang(607);
 DBGrid1.Columns[1].Title.Caption := GetTextLang(238);
 DBGrid1.Columns[2].Title.Caption := GetTextLang(178);
 DBGrid1.Columns[3].Title.Caption := GetTextLang(1976);  }
end;

procedure TfmReconOptions.FormDestroy(Sender: TObject);
begin
 AsaveList.free ;
end;

procedure TfmReconOptions.Refreshgrid;
var
 Cumm : Double ;
begin
QGetLastBookingsDate.close;
QGetLastBookingsDate.Params[0].AsInteger := tblAccountWAccountID.AsInteger ;
QGetLastBookingsDate.open ;
QbankLastBooking.Close ;
// QbankLastBooking.Params[0].AsInteger :=  QGetLastBookingsDate.Fields[1].AsInteger ;
//QbankLastBooking.Params[1].AsDate :=   QGetLastBookingsDate.Fields[0].AsDateTime ;
QbankLastBooking.Params[0].AsInteger :=  tblAccountWAccountID.AsInteger ;
QbankLastBooking.open ;
Cumm := GetAccountTotal(tblAccountWAccountID.AsInteger,27,3) ;

sgColumnBalans.RowCount := 2 ;
sgColumnBalans.Cells[0,0] := GetTextLang(607) ;
sgColumnBalans.Cells[1,0] := GetTextLang(178) ;
sgColumnBalans.Cells[2,0] := GetTextLang(238) ;
sgColumnBalans.Cells[3,0] := GetTextLang(1976);
sgColumnBalans.Cells[4,0] :=  GetTextLang(906007) ;
sgColumnBalans.RowHeights[0] := 16 ;


sgColumnBalans.Cells[0,1] := '' ;
sgColumnBalans.Cells[1,1] := '' ;
sgColumnBalans.Cells[2,1] := '' ;
sgColumnBalans.Cells[3,1] := '' ;
sgColumnBalans.Cells[4,1] := '' ;
sgColumnBalans.RowHeights[1] := 16 ;

if QbankLastBooking.RecordCount <> 0 then
  begin
    sgColumnBalans.RowCount := QbankLastBooking.RecordCount +1 ;
    while not QbankLastBooking.Eof do
       begin
          sgColumnBalans.RowHeights[QbankLastBooking.RecNo] := 16 ;
          sgColumnBalans.Cells[0,QbankLastBooking.RecNo] := QbankLastBookingSReference.AsString ;
          sgColumnBalans.Cells[1,QbankLastBooking.RecNo] := QbankLastBookingSDescription.AsString ;
          try

          sgColumnBalans.Cells[2,QbankLastBooking.RecNo] :=  DateToStr(QbankLastBookingDDate.AsDateTime)
          except

          end;
          sgColumnBalans.Cells[3,QbankLastBooking.RecNo] :=  FormatFloat('0.00',QbankLastBookingFAmount.AsFloat) ;
          Cumm := Cumm - QbankLastBookingFAmount.AsFloat ;
          sgColumnBalans.Cells[4,QbankLastBooking.RecNo] := FormatFloat('0.00',Cumm) ;
          QbankLastBooking.Next ;

       end;
  end;




end;

procedure TfmReconOptions.dbdtUntilDateChange(Sender: TObject);
begin

 if idDocType=2 then
   if StrToDateDef(dbdtUntilDate.Text,0) > 0 then
    LCurBalance.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ,  TDataBaseRoutines.GetBalans(tblAccountWAccountID.AsInteger,StrToDateDef(dbdtUntilDate.Text,0))) ;
end;

procedure TfmReconOptions.dbdtUntilDateExit(Sender: TObject);
begin

 if idDocType=2 then
   if StrToDateDef(dbdtUntilDate.Text,0) > 0 then
    LCurBalance.Caption := FormatFloat(dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ,  TDataBaseRoutines.GetBalans(tblAccountWAccountID.AsInteger,StrToDateDef(dbdtUntilDate.Text,0))) ;

end;

procedure TfmReconOptions.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 LCurBalance.Repaint ;
end;

procedure TfmReconOptions.dbedtBankBalChange(Sender: TObject);
begin
dbedtBankBal.Text := TDataBaseStringRoutines.StripNotNumeric(dbedtBankBal.Text);
end;

end.
