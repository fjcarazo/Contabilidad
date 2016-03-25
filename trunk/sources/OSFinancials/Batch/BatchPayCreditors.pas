(*
  Id: BatchPayCreditors.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchPayCreditors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,   ExtCtrls,
  DBClient, StdCtrls, Buttons, ComCtrls, Menus,
    DBAccess , Uni,UosfVisuals, MemDS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid;

type
  TfrPayCreditors = class(TForm)
    DSCreditorsOpenItems: TDataSource;
    QCreditorsOpenItems: TuniQuery;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    EContraAccount: TEdit;
    LContraAccount: TLabel;
    CBCreateClieop: TCheckBox;
    EPaymentBankAccount: TEdit;
    LBankAccount: TLabel;
    BitBtn4: TBitBtn;
    BtnPrint: TBitBtn;
    EClieopComment1: TEdit;
    LClieopComment: TLabel;
    EClieopComment2: TEdit;
    CDSCreditorOpenITems: TClientDataSet;
    QCreditorsOpenItemsSACCOUNTCODE: TStringField;
    QCreditorsOpenItemsSDESCRIPTION: TStringField;
    QCreditorsOpenItemsWTRANSACTIONID: TIntegerField;
    QCreditorsOpenItemsDDATE: TDateTimeField;
    QCreditorsOpenItemsDUEDATE: TDateTimeField;
    QCreditorsOpenItemsSREFERENCE: TStringField;
    QCreditorsOpenItemsSDESCRIPTION_1: TStringField;
    QCreditorsOpenItemsFAMOUNT: TFloatField;
    QCreditorsOpenItemsFOUTSTANDINGAMOUNT: TFloatField;
    QCreditorsOpenItemsSPOSTAL2: TStringField;
    QCreditorsOpenItemsSBRANCHCODE: TStringField;
    QCreditorsOpenItemsSBANKACCOUNTNUMBER: TStringField;
    PopupMenu1: TPopupMenu;
    Uncheckall1: TMenuItem;
    Uncheckselected1: TMenuItem;
    Checkselected1: TMenuItem;
    CDSCreditorOpenITemsCreditorCode: TStringField;
    CDSCreditorOpenITemsCreditorDescription: TStringField;
    CDSCreditorOpenITemsReference: TStringField;
    CDSCreditorOpenITemsTransactionDate: TDateTimeField;
    CDSCreditorOpenITemsDueDate: TDateField;
    CDSCreditorOpenITemsDescription: TStringField;
    CDSCreditorOpenITemsAmount: TFloatField;
    CDSCreditorOpenITemsAmountOpen: TFloatField;
    CDSCreditorOpenITemsPayTransaction: TIntegerField;
    CDSCreditorOpenITemsTransactionID: TIntegerField;
    CDSCreditorOpenITemsBankType: TStringField;
    CDSCreditorOpenITemsBankNumber: TStringField;
    CDSCreditorOpenITemsCity: TStringField;
    SaveDialog1: TSaveDialog;
    QCreditorsOpenItemsSDOCREF: TStringField;
    QCreditorsOpenItemsSCREDITREF: TStringField;
    CDSCreditorOpenITemsCreditorDebRef: TStringField;
    CDSCreditorOpenITemsDocRef: TStringField;
    Reclaccheckedfrompaymentdate1: TMenuItem;
    PFilter: TPanel;
    LPaymentDate: TLabel;
    DTPaymentDate: TDateTimePicker;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1PayTransaction: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Description: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Amount: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CreditorCode: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CreditorDescription: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1Reference: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1TransactionDate: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DueDate: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1AmountOpen: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1TransactionID: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BankType: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1BankNumber: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1City: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1CreditorDebRef: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DocRef: TcxGridDBBandedColumn;
    QCreditorsOpenItemsWACCOUNTTYPEID: TIntegerField;
    CDSCreditorOpenITemsaccountid: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Uncheckall1Click(Sender: TObject);
    procedure Uncheckselected1Click(Sender: TObject);
    procedure Checkselected1Click(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure QCreditorsOpenItemsBeforeOpen(DataSet: TDataSet);
    procedure Reclaccheckedfrompaymentdate1Click(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    { Private declarations }
  public
    LastBatchRun : Integer ;
    BDesc : Boolean ;
    RepParams : String ;
    AsearchPanel : TSearchPanel ;

    procedure FillCreditorsOpenItem ;
    procedure CreateClieop(AList : TStringList );
 
    procedure LoadVars ;
    procedure SaveVars ;

    { Public declarations }
  end;

 var
  frPayCreditors: TfrPayCreditors;

implementation

uses Database, Lookup,XRoutines,DatabaseAccess,TcVariables,GlobalFunctions,StrUtils,
  UDMTCCoreLink, OSFGeneralRoutines,FreeReportsUnit, UDmQuantumGridDefs;

{$R *.dfm}

procedure TfrPayCreditors.FillCreditorsOpenItem;
var
 i : Integer ;
begin
for i := 0 to CDSCreditorOpenITems.FieldCount - 1 do
  begin
     CDSCreditorOpenITems.Fields[i].ReadOnly := false ;
  end;

 CDSCreditorOpenITems.close ;
 CDSCreditorOpenITems.IndexDefs.Clear ;
 CDSCreditorOpenITems.IndexName := '' ;


 CDSCreditorOpenITems.FieldDefs.Find('CreditorCode').Size := QCreditorsOpenItemsSACCOUNTCODE.Size ;
 CDSCreditorOpenITems.FieldDefs.Find('CreditorDebRef').Size := QCreditorsOpenItemsSCREDITREF.Size ;
 CDSCreditorOpenITems.FieldDefs.Find('BankNumber').Size := QCreditorsOpenItemsSBANKACCOUNTNUMBER.Size ;
 CDSCreditorOpenITemsCreditorCode.Size := QCreditorsOpenItemsSACCOUNTCODE.Size +2;
 CDSCreditorOpenITemsCreditorDebRef.Size := QCreditorsOpenItemsSCREDITREF.Size ;
 CDSCreditorOpenITemsBankNumber.Size := QCreditorsOpenItemsSBANKACCOUNTNUMBER.Size ;
 CDSCreditorOpenITems.CreateDataSet ;
 CDSCreditorOpenITems.open ;
QCreditorsOpenItems.open ;
 CDSCreditorOpenITems.EmptyDataSet ;
 CDSCreditorOpenITems.DisableConstraints ;
 try

 while not QCreditorsOpenItems.eof do
  begin
     CDSCreditorOpenITems.Insert ;
     CDSCreditorOpenITemsaccountid.AsInteger := TDataBaseRoutines.GetAccountIdFromCodeAndType(QCreditorsOpenItemsSACCOUNTCODE.AsString,QCreditorsOpenItemsWACCOUNTTYPEID.AsInteger);


     CDSCreditorOpenITemsCreditorCode.AsString :=  TDataBaseRoutines.AccTypeToChar(QCreditorsOpenItemsWACCOUNTTYPEID.AsInteger) +  QCreditorsOpenItemsSACCOUNTCODE.AsString  ;
     CDSCreditorOpenITemsTransactionDate.AsDateTime :=  QCreditorsOpenItemsDDate.AsDateTime ;
     CDSCreditorOpenITemsAmount.AsFloat :=  QCreditorsOpenItemsFAmount.AsFloat ;
     CDSCreditorOpenITemsAmountOpen.AsFloat :=  QCreditorsOpenItemsFOutstandingAmount.AsFloat ;
     CDSCreditorOpenITemsDescription.AsString := QCreditorsOpenItemsSDescription_1.AsString ;

     CDSCreditorOpenITemsCreditorDebRef.AsString := QCreditorsOpenItemsSCREDITREF.AsString ;
     CDSCreditorOpenITemsDocRef.AsString := QCreditorsOpenItemsSDOCREF.AsString ;

     CDSCreditorOpenITemsReference.AsString := QCreditorsOpenItemsSReference.AsString ;
     CDSCreditorOpenITemsCreditorDescription.AsString := QCreditorsOpenItemsSDescription.AsString ;

     CDSCreditorOpenITemsTransactionID.AsInteger := QCreditorsOpenItemsWTransactionID.AsInteger ;
     CDSCreditorOpenITemsBankType.AsString := QCreditorsOpenItemsSBranchCode.AsString ;
     CDSCreditorOpenITemsCity.AsString := QCreditorsOpenItemsSPostal2.AsString ;
     CDSCreditorOpenITemsDueDate.AsDateTime :=  QCreditorsOpenItemsduedate.AsDateTime ;

     CDSCreditorOpenITemsBankNumber.AsString := QCreditorsOpenItemsSBankAccountNumber.AsString ;

 

     CDSCreditorOpenITems.post ;
     QCreditorsOpenItems.Next ;
  end;
 finally
      CDSCreditorOpenITems.enableConstraints
 end;
QCreditorsOpenItems.Close  ;
for i := 0 to CDSCreditorOpenITems.FieldCount - 1 do
 if CDSCreditorOpenITems.Fields[i] <> CDSCreditorOpenITemsPayTransaction then
  begin
     CDSCreditorOpenITems.Fields[i].ReadOnly := true ;
  end;
 CDSCreditorOpenITemsDescription.ReadOnly := False ;

end;

procedure TfrPayCreditors.FormCreate(Sender: TObject);
   var
    AStream : TFileStream ;
begin
 DMTCCoreLink.AssignConnectionToChilds(self);



  AsearchPanel := TSearchPanel.Create(self);
  AsearchPanel.Parent := PFilter ;
  AsearchPanel.Align := alClient ;
  AsearchPanel.DefSql :=  QCreditorsOpenItems.sql.Text ;
  if FileExists(DMTCCoreLink.GetLocalPluginDir + 'credincsearch.dfm') then
    begin
    AStream := TFileStream.Create(DMTCCoreLink.GetLocalPluginDir + 'credincsearch.dfm',fmShareDenyNone) ;
       try
          AStream.ReadComponent(AsearchPanel);
       finally
          AStream.free ;
       end;
    end else
    begin



   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 0 ;
      WColumnTranslation :=  185 ;
      SColumnOrigen := 'Account.SDescription' ;
      SControlType := 'S' ;
      WControlX := 10 ;
      WControlY := 15 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;
   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 1 ;
      SColumnOrigen := 'dochead.SReference' ;
      WColumnTranslation :=   237 ;
      SControlType := 'S' ;
      WControlX := 110 ;
      WControlY := 15 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;
   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 2 ;
      SColumnOrigen := 'transact.DPAYMENTDATE' ;
      WColumnTranslation := 2213 ;
      SControlType := 'D' ;
      WControlX := 220 ;
      WControlY := 15 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;

   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 1 ;
      SColumnOrigen := 'transact.SReference' ;
      WColumnTranslation :=  1719 ;
      SControlType := 'S' ;
      WControlX := 10 ;
      WControlY := 50 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;

   with AsearchPanel.aSearchCollection.Add as TSearchCollectionItem do
    begin
      Wosf_search_fields_id := 1 ;
      SColumnOrigen := 'Messages.SDescription' ;
      WColumnTranslation :=  1708 ;
      SControlType := 'S' ;
      WControlX := 110 ;
      WControlY := 50 ;
      WControlWidth := 100 ;
      WControlHeigth := 21 ;
    end;
  end;
 AsearchPanel.BuildGui ;
 AsearchPanel.onSearch := SearchClick;

  TDataBaseRoutines.SetDynamicFieldLengths(self);
  EClieopComment1.Text := dmDatabase.SetOfBooksPropertys.CompanyInfo.CompanyName ;
  EClieopComment2.Text := FormatDateTime('dd-mm-yyyy',date)  ;
end;

procedure TfrPayCreditors.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BitBtn2.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BtnPrint.Glyph,'Printer');
 LoadVars ;
 DTPaymentDate.Date := date ;
 FillCreditorsOpenItem ;
 Caption := GetTextLang(2212) ;
 LContraAccount.Caption := GetTextLang(379) ;
 LPaymentDate.Caption := GetTextLang(2213) ;
 CBCreateClieop.Caption := GetTextLang(2214) ;
 LBankAccount.Caption := GetTextLang(2215) ;
 Uncheckall1.Caption := GetTextLang(2223) ;
 Uncheckselected1.Caption := GetTextLang(2224) ;
 Checkselected1.Caption := GetTextLang(2225) ;
 LClieopComment.Caption := GetTextLang(3327) ;



 CDSCreditorOpenITemsCreditorDescription.DisplayLabel := GetTextLang(30) + ' ' + GetTextLang(606) ;
 CDSCreditorOpenITemsReference.DisplayLabel := GetTextLang(607) ;
 CDSCreditorOpenITemsTransactionDate.DisplayLabel := GetTextLang(238) ;
 CDSCreditorOpenITemsDescription.DisplayLabel := GetTextLang(606) ;
 CDSCreditorOpenITemsAmount.DisplayLabel := GetTextLang(946) ;
 CDSCreditorOpenITemsAmountOpen.DisplayLabel := GetTextLang(947) ;
 CDSCreditorOpenITemsPayTransaction.DisplayLabel := GetTextLang(2216) ;
 CDSCreditorOpenITemsDueDate.DisplayLabel := GetTextLang(2222) ;

 CDSCreditorOpenITemsTransactionID.DisplayLabel := GetTextLang(20059) ;
 CDSCreditorOpenITemsBankType.DisplayLabel := GetTextLang(2210) ;


 CDSCreditorOpenITemsBankNumber.DisplayLabel := GetTextLang(2211) ;
 CDSCreditorOpenITemsCity.DisplayLabel := GetTextLang(3328) ;
 CDSCreditorOpenITemsDocRef.DisplayLabel := GetTextLang(237) ;
  CDSCreditorOpenITemsCreditorCode.DisplayLabel := GetTextLang(30) + ' ' + GetTextLang(605) ;


 SaveDialog1.Title := GetTextLang(2217) ;
 BitBtn2.Caption := GetTextLang(953) ;
 BitBtn1.Caption := GetTextLang(168) ;
{ frReport1.FindObject('MHCCode').Memo.Text := GetTextLang(30) + ' ' + GetTextLang(605) ;
 frReport1.FindObject('MHCDesc').Memo.Text := GetTextLang(30) + ' ' + GetTextLang(606) ;
 frReport1.FindObject('MHRef').Memo.Text := GetTextLang(607) ;
 frReport1.FindObject('MHTransDate').Memo.Text := GetTextLang(238) ;
 frReport1.FindObject('MHDueDate').Memo.Text := GetTextLang(2222) ;
 frReport1.FindObject('MHDescription').Memo.Text := GetTextLang(606) ;
 frReport1.FindObject('MHAmount').Memo.Text :=  GetTextLang(946) ;
 frReport1.FindObject('MHAmountOpen').Memo.Text := GetTextLang(947) ;

 frReport1.FindObject('RTCreditorPayment').Memo.Text := GetTextLang(2226) ;
 frReport1.FindObject('RSTotalRows').Memo.Text := GetTextLang(2227) ;
 frReport1.FindObject('RSTotalAmount').Memo.Text := GetTextLang(2228) ;
 frReport1.FindObject('RSCheckSumBank').Memo.Text := GetTextLang(2229) ;
 frReport1.FindObject('PFPage').Memo.Text := GetTextLang(1024)+' [PAGE#]';  }
 BtnPrint.Caption := GetTextLang(52) ;
 EClieopComment1.Text := dmDatabase.SetOfBooksPropertys.CompanyInfo.CompanyName ;
end;
 

procedure TfrPayCreditors.BitBtn2Click(Sender: TObject);
  Var
   AList : TStringList ;
begin
  SaveVars ;
  if CBCreateClieop.Checked then
  begin
   if EPaymentBankAccount.Text = '' then
   begin
     EPaymentBankAccount.SetFocus ;
     raise Exception.Create(DMTCCoreLink.GetTextLang(3071){'U heeft geen bankrekening nummer ingevult.'});
   end;

  if EClieopComment1.Text = '' then
     raise Exception.Create(DMTCCoreLink.GetTextLang(3070){'Clieop comment lines must be filled'});
  if EClieopComment2.Text = '' then
     raise Exception.Create(DMTCCoreLink.GetTextLang(3070){'Clieop comment lines must be filled'});

  SaveDialog1.FileName :=  'clieop3_' +  FormatFloat('000',LastBatchRun+1) ;
   if SaveDialog1.Execute then
    begin
      AList := TStringList.Create ;
      try
        CreateClieop(AList);
        if AList.Count > 0 then
          begin
          AList.SaveToFile(SaveDialog1.FileName);
          CDSCreditorOpenITems.Filter := 'PayTransaction = true'  ;
          CDSCreditorOpenITems.Filtered := true ;
          Try
           TDatabaseTableRoutines.DumpToReportmanTransport(CDSCreditorOpenITems);
           CheckReportMan(0,0,1,0,RepParams,'paycreditor','GENERAL') ;
          finally
            CDSCreditorOpenITems.Filtered := false ;
          end;


          end;
      finally
         AList.free ;
      end;
      self.modalresult := mrok ;
    end;
  end else
  begin
     self.modalresult := mrok ;
  end;
end;

procedure TfrPayCreditors.CreateClieop(AList: TStringList);
var
 ALine : String[50] ;
 ALine35 : String[35] ;
 ATotalOfAccounts ,ABankAccount: Int64 ;
 ALine10 : String[10] ;
 TotalAmount : Int64 ;
 NumberOfEntrys : Integer ;
Const
 AFillLine = '                                                   ';
begin      // example line
  // header
  ATotalOfAccounts := 0 ;
  TotalAmount := 0 ;
  NumberOfEntrys := 0 ;
  Inc(LastBatchRun);
  LastBatchRun := (LastBatchRun mod 999) ;
          //'0001A050105CLIEOP03HB34A05011'
  ALine := '0001A' + formatdatetime('ddmmyy',date) +'CLIEOP03' + 'TC01A05011' + AFillLine ;
  AList.add(ALine);
  // header
//0010B0005448021440001EUR
  // batch trailer
  ALine := '0010B00' + FormatFloat('0000000000', Str2Float(EPaymentBankAccount.text)) + FormatFloat('0000',LastBatchRun) + 'EUR' + AFillLine ;
  AList.add(ALine);
 // batch trailer
 // Desc record
  ALine := '0020A' + EClieopComment1.Text + AFillLine ;
  AList.add(ALine);
  ALine := '0020A' + EClieopComment2.Text + AFillLine ;
  AList.add(ALine);
 // Desc record
 // Sender record
  dmDatabase.tblSysVars.Open ;
  ALine35 := dmDatabase.tblSysVarsSCompanyName.AsString + AFillLine ;
  dmDatabase.tblSysVars.Close ;
  ALine := '0030B1' + FormatDateTime('ddmmyy',DTPaymentDate.Date) + ALine35 + 'P  ' ;
  AList.add(ALine);
 // Sender record
  // Main loop
  CDSCreditorOpenITems.DisableControls ;
  try
  CDSCreditorOpenITems.First ;
   while not CDSCreditorOpenITems.eof do
    begin
      if CDSCreditorOpenITemsPayTransaction.AsInteger =1 then
        begin
            if (StrToIntDef( TDataBaseStringRoutines.StripNotInt(CDSCreditorOpenITemsBankNumber.AsString),0) = 0) then
               begin
                   OSFMessageDlg('No bank account for ' + CDSCreditorOpenITemsCreditorCode.AsString + ' ' + CDSCreditorOpenITemsCreditorDescription.AsString+#13+#10 + 'Skiping record!',mtError,[mbok],0) ;
                   CDSCreditorOpenITems.Next ;
                   Continue ;
               end;

           // pure payment
           if CDSCreditorOpenITemsBankType.AsString = '@' then
           begin
             ALine := '0100A0005' ;
           end else
           // unpure payment
           begin
              ALine := '0100A0000' ;
           end;
          inc(NumberOfEntrys);
          TotalAmount := TotalAmount + ABS(round(CDSCreditorOpenITemsAmountOpen.AsFloat*100)) ;
          ABankAccount := StrToInt( TDataBaseStringRoutines.StripNotInt(CDSCreditorOpenITemsBankNumber.AsString));
          ATotalOfAccounts := ATotalOfAccounts +  ABankAccount ;
          ABankAccount := StrToInt( TDataBaseStringRoutines.StripNotInt(EPaymentBankAccount.text));
          ATotalOfAccounts := ATotalOfAccounts +  ABankAccount ;
          ALine := ALine + formatfloat('000000000000',ABS(round(CDSCreditorOpenITemsAmountOpen.AsFloat*100))) + FormatFloat('0000000000', StrToInt( TDataBaseStringRoutines.StripNotInt(EPaymentBankAccount.text))) +formatfloat('0000000000',StrToInt( TDataBaseStringRoutines.StripNotInt(CDSCreditorOpenITemsBankNumber.AsString))) + AFillLine ;
          AList.add(ALine);
          // examlple 0160A=1302 50002
          ALine := '0160A' +  trim(trim(CDSCreditorOpenITemsCreditorDebRef.AsString + ' ' + CDSCreditorOpenITemsDocRef.AsString) + ' ' +  CDSCreditorOpenITemsDescription.AsString) + AFillLine ;
          AList.add(ALine);
          ALine := '0170B' + CDSCreditorOpenITemsCreditorDescription.AsString + AFillLine ;
          AList.add(ALine);
          ALine := '0173B' + CDSCreditorOpenITemsCity.AsString + AFillLine ;
          AList.add(ALine);
        end;
      CDSCreditorOpenItems.Next ;
    end;
  finally
  CDSCreditorOpenITems.EnableControls ;
  end;
    ALine10 :=  RightStr(formatfloat('0000000000',ATotalOfAccounts),10) ;

 // Batch close record 9990A00000000000231970036301659350000015
    ALine := '9990A'  + formatfloat('000000000000000000',TotalAmount)  + ALine10 + formatfloat('0000000',NumberOfEntrys) + AFillLine ;

    RepParams := 'TOTALROWS=' + intToStr(NumberOfEntrys) + #13+#10 +
   'TOTALAMOUNT2=' + FormatFloat('0.00',TotalAmount / 100) + #13+#10 +
   'CHECKSUMBANK=' + intToStr(ATotalOfAccounts) + #13+#10 +
   'BATCHNR=' + intToStr(LastBatchRun) ;


    AList.add(ALine);
  // footer
    ALine := '9999A'  + AFillLine ;
    AList.add(ALine);
  // footer
end;

procedure TfrPayCreditors.LoadVars;
begin
  LastBatchRun :=  ReadNwReportOp('PCLastBatchRun',0).AsInteger ;
  EContraAccount.Tag := ReadNwReportOp('PWCContraAccount',0).AsInteger ;
  EContraAccount.Text := AddDashInAccCodeNoPRefix(GetAccountCode(EContraAccount.Tag));
  CBCreateClieop.Checked :=  ReadNwReportOp('PCCreateClieop',False).asBoolean ;
  EPaymentBankAccount.Text := ReadNwReportOp('PCPaymentBankAccount','').asstring ;
end;

procedure TfrPayCreditors.SaveVars;
begin
  WriteNwReportOp('PCLastBatchRun',IntToStr(LastBatchRun));
  WriteNwReportOp('PWCContraAccount',IntToStr(EContraAccount.Tag));
  WriteNwReportOp('PCCreateClieop',BoolToStr(CBCreateClieop.Checked,true) );
  WriteNwReportOp('PCPaymentBankAccount',EPaymentBankAccount.Text);
end;

procedure TfrPayCreditors.FormActivate(Sender: TObject);
begin
 if EContraAccount.Text = '' then EContraAccount.SetFocus ;
end;

procedure TfrPayCreditors.Uncheckall1Click(Sender: TObject);
begin
 CDSCreditorOpenITems.First ;
 while not CDSCreditorOpenITems.Eof do
   begin
      CDSCreditorOpenITems.edit ;
      CDSCreditorOpenITemsPayTransaction.AsInteger := 0;
      CDSCreditorOpenITems.Post ;
      CDSCreditorOpenITems.Next ;
   end;
end;

procedure TfrPayCreditors.Uncheckselected1Click(Sender: TObject);
 var
   i : Integer ;
begin
 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
   begin
     cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused :=True ;
      CDSCreditorOpenITems.edit ;
      CDSCreditorOpenITemsPayTransaction.AsInteger := 0;
      CDSCreditorOpenITems.Post ;
   end;

end;

procedure TfrPayCreditors.Checkselected1Click(Sender: TObject);
 var
   i : Integer ;
begin
 for i := 0 to cxGrid1DBBandedTableView1.Controller.SelectedRecordCount -1 do
   begin
     cxGrid1DBBandedTableView1.Controller.SelectedRecords[i].Focused :=True ;
      CDSCreditorOpenITems.edit ;
      CDSCreditorOpenITemsPayTransaction.AsInteger := 1;
      CDSCreditorOpenITems.Post ;
  end;
end;

procedure TfrPayCreditors.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  SortClientDataSet(CDSCreditorOpenITems,AFieldName,BDesc);
  BDesc := not BDesc ;
end;

procedure TfrPayCreditors.BitBtn4Click(Sender: TObject);

var
 id : Integer ;
begin
  FmLookup.IsShowForm := false ;
  //Tbl := 'ACCOUNT' ;
  id := 0 ;
  dmDatabase.tblAccount.open ;
     if dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(EContraAccount.text) +GetSubAccountCode(EContraAccount.text)]), []) then
            id := dmDatabase.tblAccountWAccountID.AsInteger ;

  fmlookup.SelectLookup(Sender,GetTextLang(1002),'ALL','ACCOUNT', id);
  EContraAccount.text := ReturnLookup ;
  EContraAccount.tag := ReturnId ;
  DTPaymentDate.SetFocus ;
  dmDatabase.tblAccount.close ;
end;

procedure TfrPayCreditors.BtnPrintClick(Sender: TObject);
begin
CDSCreditorOpenITems.Filter := 'PayTransaction = true' ;
CDSCreditorOpenITems.Filtered := true ;
Try
TDatabaseTableRoutines.DumpToReportmanTransport(CDSCreditorOpenITems);
CheckReportMan(0,0,1,0,'','paycreditor','GENERAL') ;
finally
  CDSCreditorOpenITems.Filtered := False ;
end;


end;

procedure TfrPayCreditors.QCreditorsOpenItemsBeforeOpen(DataSet: TDataSet);
begin
 if QCreditorsOpenItems.Tag = 0 then
     begin
       QCreditorsOpenItemsSACCOUNTCODE.Size := DMTCCoreLink.MainAccountLength +3 ;
       QCreditorsOpenItemsSDOCREF.Size := GetFieldLength('DOCHEAD','SREFERENCE');
       QCreditorsOpenItemsSCREDITREF.Size := GetFieldLength('CREDITOR','SMessage');
       QCreditorsOpenItemsSBankAccountNumber.Size := GetFieldLength('Creditor','SBankAccountNumber');
       QCreditorsOpenItems.tag := 1 ;
     end;
end;

procedure TfrPayCreditors.Reclaccheckedfrompaymentdate1Click(
  Sender: TObject);
begin
 FillCreditorsOpenItem ;
end;

procedure TfrPayCreditors.SearchClick(Sender: TObject);
var
 Creteria : String ;
begin
  Creteria := AsearchPanel.GetClause ;
  QCreditorsOpenItems.SQL.Text := AsearchPanel.DefSql ;

  if Creteria <> '' then
  QCreditorsOpenItems.SQL.Add(' and '+Creteria) ;
  FillCreditorsOpenItem ;
end;

procedure TfrPayCreditors.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

if not AViewInfo.Selected then
 begin
 if trim(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1BankNumber.Index])) = '' then
  ACanvas.Font.Style :=  []
 else
  ACanvas.Font.Style :=  [fsBold]  ;

  if AViewInfo.Item = cxGrid1DBBandedTableView1CreditorDescription then
    ACanvas.Brush.Color := clWhite  ;
  end else
 begin
 if trim(VarToStr(AViewInfo.GridRecord.Values[cxGrid1DBBandedTableView1BankNumber.Index])) = '' then
  ACanvas.Font.Style :=  []
 else
  ACanvas.Font.Style :=  [fsBold]  ;
  if AViewInfo.Item = cxGrid1DBBandedTableView1CreditorDescription then
    ACanvas.Brush.Color := clBlue  ;
  end
end;

end.
