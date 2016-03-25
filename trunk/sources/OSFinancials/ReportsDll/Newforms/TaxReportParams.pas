(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit TaxReportParams;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, ComCtrls, DB, ZAbstractRODataset,
  DBAccess , Uni,UReportBasis;

type
  TfmTaxReportParams = class(TFormReportOptionsBase)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    dbcomboxWhichYear: TComboBox;
    edtFromDate: TEdit;
    cbTaxAccount: TComboBox;
    edtToDate: TEdit;
    dbcbShowDetails: TCheckBox;
    Label1: TLabel;
    cbTaxMethod: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ZQGetTax: TuniQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    FromID, ToID : Integer ;
    procedure WriteParams;
    procedure ReadParams;

    { Public declarations }
  end;

var
  fmTaxReportParams: TfmTaxReportParams;
//  ;

implementation

uses  HTMLHelpAPI , UMsgBox, UDMTCCoreLink, UDMReportsGlobals, osfLookup,math;

{$R *.DFM}

Var
  MyFilter:String;

procedure TfmTaxReportParams.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(DMTCCoreLink.GetTextLang(441){Do you want to continue reporting ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmTaxReportParams.btnOkClick(Sender: TObject);
Var
  Params , FileName : String ;
  ShowType : Integer ;
begin
 inherited ;
 WriteParams ;
 hide ;
 try
  if FromID > ToID then
  begin
    OSFMessageDlg(DMTCCoreLink.GetTextLang(631) + edtFromDate.Text  + ' '+DMTCCoreLink.GetTextLang(208)+' ' + edtToDate.Text , mterror, [mbok], 0);
    edtFromDate.SetFocus;
    exit;
  end;

  ShowType := GetPrintType ;
  Params := 'STARTPERIOD=' + IntToStr(FromID) +#13 ;
  Params := Params + 'ENDPERIOD=' + IntToStr(ToID) +#13 ;
  Params := Params + 'SHOWDETAIL=' + booltoStr(dbcbShowDetails.Checked)  +#13 ;
  Params := Params + 'TAXCODE=' +  IntToStr(Integer(cbTaxAccount.Items.Objects[cbTaxAccount.ItemIndex]));
  FileName := '' ;
  if ShowType = 3 then
    begin
      FileName := DMTCCoreLink.GetLocalSaveDir  +'Printout\' ;
      ForceDirectories(FileName);
      Randomize ;
      FileName := FileName + IntToStr(RandomRange(0,999999)) +'.pdf' ;
    end;
     if cbTaxMethod.ItemIndex = 0 then
       DMReportsGlobals.ShowReport('REPORTS\TAX\TAX_PAYMENT',Caption,params,ShowType,FileName)
     else
      DMReportsGlobals.ShowReport('REPORTS\TAX\TAX_INCOME',Caption,params,ShowType,FileName);
   finally
    show ;
  end;
end;


procedure TfmTaxReportParams.btnCancelClick(Sender: TObject);
begin
  inherited ;
  Close;
end;

procedure TfmTaxReportParams.FormShow(Sender: TObject);

begin
  dbcomboxWhichYear.Clear;
  dbcomboxWhichYear.Items.Add(DMTCCoreLink.GetTextLang(603));
  dbcomboxWhichYear.Items.Add(DMTCCoreLink.GetTextLang(604));
  dbcomboxWhichYear.Items.Add('All');
  cbTaxMethod.Clear;
  cbTaxMethod.Items.Add(DMTCCoreLink.GetTextLang(1110){'Detailed'});
  cbTaxMethod.Items.Add(DMTCCoreLink.GetTextLang(1111){'Received});

  cbTaxAccount.Items.Clear;
  cbTaxAccount.Items.Add(DMTCCoreLink.GetTextLang(1098){'All tax Code'});
  ZQGetTax.connection := DMTCCoreLink.TheZConnection ;
  ZQGetTax.sql.Text := 'select * from account where WAccountTypeID = 4 and WAccountID <> 0 ' ;
  ZQGetTax.open ;
  while not ZQGetTax.EOF do
  begin
    cbTaxAccount.Items.AddObject(ZQGetTax.fieldByName('SDescription').AsString,TObject(ZQGetTax.fieldByName('WAccountID').Asinteger));
    ZQGetTax.next ;
  end;
  cbTaxAccount.ItemIndex:=0;
  ReadParams ;
  edtFromDate.Text := DMTCCoreLink.GetPeriodDescription(FromID);
  edtToDate.Text := DMTCCoreLink.GetPeriodDescription(ToID);
end;

procedure TfmTaxReportParams.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = 112 then
  begin
   HtmlHelpShowContentID(210);
   key := 0;
  end;
end;

procedure TfmTaxReportParams.BitBtn1Click(Sender: TObject);
begin
  edtFromDate.Color:=clHighlight;

  if dbcomboxWhichYear.ItemIndex = 0 then
    DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstTHISYEAR,tcltPeriods,FromID)
  else
  if dbcomboxWhichYear.ItemIndex = 2 then
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,FromID)
  else
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstLASTYEAR,tcltPeriods,FromID);

  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    FromID := DMReportsGlobals.Alookup.ReturnID ;
    edtFromDate.Text := DMTCCoreLink.GetPeriodDescription(FromID) ;
    edtFromDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmTaxReportParams.BitBtn2Click(Sender: TObject);
begin
  edtToDate.Color:=clHighlight;
  if dbcomboxWhichYear.ItemIndex = 0 then
    DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstTHISYEAR,tcltPeriods,ToID)
  else
  if dbcomboxWhichYear.ItemIndex = 2 then
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstALLYEAR,tcltPeriods,ToID)
  else
     DMReportsGlobals.Alookup.SelectLookup(self,DMTCCoreLink.GetTextLang(600),tcstLASTYEAR,tcltPeriods,ToID) ;


  if (DMReportsGlobals.Alookup.ReturnLookupType = tcrtSelect) then
  begin
    ToID := DMReportsGlobals.Alookup.ReturnID ;
    edtToDate.Text := DMTCCoreLink.GetPeriodDescription(ToID) ;
    edtToDate.Color:=clWindow;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TfmTaxReportParams.ReadParams;
begin
 FromID := DMTCCoreLink.ReadNwReportOp('REP_TAXFromDate',14);
 ToID := DMTCCoreLink.ReadNwReportOp('REP_TAXToDate',14);
 dbcomboxWhichYear.ItemIndex := DMTCCoreLink.ReadNwReportOp('REP_TAXYEAR',0);
 cbTaxMethod.ItemIndex := DMTCCoreLink.ReadNwReportOp('REP_TAXTYPE',0);
 dbcbShowDetails.Checked := DMTCCoreLink.ReadNwReportOp('REP_TAXDETAILS',false);
 cbTaxAccount.ItemIndex := StrToIntDef(VarToStr(DMTCCoreLink.ReadNwReportOp('REP_TAXTAXACC',0)),0);
end;

procedure TfmTaxReportParams.WriteParams;
begin
  DMTCCoreLink.WriteNwReportOp('REP_TAXFromDate',IntToStr(FromID));
  DMTCCoreLink.WriteNwReportOp('REP_TAXToDate',IntToStr(ToID));
  DMTCCoreLink.WriteNwReportOp('REP_TAXTAXACC',IntToStr(cbTaxAccount.ItemIndex));

  DMTCCoreLink.WriteNwReportOp('REP_TAXYEAR',IntToStr(dbcomboxWhichYear.ItemIndex));
  DMTCCoreLink.WriteNwReportOp('REP_TAXTYPE',IntToStr(cbTaxMethod.ItemIndex));
  DMTCCoreLink.WriteNwReportOp('REP_TAXDETAILS',BoolToStr(dbcbShowDetails.Checked,true));


end;

end.

