unit UDMAccountStockDocument;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni,
  ZSqlUpdate,TcashClasses, ZSequence, MemDS;

type
  TImportProgressEvent = procedure (AMax,APos,ATranslation : Integer ) of object;
  TOnImportDataset = procedure (AClientDataset : TDataset;ATranslation : Integer) ;
  // AType 0 = stock 1 = deb 2 = credit 3
  TOnHandelDetail = Procedure (AClientDataset : TDataset;AId,AType :Integer)  of object;
  TImportType = (itDebtors,itContacts,itStock,itDocuments);
  TReturnImportType = (ritAdd,ritUpdate);
  TDMAccountStockDocument = class(TDataModule)
    USQLDescription: TUniUpdateSql;
    TCQDESCRIPTION: TuniQuery;
    TDebtor: TuniQuery;
    TAccounts: TuniQuery;
    QGen: TuniQuery;
    ZqReportingGroup: TuniQuery;
    QAccountsLookups: TuniQuery;
    TCTax: TuniQuery;
    TCQDOCHEAD: TuniQuery;
    USQLDocHead: TUniUpdateSql;
    TCQDOCLINE: TuniQuery;
    USQLDocLine: TUniUpdateSql;
    QStockItems: TuniQuery;
    USQLStock: TUniUpdateSql;
    ZQImportLink: TuniQuery;
    ZUSQLImportLink: TUniUpdateSql;
    ZQImportLinkIMP_LINKID: TIntegerField;
    ZQImportLinkIMP_SOURCEID: TIntegerField;
    ZQImportLinkIMP_EXTID: TStringField;
    ZQImportLinkWACCOUNTID: TIntegerField;
    ZQImportLinkWDOCID: TIntegerField;
    ZQImportLinkWSTOCKID: TIntegerField;
    ZQImportLinkWCONTACTID: TIntegerField;
    ZQImportLinkWEVENTID: TIntegerField;
    ZUSQLAccounts: TUniUpdateSql;
    ZUSQLDebtor: TUniUpdateSql;
    USQLContacts: TUniUpdateSql;
    QContacts: TuniQuery;
    QadressPerAccount: TuniQuery;
    USQLadressPerAccount: TUniUpdateSql;
    QadressPerAccountWADDRESSPERACCOUNTID: TIntegerField;
    QadressPerAccountWACCOUNTID: TIntegerField;
    QadressPerAccountWCONTACTID: TIntegerField;
    QadressPerAccountDSYSDATE: TDateTimeField;
    ZQIMP_STOCKACCOUNTS: TuniQuery;
    ZQIMP_STOCKACCOUNTSIMP_STOCKACCOUNTSID: TIntegerField;
    ZQIMP_STOCKACCOUNTSIMP_SOURCEID: TIntegerField;
    ZQIMP_STOCKACCOUNTSIMP_EXTID: TStringField;
    ZQIMP_STOCKACCOUNTSWSALESACCOUNTID: TIntegerField;
    ZQIMP_STOCKACCOUNTSWCOSTOFSALESACCOUNTID: TIntegerField;
    ZQIMP_STOCKACCOUNTSWSTOCKACCOUNTID: TIntegerField;
    ZQIMP_STOCKACCOUNTSWINPUTTAXACCOUNTID: TIntegerField;
    ZQIMP_STOCKACCOUNTSWOUTPUTTAXACCOUNTID: TIntegerField;
    ZQImportSource: TuniQuery;
    ZQImportSourceIMP_SOURCEID: TIntegerField;
    ZQImportSourceIMP_NAME: TStringField;
    ZQImportSourceIMP_OSFINANCIALS_PHP_URL: TStringField;
    ZQImportSourceIMP_DEBTORURL: TStringField;
    ZQImportSourceIMP_CREDITORURL: TStringField;
    ZQImportSourceIMP_STOCKURL: TStringField;
    ZQImportSourceIMP_DOCUMENTURL: TStringField;
    ZQImportSourceIMP_EVENTURL: TStringField;
    ZQImportSourceIMP_CONTACTURL: TStringField;
    ZQImportSourceIMP_SOURCE_LOGICTYPE: TIntegerField;
    ZQImportSourceIMP_USERNAME: TStringField;
    ZQImportSourceIMP_PASSWORD: TStringField;
    ZQImportSourceIMP_PREFIX: TStringField;
    ZQImportSourceIMP_INIFILE: TBlobField;
    ZQIMP_TOTALS: TuniQuery;
    TCreditor: TuniQuery;
    ZUSQLCreditor: TUniUpdateSql;
    ZQStockBom: TuniQuery;
    ZUSQLStockBom: TUniUpdateSql;
    ZQStockBomWBOMID: TIntegerField;
    ZQStockBomWSTOCKID: TIntegerField;
    ZQStockBomWLINKEDSTOCKID: TIntegerField;
    ZQStockBomFQTY: TFloatField;
    ZQStockBomFPERCENTAGEOFSALE: TFloatField;
    ZQLangs: TuniQuery;
    ZQLangsWGROUPID: TIntegerField;
    ZQLangsWGROUPTYPEID: TIntegerField;
    ZQLangsSDESCRIPTION: TStringField;
    ZQLangsWPARENTGROUP2ID: TIntegerField;
    ZQLangsWPARENTGROUP1ID: TIntegerField;
    ZQLangsDSYSDATE: TDateTimeField;
    ZQLangsWSORTNO: TIntegerField;
    ZQLangsBDISABLE: TSmallintField;
    ZQLangsWCOLOR: TIntegerField;
    ZQLangsWTEXTCOLOR: TIntegerField;
    ZQStockDesc: TuniQuery;
    ZUSQLStockDesc: TUniUpdateSql;
    ZQStockDescWSTOCKID: TIntegerField;
    ZQStockDescWLANGUAGEID: TIntegerField;
    ZQStockDescSDESCRIPTION: TStringField;
    ZQStockDescSEXTRADESCRIPTION: TBlobField;
    ZQStockGroups: TuniQuery;
    ZUSQLStockGroups: TUniUpdateSql;
    ZQStockGroupsWSTOCKID: TIntegerField;
    ZQStockGroupsWGROUPID: TIntegerField;
    ZQStockGroupsIMP_SOURCEID: TIntegerField;
    ZQAgenda: TuniQuery;
    ZQResource: TuniQuery;
    ZUSQLAgenda: TUniUpdateSql;
    ZUSQLResource: TUniUpdateSql;
    procedure TAccountsAfterInsert(DataSet: TDataSet);
    procedure QStockItemsAfterInsert(DataSet: TDataSet);
    procedure QContactsAfterInsert(DataSet: TDataSet);
    procedure TCQDOCHEADAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ZQStockBomAfterInsert(DataSet: TDataSet);
    procedure ZQAgendaAfterInsert(DataSet: TDataSet);
    procedure ZQResourceAfterInsert(DataSet: TDataSet);
  private
    FTheImportProgressEvent: TImportProgressEvent;
    FTheOnImportDataset: TOnImportDataset;
    FTheOnHandelDetail : TOnHandelDetail ;
    procedure SetTheImportProgressEvent(const Value: TImportProgressEvent);
    procedure SetTheOnImportDataset(const Value: TOnImportDataset);
    procedure SetTheOnHandelDetail(const Value: TOnHandelDetail);
    { Private declarations }
  public
    AVariableList : TStringlist ; // must be init
    Function GetVariableStockAccount(AVariable : String;ASourceID:Integer):Integer ;
    Function GetStockOnExtID(AExtId : String;ASourceID:Integer):Integer ;
    Function GetDebAccountOnExtID(AExtId : String;ASourceID:Integer):Integer ;
    procedure PrepareRef(AImportType : TImportType;AKey : Integer;SourceID : Integer ) ;


    property TheImportProgressEvent : TImportProgressEvent  read FTheImportProgressEvent write SetTheImportProgressEvent;
    property TheOnImportDataset : TOnImportDataset  read FTheOnImportDataset write SetTheOnImportDataset;
    property TheOnHandelDetail : TOnHandelDetail  read FTheOnHandelDetail write SetTheOnHandelDetail;
    Procedure AddEditCustomers(ACustomersDataSet : TDataSet;SourceID : Integer) ;
    procedure CreateCustomersDataset(ADataSet : TDataSet ) ;
    procedure GetCustomers(ADataSet : TDataSet ;AAccountIdInSql : String = '') ;

    Procedure AddEditSuppliers(ACustomersDataSet : TDataSet;SourceID : Integer) ;
    procedure CreateSuppliersDataset(ADataSet : TDataSet ) ;
    procedure GetSuppliers(ADataSet : TDataSet ;AAccountIdInSql : String = '') ;

    Procedure AddEditAgenda(AAgendaDataSet : TDataSet;SourceID : Integer) ;
    procedure CreateAgendaDataset(ADataSet : TDataSet ) ;
    procedure GetAgenda(ADataSet : TDataSet ;AAgendaIdInSql : String = '') ;

    procedure GetStock(ADataSet : TDataSet;ASql : String = '');
    Procedure AddEditStock(AStockDataSet : TDataSet;SourceID : Integer;JustNew : Boolean = False) ;
    procedure CreateStockDataSet(ADataSet : TDataSet ) ;

    procedure GetStockBom(ADataSet : TDataSet;ASql : String = '');
    Procedure AddEditStockBom(AStockDataSet : TDataSet;SourceID : Integer) ;
    procedure CreateStockBomDataSet(ADataSet : TDataSet ) ;

    procedure GetStockLinkedgroups(ADataSet : TDataSet;ASql : String = '');
    Procedure AddEditStockLinkedGroups(AStockDataSet : TDataSet;SourceID : Integer) ;
    procedure CreateStockLinedGroupsDataSet(ADataSet : TDataSet ) ;


    Procedure AddEditContacts(AContactDataSet : TDataSet;SourceID : Integer) ;
    procedure CreateContactsDataSet (ADataSet : TDataSet);
    procedure GetContacts(ADataSet : TDataSet;ASql : String = '');

    Procedure AddEditDocuments(ADocumentDataSet,ADetailDataset:TDataSet;SourceID : Integer) ;
    procedure CreateDocumentsDataSet (ADataSet,ADetailDataset : TDataSet);
    procedure GetDocuments(ADataSet,ADetailDataset : TDataSet;ASql : String = '');
    { Public declarations }
  end;

  var
  DMAccountStockDocument: TDMAccountStockDocument;

implementation

uses UDMTCCoreLink , OSFGeneralRoutines, virtualtable, variants, Math;

{$R *.dfm}




procedure TDMAccountStockDocument.AddEditCustomers(
  ACustomersDataSet: TDataSet;SourceID : Integer);
  var
   AccCode  : String ;
   AccT : Char ;

begin
 if assigned(FTheOnImportDataset) then
    FTheOnImportDataset(ACustomersDataSet,160{Debtors}) ;
 ACustomersDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(ACustomersDataSet.RecordCount,-1,160{Debtors});
 while not ACustomersDataSet.Eof do
   begin
       if assigned(FTheImportProgressEvent) then
         FTheImportProgressEvent(ACustomersDataSet.RecordCount,ACustomersDataSet.RecNo,160{Debtors});
       ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WACCOUNTID is not null and IMP_EXTID =' + QuotedStr(ACustomersDataSet.FindField('EXTID').AsString) ;
       ZQImportLink.open ;
       if ZQImportLink.IsEmpty then
         begin
            TDebtor.SQL.Text := 'Select * from debtor where 1 = 0' ;
            TDebtor.Open ;
            TDebtor.Insert ;
            TAccounts.SQL.Text := 'Select * from account where 1 = 0' ;
            TAccounts.open ;
            TAccounts.Insert ;
            // handeled by insert
            if TAccounts.FindField('WACCOUNTID').IsNull  then
            TAccounts.FindField('WACCOUNTID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWACCOUNTID) ;
            if ACustomersDataSet.FindField('SACCOUNTCODE').AsString <> '' then
            TAccounts.FindField('SACCOUNTCODE').AsString :=  ACustomersDataSet.FindField('SACCOUNTCODE').AsString
            else
            TAccounts.FindField('SACCOUNTCODE').AsString := TDataBaseRoutines.GetUniqueAccountCode('D') ;
            // Force new account.
            TAccounts.FindField('SACCOUNTCODE').AsString := UpperCase(TAccounts.FindField('SACCOUNTCODE').AsString );
            // see if exists
            if TDataBaseRoutines.GetAccountIDFromCode('D' + TAccounts.FindField('SACCOUNTCODE').AsString) < 1 then
              begin
               TAccounts.FindField('SACCOUNTCODE').AsString := TDataBaseRoutines.GetUniqueAccountCode('D') ;
              end;
            TAccounts.FindField('SMAINACCOUNTCODE').AsString := TDataBaseRoutines.SimpelAccountCodeToMainAccount(TAccounts.FindField('SACCOUNTCODE').AsString);
            TAccounts.FindField('SSUBACCOUNTCODE').AsString := TDataBaseRoutines.SimpelAccountCodeToSubAccount(TAccounts.FindField('SACCOUNTCODE').AsString);
            TAccounts.FindField('WACCOUNTTYPEID').AsInteger := 1 ;
            TAccounts.FindField('WLINKACCOUNT').AsInteger := TAccounts.FindField('WACCOUNTID').AsInteger ;
            TAccounts.FindField('BSUBACCOUNTS').AsInteger := 0 ;
            TAccounts.FindField('WREPORTINGGROUP1ID').AsInteger := 0;
            TAccounts.FindField('WREPORTINGGROUP2ID').AsInteger := 0 ;
            TAccounts.FindField('BINCOMEEXPENSE').AsInteger := 0 ;
            TAccounts.FindField('BOPENITEM').AsInteger := 1 ;
            TAccounts.FindField('BINACTIVE').AsInteger := 0 ;
            TDebtor.FindField('WACCOUNTID').AsInteger := TAccounts.FindField('WACCOUNTID').AsInteger ;
            TAccounts.post ;
            TDebtor.Post ;
            TDataBaseRoutines.CreateTotalsForAccount(TDebtor.FindField('WACCOUNTID').AsInteger);
            // add to link
            ZQImportLink.Insert ;
            ZQImportLinkIMP_LINKID.AsInteger :=  DMTCCoreLink.GetNewIdStr('GEN_LINKID') ;
            ZQImportLinkIMP_SOURCEID.AsInteger := SourceID ;
            ZQImportLinkIMP_EXTID.AsString :=  ACustomersDataSet.FindField('EXTID').AsString ;
            ZQImportLinkWACCOUNTID.AsInteger := TDebtor.FindField('WACCOUNTID').AsInteger ;
            ZQImportLink.Post ;
            TDebtor.Edit ;
            TAccounts.Edit ;
         end else
         begin
            TDebtor.SQL.Text := 'Select * from debtor where WACCOUNTID = ' + ZQImportLinkWACCOUNTID.AsString ;
            TDebtor.Open ;
            TDebtor.Edit ;
            TAccounts.SQL.Text := 'Select * from account where WACCOUNTID = ' + ZQImportLinkWACCOUNTID.AsString ;
            TAccounts.open ;
            TAccounts.Edit ;
         end;

            TAccounts.FindField('SDESCRIPTION').AsString :=  ACustomersDataSet.FindField('SDESCRIPTION').AsString ;
            TAccounts.FindField('BINACTIVE').AsInteger := ACustomersDataSet.FindField('BINACTIVE').AsInteger ;
            if not ACustomersDataSet.FieldByName('SPostal1').IsNull then
            TDebtor.FieldByName('SPostal1').AsString := ACustomersDataSet.FieldByName('SPostal1').AsString ;
            if not ACustomersDataSet.FieldByName('SPostal2').IsNull then
            TDebtor.FieldByName('SPostal2').AsString := ACustomersDataSet.FieldByName('SPostal2').AsString ;
            if not ACustomersDataSet.FieldByName('SPostal3').IsNull then
            TDebtor.FieldByName('SPostal3').AsString := ACustomersDataSet.FieldByName('SPostal3').AsString ;
            if not ACustomersDataSet.FieldByName('SPostalCode').IsNull then
            TDebtor.FieldByName('SPostalCode').AsString := ACustomersDataSet.FieldByName('SPostalCode').AsString ;

            if not ACustomersDataSet.FieldByName('sDelivery1').IsNull then
            TDebtor.FieldByName('sDelivery1').AsString := ACustomersDataSet.FieldByName('sDelivery1').AsString ;
            if not ACustomersDataSet.FieldByName('sDelivery2').IsNull then
            TDebtor.FieldByName('sDelivery2').AsString := ACustomersDataSet.FieldByName('sDelivery2').AsString ;
            if not ACustomersDataSet.FieldByName('sDelivery3').IsNull then
            TDebtor.FieldByName('sDelivery3').AsString := ACustomersDataSet.FieldByName('sDelivery3').AsString ;
            if not ACustomersDataSet.FieldByName('sDeliveryCode').IsNull then
            TDebtor.FieldByName('sDeliveryCode').AsString := ACustomersDataSet.FieldByName('sDeliveryCode').AsString ;

            if not ACustomersDataSet.FieldByName('STelephone1').IsNull then
            TDebtor.FieldByName('STelephone1').AsString := ACustomersDataSet.FieldByName('STelephone1').AsString ;
            if not ACustomersDataSet.FieldByName('STelephone2').IsNull then
            TDebtor.FieldByName('STelephone2').AsString := ACustomersDataSet.FieldByName('STelephone2').AsString ;
            if not ACustomersDataSet.FieldByName('SEMail').IsNull then
            TDebtor.FieldByName('SEMail').AsString := ACustomersDataSet.FieldByName('SEMail').AsString ;
            if not ACustomersDataSet.FieldByName('SFax').IsNull then
            TDebtor.FieldByName('SFax').AsString := ACustomersDataSet.FieldByName('SFax').AsString ;
            if not ACustomersDataSet.FieldByName('FCREDITLimit').IsNull then
            TDebtor.FieldByName('FCREDITLimit').AsFloat := ACustomersDataSet.FieldByName('FCREDITLimit').AsFloat ;

            if not ACustomersDataSet.FieldByName('FChargeAmount').IsNull then
            TDebtor.FieldByName('FChargeAmount').AsFloat := ACustomersDataSet.FieldByName('FChargeAmount').AsFloat ;
            if not ACustomersDataSet.FieldByName('FDiscount').IsNull then
            TDebtor.FieldByName('FDiscount').AsFloat := ACustomersDataSet.FieldByName('FDiscount').AsFloat ;
            if not ACustomersDataSet.FieldByName('FInterest').IsNull then
            TDebtor.FieldByName('FInterest').AsFloat := ACustomersDataSet.FieldByName('FInterest').AsFloat ;
            if not ACustomersDataSet.FieldByName('SMessage').IsNull then
            TDebtor.FieldByName('SMessage').AsString := ACustomersDataSet.FieldByName('SMessage').AsString ;
            if not ACustomersDataSet.FieldByName('WDefaultPriceTypeID').IsNull then
            TDebtor.FieldByName('WDefaultPriceTypeID').AsInteger := ACustomersDataSet.FieldByName('WDefaultPriceTypeID').AsInteger ;

            if not ACustomersDataSet.FieldByName('DLastActivity').IsNull then
            TDebtor.FieldByName('DLastActivity').AsDateTime := ACustomersDataSet.FieldByName('DLastActivity').AsDateTime ;
            if not ACustomersDataSet.FieldByName('Sreference').IsNull then
            TDebtor.FieldByName('Sreference').AsString := ACustomersDataSet.FieldByName('Sreference').AsString ;
            if not ACustomersDataSet.FieldByName('WDUEDAYS').IsNull then
            TDebtor.FieldByName('WDUEDAYS').AsInteger := ACustomersDataSet.FieldByName('WDUEDAYS').AsInteger ;
            if not ACustomersDataSet.FieldByName('SCOMPANYREGNO').IsNull then
            TDebtor.FieldByName('SCOMPANYREGNO').AsString := ACustomersDataSet.FieldByName('SCOMPANYREGNO').AsString ;
            if not ACustomersDataSet.FieldByName('SFREEFIELD1').IsNull then
            TDebtor.FieldByName('SFREEFIELD1').AsString := ACustomersDataSet.FieldByName('SFREEFIELD1').AsString ;
            if not ACustomersDataSet.FieldByName('SFREEFIELD2').IsNull then
            TDebtor.FieldByName('SFREEFIELD2').AsString := ACustomersDataSet.FieldByName('SFREEFIELD2').AsString ;
            if not ACustomersDataSet.FieldByName('SFREEFIELD3').IsNull then
            TDebtor.FieldByName('SFREEFIELD3').AsString := ACustomersDataSet.FieldByName('SFREEFIELD3').AsString ;

            if not ACustomersDataSet.FieldByName('SBANKNAME').IsNull then
            TDebtor.FieldByName('SBANKNAME').AsString := ACustomersDataSet.FieldByName('SBANKNAME').AsString ;
            if not ACustomersDataSet.FieldByName('SBRANCHCODE').IsNull then
            TDebtor.FieldByName('SBRANCHCODE').AsString := ACustomersDataSet.FieldByName('SBRANCHCODE').AsString ;
            if not ACustomersDataSet.FieldByName('SBANKACCOUNTNUMBER').IsNull then
            TDebtor.FieldByName('SBANKACCOUNTNUMBER').AsString := ACustomersDataSet.FieldByName('SBANKACCOUNTNUMBER').AsString ;
            if not ACustomersDataSet.FieldByName('SBANKACCOUNTNAME').IsNull then
            TDebtor.FieldByName('SBANKACCOUNTNAME').AsString := ACustomersDataSet.FieldByName('SBANKACCOUNTNAME').AsString ;
            if not ACustomersDataSet.FieldByName('SCREDITCARDNUMBER').IsNull then
            TDebtor.FieldByName('SCREDITCARDNUMBER').AsString := ACustomersDataSet.FieldByName('SCREDITCARDNUMBER').AsString ;
            if not ACustomersDataSet.FieldByName('SCREDITCARDTYPE').IsNull then
            TDebtor.FieldByName('SCREDITCARDTYPE').AsString := ACustomersDataSet.FieldByName('SCREDITCARDTYPE').AsString ;
            if not ACustomersDataSet.FieldByName('SCREDITCARDHOLDER').IsNull then
            TDebtor.FieldByName('SCREDITCARDHOLDER').AsString := ACustomersDataSet.FieldByName('SCREDITCARDHOLDER').AsString ;

           if not ACustomersDataSet.FieldByName('SDEFAULTACCOUNT').IsNull then
           begin
            TDebtor.FieldByName('WDEFAULTACCOUNT').AsInteger := 0 ;
            AccCode := UpperCase(Trim( ACustomersDataSet.FieldByName('SDEFAULTACCOUNT').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);

              TDebtor.FieldByName('WDEFAULTACCOUNT').AsInteger := TDataBaseRoutines.GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;
           end;

          if not ACustomersDataSet.FieldByName('SDEFAULTTAX').IsNull then
          begin
          TDebtor.FieldByName('WDEFAULTTAX').AsInteger := 0 ;
          AccCode := UpperCase(Trim( ACustomersDataSet.FieldByName('SDEFAULTTAX').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);
              TDebtor.FieldByName('WDEFAULTTAX').AsInteger := TDataBaseRoutines.GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;
          end;

          if not ACustomersDataSet.FieldByName('SPostCountry').IsNull then
          TDebtor.FieldByName('WPOSTCOUNTRIES_ID').AsInteger :=  TDataBaseRoutines.GetAddCountryId(ACustomersDataSet.FieldByName('SPostCountry').AsString) ;
          if not ACustomersDataSet.FieldByName('SDelCountry').IsNull then
          TDebtor.FieldByName('WDELCOUNTRIES_ID').AsInteger :=  TDataBaseRoutines.GetAddCountryId(ACustomersDataSet.FieldByName('SDelCountry').AsString) ;
          if not ACustomersDataSet.FieldByName('SSalesperson').IsNull then
          TDebtor.FieldByName('WSalesmanID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ACustomersDataSet.FieldByName('SSalesperson').AsString,31) ;
          if not ACustomersDataSet.FieldByName('SREPORTINGGROUP1').IsNull then
          TAccounts.FieldByName('WREPORTINGGROUP1ID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ACustomersDataSet.FieldByName('SREPORTINGGROUP1').AsString,22) ; ;
          if not ACustomersDataSet.FieldByName('SREPORTINGGROUP2').IsNull then
          TAccounts.FieldByName('WREPORTINGGROUP2ID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ACustomersDataSet.FieldByName('SREPORTINGGROUP2').AsString,23) ; ;

          TAccounts.post ;
          TDebtor.post ;
          ACustomersDataSet.Next ;
   end;
end;

procedure TDMAccountStockDocument.AddEditStock(AStockDataSet: TDataSet;
  SourceID: Integer;JustNew : Boolean = False );
  var
   IsNew : Boolean ;
begin
  IsNew := True ;
  if assigned(FTheOnImportDataset) then
     FTheOnImportDataset(AStockDataSet,869{stock});
  AStockDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(AStockDataSet.RecordCount,-1,869{stock});
 QStockItems.SQL.Text := 'Select * from stock where WStockID =:WStockID' ;
 while not AStockDataSet.Eof do
   begin
    if assigned(FTheImportProgressEvent) then
      FTheImportProgressEvent(AStockDataSet.RecordCount,AStockDataSet.RecNo,869{stock});
        ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WSTOCKID is not null and IMP_EXTID =' + QuotedStr(AStockDataSet.FindField('EXTID').AsString) ;
        ZQImportLink.open ;
       if ZQImportLink.IsEmpty then
         begin
          //IsNew := true   ;
          QStockItems.close ;
          QStockItems.Params[0].AsInteger := -1 ;
          QStockItems.open ;
          QStockItems.Append ;
          if QStockItems.FieldByName('SSTOCKCODE').AsString = '' then
          QStockItems.FieldByName('SSTOCKCODE').AsString := TDataBaseStockRoutines.GetUniqueStockCode(FormatFloat('000',SourceID),AStockDataSet.FieldByName('SSTOCKCODE').AsString) ;
          QStockItems.Post ;
          ZQImportLink.Insert ;
          ZQImportLinkIMP_LINKID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_LINKID') ;
          ZQImportLinkIMP_SOURCEID.AsInteger := SourceID ;
          ZQImportLinkIMP_EXTID.AsString :=  AStockDataSet.FindField('EXTID').AsString ;
          ZQImportLinkWSTOCKID.AsInteger := QStockItems.FindField('WSTOCKID').AsInteger ;
          ZQImportLink.Post ;
          QStockItems.Edit ;
         end else // else ZQImportLink.IsEmpty
         begin
            // IsNew := False ;

            QStockItems.close ;
            QStockItems.Params[0].AsInteger := ZQImportLinkWSTOCKID.AsInteger ;
            QStockItems.open ;
            QStockItems.Edit ;

          if JustNew then
               begin
                 if not AStockDataSet.FieldByName('BDisabled').IsNull then
                    QStockItems.FieldByName('BDisabled').AsInteger := AStockDataSet.FieldByName('BDisabled').AsInteger;
                 QStockItems.post ;


                 AStockDataSet.Next;
                 Continue ;
               end;

         end;

      if isnew then
      begin
      QStockItems.FieldByName('SBarCodeNumber').AsString := AStockDataSet.FieldByName('SBarCodeNumber').AsString;
      if not AStockDataSet.FieldByName('SDescription').IsNull then
      QStockItems.FieldByName('SDescription').AsString := AStockDataSet.FieldByName('SDescription').AsString;
      //QStockItems.FieldByName('WStockTypeID').Asinteger := 0 ;
      if not AStockDataSet.FieldByName('SMANUFACTURER').IsNull then
      QStockItems.FieldByName('SMANUFACTURER').AsString := AStockDataSet.FieldByName('SMANUFACTURER').AsString;
      if not AStockDataSet.FieldByName('WSTOCKTYPEID').IsNull then
      QStockItems.FieldByName('WSTOCKTYPEID').AsString := AStockDataSet.FieldByName('WSTOCKTYPEID').AsString;





      if not AStockDataSet.FieldByName('SSTOCKCODESUP2').IsNull then
      QStockItems.FieldByName('SSTOCKCODESUP2').AsString := AStockDataSet.FieldByName('SSTOCKCODESUP2').AsString;



      if not AStockDataSet.FieldByName('SExtraDesc').IsNull then
      QStockItems.FieldByName('SExtraDesc').AsString := AStockDataSet.FieldByName('SExtraDesc').AsString;

      if not AStockDataSet.FieldByName('BDisabled').IsNull then
      QStockItems.FieldByName('BDisabled').AsInteger := AStockDataSet.FieldByName('BDisabled').AsInteger;



      if not AStockDataSet.FieldByName('FREORDERQTYTRIG').IsNull then
      QStockItems.FieldByName('FREORDERQTYTRIG').AsFloat := AStockDataSet.FieldByName('FREORDERQTYTRIG').AsFloat;

      if not AStockDataSet.FieldByName('FReorderQty').IsNull then
      QStockItems.FieldByName('FReorderQty').AsFloat := AStockDataSet.FieldByName('FReorderQty').AsFloat;
      if not AStockDataSet.FieldByName('BApplyInvoiceDiscount').IsNull then
      QStockItems.FieldByName('BApplyInvoiceDiscount').AsInteger := AStockDataSet.FieldByName('BApplyInvoiceDiscount').AsInteger;
      if not AStockDataSet.FieldByName('SUnit').IsNull then
      QStockItems.FieldByName('WUnitID').AsInteger := TDataBaseStockRoutines.GetAddUnitId(AStockDataSet.FieldByName('SUnit').asString,true);
      if not AStockDataSet.FieldByName('SGroup1').IsNull then
      QStockItems.FieldByName('WREPORTINGGROUP1ID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(AStockDataSet.FieldByName('SGroup1').asString,26);
      if not AStockDataSet.FieldByName('SGroup2').IsNull then
      QStockItems.FieldByName('WREPORTINGGROUP2ID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(AStockDataSet.FieldByName('SGroup2').asString,27);
      if AStockDataSet.FieldByName('EXTTAXLINK').AsString <> '' then
      begin
        ZQIMP_STOCKACCOUNTS.close ;
        ZQIMP_STOCKACCOUNTS.ParamByName('IMP_SOURCEID').AsInteger := SourceID ;
        ZQIMP_STOCKACCOUNTS.ParamByName('IMP_EXTID').AsString := AStockDataSet.FieldByName('EXTTAXLINK').AsString ;
        ZQIMP_STOCKACCOUNTS.open ;
        if not ZQIMP_STOCKACCOUNTS.IsEmpty then
        begin
          QStockItems.FieldByName('WCostAccountID').AsInteger := ZQIMP_STOCKACCOUNTSWCOSTOFSALESACCOUNTID.AsInteger ;
          QStockItems.FieldByName('WSaleSACCOUNTID').AsInteger := ZQIMP_STOCKACCOUNTSWSALESACCOUNTID.AsInteger;
          QStockItems.FieldByName('WStockAccountID').AsInteger := ZQIMP_STOCKACCOUNTSWSTOCKACCOUNTID.AsInteger;
          QStockItems.FieldByName('WInputTaxID').AsInteger := ZQIMP_STOCKACCOUNTSWINPUTTAXACCOUNTID.AsInteger;
          QStockItems.FieldByName('WOutputTaxID').AsInteger := ZQIMP_STOCKACCOUNTSWOUTPUTTAXACCOUNTID.AsInteger;
        end;
      end else
      begin
        if not AStockDataSet.FieldByName('SCostAccount').IsNull then
        QStockItems.FieldByName('WCostAccountID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(AStockDataSet.FieldByName('SCostAccount').AsString);
        if not AStockDataSet.FieldByName('SSaleSACCOUNT').IsNull then
        QStockItems.FieldByName('WSaleSACCOUNTID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode( AStockDataSet.FieldByName('SSaleSACCOUNT').AsString);
        if not AStockDataSet.FieldByName('SStockAccount').IsNull then
        QStockItems.FieldByName('WStockAccountID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(AStockDataSet.FieldByName('SStockAccount').AsString);
        if not AStockDataSet.FieldByName('SInputTax').IsNull then
        QStockItems.FieldByName('WInputTaxID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(AStockDataSet.FieldByName('SInputTax').AsString);
        if not AStockDataSet.FieldByName('SOutputTax').IsNull then
        QStockItems.FieldByName('WOutputTaxID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(AStockDataSet.FieldByName('SOutputTax').AsString);

      end;
      end; // end is new

      if not AStockDataSet.FieldByName('FQtyOnHand').IsNull then
      QStockItems.FieldByName('FQtyOnHand').AsFloat := AStockDataSet.FieldByName('FQtyOnHand').AsFloat ;
      if not AStockDataSet.FieldByName('FSellingPrice1').IsNull then
      QStockItems.FieldByName('FSellingPrice1').AsFloat := AStockDataSet.FieldByName('FSellingPrice1').AsFloat ;
      if not AStockDataSet.FieldByName('FSellingPrice2').IsNull then
      QStockItems.FieldByName('FSellingPrice2').AsFloat :=  AStockDataSet.FieldByName('FSellingPrice2').AsFloat ;
      if not AStockDataSet.FieldByName('FSellingPrice3').IsNull then
      QStockItems.FieldByName('FSellingPrice3').AsFloat :=  AStockDataSet.FieldByName('FSellingPrice3').AsFloat ;
      if not AStockDataSet.FieldByName('FUnitAveCost').IsNull then
      QStockItems.FieldByName('FUnitAveCost').AsFloat :=  AStockDataSet.FieldByName('FUnitAveCost').AsFloat ;
      if not AStockDataSet.FieldByName('FUnitCost').IsNull then
      QStockItems.FieldByName('FUnitCost').AsFloat := AStockDataSet.FieldByName('FUnitCost').AsFloat ;
      if not AStockDataSet.FieldByName('SSTOCKCODESUP1').IsNull then
      QStockItems.FieldByName('SSTOCKCODESUP1').AsString := AStockDataSet.FieldByName('SSTOCKCODESUP1').AsString;
      if not AStockDataSet.FieldByName('SSupplier1').IsNull then
      QStockItems.FieldByName('WSUPPLIER1ID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(AStockDataSet.FieldByName('SSupplier1').AsString);
      if not AStockDataSet.FieldByName('SSupplier2').IsNull then
      QStockItems.FieldByName('WSUPPLIER2ID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(AStockDataSet.FieldByName('SSupplier2').AsString);
      QStockItems.Post;

      //ZQLangs.close ;
      if isnew then
      begin
      ZQLangs.open ;
      ZQLangs.first ;
      while not ZQLangs.eof do
        begin
           if AStockDataSet.FindField('SLANGDESC'+  ZQLangsWGROUPID.AsString).AsString <> '' then
           begin
           ZQStockDesc.close ;
           ZQStockDesc.Params[0].AsInteger := QStockItems.FindField('WSTOCKID').AsInteger ;
           ZQStockDesc.Params[1].AsInteger := ZQLangsWGROUPID.AsInteger ;
           ZQStockDesc.open ;

          if ZQStockDesc.IsEmpty then
             ZQStockDesc.Insert else
           ZQStockDesc.Edit ;
           ZQStockDescWSTOCKID.AsInteger := QStockItems.fieldByName('WSTOCKID').AsInteger ;
           ZQStockDescWLANGUAGEID.AsInteger := ZQLangsWGROUPID.AsInteger ;
           ZQStockDescSDESCRIPTION.AsString := AStockDataSet.FindField('SLANGDESC'+  ZQLangsWGROUPID.AsString).AsString ;
           ZQStockDescSEXTRADESCRIPTION.AsString :=AStockDataSet.FindField('SLANGMEMO'+  ZQLangsWGROUPID.AsString).AsString ;
          if (ZQStockDescSDESCRIPTION.AsString = '' ) and (ZQStockDescSEXTRADESCRIPTION.AsString = '' ) then
            begin
               if ZQStockDesc.State = dsinsert then
                  ZQStockDesc.cancel else
                  ZQStockDesc.delete ;
            end else
            ZQStockDesc.post ;
            end ;
            ZQLangs.next ;
        end;
       if Assigned(FTheOnHandelDetail) then
         FTheOnHandelDetail(AStockDataSet,QStockItems.fieldByName('WSTOCKID').AsInteger,0);
       end;
      AStockDataSet.Next;

    end;
end;

procedure TDMAccountStockDocument.CreateCustomersDataset(
  ADataSet: TDataSet);
begin
  ADataSet.close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
  ADataSet.FieldDefs.Clear ;
  TDebtor.SQL.Text := 'Select * from debtor where Waccountid = 0' ;
  TDebtor.Open ;
  TAccounts.SQL.Text := 'Select * from account where Waccountid = 0' ;
  TAccounts.open ;
  ADataSet.FieldDefs.Add('EXTID',ftString,60);
  ADataSet.FieldDefs.Add('SACCOUNTCODE',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SDESCRIPTION',ftString,TAccounts.FindField('SDESCRIPTION').Size);

  ADataSet.FieldDefs.Add('SPostal1',ftString,TDebtor.FindField('SPostal1').Size);
  ADataSet.FieldDefs.Add('SPostal2',ftString,TDebtor.FindField('SPostal2').Size);
  ADataSet.FieldDefs.Add('SPostal3',ftString,TDebtor.FindField('SPostal3').Size);
  ADataSet.FieldDefs.Add('SPostalCode',ftString,TDebtor.FindField('SPostalCode').Size);
  ADataSet.FieldDefs.Add('sDelivery1',ftString,TDebtor.FindField('sDelivery1').Size);
  ADataSet.FieldDefs.Add('sDelivery2',ftString,TDebtor.FindField('sDelivery2').Size);
  ADataSet.FieldDefs.Add('sDelivery3',ftString,TDebtor.FindField('sDelivery3').Size);
  ADataSet.FieldDefs.Add('sDeliveryCode',ftString,TDebtor.FindField('sDeliveryCode').Size);

  ADataSet.FieldDefs.Add('STelephone1',ftString,TDebtor.FindField('STelephone1').Size);
  ADataSet.FieldDefs.Add('STelephone2',ftString,TDebtor.FindField('STelephone2').Size);
  ADataSet.FieldDefs.Add('SEMail',ftString,TDebtor.FindField('SEMail').Size);
  ADataSet.FieldDefs.Add('SFax',ftString,TDebtor.FindField('SFax').Size);

  ADataSet.FieldDefs.Add('FCREDITLimit',ftFloat);
  ADataSet.FieldDefs.Add('FChargeAmount',ftFloat);
  ADataSet.FieldDefs.Add('FDiscount',ftFloat);
  ADataSet.FieldDefs.Add('FInterest',ftFloat);

  ADataSet.FieldDefs.Add('SMessage',ftString,TDebtor.FindField('SMessage').Size);
  ADataSet.FieldDefs.Add('WDefaultPriceTypeID',ftInteger);
  ADataSet.FieldDefs.Add('DLastActivity',ftDateTime);
  ADataSet.FieldDefs.Add('WDUEDAYS',ftInteger);
  ADataSet.FieldDefs.Add('BINACTIVE',ftSmallint);



  ADataSet.FieldDefs.Add('Sreference',ftString,TDebtor.FindField('Sreference').Size);
  ADataSet.FieldDefs.Add('SCOMPANYREGNO',ftString,TDebtor.FindField('SCOMPANYREGNO').Size);
  ADataSet.FieldDefs.Add('SFREEFIELD1',ftString,TDebtor.FindField('SFREEFIELD1').Size);
  ADataSet.FieldDefs.Add('SFREEFIELD2',ftString,TDebtor.FindField('SFREEFIELD2').Size);
  ADataSet.FieldDefs.Add('SFREEFIELD3',ftString,TDebtor.FindField('SFREEFIELD3').Size);
  ADataSet.FieldDefs.Add('SBANKNAME',ftString,TDebtor.FindField('SBANKNAME').Size);
  ADataSet.FieldDefs.Add('SBRANCHCODE',ftString,TDebtor.FindField('SBRANCHCODE').Size);
  ADataSet.FieldDefs.Add('SBANKACCOUNTNUMBER',ftString,TDebtor.FindField('SBANKACCOUNTNUMBER').Size);
  ADataSet.FieldDefs.Add('SBANKACCOUNTNAME',ftString,TDebtor.FindField('SBANKACCOUNTNAME').Size);
  ADataSet.FieldDefs.Add('SCREDITCARDNUMBER',ftString,TDebtor.FindField('SCREDITCARDNUMBER').Size);
  ADataSet.FieldDefs.Add('SCREDITCARDTYPE',ftString,TDebtor.FindField('SCREDITCARDTYPE').Size);
  ADataSet.FieldDefs.Add('SCREDITCARDHOLDER',ftString,TDebtor.FindField('SCREDITCARDHOLDER').Size);

  ADataSet.FieldDefs.Add('SDEFAULTACCOUNT',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SDEFAULTTAX',ftString,DMTCCoreLink.MainAccountLength+4);

  ADataSet.FieldDefs.Add('SPostCountry',ftString,64);
  ADataSet.FieldDefs.Add('SDelCountry',ftString,64);
  ADataSet.FieldDefs.Add('SSalesperson',ftString,30);

  ADataSet.FieldDefs.Add('SREPORTINGGROUP1',ftString,255);
  ADataSet.FieldDefs.Add('SREPORTINGGROUP2',ftString,255);
  finally
    ADataSet.FieldDefs.EndUpdate ;
  end;
end;

procedure TDMAccountStockDocument.SetTheImportProgressEvent(
  const Value: TImportProgressEvent);
begin
  FTheImportProgressEvent := Value;
end;

procedure TDMAccountStockDocument.SetTheOnImportDataset(
  const Value: TOnImportDataset);
begin
  FTheOnImportDataset := Value;
end;

procedure TDMAccountStockDocument.TAccountsAfterInsert(DataSet: TDataSet);
begin
 TAccounts.FieldByName('WACCOUNTID').AsInteger :=  DMTCCoreLink.GetNewId(tcidNEWACCOUNTID) ;
end;

procedure TDMAccountStockDocument.QStockItemsAfterInsert(
  DataSet: TDataSet);
begin
 QStockItems.FieldByName('WSTOCKID').AsInteger :=  DMTCCoreLink.GetNewId(tcidNEWSTOCKID) ;
end;

procedure TDMAccountStockDocument.CreateStockDataSet(ADataSet: TDataSet);
begin
  ADataSet.close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
  ADataSet.FieldDefs.Clear ;
  QStockItems.SQL.Text := 'Select * from stock where 1 = 0 ' ;
  QStockItems.open ;
  ADataSet.FieldDefs.Add('EXTID',ftString,60);
  // used to link accounts from defaults.
  ADataSet.FieldDefs.Add('EXTTAXLINK',ftString,60);

  ADataSet.FieldDefs.Add('SSTOCKCODE',ftString,QStockItems.FieldByName('SSTOCKCODE').Size);
  ADataSet.FieldDefs.Add('SBarCodeNumber',ftString,QStockItems.FieldByName('SBarCodeNumber').Size);
  ADataSet.FieldDefs.Add('SDescription',ftString,QStockItems.FieldByName('SDescription').Size);
  ADataSet.FieldDefs.Add('SExtraDesc',ftString,QStockItems.FieldByName('SExtraDesc').Size);
  ADataSet.FieldDefs.Add('BDisabled',ftSmallint);
  ADataSet.FieldDefs.Add('FQtyOnHand',ftFloat);
  ADataSet.FieldDefs.Add('WStockTypeId',ftInteger);
  ADataSet.FieldDefs.Add('FREORDERQTYTRIG',ftFloat);
  ADataSet.FieldDefs.Add('FReorderQty',ftFloat);
  ADataSet.FieldDefs.Add('BApplyInvoiceDiscount',ftSmallint);
  ADataSet.FieldDefs.Add('FSellingPrice1',ftFloat);
  ADataSet.FieldDefs.Add('FSellingPrice2',ftFloat);
  ADataSet.FieldDefs.Add('FSellingPrice3',ftFloat);
  ADataSet.FieldDefs.Add('FUnitAveCost',ftFloat);
  ADataSet.FieldDefs.Add('FUnitCost',ftFloat);
  ADataSet.FieldDefs.Add('SUnit',ftString,DMTCCoreLink.GetFieldLength('UNIT','SDESCRIPTION'));

  ADataSet.FieldDefs.Add('SGroup1',ftString,255);
  ADataSet.FieldDefs.Add('SGroup2',ftString,255);

  ADataSet.FieldDefs.Add('SCostAccount',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SSaleSACCOUNT',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SStockAccount',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SInputTax',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SOutputTax',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SSupplier1',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SSupplier2',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SMANUFACTURER',ftString,QStockItems.FieldByName('SMANUFACTURER').Size);

  ADataSet.FieldDefs.Add('SSTOCKCODESUP1',ftString,QStockItems.FieldByName('SSTOCKCODESUP1').Size);
  ADataSet.FieldDefs.Add('SSTOCKCODESUP2',ftString,QStockItems.FieldByName('SSTOCKCODESUP2').Size);

  ZQLangs.close ;
  ZQLangs.Open ;
  while not ZQLangs.eof do
    begin
      ADataSet.FieldDefs.Add('SLANGDESC' +  ZQLangsWGROUPID.AsString ,ftString,100);
      ADataSet.FieldDefs.Add('SLANGMEMO' +  ZQLangsWGROUPID.AsString ,ftMemo);
      ZQLangs.next ;
    end;
  finally
   ADataSet.FieldDefs.EndUpdate ;
  end;
end;

procedure TDMAccountStockDocument.AddEditContacts(
  AContactDataSet: TDataSet; SourceID: Integer);
begin

  QadressPerAccount.SQL.Text := 'Select * from AddressPerAccount where AddressPerAccount.WaccountId = :ID' ;

  if assigned(FTheOnImportDataset) then
     FTheOnImportDataset(AContactDataSet,2876{contacts});
  AContactDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(AContactDataSet.RecordCount,-1,2876{contacts});
 QContacts.SQL.Text := 'Select * from contacts where  RECORDID =:RECORDID' ;
 AContactDataSet.first ;
 while not AContactDataSet.Eof do
   begin
    if assigned(FTheImportProgressEvent) then
      FTheImportProgressEvent(AContactDataSet.RecordCount,AContactDataSet.RecNo,2876{contacts});

      if AContactDataSet.FieldByName('SFIRSTNAME').IsNull and AContactDataSet.FieldByName('SLASTNAME').IsNull then
        begin
            AContactDataSet.Next;
            Continue ;
        end;

        ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WCONTACTID is not null and IMP_EXTID =' + QuotedStr(AContactDataSet.FindField('EXTID').AsString) ;
        ZQImportLink.open ;
       if ZQImportLink.IsEmpty then
         begin
          QContacts.close ;
          QContacts.Params[0].AsInteger := -1 ;
          QContacts.open ;
          QContacts.Append ;
          QContacts.FieldByName('FIRSTNAME').AsString := 'temp' ;
          QContacts.post ;

          ZQImportLink.Insert ;
          ZQImportLinkIMP_LINKID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_LINKID') ;
          ZQImportLinkIMP_SOURCEID.AsInteger := SourceID ;
          ZQImportLinkIMP_EXTID.AsString :=  AContactDataSet.FindField('EXTID').AsString ;
          ZQImportLinkWCONTACTID.AsInteger := QContacts.FindField('RECORDID').AsInteger ;
          ZQImportLink.Post ;
          QContacts.Edit ;
         end else // else ZQImportLink.IsEmpty
         begin
            QContacts.close ;
            QContacts.Params[0].AsInteger := ZQImportLinkWCONTACTID.AsInteger ;
            QContacts.open ;
            QContacts.Edit ;
         end;
      if not AContactDataSet.FieldByName('SFIRSTNAME').IsNull then
      QContacts.FieldByName('FIRSTNAME').AsString := AContactDataSet.FieldByName('SFIRSTNAME').AsString;
      QContacts.FieldByName('LASTNAME').AsString := AContactDataSet.FieldByName('SLASTNAME').AsString;
      QContacts.FieldByName('BIRTHDATE').AsDateTime := AContactDataSet.FieldByName('DBIRTHDATE').AsDateTime;
      QContacts.FieldByName('ANNIVERSARY').AsDateTime := AContactDataSet.FieldByName('DANNIVERSARY').AsDateTime;
      QContacts.FieldByName('GENDER').AsString := AContactDataSet.FieldByName('SGENDER').AsString;
      QContacts.FieldByName('TITLE').AsString := AContactDataSet.FieldByName('STITLE').AsString;
      QContacts.FieldByName('COMPANY').AsString := AContactDataSet.FieldByName('SCOMPANY').AsString;
      QContacts.FieldByName('JOB_POSITION').AsString := AContactDataSet.FieldByName('SJOB_POSITION').AsString;
      QContacts.FieldByName('ADDRESS').AsString := AContactDataSet.FieldByName('SADDRESS').AsString;
      QContacts.FieldByName('CITY').AsString := AContactDataSet.FieldByName('SCITY').AsString;
      QContacts.FieldByName('STATE').AsString := AContactDataSet.FieldByName('SSTATE').AsString;
      QContacts.FieldByName('ZIP').AsString := AContactDataSet.FieldByName('SZIP').AsString;
      QContacts.FieldByName('COUNTRY').AsString := AContactDataSet.FieldByName('SCOUNTRY').AsString;
      QContacts.FieldByName('PHONE1').AsString := AContactDataSet.FieldByName('SPHONE1').AsString;
      QContacts.FieldByName('PHONE2').AsString := AContactDataSet.FieldByName('SPHONE2').AsString;
      QContacts.FieldByName('PHONE3').AsString := AContactDataSet.FieldByName('SPHONE3').AsString;
      QContacts.FieldByName('PHONE4').AsString := AContactDataSet.FieldByName('SPHONE4').AsString;
      QContacts.FieldByName('PHONE5').AsString := AContactDataSet.FieldByName('SPHONE5').AsString;
      QContacts.FieldByName('CATEGORY').AsString := AContactDataSet.FieldByName('SCATEGORY').AsString;
      QContacts.FieldByName('EMAIL').AsString := AContactDataSet.FieldByName('SEMAIL').AsString;
      QContacts.FieldByName('CUSTOM1').AsString := AContactDataSet.FieldByName('SCUSTOM1').AsString;
      QContacts.FieldByName('CUSTOM2').AsString := AContactDataSet.FieldByName('SCUSTOM2').AsString;
      QContacts.FieldByName('CUSTOM3').AsString := AContactDataSet.FieldByName('SCUSTOM3').AsString;
      QContacts.FieldByName('CUSTOM4').AsString := AContactDataSet.FieldByName('SCUSTOM4').AsString;
      QContacts.FieldByName('USERFIELD0').AsString := AContactDataSet.FieldByName('SUSERFIELD0').AsString;
      QContacts.FieldByName('USERFIELD1').AsString := AContactDataSet.FieldByName('SUSERFIELD1').AsString;
      QContacts.FieldByName('USERFIELD2').AsString := AContactDataSet.FieldByName('SUSERFIELD2').AsString;
      QContacts.FieldByName('USERFIELD3').AsString := AContactDataSet.FieldByName('SUSERFIELD3').AsString;
      QContacts.FieldByName('USERFIELD4').AsString := AContactDataSet.FieldByName('SUSERFIELD4').AsString;
      QContacts.FieldByName('USERFIELD5').AsString := AContactDataSet.FieldByName('SUSERFIELD5').AsString;
      QContacts.FieldByName('USERFIELD6').AsString := AContactDataSet.FieldByName('SUSERFIELD6').AsString;
      QContacts.FieldByName('USERFIELD7').AsString := AContactDataSet.FieldByName('SUSERFIELD7').AsString;
      QContacts.FieldByName('USERFIELD8').AsString := AContactDataSet.FieldByName('SUSERFIELD8').AsString;
      QContacts.FieldByName('USERFIELD9').AsString := AContactDataSet.FieldByName('SUSERFIELD9').AsString;
      QContacts.Post;
      // contact per account.
      if AContactDataSet.FieldByName('SDEBTORID').AsString <> '' then
         begin
            // find the Debtor ext id
           ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WACCOUNTID is not null and IMP_EXTID =' + QuotedStr(AContactDataSet.FindField('SDEBTORID').AsString) ;
           ZQImportLink.open ;
           if not ZQImportLink.IsEmpty then
             begin
                QadressPerAccount.close ;
                QadressPerAccount.Params[0].AsInteger:= ZQImportLinkWACCOUNTID.AsInteger ;
                QadressPerAccount.open ;
                if not QadressPerAccount.locate('WCONTACTID',QContacts.FindField('RECORDID').AsInteger,[]) then
                   begin
                     QadressPerAccount.Insert ;
                     QadressPerAccountWADDRESSPERACCOUNTID.AsInteger := DMTCCoreLink.GetNewId(tcidNEWADDRESSPERACCOUNT) ;
                     QadressPerAccountWACCOUNTID.AsInteger := ZQImportLinkWACCOUNTID.AsInteger ;
                     QadressPerAccountWCONTACTID.AsInteger :=  QContacts.FindField('RECORDID').AsInteger ;
                     QadressPerAccount.Post ;


                   end;
                 // make default for debtor if theres none.
                     TDebtor.SQL.Text :=  'Select * from debtor where waccountId =' + ZQImportLinkWACCOUNTID.AsString ;
                     TDebtor.Open ;
                     if not TDebtor.IsEmpty then
                      if TDebtor.fieldBYname('WCONTACTID').AsInteger = 0 then
                       begin
                         TDebtor.Edit ;
                         TDebtor.fieldBYname('WCONTACTID').AsInteger := QContacts.FindField('RECORDID').AsInteger ;
                         TDebtor.post ;
                       end;
                     TCreditor.SQL.Text :=  'Select * from creditor where waccountId =' + ZQImportLinkWACCOUNTID.AsString ;
                     TCreditor.Open ;
                     if not TCreditor.IsEmpty then
                      if TCreditor.fieldBYname('WCONTACTID').AsInteger = 0 then
                       begin
                         TCreditor.Edit ;
                         TCreditor.fieldBYname('WCONTACTID').AsInteger := QContacts.FindField('RECORDID').AsInteger ;
                         TCreditor.post ;
                       end;
             end;
         end ;
      AContactDataSet.Next;
    end;
end;

procedure TDMAccountStockDocument.QContactsAfterInsert(DataSet: TDataSet);
begin
 QContacts.FieldByName('RECORDID').AsInteger :=  DMTCCoreLink.GetNewId(tcidNEWCONTACTID);
 QContacts.FieldByName('RESOURCEID').AsInteger := 1 ;

end;

procedure TDMAccountStockDocument.CreateContactsDataSet(
  ADataSet: TDataSet);
begin
 ADataSet.Close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
  ADataSet.FieldDefs.Clear ;
  QContacts.SQL.Text := 'Select * from contacts where 1 = 0 ' ;
  QContacts.open ;
  ADataSet.FieldDefs.Add('EXTID',ftString,60);
  ADataSet.FieldDefs.Add('SDEBTORID',ftString,60);   

  ADataSet.FieldDefs.Add('SFIRSTNAME',ftString,QContacts.FieldByName('FIRSTNAME').Size);
  ADataSet.FieldDefs.Add('SLASTNAME',ftString,QContacts.FieldByName('LASTNAME').Size);
  ADataSet.FieldDefs.Add('DBIRTHDATE',ftDateTime);
  ADataSet.FieldDefs.Add('DANNIVERSARY',ftDateTime);
  ADataSet.FieldDefs.Add('SGENDER',ftString,QContacts.FieldByName('GENDER').Size);
  ADataSet.FieldDefs.Add('STITLE',ftString,QContacts.FieldByName('TITLE').Size);
  ADataSet.FieldDefs.Add('SCOMPANY',ftString,QContacts.FieldByName('COMPANY').Size);

  ADataSet.FieldDefs.Add('SJOB_POSITION',ftString,QContacts.FieldByName('JOB_POSITION').Size);
  ADataSet.FieldDefs.Add('SADDRESS',ftString,QContacts.FieldByName('ADDRESS').Size);
  ADataSet.FieldDefs.Add('SCITY',ftString,QContacts.FieldByName('CITY').Size);
  ADataSet.FieldDefs.Add('SSTATE',ftString,QContacts.FieldByName('STATE').Size);
  ADataSet.FieldDefs.Add('SZIP',ftString,QContacts.FieldByName('ZIP').Size);
  ADataSet.FieldDefs.Add('SCOUNTRY',ftString,QContacts.FieldByName('COUNTRY').Size);
  ADataSet.FieldDefs.Add('SPHONE1',ftString,QContacts.FieldByName('PHONE1').Size);
  ADataSet.FieldDefs.Add('SPHONE2',ftString,QContacts.FieldByName('PHONE2').Size);
  ADataSet.FieldDefs.Add('SPHONE3',ftString,QContacts.FieldByName('PHONE3').Size);
  ADataSet.FieldDefs.Add('SPHONE4',ftString,QContacts.FieldByName('PHONE4').Size);
  ADataSet.FieldDefs.Add('SPHONE5',ftString,QContacts.FieldByName('PHONE5').Size);
  ADataSet.FieldDefs.Add('SCATEGORY',ftString,QContacts.FieldByName('CATEGORY').Size);
  ADataSet.FieldDefs.Add('SEMAIL',ftString,QContacts.FieldByName('EMAIL').Size);
  ADataSet.FieldDefs.Add('SCUSTOM1',ftString,QContacts.FieldByName('CUSTOM1').Size);
  ADataSet.FieldDefs.Add('SCUSTOM2',ftString,QContacts.FieldByName('CUSTOM2').Size);
  ADataSet.FieldDefs.Add('SCUSTOM3',ftString,QContacts.FieldByName('CUSTOM3').Size);
  ADataSet.FieldDefs.Add('SCUSTOM4',ftString,QContacts.FieldByName('CUSTOM4').Size);

  ADataSet.FieldDefs.Add('SUSERFIELD0',ftString,QContacts.FieldByName('USERFIELD0').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD1',ftString,QContacts.FieldByName('USERFIELD1').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD2',ftString,QContacts.FieldByName('USERFIELD2').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD3',ftString,QContacts.FieldByName('USERFIELD3').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD4',ftString,QContacts.FieldByName('USERFIELD4').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD5',ftString,QContacts.FieldByName('USERFIELD5').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD6',ftString,QContacts.FieldByName('USERFIELD6').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD7',ftString,QContacts.FieldByName('USERFIELD7').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD8',ftString,QContacts.FieldByName('USERFIELD8').Size);
  ADataSet.FieldDefs.Add('SUSERFIELD9',ftString,QContacts.FieldByName('USERFIELD9').Size);
  finally
   ADataSet.FieldDefs.EndUpdate ;
  end;
end;

procedure TDMAccountStockDocument.GetContacts(ADataSet: TDataSet;ASql : String = '');
begin
QadressPerAccount.SQL.Text := 'Select * from AddressPerAccount where AddressPerAccount.WCONTACTID = :ID' ;
ADataSet.Close ;
CreateContactsDataSet(ADataSet);
ADataSet.open ;
if ASql = '' then QContacts.SQL.Text := 'select * from contacts' else
QContacts.SQL.Text := ASql ;
QContacts.Open ;
while not QContacts.Eof do
  begin
    ADataSet.Insert ;
    ADataSet.FieldByName('EXTID').AsString := IntToStr(QContacts.FindField('RECORDID').AsInteger);
    ADataSet.FieldByName('SFIRSTNAME').AsString  := QContacts.FieldByName('FIRSTNAME').AsString;
    ADataSet.FieldByName('SLASTNAME').AsString        :=      QContacts.FieldByName('LASTNAME').AsString ;
    ADataSet.FieldByName('DBIRTHDATE').AsDateTime     :=      QContacts.FieldByName('BIRTHDATE').AsDateTime ;
    ADataSet.FieldByName('DANNIVERSARY').AsDateTime   :=      QContacts.FieldByName('ANNIVERSARY').AsDateTime ;
    ADataSet.FieldByName('SGENDER').AsString          :=      QContacts.FieldByName('GENDER').AsString ;
    ADataSet.FieldByName('STITLE').AsString           :=      QContacts.FieldByName('TITLE').AsString ;
    ADataSet.FieldByName('SCOMPANY').AsString         :=      QContacts.FieldByName('COMPANY').AsString ;
    ADataSet.FieldByName('SJOB_POSITION').AsString    :=      QContacts.FieldByName('JOB_POSITION').AsString ;
    ADataSet.FieldByName('SADDRESS').AsString         :=      QContacts.FieldByName('ADDRESS').AsString ;
    ADataSet.FieldByName('SCITY').AsString            :=      QContacts.FieldByName('CITY').AsString ;
    ADataSet.FieldByName('SSTATE').AsString           :=      QContacts.FieldByName('STATE').AsString ;
    ADataSet.FieldByName('SZIP').AsString             :=      QContacts.FieldByName('ZIP').AsString ;
    ADataSet.FieldByName('SCOUNTRY').AsString         :=      QContacts.FieldByName('COUNTRY').AsString ;
    ADataSet.FieldByName('SPHONE1').AsString         :=      QContacts.FieldByName('PHONE1').AsString;
    ADataSet.FieldByName('SPHONE2').AsString         :=      QContacts.FieldByName('PHONE2').AsString;
    ADataSet.FieldByName('SPHONE3').AsString         :=      QContacts.FieldByName('PHONE3').AsString;
    ADataSet.FieldByName('SPHONE4').AsString         :=      QContacts.FieldByName('PHONE4').AsString;
    ADataSet.FieldByName('SPHONE5').AsString         :=      QContacts.FieldByName('PHONE5').AsString;
    ADataSet.FieldByName('SCATEGORY').AsString       :=      QContacts.FieldByName('CATEGORY').AsString;
    ADataSet.FieldByName('SEMAIL').AsString          :=      QContacts.FieldByName('EMAIL').AsString;
    ADataSet.FieldByName('SCUSTOM1').AsString        :=      QContacts.FieldByName('CUSTOM1').AsString;
    ADataSet.FieldByName('SCUSTOM2').AsString        :=      QContacts.FieldByName('CUSTOM2').AsString;
    ADataSet.FieldByName('SCUSTOM3').AsString        :=      QContacts.FieldByName('CUSTOM3').AsString;
    ADataSet.FieldByName('SCUSTOM4').AsString        :=      QContacts.FieldByName('CUSTOM4').AsString;
    ADataSet.FieldByName('SUSERFIELD0').AsString     :=      QContacts.FieldByName('USERFIELD0').AsString;
    ADataSet.FieldByName('SUSERFIELD1').AsString     :=      QContacts.FieldByName('USERFIELD1').AsString;
    ADataSet.FieldByName('SUSERFIELD2').AsString     :=      QContacts.FieldByName('USERFIELD2').AsString;
    ADataSet.FieldByName('SUSERFIELD3').AsString     :=      QContacts.FieldByName('USERFIELD3').AsString;
    ADataSet.FieldByName('SUSERFIELD4').AsString     :=      QContacts.FieldByName('USERFIELD4').AsString;
    ADataSet.FieldByName('SUSERFIELD5').AsString     :=      QContacts.FieldByName('USERFIELD5').AsString;
    ADataSet.FieldByName('SUSERFIELD6').AsString     :=      QContacts.FieldByName('USERFIELD6').AsString;
    ADataSet.FieldByName('SUSERFIELD7').AsString     :=      QContacts.FieldByName('USERFIELD7').AsString;
    ADataSet.FieldByName('SUSERFIELD8').AsString     :=      QContacts.FieldByName('USERFIELD8').AsString;
    ADataSet.FieldByName('SUSERFIELD9').AsString     :=      QContacts.FieldByName('USERFIELD9').AsString;
    // contact per account. Actualy a one to manny but for simplicity just one
    QadressPerAccount.close ;
    QadressPerAccount.Params[0].AsInteger:= QContacts.FindField('RECORDID').AsInteger ;
    QadressPerAccount.open ;
    if not QadressPerAccount.IsEmpty then
         begin
            ADataSet.FieldByName('SDEBTORID').AsString := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(QadressPerAccountWACCOUNTID.AsInteger)  ;
         end;
    ADataSet.post ;
    QContacts.next ;
  end;


end;

procedure TDMAccountStockDocument.GetCustomers(ADataSet: TDataSet;
  AAccountIdInSql : String);
  var
   i :  integer ;
begin
ADataSet.Close ;
CreateCustomersDataset(ADataSet);
ADataSet.open ;
if AAccountIdInSql = '' then TAccounts.SQL.Text := 'select * from account where WAccountTypeID = 1' else
TAccounts.SQL.Text := 'select * from account where WAccountTypeID = 1 and WAccountID in ('+AAccountIdInSql +')' ;
TAccounts.Open ;
TDebtor.SQL.Text := 'Select * from debtor where WACCOUNTID = :WAccountID' ;

while not TAccounts.Eof do
  begin
    TDebtor.Close ;
    TDebtor.Params[0].AsInteger := TAccounts.fieldbyname('WACCOUNTID').AsInteger ;
    TDebtor.open ;
    ADataSet.Insert ;
    ADataSet.FieldByName('SACCOUNTCODE').AsString := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TAccounts.fieldbyname('WACCOUNTID').AsInteger) ;
    ADataSet.FieldByName('EXTID').AsString := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TAccounts.fieldbyname('WACCOUNTID').AsInteger) ;
    ADataSet.FieldByName('SDESCRIPTION').AsString := TAccounts.FieldByName('SDESCRIPTION').AsString ;
    ADataSet.FieldByName('BINACTIVE').AsInteger := TAccounts.FieldByName('BINACTIVE').AsInteger ;
    ADataSet.FieldByName('SPostal1').AsString := TDebtor.FieldByName('SPostal1').AsString ;
    ADataSet.FieldByName('SPostal2').AsString := TDebtor.FieldByName('SPostal2').AsString ;
    ADataSet.FieldByName('SPostal3').AsString := TDebtor.FieldByName('SPostal3').AsString ;
    ADataSet.FieldByName('SPostalCode').AsString := TDebtor.FieldByName('SPostalCode').AsString ;
    ADataSet.FieldByName('sDelivery1').AsString := TDebtor.FieldByName('sDelivery1').AsString ;
    ADataSet.FieldByName('sDelivery2').AsString := TDebtor.FieldByName('sDelivery2').AsString ;
    ADataSet.FieldByName('sDelivery3').AsString := TDebtor.FieldByName('sDelivery3').AsString ;
    ADataSet.FieldByName('sDeliveryCode').AsString := TDebtor.FieldByName('sDeliveryCode').AsString ;
    ADataSet.FieldByName('STelephone1').AsString := TDebtor.FieldByName('STelephone1').AsString ;
    ADataSet.FieldByName('STelephone2').AsString := TDebtor.FieldByName('STelephone2').AsString ;
    ADataSet.FieldByName('SEMail').AsString := TDebtor.FieldByName('SEMail').AsString ;
    ADataSet.FieldByName('SFax').AsString := TDebtor.FieldByName('SFax').AsString ;
    ADataSet.FieldByName('FCREDITLimit').AsString := TDebtor.FieldByName('FCREDITLimit').AsString ;
    ADataSet.FieldByName('FChargeAmount').AsString := TDebtor.FieldByName('FChargeAmount').AsString ;
    ADataSet.FieldByName('FDiscount').AsString := TDebtor.FieldByName('FDiscount').AsString ;
    ADataSet.FieldByName('FInterest').AsString := TDebtor.FieldByName('FInterest').AsString ;
    ADataSet.FieldByName('SMessage').AsString := TDebtor.FieldByName('SMessage').AsString ;
    ADataSet.FieldByName('WDefaultPriceTypeID').AsInteger := TDebtor.FieldByName('WDefaultPriceTypeID').AsInteger ;
    ADataSet.FieldByName('DLastActivity').AsDateTime := TDebtor.FieldByName('DLastActivity').AsDateTime ;
    ADataSet.FieldByName('Sreference').AsString := TDebtor.FieldByName('Sreference').AsString ;
    ADataSet.FieldByName('WDUEDAYS').AsInteger := TDebtor.FieldByName('WDUEDAYS').AsInteger ;
    ADataSet.FieldByName('SCOMPANYREGNO').AsString := TDebtor.FieldByName('SCOMPANYREGNO').AsString ;
    ADataSet.FieldByName('SFREEFIELD1').AsString := TDebtor.FieldByName('SFREEFIELD1').AsString ;
    ADataSet.FieldByName('SFREEFIELD2').AsString := TDebtor.FieldByName('SFREEFIELD2').AsString ;
    ADataSet.FieldByName('SFREEFIELD3').AsString := TDebtor.FieldByName('SFREEFIELD3').AsString ;
    ADataSet.FieldByName('SBANKNAME').AsString := TDebtor.FieldByName('SBANKNAME').AsString ;
    ADataSet.FieldByName('SBRANCHCODE').AsString := TDebtor.FindField('SBRANCHCODE').AsString ;
    ADataSet.FieldByName('SBANKACCOUNTNUMBER').AsString := TDebtor.FindField('SBANKACCOUNTNUMBER').AsString ;
    ADataSet.FieldByName('SBANKACCOUNTNAME').AsString := TDebtor.FindField('SBANKACCOUNTNAME').AsString ;
    ADataSet.FieldByName('SCREDITCARDNUMBER').AsString := TDebtor.FindField('SCREDITCARDNUMBER').AsString ;
    ADataSet.FieldByName('SCREDITCARDTYPE').AsString := TDebtor.FindField('SCREDITCARDTYPE').AsString ;
    ADataSet.FieldByName('SCREDITCARDHOLDER').AsString := TDebtor.FindField('SCREDITCARDHOLDER').AsString ;
    ADataSet.FieldByName('SDEFAULTACCOUNT').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TDebtor.FindField('WDEFAULTACCOUNT').AsInteger) ;
    ADataSet.FieldByName('SDEFAULTTAX').AsString := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TDebtor.FindField('WDEFAULTTAX').AsInteger) ;
    ADataSet.FieldByName('SPostCountry').AsString := TDataBaseRoutines.GetCountryName(TDebtor.FieldByName('WPOSTCOUNTRIES_ID').AsInteger) ;
    ADataSet.FieldByName('SDelCountry').AsString := TDataBaseRoutines.GetCountryName(TDebtor.FieldByName('WDELCOUNTRIES_ID').AsInteger) ;
    i := 0 ;
    ADataSet.FieldByName('SSalesperson').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(TDebtor.FieldByName('WSalesmanID').AsInteger,i) ;
    i := 0 ;
    ADataSet.FieldByName('SREPORTINGGROUP1').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(TAccounts.FieldByName('WREPORTINGGROUP1ID').AsInteger,i) ;
    i := 0 ;
    ADataSet.FieldByName('SREPORTINGGROUP2').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(TAccounts.FieldByName('WREPORTINGGROUP2ID').AsInteger,i) ;
    ADataSet.post ;
    TAccounts.next ;
    TDebtor.Close ;
  end;

end;

procedure TDMAccountStockDocument.AddEditDocuments(ADocumentDataSet,
  ADetailDataset: TDataSet; SourceID: Integer);
  var
    i,AProjId : Integer ;

begin
  ADocumentDataSet.First ;
  if assigned(FTheOnImportDataset) then
     FTheOnImportDataset(ADocumentDataSet,38{documents});
  ADocumentDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(ADocumentDataSet.RecordCount,-1,38{documents});
 TCQDOCHEAD.SQL.Text := 'Select * from dochead where WDocId = :WDOCID' ;
 TCQDOCLINE.SQL.Text := 'Select * from docline where WDocId = :WDOCID' ;

  while not ADocumentDataSet.Eof do
    begin
       // Is this a existing order?
      if assigned(FTheImportProgressEvent) then
          FTheImportProgressEvent(ADocumentDataSet.RecordCount,ADocumentDataSet.RecNo,2876{contacts});

        ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WDOCID  is not null and IMP_EXTID =' + QuotedStr(ADocumentDataSet.FindField('EXTID').AsString) ;
        ZQImportLink.open ;
       if ZQImportLink.IsEmpty then
         begin
          TCQDOCHEAD.close ;
          TCQDOCHEAD.Params[0].AsInteger := -1 ;
          TCQDOCHEAD.open ;
          TCQDOCHEAD.Append ;
          TCQDOCHEAD.FieldByName('WACCOUNTID').AsInteger := 0 ;
          TCQDOCHEAD.FieldByName('WTYPEID').AsInteger := 0 ;
          TCQDOCHEAD.FieldByName('BPOSTED').AsInteger:= 0 ;
          TCQDOCHEAD.Params[0].AsInteger :=  TCQDOCHEAD.FindField('WDOCID').AsInteger ;
          TCQDOCHEAD.post ;
          ZQImportLink.Insert ;
          ZQImportLinkIMP_LINKID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_LINKID') ;
          ZQImportLinkIMP_SOURCEID.AsInteger := SourceID ;
          ZQImportLinkIMP_EXTID.AsString :=  ADocumentDataSet.FindField('EXTID').AsString ;
          ZQImportLinkWDOCID.AsInteger := TCQDOCHEAD.FindField('WDOCID').AsInteger ;
          ZQImportLink.Post ;
          TCQDOCHEAD.Edit ;
         end else // else ZQImportLink.IsEmpty
         begin
            ADocumentDataSet.next ;
            Continue ;

            TCQDOCHEAD.close ;
            TCQDOCHEAD.Params[0].AsInteger := ZQImportLinkWDOCID.AsInteger ;
            TCQDOCHEAD.open ;
            TCQDOCHEAD.Edit ;
         end;

       // dont do anny docs that have been posted.
       if TCQDOCHEAD.FieldByName('BPOSTED').AsInteger = 1 then
          begin
           TCQDOCHEAD.Cancel ;
           ADocumentDataSet.next ;
           Continue ;
          end;

       // Dochead
       // get account code lookup form external id.
       ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WACCOUNTID is not null and IMP_EXTID =' + QuotedStr(ADocumentDataSet.FieldByName('SACCOUNT').AsString) ;
       ZQImportLink.open ;

       if not ZQImportLink.IsEmpty then
         begin
            TCQDOCHEAD.FieldByName('WACCOUNTID').AsInteger :=  ZQImportLink.FieldByName('WACCOUNTID').AsInteger ;
         end else
         begin
            ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WACCOUNTID is not null and IMP_EXTID =' + QuotedStr('CRED:'+ADocumentDataSet.FieldByName('SACCOUNT').AsString) ;
            ZQImportLink.open ;
             if not ZQImportLink.IsEmpty then
               begin
                  TCQDOCHEAD.FieldByName('WACCOUNTID').AsInteger :=  ZQImportLink.FieldByName('WACCOUNTID').AsInteger ;
               end else
              // now its error rasing but maby we need logging.
              raise Exception.Create('Error account ' + ADocumentDataSet.FieldByName('SACCOUNT').AsString +' Not found for document ' + ADocumentDataSet.FindField('EXTID').AsString);
         end;

        TCQDOCHEAD.FieldByName('WTYPEID').AsInteger := ADocumentDataSet.FieldByName('WDOCTYPEID').AsInteger ;
        TCQDOCHEAD.FieldByName('DDATE').AsDateTime := ADocumentDataSet.FieldByName('DDATE').AsDateTime   ;
        TCQDOCHEAD.FieldByName('DDUEDATE').AsDateTime := ADocumentDataSet.FieldByName('DDUEDATE').AsDateTime  ;
        if TCQDOCHEAD.FieldByName('SDOCNO').AsString = '' then
        TCQDOCHEAD.FieldByName('SDOCNO').AsString :=  TDataBaseDocumentRoutines.GetUniqueDocNo(FormatFloat('000',SourceID),ADocumentDataSet.FieldByName('SDOCNO').AsString ) ;
        if ADocumentDataSet.FieldByName('SPROJECT').AsString  <> '' then
           begin
           AProjId := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WJOBPROJECTID from Jobproject where SJOBPROJECTCODE=' + QuotedStr(UpperCase(ADocumentDataSet.FieldByName('SPROJECT').AsString)))),0);

           if AProjId = 0 then
              DMTCCoreLink.ExecSql('insert into Jobproject (WJOBPROJECTID, SJOBPROJECTCODE,BENABLED) values ('+DMTCCoreLink.GetGenUniSyntaxShort('GEN_JOBPROJECTID')+',' + QuotedStr(UpperCase(ADocumentDataSet.FieldByName('SPROJECT').AsString)) +',1)') ;
            // not closed projects
            AProjId := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WJOBPROJECTID from Jobproject where BENABLED = 1 and SJOBPROJECTCODE=' + QuotedStr(UpperCase(ADocumentDataSet.FieldByName('SPROJECT').AsString)))),0);

            if AProjId <> 0 then
               TCQDOCHEAD.FieldByName('WJOBCODEID').AsInteger  := AProjId ;
           end ;



        TCQDOCHEAD.FieldByName('WPOSTALNAME').AsInteger :=  DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SCOMPANYNAME').AsString);
        TCQDOCHEAD.FieldByName('WPOSTALCONTACT').AsInteger :=  DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SCONTACT').AsString);


        TCQDOCHEAD.FieldByName('WPostal1ID').AsInteger :=  DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SPOSTAL1').AsString);
        TCQDOCHEAD.FieldByName('WPostal2ID').AsInteger :=  DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SPOSTAL2').AsString);
        TCQDOCHEAD.FieldByName('WPostal3ID').AsInteger :=  DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SPOSTAL3').AsString);
        TCQDOCHEAD.FieldByName('WPostalCodeID').AsInteger :=  DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SPOSTALCODE').AsString);

        TCQDOCHEAD.FieldByName('WPOSCOUNTRIES_ID').AsInteger := TDataBaseRoutines.GetAddCountryId(ADocumentDataSet.FieldByName('SPOSTALCOUNTRY').AsString );

        TCQDOCHEAD.FieldByName('WMESSAGE1ID').AsInteger     := DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SMESSAGE1').AsString );
        TCQDOCHEAD.FieldByName('WMESSAGE2ID').AsInteger     := DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SMESSAGE2').AsString );
        TCQDOCHEAD.FieldByName('WMESSAGE3ID').AsInteger     := DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SMESSAGE3').AsString );

        TCQDOCHEAD.FieldByName('WSALESMANID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ADocumentDataSet.FieldByName('SSALESMAN').Asstring,31 );

        TCQDOCHEAD.FieldByName('WTAXNUMBER').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ADocumentDataSet.FieldByName('STAXNR').Asstring,31 );
        TCQDOCHEAD.FieldByName('SEXTERNALID').AsString :=  ADocumentDataSet.FieldByName('SEXTERNALID').AsString ;
        TCQDOCHEAD.FieldByName('SREFERENCE').AsString :=  ADocumentDataSet.FieldByName('SREFERENCE').AsString ;


        TCQDOCHEAD.FieldByName('WCONTRAACCOUNT').AsInteger := 0 ;
        if ADocumentDataSet.FieldByName('SCONTRAACCOUNT').AsString <> '' then
        TCQDOCHEAD.FieldByName('WCONTRAACCOUNT').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ADocumentDataSet.FieldByName('SCONTRAACCOUNT').AsString);
        TCQDOCHEAD.FieldByName('WDELNAME').AsInteger := DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SDELCOMPANYNAME').AsString) ;
        TCQDOCHEAD.FieldByName('WDELCONTACT').AsInteger := DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SDELCONTACT').AsString) ;          
        TCQDOCHEAD.FieldByName('WDELADDRESS1ID').AsInteger := DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SDELADRESS1').AsString) ;
        TCQDOCHEAD.FieldByName('WDELADDRESS2ID').AsInteger:= DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SDELADRESS2').AsString) ;
        TCQDOCHEAD.FieldByName('WDELADDRESS3ID').AsInteger:= DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SDELADRESS3').AsString) ;
        TCQDOCHEAD.FieldByName('WDELCODEID').AsInteger:= DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SDELADRESSCODE').AsString) ;
        TCQDOCHEAD.FieldByName('WDELCOUNTRIES_ID').AsInteger:= DMTCCoreLink.GetAddDescription(ADocumentDataSet.FieldByName('SDELADRESSCOUNTRY').AsString) ;
        TCQDOCHEAD.FieldByName('BPRINTED').AsInteger :=  ADocumentDataSet.FieldByName('BPRINTED').AsInteger ;
        TCQDOCHEAD.FieldByName('BEXCLUSIVE').AsInteger := ADocumentDataSet.FieldByName('BEXCLUSIVE').AsInteger ;
        TCQDOCHEAD.FieldByName('BREPEATING').AsInteger :=  ADocumentDataSet.FieldByName('BREPEATING').AsInteger ;
        TCQDOCHEAD.FieldByName('FINVOICEDISCOUNT').AsFloat := ADocumentDataSet.FieldByName('FINVOICEDISCOUNT').AsFloat ;
        TCQDOCHEAD.FieldByName('FDOCAMOUNT').AsFloat :=  ADocumentDataSet.FieldByName('FDOCAMOUNT').AsFloat ;
        TCQDOCHEAD.FieldByName('FTAXAMOUNT').AsFloat := ADocumentDataSet.FieldByName('FTAXAMOUNT').AsFloat ;
        TCQDOCHEAD.FieldByName('WREPORTINGGROUP1ID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ADocumentDataSet.FieldByName('SREPORTINGGROUP1').Asstring,28) ;
        TCQDOCHEAD.FieldByName('WREPORTINGGROUP2ID').AsInteger :=TDataBaseRoutines.GetAddGroupNesteled(ADocumentDataSet.FieldByName('SREPORTINGGROUP2').Asstring,29) ;
        TCQDOCHEAD.post ;
       // docline
       TCQDOCLINE.close ;
       TCQDOCLINE.Params[0].AsInteger := TCQDOCHEAD.FindField('WDOCID').AsInteger ;
       TCQDOCLINE.open ;

       // delete old lines and import new
       while not TCQDOCLINE.IsEmpty do
          begin
             TCQDOCLINE.delete ;
          end;
       i := 0 ;
       ADetailDataset.First ;
       aDetailDataset.Filtered := False ;
       ADetailDataset.Filter := 'EXTID=' + ADocumentDataSet.FieldByName('EXTID').AsString ;
       aDetailDataset.Filtered := true ;
       While not ADetailDataset.eof do
          begin
             if ADetailDataset.FieldByName('EXTID').AsString = ADocumentDataSet.FieldByName('EXTID').AsString then
                 begin
                   inc(I);
                   TCQDOCLINE.Insert ;
                   TCQDOCLINE.FieldByName('WDOCLINEID').AsInteger := i ;
                   TCQDOCLINE.FieldByName('WDOCID').AsInteger :=  TCQDOCHEAD.FindField('WDOCID').AsInteger ;
                   TCQDOCLINE.FieldByName('WLINETYPEID').AsInteger    := ADetailDataset.FieldByName('WLINETYPEID').AsInteger ;
                   TCQDOCLINE.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(ADetailDataset.FieldByName('SDESCRIPTION').AsString) ;
                   // no remarks
                   if  ADetailDataset.FieldByName('WLINETYPEID').AsInteger <> 91 then
                    begin
                      ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WSTOCKID is not null and IMP_EXTID =' + QuotedStr(ADetailDataset.FieldByName('STOCKID').AsString) ;
                      ZQImportLink.open ;
                      if not ZQImportLink.IsEmpty then
                        begin
                           TCQDOCLINE.FieldByName('WSTOCKID').AsInteger :=  ZQImportLink.FieldByName('WSTOCKID').AsInteger ;
                        end else
                        begin
                        // See if its a secial link.
                        TCQDOCLINE.FieldByName('WSTOCKID').AsInteger := GetVariableStockAccount(ADetailDataset.FieldByName('STOCKID').AsString,SourceID);
                        if TCQDOCLINE.FieldByName('WSTOCKID').AsInteger = 0 then
                          // now its error rasing but maby we need logging.
                          raise Exception.Create('Error stock ' + ADetailDataset.FieldByName('STOCKID').AsString +' Not found for document ' + ADocumentDataSet.FindField('EXTID').AsString);
                        end;
                      if ADetailDataset.FieldByName('SDESCRIPTION').AsString = '' then
                         TCQDOCLINE.FieldByName('WDESCRIPTIONID').AsInteger := DMTCCoreLink.GetAddDescription(TDataBaseStockRoutines.GetStockDescription(TCQDOCLINE.FieldByName('WSTOCKID').AsInteger)) ;


                      TCQDOCLINE.FieldByName('FQtyOrdered').AsFloat :=  ADetailDataset.FieldByName('FQtyOrdered').AsFloat     ;
                      TCQDOCLINE.FieldByName('FQtyShipped').AsFloat :=  ADetailDataset.FieldByName('FQtyShipped').AsFloat     ;
                      TCQDOCLINE.FieldByName('FSellingPrice').AsFloat :=  ADetailDataset.FieldByName('FSellingPrice').AsFloat   ;
                      TCQDOCLINE.FieldByName('FItemDiscount').AsFloat :=  ADetailDataset.FieldByName('FItemDiscount').AsFloat   ;
                      TCQDOCLINE.FieldByName('FExclusiveAmt').AsFloat :=  ADetailDataset.FieldByName('FExclusiveAmt').AsFloat   ;
                      TCQDOCLINE.FieldByName('FInclusiveAmt').AsFloat :=  ADetailDataset.FieldByName('FInclusiveAmt').AsFloat   ;

                      TCQDOCLINE.FieldByName('WREPORTINGGROUP1ID').AsFloat := TDataBaseRoutines.GetAddGroupNesteled(ADocumentDataSet.FieldByName('SREPORTINGGROUP1').Asstring,1002) ;

                      TCQDOCLINE.FieldByName('WREPORTINGGROUP2ID').AsFloat := TDataBaseRoutines.GetAddGroupNesteled(ADocumentDataSet.FieldByName('SREPORTINGGROUP1').Asstring,1003) ;




                      TCQDOCLINE.FieldByName('FTaxAmount').AsFloat :=  ADetailDataset.FieldByName('FTaxAmount').AsFloat      ;
                      TCQDOCLINE.FieldByName('WTAXID').AsInteger := TDataBaseRoutines.GetAccountIDFromCode(ADetailDataset.FieldByName('STaxAccount').AsString ) ;
                      if ADetailDataset.FieldByName('EXTTAXLINK').AsString <> '' then
                        begin
                        ZQIMP_STOCKACCOUNTS.close ;
                        ZQIMP_STOCKACCOUNTS.ParamByName('IMP_SOURCEID').AsInteger := SourceID ;
                        ZQIMP_STOCKACCOUNTS.ParamByName('IMP_EXTID').AsString := ADetailDataset.FieldByName('EXTTAXLINK').AsString ;
                        ZQIMP_STOCKACCOUNTS.open ;
                        if not ZQIMP_STOCKACCOUNTS.IsEmpty then
                         begin
                            case TCQDOCHEAD.FieldByName('WTYPEID').AsInteger of
                            12,13,15 : TCQDOCLINE.FieldByName('WTAXID').AsInteger := ZQIMP_STOCKACCOUNTSWOUTPUTTAXACCOUNTID.AsInteger;
                            else
                            TCQDOCLINE.FieldByName('WTAXID').AsInteger := ZQIMP_STOCKACCOUNTSWOUTPUTTAXACCOUNTID.AsInteger;
                            end;
                         end;
                        end; // alt tax link
                      TCQDOCLINE.FieldByName('SUNIT').Asstring := ADetailDataset.FieldByName('SUnit').AsString         ;
                     end;
                   TCQDOCLINE.Post ;
                 end;
            ADetailDataset.next ;
          end;
       ADocumentDataSet.next ;
    end;
end;

procedure TDMAccountStockDocument.CreateDocumentsDataSet(ADataSet,
  ADetailDataset: TDataSet);
begin
  ADataSet.Close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
      ADetailDataset.Close ;
      ADetailDataset.FieldDefs.BeginUpdate ;
      try
      ADetailDataset.FieldDefs.Clear ;
      ADataSet.FieldDefs.Clear ;
      TCQDOCHEAD.SQL.Text := 'Select * from Dochead where 1 = 0 ' ;
      TCQDOCHEAD.open ;
   //   TCQDOCLINE.SQL.Text := 'Select * from Docline where 1 = 0 ' ;
   //   TCQDOCLINE.open ;
      ADataSet.FieldDefs.Add('EXTID',ftString,60);
      ADataSet.FieldDefs.Add('SACCOUNT',ftString,60);
      ADataSet.FieldDefs.Add('WDOCTYPEID',ftinteger);
      ADataSet.FieldDefs.Add('DDATE',ftDateTime);
      ADataSet.FieldDefs.Add('DDUEDATE',ftDateTime);
      ADataSet.FieldDefs.Add('SDOCNO',ftString,TCQDOCHEAD.FieldByName('SDOCNO').Size);
      ADataSet.FieldDefs.Add('SCOMPANYNAME',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SCONTACT',ftString,DMTCCoreLink.MessageLength);

      ADataSet.FieldDefs.Add('SPOSTAL1',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SPOSTAL2',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SPOSTAL3',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SPOSTALCODE',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SPOSTALCOUNTRY',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SMESSAGE1',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SMESSAGE2',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SMESSAGE3',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SSALESMAN',ftString,255);
      ADataSet.FieldDefs.Add('SREFERENCE',ftString,TCQDOCHEAD.FieldByName('SREFERENCE').Size);

      ADataSet.FieldDefs.Add('SDELCOMPANYNAME',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SDELCONTACT',ftString,DMTCCoreLink.MessageLength);

      ADataSet.FieldDefs.Add('SDELADRESS1',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SDELADRESS2',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SDELADRESS3',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SDELADRESSCODE',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SDELADRESSCOUNTRY',ftString,DMTCCoreLink.MessageLength);

      ADataSet.FieldDefs.Add('STAXNR',ftString,DMTCCoreLink.MessageLength);
      ADataSet.FieldDefs.Add('SEXTERNALID',ftString,DMTCCoreLink.GetFieldLength('DOCHEAD','SEXTERNALID'));
      ADataSet.FieldDefs.Add('SCONTRAACCOUNT',ftString,DMTCCoreLink.MainAccountLength+4);
      ADataSet.FieldDefs.Add('SPROJECT',ftString,DMTCCoreLink.GetFieldLength('JOBPROJECT','SJOBPROJECTCODE'));





      ADataSet.FieldDefs.Add('BPRINTED',ftSmallint);

      ADataSet.FieldDefs.Add('BEXCLUSIVE',ftSmallint);
      ADataSet.FieldDefs.Add('BREPEATING',ftSmallint);

      ADataSet.FieldDefs.Add('FINVOICEDISCOUNT',ftFloat);
      ADataSet.FieldDefs.Add('FDOCAMOUNT',ftFloat);
      ADataSet.FieldDefs.Add('FTAXAMOUNT',ftFloat);
      ADataSet.FieldDefs.Add('SREPORTINGGROUP1',ftString,255);
      ADataSet.FieldDefs.Add('SREPORTINGGROUP2',ftString,255);

      ADetailDataset.FieldDefs.Add('EXTID',ftString,60);
      ADetailDataset.FieldDefs.Add('EXTTAXLINK',ftString,60);
      ADetailDataset.FieldDefs.Add('WLINETYPEID',ftinteger);
      ADetailDataset.FieldDefs.Add('STOCKID',ftString,60);
      ADetailDataset.FieldDefs.Add('SDESCRIPTION',ftString,DMTCCoreLink.MessageLength+255);
      ADetailDataset.FieldDefs.Add('FQtyOrdered',ftFloat);
      ADetailDataset.FieldDefs.Add('FQtyShipped',ftFloat);
      ADetailDataset.FieldDefs.Add('FSellingPrice',ftFloat);
      ADetailDataset.FieldDefs.Add('FItemDiscount',ftFloat);
      ADetailDataset.FieldDefs.Add('FExclusiveAmt',ftFloat);
      ADetailDataset.FieldDefs.Add('FInclusiveAmt',ftFloat);

      ADetailDataset.FieldDefs.Add('SREPORTINGGROUP1',ftString,255);
      ADetailDataset.FieldDefs.Add('SREPORTINGGROUP2',ftString,255);

      ADetailDataset.FieldDefs.Add('FTaxAmount',ftFloat);
      ADetailDataset.FieldDefs.Add('STaxAccount', ftString,DMTCCoreLink.MainAccountLength+4);
      ADetailDataset.FieldDefs.Add('SUnit',ftString,DMTCCoreLink.GetFieldLength('UNIT','SDESCRIPTION'));
      finally
       ADetailDataset.FieldDefs.EndUpdate ;
      end;
  finally
    ADataSet.FieldDefs.EndUpdate ;
  end;

end;

procedure TDMAccountStockDocument.GetDocuments(ADataSet,
  ADetailDataset: TDataSet; ASql: String);
  Var
   Level : Integer ;
begin
  ADataSet.close ;
  ADetailDataset.close ;
  CreateDocumentsDataSet(ADataSet,ADetailDataset);
  ADataSet.open ;
  ADetailDataset.open ;
  if ASql <> '' then
  TCQDOCHEAD.SQL.Text := ASql
  else
  TCQDOCHEAD.SQL.Text := 'Select * from Dochead' ;
  TCQDOCHEAD.open ;
  TCQDOCLINE.SQL.Text := 'Select * from Docline where WDocID = :DocId' ;
 while not TCQDOCHEAD.eof do
   begin
     TCQDOCLINE.Params[0].AsInteger := TCQDOCHEAD.FieldByName('WDOCID').AsInteger ;
     TCQDOCLINE.open ;
      ADataSet.Insert ;
      ADataSet.FieldByName('EXTID').AsInteger                 := TCQDOCHEAD.FieldByName('WDOCID').AsInteger ;
      ADataSet.FieldByName('SACCOUNT').AsString               := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TCQDOCHEAD.FieldByName('WACCOUNTID').AsInteger) ;
      ADataSet.FieldByName('WDOCTYPEID').AsInteger            := TCQDOCHEAD.FieldByName('WTYPEID').AsInteger ;
      ADataSet.FieldByName('DDATE').AsDateTime                := TCQDOCHEAD.FieldByName('DDATE').AsDateTime ;
      ADataSet.FieldByName('DDUEDATE').AsDateTime             := TCQDOCHEAD.FieldByName('DDUEDATE').AsDateTime ;
      ADataSet.FieldByName('SDOCNO').AsString                 := TCQDOCHEAD.FieldByName('SDOCNO').AsString ;
      ADataSet.FieldByName('SPOSTAL1').AsString               := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WPostal1ID').AsInteger);
      ADataSet.FieldByName('SPOSTAL2').AsString               := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WPostal2ID').AsInteger);
      ADataSet.FieldByName('SPOSTAL3').AsString               := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WPostal3ID').AsInteger);
      ADataSet.FieldByName('SPOSTALCODE').AsString            := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WPostalCodeID').AsInteger);;
      ADataSet.FieldByName('SPOSTALCOUNTRY').AsString         := TDataBaseRoutines.GetCountryName(TCQDOCHEAD.FieldByName('WPOSCOUNTRIES_ID').AsInteger);
      ADataSet.FieldByName('SMESSAGE1').AsString              := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WMESSAGE1ID').AsInteger);
      ADataSet.FieldByName('SMESSAGE2').AsString              := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WMESSAGE2ID').AsInteger);
      ADataSet.FieldByName('SMESSAGE3').AsString              := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WMESSAGE3ID').AsInteger);
      Level := 0 ;
      ADataSet.FieldByName('SSALESMAN').Asstring              := TDataBaseRoutines.GetNesteldNameFromGroupID(TCQDOCHEAD.FieldByName('WSALESMANID').AsInteger,Level);
      ADataSet.FieldByName('SREFERENCE').Asstring             := TCQDOCHEAD.FieldByName('SREFERENCE').Asstring ;
      ADataSet.FieldByName('SDELADRESS1').AsString            := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WDELADDRESS1ID').AsInteger);
      ADataSet.FieldByName('SDELADRESS2').AsString            := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WDELADDRESS2ID').AsInteger);
      ADataSet.FieldByName('SDELADRESS3').AsString            := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WDELADDRESS3ID').AsInteger);
      ADataSet.FieldByName('SDELADRESSCODE').AsString         := DMTCCoreLink.ReadDescription(TCQDOCHEAD.FieldByName('WDELCODEID').AsInteger);
      ADataSet.FieldByName('SDELADRESSCOUNTRY').AsString      := TDataBaseRoutines.GetCountryName(TCQDOCHEAD.FieldByName('WDELCOUNTRIES_ID').AsInteger);

      ADataSet.FieldByName('BPRINTED').AsInteger              := TCQDOCHEAD.FieldByName('BPRINTED').AsInteger ;

      ADataSet.FieldByName('BEXCLUSIVE').AsInteger            := TCQDOCHEAD.FieldByName('BEXCLUSIVE').AsInteger ;
      ADataSet.FieldByName('BREPEATING').AsInteger            := TCQDOCHEAD.FieldByName('BREPEATING').AsInteger ;

      ADataSet.FieldByName('FINVOICEDISCOUNT').AsFloat        := TCQDOCHEAD.FieldByName('FINVOICEDISCOUNT').AsFloat ;
      ADataSet.FieldByName('FDOCAMOUNT').AsFloat              := TCQDOCHEAD.FieldByName('FDOCAMOUNT').AsFloat ;
      ADataSet.FieldByName('FTAXAMOUNT').AsFloat              := TCQDOCHEAD.FieldByName('FTAXAMOUNT').AsFloat ;
      Level := 0 ;
      ADataSet.FieldByName('SREPORTINGGROUP1').Asstring       := TDataBaseRoutines.GetNesteldNameFromGroupID(TCQDOCHEAD.FieldByName('WREPORTINGGROUP1ID').AsInteger,Level);
      Level := 0 ;
      ADataSet.FieldByName('SREPORTINGGROUP2').Asstring       := TDataBaseRoutines.GetNesteldNameFromGroupID(TCQDOCHEAD.FieldByName('WREPORTINGGROUP2ID').AsInteger,Level);
      ADataSet.post ;
      while not TCQDOCLINE.Eof do
         begin
           ADetailDataset.Insert ;
           ADetailDataset.FieldByName('EXTID').AsInteger           := TCQDOCLINE.FieldByName('WDOCID').AsInteger ;
           ADetailDataset.FieldByName('WLINETYPEID').AsInteger     := TCQDOCLINE.FieldByName('WLINETYPEID').AsInteger ;
           ADetailDataset.FieldByName('SDESCRIPTION').AsString     := DMTCCoreLink.ReadDescription(TCQDOCLINE.FieldByName('WDESCRIPTIONID').AsInteger) ;
           // no remarks
           if  ADetailDataset.FieldByName('WLINETYPEID').AsInteger <> 91 then
             begin
               ADetailDataset.FieldByName('STOCKID').AsString          := TDataBaseStockRoutines.GetStockCode(TCQDOCLINE.FieldByName('WSTOCKID').AsInteger) ;
               ADetailDataset.FieldByName('FQtyOrdered').AsFloat   :=  TCQDOCLINE.FieldByName('FQtyOrdered').AsFloat ;
               ADetailDataset.FieldByName('FQtyShipped').AsFloat   :=  TCQDOCLINE.FieldByName('FQtyShipped').AsFloat ;
               ADetailDataset.FieldByName('FSellingPrice').AsFloat :=  TCQDOCLINE.FieldByName('FSellingPrice').AsFloat ;
               ADetailDataset.FieldByName('FItemDiscount').AsFloat :=  TCQDOCLINE.FieldByName('FItemDiscount').AsFloat ;
               ADetailDataset.FieldByName('FExclusiveAmt').AsFloat :=  TCQDOCLINE.FieldByName('FExclusiveAmt').AsFloat ;
               ADetailDataset.FieldByName('FInclusiveAmt').AsFloat :=  TCQDOCLINE.FieldByName('FInclusiveAmt').AsFloat ;
               ADetailDataset.FieldByName('FTaxAmount').AsFloat    :=  TCQDOCLINE.FieldByName('FTaxAmount').AsFloat ;
               ADetailDataset.FieldByName('STaxAccount').AsString        := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TCQDOCLINE.FieldByName('WTAXID').AsInteger) ;
               ADetailDataset.FieldByName('SUnit').AsString        :=  TCQDOCLINE.FieldByName('SUNIT').Asstring ;
             end;
           ADetailDataset.post ;
           TCQDOCLINE.Next ;
         end;
       TCQDOCLINE.close ;
       TCQDOCHEAD.Next ;
      end; // end EOF
end;

procedure TDMAccountStockDocument.GetStock(ADataSet: TDataSet;
  ASql: String);
  var
   i : Integer ;
begin
ADataSet.Close ;
CreateStockDataSet(ADataSet);
ADataSet.open ;
if ASql = '' then QStockItems.SQL.Text := 'select * from stock ' else
QStockItems.SQL.Text := ASql ;
QStockItems.Open ;
while not QStockItems.Eof do
  begin
    ADataSet.Insert ;
    ADataSet.FieldByName('EXTID').AsString := IntToStr(QStockItems.FindField('WSTOCKID').AsInteger);
    ADataSet.FieldByName('SSTOCKCODE').AsString :=  QStockItems.FieldByName('SSTOCKCODE').AsString ;
    ADataSet.FieldByName('SBarCodeNumber').AsString :=  QStockItems.FieldByName('SBarCodeNumber').AsString ;
    ADataSet.FieldByName('SDescription').AsString :=  QStockItems.FieldByName('SDescription').AsString ;
    ADataSet.FieldByName('SMANUFACTURER').AsString :=  QStockItems.FieldByName('SMANUFACTURER').AsString ;

    ADataSet.FieldByName('SExtraDesc').AsString :=  QStockItems.FieldByName('SExtraDesc').AsString ;
    ADataSet.FieldByName('BDisabled').AsInteger :=  QStockItems.FieldByName('BDisabled').AsInteger ;
    ADataSet.FieldByName('FQtyOnHand').AsFloat :=  QStockItems.FieldByName('FQtyOnHand').AsFloat ;
    ADataSet.FieldByName('FReorderQty').AsFloat :=  QStockItems.FieldByName('FReorderQty').AsFloat ;
    ADataSet.FieldByName('BApplyInvoiceDiscount').AsInteger :=  QStockItems.FieldByName('BApplyInvoiceDiscount').AsInteger ;
    ADataSet.FieldByName('FSellingPrice1').AsFloat :=  QStockItems.FieldByName('FSellingPrice1').AsFloat ;
    ADataSet.FieldByName('FSellingPrice2').AsFloat :=  QStockItems.FieldByName('FSellingPrice2').AsFloat ;
    ADataSet.FieldByName('FSellingPrice3').AsFloat :=  QStockItems.FieldByName('FSellingPrice3').AsFloat ;
    ADataSet.FieldByName('FUnitAveCost').AsFloat :=  QStockItems.FieldByName('FUnitAveCost').AsFloat ;
    ADataSet.FieldByName('FUnitCost').AsFloat :=  QStockItems.FieldByName('FUnitCost').AsFloat ;

    ADataSet.FieldByName('SUnit').AsString := TDataBaseStockRoutines.GetUnitDesc( QStockItems.FieldByName('WUnitID').AsInteger) ;
    i := 0 ;
    ADataSet.FieldByName('SGroup1').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(QStockItems.FieldByName('WREPORTINGGROUP1ID').AsInteger,i) ;
    i := 0 ;
    ADataSet.FieldByName('SGroup2').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(QStockItems.FieldByName('WREPORTINGGROUP2ID').AsInteger,i) ;

    ADataSet.FieldByName('SSTOCKCODESUP1').AsString :=   QStockItems.FieldByName('SSTOCKCODESUP1').AsString ;
    ADataSet.FieldByName('SSTOCKCODESUP2').AsString :=  QStockItems.FieldByName('SSTOCKCODESUP2').AsString ;



    ADataSet.FieldByName('SCostAccount').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( QStockItems.FieldByName('WCOSTACCOUNTID').AsInteger) ;
    ADataSet.FieldByName('SSaleSACCOUNT').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( QStockItems.FieldByName('WSALESACCOUNTID').AsInteger) ;
    ADataSet.FieldByName('SStockAccount').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( QStockItems.FieldByName('WSTOCKACCOUNTID').AsInteger) ;
    ADataSet.FieldByName('SInputTax').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( QStockItems.FieldByName('WINPUTTAXID').AsInteger) ;
    ADataSet.FieldByName('SOutputTax').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( QStockItems.FieldByName('WOUTPUTTAXID').AsInteger) ;
    ADataSet.FieldByName('SSupplier1').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( QStockItems.FieldByName('WSUPPLIER1ID').AsInteger) ;
    ADataSet.FieldByName('SSupplier2').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId( QStockItems.FieldByName('WSUPPLIER2ID').AsInteger) ;
    ADataSet.post ;
    QStockItems.next ;
  end;


end;
procedure TDMAccountStockDocument.TCQDOCHEADAfterInsert(DataSet: TDataSet);
begin
 TCQDOCHEAD.FieldByName('WDOCID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWDOCID);
end;

procedure TDMAccountStockDocument.DataModuleCreate(Sender: TObject);
begin
AVariableList := TStringlist.Create ;
DMTCCoreLink.AssignConnectionToChilds(self);
end;

procedure TDMAccountStockDocument.DataModuleDestroy(Sender: TObject);
begin
AVariableList.Free ;
end;

function TDMAccountStockDocument.GetVariableStockAccount(AVariable: String;
  ASourceID: Integer): Integer;
begin
 ZQIMP_TOTALS.Close ;
 ZQIMP_TOTALS.Params[0].AsInteger :=ASourceID ;
 ZQIMP_TOTALS.Params[1].AsString := AVariable ;
 ZQIMP_TOTALS.Open ;
 Result := ZQIMP_TOTALS.Fieldbyname('WSTOCKID').AsInteger ;
 ZQIMP_TOTALS.Close ;
end;

procedure TDMAccountStockDocument.PrepareRef(AImportType: TImportType;AKey : Integer;SourceID : Integer);
begin
 ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) ;
 case AImportType of
   itDebtors    : ZQImportLink.SQL.add(' and WACCOUNTID = ' + IntToStr(AKey)) ;
   itContacts   : ZQImportLink.SQL.add(' and WCONTACTID = ' + IntToStr(AKey)) ;
   itStock      : ZQImportLink.SQL.add(' and WSTOCKID = ' + IntToStr(AKey)) ;
   itDocuments  : ZQImportLink.SQL.add(' and WDOCID = ' + IntToStr(AKey)) ;
 end;
 ZQImportLink.open ;
 if ZQImportLink.IsEmpty then
   begin
      // add to link
      ZQImportLink.Insert ;
      ZQImportLinkIMP_LINKID.AsInteger :=  DMTCCoreLink.GetNewIdStr('GEN_LINKID') ;
      ZQImportLinkIMP_SOURCEID.AsInteger := SourceID ;
      ZQImportLinkIMP_EXTID.AsString :=  '' ;
       case AImportType of
         itDebtors    : ZQImportLinkWACCOUNTID.AsInteger := AKey ;
         itContacts   : ZQImportLinkWCONTACTID.AsInteger := AKey ;
         itStock      : ZQImportLinkWSTOCKID.AsInteger := AKey ;
         itDocuments  : ZQImportLinkWDOCID.AsInteger := AKey ;
       end;
   end ;


end;

procedure TDMAccountStockDocument.AddEditSuppliers(
  ACustomersDataSet: TDataSet; SourceID: Integer);
  var
   AccCode  : String ;
   AccT : Char ;

begin
 if assigned(FTheOnImportDataset) then
    FTheOnImportDataset(ACustomersDataSet,160{Debtors}) ;
 ACustomersDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(ACustomersDataSet.RecordCount,-1,160{Debtors});
 while not ACustomersDataSet.Eof do
   begin
       if assigned(FTheImportProgressEvent) then
         FTheImportProgressEvent(ACustomersDataSet.RecordCount,ACustomersDataSet.RecNo,160{Debtors});
       ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WACCOUNTID is not null and IMP_EXTID =' + QuotedStr('CRED:'+ACustomersDataSet.FindField('EXTID').AsString) ;
       ZQImportLink.open ;
       if ZQImportLink.IsEmpty then
         begin
            TCreditor.SQL.Text := 'Select * from creditor where 1 = 0' ;
            TCreditor.Open ;
            TCreditor.Insert ;
            TCreditor.FieldByName('WContactID').AsInteger := 0 ;
            TAccounts.SQL.Text := 'Select * from account where 1 = 0' ;
            TAccounts.open ;
            TAccounts.Insert ;
            TAccounts.FindField('WACCOUNTID').AsInteger := DMTCCoreLink.GetNewId(tcidNEWACCOUNTID) ;
            if ACustomersDataSet.FindField('SACCOUNTCODE').AsString <> '' then
            TAccounts.FindField('SACCOUNTCODE').AsString :=  ACustomersDataSet.FindField('SACCOUNTCODE').AsString
            else
            TAccounts.FindField('SACCOUNTCODE').AsString := TDataBaseRoutines.GetUniqueAccountCode('C') ;

            // Force new account.
            TAccounts.FindField('SACCOUNTCODE').AsString := UpperCase(TAccounts.FindField('SACCOUNTCODE').AsString );
            // see if exists
            if TDataBaseRoutines.GetAccountIDFromCode('C' + TAccounts.FindField('SACCOUNTCODE').AsString) < 1 then
              begin
               TAccounts.FindField('SACCOUNTCODE').AsString := TDataBaseRoutines.GetUniqueAccountCode('C') ;
              end;

            TAccounts.FindField('SMAINACCOUNTCODE').AsString := TDataBaseRoutines.SimpelAccountCodeToMainAccount(TAccounts.FindField('SACCOUNTCODE').AsString);
            TAccounts.FindField('SSUBACCOUNTCODE').AsString := TDataBaseRoutines.SimpelAccountCodeToSubAccount(TAccounts.FindField('SACCOUNTCODE').AsString);
            TAccounts.FindField('WACCOUNTTYPEID').AsInteger := 2 ;
            TAccounts.FindField('WLINKACCOUNT').AsInteger := TAccounts.FindField('WACCOUNTID').AsInteger ;
            TAccounts.FindField('BSUBACCOUNTS').AsInteger := 0 ;
            TAccounts.FindField('WREPORTINGGROUP1ID').AsInteger := 0;
            TAccounts.FindField('WREPORTINGGROUP2ID').AsInteger := 0 ;
            TAccounts.FindField('BINCOMEEXPENSE').AsInteger := 0 ;
            TAccounts.FindField('BOPENITEM').AsInteger := 1 ;
            TAccounts.FindField('BINACTIVE').AsInteger := 0 ;
            TCreditor.FindField('WACCOUNTID').AsInteger := TAccounts.FindField('WACCOUNTID').AsInteger ;
            TAccounts.post ;
            TCreditor.Post ;
            TDataBaseRoutines.CreateTotalsForAccount(TCreditor.FindField('WACCOUNTID').AsInteger);
            // add to link
            ZQImportLink.Insert ;
            ZQImportLinkIMP_LINKID.AsInteger :=  DMTCCoreLink.GetNewIdStr('GEN_LINKID') ;
            ZQImportLinkIMP_SOURCEID.AsInteger := SourceID ;
            ZQImportLinkIMP_EXTID.AsString :=  'CRED:'+ACustomersDataSet.FindField('EXTID').AsString ;
            ZQImportLinkWACCOUNTID.AsInteger := TCreditor.FindField('WACCOUNTID').AsInteger ;
            ZQImportLink.Post ;
            TCreditor.Edit ;
            TAccounts.Edit ;
         end else
         begin
            TCreditor.SQL.Text := 'Select * from creditor  where WACCOUNTID = ' + ZQImportLinkWACCOUNTID.AsString ;
            TCreditor.Open ;
            TCreditor.Edit ;
            TAccounts.SQL.Text := 'Select * from account where WACCOUNTID = ' + ZQImportLinkWACCOUNTID.AsString ;
            TAccounts.open ;
            TAccounts.Edit ;
         end;

            TAccounts.FindField('SDESCRIPTION').AsString :=  ACustomersDataSet.FindField('SDESCRIPTION').AsString ;
            TAccounts.FindField('BINACTIVE').AsInteger := ACustomersDataSet.FindField('BINACTIVE').AsInteger ;
            if not ACustomersDataSet.FieldByName('SPostal1').IsNull then
            TCreditor.FieldByName('SPostal1').AsString := ACustomersDataSet.FieldByName('SPostal1').AsString ;
            if not ACustomersDataSet.FieldByName('SPostal2').IsNull then
            TCreditor.FieldByName('SPostal2').AsString := ACustomersDataSet.FieldByName('SPostal2').AsString ;
            if not ACustomersDataSet.FieldByName('SPostal3').IsNull then
            TCreditor.FieldByName('SPostal3').AsString := ACustomersDataSet.FieldByName('SPostal3').AsString ;
            if not ACustomersDataSet.FieldByName('SPostalCode').IsNull then
            TCreditor.FieldByName('SPostalCode').AsString := ACustomersDataSet.FieldByName('SPostalCode').AsString ;

            if not ACustomersDataSet.FieldByName('sDelivery1').IsNull then
            TCreditor.FieldByName('sDelivery1').AsString := ACustomersDataSet.FieldByName('sDelivery1').AsString ;
            if not ACustomersDataSet.FieldByName('sDelivery2').IsNull then
            TCreditor.FieldByName('sDelivery2').AsString := ACustomersDataSet.FieldByName('sDelivery2').AsString ;
            if not ACustomersDataSet.FieldByName('sDelivery3').IsNull then
            TCreditor.FieldByName('sDelivery3').AsString := ACustomersDataSet.FieldByName('sDelivery3').AsString ;
        //    if not ACustomersDataSet.FieldByName('sDeliveryCode').IsNull then
        //    TCreditor.FieldByName('sDeliveryCode').AsString := ACustomersDataSet.FieldByName('sDeliveryCode').AsString ;

            if not ACustomersDataSet.FieldByName('STelephone1').IsNull then
            TCreditor.FieldByName('STelephone1').AsString := ACustomersDataSet.FieldByName('STelephone1').AsString ;
            if not ACustomersDataSet.FieldByName('STelephone2').IsNull then
            TCreditor.FieldByName('STelephone2').AsString := ACustomersDataSet.FieldByName('STelephone2').AsString ;
            if not ACustomersDataSet.FieldByName('SEMail').IsNull then
            TCreditor.FieldByName('SEMail').AsString := ACustomersDataSet.FieldByName('SEMail').AsString ;
            if not ACustomersDataSet.FieldByName('SFax').IsNull then
            TCreditor.FieldByName('SFax').AsString := ACustomersDataSet.FieldByName('SFax').AsString ;
            if not ACustomersDataSet.FieldByName('FCREDITLimit').IsNull then
            TCreditor.FieldByName('FCREDITLimit').AsFloat := ACustomersDataSet.FieldByName('FCREDITLimit').AsFloat ;

            if not ACustomersDataSet.FieldByName('FChargeAmount').IsNull then
            TCreditor.FieldByName('FChargeAmount').AsFloat := ACustomersDataSet.FieldByName('FChargeAmount').AsFloat ;
            if not ACustomersDataSet.FieldByName('FDiscount').IsNull then
            TCreditor.FieldByName('FDiscount').AsFloat := ACustomersDataSet.FieldByName('FDiscount').AsFloat ;
            if not ACustomersDataSet.FieldByName('FInterest').IsNull then
            TCreditor.FieldByName('FInterest').AsFloat := ACustomersDataSet.FieldByName('FInterest').AsFloat ;
            if not ACustomersDataSet.FieldByName('SMessage').IsNull then
            TCreditor.FieldByName('SMessage').AsString := ACustomersDataSet.FieldByName('SMessage').AsString ;
            if not ACustomersDataSet.FieldByName('WDefaultPriceTypeID').IsNull then
            TCreditor.FieldByName('WDefaultPriceTypeID').AsInteger := ACustomersDataSet.FieldByName('WDefaultPriceTypeID').AsInteger ;

            if not ACustomersDataSet.FieldByName('DLastActivity').IsNull then
            TCreditor.FieldByName('DLastActivity').AsDateTime := ACustomersDataSet.FieldByName('DLastActivity').AsDateTime ;
            if not ACustomersDataSet.FieldByName('Sreference').IsNull then
            TCreditor.FieldByName('Sreference').AsString := ACustomersDataSet.FieldByName('Sreference').AsString ;
            if not ACustomersDataSet.FieldByName('WDUEDAYS').IsNull then
            TCreditor.FieldByName('WDUEDAYS').AsInteger := ACustomersDataSet.FieldByName('WDUEDAYS').AsInteger ;
            if not ACustomersDataSet.FieldByName('SCOMPANYREGNO').IsNull then
            TCreditor.FieldByName('SCOMPANYREGNO').AsString := ACustomersDataSet.FieldByName('SCOMPANYREGNO').AsString ;
            if not ACustomersDataSet.FieldByName('SFREEFIELD1').IsNull then
            TCreditor.FieldByName('SFREEFIELD1').AsString := ACustomersDataSet.FieldByName('SFREEFIELD1').AsString ;
            if not ACustomersDataSet.FieldByName('SFREEFIELD2').IsNull then
            TCreditor.FieldByName('SFREEFIELD2').AsString := ACustomersDataSet.FieldByName('SFREEFIELD2').AsString ;
            if not ACustomersDataSet.FieldByName('SFREEFIELD3').IsNull then
            TCreditor.FieldByName('SFREEFIELD3').AsString := ACustomersDataSet.FieldByName('SFREEFIELD3').AsString ;

            if not ACustomersDataSet.FieldByName('SBANKNAME').IsNull then
            TCreditor.FieldByName('WBANKNAME').AsString := ACustomersDataSet.FieldByName('SBANKNAME').AsString ;
            if not ACustomersDataSet.FieldByName('SBRANCHCODE').IsNull then
            TCreditor.FieldByName('SBRANCHCODE').AsString := ACustomersDataSet.FieldByName('SBRANCHCODE').AsString ;
            if not ACustomersDataSet.FieldByName('SBANKACCOUNTNUMBER').IsNull then
            TCreditor.FieldByName('SBANKACCOUNTNUMBER').AsString := ACustomersDataSet.FieldByName('SBANKACCOUNTNUMBER').AsString ;
            if not ACustomersDataSet.FieldByName('SBANKACCOUNTNAME').IsNull then
            TCreditor.FieldByName('SBANKACCOUNTNAME').AsString := ACustomersDataSet.FieldByName('SBANKACCOUNTNAME').AsString ;
    //        if not ACustomersDataSet.FieldByName('SCREDITCARDNUMBER').IsNull then
    //        TCreditor.FieldByName('SCREDITCARDNUMBER').AsString := ACustomersDataSet.FieldByName('SCREDITCARDNUMBER').AsString ;
    //        if not ACustomersDataSet.FieldByName('SCREDITCARDTYPE').IsNull then
    //        TCreditor.FieldByName('SCREDITCARDTYPE').AsString := ACustomersDataSet.FieldByName('SCREDITCARDTYPE').AsString ;
    //        if not ACustomersDataSet.FieldByName('SCREDITCARDHOLDER').IsNull then
    //        TCreditor.FieldByName('SCREDITCARDHOLDER').AsString := ACustomersDataSet.FieldByName('SCREDITCARDHOLDER').AsString ;

           if not ACustomersDataSet.FieldByName('SDEFAULTACCOUNT').IsNull then
           begin
            TCreditor.FieldByName('WDEFAULTACCOUNT').AsInteger := 0 ;
            AccCode := UpperCase(Trim( ACustomersDataSet.FieldByName('SDEFAULTACCOUNT').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);

              TCreditor.FieldByName('WDEFAULTACCOUNT').AsInteger := TDataBaseRoutines.GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;
           end;

          if not ACustomersDataSet.FieldByName('SDEFAULTTAX').IsNull then
          begin
          TCreditor.FieldByName('WDEFAULTTAX').AsInteger := 0 ;
          AccCode := UpperCase(Trim( ACustomersDataSet.FieldByName('SDEFAULTTAX').AsString));
            if AccCode <> '' then
             begin
              AccT := AccCode[1];
              Delete(AccCode,1,1);
              TCreditor.FieldByName('WDEFAULTTAX').AsInteger := TDataBaseRoutines.GetAccountIdFromCodeAndType(AccCode,TDataBaseRoutines.AccCharToType(AccT));
             end;
          end;

          if not ACustomersDataSet.FieldByName('SPostCountry').IsNull then
          TCreditor.FieldByName('WPOSTCOUNTRIES_ID').AsInteger :=  TDataBaseRoutines.GetAddCountryId(ACustomersDataSet.FieldByName('SPostCountry').AsString) ;
          if not ACustomersDataSet.FieldByName('SDelCountry').IsNull then
          TCreditor.FieldByName('WDELCOUNTRIES_ID').AsInteger :=  TDataBaseRoutines.GetAddCountryId(ACustomersDataSet.FieldByName('SDelCountry').AsString) ;
          if not ACustomersDataSet.FieldByName('SSalesperson').IsNull then
          TCreditor.FieldByName('WSalesmanID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ACustomersDataSet.FieldByName('SSalesperson').AsString,31) ;
          if not ACustomersDataSet.FieldByName('SREPORTINGGROUP1').IsNull then
          TAccounts.FieldByName('WREPORTINGGROUP1ID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ACustomersDataSet.FieldByName('SREPORTINGGROUP1').AsString,22) ; ;
          if not ACustomersDataSet.FieldByName('SREPORTINGGROUP2').IsNull then
          TAccounts.FieldByName('WREPORTINGGROUP2ID').AsInteger := TDataBaseRoutines.GetAddGroupNesteled(ACustomersDataSet.FieldByName('SREPORTINGGROUP2').AsString,23) ; ;

          TAccounts.post ;
          TCreditor.post ;
          ACustomersDataSet.Next ;
   end;
end;

procedure TDMAccountStockDocument.CreateSuppliersDataset(
  ADataSet: TDataSet);
begin
  ADataSet.close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
  ADataSet.FieldDefs.Clear ;
  TCreditor.SQL.Text := 'Select * from Creditor where Waccountid = 0' ;
  TCreditor.Open ;
  TAccounts.SQL.Text := 'Select * from account where Waccountid =  0' ;
  TAccounts.open ;
  ADataSet.FieldDefs.Add('EXTID',ftString,60);
  ADataSet.FieldDefs.Add('SACCOUNTCODE',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SDESCRIPTION',ftString,TAccounts.FindField('SDESCRIPTION').Size);

  ADataSet.FieldDefs.Add('SPostal1',ftString,TCreditor.FindField('SPostal1').Size);
  ADataSet.FieldDefs.Add('SPostal2',ftString,TCreditor.FindField('SPostal2').Size);
  ADataSet.FieldDefs.Add('SPostal3',ftString,TCreditor.FindField('SPostal3').Size);
  ADataSet.FieldDefs.Add('SPostalCode',ftString,TCreditor.FindField('SPostalCode').Size);
  ADataSet.FieldDefs.Add('sDelivery1',ftString,TCreditor.FindField('sDelivery1').Size);
  ADataSet.FieldDefs.Add('sDelivery2',ftString,TCreditor.FindField('sDelivery2').Size);
  ADataSet.FieldDefs.Add('sDelivery3',ftString,TCreditor.FindField('sDelivery3').Size);
   ADataSet.FieldDefs.Add('sDeliveryCode',ftString,TCreditor.FindField('sDeliveryCode').Size);

  ADataSet.FieldDefs.Add('STelephone1',ftString,TCreditor.FindField('STelephone1').Size);
  ADataSet.FieldDefs.Add('STelephone2',ftString,TCreditor.FindField('STelephone2').Size);
  ADataSet.FieldDefs.Add('SEMail',ftString,TCreditor.FindField('SEMail').Size);
  ADataSet.FieldDefs.Add('SFax',ftString,TCreditor.FindField('SFax').Size);

  ADataSet.FieldDefs.Add('FCREDITLimit',ftFloat);
  ADataSet.FieldDefs.Add('FChargeAmount',ftFloat);
  ADataSet.FieldDefs.Add('FDiscount',ftFloat);
  ADataSet.FieldDefs.Add('FInterest',ftFloat);

  ADataSet.FieldDefs.Add('SMessage',ftString,TCreditor.FindField('SMessage').Size);
  ADataSet.FieldDefs.Add('WDefaultPriceTypeID',ftInteger);
  ADataSet.FieldDefs.Add('DLastActivity',ftDateTime);
  ADataSet.FieldDefs.Add('WDUEDAYS',ftInteger);
  ADataSet.FieldDefs.Add('BINACTIVE',ftSmallint);



  ADataSet.FieldDefs.Add('Sreference',ftString,TCreditor.FindField('Sreference').Size);
  ADataSet.FieldDefs.Add('SCOMPANYREGNO',ftString,TCreditor.FindField('SCOMPANYREGNO').Size);
  ADataSet.FieldDefs.Add('SFREEFIELD1',ftString,TCreditor.FindField('SFREEFIELD1').Size);
  ADataSet.FieldDefs.Add('SFREEFIELD2',ftString,TCreditor.FindField('SFREEFIELD2').Size);
  ADataSet.FieldDefs.Add('SFREEFIELD3',ftString,TCreditor.FindField('SFREEFIELD3').Size);
  ADataSet.FieldDefs.Add('SBANKNAME',ftString,TCreditor.FindField('WBANKNAME').Size);
  ADataSet.FieldDefs.Add('SBRANCHCODE',ftString,TCreditor.FindField('SBRANCHCODE').Size);
  ADataSet.FieldDefs.Add('SBANKACCOUNTNUMBER',ftString,TCreditor.FindField('SBANKACCOUNTNUMBER').Size);
  ADataSet.FieldDefs.Add('SBANKACCOUNTNAME',ftString,TCreditor.FindField('SBANKACCOUNTNAME').Size);
//  ADataSet.FieldDefs.Add('SCREDITCARDNUMBER',ftString,TCreditor.FindField('SCREDITCARDNUMBER').Size);
//  ADataSet.FieldDefs.Add('SCREDITCARDTYPE',ftString,TCreditor.FindField('SCREDITCARDTYPE').Size);
 // ADataSet.FieldDefs.Add('SCREDITCARDHOLDER',ftString,TCreditor.FindField('SCREDITCARDHOLDER').Size);

  ADataSet.FieldDefs.Add('SDEFAULTACCOUNT',ftString,DMTCCoreLink.MainAccountLength+4);
  ADataSet.FieldDefs.Add('SDEFAULTTAX',ftString,DMTCCoreLink.MainAccountLength+4);

  ADataSet.FieldDefs.Add('SPostCountry',ftString,64);
  ADataSet.FieldDefs.Add('SDelCountry',ftString,64);
  ADataSet.FieldDefs.Add('SSalesperson',ftString,30);

  ADataSet.FieldDefs.Add('SREPORTINGGROUP1',ftString,255);
  ADataSet.FieldDefs.Add('SREPORTINGGROUP2',ftString,255);
  finally
    ADataSet.FieldDefs.EndUpdate ;
  end;
end;

procedure TDMAccountStockDocument.GetSuppliers(ADataSet: TDataSet;
  AAccountIdInSql: String);
  var
   i :  integer ;
begin
ADataSet.Close ;
CreateCustomersDataset(ADataSet);
ADataSet.open ;
if AAccountIdInSql = '' then TAccounts.SQL.Text := 'select * from account where WAccountTypeID = 2' else
TAccounts.SQL.Text := 'select * from account where WAccountTypeID = 2 and WAccountID in ('+AAccountIdInSql +')' ;
TAccounts.Open ;
TCreditor.SQL.Text := 'Select * from Creditor where WACCOUNTID = :WAccountID' ;

while not TAccounts.Eof do
  begin
    TCreditor.Close ;
    TCreditor.Params[0].AsInteger := TAccounts.fieldbyname('WACCOUNTID').AsInteger ;
    TCreditor.open ;
    ADataSet.Insert ;
    ADataSet.FieldByName('SACCOUNTCODE').AsString := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TAccounts.fieldbyname('WACCOUNTID').AsInteger) ;
    ADataSet.FieldByName('EXTID').AsString := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TAccounts.fieldbyname('WACCOUNTID').AsInteger) ;
    ADataSet.FieldByName('SDESCRIPTION').AsString := TAccounts.FieldByName('SDESCRIPTION').AsString ;
    ADataSet.FieldByName('BINACTIVE').AsInteger := TAccounts.FieldByName('BINACTIVE').AsInteger ;
    ADataSet.FieldByName('SPostal1').AsString := TCreditor.FieldByName('SPostal1').AsString ;
    ADataSet.FieldByName('SPostal2').AsString := TCreditor.FieldByName('SPostal2').AsString ;
    ADataSet.FieldByName('SPostal3').AsString := TCreditor.FieldByName('SPostal3').AsString ;
    ADataSet.FieldByName('SPostalCode').AsString := TCreditor.FieldByName('SPostalCode').AsString ;
    ADataSet.FieldByName('sDelivery1').AsString := TCreditor.FieldByName('sDelivery1').AsString ;
    ADataSet.FieldByName('sDelivery2').AsString := TCreditor.FieldByName('sDelivery2').AsString ;
    ADataSet.FieldByName('sDelivery3').AsString := TCreditor.FieldByName('sDelivery3').AsString ;
   // ADataSet.FieldByName('sDeliveryCode').AsString := TCreditor.FieldByName('sDeliveryCode').AsString ;
    ADataSet.FieldByName('STelephone1').AsString := TCreditor.FieldByName('STelephone1').AsString ;
    ADataSet.FieldByName('STelephone2').AsString := TCreditor.FieldByName('STelephone2').AsString ;
    ADataSet.FieldByName('SEMail').AsString := TCreditor.FieldByName('SEMail').AsString ;
    ADataSet.FieldByName('SFax').AsString := TCreditor.FieldByName('SFax').AsString ;
    ADataSet.FieldByName('FCREDITLimit').AsString := TCreditor.FieldByName('FCREDITLimit').AsString ;
    ADataSet.FieldByName('FChargeAmount').AsString := TCreditor.FieldByName('FChargeAmount').AsString ;
    ADataSet.FieldByName('FDiscount').AsString := TCreditor.FieldByName('FDiscount').AsString ;
    ADataSet.FieldByName('FInterest').AsString := TCreditor.FieldByName('FInterest').AsString ;
    ADataSet.FieldByName('SMessage').AsString := TCreditor.FieldByName('SMessage').AsString ;
    ADataSet.FieldByName('WDefaultPriceTypeID').AsInteger := TCreditor.FieldByName('WDefaultPriceTypeID').AsInteger ;
    ADataSet.FieldByName('DLastActivity').AsDateTime := TCreditor.FieldByName('DLastActivity').AsDateTime ;
    ADataSet.FieldByName('Sreference').AsString := TCreditor.FieldByName('Sreference').AsString ;
    ADataSet.FieldByName('WDUEDAYS').AsInteger := TCreditor.FieldByName('WDUEDAYS').AsInteger ;
    ADataSet.FieldByName('SCOMPANYREGNO').AsString := TCreditor.FieldByName('SCOMPANYREGNO').AsString ;
    ADataSet.FieldByName('SFREEFIELD1').AsString := TCreditor.FieldByName('SFREEFIELD1').AsString ;
    ADataSet.FieldByName('SFREEFIELD2').AsString := TCreditor.FieldByName('SFREEFIELD2').AsString ;
    ADataSet.FieldByName('SFREEFIELD3').AsString := TCreditor.FieldByName('SFREEFIELD3').AsString ;
    ADataSet.FieldByName('SBANKNAME').AsString := TCreditor.FieldByName('WBANKNAME').AsString ;
    ADataSet.FieldByName('SBRANCHCODE').AsString := TCreditor.FindField('SBRANCHCODE').AsString ;
    ADataSet.FieldByName('SBANKACCOUNTNUMBER').AsString := TCreditor.FindField('SBANKACCOUNTNUMBER').AsString ;
    ADataSet.FieldByName('SBANKACCOUNTNAME').AsString := TCreditor.FindField('SBANKACCOUNTNAME').AsString ;
    ADataSet.FieldByName('SCREDITCARDNUMBER').AsString := TCreditor.FindField('SCREDITCARDNUMBER').AsString ;
    ADataSet.FieldByName('SCREDITCARDTYPE').AsString := TCreditor.FindField('SCREDITCARDTYPE').AsString ;
    ADataSet.FieldByName('SCREDITCARDHOLDER').AsString := TCreditor.FindField('SCREDITCARDHOLDER').AsString ;
    ADataSet.FieldByName('SDEFAULTACCOUNT').AsString :=  TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TCreditor.FindField('WDEFAULTACCOUNT').AsInteger) ;
    ADataSet.FieldByName('SDEFAULTTAX').AsString := TDataBaseRoutines.GetAccountCodeWithTypePrefixFromAccountId(TCreditor.FindField('WDEFAULTTAX').AsInteger) ;
    ADataSet.FieldByName('SPostCountry').AsString := TDataBaseRoutines.GetCountryName(TCreditor.FieldByName('WPOSTCOUNTRIES_ID').AsInteger) ;
    ADataSet.FieldByName('SDelCountry').AsString := TDataBaseRoutines.GetCountryName(TCreditor.FieldByName('WDELCOUNTRIES_ID').AsInteger) ;
    i := 0 ;
    ADataSet.FieldByName('SSalesperson').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(TCreditor.FieldByName('WSalesmanID').AsInteger,i) ;
    i := 0 ;
    ADataSet.FieldByName('SREPORTINGGROUP1').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(TAccounts.FieldByName('WREPORTINGGROUP1ID').AsInteger,i) ;
    i := 0 ;
    ADataSet.FieldByName('SREPORTINGGROUP2').AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(TAccounts.FieldByName('WREPORTINGGROUP2ID').AsInteger,i) ;
    ADataSet.post ;
    TAccounts.next ;
    TCreditor.Close ;
  end;

end;

procedure TDMAccountStockDocument.AddEditStockBom(AStockDataSet: TDataSet;
  SourceID: Integer);
  var
   LastStock: String ;
   LastStockosf,LinkOsfStockId : Integer ;
   Total,TotalValue,Temp1,CalulatedTotal : Double ;
begin
  if assigned(FTheOnImportDataset) then
     FTheOnImportDataset(AStockDataSet,869{stock});
  AStockDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(AStockDataSet.RecordCount,-1,869{stock});
 ZQStockBom.SQL.Text := 'Select * from bom where WStockID =:WStockID' ;
 LastStock := '';
 LastStockosf := 0 ;
 TotalValue := 0 ;
 Total := 0 ;
 CalulatedTotal := 0 ;
 while not AStockDataSet.Eof do
   begin
    if assigned(FTheImportProgressEvent) then
      FTheImportProgressEvent(AStockDataSet.RecordCount,AStockDataSet.RecNo,869{stock});

    if (LastStock <> AStockDataSet. FieldByName('SEXTSTOCKID').AsString)   then
    begin
       Total := 0 ;
       TotalValue := 0 ;
       // check all sales devide
       if LastStock <> '' then
          begin
            DMTCCoreLink.ExecSql('Update Stock set WStockTypeId  = 1 where WStockid = ' + IntToStr(LastStockosf) );
            ZQStockBom.First ;
            while not ZQStockBom.eof do
             begin
               Total := Total + ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat ;
               TotalValue := TotalValue + (ZQStockBom.FieldByName('FQTY').AsFloat *  TDataBaseStockRoutines.getAvgStockCost(ZQStockBom.FieldByName('WLINKEDSTOCKID').AsInteger));
               ZQStockBom.next ;
             end;
           if Total <> 100 then
              begin
                 CalulatedTotal := 0 ;
                 // not 100 so we make a redevide ;
                 ZQStockBom.First ;
                  while not ZQStockBom.eof do
                     begin
                       ZQStockBom.Edit ;
                       if TotalValue <> 0 then
                        begin
                        temp1 := TDataBaseStockRoutines.getAvgStockCost(ZQStockBom.FieldByName('WLINKEDSTOCKID').AsInteger) ;
                        temp1 := ZQStockBom.FieldByName('FQTY').AsFloat * temp1 ;
                        temp1 := (temp1 / TotalValue) * 100 ;
                        ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat := TDataBaseLedgerRoutines.RoundToLow(temp1,10) ;
                        CalulatedTotal := CalulatedTotal + ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat ;
                        end;

                       ZQStockBom.Post ;
                       ZQStockBom.next ;
                       if (ZQStockBom.Eof) and (CalulatedTotal <> 100.00 ) then
                         begin
                          // lastone adds up.

                          ZQStockBom.Edit ;
                          ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat := 100 - (CalulatedTotal- ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat) ;
                          ZQStockBom.Post ;
                          ZQStockBom.next ;
                        end;
                     end;
              end;
          end;
       LastStock := AStockDataSet.FieldByName('SEXTSTOCKID').AsString ;
       LastStockosf := GetStockOnExtID(LastStock,SourceID) ;
       if ZQStockBom.params[0].AsInteger <> LastStockosf then
       begin
       ZQStockBom.close ;
       ZQStockBom.params[0].AsInteger := LastStockosf ;
       ZQStockBom.open ;
       end;
       // delete the ones not in here
       if LastStockosf = 0 then
          raise Exception.Create('Ext Stock '+AStockDataSet. FieldByName('SEXTSTOCKID').AsString +' not found in import!' );

    end;
     LinkOsfStockId := GetStockOnExtID( AStockDataSet.FieldByName('SEXTLINKEDSTOCKID').AsString,SourceID) ;
     if LinkOsfStockId = 0 then
       raise Exception.Create('Ext Stock '+AStockDataSet. FieldByName('SEXTLINKEDSTOCKID').AsString +' not found in import!' );

      if not ZQStockBom.Locate('WLINKEDSTOCKID',LinkOsfStockId,[]) then
      ZQStockBom.insert
      else
      ZQStockBom.edit ;
      ZQStockBom.FieldByName('FQTY').AsFloat := AStockDataSet.FieldByName('FQTY').AsFloat;
      ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat := AStockDataSet.FieldByName('FPERCENTAGEOFSALE').AsFloat;
      ZQStockBom.FieldByName('WLINKEDSTOCKID').AsInteger := LinkOsfStockId;
      ZQStockBom.FieldByName('WSTOCKID').AsInteger := LastStockosf;
      ZQStockBom.Post;
      AStockDataSet.Next;
    end;
  if LastStock <> '' then
          begin
            DMTCCoreLink.ExecSql('Update Stock set WStockTypeId  = 1 where WStockid = ' + IntToStr(LastStockosf) );
            ZQStockBom.First ;
            while not ZQStockBom.eof do
             begin
               Total := Total + ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat ;
               TotalValue := 0000000000 + (ZQStockBom.FieldByName('FQTY').AsFloat *  TDataBaseStockRoutines.getAvgStockCost(ZQStockBom.FieldByName('WLINKEDSTOCKID').AsInteger));
               ZQStockBom.next ;
             end;
           if Total <> 100 then
              begin
                 // not 100 so we make a redevide ;
                 ZQStockBom.First ;
                  while not ZQStockBom.eof do
                     begin
                       ZQStockBom.Edit ;
                       if TotalValue <> 0 then
                        begin
                        temp1 := TDataBaseStockRoutines.getAvgStockCost(ZQStockBom.FieldByName('WLINKEDSTOCKID').AsInteger) ;
                        temp1 := ZQStockBom.FieldByName('FQTY').AsFloat * temp1 ;
                        temp1 := (temp1 / TotalValue) * 100 ;
                        ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat := TDataBaseLedgerRoutines.RoundTo(temp1,1) ;
                        CalulatedTotal := CalulatedTotal + ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat ;
                        end;

                       ZQStockBom.Post ;
                       ZQStockBom.next ;
                       if (ZQStockBom.Eof) and (CalulatedTotal <> 100 ) then
                         begin
                          // lastone adds up.

                          ZQStockBom.Edit ;
                          ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat := 100 - (CalulatedTotal- ZQStockBom.FieldByName('FPERCENTAGEOFSALE').AsFloat) ;
                          ZQStockBom.Post ;
                          ZQStockBom.next ;
                        end;
                     end;
              end;
          end;

end;
procedure TDMAccountStockDocument.CreateStockBomDataSet(
  ADataSet: TDataSet);
begin
  ADataSet.close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
  ADataSet.FieldDefs.Clear ;
  QStockItems.SQL.Text := 'Select * from stock where 1 = 0 ' ;
  QStockItems.open ;
  // used to link accounts from defaults.
  ADataSet.FieldDefs.Add('SEXTSTOCKID',ftString,60);
  ADataSet.FieldDefs.Add('SEXTLINKEDSTOCKID',ftString,60);
  ADataSet.FieldDefs.Add('FQTY',ftFloat);
  ADataSet.FieldDefs.Add('FPERCENTAGEOFSALE',ftFloat);
  finally
   ADataSet.FieldDefs.EndUpdate ;
  end;
end;
procedure TDMAccountStockDocument.GetStockBom(ADataSet: TDataSet;
  ASql: String);


begin
ADataSet.Close ;
CreateStockBomDataSet(ADataSet);
ADataSet.open ;
if ASql = '' then QStockItems.SQL.Text := 'select * from bom ' else
QStockItems.SQL.Text := ASql ;
QStockItems.Open ;
while not QStockItems.Eof do
  begin
    ADataSet.Insert ;
    // todo : implement
    ADataSet.post ;
    QStockItems.next ;
  end;


end;
procedure TDMAccountStockDocument.ZQStockBomAfterInsert(DataSet: TDataSet);
begin
   ZQStockBom.FieldByName('WBOMID').AsInteger :=  DMTCCoreLink.GetNewidByMaxPlusOne('BOM','WBOMID') ;
end;

function TDMAccountStockDocument.GetStockOnExtID(AExtId: String;
  ASourceID: Integer): Integer;

begin
  Result := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WStockid from IMP_LINK where WStockid is not null and IMP_SOURCEID=' + IntToStr(aSourceID) +' and IMP_EXTID = ' + QuotedStr(AExtId))) ,0);
end;

procedure TDMAccountStockDocument.SetTheOnHandelDetail(
  const Value: TOnHandelDetail);
begin
  FTheOnHandelDetail := Value;
end;

procedure TDMAccountStockDocument.AddEditStockLinkedGroups(
  AStockDataSet: TDataSet; SourceID: Integer);

  var
   LastStock: String ;
   LastStockosf,LinkOsfStockId : Integer ;

begin
  if assigned(FTheOnImportDataset) then
     FTheOnImportDataset(AStockDataSet,869{stock});
  AStockDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(AStockDataSet.RecordCount,-1,869{stock});
 ZQStockGroups.SQL.Text := 'select * from stock_multigroup where WStockID =:WStockID ';
 LastStock := '';
 LastStockosf := 0 ;
 while not AStockDataSet.Eof do
   begin
    if assigned(FTheImportProgressEvent) then
      FTheImportProgressEvent(AStockDataSet.RecordCount,AStockDataSet.RecNo,869{stock});

    if LastStock <> AStockDataSet. FieldByName('SEXTSTOCKID').AsString then
    begin

       // check all sales devide

       LastStock := AStockDataSet.FieldByName('SEXTSTOCKID').AsString ;
       LastStockosf := GetStockOnExtID(LastStock,SourceID) ;
       ZQStockGroups.close ;
       ZQStockGroups.params[0].AsInteger := LastStockosf ;
       ZQStockGroups.open ;

       if LastStockosf = 0 then
          raise Exception.Create('Ext Stock '+AStockDataSet. FieldByName('SEXTSTOCKID').AsString +' not found in import!' );

    end;
     LinkOsfStockId := TDataBaseRoutines.GetAddGroupNesteled(AStockDataSet.FieldByName('SGROUP').AsString,26) ;
     if LinkOsfStockId = 0 then
       raise Exception.Create('Ext Stock '+AStockDataSet. FieldByName('SGROUP').AsString +' not created!' );

      if not ZQStockGroups.Locate('WGROUPID',LinkOsfStockId,[]) then
      ZQStockGroups.insert
      else
      ZQStockGroups.edit ;
      ZQStockGroups.FieldByName('WGROUPID').AsFloat := LinkOsfStockId;
      ZQStockGroups.FieldByName('WSTOCKID').AsInteger := LastStockosf;
      ZQStockGroups.FieldByName('IMP_SOURCEID').AsInteger := SourceID;
      ZQStockGroups.Post;
      AStockDataSet.Next;
    end;
end;

procedure TDMAccountStockDocument.CreateStockLinedGroupsDataSet(
  ADataSet: TDataSet);
begin
  ADataSet.close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
  ADataSet.FieldDefs.Clear ;
  ADataSet.FieldDefs.Add('SEXTSTOCKID',ftString,60);
  ADataSet.FieldDefs.Add('SGROUP',ftString,255);
  finally
   ADataSet.FieldDefs.EndUpdate ;
  end;


end;

procedure TDMAccountStockDocument.GetStockLinkedgroups(ADataSet: TDataSet;
  ASql: String);
begin

end;

function TDMAccountStockDocument.GetDebAccountOnExtID(AExtId: String;
  ASourceID: Integer): Integer;
begin
  Result := StrToIntDef(VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select WAccountid from IMP_LINK where WAccountid is not null and IMP_SOURCEID=' + IntToStr(aSourceID) +' and IMP_EXTID = ' + QuotedStr(AExtId))) ,0);
end;

procedure TDMAccountStockDocument.AddEditAgenda(AAgendaDataSet: TDataSet;
  SourceID: Integer);

begin



  if assigned(FTheOnImportDataset) then
     FTheOnImportDataset(AAgendaDataSet,2876{contacts});
  AAgendaDataSet.First ;
 if assigned(FTheImportProgressEvent) then
   FTheImportProgressEvent(AAgendaDataSet.RecordCount,-1,2876{contacts});

  ZQAgenda.SQL.Text := 'Select * from events where recordid=:WRECID' ;
  //ZQAgenda.open ;

  ZQResource.SQL.Text := 'select * from resources where resourceid = 0' ;
  ZQResource.Open ;
     If ZQResource.IsEmpty then
                begin
                  ZQResource.Insert ;
                  ZQResource.FieldByName('resourceid').AsInteger := 0 ;
                  ZQResource.FieldByName('DESCRIPTION').AsString := 'Afrijders' ;
                  ZQResource.Post ;
                end;

  ZQResource.SQL.Text := 'select * from resources where upper(DESCRIPTION) =:DESC' ;
 // ZQResource.open ;



 AAgendaDataSet.first ;
 while not AAgendaDataSet.Eof do
   begin
    if assigned(FTheImportProgressEvent) then
      FTheImportProgressEvent(AAgendaDataSet.RecordCount,AAgendaDataSet.RecNo,2876{contacts});
        ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WEVENTID is not null and IMP_EXTID =' + QuotedStr(AAgendaDataSet.FindField('EXTID').AsString) ;
        ZQImportLink.open ;
       if ZQImportLink.IsEmpty then
         begin
          ZQAgenda.close ;
          ZQAgenda.Params[0].AsInteger := -1 ;
          ZQAgenda.open ;
          ZQAgenda.Append ;
 

          ZQImportLink.Insert ;
          ZQImportLinkIMP_LINKID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_LINKID') ;
          ZQImportLinkIMP_SOURCEID.AsInteger := SourceID ;
          ZQImportLinkIMP_EXTID.AsString :=  AAgendaDataSet.FieldByname('EXTID').AsString ;
          ZQImportLinkWEVENTID.AsInteger := ZQAgenda.FieldByname('RECORDID').AsInteger ;
          ZQImportLink.Post ;

         end else // else ZQImportLink.IsEmpty
         begin
            ZQAgenda.close ;
            ZQAgenda.Params[0].AsInteger := ZQImportLinkWEVENTID.AsInteger ;
            ZQAgenda.open ;
            ZQAgenda.Edit ;
         end;

       if trim(AAgendaDataSet.FieldByName('RESOURCENAME').AsString) <> '' then
         begin
             ZQResource.close ;
             ZQResource.Params[0].AsString := UpperCase(trim(AAgendaDataSet.FieldByName('RESOURCENAME').AsString));
             ZQResource.Open ;
             If ZQResource.IsEmpty then
                begin
                  ZQResource.Insert ;
                  ZQResource.FieldByName('DESCRIPTION').AsString := trim(AAgendaDataSet.FieldByName('RESOURCENAME').AsString) ;
                  ZQResource.Post ;

                end;

            ZQAgenda.FieldByName('RESOURCEID').AsInteger := ZQResource.FieldByName('RESOURCEID').AsInteger


         end else
         ZQAgenda.FieldByName('RESOURCEID').AsInteger := 0 ;





      ZQAgenda.FieldByName('STARTTIME').AsDateTime := AAgendaDataSet.FieldByName('STARTTIME').AsDateTime ;
      ZQAgenda.FieldByName('ENDTIME').AsDateTime := AAgendaDataSet.FieldByName('ENDTIME').AsDateTime ;
      ZQAgenda.FieldByName('DESCRIPTION').AsString := AAgendaDataSet.FieldByName('DESCRIPTION').AsString ;
      ZQAgenda.FieldByName('CATEGORY').AsInteger := AAgendaDataSet.FieldByName('CATEGORY').AsInteger ;
      ZQAgenda.FieldByName('ALLDAYEVENT').AsInteger := AAgendaDataSet.FieldByName('ALLDAYEVENT').AsInteger ;

      ZQAgenda.FieldByName('DINGPATH').AsString := AAgendaDataSet.FieldByName('DINGPATH').AsString ;

      ZQAgenda.FieldByName('ALARMSET').AsInteger := AAgendaDataSet.FieldByName('ALARMSET').AsInteger ;
      ZQAgenda.FieldByName('ALARMADVANCE').AsInteger := AAgendaDataSet.FieldByName('ALARMADVANCE').AsInteger ;
      ZQAgenda.FieldByName('ALARMADVANCETYPE').AsInteger := AAgendaDataSet.FieldByName('ALARMADVANCETYPE').AsInteger ;
      ZQAgenda.FieldByName('SNOOZETIME').AsDateTime := AAgendaDataSet.FieldByName('SNOOZETIME').AsDateTime ;
      ZQAgenda.FieldByName('REPEATCODE').AsInteger := AAgendaDataSet.FieldByName('REPEATCODE').AsInteger ;
      ZQAgenda.FieldByName('REPEATRANGEEND').AsDateTime := AAgendaDataSet.FieldByName('REPEATRANGEEND').AsDateTime ;
      ZQAgenda.FieldByName('CUSTOMINTERVAL').AsInteger := AAgendaDataSet.FieldByName('CUSTOMINTERVAL').AsInteger ;

      ZQAgenda.FieldByName('USERFIELD0').AsString := AAgendaDataSet.FieldByName('USERFIELD0').AsString ;
      ZQAgenda.FieldByName('USERFIELD1').AsString := AAgendaDataSet.FieldByName('USERFIELD1').AsString ;
      ZQAgenda.FieldByName('USERFIELD2').AsString := AAgendaDataSet.FieldByName('USERFIELD2').AsString ;
      ZQAgenda.FieldByName('USERFIELD3').AsString := AAgendaDataSet.FieldByName('USERFIELD3').AsString ;
      ZQAgenda.FieldByName('USERFIELD4').AsString := AAgendaDataSet.FieldByName('USERFIELD4').AsString ;
      ZQAgenda.FieldByName('USERFIELD5').AsString := AAgendaDataSet.FieldByName('USERFIELD5').AsString ;
      ZQAgenda.FieldByName('USERFIELD6').AsString := AAgendaDataSet.FieldByName('USERFIELD6').AsString ;
      ZQAgenda.FieldByName('USERFIELD7').AsString := AAgendaDataSet.FieldByName('USERFIELD7').AsString ;
      ZQAgenda.FieldByName('USERFIELD8').AsString := AAgendaDataSet.FieldByName('USERFIELD8').AsString ;
      ZQAgenda.FieldByName('USERFIELD9').AsString := AAgendaDataSet.FieldByName('USERFIELD9').AsString ;

       if AAgendaDataSet.FieldByName('ACCOUNTCODE').AsString <> '' then
         begin
             // find the Debtor ext id
           ZQImportLink.SQL.Text := 'select * from IMP_LINK where IMP_SOURCEID=' + IntToStr(SourceID) +' and WACCOUNTID is not null and IMP_EXTID =' + QuotedStr(AAgendaDataSet.FieldByName('ACCOUNTCODE').AsString) ;
           ZQImportLink.open ;
           if not ZQImportLink.IsEmpty then
             begin
               ZQAgenda.FieldByName('WACCOUNTID').AsInteger := ZQImportLinkWACCOUNTID.AsInteger ;
             end;
         end ;

      ZQAgenda.Post;
      // contact per account.

      AAgendaDataSet.Next;
    end;
end;


procedure TDMAccountStockDocument.CreateAgendaDataset(ADataSet: TDataSet);
begin
  ADataSet.close ;
  ADataSet.FieldDefs.BeginUpdate ;
  try
  ADataSet.FieldDefs.Clear ;
  ZQAgenda.SQL.Text := 'Select * from events where recordid= -1 ' ;
  ZQAgenda.open ;

  ZQResource.SQL.Text := 'select * from resources where upper(DESCRIPTION) =:DESC' ;
  ZQResource.open ;



  ADataSet.FieldDefs.Add('EXTID',ftString,60);
  ADataSet.FieldDefs.Add('RESOURCENAME',ftString,ZQResource.FieldByName('DESCRIPTION').Size)   ;
  ADataSet.FieldDefs.Add('STARTTIME',ftDateTime);
  ADataSet.FieldDefs.Add('ENDTIME',ftDateTime);
  ADataSet.FieldDefs.Add('DESCRIPTION',ftString,ZQAgenda.FieldByName('DESCRIPTION').Size);
  ADataSet.FieldDefs.Add('CATEGORY',ftInteger);
  ADataSet.FieldDefs.Add('NOTES',ftString,ZQAgenda.FieldByName('NOTES').Size);

  ADataSet.FieldDefs.Add('ALLDAYEVENT',ftInteger);

  ADataSet.FieldDefs.Add('DINGPATH',ftString,ZQAgenda.FieldByName('DINGPATH').Size);
  ADataSet.FieldDefs.Add('ALARMSET',ftSmallint);
  ADataSet.FieldDefs.Add('ALARMADVANCE',ftInteger);
  ADataSet.FieldDefs.Add('ALARMADVANCETYPE',ftInteger);
  ADataSet.FieldDefs.Add('SNOOZETIME',ftDateTime);

  ADataSet.FieldDefs.Add('REPEATCODE',ftInteger);
  ADataSet.FieldDefs.Add('REPEATRANGEEND',ftDateTime);
  ADataSet.FieldDefs.Add('CUSTOMINTERVAL',ftInteger);

  ADataSet.FieldDefs.Add('USERFIELD0',ftString,ZQAgenda.FieldByName('USERFIELD0').Size);
  ADataSet.FieldDefs.Add('USERFIELD1',ftString,ZQAgenda.FieldByName('USERFIELD1').Size);
  ADataSet.FieldDefs.Add('USERFIELD2',ftString,ZQAgenda.FieldByName('USERFIELD2').Size);
  ADataSet.FieldDefs.Add('USERFIELD3',ftString,ZQAgenda.FieldByName('USERFIELD3').Size);
  ADataSet.FieldDefs.Add('USERFIELD4',ftString,ZQAgenda.FieldByName('USERFIELD4').Size);
  ADataSet.FieldDefs.Add('USERFIELD5',ftString,ZQAgenda.FieldByName('USERFIELD5').Size);
  ADataSet.FieldDefs.Add('USERFIELD6',ftString,ZQAgenda.FieldByName('USERFIELD6').Size);
  ADataSet.FieldDefs.Add('USERFIELD7',ftString,ZQAgenda.FieldByName('USERFIELD7').Size);
  ADataSet.FieldDefs.Add('USERFIELD8',ftString,ZQAgenda.FieldByName('USERFIELD8').Size);
  ADataSet.FieldDefs.Add('USERFIELD9',ftString,ZQAgenda.FieldByName('USERFIELD9').Size);
  ADataSet.FieldDefs.Add('ACCOUNTCODE',ftString,255);

  finally
   ADataSet.FieldDefs.EndUpdate ;
  end;
end;
procedure TDMAccountStockDocument.GetAgenda(ADataSet: TDataSet;
  AAgendaIdInSql: String);
begin

end;

procedure TDMAccountStockDocument.ZQAgendaAfterInsert(DataSet: TDataSet);
begin
    ZQAgenda.FieldByName('RECORDID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_EVENTS_ID') ;
end;

procedure TDMAccountStockDocument.ZQResourceAfterInsert(DataSet: TDataSet);
begin
  ZQResource.FieldByName('RESOURCEID').AsInteger := DMTCCoreLink.GetNewIdStr('GEN_RESOURCEID_ID') ;
end;

end.

