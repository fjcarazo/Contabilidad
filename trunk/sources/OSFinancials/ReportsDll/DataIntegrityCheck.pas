(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DataIntegrityCheck;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FileCtrl,StdCtrls, Buttons, ExtCtrls, ComCtrls,DB,Wwquery,ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni,ZConnection;

type
  TfmDataIntegrityCheck = class(TForm)
    stBar1: TStatusBar;
    ButtonPanel: TPanel;
    BtnCheck: TBitBtn;
    BtnCancel: TBitBtn;
    btnClose: TBitBtn;
    Timer1: TTimer;
    Panel1: TPanel;
    DataCheck1: TCheckBox;
    DataCheck2: TCheckBox;
    DataCheck3: TCheckBox;
    DataCheck5: TCheckBox;
    DataCheck6: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnlDroit: TPanel;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    BitBtn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    Label6: TLabel;
    DataCheck4: TCheckBox;
    Panel2: TPanel;
    LblT6: TLabel;
    cbBooks: TComboBox;
    lblBooksDir: TLabel;
    lblLst: TLabel;
    sbBrowse: TSpeedButton;
    procedure BtnCheckClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbBrowseClick(Sender: TObject);
    procedure cbBooksChange(Sender: TObject);
  private
   Procedure  StartLabel;
   Procedure  EndLabel;
   Procedure  FilesTest;
   Procedure  CheckTb ;
   Procedure  CountAllAccounts;
   Procedure  CheDetorsCreditors;
   Procedure  UnpostedBats;
   Procedure  ShowDefaultStatusText;
    { Private declarations }
  public
    { Public declarations }
  end;


var
  fmDataIntegrityCheck      : TfmDataIntegrityCheck;
  CheckPos   : Integer;
  EscState   : Boolean;
  tcDocUnposted,
  tcDocUnpostedDetails,
  dicAccountID,
  dicFAmount,
//  tcCrFAmount,
//  tcDtOutStanding,
  DicOutStanding,
  DicTotals,
//  tcCrTotals,
  tcDatePeriod,
  tcTbbyPeriodDT,
  tcTbbyPeriodCr,
  tcFilesSize,
  tcFilesList      : TStringList;
  //chConnection  : String;
  CountAccount : Array [0..6] of String;

implementation

uses Database, DataIntegrityCheckReport, Main, GlobalFunctions, TcVariables,
  DatabaseAccess,TCashClasses;

{$R *.DFM}

Procedure  TfmDataIntegrityCheck.ShowDefaultStatusText;
begin
  stBar1.SimpleText := gettextlang(2168){'Set of Books location :}+ ' '+ LblBooksDir.Caption;
  stBar1.Repaint;
end;


Procedure  TfmDataIntegrityCheck.CountAllAccounts;
Var
 i:Integer;
begin
  // Init
  For i:=0 to 6 do CountAccount[i]:='Error';
  With dmDatabase do begin
    tblAccount.Open;
    for i:=0 to 4 do begin
      //i=5 Count All Accounts;
      //i=0 Count General Ledger Accounts
      //i=1 Count Debtors Accounts
      //i=2 Count Creditors Accounts
      //i=3 Count Bank Accounts
      //i=4 Count Tax Accounts
      tblAccount.Filtered:=False;
      tblAccount.Filter:='WAccountTypeID='+IntToStr(i);
      tblAccount.Filtered:=True;
      CountAccount[i]:=IntToStr(tblAccount.RecordCount);
    end;
    // Count All
    tblAccount.Filtered:=False;
    tblAccount.Filter:='';
    CountAccount[6]:=IntToStr(tblAccount.RecordCount);
    tblAccount.Close;
     // Count Stock Items
  end;
end;

Procedure  TfmDataIntegrityCheck.StartLabel;
begin
  with FindComponent('Label' + IntToStr(CheckPos)) as TLabel do begin
    caption:='***';
    font.color:=clBlue;
    repaint;
  end;
end;

Procedure  TfmDataIntegrityCheck.EndLabel;
begin
  with FindComponent('Label' + IntToStr(CheckPos)) as TLabel do begin
    caption:=GetTExtLang(454){'finished'};
    font.color:=clblack;
    repaint;
  end;
end;

procedure TfmDataIntegrityCheck.BtnCheckClick(Sender: TObject);
Var
  i:integer;
begin
   DoCloseSetOfBooks(True);
   //DmDatabase.Open ;
   DmDatabase.ConnectToBooks(TBooksCollectionItem(cbBooks.items.Objects[cbBooks.itemindex]));
   EscState:=False;
   btnClose.Enabled:=False;
   btnCheck.Enabled:=False;
   // get Period Descriptions
   tcDatePeriod.Clear;
   tcDatePeriod.Add('00  Openning Balances');
   for i:=1 to 26 do
     tcDatePeriod.Add(t3FormatStr(i,2)+'  ');
   with dmDatabase do begin
     try
       tblPeriods.Open;

       While not tblPeriods.Eof do begin
         i:= tblPeriodsWPeriodID.Value;
         tcDatePeriod[i]:=tcDatePeriod[i]+
                          DateToStr(tblPeriodsDStartDate.Value)+'-'+
                          DateToStr(tblPeriodsDEndDate.Value);
         tblPeriods.Next;
//         if EscState then Exit;
       end;
     Finally
       tblPeriods.Close;
     end;
     if tcDatePeriod.Count<26 then
       For i:=1 to 26-tcDatePeriod.Count do tcDatePeriod.add('...');
   end;
   //
   For i:=1 to 5 do begin
     if EscState then Break;
     with FindComponent('DataCheck' + IntToStr(i)) as TCheckBox do begin
       if Checked then begin
         Font.Color:=clBlue;
         // Start check
         Timer1.Enabled:=True;
         CheckPos:=i;
         StartLabel;
         case i of
         1: FilesTest;
         2: CheckTb;
         3: CountAllAccounts;
         4: CheDetorsCreditors;
         5: UnpostedBats;
         6: ;
         end;
         EndLabel;
         ShowDefaultStatusText;
         // End check
         Timer1.Enabled:=False;
         Font.Color:=clBlack;
         Application.ProcessMessages;
       end;
     end;
   end;
   ShowDefaultStatusText;
   if Not EscState then begin
      // Print Report;
      // Create report
     qrDataIntegrityCheck := TqrDataIntegrityCheck.Create(self);
     // swich off Bands if empty by set PrintCount=0
     if DicAccountID.Count>0 then
      qrDataIntegrityCheck.QRLoopDtCrLink.PrintCount:=DicAccountID.Count+1
     else
      qrDataIntegrityCheck.QRLoopDtCrLink.PrintCount:=0;
     if tcDocUnposted.Count>0 then
       qrDataIntegrityCheck.qrUnposted.PrintCount:=tcDocUnposted.Count+1
     else
       qrDataIntegrityCheck.qrUnposted.PrintCount:=0;
     if tcDatePeriod.Count>0 then
       qrDataIntegrityCheck.qrTbChkeck.PrintCount:=tcDatePeriod.Count+1
     else
       qrDataIntegrityCheck.qrTbChkeck.PrintCount:=0;
     PrintReportProcess(cbDestination.ItemIndex,qrDataIntegrityCheck,edtCount.Text);
     qrDataIntegrityCheck.Free;
   end;
//   Memo1.Free;
   btnClose.Enabled:=True;
   btnCheck.Enabled:=True;
end;


procedure TfmDataIntegrityCheck.Timer1Timer(Sender: TObject);
begin
  with FindComponent('Label' + IntToStr(CheckPos)) as TLabel do begin
    if caption = '***' then
      caption:=''
    else
      caption:='***';
    Repaint
  end;

end;

Procedure  TfmDataIntegrityCheck.FilesTest;
Var
  Compt,
  vFileSize,
  i:Integer;
  F:TSearchRec;
  TmpStr:String;
begin
  Dmdatabase.ZMainConnection.GetTableNames(  '*.*', tcFilesList);
    // Get Files Sizes
      tcFilesSize.Clear;
      for i:=0 to tcFilesList.Count-1 do
         begin
         stBar1.SimpleText:='Checking : '+tcFilesList[i];
         stBar1.Repaint;
         // Test ESC State
         if EscSTate then Break;
         // Open Table and Get RecordCount;
          With dmDatabase do
            begin
            QGen.Close;
            tmpStr := tcFilesList[i] + ' ' ;
            QGen.SQL.Clear;
            qGen.Sql.Add('Select count(*) From '+tcFilesList[i]);
            Try
              qGen.Open;
              tmpStr:=tmpStr+IntToStr(qGen.fields[0].asInteger);
            Finally
              qGen.Close;
            end;
          end;
          tcFilesSize.Add(tmpStr)
       end ;

end;

procedure TfmDataIntegrityCheck.FormCreate(Sender: TObject);
Var
 i : Integer ;
begin
   tcDocUnposted:=TStringList.create;
   tcDocUnpostedDetails:=TStringList.create;
   DicAccountID:=TStringList.create;
   tcDatePeriod :=TStringList.create;
   tcFilesList :=TStringList.create;
   tcTbbyPeriodDt :=TStringList.create;
   tcTbbyPeriodCr :=TStringList.create;
   tcFilesSize :=TStringList.create;
   DicFAmount:=TStringList.create;
   DicOutStanding:=TStringList.create;
   DicTotals:=TStringList.create;
   with dmDatabase do begin
     lblBooksDir.Caption := tblAccount.Connection.database;

     cbBooks.Items.Clear;
    for i := 0 to TheGlobalDataObject.Books.Count -1 do
     begin
       cbBooks.items.AddObject(TheGlobalDataObject.Books[i].Name,TheGlobalDataObject.Books[i]);
     end;
     if TheGlobalDataObject.Books.ActiveBooks <> nil  then
     cbBooks.ItemIndex:=cbBooks.Items.IndexOf(TheGlobalDataObject.Books.ActiveBooks.Name);
     ShowDefaultStatusText;
   end;

end;

procedure TfmDataIntegrityCheck.FormShow(Sender: TObject);
var
  i:integer;
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
  if Label1.Caption='Label1' then
  for i:=1 to 6 do
    with FindComponent('Label'+IntToStr(i)) as TLabel do
      Caption:='';
end;

procedure TfmDataIntegrityCheck.cbDestinationChange(Sender: TObject);
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

procedure TfmDataIntegrityCheck.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmDataIntegrityCheck.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;

end;

procedure TfmDataIntegrityCheck.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmDataIntegrityCheck.BitBtn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
  edtCount.Text:= IntToStr(prnvars.NumCopies);
end;

procedure TfmDataIntegrityCheck.FormDestroy(Sender: TObject);
begin
  tcDocUnposted.Free;
  tcDocUnpostedDetails.Free;
  DicAccountID.Free;
//  tcDtFAmount.Free;
  DicFAmount.Free;
  DicOutStanding.Free;
//  tcCrOutStanding.Free;
//  tcDtTotals.Free;
  DicTotals.Free;
  tcFilesList.Free;
  tcTbbyPeriodDT.Free;
  tcTbbyPeriodCR.Free;
  tcDatePeriod.Free;
  tcFilesSize.Free;
end;

Procedure  TfmDataIntegrityCheck.CheckTb;
Var
  Tmp:Real;
  i:Integer;
begin
   dmDatabase.QGen.Close;
  // dmDatabase.QGen.Connection:= LblBooksDir.Caption;
   dmDatabase.QGen.SQL.Clear;
     dmDatabase.QGen.SQL.Add('SELECT WPeriodID,cast(cast(Sum(FAmount*100) as integer) as Float) / 100 as Sum1 From Totals,Account '+
                           ' Where BActual=1 '+
                           ' And Account.WaccountID=Totals.WAccountID'+
                           ' And Account.SSUBACCOUNTCODE='  + QuotedStr('000') +
                           ' And Account.WAccountTypeID<>1'+
                           ' And Account.WAccountTypeID<>2'+
                           ' Group by WPeriodID,Account.WAccountID ');
   tcTbbyPeriodDt.Clear;
   tcTbbyPeriodCr.Clear;
   // Put 0 for All Periods,
   For i:=0 to 26 do
   begin
     tcTbbyPeriodDt.Add('0');
     tcTbbyPeriodCr.Add('0');
   end;
   try
     dmDatabase.QGen.Active:=True;
     dmDatabase.QGen.First;
     While not dmDatabase.QGen.eof do
     begin
       i   := dmDatabase.QGen.FieldByName('WPeriodID').AsInteger;
       Tmp := dmDatabase.QGen.FieldbyName('Sum1').AsFloat;
       if tmp>0 then
         tcTbbyPeriodDt[i]:= FloatToStr(StrToFloat(tcTbbyPeriodDt[i]) + tmp)
       else
         tcTbbyPeriodCr[i]:= FloatToStr(StrToFloat(tcTbbyPeriodCr[i]) + Abs(tmp));
       dmDatabase.QGen.Next;
     end;
   Finally
     dmDatabase.QGen.Active:=False;
   end;
end;

Procedure  TfmDataIntegrityCheck.CheDetorsCreditors;
Var
  AccountID:Integer;
  FAmount,
  FOutStanding,
  FTotals : Real;
  TmpStr:String;
begin
 with dmDatabase do begin
   qGen.Close;
   qGen.Sql.Clear;
   qGen.SQL.Text:='Select WAccountID,cast(cast(Sum(Famount *100) as integer) as Float) / 100 As FAmt, cast(cast(Sum(FOutStandingAmount *100) as integer) as Float) / 100  FoutAmt From Transact Group By WAccountID;';
   qGenii.Close;
   qGenii.SQL.Clear;
   qGenii.SQL.Add('Select Account.WAccountID,cast(cast(Sum(Famount*100) as integer) as Float) / 100 As Famt,Account.WAccountTypeID,Account.SACCOUNTCODE,Account.SDescription From Totals,Account');
   qGenii.SQL.Add(' Where Account.WAccountID=Totals.WaccountID AND Totals.BActual=1 AND (Account.WAccountTYpeID=2 or Account.WAccountTYpeID=1) AND (Totals.WPeriodID=0 or Totals.WPeriodID>=14) Group By Account.WAccountID'+',Account.WAccountTypeID,Account.SACCOUNTCODE,Account.SDescription');
   qGen.Open;
   qGenii.Open;
   DicAccountID.Clear;
   DicFAmount.clear;
   DicOutStanding.clear;
   DicTotals.clear;

   qGenii.First;
   While Not qGenii.Eof do
   begin
     FAmount := 0;
     FOutStanding := 0;
     FTotals := qGenii.FieldbyName('FAmt').AsFloat;
     if qGen.Locate('WAccountID',qGenii.FieldbyName('WAccountID').AsInteger,[]) then
     begin
       FAmount := qGen.FieldbyName('FAmt').AsFloat;
       FOutStanding := qGen.FieldbyName('FOutAmt').AsFloat;
     end;
     FAmount := fixAmt(FAmount);
     FOutStanding := fixAmt(FOutStanding);
     FTotals := fixAmt(FTotals);
     TmpStr:='';
     if (FAmount<>FOutStanding) OR (FAmount<>FTotals) then
     begin
       TmpStr:=qGenii.FieldbyName('WAccountID').AsString+'<>';
       if qGenii.FieldbyName('WAccountTypeID').AsInteger =1 then
         TmpStr:=TmpStr+' D'+qGenii.FieldbyName('SACCOUNTCODE').AsString+'<>'+qGenii.FieldbyName('SDescription').AsString
       else if qGenii.FieldbyName('WAccountTypeID').AsInteger =2 then
         TmpStr:=TmpStr+' C'+qGenii.FieldbyName('SACCOUNTCODE').AsString+'<>'+qGenii.FieldbyName('SDescription').AsString
       else
         TmpStr:=TmpStr+' G'+qGenii.FieldbyName('SACCOUNTCODE').AsString+'<>'+qGenii.FieldbyName('SDescription').AsString;
       DicAccountID.Add(TmpStr);
       DicTotals.Add(FloatToStr(FTotals));
       DicFAmount.Add(FloatToStr(FAmount));
       DicOutStanding.Add(FloatToStr(FOutStanding));
     end;
     stBar1.SimpleText := TmpStr;
     qGenii.Next;
     Application.ProcessMessages;
   end;
 end;
end;

procedure TfmDataIntegrityCheck.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  Case Key of
  #27:Begin
       EscState:=True;
       Key:=#0;
      end;
  end;
end;

Procedure  TfmDataIntegrityCheck.UnpostedBats;
Var
  Tmp,
  vBatchFile:String;
begin
  tcDocUnposted.Clear;
  dmDatabase.tblUser.Open;
  dmDatabase.tblBatchControl.Open;
  dmDatabase.tblDocLine.Open;
  dmDatabase.tblBatchControl.Filtered := False;
  dmDatabase.tblBatchControl.Filter :=' BPosted = 0';
  dmDatabase.tblBatchControl.Filtered := True;
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocHeader.Filtered := False;
  dmDatabase.tblDocHeader.Filter := 'BPosted = 0';
  dmDatabase.tblDocHeader.Filtered := True;
  if dmDatabase.tblDocHeader.RecordCount>0 then begin
   dmDatabase.tblDocHeader.First;
   While not dmDatabase.tblDocHeader.Eof do begin
      begin
        Case dmDatabase.tblDocHeaderWTypeID.Value of
         11:tmp:=gettextlang(2152);
         12:tmp:=gettextlang(2153);
         13:tmp:=gettextlang(2154)
        else
          tmp:=gettextlang(2155);
        end;
        tmp:=tmp+'('+dmDatabase.tblDocHeaderSDocNo.AsString+')';
        tcDocUnposted.add(Tmp);

//        ListItem.subitems.add(DateToStr(dmDatabase.tblDocHeaderDdate.Value));

        dmDatabase.tblDocLine.Filtered:=False;
        dmDatabase.tblDocLine.Filter:='WDocID='+dmDatabase.tblDocHeaderWDocID.AsString;
        dmDatabase.tblDocLine.Filtered:=True;
//        ListItem.subitems.add(IntToStr(dmDatabase.tblDocLine.RecordCount));
      end;
      dmDatabase.tblDocHeader.Next;
    end;
  end;
  if dmDatabase.tblBatchControl.RecordCount > 0 then begin
     dmDatabase.tblBatchControl.First;
     dmDatabase.tblBatchTypes.open;
     While not dmDatabase.tblBatchControl.Eof do begin
          dmDatabase.tblBatchTypes.Locate('WBatchTypeID',dmDatabase.tblBatchControlWBatchTypeID.Value,[]);
          // Look Batch table infos
          dmDatabase.tblBatch.Close;
          vBatchFile := 'bat' + dmDatabase.tblBatchControlWUserID.AsString + IntToStr(dmDatabase.tblBatchControlWBatchTypeID.Value) ;
          dmDatabase.tblBatch.TableName := vBatchFile;
          if FileExists(vBatchFile) then Begin
            dmDatabase.tblBatch.Open;
            tmp:='Batch Entry ('+(dmDatabase.tblBatchTypesSDescription.Value)+')';

//            ListItem.subitems.add(IntToStr(dmDatabase.tblDocLine.RecordCount));
            if dmDatabase.tblUser.Locate('WUserID', dmDatabase.tblBatchControlWUserID.Value, []) then
//              ListItem.subitems.add(dmDatabase.tblUserSUserName.Value);
                   ;
          end;
        dmDatabase.tblBatchControl.Next;
     end
  end;
end;

procedure TfmDataIntegrityCheck.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(111);
             key := 0;

        end;
end;

procedure TfmDataIntegrityCheck.sbBrowseClick(Sender: TObject);
Var
  Temp:String;
begin
   Temp:=lblBooksDir.Caption;
   if Trim(Temp)='' then
    Temp := ApplicationPath;
   Temp:=ExcludeTrailingPathDelimiter(Temp);
   if SelectDIrectory(gettextlang(2109),'',Temp) then
     lblBooksDir.Caption:=Temp;
  ShowDefaultStatusText;
end;

procedure TfmDataIntegrityCheck.cbBooksChange(Sender: TObject);
begin
  if cbBooks.itemindex = -1 then exit ;

  lblBooksDir.Caption := TBooksCollectionItem(cbBooks.items.Objects[cbBooks.itemindex]).Database;
  ShowDefaultStatusText;
end;

end.
