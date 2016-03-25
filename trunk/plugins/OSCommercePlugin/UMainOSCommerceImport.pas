(*
  Id: UMainOSCommerceImport.pas,v 1 2004/09/20 23:27:52 Pieter Valentijn

  osFinancials , Open Source Accounting Solutions
  http://www.osfinancials.org

  Released under the GNU General Public License
*)
unit UMainOSCommerceImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus,DBTables, ExtCtrls,StdCtrls, Grids, DBGrids, ComCtrls,UDMOSCommerceImport,
  CheckLst, osfLookup, DBCtrls,uni  ;

type

  TMainOSCommerceImport = class(TForm)
    MainMenu1: TMainMenu;
    Connection1: TMenuItem;
    Login1: TMenuItem;
    PageControl1: TPageControl;
    TSOrders: TTabSheet;
    Panel3: TPanel;
    TSSettings: TTabSheet;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    DSOrders: TDataSource;
    DSStock: TDataSource;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet5: TTabSheet;
    Label6: TLabel;
    DTSincTime: TDateTimePicker;
    DTSincDate: TDateTimePicker;
    TVTax: TTreeView;
    PEditTaxDetail: TPanel;
    DSOrderProducts: TDataSource;
    TCSalesAccount: TComboBox;
    TCCostOfSalesACcount: TComboBox;
    TCStockAccount: TComboBox;
    TCTaxAccount: TComboBox;
    LgenOutputtax: TLabel;
    LSalesAccount: TLabel;
    LCOSAccount: TLabel;
    LStockAccount: TLabel;
    BSyncOrders: TButton;
    Button2: TButton;
    TCTaxAccountInput: TComboBox;
    LInputTaxAccount: TLabel;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    DSOrderTtotals: TDataSource;
    PProgress: TPanel;
    Label15: TLabel;
    PBProccess: TProgressBar;
    Lprocess: TLabel;
    PopupMenu1: TPopupMenu;
    Insert1: TMenuItem;
    Delete1: TMenuItem;
    POrdertotal: TPanel;
    CBType: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    EOrderTotalExactText: TEdit;
    Copy1: TMenuItem;
    TabSheet6: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    CBProductLang: TComboBox;
    CBProductBarcode: TComboBox;
    CBProductCur: TComboBox;
    EInvoicePrefix: TEdit;
    ECustomerPRefix: TEdit;
    EStockCodePrefix: TEdit;
    CBStatus: TCheckListBox;
    CBImportAsQuote: TCheckBox;
    CBResyncDateTime: TCheckBox;
    CBUpdateStockFromTC: TCheckBox;
    CBImportItemAttributesAsComment: TCheckBox;
    Logout1: TMenuItem;
    BSyncAll: TButton;
    BSyncOSCwithTC: TButton;
    CBExclusive: TCheckBox;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel5: TPanel;
    Label13: TLabel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    Label14: TLabel;
    DBGrid4: TDBGrid;
    Splitter2: TSplitter;
    BResave: TButton;
    CBUSeTaxRatesFromOrderProduct: TCheckBox;
    ELinkRate: TEdit;
    LELinkRate: TLabel;
    DTPSyncToTime: TDateTimePicker;
    DTSyncToDate: TDateTimePicker;
    StaticText1: TStaticText;
    Label21: TLabel;
    Label22: TLabel;
    MCountriesList: TMemo;
    CBDebtorAccount: TComboBox;
    CBDebtorGroup1: TComboBox;
    Label23: TLabel;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
    CBDebug: TCheckBox;
    Refresh: TButton;
    Label24: TLabel;
    EOrderTotalExactDesc: TEdit;
    Help1: TMenuItem;
    CBUseStockIDOnly: TCheckBox;
    TCGenSql: TTabSheet;
    MFreeSQL: TMemo;
    Panel6: TPanel;
    Panel7: TPanel;
    DSGen: TDataSource;
    DBGrid5: TDBGrid;
    DBNavigator1: TDBNavigator;
    Button4: TButton;
    Splitter3: TSplitter;
    TabSheet3: TTabSheet;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    MNotInTC: TMemo;
    MOutput: TMemo;
    Button7: TButton;
    TabSheet9: TTabSheet;
    Button9: TButton;
    MProcessThisList: TMemo;
    CBUseDocReportingGroup1: TCheckBox;
    ELinkOrdersUrl: TEdit;
    Label27: TLabel;
    ELinkCustUrl: TEdit;
    Label28: TLabel;
    BAutoUpdate: TButton;
    EInterval: TEdit;
    Label29: TLabel;
    TRunUpdateOrders: TTimer;
    CBImportStockGroups: TCheckBox;
    Button10: TButton;
    cbEditExistingItems: TCheckBox;
    Button11: TButton;
    BInputTaxAccount: TButton;
    BSalesAccount: TButton;
    BCOSAccount: TButton;
    BStockAccount: TButton;
    tsUSeInvoiceSorting: TTabSheet;
    cbUseInvoicesorting: TCheckBox;
    cbStockAvail: TComboBox;
    Label7: TLabel;
    cbStockNotAvial: TComboBox;
    Label8: TLabel;
    CbForceItems: TCheckBox;
    Button1: TButton;
    Label10: TLabel;
    LabelManual: TLabel;
    TabSheet10: TTabSheet;
    BConvertOldStockIdToSExternal: TButton;
    Button6: TButton;
    Button3: TButton;
    EOderNR: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Button5: TButton;
    PBTools: TProgressBar;
    Button8: TButton;
    EFromOrderNr: TEdit;
    CBMatchStockCode: TCheckBox;
    Button12: TButton;
    procedure FormShow(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure CBProductLangChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl1Change(Sender: TObject);
    procedure TVTaxChange(Sender: TObject; Node: TTreeNode);
    procedure TVTaxChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure BSyncOrdersClick(Sender: TObject);
    //procedure Button_3Click(Sender: TObject);
    procedure CBStatusClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure BSyncAllClick(Sender: TObject);
    procedure BSyncOSCwithTCClick(Sender: TObject);
    procedure BResaveClick(Sender: TObject);
    procedure DTSincDateChange(Sender: TObject);
    procedure CBDebugClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ELinkOrdersUrlDblClick(Sender: TObject);
    procedure ELinkCustUrlDblClick(Sender: TObject);
    procedure BAutoUpdateClick(Sender: TObject);
    procedure TRunUpdateOrdersTimer(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure TCTaxAccountDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BInputTaxAccountClick(Sender: TObject);
    procedure BSalesAccountClick(Sender: TObject);
    procedure BCOSAccountClick(Sender: TObject);
    procedure BStockAccountClick(Sender: TObject);
    procedure BConvertOldStockIdToSExternalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure LabelManualClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
     BStop : Boolean ;
     aFmLookup : TosfLookup ;
     procedure loadListboxes ;
     procedure LoadSettings(LoadDefault : Boolean )  ;
     procedure SaveSettings  ;
     procedure InitDateTimeQuerys ;
     procedure BuildTaxTree ;
     procedure InitList ;
     procedure BuildStatusList ;
     procedure SaveStatusList ;
     procedure LoadTaxDetail(ANode : TTreeNode) ;
     procedure SaveTaxDetail(ANode : TTreeNode) ;
     procedure AutoLogin ;
     procedure UpdateEventNotify(const AMin,Amax,Acurrent:Integer;const EventName : String ;const HasRecordInfo : Boolean ;var StopNow : boolean);
     function HasparentWithText(ANode : TTreeNode ;Atext: String) : Boolean ;
     procedure SpliTuniQuery(ASQL: String;var ASelect,AOrderBy,AGroupBy : String ) ;
    { Public declarations }
  end;

var
  MainOSCommerceImport: TMainOSCommerceImport;

function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;


implementation

uses ULoginMySql, ShellAPI,IniFiles, Math,StrUtils, UDMTCCoreLink,  DBAccess , OSFGeneralRoutines;

{$R *.dfm}

function OSFMenuPlugin(AApplicationHandle: THandle;AApplication: TApplication;AConnection:TUniconnection; InProcessFile,OutProcessFile :PChar) : TModalresult ; stdcall ;
 var
  AStrings : TStringList ;
begin


   AStrings := TStringList.create ;
   try
   AStrings.Text :=  InProcessFile ;
   // done : Get application icon

  { if  AApplication.FindComponent('skindata') <> nil then
     if AApplication.FindComponent('WINSKINMANAGER') <> nil then
        begin
       Winskindata.SkinDll(Pointer(AApplication.FindComponent('WINSKINMANAGER').tag));
     end;   }

  DMTCCoreLink := TDMTCCoreLink.create(nil);
   try
     DMTCCoreLink.AApplication :=  TComponent(AApplication) ;
     DMOSCommerceImport := TDMOSCommerceImport.Create(Application);
     MainOSCommerceImport := TMainOSCommerceImport.Create(Application);
    try
      result := MainOSCommerceImport.ShowModal ;
     finally
       FreeAndNil(DMOSCommerceImport) ;
       FreeAndNil(MainOSCommerceImport) ;
     end;
   finally
        FreeAndNil(DMTCCoreLink);
   end;  
   finally
   // dont let the DLL appication destroy the running osfinancials.
   AStrings.free ;
  // Application.Handle := 0 ;
   end;
end;


procedure TMainOSCommerceImport.AutoLogin ;
begin
    LoadSettings(True) ;
    DMOSCommerceImport.LoadSQL ;
    if DMOSCommerceImport.RemoteURL <> '' then
    DMOSCommerceImport.LoggedIn := DMOSCommerceImport.CheckLogin ;
    if DMOSCommerceImport.LoggedIn then
         begin
           loadListboxes ;
           LoadSettings(false) ;
           DMOSCommerceImport.InitAccountCodeLength ;
           DMOSCommerceImport.OpenTables ;
           PageControl1.Visible := true;
           BuildTaxTree ;
           BuildStatusList ;
         end;

end;

procedure TMainOSCommerceImport.FormShow(Sender: TObject);
var
 i : Integer;
begin


 PageControl1.ActivePageIndex := 0 ;
 PageControl2.ActivePageIndex := 0 ;
 if not DMTCCoreLink.TheZConnection.Connected then
    begin
    raise Exception.create('Open as set of books first!');
    close ;
    end;

 for i := 0 to DMOSCommerceImport.ComponentCount -1 do
    begin
       if DMOSCommerceImport.Components[i] is TuniTable then
          (DMOSCommerceImport.Components[i] as TuniTable).Connection := DMTCCoreLink.TheZConnection;
       if DMOSCommerceImport.Components[i] is TuniQuery then
          (DMOSCommerceImport.Components[i] as TuniQuery).Connection := DMTCCoreLink.TheZConnection;
    end;

  DMOSCommerceImport.WDataEntryNbrQty := DMTCCoreLink.ReadNwReportOp('WDataEntryNbrQty',2) ;
  DMOSCommerceImport.WDocRowDecimals  := DMTCCoreLink.ReadNwReportOp('WDocRowDecimals',4) ;

  AutoLogin ;
  ELinkOrdersUrl.text := DMTCCoreLink.ReadLongReportOp('OSCOMMERCEINVOICELINK') ;
  ELinkCustUrl.text :=   DMTCCoreLink.ReadLongReportOp('OSCOMMERCECUSTOMERLINK') ;
end;

procedure TMainOSCommerceImport.loadListboxes;

begin
   DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZLanguage,DMOSCommerceImport.SQLLanguage.Text);
 //  DMOSCommerceImport.ZLanguage.open ;
   CBProductLang.Clear ;
   while not DMOSCommerceImport.ZLanguage.Eof do
     begin
       CBProductLang.AddItem(DMOSCommerceImport.ZLanguage.fieldByName('name').Asstring,TObject(DMOSCommerceImport.ZLanguage.fieldByName('languages_id').AsInteger));
       DMOSCommerceImport.ZLanguage.next ;
     end;
   DMOSCommerceImport.ZLanguage.Close ;
   CBProductLang.ItemIndex := CBProductLang.Items.Count -1 ;
   DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZCurrencies,DMOSCommerceImport.SQLCurrencies.Text);
   CBProductCur.Clear ;
   while not DMOSCommerceImport.ZCurrencies.Eof do
     begin
       CBProductCur.AddItem(DMOSCommerceImport.ZCurrencies.fieldByName('title').Asstring,TObject(DMOSCommerceImport.ZCurrencies.fieldByName('currencies_id').AsInteger));
       DMOSCommerceImport.ZCurrencies.next ;
     end;
   DMOSCommerceImport.ZCurrencies.Close ;
   CBProductCur.ItemIndex := CBProductCur.Items.Count -1 ;
   CBProductLangChange(self);
end;

procedure TMainOSCommerceImport.Login1Click(Sender: TObject);
var
  LoginMySql: TLoginMySql;
begin
  if DMOSCommerceImport.LoggedIn then
     begin
     SaveTaxDetail(TVTax.Selected);
     SaveSettings ;
     end;
   DMOSCommerceImport.LoggedIn := false ;
   LoginMySql:= TLoginMySql.Create(self);
   try
    LoadSettings(false) ;
      if LoginMySql.ShowModal = mrok then
         begin
           DMOSCommerceImport.InitAccountCodeLength ;
           DMOSCommerceImport.OpenTables ;
           loadListboxes ;
           LoadSettings(false) ;
           PageControl1.Visible := true;
           PageControl1.ActivePageIndex := 0 ;
           BuildTaxTree ;
           BuildStatusList ;
         end;
   finally
      LoginMySql.free ;
   end;
end;

procedure TMainOSCommerceImport.CBProductLangChange(Sender: TObject);
begin
   CBProductBarcode.Clear ;
   if CBProductLang.ItemIndex = -1 then exit ;
   DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQOptions,Format(DMOSCommerceImport.SQLOptions.Text,[IntToStr(Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]))]));
   while not DMOSCommerceImport.ZQOptions.Eof do
     begin
       CBProductBarcode.AddItem(DMOSCommerceImport.ZQOptions.fieldByName('products_options_name').Asstring,TObject(DMOSCommerceImport.ZQOptions.fieldByName('products_options_id').AsInteger));
       DMOSCommerceImport.ZQOptions.next ;
     end;
   CBProductBarcode.AddItem('Empty',Tobject(-1));
   CBProductBarcode.ItemIndex := CBProductBarcode.Items.Count -1 ;
   DMOSCommerceImport.ZQOptions.Close ;
   if CBProductLang.ItemIndex <> -1 then
  begin
  DMOSCommerceImport.OSCLinks.CBProductLang := Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]) ;
  // if CBStatus.Items.Count = 0 then
  BuildStatusList
  end;
end;

procedure TMainOSCommerceImport.LoadSettings(LoadDefault : Boolean );
var

 APreFix : String ;
begin
 if not DMOSCommerceImport.LoggedIn then
   begin
     DMOSCommerceImport.LoadIni(LoadDefault) ;
   end;
if DMOSCommerceImport.LoggedIn then
begin
APreFix := '';
if DMOSCommerceImport.LoginIndex <> 0 then
   APreFix := IntToStr(DMOSCommerceImport.LoginIndex);
DMOSCommerceImport.LoadOSCLinks(DMTCCoreLink.GetLocalSaveDir + APreFix + 'OSC_default.dfm');
InitList ;
try
CBProductLang.ItemIndex := CBProductLang.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.CBProductLang)) ;
except

end;
CBProductCur.ItemIndex := CBProductCur.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.CBProductCur)) ;
EInvoicePrefix.text := DMOSCommerceImport.OSCLinks.EInvoicePrefix  ;
ECustomerPRefix.text := DMOSCommerceImport.OSCLinks.ECustomerPRefix ;
EStockCodePrefix.text := DMOSCommerceImport.OSCLinks.EStockCodePrefix ;
DTSincDate.Date   :=  DMOSCommerceImport.OSCLinks.DTSincDate ;
DTSyncToDate.Date   := date +30 ;
DTSincTime.Time   :=  DMOSCommerceImport.OSCLinks.DTSincTime ;
CBImportAsQuote.Checked := DMOSCommerceImport.OSCLinks.CBImportAsQuote ;
CBResyncDateTime.Checked := DMOSCommerceImport.OSCLinks.CBResyncDateTime ;
CBImportItemAttributesAsComment.Checked := DMOSCommerceImport.OSCLinks.CBImportItemAttributesAsComment ;
CBUSeTaxRatesFromOrderProduct.Checked := DMOSCommerceImport.OSCLinks.CBUSeTaxRatesFromOrderProduct ;
CBUpdateStockFromTC.Checked := DMOSCommerceImport.OSCLinks.CBUpdateStockFromTC ;
MCountriesList.Text :=  DMOSCommerceImport.OSCLinks.CountiesList.Text ;
CBUseStockIDOnly.Checked := DMOSCommerceImport.OSCLinks.UseStockIDOnly ;
CBUseDocReportingGroup1.Checked :=  DMOSCommerceImport.OSCLinks.UseDocReportingGroup1 ;
CBImportStockGroups.Checked :=  DMOSCommerceImport.OSCLinks.ImportStockGroups ;
cbEditExistingItems.Checked  := DMOSCommerceImport.OSCLinks.EditExistingItems;
CBDebtorGroup1.ItemIndex := CBDebtorGroup1.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.DebtorGroup1Id)) ;
 if CBDebtorGroup1.ItemIndex = -1 then
    CBDebtorGroup1.ItemIndex := 0 ;

cbUseInvoicesorting.Checked := DMOSCommerceImport.OSCLinks.UseInvoiceGroupSort ;

    cbStockAvail.ItemIndex := cbStockAvail.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.DocGroupStockAvail)) ;
 if cbStockAvail.ItemIndex = -1 then
    cbStockAvail.ItemIndex := 0 ;


    cbStockNotAvial.ItemIndex := cbStockNotAvial.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.DocGroupStockNotAvail)) ;
 if cbStockNotAvial.ItemIndex = -1 then
    cbStockNotAvial.ItemIndex := 0 ;



CBDebtorAccount.ItemIndex := CBDebtorAccount.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.DefaultAccountDebtorNotInCountyList)) ;
 if CBDebtorAccount.ItemIndex = -1 then
    CBDebtorAccount.ItemIndex := 0 ;

end;
end;

procedure TMainOSCommerceImport.SaveSettings;
     var
      APreFix : String ;
begin
DMOSCommerceImport.SaveIni ;
APreFix := '' ;

if DMOSCommerceImport.LoginIndex <> 0 then
 APreFix := IntToStr(DMOSCommerceImport.LoginIndex);

if not DMOSCommerceImport.CheckLogin then exit ;
try
if CBProductLang.ItemIndex <> -1 then
DMOSCommerceImport.OSCLinks.CBProductLang := Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]) ;
except

end;
if CBProductCur.ItemIndex <> -1 then
DMOSCommerceImport.OSCLinks.CBProductCur := Integer(CBProductCur.Items.Objects[CBProductCur.ItemIndex]) ;
DMOSCommerceImport.OSCLinks.DTSincDate := DTSincDate.Date ;
DMOSCommerceImport.OSCLinks.DTSincTime := DTSincTime.Time ;
DMOSCommerceImport.OSCLinks.EInvoicePrefix := EInvoicePrefix.text  ;
DMOSCommerceImport.OSCLinks.ECustomerPRefix := ECustomerPRefix.text ;
DMOSCommerceImport.OSCLinks.EStockCodePrefix := EStockCodePrefix.text ;
DMOSCommerceImport.OSCLinks.CBImportAsQuote :=  CBImportAsQuote.Checked;
DMOSCommerceImport.OSCLinks.CBResyncDateTime :=  CBResyncDateTime.Checked;
DMOSCommerceImport.OSCLinks.CBImportItemAttributesAsComment := CBImportItemAttributesAsComment.Checked ;
DMOSCommerceImport.OSCLinks.CBUSeTaxRatesFromOrderProduct := CBUSeTaxRatesFromOrderProduct.Checked  ;
DMOSCommerceImport.OSCLinks.CBUpdateStockFromTC := CBUpdateStockFromTC.Checked ;
DMOSCommerceImport.OSCLinks.CountiesList.Text := MCountriesList.Text ;
DMOSCommerceImport.OSCLinks.UseStockIDOnly :=  CBUseStockIDOnly.Checked;

DMOSCommerceImport.OSCLinks.UseDocReportingGroup1 := CBUseDocReportingGroup1.Checked ;
DMOSCommerceImport.OSCLinks.ImportStockGroups := CBImportStockGroups.Checked ;
DMOSCommerceImport.OSCLinks.EditExistingItems := cbEditExistingItems.Checked ;
DMOSCommerceImport.OSCLinks.DefaultAccountDebtorNotInCountyList :=0 ;

DMOSCommerceImport.OSCLinks.UseInvoiceGroupSort := cbUseInvoicesorting.Checked ;

DMOSCommerceImport.OSCLinks.DocGroupStockAvail := 0 ;
if cbStockAvail.ItemIndex > 0 then
   DMOSCommerceImport.OSCLinks.DocGroupStockAvail := Integer(cbStockAvail.Items.objects[cbStockAvail.ItemIndex]);

DMOSCommerceImport.OSCLinks.DocGroupStockNotAvail := 0 ;
if cbStockNotAvial.ItemIndex > 0 then
   DMOSCommerceImport.OSCLinks.DocGroupStockNotAvail := Integer(cbStockNotAvial.Items.objects[cbStockNotAvial.ItemIndex]);


DMTCCoreLink.WriteSysParam('STO_USEINVGRSORT',booltostr(DMOSCommerceImport.OSCLinks.UseInvoiceGroupSort));
DMTCCoreLink.WriteSysParam('STO_STOCKAVAIL',IntToStr(DMOSCommerceImport.OSCLinks.DocGroupStockAvail));
DMTCCoreLink.WriteSysParam('STO_STOCKNOTAVAIL',IntToStr(DMOSCommerceImport.OSCLinks.DocGroupStockNotAvail));


DMOSCommerceImport.OSCLinks.DebtorGroup1Id := 0 ;
if CBDebtorGroup1.ItemIndex > 0 then
 DMOSCommerceImport.OSCLinks.DebtorGroup1Id := Integer(CBDebtorGroup1.Items.objects[CBDebtorGroup1.ItemIndex]);

if CBDebtorAccount.ItemIndex <> -1 then
  DMOSCommerceImport.OSCLinks.DefaultAccountDebtorNotInCountyList := Integer(CBDebtorAccount.Items.objects[CBDebtorAccount.ItemIndex]);
DMOSCommerceImport.SaveOSCLinks(DMTCCoreLink.GetLocalSaveDir + APreFix + 'OSC_default.dfm');

end;

procedure TMainOSCommerceImport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DMTCCoreLink.WriteLongReportOp('OSCOMMERCEINVOICELINK',ELinkOrdersUrl.text) ;
DMTCCoreLink.WriteLongReportOp('OSCOMMERCECUSTOMERLINK',ELinkCustUrl.text) ;



try
  if DMOSCommerceImport.LoggedIn then
     begin

     SaveTaxDetail(TVTax.Selected);
     SaveSettings ;
     end;
except
end;

end;

procedure TMainOSCommerceImport.InitDateTimeQuerys;
Var
 RunFromDateTime : TDateTime ;
 RunToDateTime   : TDateTime ;
 LangID : Integer ;
begin
 if DMOSCommerceImport.OSCLinks.StatusLink.GetSepList(',') = '' then
   begin
      PageControl1.ActivePageIndex := 0 ;
      raise Exception.Create('U need to check atleast one status!');
   end;
 LangID := 1 ;
 if not DMOSCommerceImport.LoggedIn then exit ;
 RunFromDateTime := round(DTSincDate.Date) + (DTSincTime.Time - round(DTSincTime.Time)) ;
 if CBProductLang.ItemIndex <> -1 then
 LangID :=  Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]);
 DMOSCommerceImport.ZQProducts.close ;
 RunToDateTime :=  round(DTSyncToDate.Date) + (DTPSyncToTime.Time - round(DTPSyncToTime.Time)) ;

 DMOSCommerceImport.GlFromDate := RunFromDateTime ;
 DMOSCommerceImport.GlToDate   := RunToDateTime ;
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQProducts,format(DMOSCommerceImport.SQLProducts.Text,[IntTOStr(LangID),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime)]));
 DMOSCommerceImport.ZQOrders.Close ;
 DMOSCommerceImport.ZOrderProducts.Close ;
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQOrders,format(DMOSCommerceImport.SQLOrders.Text,[DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.OSCLinks.StatusLink.GetSepList(','),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime)]));
 DMOSCommerceImport.ZQOrders.first ;
end;

procedure TMainOSCommerceImport.PageControl1Change(Sender: TObject);
begin
   if (PageControl1.ActivePage <> TSSettings)  then
   begin
   SaveTaxDetail(TVTax.Selected);
   SaveSettings ;
   InitDateTimeQuerys ;
   end;
   if sender = nil then
     begin
      SaveTaxDetail(TVTax.Selected);
      SaveSettings ;
      InitDateTimeQuerys ;
     end ;

end;

procedure TMainOSCommerceImport.BuildTaxTree;
var
 AItem : TTaxLinksItem ;
 i : Integer ;
 FoundDeletedTaxes : Boolean ;
 AMain : TTreeNode ;
begin
 TVTax.Items.Clear ;
 AMain :=  TVTax.Items.AddObjectFirst(nil,'Default tax',nil);
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQUniqueTaxCode,DMOSCommerceImport.SQLUniqueTaxCode.Text);
 DMOSCommerceImport.OSCLinks.ClearFoundTaxes ;
 while not DMOSCommerceImport.ZQUniqueTaxCode.eof do
   begin
   AItem :=  DMOSCommerceImport.OSCLinks.FindTaxLink(DMOSCommerceImport.ZQUniqueTaxCode.Fields[0].Asinteger);

    If AItem = nil then
    begin
       AItem := TTaxLinksItem(DMOSCommerceImport.OSCLinks.TaxLink.Add) ;
       AItem.OSCTaxId := DMOSCommerceImport.ZQUniqueTaxCode.Fields[0].Asinteger ;
    end;
     AItem.OSCTaxName := DMOSCommerceImport.ZQUniqueTaxCode.Fields[1].AsString ;
    AItem.TaxFound := true ;
    DMOSCommerceImport.ZQUniqueTaxCode.Next ;
   end;
 DMOSCommerceImport.ZQUniqueTaxCode.Close ;

 AItem :=  DMOSCommerceImport.OSCLinks.FindTaxLink(-2) ;
 if AItem = nil then
    begin
       AItem := TTaxLinksItem(DMOSCommerceImport.OSCLinks.TaxLink.Add) ;
       AItem.OSCTaxId := -2 ;
       AItem.OSCTaxName := 'UnownTax' ;
    end ;
 AItem.TaxFound := true ;


 FoundDeletedTaxes := false ;

 for i := DMOSCommerceImport.OSCLinks.TaxLink.Count -1 downto 0 do
   begin
      FoundDeletedTaxes := (not DMOSCommerceImport.OSCLinks.TaxLink[i].TaxFound) or (FoundDeletedTaxes);
      if not DMOSCommerceImport.OSCLinks.TaxLink[i].TaxFound then
         DMOSCommerceImport.OSCLinks.TaxLink.Delete(i);
   end ;
 if FoundDeletedTaxes then raise Exception.create('The taxes have been deleted please check taxes setup');
 // build treeview
 for i := 0 to DMOSCommerceImport.OSCLinks.TaxLink.Count -1 do
   begin
      TVTax.Items.AddChildObject(AMain,DMOSCommerceImport.OSCLinks.TaxLink[i].OSCTaxName,DMOSCommerceImport.OSCLinks.TaxLink[i]) ;
   end ;
  AMain :=  TVTax.Items.AddObjectFirst(nil,OrderTotalText,nil);

  for i := 0 to DMOSCommerceImport.OSCLinks.OTTaxLink.Count -1 do
    begin
       TVTax.Items.AddChildObject(AMain,DMOSCommerceImport.OSCLinks.OTTaxLink[i].OSCTaxName,DMOSCommerceImport.OSCLinks.OTTaxLink[i]);
    end ;


end;

procedure TMainOSCommerceImport.TVTaxChange(Sender: TObject;
  Node: TTreeNode);
begin
PEditTaxDetail.Visible := TVTax.Selected <> nil ;
POrdertotal.Visible := HasparentWithText(TVTax.Selected,OrderTotalText) ;
ELinkRate.Visible :=  not POrdertotal.Visible ;
LELinkRate.Visible := not POrdertotal.Visible ;
LoadTaxDetail(TVTax.Selected);
if (TVTax.Selected = nil ) or (TVTax.Selected.Data = nil ) then
  begin
     PEditTaxDetail.Visible := false ;
     POrdertotal.Visible := false ;
  end else
  begin
     PEditTaxDetail.Visible := true ;
  end;
end;

procedure TMainOSCommerceImport.TVTaxChanging(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
begin
SaveTaxDetail(TVTax.Selected);
end;

procedure TMainOSCommerceImport.LoadTaxDetail(ANode: TTreeNode);
var
   AItem : TTaxLinksItem ;
begin
  if ANode = nil then exit ;
  if ANode.Data = nil then exit ;
  AItem := TTaxLinksItem(ANode.data);
  TCTaxAccount.ItemIndex := TCTaxAccount.Items.IndexOfObject(TObject(AItem.TCTaxID)) ;
  TCSalesAccount.ItemIndex := TCSalesAccount.Items.IndexOfObject(TObject(AItem.SalesAccount)) ;
  TCCostOfSalesACcount.ItemIndex := TCCostOfSalesACcount.Items.IndexOfObject(TObject(AItem.CostOfSaleAccount)) ;
  TCStockAccount.ItemIndex := TCStockAccount.Items.IndexOfObject(TObject(AItem.StockAccount)) ;
  TCTaxAccountInput.ItemIndex := TCTaxAccountInput.Items.IndexOfObject(TObject(AItem.TCTaxInput)) ;
  eLinkRate.Text := floatToStr(AItem.LinkRate);
  if HasparentWithText(ANode,OrderTotalText) then
    begin
       CBType.ItemIndex := AItem.OSCTaxId ;
       EOrderTotalExactText.Text := AItem.OSCTaxName ;
       CBExclusive.Checked := not AItem.Exclusive ;
       EOrderTotalExactDesc.Text := AItem.OSCTaxDesc ;
    end;
end;


procedure TMainOSCommerceImport.SaveTaxDetail(ANode: TTreeNode);
var
   AItem : TTaxLinksItem ;
begin
 if ANode = nil then exit ;
 if ANode.Data = nil then exit ;
 AItem := TTaxLinksItem(ANode.data);
 if TCTaxAccount.ItemIndex <> -1 then
 AItem.TCTaxID :=  Integer(TCTaxAccount.Items.Objects[TCTaxAccount.ItemIndex]);
 if TCSalesAccount.ItemIndex <> -1 then
 AItem.SalesAccount :=  Integer(TCSalesAccount.Items.Objects[TCSalesAccount.ItemIndex]);
 if TCCostOfSalesACcount.ItemIndex <> -1 then
 AItem.CostOfSaleAccount :=  Integer(TCCostOfSalesACcount.Items.Objects[TCCostOfSalesACcount.ItemIndex]);
 if TCStockAccount.ItemIndex <> -1 then
 AItem.StockAccount :=  Integer(TCStockAccount.Items.Objects[TCStockAccount.ItemIndex]);
 if TCTaxAccountInput.ItemIndex <> -1 then
 AItem.TCTaxInput :=  Integer(TCTaxAccountInput.Items.Objects[TCTaxAccountInput.ItemIndex]);
 AItem.LinkRate := StrToFloat(eLinkRate.Text) ;


  if HasparentWithText(ANode,OrderTotalText) then
    begin
       AItem.OSCTaxId := CBType.ItemIndex ;
       AItem.OSCTaxName  := EOrderTotalExactText.Text;
       AItem.Exclusive :=  not CBExclusive.Checked ;
       anode.Text := EOrderTotalExactText.Text ;
       AItem.OSCTaxDesc := EOrderTotalExactDesc.Text ;
    end;
end;

procedure TMainOSCommerceImport.Button2Click(Sender: TObject);
Var
 RunFromDateTime : TDateTime ;
 RunToDateTime   : TDateTime ;
 LangID : Integer ;
begin
DMOSCommerceImport.ForceCheckCode := CBMatchStockCode.Checked ;
DMOSCommerceImport.ZQAllCatProducts.close ;
BStop := false ;
 LangID := 1 ;
 if not DMOSCommerceImport.LoggedIn then exit ;
 RunFromDateTime := round(DTSincDate.Date) + (DTSincTime.Time - round(DTSincTime.Time)) ;
 if CBProductLang.ItemIndex <> -1 then
 LangID :=  Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]);
 DMOSCommerceImport.ZQProducts.close ;
 RunToDateTime :=  round(DTSyncToDate.Date) + (DTPSyncToTime.Time - round(DTPSyncToTime.Time)) ;
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQProducts,format(DMOSCommerceImport.SQLProducts.Text,[IntTOStr(LangID),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime)]));

PProgress.Visible := true ;
try
SaveTaxDetail(TVTax.Selected);
SaveSettings ;
DMOSCommerceImport.SyncStock ;
finally
   PProgress.Visible := False ;
end;

end;

procedure TMainOSCommerceImport.BSyncOrdersClick(Sender: TObject);

begin
if not DMTCCoreLink.IsRegistered('{B86E38FC-604C-4E49-BC61-40073FDCC5CC}') then
   raise Exception.Create('Unregistered please register !');

//DMOSCommerceImport.OSCLinks.SettingsVersion := 0 ;
DMOSCommerceImport.ForceCheckCode := CBMatchStockCode.Checked ;
if DMOSCommerceImport.OSCLinks.SettingsVersion = 0 then
   begin
     DMOSCommerceImport.OSCLinks.SettingsVersion := 1 ;
     if MessageDlg('If you have a exsisting shop please convert the stock data with '+#13#10 +
     '"Convert old stock to new id" if you continue this will be done else no action will be taken.',mtConfirmation,[mbyes,mbno],0) = mryes
     then 
      BConvertOldStockIdToSExternalClick(self)
     else
     exit ;
   end;
  BStop := false ;
  PProgress.Visible := true ;


    SaveTaxDetail(TVTax.Selected);
    SaveSettings ;
    InitDateTimeQuerys ;

    DMOSCommerceImport.SyncStock ;
    DMOSCommerceImport.SyncOrders ;



    if CBUpdateStockFromTC.Checked then
       begin
         DMOSCommerceImport.ReSyncOSCWithTCStock(false) ;
       end;
    DMOSCommerceImport.CloseConnection ;
    DTSincTime.Time := DMOSCommerceImport.OSCLinks.DTSincTime ;
    DTSincDate.date := DMOSCommerceImport.OSCLinks.DTSincDate ;
    if DMOSCommerceImport.OSCLinks.CBResyncDateTime then
      begin
         DTSyncToDate.Date := Date + 30 ;
      end;

    PProgress.Visible := false ;

end;

procedure TMainOSCommerceImport.FormCreate(Sender: TObject);
Var
 TC3Path :  string ;
 TurboiniFile:TIniFile;
begin
  aFmLookup := TosfLookup.Create(nil) ;
  aFmLookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
  aFmLookup.aOSAConnectionItem := DMTCCoreLink.TheOSAConnectionItem ;
  
 TC3Path :=  ExtractFilePath(Application.ExeName) ;
 TC3Path := LowerCase(TC3Path);
 if pos('plug_ins',TC3Path) <> 0 then
    TC3Path := Copy(TC3Path,1,pos('plug_ins',TC3Path)-1);
 if FileExists(IncludeTrailingPathDelimiter(TC3Path) + 'OSF.ini') then
    begin
       TurboiniFile := TIniFile.Create(IncludeTrailingPathDelimiter(TC3Path) + 'OSF.ini');
       try
           if TurboiniFile.ReadString('DEFPLUGIN','PATH','') = '' then
             begin
               TurboiniFile.WriteString('DEFPLUGIN','PATH',ExtractFileName(GetModuleName(HInstance)));
               TurboiniFile.WriteString('DEFPLUGIN','CAPTION','OSC-Import');
             end;
       finally
        TurboiniFile.Free;
       end;
    end;
 DMOSCommerceImport.UpdateEventNotify := UpdateEventNotify ;
 DSOrderProducts.DataSet :=  DMOSCommerceImport.ZOrderProducts ;
 DSGen.DataSet :=  DMOSCommerceImport.CDGen ;
 DSOrderTtotals.DataSet :=  DMOSCommerceImport.ZQOrdersTotal ;
 DSOrders.DataSet :=  DMOSCommerceImport.ZQOrders ;
 DSStock.DataSet :=  DMOSCommerceImport.ZQProducts ;
 SetWindowLong(Handle, gwl_ExStyle, GetWindowLong(Handle, gwl_ExStyle) or WS_EX_APPWINDOW);
end;

procedure TMainOSCommerceImport.UpdateEventNotify(const AMin, Amax,
  Acurrent: Integer; const EventName: String; const HasRecordInfo: Boolean;
  var StopNow: boolean);
begin
   Lprocess.Caption := EventName + ' ' + IntToStr(Acurrent) + '/' +  IntToStr(Amax)  ;
   PBProccess.Max := Amax ;
   PBProccess.Min := AMin ;

   PBProccess.Position := Acurrent ;
   Application.ProcessMessages ;
   if BStop then raise Exception.Create('Canceled by user!');
end;

{
procedure TMainOSCommerceImport.Button_3Click(Sender: TObject);
begin
PProgress.Visible := true ;
SaveTaxDetail(TVTax.Selected);
SaveSettings ;
if CBUpdateStockFromTC.Checked then
   begin
     DMOSCommerceImport.ReSyncOSCWithTCStock ;
   end;
DMOSCommerceImport.CloseConnection ;
PProgress.Visible := false ;

end;
 }
procedure TMainOSCommerceImport.BuildStatusList;
var
 i : Integer ;
begin
 CBStatus.Clear ;
 DMOSCommerceImport.ZStatus.Close ;
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZStatus,format(DMOSCommerceImport.SQLStatus.Text,[IntTOStr(DMOSCommerceImport.OSCLinks.CBProductLang)]));
// DMOSCommerceImport.ZStatus.Params[0].AsInteger := DMOSCommerceImport.OSCLinks.CBProductLang ;
// DMOSCommerceImport.ZStatus.Open ;
 while not DMOSCommerceImport.ZStatus.Eof do
   begin
    CBStatus.AddItem(DMOSCommerceImport.ZStatus.fieldByName('orders_status_name').AsString,TObject(DMOSCommerceImport.ZStatus.fieldByName('orders_status_id').AsInteger));
    DMOSCommerceImport.ZStatus.Next ;
   end;
 for i := 0 to DMOSCommerceImport.OSCLinks.StatusLink.Count -1 do
   begin
      if CBStatus.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.StatusLink[i].ID)) <> -1 then
        begin
          CBStatus.Checked[CBStatus.Items.IndexOfObject(TObject(DMOSCommerceImport.OSCLinks.StatusLink[i].ID))] :=  true ;
        end;
   end;
end;

procedure TMainOSCommerceImport.SaveStatusList;
var
 i : Integer ;
begin
  DMOSCommerceImport.OSCLinks.StatusLink.Clear ;
  For i := 0 to CBStatus.Count -1 do
  if CBStatus.Checked[i] then
   begin
      with DMOSCommerceImport.OSCLinks.StatusLink.Add as TIDLinkItem do
       begin
          ID := Integer(CBStatus.Items.Objects[i]);
       end
   end;
end;

procedure TMainOSCommerceImport.CBStatusClick(Sender: TObject);
begin
if DMOSCommerceImport.LoggedIn then
   SaveStatusList ;
end;

function TMainOSCommerceImport.HasparentWithText(ANode : TTreeNode ;Atext: String): Boolean;
var
  AParent : TTreeNode ;
begin
  result := false ;
  if  ANode = nil then exit ;
  AParent := ANode ;
  while  AParent.Parent <> nil do
     AParent := AParent.Parent ;
   result :=  AParent.Text = Atext;
end;

procedure TMainOSCommerceImport.PopupMenu1Popup(Sender: TObject);
begin
  PopupMenu1.Items[0].Visible :=  HasparentWithText(TVTax.Selected,OrderTotalText);
  PopupMenu1.Items[1].Visible := PopupMenu1.Items[0].Visible ;
  PopupMenu1.Items[2].Visible := PopupMenu1.Items[0].Visible ;
end;

procedure TMainOSCommerceImport.Insert1Click(Sender: TObject);
var
 ANode : TTreeNode ;
begin
 if TVTax.Selected.Parent = nil  then
 ANode := TVTax.Selected 
 else
 ANode := TVTax.Selected.Parent ;

 TVTax.Items.AddChildObject(ANode,'New',DMOSCommerceImport.OSCLinks.OTTaxLink.Add).Selected := true ;
 EOrderTotalExactText.Text := 'New' ;

end;

procedure TMainOSCommerceImport.Delete1Click(Sender: TObject);
begin
  if TVTax.Selected.Parent = nil  then exit ;

  DMOSCommerceImport.OSCLinks.OTTaxLink.Delete(TTaxLinksItem(TVTax.Selected.Data).Index);
  TVTax.Selected.Delete ;
end;

procedure TMainOSCommerceImport.Copy1Click(Sender: TObject);
var
   AItem,BItem : TTaxLinksItem ;
begin
  if TVTax.Selected.Parent = nil  then exit ;
   bItem := TTaxLinksItem(TVTax.Selected.Data);
  Insert1Click(self);
   aItem := TTaxLinksItem(TVTax.Selected.Data);
  AItem.OSCTaxId := BItem.OSCTaxId ;
  AItem.TCTaxID := BItem.TCTaxID ;
  AItem.TCTaxInput := BItem.TCTaxInput ;
  AItem.SalesAccount := BItem.SalesAccount ;
  AItem.CostOfSaleAccount := BItem.CostOfSaleAccount ;
  AItem.StockAccount := BItem.StockAccount ;
  AItem.OSCTaxName := 'Copy';
  TVTax.Selected.Text := 'Copy';
  LoadTaxDetail(TVTax.Selected);
end;

procedure TMainOSCommerceImport.Logout1Click(Sender: TObject);
begin
try
  if DMOSCommerceImport.LoggedIn then
     begin
     SaveTaxDetail(TVTax.Selected);
     SaveSettings ;
     end;
except
end;
DMOSCommerceImport.LoggedIn := false ;
PageControl1.Visible := false;
end;

procedure TMainOSCommerceImport.BSyncAllClick(Sender: TObject);

begin
DMOSCommerceImport.ForceCheckCode := CBMatchStockCode.Checked ;
BStop := false ;
SaveTaxDetail(TVTax.Selected);
SaveSettings ;
PProgress.Visible := true ;
end;

procedure TMainOSCommerceImport.BSyncOSCwithTCClick(Sender: TObject);
Var
 RunFromDateTime : TDateTime ;
 RunToDateTime   : TDateTime ;
begin
  RunFromDateTime := round(DTSincDate.Date) + (DTSincTime.Time - round(DTSincTime.Time)) ;
  RunToDateTime :=  round(DTSyncToDate.Date) + (DTPSyncToTime.Time - round(DTPSyncToTime.Time)) ;
  DMOSCommerceImport.GlFromDate := RunFromDateTime ;
  DMOSCommerceImport.GlToDate   := RunToDateTime ;
  BStop := false ;
  DMOSCommerceImport.ForceCheckCode := CBMatchStockCode.Checked ;
  if MessageDlg('This wil update the current stock level from osFinancials to the remote database are you sure you want to continue?',mtConfirmation,[mbyes,mbno],0) = mrno then
   exit ;

  try
  DMOSCommerceImport.ReSyncOSCWithTCStock(CbForceItems.Checked) ;
  except
     on E : Exception do
       showmessage(e.Message);
  end;
end;

procedure TMainOSCommerceImport.BResaveClick(Sender: TObject);
begin
try
if CBProductLang.ItemIndex <> -1 then
DMOSCommerceImport.OSCLinks.CBProductLang := Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]) ;
except

end;
if CBProductCur.ItemIndex <> -1 then
DMOSCommerceImport.OSCLinks.CBProductCur := Integer(CBProductCur.Items.Objects[CBProductCur.ItemIndex]) ;
DMOSCommerceImport.OSCLinks.DTSincDate := DTSincDate.Date ;
DMOSCommerceImport.OSCLinks.DTSincTime := DTSincTime.Time ;
DMOSCommerceImport.OSCLinks.EInvoicePrefix := EInvoicePrefix.text  ;
DMOSCommerceImport.OSCLinks.ECustomerPRefix := ECustomerPRefix.text ;
DMOSCommerceImport.OSCLinks.EStockCodePrefix := EStockCodePrefix.text ;
DMOSCommerceImport.OSCLinks.CBImportAsQuote :=  CBImportAsQuote.Checked;
DMOSCommerceImport.OSCLinks.CBResyncDateTime :=  CBResyncDateTime.Checked;
DMOSCommerceImport.OSCLinks.CBImportItemAttributesAsComment := CBImportItemAttributesAsComment.Checked ;
DMOSCommerceImport.OSCLinks.CBUpdateStockFromTC := CBUpdateStockFromTC.Checked ;
DMOSCommerceImport.SaveOSCLinks(DMTCCoreLink.GetLocalSaveDir + 'OSC_default.dfm');
end;

procedure TMainOSCommerceImport.DTSincDateChange(Sender: TObject);
begin
 if DTSyncToDate.Date <  DTSincDate.date then
 DTSyncToDate.Date :=  DTSincDate.date + 30 ;
end;

procedure TMainOSCommerceImport.InitList;
begin
  TCSalesAccount.Clear ;
  TCCostOfSalesACcount.Clear ;
  TCStockAccount.Clear ;
  TCTaxAccount.Clear ;
  CBDebtorAccount.Clear ;
  CBDebtorGroup1.Clear ;
  cbStockNotAvial.Clear ;
  cbStockAvail.Clear ;

  TDataBaseRoutines.FillStringsWithReportingGroups(cbStockNotAvial.Items,29);
  if cbStockNotAvial.Items.Count = 0 then
     cbStockNotAvial.Items.Insert(0,DMTCCoreLink.GetTextLang(20046));

   TDataBaseRoutines.FillStringsWithReportingGroups(cbStockAvail.Items,29);
  if cbStockAvail.Items.Count = 0 then
     cbStockAvail.Items.Insert(0,DMTCCoreLink.GetTextLang(20046));

  // tax accounts

  DMOSCommerceImport.QAccountsLookups.sql.text := 'Select * from account where WAccountTypeID = 4 order by SDescription';
  DMOSCommerceImport.QAccountsLookups.open ;
  while not DMOSCommerceImport.QAccountsLookups.eof do
   begin
     TCTaxAccount.AddItem(DMOSCommerceImport.QAccountsLookups.FieldByName('SDescription').AsString + '-' + DMOSCommerceImport.QAccountsLookups.FieldByName('SAccountCode').AsString,Tobject(DMOSCommerceImport.QAccountsLookups.FieldByName('WAccountID').AsInteger));
     DMOSCommerceImport.QAccountsLookups.next ;
   end;
  DMOSCommerceImport.QAccountsLookups.close ;
  TCTaxAccountInput.Items.Assign(TCTaxAccount.Items);
  // sales accounts
  DMOSCommerceImport.QAccountsLookups.sql.text := 'Select * from account where WAccountTypeID = 0 order by SDescription';
  DMOSCommerceImport.QAccountsLookups.open ;
  while not DMOSCommerceImport.QAccountsLookups.eof do
   begin
     TCCostOfSalesACcount.AddItem(DMOSCommerceImport.QAccountsLookups.FieldByName('SDescription').AsString + '-' + DMOSCommerceImport.QAccountsLookups.FieldByName('SAccountCode').AsString,Tobject(DMOSCommerceImport.QAccountsLookups.FieldByName('WAccountID').AsInteger));
     DMOSCommerceImport.QAccountsLookups.next ;
   end;
  TCSalesAccount.Items.Assign(TCCostOfSalesACcount.Items);
  TCStockAccount.Items.Assign(TCCostOfSalesACcount.Items);

  CBDebtorAccount.Items.Assign(TCCostOfSalesACcount.Items);
  DMOSCommerceImport.QAccountsLookups.close ;
  // Debtor 1 group
  DMOSCommerceImport.ZqReportingGroup.sql.Text := ' Select * FROM Groups where WGroupTypeId = :groupType' ;
  DMOSCommerceImport.ZqReportingGroup.Params[0].AsInteger := 22;
  CBDebtorGroup1.AddItem('None',TObject(0));
  DMOSCommerceImport.ZqReportingGroup.open ;
  while not DMOSCommerceImport.ZqReportingGroup.eof do
   begin
     CBDebtorGroup1.AddItem(DMOSCommerceImport.ZqReportingGroupSDescription.AsString ,Tobject(DMOSCommerceImport.ZqReportingGroupWGroupID.AsInteger));
     DMOSCommerceImport.ZqReportingGroup.next ;
   end;


  DMOSCommerceImport.ZqReportingGroup.close ;
  DMOSCommerceImport.QAccountsLookups.close ;
end;

procedure TMainOSCommerceImport.CBDebugClick(Sender: TObject);
begin
 DMOSCommerceImport.UseDebug := CBDebug.Checked ;
end;

procedure TMainOSCommerceImport.RefreshClick(Sender: TObject);
begin
Memo1.Lines.Text := DMOSCommerceImport.DebugString ;
end;

procedure TMainOSCommerceImport.Help1Click(Sender: TObject);
var
 AhtmlFile : String ;
begin
AhtmlFile := ExtractFilePath(Application.ExeName) + 'OSCommerceHelp.htm';
ShellExecute(Handle, 'open',pchar(AhtmlFile) , nil, nil, SW_SHOW);

end;

procedure TMainOSCommerceImport.Button3Click(Sender: TObject);
Var
 RunFromDateTime : TDateTime ;
 RunToDateTime   : TDateTime ;
 i : Integer ;
 AStatusSep,ASelect,AGroupBy,AOrderBy : String ;
begin
BStop := false ;

 if DMOSCommerceImport.OSCLinks.StatusLink.GetSepList(',') = '' then
   begin
      PageControl1.ActivePageIndex := 0 ;
      raise Exception.Create('U need to check atleast one status!');
   end;
 PageControl1.ActivePage := TSOrders ;
 if not DMOSCommerceImport.LoggedIn then exit ;
 RunFromDateTime := 0 ;
 if CBProductLang.ItemIndex <> -1 then
   DMOSCommerceImport.OSCLinks.CBProductLang := Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]) ;
 DMOSCommerceImport.ZQProducts.close ;
 RunToDateTime :=  Now + 300 ;
 AStatusSep := '' ;
 if CBStatus.Items.Count=0 then BuildStatusList ;
 for i := 0 to CBStatus.Items.Count -1 do
   begin
     if i = 0 then
      AStatusSep := IntTOSTr(Integer(CBStatus.Items.Objects[i]))
      else
       AStatusSep := AStatusSep +',' + IntTOSTr(Integer(CBStatus.Items.Objects[i])) ;
   end;
 DMOSCommerceImport.ZQOrders.Close ;
 DMOSCommerceImport.ZOrderProducts.Close ;
 SpliTuniQuery(format(DMOSCommerceImport.SQLOrders.Text,[DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),AStatusSep,DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime)]),ASelect,AGroupBy,AOrderBy);
 ASelect := ASelect +  ' and  orders_id = ' + EOderNR.Text +' ';
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQOrders,ASelect +  AGroupBy + AOrderBy);
 DMOSCommerceImport.ZQOrders.first ;
end;

procedure TMainOSCommerceImport.SpliTuniQuery(ASQL: String; var ASelect,
  AOrderBy, AGroupBy: String);
  Var
   TempString : String ;
begin
   TempString := UpperCase(ASQL);
   if pos('ORDER BY',TempString) <> 0 then
     begin
        AOrderBy := Copy(ASQL,pos('ORDER BY',TempString),length(ASQL));
        Delete(ASQL,pos('ORDER BY',TempString),length(ASQL));
     end;
   if pos('GROUP BY',TempString) <> 0 then
     begin
        AGroupBy := Copy(ASQL,pos('ORDER BY',TempString),length(ASQL));
        Delete(ASQL,pos('ORDER BY',TempString),length(ASQL));
     end;
  ASelect := ASQL ;
end;

procedure TMainOSCommerceImport.Button4Click(Sender: TObject);
begin
  if pos('SELECT',UPPERCASE(trim(MFreeSQL.Lines.Text))) = 1 then
     DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.CDGen,MFreeSQL.Lines.Text)
    else
     DMOSCommerceImport.ExecSql(MFreeSQL.Lines.Text) ;

end;

procedure TMainOSCommerceImport.Button5Click(Sender: TObject);
var
 CodeMask , Code : String ;
begin
   MNotInTC.Lines.Clear ;
   MOutput.Lines.Clear ;
   DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.CDGen,'select orders_id,value from orders_total where class =' +  QuotedStr('OT_TOTAL')+ ' and orders_id >= ' + EFromOrderNr.Text ) ;
   PBTools.Max := DMOSCommerceImport.CDGen.RecordCount ;
   PBTools.Position := 0 ;
   while not DMOSCommerceImport.CDGen.Eof do
      begin
         PBTools.Position := PBTools.Position +1 ;
         PBTools.Repaint ;
         CodeMask := LeftStr(DMOSCommerceImport.OSCLinks.EInvoicePrefix+'000000000',DMOSCommerceImport.AccountCodeLength + 3) ;
         Code := FormatFloat(CodeMask,DMOSCommerceImport.CDGen.fieldByName('orders_id').AsInteger) ;
         DMOSCommerceImport.QGen.SQL.Text := 'select FDocAmount from docHead where SDocNo = ' + QuotedStr(code);
         DMOSCommerceImport.QGen.Open ;
         if not DMOSCommerceImport.QGen.IsEmpty then
           begin
             if RoundTo(DMOSCommerceImport.QGen.fieldByName('FDocAmount').AsFloat,-2) <>
                 RoundTo(DMOSCommerceImport.CDGen.fieldByName('Value').AsFloat,-2)
               then MOutput.Lines.Add(code + ' ' + FloatToStr(RoundTo(DMOSCommerceImport.QGen.fieldByName('FDocAmount').AsFloat,-2))+'  '  + FloatToStr(RoundTo(DMOSCommerceImport.CDGen.fieldByName('Value').AsFloat,-2)) );
           end else
         MNotInTC.Lines.add(Code +'  '  + FloatToStr(RoundTo(DMOSCommerceImport.CDGen.fieldByName('Value').AsFloat,-2)));
        DMOSCommerceImport.CDGen.next ;
      end;
   PBTools.Position := 0 ;
end;

procedure TMainOSCommerceImport.Button6Click(Sender: TObject);
Var
 RunFromDateTime : TDateTime ;
 RunToDateTime   : TDateTime ;
 i : Integer ;
 AStatusSep,ASelect,AGroupBy,AOrderBy : String ;
begin
BStop := false ;
 if DMOSCommerceImport.OSCLinks.StatusLink.GetSepList(',') = '' then
   begin
      PageControl1.ActivePageIndex := 0 ;
      raise Exception.Create('U need to check atleast one status!');
   end;
 if sender <> nil then
 PageControl1.ActivePage := TSOrders ;
 if not DMOSCommerceImport.LoggedIn then exit ;
 RunFromDateTime := 0 ;

 DMOSCommerceImport.ZQProducts.close ;
 RunToDateTime :=  Now + 300 ;
 AStatusSep := '' ;
 if CBStatus.Items.Count=0 then BuildStatusList ;
 for i := 0 to CBStatus.Items.Count -1 do
   begin
     if i = 0 then
      AStatusSep := IntTOSTr(Integer(CBStatus.Items.Objects[i]))
      else
       AStatusSep := AStatusSep +',' + IntTOSTr(Integer(CBStatus.Items.Objects[i])) ;
   end;
 DMOSCommerceImport.ZQOrders.Close ;
 DMOSCommerceImport.ZOrderProducts.Close ;
 SpliTuniQuery(format(DMOSCommerceImport.SQLOrders.Text,[DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),AStatusSep,DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime)]),ASelect,AGroupBy,AOrderBy);
 ASelect := ASelect +  ' and  orders_id = ' + EOderNR.Text +' ';
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQOrders,ASelect +  AGroupBy + AOrderBy);
 DMOSCommerceImport.ZQOrders.first ;
 DMOSCommerceImport.SyncOrders ;
end;

procedure TMainOSCommerceImport.Button7Click(Sender: TObject);
begin
  BStop := true ;
end;

procedure TMainOSCommerceImport.Button8Click(Sender: TObject);
var
 CodeMask , Code : String ;
begin
   MNotInTC.Lines.Clear ;
   MOutput.Lines.Clear ;
   DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.CDGen,'select orders_id,value from orders_total where class =' +  QuotedStr('OT_TOTAL') + ' and orders_id >= ' + EFromOrderNr.Text ) ;
   PBTools.Max := DMOSCommerceImport.CDGen.RecordCount ;
   PBTools.Position := 0 ;
   while not DMOSCommerceImport.CDGen.Eof do
      begin
         PBTools.Position := PBTools.Position +1 ;
         PBTools.Repaint ;
         CodeMask := LeftStr(DMOSCommerceImport.OSCLinks.EInvoicePrefix+'000000000',DMOSCommerceImport.AccountCodeLength + 3) ;
         Code := FormatFloat(CodeMask,DMOSCommerceImport.CDGen.fieldByName('orders_id').AsInteger) ;
         DMOSCommerceImport.QGen.SQL.Text := 'select FDocAmount from docHead where SDocNo = ' + QuotedStr(code);
         DMOSCommerceImport.QGen.Open ;
         if not DMOSCommerceImport.QGen.IsEmpty then
           begin
             if RoundTo(DMOSCommerceImport.QGen.fieldByName('FDocAmount').AsFloat,-2) <>
                 RoundTo(DMOSCommerceImport.CDGen.fieldByName('Value').AsFloat,-2)
               then MOutput.Lines.Add(code + ' ' + FloatToStr(RoundTo(DMOSCommerceImport.QGen.fieldByName('FDocAmount').AsFloat,-2))+'  '  + FloatToStr(RoundTo(DMOSCommerceImport.CDGen.fieldByName('Value').AsFloat,-2)) );
           end else
          begin
            EOderNR.Text :=  DMOSCommerceImport.CDGen.fieldByName('orders_id').AsString ;
            Button6Click(nil);
          end;
        DMOSCommerceImport.CDGen.next ;
      end;
   PBTools.Position := 0 ;
end;


procedure TMainOSCommerceImport.Button9Click(Sender: TObject);
var
 i,x : Integer ;
 TrimTex : String ;
begin
   for i := 0 to MProcessThisList.lines.Count -1 do
         begin
            TrimTex := MProcessThisList.lines[i] ;
            for x := length(TrimTex) downto 1 do
               if not (TrimTex[x] in ['1','2','3','4','5','6','7','8','9','0']) then
                  delete(TrimTex,x,1);
            if TrimTex <> '' then
            begin
              EOderNR.Text :=  IntToStr(StrToInt(TrimTex)) ;
              Button6Click(nil);
            end;
          end;

end;

procedure TMainOSCommerceImport.ELinkOrdersUrlDblClick(Sender: TObject);
begin
 if ELinkOrdersUrl.Text = '' then
    ELinkOrdersUrl.Text := 'http://www.yourdomain.org/catalog/admin/orders.php?selected_box=customers&page=1&oID=<@ID@>&action=edit' ;
end;

procedure TMainOSCommerceImport.ELinkCustUrlDblClick(Sender: TObject);
begin
 if ELinkCustUrl.Text = '' then
    ELinkCustUrl.Text := 'http://www.yourdomain.org/catalog/admin/customers.php?page=1&cID=<@ID@>&action=edit' ;
end;

procedure TMainOSCommerceImport.BAutoUpdateClick(Sender: TObject);
begin
DMOSCommerceImport.ForceCheckCode := CBMatchStockCode.Checked ;
TRunUpdateOrders.tag := ord(not(TRunUpdateOrders.tag = 1));
if TRunUpdateOrders.Tag = 1 then
   begin
     TRunUpdateOrders.Interval := 1000 * StrToInt(EInterval.Text);
     BAutoUpdate.Caption := 'Stop auto update';
     TRunUpdateOrdersTimer(nil);
   end else
   begin
     TRunUpdateOrders.Enabled := false ;
     BAutoUpdate.Caption := 'Start auto update';
   end;
end;

procedure TMainOSCommerceImport.TRunUpdateOrdersTimer(Sender: TObject);
begin
TRunUpdateOrders.Enabled := false ;

try
  BStop := false ;
  PProgress.Visible := true ;


    SaveTaxDetail(TVTax.Selected);
    SaveSettings ;
    PageControl1Change(nil);

    DMOSCommerceImport.SyncStock ;
    DMOSCommerceImport.SyncOrders ;
    if CBUpdateStockFromTC.Checked then
       begin
         DMOSCommerceImport.ReSyncOSCWithTCStock(true) ;
       end;
    DMOSCommerceImport.CloseConnection ;
    DTSincTime.Time := DMOSCommerceImport.OSCLinks.DTSincTime ;
    DTSincDate.date := DMOSCommerceImport.OSCLinks.DTSincDate ;
    PProgress.Visible := false ;
  finally
    TRunUpdateOrders.Enabled := TRunUpdateOrders.tag = 1 ;
  end;

end;

procedure TMainOSCommerceImport.Button10Click(Sender: TObject);
begin
  BStop := false ;
  PProgress.Visible := true ;


    SaveTaxDetail(TVTax.Selected);
    SaveSettings ;
    PageControl1Change(nil);
    DMOSCommerceImport.SyncCustomers ;
    DMOSCommerceImport.CloseConnection ;

    DTSincTime.Time := DMOSCommerceImport.OSCLinks.DTSincTime ;
    DTSincDate.date := DMOSCommerceImport.OSCLinks.DTSincDate ;
    PProgress.Visible := false ;
end;

procedure TMainOSCommerceImport.TCTaxAccountDblClick(Sender: TObject);
var
 ToId : Integer ;
begin
  if TCTaxAccount.ItemIndex <> -1 then
     ToId :=  Integer(TCTaxAccount.Items.Objects[TCTaxAccount.ItemIndex])
     else
     ToId := 0 ;
      aFmLookup.SelectLookup(self,LgenOutputtax.Caption,tcstTAX,tcltAccount,ToId);
      TCTaxAccount.ItemIndex := TCTaxAccount.Items.IndexOfObject(TObject(aFmLookup.ReturnID)) ;
end;

procedure TMainOSCommerceImport.FormDestroy(Sender: TObject);
begin
   aFmLookup.free ;
end;

procedure TMainOSCommerceImport.BInputTaxAccountClick(Sender: TObject);
var
 ToId : Integer ;
begin
  if TCTaxAccountInput.ItemIndex <> -1 then
     ToId :=  Integer(TCTaxAccountInput.Items.Objects[TCTaxAccountInput.ItemIndex])
     else
     ToId := 0 ;
      aFmLookup.SelectLookup(self,LInputTaxAccount.Caption,tcstTAX,tcltAccount,ToId);
      TCTaxAccountInput.ItemIndex := TCTaxAccountInput.Items.IndexOfObject(TObject(aFmLookup.ReturnID)) ;
end;


procedure TMainOSCommerceImport.BSalesAccountClick(Sender: TObject);
var
 ToId : Integer ;
begin
  if TCSalesAccount.ItemIndex <> -1 then
     ToId :=  Integer(TCSalesAccount.Items.Objects[TCSalesAccount.ItemIndex])
     else
     ToId := 0 ;
      aFmLookup.SelectLookup(self,LSalesAccount.Caption,tcstGLONE,tcltAccount,ToId);
      TCSalesAccount.ItemIndex := TCSalesAccount.Items.IndexOfObject(TObject(aFmLookup.ReturnID)) ;
end;

procedure TMainOSCommerceImport.BCOSAccountClick(Sender: TObject);
var
 ToId : Integer ;
begin
  if TCCostOfSalesACcount.ItemIndex <> -1 then
     ToId :=  Integer(TCCostOfSalesACcount.Items.Objects[TCCostOfSalesACcount.ItemIndex])
     else
     ToId := 0 ;
      aFmLookup.SelectLookup(self,LCOSAccount.Caption,tcstGLONE,tcltAccount,ToId);
      TCCostOfSalesACcount.ItemIndex := TCCostOfSalesACcount.Items.IndexOfObject(TObject(aFmLookup.ReturnID)) ;
end;

procedure TMainOSCommerceImport.BStockAccountClick(Sender: TObject);
var
 ToId : Integer ;
begin
  if TCStockAccount.ItemIndex <> -1 then
     ToId :=  Integer(TCStockAccount.Items.Objects[TCStockAccount.ItemIndex])
     else
     ToId := 0 ;
      aFmLookup.SelectLookup(self,LCOSAccount.Caption,tcstGLONE,tcltAccount,ToId);
      TCStockAccount.ItemIndex := TCStockAccount.Items.IndexOfObject(TObject(aFmLookup.ReturnID)) ;

end;

procedure TMainOSCommerceImport.BConvertOldStockIdToSExternalClick(Sender: TObject);
Var
 RunFromDateTime : TDateTime ;
 RunToDateTime   : TDateTime ;
 LangID : Integer ;
begin
 DMOSCommerceImport.ZQAllCatProducts.close ;
 BStop := false ;
 LangID := 0 ;
 if not DMOSCommerceImport.LoggedIn then exit ;
 RunFromDateTime := 0 ;
 if CBProductLang.ItemIndex <> -1 then
 LangID :=  Integer(CBProductLang.Items.Objects[CBProductLang.ItemIndex]);
 DMOSCommerceImport.ZQProducts.close ;
 RunToDateTime :=  now;
 DMOSCommerceImport.FillCDSWithQuery(DMOSCommerceImport.ZQProducts,format(DMOSCommerceImport.SQLProducts.Text,[IntTOStr(LangID),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunFromDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime),DMOSCommerceImport.DateTOMYSQLDate(RunToDateTime)]));

PProgress.Visible := true ;
try
SaveTaxDetail(TVTax.Selected);
DMOSCommerceImport.OSCLinks.SettingsVersion := 1 ;
SaveSettings ;
DMOSCommerceImport.RelinkOldStock ;
finally
   PProgress.Visible := False ;
end;
end;

procedure TMainOSCommerceImport.Button1Click(Sender: TObject);
begin
MFreeSQL.Text := 'select products_model ,count(products_id ) from products ' +
' group by products_model ' +
' having count(products_id ) > 1 ' ;
Button4Click(self);
end;

procedure TMainOSCommerceImport.Label9Click(Sender: TObject);
begin
    ShellExecute(Handle, 'open', Pchar('http://www.osfshop.com'), nil, nil, SW_SHOW);
end;

procedure TMainOSCommerceImport.LabelManualClick(Sender: TObject);
begin
    ShellExecute(Handle, 'open', Pchar('http://www.osfinancials.org/nl/handleidingen-plugins/236-e-commerce-plugin-met-directe-database-connectie.html'), nil, nil, SW_SHOW);
end;

procedure TMainOSCommerceImport.Button12Click(Sender: TObject);
begin
MFreeSQL.Text := 'select p.products_model, pd.products_name ,count(p.products_id ) from products ' +
' p join products_description pd where (p.products_id = pd.products_id) ' +
' group by p.products_model  having count(p.products_id ) > 1 ' ;
Button4Click(self);
end;

end.

