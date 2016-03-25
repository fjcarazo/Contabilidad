unit ULookupGrids;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, MemDS, DBAccess, Uni, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxDBExtLookupComboBox;

type
  TfmLookupgrids = class(TForm)
    ContraAccountDBTableView1: TcxGridDBTableView;
    ContraAccountLevel1: TcxGridLevel;
    ContraAccount: TcxGrid;
    JobcodeDBTableView1: TcxGridDBTableView;
    JobcodeLevel1: TcxGridLevel;
    Jobcode: TcxGrid;
    AccountDBTableView1: TcxGridDBTableView;
    AccountLevel1: TcxGridLevel;
    Account: TcxGrid;
    TaxDBTableView1: TcxGridDBTableView;
    TaxLevel1: TcxGridLevel;
    Tax: TcxGrid;
    group1DBTableView1: TcxGridDBTableView;
    group1Level1: TcxGridLevel;
    group1: TcxGrid;
    group2DBTableView1: TcxGridDBTableView;
    group2Level1: TcxGridLevel;
    group2: TcxGrid;
    TblAccount: TUniQuery;
    ZQCostgroup1: TUniQuery;
    ZQCostgroup1WGROUPID: TIntegerField;
    ZQCostgroup1SFULLDESC: TStringField;
    ZQCostGroup2: TUniQuery;
    ZQCostGroup2WGROUPID: TIntegerField;
    ZQCostGroup2SFULLDESC: TStringField;
    ZQProjects: TUniQuery;
    zqContrAccount: TUniQuery;
    zqTax: TUniQuery;
    dsaccount: TDataSource;
    dsContrAccount: TDataSource;
    dsTax: TDataSource;
    dsGroup1: TDataSource;
    dsGroup2: TDataSource;
    dsJobcost: TDataSource;
    AccountDBTableView1WACCOUNTID: TcxGridDBColumn;
    AccountDBTableView1SACCOUNTCODE: TcxGridDBColumn;
    AccountDBTableView1SDESCRIPTION: TcxGridDBColumn;
    ContraAccountDBTableView1WACCOUNTID: TcxGridDBColumn;
    ContraAccountDBTableView1SACCOUNTCODE: TcxGridDBColumn;
    ContraAccountDBTableView1SDESCRIPTION: TcxGridDBColumn;
    group1DBTableView1WGROUPID: TcxGridDBColumn;
    group1DBTableView1SFULLDESC: TcxGridDBColumn;
    ZQProjectsWJOBPROJECTID: TIntegerField;
    ZQProjectsSJOBPROJECTCODE: TStringField;
    ZQProjectsSDESCRIPTION: TStringField;
    JobcodeDBTableView1WJOBPROJECTID: TcxGridDBColumn;
    JobcodeDBTableView1SJOBPROJECTCODE: TcxGridDBColumn;
    JobcodeDBTableView1SDESCRIPTION: TcxGridDBColumn;
    TaxDBTableView1WACCOUNTID: TcxGridDBColumn;
    TaxDBTableView1SACCOUNTCODE: TcxGridDBColumn;
    TaxDBTableView1SDESCRIPTION: TcxGridDBColumn;
    group2DBTableView1WGROUPID: TcxGridDBColumn;
    group2DBTableView1SFULLDESC: TcxGridDBColumn;
    cxEditRepository1: TcxEditRepository;
    cbAccount: TcxEditRepositoryExtLookupComboBoxItem;
    cbContraccount: TcxEditRepositoryExtLookupComboBoxItem;
    cbGroup1: TcxEditRepositoryExtLookupComboBoxItem;
    cbGroup2: TcxEditRepositoryExtLookupComboBoxItem;
    cbJobcode: TcxEditRepositoryExtLookupComboBoxItem;
    cbTax: TcxEditRepositoryExtLookupComboBoxItem;
    TblInList: TUniQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    DateTimeField1: TDateTimeField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    AccountDBTableView1CALC_INLIST: TcxGridDBColumn;
    AccountDBTableView1OPENITEM: TcxGridDBColumn;
    procedure TblAccountSACCOUNTCODEGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ZQCostgroup1CalcFields(DataSet: TDataSet);
    procedure ZQCostGroup2CalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure AccountDBTableView1DataControllerFilterRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure ContraAccountDBTableView1DataControllerFilterRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure JobcodeDBTableView1DataControllerFilterRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure TaxDBTableView1DataControllerFilterRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure group1DBTableView1DataControllerFilterRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure group2DBTableView1DataControllerFilterRecord(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var Accept: Boolean);
    procedure TblAccountAfterOpen(DataSet: TDataSet);
    procedure cbAccountPropertiesCloseUp(Sender: TObject);
    procedure cbAccountPropertiesInitPopup(Sender: TObject);
  private
    FlookAccount: String;
    FlookContra: String;
    FlookGroup1: String;
    FlookTax: String;
    Flookjob: String;
    FlookGroup2: String;
    FCloseUpNotify: TNotifyEvent;
    FPopUpNotify: TNotifyEvent;


    procedure SetlookAccount(const Value: String);
    procedure SetlookContra(const Value: String);
    procedure SetlookGroup1(const Value: String);
    procedure SetlookGroup2(const Value: String);
    procedure Setlookjob(const Value: String);
    procedure SetlookTax(const Value: String);
    function Stripinvalides(Avalue : String ):String ;

    procedure SetCloseUpNotify(const Value: TNotifyEvent);
    procedure SetPopUpNotify(const Value: TNotifyEvent);

    { Private declarations }
  public
    property lookAccount : String  read FlookAccount write SetlookAccount;
    property lookContra  : String  read FlookContra write SetlookContra;
    property lookTax  : String  read FlookTax write SetlookTax;
    property lookGroup1  : String  read FlookGroup1 write SetlookGroup1;
    property lookGroup2  : String  read FlookGroup2 write SetlookGroup2;
    property lookjob  : String  read Flookjob write Setlookjob;
    procedure NewShowLookup(Query : TUniQuery; Title,Select,Tabletype : String );

    property CloseUpNotify : TNotifyEvent  read FCloseUpNotify write SetCloseUpNotify;
    property PopUpNotify : TNotifyEvent   read FPopUpNotify write SetPopUpNotify;
    procedure datarefresh ;
    { Public declarations }
  end;

var
  fmLookupgrids: TfmLookupgrids;

implementation

uses UDMTCCoreLink, OSFGeneralRoutines, UDmQuantumGridDefs, Math;

{$R *.dfm}

Procedure TfmLookupgrids.NewShowLookup(Query : TUniQuery; Title,Select,Tabletype : String );

begin

     if Uppercase(Tabletype) = 'OPENITEM' then
        begin
          Query.close ;
          Query.SQL.Text := 'select a.WACCOUNTID, a.SACCOUNTCODE, a.SMAINACCOUNTCODE, a.SSUBACCOUNTCODE, a.SDESCRIPTION,'
          +' a.WACCOUNTTYPEID, a.WREPORTINGGROUP1ID, a.WREPORTINGGROUP2ID, a.BSUBACCOUNTS, a.BINCOMEEXPENSE, a.BOPENITEM, a.BINACTIVE, a.DSYSDATE, a.WPROFILEID, a.WLINKACCOUNT, a.WTAXACCOUNT, ' +
          ' sum(b.FOUTSTANDINGAMOUNT) openitem from v_account a left join transact b on a.Waccountid = b.Waccountid '+
          ' where a.binactive =  0 and a.BOpenitem = 1   group by '+
          ' a.WACCOUNTID, a.SACCOUNTCODE, a.SMAINACCOUNTCODE, a.SSUBACCOUNTCODE, a.SDESCRIPTION, a.WACCOUNTTYPEID, a.WREPORTINGGROUP1ID, a.WREPORTINGGROUP2ID, a.BSUBACCOUNTS,'
          +' a.BINCOMEEXPENSE, a.BOPENITEM, a.BINACTIVE, a.DSYSDATE, a.WPROFILEID, a.WLINKACCOUNT, a.WTAXACCOUNT ' ;


          Query.Filtered:=True;
          Query.Open ;
          AccountDBTableView1OPENITEM.Visible := True ;
        end else

     if Uppercase(Tabletype) = 'SPECIALSELECTACCOUNT' then
        begin
          Query.Filtered:=False;
          Query.SQL.Text := 'select * from v_account ';
          Query.filter := 'binactive = 0 and (bsubaccounts = 0 or bsubaccounts is null) and (WAccountTypeID = 0 and ' + 'WAccountID <> ' + intToStr(DMTCCoreLink.RetaindIncomeControlAccountid) +') or WAccountId = 0' ;
          Query.open ;
          Query.Filtered:=True;
        end else
     if Uppercase(Tabletype) = 'ACCOUNTONLY' then
        begin
          Query.Filtered:=False;
          Query.SQL.Text := 'select * from v_account  where binactive = 0 and (bsubaccounts = 0 or bsubaccounts is null) and((WAccountTypeID = 0 or WAccountTypeID = 3 or WAccountTypeID = 4) and ' + 'WAccountID <> ' + inttostr(DMTCCoreLink.CreditorsControlAccountid) + ' and WAccountID <> ' + inttostr(DMTCCoreLink.DebtorsControlAccountid) + ' and WAccountID <> ' + inttostr(DMTCCoreLink.RetaindIncomeControlAccountid) + ' and BSubAccounts <> 1' +') or WAccountId = 0';
          Query.open ;
          Query.Filtered:=True;
        end else
     if Uppercase(Tabletype) = 'DEBTOR' then
        begin
          Query.Filtered:=False;
          Query.SQL.Text := 'select * from v_account  where binactive = 0 and (bsubaccounts = 0 or bsubaccounts is null) and (WAccountTypeID = 1) or WAccountId = 0' ;
          Query.open ;
          Query.Filtered:=True;
        end;

 if Uppercase(Tabletype) = 'PROJECT' then
        begin
          Query.open ;
        end;
 if Uppercase(Tabletype) = 'COST1' then
        begin
          Query.Open;
        end;
  if Uppercase(Tabletype) = 'COST2' then
        begin
          Query.Open;
        end;
     if Uppercase(Tabletype) = 'CREDITOR' then
        begin
          Query.Filtered:=False;
          Query.SQL.Text := 'select * from v_account  where binactive = 0 and (bsubaccounts = 0 or bsubaccounts is null) and (WAccountTypeID = 2) or WAccountId = 0' ;
          Query.open ;
          Query.Filtered:=True;
        end;
     if Uppercase(Tabletype) = 'ACCOUNT' then
     begin
          Query.Filtered:=False;
          Query.SQL.Text := 'select * from v_account'  ;
          if Uppercase(Select) = 'GLTHREE' then
             begin
               Query.SQL.Add('where binactive = 0 and (bsubaccounts = 0 or bsubaccounts is null) and (WAccountID <> '  +  intToStr( DMTCCoreLink.DebtorsControlAccountid) + ' and WAccountID <>  ' + intToStr(DMTCCoreLink.CreditorsControlAccountid) +  ' and BSubAccounts <> 1' +') or WAccountId = 0') ;
             end
             else if Uppercase(Select) = 'TAX' then
             begin
              Query.SQL.Add('where binactive = 0 and (bsubaccounts = 0 or bsubaccounts is null) and ((WAccountTypeID =4) or WAccountId = 0 and BInActive = 0) or WAccountId = 0');
             end else if Uppercase(Select) <> 'ALL' then
             begin
                Query.SQL.Add('where binactive = 0 and (bsubaccounts = 0 or bsubaccounts is null) and (WAccountID <> '+ inttostr(DMTCCoreLink.CreditorsControlAccountid) + ' and WAccountID <> ' + inttostr(DMTCCoreLink.DebtorsControlAccountid) + ' and WAccountID <> ' + inttostr(DMTCCoreLink.RetaindIncomeControlAccountid) + ' and BSubAccounts <> 1) or WAccountid = 0') ;
             end;
          Query.open ;
          Query.Filtered:=True;
     end;

 {  if Query = TblInList then
      begin
       Query.last ;
       TblAccount.Open ;
       end;   }
end;

procedure TfmLookupgrids.TblAccountSACCOUNTCODEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
Var
 MyAcc:String;
begin
  if  Sender.DataSet.FieldByName('BSubAccounts').AsInteger = 1 then
    MyAcc:=Copy(Sender.DataSet.FieldByName('SACCOUNTCODE').AsString,1,DMTCCoreLink.MainAccountLength)
  else
    MyAcc:=Sender.DataSet.FieldByName('SACCOUNTCODE').AsString;
  Case Sender.DataSet.FieldByName('WAccountTypeID').AsInteger of
  1:Text:='D'+MyAcc;
  2:Text:='C'+MyAcc;
  3:Text:='B'+MyAcc;
  4:Text:='T'+MyAcc;
  else
    Text:='G'+MyAcc;
  end;
end;

procedure TfmLookupgrids.ZQCostgroup1CalcFields(DataSet: TDataSet);

var
 Level : Integer ;
begin
 Level := 0 ;
 ZQCostgroup1SFULLDESC.AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(ZQCostgroup1WGROUPID.AsInteger, Level);
end;


procedure TfmLookupgrids.ZQCostGroup2CalcFields(DataSet: TDataSet);
var
 Level : Integer ;
begin
 Level := 0 ;
 ZQCostgroup2SFULLDESC.AsString := TDataBaseRoutines.GetNesteldNameFromGroupID(ZQCostgroup2WGROUPID.AsInteger, Level);
end;

procedure TfmLookupgrids.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.AssignConnectionToChilds(SELF);

  AccountDBTableView1SACCOUNTCODE.Caption:= DMTCCoreLink.GetTextLang(605);
  AccountDBTableView1SDESCRIPTION.Caption:=DMTCCoreLink.GetTextLang(606);


  ContraAccountDBTableView1SACCOUNTCODE.Caption:=DMTCCoreLink.GetTextLang(605);
  ContraAccountDBTableView1SDESCRIPTION.Caption:=DMTCCoreLink.GetTextLang(606);

  TaxDBTableView1SACCOUNTCODE.Caption:=DMTCCoreLink.GetTextLang(605);
  TaxDBTableView1SDESCRIPTION.Caption:=DMTCCoreLink.GetTextLang(606);

  group1DBTableView1SFULLDESC.Caption:=DMTCCoreLink.GetTextLang(606);
  group2DBTableView1SFULLDESC.Caption:=DMTCCoreLink.GetTextLang(606);

  JobcodeDBTableView1SJOBPROJECTCODE.Caption:=DMTCCoreLink.GetTextLang(605);
  JobcodeDBTableView1SDESCRIPTION.Caption:=DMTCCoreLink.GetTextLang(606);


end;

procedure TfmLookupgrids.SetlookAccount(const Value: String);
begin
  if (FlookAccount <> Stripinvalides(Value)) then
    begin

      FlookAccount := Stripinvalides(Value);
      AccountDBTableView1.DataController.Filter.Active := false ;

      if FlookAccount <> '' then
      begin
      AccountDBTableView1.DataController.Filter.Active := true ;
      AccountDBTableView1.DataController.Filter.Changed  ;
     // AccountDBTableView1.DataController.Refresh ;
        if AccountDBTableView1.ViewData.RowCount > 0 then
        begin
           AccountDBTableView1.Controller.FocusedRecordIndex := 1 ;
           // AccountDBTableView1.ViewData.Rows[0].Focused := True ;
        end;
      end;
   end;
end;

procedure TfmLookupgrids.SetlookContra(const Value: String);
begin
if (FlookContra <> Stripinvalides(Value)) then
    begin
      FlookContra := Stripinvalides(Value);
      ContraAccountDBTableView1.DataController.Filter.Active := false ;
      if FlookContra <> '' then
      begin

      ContraAccountDBTableView1.DataController.Filter.Active := true ;
      ContraAccountDBTableView1.DataController.Filter.Changed  ;
        if ContraAccountDBTableView1.ViewData.RowCount > 0 then
        begin
           ContraAccountDBTableView1.Controller.FocusedRecordIndex := 1 ;
        end;
      end;
   end;
end;

procedure TfmLookupgrids.SetlookGroup1(const Value: String);
begin


if (FlookGroup1 <> Stripinvalides(Value)) then
    begin
      FlookGroup1 := Stripinvalides(Value);
      group1DBTableView1.DataController.Filter.Active := false ;
      group1DBTableView1.DataController.Filter.Active := true ;
        if group1DBTableView1.ViewData.RowCount > 0 then
        begin
           group1DBTableView1.Controller.FocusedRecordIndex := 1 ;
        end;
   end;
end;

procedure TfmLookupgrids.SetlookGroup2(const Value: String);
begin
if (FlookGroup2 <> Stripinvalides(Value)) then
    begin
      FlookGroup2 := Stripinvalides(Value);
      group2DBTableView1.DataController.Filter.Active := false ;
      group2DBTableView1.DataController.Filter.Active := true ;
        if group2DBTableView1.ViewData.RowCount > 0 then
        begin
           group2DBTableView1.Controller.FocusedRecordIndex := 1 ;
        end;
   end;

end;

procedure TfmLookupgrids.Setlookjob(const Value: String);
begin

if (Flookjob <> Stripinvalides(Value)) then
    begin
      Flookjob := Stripinvalides(Value);
      JobcodeDBTableView1.DataController.Filter.Active := false ;
      JobcodeDBTableView1.DataController.Filter.Active := true ;
        if JobcodeDBTableView1.ViewData.RowCount > 0 then
        begin
           JobcodeDBTableView1.Controller.FocusedRecordIndex := 1 ;
        end;
   end;
end;

procedure TfmLookupgrids.SetlookTax(const Value: String);
begin

if (FlookTax <> Stripinvalides(Value) ) then
    begin
      FlookTax := Stripinvalides(Value);
      TaxDBTableView1.DataController.Filter.Active := false ;
      if FlookTax <> '' then
      begin
       TaxDBTableView1.DataController.Filter.Active := true ;
        TaxDBTableView1.DataController.Filter.Changed  ;
        if TaxDBTableView1.ViewData.RowCount > 0 then
        begin
           TaxDBTableView1.Controller.FocusedRecordIndex := 1 ;
        end;
      end;
   end;
end;

procedure TfmLookupgrids.SetPopUpNotify(const Value: TNotifyEvent);
begin
  FPopUpNotify := Value;
end;

procedure TfmLookupgrids.AccountDBTableView1DataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var Accept: Boolean);
begin
  Accept := True ;
  if FlookAccount <>'' then
   Accept := (pos(UpperCase(FlookAccount),UpperCase(VarToStr(ADataController.Values[ARecordIndex,AccountDBTableView1SACCOUNTCODE.Index]))) > 0)
             or (pos(UpperCase(FlookAccount),UpperCase(VarToStr(ADataController.Values[ARecordIndex,AccountDBTableView1SDESCRIPTION.Index]))) > 0) ;

end;

procedure TfmLookupgrids.cbAccountPropertiesCloseUp(Sender: TObject);
begin
 if Assigned(FCloseUpNotify) then
   FCloseUpNotify(sender);
end;

procedure TfmLookupgrids.cbAccountPropertiesInitPopup(Sender: TObject);
begin
 if Assigned(FPopUpNotify) then
   FPopUpNotify(sender);

end;

procedure TfmLookupgrids.ContraAccountDBTableView1DataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var Accept: Boolean);
begin

 if FlookContra ='' then
   Accept := true else

   Accept := (pos(UpperCase(FlookContra),UpperCase(VarToStr(ADataController.Values[ARecordIndex,ContraAccountDBTableView1SACCOUNTCODE.Index]))) > 0)
             or (pos(UpperCase(FlookContra),UpperCase(VarToStr(ADataController.Values[ARecordIndex,ContraAccountDBTableView1SDESCRIPTION.Index]))) > 0) ;
end;

procedure TfmLookupgrids.JobcodeDBTableView1DataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var Accept: Boolean);
begin
 if Flookjob ='' then
   Accept := true else
   
   Accept := (pos(UpperCase(Flookjob),UpperCase(VarToStr(ADataController.Values[ARecordIndex,JobcodeDBTableView1SJOBPROJECTCODE.Index]))) > 0)
             or (pos(UpperCase(Flookjob),UpperCase(VarToStr(ADataController.Values[ARecordIndex,JobcodeDBTableView1SDESCRIPTION.Index]))) > 0) ;
 
end;

procedure TfmLookupgrids.TaxDBTableView1DataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var Accept: Boolean);
begin
 if FlookTax ='' then
   Accept := true else
      Accept := (pos(UpperCase(FlookTax),UpperCase(VarToStr(ADataController.Values[ARecordIndex,TaxDBTableView1SACCOUNTCODE.Index]))) > 0)
             or (pos(UpperCase(FlookTax),UpperCase(VarToStr(ADataController.Values[ARecordIndex,TaxDBTableView1SDESCRIPTION.Index]))) > 0) ;
 
end;

procedure TfmLookupgrids.group1DBTableView1DataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var Accept: Boolean);
begin
 if FlookGroup1 ='' then
   Accept := true else
   Accept := (pos(UpperCase(FlookGroup1),UpperCase(VarToStr(ADataController.Values[ARecordIndex,group1DBTableView1SFULLDESC.Index]))) > 0) ;


end;

procedure TfmLookupgrids.group2DBTableView1DataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var Accept: Boolean);
begin

 if FlookGroup2 ='' then
   Accept := true else
   Accept := (pos(UpperCase(FlookGroup2),UpperCase(VarToStr(ADataController.Values[ARecordIndex,group2DBTableView1SFULLDESC.Index]))) > 0) ;
end;

procedure TfmLookupgrids.SetCloseUpNotify(const Value: TNotifyEvent);
begin
  FCloseUpNotify := Value;
end;

procedure TfmLookupgrids.datarefresh;
begin
  if TblAccount.Active then
   begin
      TblAccount.close ;
      TblAccount.Open ;
   end;
  if zqContrAccount.Active then
   begin
      zqContrAccount.close ;
      zqContrAccount.Open ;
   end;
  if zqTax.Active then
   begin
      zqTax.close ;
      zqTax.Open ;
   end;


end;

procedure TfmLookupgrids.TblAccountAfterOpen(DataSet: TDataSet);
begin
 DataSet.FieldByName('SACCOUNTCODE').OnGetText := TblAccountSACCOUNTCODEGetText ;
end;

function TfmLookupgrids.Stripinvalides(Avalue: String): String;
var
 i : Integer ;
begin
 Result := '' ;
   for i := 1to Length(Avalue) do
    if (ord(Avalue[i])   > 31) and (ord(Avalue[i]) < 128) then
      Result := Result + Avalue[i];

end;

end.
