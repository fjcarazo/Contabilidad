(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockActivityOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, ComCtrls;

type
  TfmStockActivityOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    dbcboxNewPage: TCheckBox;
    dbedtFromCode: TEdit;
    dbedtToCode: TEdit;
    dbcomboxSequence: TComboBox;
    CBPrintExtraInfo: TCheckBox;
    CBAddUnposted: TCheckBox;
    CBShowQuotePurchase: TCheckBox;
    CBAllstock: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBCbShowAll: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure CBAddUnpostedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    // Re - use the same form for Activity Report (1)
    // And Re-Order Report (2)
    // And Back - Order (3)
    StockRepId:Integer;
    { Public declarations }
  end;

var
  fmStockActivityOptions: TfmStockActivityOptions;

implementation

uses Database, Main, Lookup, StockActivity, HtmlHelpAPI, GlobalFunctions,
     StockReOrder, BackOrder, TcVariables, DatabaseAccess,XRoutines,
  UDMTCCoreLink;

{$R *.DFM}



procedure TfmStockActivityOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
DMTCCoreLink.LoadImage(Bitprn1.Glyph,'Printer');

  dmDatabase.tblSysVars.Open ;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add(GetTextLang(213){'Stock Code'});
  dbcomboxSequence.Items.Add(GetTextLang(1058){'Stock Description'});
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName2.Value);
  dmDatabase.tblSysVars.Close;
//  dmDatabase.tblReportingOptions.Open;
//  dmDatabase.tblReportingOptions.Edit;
  LoadReoprtOp;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
 // DBCbShowAll.Visible:=False;
  case StockRepId of
   2 : Begin
         Caption :=GetTextLang(1082){ 'Re-Order Options'};
        // DBCbShowAll.Visible:=True;
         DBCbShowAll.Checked:=False;
         CBAddUnposted.Visible := true ;
         CBPrintExtraInfo.Visible := true ;
 

       end;
   3 : Begin
        Caption := GetTextLang(1083){'Back Order Options'};
        dbcboxNewPage.Visible:=True;
        //DBCbShowAll.Visible:=True;
        CBAddUnposted.Visible := false ;
        CBShowQuotePurchase.Visible := false ;
        CBPrintExtraInfo.Visible := false ;
        DBCbShowAll.Visible := false ;
        dbcboxNewPage.Visible := false ;
      end;
  else
    begin
    Caption :=GetTextLang(290){ 'Stock Activity Options'};
    CBAddUnposted.Visible := false ;
    DBCbShowAll.Visible:=True;
    CBShowQuotePurchase.Visible := false ;
    CBPrintExtraInfo.Visible := false ;
    DBCbShowAll.Visible := true ;
    end;
  end;
  CBAllstock.Caption := GetTextLang(2981);
  Label4.Caption := GetTextLang(247);//Sequence 247
  Label2.Caption := GetTextLang(289);//From Stock code 289
  Label3.Caption := GetTextLang(208);//To 208
  DBCbShowAll.Caption:=GetTextLang(1084); //DBCbShowAll
  btnOK.Caption := GetTextLang(167); //OK 167
  dbcboxNewPage.Caption:=GetTextLang(1085);  //dbcboxNewPage
  btnCancel.Caption := GetTextLang(168); //Cancel 168
  ChangePrnlbls(DestLbl,lblCopies,Bitprn1);

  CBAddUnposted.Caption := GetTextLang(2982);
  CBShowQuotePurchase.Caption := GetTextLang(2983);
  CBAllstock.Caption := GetTextLang(2981);
end;

procedure TfmStockActivityOptions.btnCancelClick(Sender: TObject);
begin
//  dmDatabase.tblReportingOptions2.Close;
  Close;
end;

procedure TfmStockActivityOptions.btnOkClick(Sender: TObject);
Var
  FromCode, ToCode :String;
begin
 hide ;
 try
  FromCode := dbedtFromCode.Text;
  ToCode   := dbedtToCode.Text;
  SwapStr(FromCode,ToCode);
  //
  SaveReoprtOp;

  dmDatabase.tblSysVars.Open ;
//  dbcomboxSequence.ItemIndex:=dbcomboxSequence.Items.IndexOf(dbcomboxSequence.Text);
  dmDatabase.tblStock.Open;
  // TODO : BDEINDEX

  case dbcomboxSequence.ItemIndex of
  0 : dmDataBase.tblStock.IndexFieldNames := 'SStockcode';
  1 : dmDataBase.tblStock.IndexFieldNames := 'SDescription';
  2 : dmDatabase.tblStock.IndexFieldNames := 'WREPORTINGGROUP1ID';
  3 : dmDatabase.tblStock.IndexFieldNames := 'WREPORTINGGROUP2ID';
    end;



  dmDatabase.tblStock.Filtered := False;
  // lets cekc if filers are filled.
  if not CBAllstock.Checked then
    begin
     if (FromCode <> '') and (ToCode <> '') then
       dmDatabase.tblStock.Filter := 'SSTOCKCODE >= ''' + FromCode + ''' AND SSTOCKCODE <= ''' + ToCode + '''';
       dmDatabase.tblStock.Filtered := True;
    end;
  dmDatabase.tblStockTrans.Open;
  dmDatabase.tblPeriods.Open;
  dmDatabase.tblSysVars.Open;
  dmDatabase.tblGroups.Open ;
  case StockRepId of
   2 : begin // Re-Order Report
         qrStockReOrder := TqrStockReOrder.Create(Self);
         try
         qrStockReOrder.ShowAll:=DBCbShowAll.Checked;
         qrStockReOrder.AddUnposted := CBAddUnposted.Checked ;
         qrStockReOrder.ShowOrderQuote := CBShowQuotePurchase.Checked ;
         qrStockReOrder.ShowExtraColumns := CBPrintExtraInfo.Checked ;
         qrStockReOrder.QRGroup1.Enabled:=false ;
         qrStockReOrder.ReportGroup := 0 ;
           case dbcomboxSequence.ItemIndex of
            2 : begin
                 qrStockReOrder.QRGroup1.Expression := 'tblStock.WReportingGroup1ID' ;
                 qrStockReOrder.QRGroup1.Enabled:=true ;
                 qrStockReOrder.ReportGroup := 1 ;
                end ;
            3 : begin
                 qrStockReOrder.QRGroup1.Expression := 'tblStock.WReportingGroup2ID' ;
                 qrStockReOrder.QRGroup1.Enabled:=true ;
                 qrStockReOrder.ReportGroup := 2 ;
                end ;
            end;

         PrintReportProcess(cbDestination.ItemIndex,qrStockReOrder,edtCount.Text);
         finally
         qrStockReOrder.Free;
       end;
       end;
   3: begin  // Back Order
         dmDatabase.tblBackOrder.Filtered:=False;
         dmDatabase.tblBackOrder.Filter:='';
         dmDatabase.tblBackOrder.Open;
         dmDatabase.tblAccount.Open;
         dmDatabase.tblAccount.Filtered:=False;
         dmDatabase.tblAccount.Filter:='';
         qrBackOrderItems := TqrBackOrderItems.Create(Self);
         try
         PrintReportProcess(cbDestination.ItemIndex,qrBackOrderItems,edtCount.Text);
         finally
         qrBackOrderItems.Free;
         end;
         dmDatabase.tblAccount.Open;
         dmDatabase.tblBackOrder.Close;
      end;
  else // StockLIst Report
    begin
      qrStockActivity := TqrStockActivity.Create(Self);
      try
      qrStockActivity.BPrintAll := DBCbShowAll.Checked ;
           case dbcomboxSequence.ItemIndex of
            2 : begin
                 qrStockActivity.QRGroup1.Expression := 'tblStock.WReportingGroup1ID' ;
                 qrStockActivity.QRGroup1.Enabled:=true ;
                 qrStockActivity.ReportGroup := 1 ;
                end ;
            3 : begin
                 qrStockActivity.QRGroup1.Expression := 'tblStock.WReportingGroup2ID' ;
                 qrStockActivity.QRGroup1.Enabled:=true ;
                 qrStockActivity.ReportGroup := 2 ;
                end ;
            end;
      PrintReportProcess(cbDestination.ItemIndex,qrStockActivity,edtCount.Text);
      finally
      qrStockActivity.Free;
      end;
    end;
  end;
  dmDatabase.tblStock.Filtered := False;
  dmDatabase.tblStock.Filter := '';
  dmDatabase.tblStock.Close;
  dmDatabase.tblStockTrans.Close;
  dmDatabase.tblPeriods.Close;
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblGroups.Close ;
  finally
     Show ;
  end;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmStockActivityOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             if StockRepId=2 then
                  HtmlShowTopic(206)
             else if StockRepId=3 then
                 HtmlShowTopic(204)
             else
                HtmlShowTopic(203);
             key := 0;

        end;
end;

procedure TfmStockActivityOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmStockActivityOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmStockActivityOptions.edtCountChange(Sender: TObject);

Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmStockActivityOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmStockActivityOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmStockActivityOptions.LoadReoprtOp;
begin

  DBCbShowAll.Checked := ReadReportOp('BStockActivityShowAll',false).AsBoolean;
  dbcboxNewPage.Checked := ReadReportOp('BStockActivityNewPage',false).AsBoolean;
  CBPrintExtraInfo.Checked := ReadReportOp('BStockActivityPEInfo',false).AsBoolean;
  CBAddUnposted.Checked := ReadReportOp('BStockAddUnposted',false).AsBoolean;
  CBShowQuotePurchase.Checked := ReadReportOp('BStockShowQuotePurchase',false).AsBoolean;
  dbedtFromCode.Text :=  ReadReportOp('SStockActivityFromCode').AsString;
  dbedtToCode.Text :=  ReadReportOp('SStockActivityToCode').AsString;
  dbcomboxSequence.ItemIndex := dbcomboxSequence.Items.IndexOf(ReadReportOp('SStockActivitySequence').AsSTring);
  if dbcomboxSequence.ItemIndex<0 then
    dbcomboxSequence.ItemIndex:=0;

  CBAllstock.Checked := ReadReportOp('BStockActivityAllstock',false).AsBoolean;
  // last to make sure the event hides the accounts
end;


Procedure TfmStockActivityOptions.SaveReoprtOp;
begin
  WriteReportOp('BStockActivityPEInfo',Bool2Str(CBPrintExtraInfo.Checked));
  WriteReportOp('BStockActivityShowAll',Bool2Str(DBCbShowAll.Checked));
  WriteReportOp('BStockActivityNewPage',Bool2Str(dbcboxNewPage.Checked));
  WriteReportOp('SStockActivityFromCode',dbedtFromCode.Text );
  WriteReportOp('SStockActivityToCode',dbedtToCode.Text  ) ;
  WriteReportOp('SStockActivitySequence',dbcomboxSequence.Text);
  WriteReportOp('BStockAddUnposted',Bool2Str(CBAddUnposted.Checked));
  WriteReportOp('BStockShowQuotePurchase',Bool2Str(CBShowQuotePurchase.Checked));
  WriteReportOp('BStockActivityAllstock',Bool2Str(CBAllstock.Checked));

end;


procedure TfmStockActivityOptions.CBAddUnpostedClick(Sender: TObject);
begin
CBShowQuotePurchase.Visible := CBAddUnposted.Checked ;
if  not CBShowQuotePurchase.Visible then
   CBShowQuotePurchase.Checked := false ; 
end;

procedure TfmStockActivityOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmDatabase.tblSysVars.close ;
end;

procedure TfmStockActivityOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromCode.Color := clHighlight;
  CallLookup(dbedtFromCode.Text, 7);
  if ReturnLookup <> 'ESC' then
   begin
    if ReturnLookup <> 'NEW' then
     dbedtFromCode.Text := ReturnLookup ;
   end else
    dbedtFromCode.Text := '' ;
  dbedtFromCode.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmStockActivityOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToCode.Color := clHighlight;
  CallLookup(dbedtToCode.Text, 7);
  if ReturnLookup <> 'ESC' then
     begin
    if ReturnLookup <> 'NEW' then
     dbedtToCode.Text := ReturnLookup ;
   end else
    dbedtToCode.Text := '' ;

  dbedtToCode.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
