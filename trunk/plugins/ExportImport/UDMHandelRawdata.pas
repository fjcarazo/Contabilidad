unit UDMHandelRawdata;

interface

uses
  SysUtils, Classes,UCDSLinkRoutines,VirtualTable,DB, ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni,dialogs,
  MemDS;

type
  TDMHandelRawdata = class(TDataModule)
    aQuery: TuniQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure handelVTigerDocuments(SourceId : Integer);
    procedure handelOsfDocuments(SourceId: Integer);
    function FormatFromDataSet(ADataSet: TDataSet;
      ASqlInList: String): String;
  public
    aImportLink: TDMCDSLinkRoutines ;
    aMemoryData : TVirtualTable ;
    aNesteldData : TVirtualTable ;
    aExternalMemoryData : TVirtualTable ;
    aExternalNesteledData : TVirtualTable ;
    ALog : TStringList ;
  published
     Procedure LoadDebtors(ASourceId : Integer;ATypeID : Integer);
     procedure LoadContacts(ASourceId, ATypeID: Integer);
     procedure LoadDocuments(ASourceId, ATypeID: Integer);
     procedure LoadStock(ASourceId, ATypeID: Integer);

     Procedure SaveDebtors (ASourceId : Integer;ATypeID : Integer);
    { Public declarations }
  end;


implementation

uses UDMAccountStockDocument, OSFGeneralRoutines, UDMTCCoreLink,janStrings,forms;

{$R *.dfm}

procedure TDMHandelRawdata.DataModuleCreate(Sender: TObject);
begin
ALog := TStringList.create ;
aImportLink := TDMCDSLinkRoutines.Create(Application) ;
aMemoryData := TVirtualTable.Create(self) ;
aExternalMemoryData   := TVirtualTable.Create(self) ;
aExternalNesteledData := TVirtualTable.Create(self) ;
aNesteldData          := TVirtualTable.Create(self) ;
end;

procedure TDMHandelRawdata.DataModuleDestroy(Sender: TObject);
begin
 aExternalMemoryData.free ;
 aMemoryData.free ;
 aExternalNesteledData.free ;
 aNesteldData.free ;
  aImportLink.Free ;
 ALog.Free ;
end;

procedure TDMHandelRawdata.handelVTigerDocuments(SourceId : Integer);
var
 DiscountStockID,ShippingCostStockID : Integer ;
begin
aExternalMemoryData.First ;
DMAccountStockDocument.ZQImportSource.close ;
DMAccountStockDocument.ZQImportSource.params[0].AsInteger := SourceId ;
DMAccountStockDocument.ZQImportSource.open ;
DMAccountStockDocument.AVariableList.Text := DMAccountStockDocument.ZQImportSourceIMP_INIFILE.AsString ;
DiscountStockID :=  DMAccountStockDocument.GetVariableStockAccount('DISCOUNT',SourceId);
ShippingCostStockID := DMAccountStockDocument.GetVariableStockAccount('SHIPPINGCOST',SourceId);

while not aExternalMemoryData.Eof do
   begin
     if DiscountStockID <> 0 then
       begin
              aExternalNesteledData.Append ;
              aExternalNesteledData.FieldByName('EXTID').AsString := aExternalMemoryData.FieldByName('EXTID').AsString ;
              aExternalNesteledData.FieldByName('EXTTAXLINK').AsString := 'DISCOUNT' ;
              aExternalNesteledData.FieldByName('productid').AsString := 'DISCOUNT' ;
              aExternalNesteledData.FieldByName('WLINETYPEID').AsInteger := 90 ;
              aExternalNesteledData.FieldByName('comment').AsString := TDataBaseStockRoutines.GetStockDescription(DiscountStockID);
              aExternalNesteledData.FieldByName('listprice').AsFloat := aExternalMemoryData.FieldByName('discount_amount').AsFloat / TDataBaseRoutines.GetTaxRateOnId(TDataBaseStockRoutines.GetOuputTaxId(DiscountStockID)) ;
              aExternalNesteledData.FieldByName('quantity').AsFloat := -1 ;
              aExternalNesteledData.Post ;
       end;
     if ShippingCostStockID <> 0 then
       begin
              aExternalNesteledData.Append ;
              aExternalNesteledData.FieldByName('EXTID').AsString := aExternalMemoryData.FieldByName('EXTID').AsString ;
              aExternalNesteledData.FieldByName('EXTTAXLINK').AsString := 'SHIPPINGCOST' ;
              aExternalNesteledData.FieldByName('productid').AsString := 'SHIPPINGCOST' ;
              aExternalNesteledData.FieldByName('WLINETYPEID').AsInteger := 90 ;
              aExternalNesteledData.FieldByName('comment').AsString := TDataBaseStockRoutines.GetStockDescription(ShippingCostStockID);
              aExternalNesteledData.FieldByName('listprice').AsFloat := aExternalMemoryData.FieldByName('s_h_amount').AsFloat / TDataBaseRoutines.GetTaxRateOnId(TDataBaseStockRoutines.GetOuputTaxId(ShippingCostStockID)) ;
              aExternalNesteledData.FieldByName('quantity').AsFloat := -1 ;
              aExternalNesteledData.Post ;
       end;
     aExternalMemoryData.next;
   end;
end;


procedure TDMHandelRawdata.handelOsfDocuments(SourceId : Integer);
 procedure HandelDetailTaxID(ATaxID : Integer ) ;
 begin
     aNesteldData.FieldByName('FExclusiveAmt').AsFloat :=  (aNesteldData.FieldByName('FSellingPrice').AsFloat *
                                                           aNesteldData.FieldByName('FQtyShipped').AsFloat) - aNesteldData.FieldByName('FTaxAmount').AsFloat ;
    if aNesteldData.FieldByName('FItemDiscount').AsFloat <> 0 then
        aNesteldData.FieldByName('FExclusiveAmt').AsFloat := (aNesteldData.FieldByName('FExclusiveAmt').AsFloat / 100) * (100 - aNesteldData.FieldByName('FItemDiscount').AsFloat);
     aNesteldData.FieldByName('FInclusiveAmt').AsFloat := aNesteldData.FieldByName('FExclusiveAmt').AsFloat *
     TDataBaseRoutines.GetTaxRateOnId(ATaxID,true);
     aNesteldData.FieldByName('FTaxAmount').AsFloat :=  aNesteldData.FieldByName('FInclusiveAmt').AsFloat -
                                                        aNesteldData.FieldByName('FExclusiveAmt').AsFloat ;
 end;
var
 TotalSales,TotalTax : Double ;
begin
aMemoryData.First ;
DMAccountStockDocument.ZQImportSource.close ;
DMAccountStockDocument.ZQImportSource.params[0].AsInteger := SourceId ;
DMAccountStockDocument.ZQImportSource.open ;
DMAccountStockDocument.AVariableList.Text := DMAccountStockDocument.ZQImportSourceIMP_INIFILE.AsString ;

while not aMemoryData.Eof do
   begin
       TotalSales := 0 ;
       TotalTax   := 0 ;
      aNesteldData.First;
      while not aNesteldData.Eof do
         begin
          if aMemoryData.FieldByName('EXTID').AsString = aNesteldData.FieldByName('EXTID').AsString then
             begin
              aNesteldData.edit ;
              DMAccountStockDocument.ZQIMP_STOCKACCOUNTS.close ;
              DMAccountStockDocument.ZQIMP_STOCKACCOUNTS.ParamByName('IMP_SOURCEID').AsInteger := SourceID ;
              DMAccountStockDocument.ZQIMP_STOCKACCOUNTS.ParamByName('IMP_EXTID').AsString := aNesteldData.FieldByName('EXTTAXLINK').AsString ;
              DMAccountStockDocument.ZQIMP_STOCKACCOUNTS.open ;
              if not DMAccountStockDocument.ZQIMP_STOCKACCOUNTS.IsEmpty then
               begin
                IF (aMemoryData.FieldByName('WDOCTYPEID').AsInteger in [10,11,14]) then
                  begin
                   HandelDetailTaxID(DMAccountStockDocument.ZQIMP_STOCKACCOUNTSWOUTPUTTAXACCOUNTID.AsInteger);
                  end else
                  begin
                   HandelDetailTaxID(DMAccountStockDocument.ZQIMP_STOCKACCOUNTSWINPUTTAXACCOUNTID.AsInteger);
                   end;
                   
               end;
               DMAccountStockDocument.ZQIMP_STOCKACCOUNTS.close ;
               TotalSales := TotalSales + aNesteldData.FieldByName('FExclusiveAmt').AsFloat ;
               TotalTax   := TotalTax + aNesteldData.FieldByName('FTaxAmount').AsFloat ;
               aNesteldData.Post ;
              end;
        aNesteldData.next ;
      end;
     aMemoryData.Edit ;
     aMemoryData.FieldByName('FDOCAMOUNT').AsFloat := TotalSales ;
     aMemoryData.FieldByName('FTAXAMOUNT').AsFloat := TotalTax ;
     aMemoryData.Post ;
     aMemoryData.next;
   end;
end;


procedure TDMHandelRawdata.LoadContacts(ASourceId, ATypeID: Integer);
begin
case ATypeID  of
 0 : begin
       if aImportLink.SQLList.ParamsList.Values['SYNCDATA'] = '1' then
        aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllContacts'+intToStr(ATypeID))+'  ' + aImportLink.SQLList.GetFormatedSQLByName('SyncSQLContact'+intToStr(ATypeID)))
       else
        aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllContacts'+intToStr(ATypeID)));
     end;
 1 :
     begin
      aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllContacts'+intToStr(ATypeID)));
     end;
  end;
      DMAccountStockDocument.CreateContactsDataSet(aMemoryData);
      aImportLink.mapfields(aExternalMemoryData,aMemoryData,nil,nil,aImportLink.SQLList.GetFormatedSQLByName('ContFieldmap'+intToStr(ATypeID)),'',false);
      DMAccountStockDocument.AddEditContacts(aMemoryData,ASourceId);
end;

procedure TDMHandelRawdata.LoadDebtors(ASourceId, ATypeID: Integer);
begin
 // todo : write to module with interface
 case  ATypeID of
    0 : begin
         if aImportLink.SQLList.ParamsList.Values['SYNCDATA'] = '1' then
            aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllCustomers'+intToStr(ATypeID))+'  ' + aImportLink.SQLList.GetFormatedSQLByName('SyncSQLAccount'+intToStr(ATypeID)))
         else
            aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllCustomers'+intToStr(ATypeID)));
       end;
    1 : begin
            aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllCustomers'+intToStr(ATypeID)));
       end;
  end;
  DMAccountStockDocument.CreateCustomersDataset(aMemoryData);
  aImportLink.mapfields(aExternalMemoryData,aMemoryData,nil,nil,aImportLink.SQLList.GetFormatedSQLByName('CustFieldmap'+intToStr(ATypeID)),'',false);
  DMAccountStockDocument.AddEditCustomers(aMemoryData,ASourceId);
end;

procedure TDMHandelRawdata.LoadDocuments(ASourceId, ATypeID: Integer);
begin
 // todo : write to module with interface
 case ATypeID of
   0 :  begin
         if aImportLink.SQLList.ParamsList.Values['SYNCDATA'] = '1' then
            aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('selectAllDocuments'+intToStr(ATypeID))+'  ' + aImportLink.SQLList.GetFormatedSQLByName('SyncSQLDocuments'+intToStr(ATypeID)))
          else
            aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('selectAllDocuments'+intToStr(ATypeID)));

         if aImportLink.SQLList.ParamsList.Values['SYNCDATA'] = '1' then
            aImportLink.FillCDSWithQuery(aExternalNesteledData,aImportLink.SQLList.GetFormatedSQLByName('selectAllDocumentsLines'+intToStr(ATypeID))+'  ' + aImportLink.SQLList.GetFormatedSQLByName('SyncSQLDocumentsLines'+intToStr(ATypeID)))
          else
            aImportLink.FillCDSWithQuery(aExternalNesteledData,aImportLink.SQLList.GetFormatedSQLByName('selectAllDocumentsLines'+intToStr(ATypeID)));
         handelVTigerDocuments(ASourceId);
         DMAccountStockDocument.CreateDocumentsDataSet(aMemoryData,aNesteldData);
         aImportLink.mapfields(aExternalMemoryData,aMemoryData,aExternalNesteledData,aNesteldData,
                                  aImportLink.SQLList.GetFormatedSQLByName('DocumentFieldMap'+intToStr(ATypeID)),
                                  aImportLink.SQLList.GetFormatedSQLByName('DocumentLinesFieldMap'+intToStr(ATypeID)),false);
         handelOsfDocuments(ASourceId);                         
         DMAccountStockDocument.AddEditDocuments(aMemoryData,aNesteldData,ASourceId);
        end;
   else begin
         aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('selectAllDocuments'+intToStr(ATypeID)));
         aImportLink.FillCDSWithQuery(aExternalNesteledData,aImportLink.SQLList.GetFormatedSQLByName('selectAllDocumentsLines'+intToStr(ATypeID)));

         DMAccountStockDocument.CreateDocumentsDataSet(aMemoryData,aNesteldData);
         aImportLink.mapfields(aExternalMemoryData,aMemoryData,aExternalNesteledData,aNesteldData,
                                  aImportLink.SQLList.GetFormatedSQLByName('DocumentFieldMap'+intToStr(ATypeID)),
                                  aImportLink.SQLList.GetFormatedSQLByName('DocumentLinesFieldMap'+intToStr(ATypeID)),false);

         DMAccountStockDocument.AddEditDocuments(aMemoryData,aNesteldData,ASourceId);
        end;
   end;
end;

procedure TDMHandelRawdata.LoadStock(ASourceId, ATypeID: Integer);
begin
 // todo : write to module with interface
   case ATypeID of
   0 :
        begin
         if aImportLink.SQLList.ParamsList.Values['SYNCDATA'] = '1' then
          aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllStock'+intToStr(ATypeID))+'  ' + aImportLink.SQLList.GetFormatedSQLByName('SyncSQLStock'+intToStr(ATypeID)))
         else
         aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllStock'+intToStr(ATypeID)));
       end;
   1 :
        begin
         aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('SelectAllStock'+intToStr(ATypeID)));
       end;
   end;
   DMAccountStockDocument.CreateStockDataSet(aMemoryData);
   aImportLink.mapfields(aExternalMemoryData,aMemoryData,nil,nil,aImportLink.SQLList.GetFormatedSQLByName('StockFieldmap'+intToStr(ATypeID)),'',false);
   DMAccountStockDocument.AddEditStock(aMemoryData,ASourceId);
end;

function TDMHandelRawdata.FormatFromDataSet(ADataSet : TDataSet ; ASqlInList : String ) : String ;
var
 i,PosParam : Integer ;
 NewTekst : String ;
begin
 result := '' ;
 if aImportLink.SQLList.SQLCollection.GetItemByName(ASqlInList) <> nil then
    begin
        result :=  aImportLink.SQLList.SQLCollection.GetItemByName(ASqlInList).SQL.Text ;
        for i:= 0 to aImportLink.SQLList.ParamsList.Count -1 do
           begin
              while pos('<@'+ aImportLink.SQLList.ParamsList.Names[i]+'@>',result) <> 0 do
                 begin
                    PosParam := pos('<@'+ aImportLink.SQLList.ParamsList.Names[i]+'@>',result) ;
                    Delete(Result,PosParam,Length('<@'+ aImportLink.SQLList.ParamsList.Names[i]+'@>'));
                    Insert( aImportLink.SQLList.ParamsList.ValueFromIndex[i],Result,PosParam);
                 end;
           end;

        for i:= 0 to ADataSet.Fields.Count -1 do
           begin
              while pos('<@'+ uppercase(ADataSet.Fields[i].FieldName)+'@>',uppercase(result)) <> 0 do
                 begin
                    PosParam := pos('<@'+ uppercase(ADataSet.Fields[i].FieldName)+'@>',uppercase(result)) ;
                    Delete(Result,PosParam,Length('<@'+ ADataSet.Fields[i].FieldName+'@>'));
                    if (ADataSet.Fields[i].DataType in [ftDate,ftDateTime,ftTimeStamp]) then
                        Insert(FormatDateTime(aImportLink.SQLList.ParamsList.Values['VTDATETIMEFORMAT'],ADataSet.Fields[i].AsDateTime),Result,PosParam)
                    else
                    if (ADataSet.Fields[i].DataType in [ftFloat,ftCurrency]) then
                    Insert(StringReplace(FormatFloat('#######0.########',ADataSet.Fields[i].AsFloat),DecimalSeparator,'.',[]) ,Result,PosParam)
                    else
                    begin
                    // NewTekst :=  QuotedStr(ADataSet.Fields[i].AsString);
                      NewTekst :=  QuotedStr(StringReplace( ADataSet.Fields[i].AsString,';',' ',[rfreplaceall]));
                      NewTekst :=  StringReplace( NewTekst,'&',' ',[rfreplaceall]);
                      NewTekst :=  StringReplace( NewTekst,'/',' ',[rfreplaceall]);
                      NewTekst :=  StringReplace( NewTekst,'\',' ',[rfreplaceall]);

                     //  NewTekst :=  QuotedStr( HTMLEncode( ADataSet.Fields[i].AsString));
                      Insert(NewTekst,Result,PosParam);
                    end;

                 end;
           end;
    end;
end;


procedure TDMHandelRawdata.SaveDebtors(ASourceId, ATypeID: Integer);
begin
  AQuery.Connection := DMTCCoreLink.TheZConnection ;
  AQuery.SQL.Text := aImportLink.SQLList.GetFormatedSQLByName('UplSelectCustomers'+intToStr(ATypeID));
  AQuery.open ;
  while not AQuery.Eof do
    begin
     try
       DMAccountStockDocument.PrepareRef(itDebtors, AQuery.fieldByName('EXTID').AsInteger,ASourceId);
       if DMAccountStockDocument.ZQImportLink.State = dsinsert then
         begin
           aImportLink.FillCDSWithQuery(aExternalMemoryData,aImportLink.SQLList.GetFormatedSQLByName('UplSelectCustomerNextid'+intToStr(ATypeID)));
           DMAccountStockDocument.ZQImportLinkIMP_EXTID.AsInteger := aExternalMemoryData.Fields[0].AsInteger +1 ;
           aImportLink.SQLList.ParamsList.Values['CRMID'] := DMAccountStockDocument.ZQImportLinkIMP_EXTID.AsString ;
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplUpdateCustomerNextid'+intToStr(ATypeID)));
           DMAccountStockDocument.ZQImportLink.Post ;

           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplInsCustVTigerCRMEntityAccount'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplInsCustVTigerAccount'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplInsCustVTigerAccountShipAdress'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplInsCustVTigerAccountBilAdress'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplInsCustVTigerAccountCNF'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplInsCustVTigerLeadSubdetails'+intToStr(ATypeID)));

         end else
         begin
           aImportLink.SQLList.ParamsList.Values['CRMID'] := DMAccountStockDocument.ZQImportLinkIMP_EXTID.AsString ;
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplUpdCustVTigerCRMEntityAccount'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplUpdCustVTigerAccount'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplUpdCustVTigerAccountShipAdress'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplUpdCustVTigerAccountBilAdress'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplUpdCustVTigerAccountCNF'+intToStr(ATypeID)));
           aImportLink.ExecSQL(FormatFromDataSet(AQuery,'UplUpdCustVTigerLeadSubdetails'+intToStr(ATypeID)));
         end;
       except
          On e: Exception do
            ALog.Add('error handeling ' + AQuery.fieldByName('EXTID').AsString + e.message );
       end;
       AQuery.next ;
    end;
 
end;

end.
