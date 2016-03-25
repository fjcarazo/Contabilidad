unit PosReportOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, ComCtrls, Buttons, ExtCtrls, 
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, MemDS,
  VirtualTable, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfmPosReportOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    vtCashup: TVirtualTable;
    DSCashup: TDataSource;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1user: TcxGridDBColumn;
    cxGrid1DBTableView1cashname: TcxGridDBColumn;
    cxGrid1DBTableView1value1: TcxGridDBColumn;
    cxGrid1DBTableView1value2: TcxGridDBColumn;
    vtCashupid: TIntegerField;
    vtCashupuser: TStringField;
    vtCashupcashname: TStringField;
    vtCashupvalue1: TFloatField;
    vtCashupvalue2: TFloatField;
    vtCashupvalue3: TFloatField;
    Panel2: TPanel;
    BGReports: TGroupBox;
    Rpts0: TRadioButton;
    Rpts1: TRadioButton;
    bPrint: TBitBtn;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure QrPosGlbReportAddReports(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure bPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    BFromPosClose : Boolean ;
    { Public declarations }
  end;

var
  fmPosReportOptions: TfmPosReportOptions;

implementation

uses Database,   GlobalFunctions,
   PosRoutines, DatabaseAccess,XRoutines,
  UDMTCCoreLink, OSFGeneralRoutines, UDmQuantumGridDefs, UReportManager;

{$R *.dfm}

Procedure PrepareSalesReport;
Var
  S:String;
begin
  dmDatabase.QryPosSalesReport.Close;
  S:='SELECT Groups.SDescription, SDocNo, DDate, FSellingPrice,';
  S:= S + ' FQtyShipped,Stock.SDescription As SDescription_1 ,Stock.SSTOCKCODE,WTypeID, SACCOUNTCODE,';
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
var
 SysCashUp,TotSysCashUp: Array [0..1] of Array[0..4] of Real;
Procedure LoadCompValues(WSalesPersID:integer);
   Procedure ClearOld;
   Var
     i,j:Integer;
   begin
     for i:=0 to 1 do
       For j:=0 to 4 do
         SysCashUp[i,j]:=0;
   end;
begin
  ClearOld;
  if TDataBaseRoutines.TableExist('PosPymtInv'+IntToStr(WSalesPersID)) then
  Begin
    dmDatabase.qGen.Close;
    dmDatabase.qGen.SQL.Text:='Select Sum(FAmount) as FAmt, FQty , Sum(NotUsed) As FiCount from PosPymtInv'+IntToStr(WSalesPersID)  +
                            ' Where (SReference<>''********'') or (Sreference Is null) '+
                            ' Group By FQty';
    dmDatabase.qGen.Open;
    dmDatabase.qGen.First;
    While not dmDatabase.qGen.Eof do
    begin
      Case dmDatabase.qGen.FieldByName('FQty').AsInteger of
      2:Begin {Vouchers}
          SysCashUp[0,4]:= SysCashUp[0,4] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,4]:= SysCashUp[1,4] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
        end;
      16:Begin {Cash}
          SysCashUp[0,0]:= SysCashUp[0,0] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,0]:= SysCashUp[1,0] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
        end;
       8:Begin {Credit Cards}
          SysCashUp[0,1]:= SysCashUp[0,1] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,1]:= SysCashUp[1,1] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
         end;
       1:Begin {Cheques}
          SysCashUp[0,3]:= SysCashUp[0,3] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;;
          SysCashUp[1,3]:= SysCashUp[1,3] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
         end;
       32:Begin {Float}
          SysCashUp[0,2]:= SysCashUp[0,2] + Int(dmDatabase.qGen.FieldByName('FiCount').AsFloat) ;
          SysCashUp[1,2]:= SysCashUp[1,2] -  dmDatabase.qGen.FieldByName('FAmt').AsFloat;
         end;
      end;
      dmDatabase.qGen.Next;
    end;
  end;

end;
   var
    i ,x: Integer ;
    ValueFound : Boolean ;
    const TypeOfPaymentArray : array [0..4] of string =('Cash','Credit Cards','Float','Cheques','Vouchers');
begin
  WriteReportOp('BPosSalesRpt',Bool2Str(Rpts1.Checked));
 { qrCashUpVariance := TqrCashUpVariance.Create(Self);
  QrPosSalesDetails:= TQrPosSalesDetails.Create(Self);
  try
  PrepareSalesReport;
  dmDatabase.QryPosSalesReport.Open;
  dmDatabase.tblDocLine.SQL.Text := 'select * from docline where WDocid in (Select WDocid from dochead where bposted = 0)' ;
  dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where bposted = 0' ;
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocLine.Open;
  dmDatabase.tblAccount.Open;
  dmDatabase.tblStock.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.First;
  dmDatabase.tblSysVars.Open;   }
  if (Rpts1.Checked=Rpts0.Checked) ANd (Not Rpts1.Checked) then
    Rpts1.Checked:=True;
{  if CBShowInvoice.Checked then
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
  else  }
  if not Rpts1.Checked then
  begin

    dmDatabase.tblGroups.Filter:='WGroupTypeID=31';
  dmDatabase.tblGroups.Filtered:=True;
  dmDatabase.tblGroups.open ;
  dmDatabase.tblGroups.First ;
  i := 0 ;
  vtCashup.DisableControls ;

  try
  while not vtCashup.IsEmpty do
   vtCashup.Delete ;
   
     for x := 0 to 4 do
         begin
           TotSysCashUp[0,x] := 0 ;
           TotSysCashUp[1,x] := 0 ;
          end;

  while not dmDatabase.tblGroups.Eof do
    begin
       LoadCompValues( dmDatabase.tblGroupsWGROUPID.AsInteger);
       ValueFound := False ;
         for x := 0 to 4 do
          begin
             ValueFound := ValueFound or (SysCashUp[0,x] <> 0 ) or ( SysCashUp[1,x]<> 0);
          end ;
      if ValueFound then
       for x := 0 to 4 do
         begin
       vtCashup.insert ;
       inc(i);
       vtCashupid.AsInteger := i ;
       vtCashupuser.AsString := dmDatabase.tblGroupsSDESCRIPTION.AsString ;
       vtCashupcashname.AsString := TypeOfPaymentArray[x] ;
       vtCashupvalue1.AsFloat := SysCashUp[0,x] ;
       vtCashupvalue2.AsFloat := SysCashUp[1,x] ;
       vtCashup.post ;
       end;
       for x := 0 to 4 do
         begin
           TotSysCashUp[0,x] := TotSysCashUp[0,x] +SysCashUp[0,x];
           TotSysCashUp[1,x] :=TotSysCashUp[1,x] +SysCashUp[1,x];
          end;
      dmDatabase.tblGroups.next ;
    end;
    if vtCashup.RecordCount > 5 then
      begin
        for x := 0 to 4 do
         begin
       vtCashup.insert ;
       inc(i);
       vtCashupid.AsInteger := i ;
       vtCashupuser.AsString := 'Totals' ;
       vtCashupcashname.AsString := TypeOfPaymentArray[x] ;
       vtCashupvalue1.AsFloat := TotSysCashUp[0,x] ;
       vtCashupvalue2.AsFloat := TotSysCashUp[1,x] ;
       vtCashup.post ;
       end;

      end;
   finally
       vtCashup.EnableControls ;
   end;
    TDatabaseTableRoutines.DumpToReportmanTransport(vtCashup);
    ExecReport(ExtractFilePath(Application.ExeName)+'plug_ins\reports\GENERAL\documents\oldposcashup.rep','');
  end else
  begin
    ExecReport(ExtractFilePath(Application.ExeName)+'plug_ins\reports\GENERAL\documents\oldpossales.rep','');
  end;
 {
  if Rpts1.Checked then
    PrintReportProcess(0,QrPosSalesDetails,'1')
  else
    PrintReportProcess(0,qrCashUpVariance,'1'); 
  dmDatabase.tblSysVars.Close;             }
 dmDatabase.tblGroups.Close;
 {  dmDatabase.tblStock.Close;
  dmDatabase.tblDocHeadEr.Close;
  dmDatabase.tblDocLine.Close;
  dmDatabase.tblAccount.Close;
  finally
   FreeAndNil(qrCashUpVariance);
   FreeAndNil(QrPosSalesDetails);
  end;   }
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

procedure TfmPosReportOptions.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(bPrint.Glyph,'Printer');

 
 
  Rpts0.Checked := not ReadReportOp('BPosSalesRpt',True).AsBoolean;
  if (Rpts1.Checked=Rpts0.Checked) ANd (Not Rpts1.Checked) then
    Rpts1.Checked:=True;
//  if not Rpts1.Checked then
//   Rpts0.Checked:=True;

  btnOK.Caption := GetTextLang(167); //OK 167
  btnCancel.Caption :=  GetTextLang(168);//Cancel 168
  if BFromPosClose then btnCancel.Caption :=  GetTextLang(677);//Continue 
 



  Rpts0.Caption :=GetTextLang(2988);
  Rpts1.Caption :=GetTextLang(2989);
  BGReports.Caption :=GetTextLang(1329);
  caption := GetTextLang(3039);// pos report option
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

procedure TfmPosReportOptions.bPrintClick(Sender: TObject);
begin
   BtnOkClick(self); 
end;

end.
