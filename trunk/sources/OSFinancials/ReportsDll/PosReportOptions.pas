unit PosReportOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, ComCtrls, Buttons, ExtCtrls, QuickRpt;

type
  TfmPosReportOptions = class(TForm)
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    Toimage: TImage;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    GBOptions: TGroupBox;
    cbEatchSalesPersonSeperate: TCheckBox;
    CBShowInvoice: TCheckBox;
    CBShowAllSalespersons: TCheckBox;
    BGReports: TGroupBox;
    Rpts0: TRadioButton;
    Rpts1: TRadioButton;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure QrPosGlbReportAddReports(Sender: TObject);
    procedure Rpts0Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPosReportOptions: TfmPosReportOptions;

implementation

uses Database, CashUpVariance,  GlobalFunctions,
  PosSalesDetailsReport, PosRoutines, DatabaseAccess,XRoutines;

{$R *.dfm}

Procedure PrepareSalesReport;
Var
  S:String;
begin
  dmDatabase.QryPosSalesReport.Close;
  S:='SELECT Groups.SDescription, SDocNo, DDate, FSellingPrice,';
  S:= S + ' FQtyShipped,Stock.SDescription As SDescription_1 ,SSTOCKCODE,WTypeID, SACCOUNTCODE,';
  S:= S + ' Stock.WReportingGroup1ID, Stock.WReportingGroup2ID,FInclusiveAmt,FExclusiveAmt';
  S:= S + ' FROM Groups, Stock, DocHead, DocLine, Account';
  S:= S + ' WHERE (Groups.WGroupID = DocHead.WSalesmanID)';
  S:= S + ' AND (DocHead.WaccountID = Account.WaccountID)';
  S:= S + ' AND (Stock.WStockID = DocLine.WStockID)';
  S:= S + ' AND (DocHead.WDocID = DocLine.WDocID)';
  S:= S + ' AND (Groups.WGroupTypeID = 31)';
  S:= S + ' AND (DocHead.WSourceTypeID=2)';
  S:= S + ' AND ((WTypeID = 10) OR (WTypeID = 11))';
  S:= S + ' AND (BPosted<> 1)';
  S:= S + ' ORDER BY Groups.SDescription,Stock.SDescription,DocHead.WTypeID , DocHead.DDate, SDocNo';
  dmDatabase.QryPosSalesReport.SQL.text := s;
end;

procedure TfmPosReportOptions.BtnOkClick(Sender: TObject);
begin
  WriteReportOp('BPosSalesRpt',Bool2Str(Rpts1.Checked));
  qrCashUpVariance := TqrCashUpVariance.Create(Self);
  QrPosSalesDetails:= TQrPosSalesDetails.Create(Self);
  try
  PrepareSalesReport;
  dmDatabase.QryPosSalesReport.Open;
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocLine.Open;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblStock.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.First;
  dmDatabase.tblSysVars.Open;
  if (Rpts1.Checked=Rpts0.Checked) ANd (Not Rpts1.Checked) then
    Rpts1.Checked:=True;
  if CBShowInvoice.Checked then
  begin
    QrPosSalesDetails.QRLabel13.Enabled := True;
    QrPosSalesDetails.QRDBText5.Enabled := False;
    QrPosSalesDetails.QRDBText8.Enabled := False;
  end
  else
  begin
    QrPosSalesDetails.QRBand2.Height:=0;
    QrPosSalesDetails.QRGroup2.Height:=0;
  end;
  if Not CBShowAllSalespersons.Checked AND (SalesPerID>0) then
    dmDatabase.tblGroups.Filter:='WGroupID='''+IntToStr(SalesPerID)+''''
  else
    dmDatabase.tblGroups.Filter:='WGroupTypeID=31';
  dmDatabase.tblGroups.Filtered:=True;
  if Rpts1.Checked then
    PrintReportProcess(0,QrPosSalesDetails,'1')
  else
    PrintReportProcess(0,qrCashUpVariance,'1');
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblGroups.Close;
  dmDatabase.tblStock.Close;
  dmDatabase.tblDocHeadEr.Close;
  dmDatabase.tblDocLine.Close;
  dmDatabase.tblAccount.Close;
  finally
   FreeAndNil(qrCashUpVariance);
   FreeAndNil(QrPosSalesDetails);
  end;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Filter:='';
end;

procedure TfmPosReportOptions.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPosReportOptions.QrPosGlbReportAddReports(Sender: TObject);
begin
//  QrPosGlbReport.Reports.Add(qrCashUpVariance);
//  QrPosGlbReport.Reports.Add(QrPosSalesDetails);  
end;

procedure TfmPosReportOptions.Rpts0Click(Sender: TObject);
begin
  CBShowInvoice.Enabled:=Not Rpts0.Checked;
  cbEatchSalesPersonSeperate.Enabled:=CBShowInvoice.Enabled;
  CBShowAllSalespersons.Enabled:= Not CBShowInvoice.Enabled and (SalesPerID>0);
end;

procedure TfmPosReportOptions.FormShow(Sender: TObject);
begin
  Rpts0Click(Sender);
    // load Print Modes
  LoadPrintOutModes(cbDestination);
  Rpts0.Checked := not ReadReportOp('BPosSalesRpt',True).AsBoolean;
  if (Rpts1.Checked=Rpts0.Checked) ANd (Not Rpts1.Checked) then
    Rpts1.Checked:=True;
//  if not Rpts1.Checked then
//   Rpts0.Checked:=True;

  btnOK.Caption := GetTextLang(167); //OK 167
  btnCancel.Caption :=  GetTextLang(168);//Cancel 168
  ChangePrnlbls(DestLbl,lblCopies,Bitprn1);
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  GBOptions .Caption :=GetTextLang(1013);
  cbEatchSalesPersonSeperate.Caption :=GetTextLang(2985);
  CBShowAllSalespersons.Caption :=GetTextLang(2986);
  CBShowInvoice.Caption :=GetTextLang(2987);
  Rpts0.Caption :=GetTextLang(2988);
  Rpts1.Caption :=GetTextLang(2989);
  BGReports.Caption :=GetTextLang(1329);
end;

procedure TfmPosReportOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

end.
