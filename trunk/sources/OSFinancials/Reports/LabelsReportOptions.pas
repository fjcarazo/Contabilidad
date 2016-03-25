(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit LabelsReportOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, wwdbedit, Wwdotdot,
  Wwdbcomb,Variants, wwcheckbox,barcode;

type
  TfmLabelsReportOptions = class(TForm)
    ButtonPanel: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    BitBtn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbcomboxSequence: TwwDBComboBox;
    dbcbSpecFile: TwwDBComboBox;
    dbedtFromAccount: TwwDBEdit;
    dbedtToAccount: TwwDBEdit;
    cbShowLines: TwwCheckBox;
    CBTypeOfBarcode: TComboBox;
    LCBTypeOfBarcode: TLabel;
    EFCount: TEdit;
    LQty: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CBSellingPrice: TComboBox;
    LSellingPrice: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure edtCountChange(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EFCountExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;

  public
    UseDocLines : Boolean ;

    { Public declarations }
  end;

var
  fmLabelsReportOptions: TfmLabelsReportOptions;

implementation

uses Database, Labels, GlobalFunctions, HtmlHelpAPI, Main, TcVariables,
  DatabaseAccess,XRoutines;

{$R *.DFM}

procedure TfmLabelsReportOptions.btnOkClick(Sender: TObject);
Var
 SqlString : String ;
begin
 // Dont allow a other click.
 btnOk.Enabled := false ;
 try
  SaveReoprtOp;
  if dbcomboxSequence.ItemIndex>=0 then
  begin
    Case iDDocTYpe of
    3: begin
         dmDatabase.tblStock.Open;
         if dmDatabase.tblStock.Locate('SSTOCKCODE',sFromID,[]) then
           sFromID:= dmDatabase.tblStockSDescription.Value;
         if dmDatabase.tblStock.Locate('SSTOCKCODE',sToID,[]) then
           sToID:= dmDatabase.tblStockSDescription.Value;
         dmDatabase.tblStock.Close;
       end;
    2:Begin
       dmDatabase.tblAccount.Filtered:=False;
       dmDatabase.tblAccount.Open;
       if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WACCOUNTTYPEID',VarArrayOf([sFromID,2]),[]) then
         sFromID := dmDatabase.tblAccountSDescription.Value;
       if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WACCOUNTTYPEID',VarArrayOf([sToiD,2]),[]) then
         sToID := dmDatabase.tblAccountSDescription.Value;
       dmDatabase.tblAccount.Open;
    end;
    else
       dmDatabase.tblAccount.Filtered:=False;
       dmDatabase.tblAccount.Open;
       if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WACCOUNTTYPEID',VarArrayOf([sFromID,1]),[]) then
         sFromID := dmDatabase.tblAccountSDescription.Value;
       if dmDatabase.tblAccount.Locate('SACCOUNTCODE;WACCOUNTTYPEID',VarArrayOf([sToiD,1]),[]) then
         sToID := dmDatabase.tblAccountSDescription.Value;
       dmDatabase.tblAccount.Open;
    end;
  end;
  SwapStr(sFromID,sToID);
  sToID := QuotedStr(sToID);
  sFromID := QuotedStr(sFromID);

  With dmDatabase do begin
    tblReportingOptions.Edit;
    tblReportingOptions.Post;
    tblLabSpecs.Locate('SDESCRIPTION',dbcbSpecFile.text,[]);
    if IDDocType=3 then
    begin
      qGen.Close;
      qGen.SQL.Clear;

      if dbcomboxSequence.ItemIndex=1 then
         begin
           SqlString := ' and Stock.SDescription>='+sFromID+' AND Stock.SDescription<='+sToID   ;
           qGen.SQL.text := format(dmDatabase.SQLList.GetFormatedSQLByName('Labels_SelectStock'),[IntToStr(CBSellingPrice.ItemIndex+1),SqlString,IntToStr(CBSellingPrice.ItemIndex+1),SqlString]);
           qGen.SQL.Add(' Order by 3') ;
         end 
      else
         begin
         SqlString := ' and SSTOCKCODE>='+sFromID+' AND SSTOCKCODE<='+sToID ;
         qGen.SQL.text := format(dmDatabase.SQLList.GetFormatedSQLByName('Labels_SelectStock'),[IntToStr(CBSellingPrice.ItemIndex+1),SqlString,IntToStr(CBSellingPrice.ItemIndex+1),SqlString]);
         qGen.SQL.Add(' Order by 1');
         end;
      qGen.Open;
    end
    else
    begin
      qGen.Close;
      qGen.SQL.Clear;
      If IDDocType=1 then
        qGen.SQL.Add('Select Account.SDescription , Debtor.SPostal1 , Debtor.SPostal2, '+
                 ' Debtor.Spostal3 , Debtor.SpostalCode ,'+
                 ' Account.SDescription, Account.WAccountID '+
                 ' From Account,Debtor '+
                 ' where  Debtor.WAccountID = Account.WAccountID ')
      else
        qGen.SQL.Add('Select Account.SDescription , Creditor.SPostal1 , Creditor.SPostal2, '+
                 ' Creditor.Spostal3 , Creditor.SpostalCode ,'+
                 ' Account.SDescription, Account.WAccountID '+
                 ' From Account,Creditor '+
                 ' where  Creditor.WAccountID = Account.WAccountID ');
      if dbcomboxSequence.ItemIndex=1 then
        qGen.SQL.Add(' And Account.SDescription>='+sFromID+' And Account.SDescription<='+sToID+
                   ' Order By 1')
      else if dbcomboxSequence.ItemIndex=2 then

      else
        qGen.SQL.Add(' And Account.SACCOUNTCODE>='+sFromID+' And Account.SACCOUNTCODE<='+sToID+
                   ' Order By 1 ');
      qGen.Open;
    end;
  end;

  qrLabelsReport := TqrLabelsReport.Create(Self);
  try
  qrLabelsReport.WinControlFormCreate(nil);
  qrLabelsReport.ABarcode.Typ := TBarcodeType(CBTypeOfBarcode.itemindex) ;
  qrLabelsReport.Count := StrToInt(EFCount.text);
  qrLabelsReport.SellingPrice := CBSellingPrice.ItemIndex ;
  qrLabelsReport.LabelBand.Frame.DrawTop := cbShowLines.Checked;
  qrLabelsReport.LabelBand.Frame.DrawBottom := cbShowLines.Checked;
  qrLabelsReport.LabelBand.Frame.DrawLeft := cbShowLines.Checked;
  qrLabelsReport.LabelBand.Frame.DrawRight := cbShowLines.Checked;
  PrintReportProcess(cbDestination.ItemIndex,qrLabelsReport,edtCount.Text);
  finally
   FreeAndNil(qrLabelsReport);
  end;
  if OptionsClose then Close
  else FormShow(Sender);
  finally
      btnOk.Enabled := True ;
  end;
end;

procedure TfmLabelsReportOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
        begin
          if IDDocType=1 then
             HtmlShowTopic(180)
          else if IDDocType=2 then
             HtmlShowTopic(172)
          else
             HtmlShowTopic(208);
             key := 0;

        end;

end;

procedure TfmLabelsReportOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmLabelsReportOptions.FormShow(Sender: TObject);
begin



  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  Caption:=GetTextLang(1042);
  Case IdDocType of
  3: Caption := Caption +'-'+ GetTextLang(869);// ' - Stock';
  2: begin
      Caption := Caption +'-'+ GetTextLang(161);// ' - Creditors';
      LSellingPrice.Visible := false ;
      CBSellingPrice.Visible := false ;
     end ;
  else
    Caption := Caption +'-'+ GetTextLang(160);//' - Debtors';
    LSellingPrice.Visible := false ;
    CBSellingPrice.Visible := false ;

  end;
   dmDatabase.tblSysVars.Open;


  CBSellingPrice.Items[0] := dmDatabase.tblSysVarsSSellingPriceName1.Value;
  CBSellingPrice.Items[1] := dmDatabase.tblSysVarsSSellingPriceName2.Value;
  CBSellingPrice.Items[2] := dmDatabase.tblSysVarsSSellingPriceName3.Value;


  dmDatabase.tblSysVars.Close;

  dbcbSpecFile.Clear;
  with DmDatabase do begin
     tblReportingOptions.Open;
     tblLabSpecs.Open;
     tblLabSpecs.First;
     while not tblLabSpecs.eof do begin
       dbcbSpecFile.Items.Add(tblLabSpecsSDescription.value);
       tblLabSpecs.Next;
     end;
     tblReportingOptions.Edit;
  end;
  // load Print Modes
  LoadReoprtOp;
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  if UseDocLines then
    begin
      Label1.Visible := false ;
      dbedtFromAccount.Visible := false ;
      BitBtn2.Visible := false ;
      Label4.Visible := false ;
      dbedtToAccount.Visible := false ;
      BitBtn3.Visible := false ;
      dbcomboxSequence.Visible := false ;
      Label3.Visible := false ;
      EFCount.Visible := false ;
      LQty.Visible := false ;
    end;
  LSellingPrice.Caption := GetTextLang(416);//sellingprice

end;

procedure TfmLabelsReportOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with dmDatabase do begin
     tblLabSpecs.Close;
  end;   
end;

procedure TfmLabelsReportOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmLabelsReportOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmLabelsReportOptions.cbDestinationChange(Sender: TObject);
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

procedure TfmLabelsReportOptions.BitBtn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

Procedure TfmLabelsReportOptions.LoadReoprtOp;
begin
CBTypeOfBarcode.Visible := false ;
LCBTypeOfBarcode.Visible := false ;
CBSellingPrice.Visible := false ;
    LQty.Caption := GetTextLang(413);
//  edtFromCode.Text :=  ReadReportOp('SStockListFromCode').AsString;
  if IDDocType=3 then
  begin
    dbcomboxSequence.Items.Add(GetTextLang(213){'Stock Code'});
    dbcomboxSequence.Items.Add(GetTextLang(1058){'Stock Description'});
    dmDatabase.tblSysVars.Open;
    dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName1.Value);
    dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName2.Value);
    dmDatabase.tblSysVars.Close;
    dbedtFromAccount.Text :=  ReadReportOp('SStklabelFromStk').AsString;
    dbedtToAccount.Text :=  ReadReportOp('SStklabelToStk').AsString;
    dbcbSpecFile.ItemIndex := dbcbSpecFile.Items.IndexOf(ReadReportOp('SStkSpecFile').AsSTring);
    dbcomboxSequence.ItemIndex := dbcomboxSequence.Items.IndexOf(ReadReportOp('SStklabelSSequence').AsSTring);
    cbShowLines.Checked := ReadReportOp('BStkLabelsShowLines').AsBoolean;
    CBTypeOfBarcode.Visible := True ;
    LCBTypeOfBarcode.Visible := True ;
    CBSellingPrice.Visible := True ;
    CBTypeOfBarcode.ItemIndex :=  ReadReportOp('ITypeOfBarcode',3).Asinteger;

    EFCount.Text :=  ReadReportOp('ILBLStockCount',1).AsString;

    CBSellingPrice.ItemIndex := CBSellingPrice.Items.IndexOf(ReadReportOp('LBLSellingPRice').AsSTring);
    if CBSellingPrice.ItemIndex < 0 then CBSellingPrice.ItemIndex := 0 ;

  end
  else
  begin
    dbcomboxSequence.Items.Add(GetTextLang(176){'Account Number'});
    dbcomboxSequence.Items.Add(GetTextLang(1108){'Account Description'});
    dbcomboxSequence.Items.Add(GetTextLang(1109){'Account Group'});
    dbcbSpecFile.ItemIndex := dbcbSpecFile.Items.IndexOf(ReadReportOp('SDcSpecFile').AsSTring);
    dbcomboxSequence.ItemIndex := dbcomboxSequence.Items.IndexOf(ReadReportOp('SDClabelSSequence').AsSTring);
    cbShowLines.Checked := ReadReportOp('BDcLabelsShowLines').AsBoolean;
    if IDDocType=2 then
    begin
     dbedtFromAccount.Text :=  ReadReportOp('SDebtlabelFromAcc').AsString;
     dbedtToAccount.Text :=  ReadReportOp('SDebtlabelToAcc').AsString;
     EFCount.Text :=  ReadReportOp('ILBLDebCount',1).AsString;
    end
    else
    begin
      dbedtFromAccount.Text :=  ReadReportOp('SCredlabelFromAcc').AsString;
      dbedtToAccount.Text :=  ReadReportOp('SCredlabelToAcc').AsString;
      EFCount.Text :=  ReadReportOp('ILBLCredCount',1).AsString;
    end;
  end;
    if IDDocType=3 then
       begin
        sFromID := dbedtFromAccount.Text;
        sToID := dbedtToAccount.Text;
       end
    else
    begin
     sFromID := ZipAccountCode(dbedtFromAccount.Text);
     sToID := ZipAccountCode(dbedtToAccount.Text);
    end;

end;

Procedure TfmLabelsReportOptions.SaveReoprtOp;
begin
  if IDDocType=3 then
  begin
    WriteReportOp('SStklabelSSequence',dbcomboxSequence.Text);
    WriteReportOp('SStkSpecFile',dbcbSpecFile.Text);
    WriteReportOp('BStkLabelsShowLines',Bool2Str(cbShowLines.Checked));
    WriteReportOp('SStklabelFromStk',dbedtFromAccount.Text);
    WriteReportOp('SStklabelToStk',dbedtToAccount.Text);
    WriteReportOp('ITypeOfBarcode',IntToSTR(CBTypeOfBarcode.ItemIndex));
    WriteReportOp('ILBLStockCount',EFCount.Text  ) ;
    WriteReportOp('LBLSellingPRice',CBSellingPrice.Text  ) ;
  end
  else
  begin
    if IDDocType=2 then
    begin
      WriteReportOp('SDebtlabelFromAcc',dbedtFromAccount.Text  ) ;
      WriteReportOp('SDebtlabelToAcc',dbedtToAccount.Text  ) ;
      WriteReportOp('ILBLDebCount',EFCount.Text  ) ;
    end
    else
    begin
      WriteReportOp('SCredlabelFromAcc',dbedtFromAccount.Text  ) ;
      WriteReportOp('SCredlabelToAcc',dbedtToAccount.Text  ) ;
      WriteReportOp('ILBLCredCount',EFCount.Text  ) ;
    end;
    WriteReportOp('SDClabelSSequence',dbcomboxSequence.Text);
    WriteReportOp('SDcSpecFile',dbcbSpecFile.Text);
    WriteReportOp('BDcLabelsShowLines',Bool2Str(cbShowLines.Checked));
  end;

end;

procedure TfmLabelsReportOptions.EFCountExit(Sender: TObject);
var
 Text : String ;
 i : Integer ;
begin
 Text :=  EFCount.Text ;
 for i := Length(Text) downto 1 do
   begin
      if not (Text[i] in ['0','1','2','3','4','5','6','7','8','9','0']) then
        Delete(Text,i,1);
   end;
 if Text <> '' then
     begin
       if strtoint(Text) <1 then
        Text := '1';
     end else
     Text := '1' ;
 EFCount.Text := Text ;
end;

procedure TfmLabelsReportOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtFromAccount.Color := clHighlight;
  if IDDocType=3 then
   dbedtFromAccount.Text  := CallLookup(dbedtFromAccount.Text, 7)
  else
  if IDDocType=1 then
    dbedtFromAccount.Text  := CallLookup(dbedtFromAccount.Text, 3)
  else
    dbedtFromAccount.Text  := CallLookup(dbedtFromAccount.Text, 4);
  dbedtFromAccount.Color := clWindow;
  FromID := ReturnID;
  if IDDocType=3 then
   sFromID := ReturnLookup
  else
  sFromID:= ZipAccountCode(ReturnLookup);
  SelectNext(ActiveControl, True, True);
end;

procedure TfmLabelsReportOptions.BitBtn3Click(Sender: TObject);
begin
  dbedtToAccount.Color := clHighlight;
  if IDDocType=3 then
    dbedtToAccount.Text  := CallLookup(dbedtToAccount.Text, 7)
  else
  if IDDocType=1 then
    dbedtToAccount.Text  := CallLookup(dbedtToAccount.Text, 3)
  else
    dbedtToAccount.Text  := CallLookup(dbedtToAccount.Text, 4);
  dbedtToAccount.Color := clWindow;
  ToID := ReturnID;
  if IDDocType=3 then
   sToID := ReturnLookup
  else
  sToID:= ZipAccountCode(ReturnLookup);
  SelectNext(ActiveControl, True, True);
end;

end.
