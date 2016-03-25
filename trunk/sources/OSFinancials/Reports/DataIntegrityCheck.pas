(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit DataIntegrityCheck;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FileCtrl,StdCtrls, Buttons, ExtCtrls, ComCtrls,DB,  DBAccess , Uni,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, MemDS, VirtualTable, cxMemo,
  cxSplitter, cxImageComboBox;

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
    Label6: TLabel;
    DataCheck4: TCheckBox;
    Panel2: TPanel;
    LblT6: TLabel;
    cbBooks: TComboBox;
    lblBooksDir: TLabel;
    lblLst: TLabel;
    sbBrowse: TSpeedButton;
    BitBtn2: TBitBtn;
    vtdata: TVirtualTable;
    vtdataid: TIntegerField;
    vtdataline1: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsVtdata: TDataSource;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1line1: TcxGridDBColumn;
    vtdatawtype: TIntegerField;
    vtdataamt1: TFloatField;
    vtdataamt2: TFloatField;
    vtdataamt3: TFloatField;
    cxGrid1DBTableView1wtype: TcxGridDBColumn;
    cxGrid1DBTableView1amt1: TcxGridDBColumn;
    cxGrid1DBTableView1amt2: TcxGridDBColumn;
    cxGrid1DBTableView1amt3: TcxGridDBColumn;
    Bprint: TBitBtn;
    procedure BtnCheckClick(Sender: TObject);
    procedure InsertLogLine(Astring : String;aType:Integer;Value1:Double;Value2:Double=0;Value3:double=0 ) ; 
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbBrowseClick(Sender: TObject);
    procedure cbBooksChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure vtdataline1SetText(Sender: TField; const Text: String);
    procedure BprintClick(Sender: TObject);
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

uses Database,  Main, GlobalFunctions, TcVariables,
  DatabaseAccess,TCashClasses, NewProgress, OSFGeneralRoutines,variants,
  UDMTCCoreLink, ReverseBatch, Password, UDmQuantumGridDefs,
  UDMReportsGlobals, UReportManager,ledgerroutines;

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
  InsertLogLine('',0,0);
  InsertLogLine('Accounts check',0,0);

  // Init
  For i:=0 to 6 do CountAccount[i]:='Error';
  With dmDatabase do begin
    for i:=0 to 4 do begin
      //i=5 Count All Accounts;
      //i=0 Count General Ledger Accounts
      //i=1 Count Debtors Accounts
      //i=2 Count Creditors Accounts
      //i=3 Count Bank Accounts
      //i=4 Count Tax Accounts
      CountAccount[i]:= VarToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select count(*) from account where WAccountTypeID = '+  IntToStr(i)));
    end;
    // Count All
    tblAccount.Filtered:=False;
    tblAccount.Filter:='';
    CountAccount[6]:= varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select count(*) from account '));
    tblAccount.Close;

   InsertLogLine('General Ledger: '+CountAccount[0],0,StrToFloatDef(CountAccount[0],0));
   InsertLogLine('Debtors: '+CountAccount[1],0,StrToFloatDef(CountAccount[1],0));
   InsertLogLine('Creditors: '+CountAccount[2],0,StrToFloatDef(CountAccount[2],0));
   InsertLogLine('Bank : '+CountAccount[3],0,StrToFloatDef(CountAccount[3],0));
   InsertLogLine('Tax: '+CountAccount[4],0,StrToFloatDef(CountAccount[4],0));
   InsertLogLine('Total in the Set of Books: '+CountAccount[6],0,0);

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
  OldUser : Integer ;
  CurrentPAssword : String ;
begin
  vtdata.DisableControls ;
  cxGrid1DBTableView1.DataController.DataSource := nil ;
  try
   if cbBooks.itemindex = -1 then
    begin
     cbBooks.SetFocus ;
     Raise exception.create('Select a set of books first!');
    end;
   OldUser :=DMTCCoreLink.currentuser ;
    CurrentPAssword := pwdl_LastPassword ;
   CloseSetOfBooks;
   try

   //DmDatabase.Open ;
   DmDatabase.ConnectToBooks(TBooksCollectionItem(cbBooks.items.Objects[cbBooks.itemindex]));
   EscState:=False;
   btnClose.Enabled:=False;
   btnCheck.Enabled:=False;
   // get Period Descriptions
   tcDatePeriod.Clear;
   InsertLogLine('00  Openning Balances',1,0);
   tcDatePeriod.Add('00  Openning Balances');
   
   for i:=1 to 26 do
    begin
     tcDatePeriod.Add(t3FormatStr(i,2)+'  ');
    end;
   with dmDatabase do begin
     try
       tblPeriods.Open;

       While not tblPeriods.Eof do begin
         i:= tblPeriodsWPeriodID.Value;
         if i >= 0 then
               tcDatePeriod[i]:=tcDatePeriod[i]+  DateToStr(tblPeriodsDStartDate.Value)+'-'+  DateToStr(tblPeriodsDEndDate.Value);
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

   btnClose.Enabled:=True;
   btnCheck.Enabled:=True;
   finally
    AutoLoginPosPassword := CurrentPassword  ;
    OpenBooks(false) ;
    AutoLoginPosPassword := '' ;
   end;

   finally
   vtdata.EnableControls ;
   cxGrid1DBTableView1.DataController.DataSource := dsVtdata ;
   end;
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
  InsertLogLine('',2,0);
  InsertLogLine('Files check',2,0);
  Dmdatabase.ZMainConnection.GetTableNames(  tcFilesList);
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
              try
              qGen.Open;
              tmpStr:=tmpStr+IntToStr(qGen.fields[0].asInteger);
              InsertLogLine(tmpStr,2,qGen.fields[0].asInteger) ;
              except
                tmpStr := 'table not found ' + tcFilesList[i] ;
                InsertLogLine(tmpStr,2,0) ;
              end;

            Finally
              qGen.Close;
            end;
          end;
          tcFilesSize.Add(tmpStr) ;

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
     lblBooksDir.Caption := ZMainconnection.database;

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
 DMTCCoreLink.LoadImage(BtnCheck.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(btnClose.Glyph,'Close');
 DMTCCoreLink.LoadImage(sbBrowse.Glyph,'Search');
 DMTCCoreLink.LoadImage(Bprint.Glyph,'printer');



  if Label1.Caption='Label1' then
  for i:=1 to 6 do
    with FindComponent('Label'+IntToStr(i)) as TLabel do
      Caption:='';
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
  AProgress :  TfmNewProgress ;

begin
  InsertLogLine('',3,0);
  InsertLogLine('Trailbalance check',3,0);
 AProgress  :=  TfmNewProgress.create(nil) ;
 try
   dmDatabase.QGen.Close;
  // dmDatabase.QGen.Connection:= LblBooksDir.Caption;
   dmDatabase.QGen.SQL.Clear;
     dmDatabase.QGen.SQL.Add('SELECT WPeriodID, Sum(FAmount) as Sum1 From Totals,Account '+
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
     dmDatabase.QGen.Last;
     dmDatabase.QGen.First;
     AProgress.initProgress('...',dmDatabase.QGen.RecordCount);
     While not dmDatabase.QGen.eof do
     begin
       AProgress.SetProgress('',dmDatabase.QGen.RecNo);
       i   := dmDatabase.QGen.FieldByName('WPeriodID').AsInteger;
      if i >= 0 then
      begin       
       Tmp := dmDatabase.QGen.FieldbyName('Sum1').AsFloat;
       if tmp>0 then
         tcTbbyPeriodDt[i]:= FloatToStr(StrToFloat(tcTbbyPeriodDt[i]) + tmp)
       else
         tcTbbyPeriodCr[i]:= FloatToStr(StrToFloat(tcTbbyPeriodCr[i]) + Abs(tmp));
       end ;
       dmDatabase.QGen.Next;
     end;
   Finally
     dmDatabase.QGen.Active:=False;
   end;
   For i:=0 to 26 do
   begin
      InsertLogLine(TDataBaseRoutines.GetPeriodDescription(i,999)+ #9 + CurrToStr(StrToFloatDef(tcTbbyPeriodDt[i],0)) + #9 + CurrToStr(StrToFloatDef(tcTbbyPeriodCr[i],0)),3,StrToFloatDef(tcTbbyPeriodDt[i],0),StrToFloatDef(tcTbbyPeriodCr[i],0));
   end;

  finally
    AProgress.free ;
  end;
end;
Function GetOutStandingAmount(AccTypeID:Integer;Var FullAmount:Real):Real;
begin
  result:=0;
  with dmDatabase do  begin
    qGen.close;
    qGen.SQL.Clear;
    qGen.SQL.Add(' Select Sum(FOutStandingAmount) as FSum1, Sum(FAmount)AS  FSum2 '+
                 ' from Transact, Account '+
                 ' Where Transact.WAccountID = Account.WAccountID '+
                 ' And Account.WAccountTypeID = '+IntToStr(AccTypeID));
    Try
      qGen.Open;
      Result:=qGen.fieldByName('FSum1').AsFloat;
      FullAmount:=qGen.fieldByName('FSum2').AsFloat;
    finally
      qGen.Close;
    end;
  end;
end;

Procedure  TfmDataIntegrityCheck.CheDetorsCreditors;
Var
  AccountID:Integer;
  FAmount,
  FOutStanding,
  FTotals,DtControl,CrControl : Real;
  TmpStr:String;
  AProgress :  TfmNewProgress ;

begin
  InsertLogLine('',4,0);
  InsertLogLine('Debtors creditors check',4,0);

  DtControl:=GetAccountTotal(GetControlAccountID(1),27,3);
  CrControl:=GetAccountTotal(GetControlAccountID(2),27,3);

  InsertLogLine('Debtor control'+#9+FloatToStrT(DtControl, ffFixed, 18, 2),4,DtControl);
  InsertLogLine('Debtor outstanding'+#9+FloatToStrT(GetOutStandingAmount(1,DtControl), ffFixed, 18, 2),4,GetOutStandingAmount(1,DtControl));
  InsertLogLine('Debtor real'+#9+FloatToStrT(DtControl, ffFixed, 18, 2),4,DtControl);

  InsertLogLine('Creditor control'+#9+FloatToStrT(CrControl, ffFixed, 18, 2),4,CrControl);
  InsertLogLine('Creditor outstanding'+#9+FloatToStrT(GetOutStandingAmount(2,CrControl), ffFixed, 18, 2),4,GetOutStandingAmount(2,CrControl));
  InsertLogLine('Creditor real'+#9+FloatToStrT(CrControl, ffFixed, 18, 2),4,CrControl);



 AProgress  :=  TfmNewProgress.create(nil) ;
 try
 with dmDatabase do begin
   qGen.Close;
   qGen.Sql.Clear;
   qGen.SQL.Text:='Select WAccountID,sum(Famount)  As FAmt,Sum(FOutStandingAmount) as  FoutAmt From Transact Group By WAccountID;';
   qGenii.Close;
   qGenii.SQL.Clear;
   qGenii.SQL.Add('Select Account.WAccountID,Sum(Famount) As Famt,Account.WAccountTypeID,Account.SACCOUNTCODE,Account.SDescription From Totals,Account');
   qGenii.SQL.Add(' Where Account.WAccountID=Totals.WaccountID AND Totals.BActual=1 AND (Account.WAccountTYpeID=2 or Account.WAccountTYpeID=1) AND (Totals.WPeriodID=0 or Totals.WPeriodID>=14) Group By Account.WAccountID'+',Account.WAccountTypeID,Account.SACCOUNTCODE,Account.SDescription');
   qGen.Open;
   qGenii.Open;
   DicAccountID.Clear;
   DicFAmount.clear;
   DicOutStanding.clear;
   DicTotals.clear;
   qGenii.Last;
   qGenii.First;


   AProgress.initProgress('...',dmDatabase.QGenII.RecordCount);
   While Not qGenii.Eof do
   begin
     AProgress.SetProgress('',dmDatabase.QGenII.RecNo);
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
       InsertLogLine('account '+TmpStr + #9 +  'total:' + CurrToStr(FTotals) + #9 +  'amount:' + CurrToStr(FAmount)+ #9 +  'outstanding:' + CurrToStr(FOutStanding),4,FTotals,FAmount,FOutStanding);
     end;
     stBar1.SimpleText := TmpStr;
     qGenii.Next;
     Application.ProcessMessages;
   end;
 end;


 
 finally
   AProgress.free ;
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
  Totald,Totalc : Double ;
      EndDate2,EndDate : TDateTime ;
      i : Integer ;
begin
  InsertLogLine('',5,0);
  InsertLogLine('Unposted batches check',5,0);

  tcDocUnposted.Clear;
  dmDatabase.tblUser.Open;
  dmDatabase.ZQBatControl.sql.text := 'select * from batcon where BPosted = 0' ;
  dmDatabase.ZQBatControl.open ;
 { dmDatabase.tblBatchControl.Open;

  dmDatabase.tblBatchControl.Filtered := False;
  dmDatabase.tblBatchControl.Filter :=' BPosted = 0';
  dmDatabase.tblBatchControl.Filtered := True;  }
  dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead where BPosted=0';
  dmDatabase.tblDocHeader.Open;
  dmDatabase.tblDocLine.sql.text := 'select * from docline where Where WDocid =:WDocId';

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
        tcDocUnpostedDetails.add(TDataBaseRoutines.GetAccountCode(dmDatabase.tblDocHeaderWACCOUNTID.AsInteger) +' ' +TDataBaseRoutines.GetAccountDescription(dmDatabase.tblDocHeaderWACCOUNTID.AsInteger));
       { dmDatabase.tblDocLine.close ;
        dmDatabase.tblDocLine.params[0].AsInteger := dmDatabase.tblDocHeaderWDocID.AsInteger ;
        dmDatabase.tblDocLine.Open ; }
      end;
      dmDatabase.tblDocHeader.Next;
    end;
  end;
  if dmDatabase.ZQBatControl.RecordCount > 0 then begin
     dmDatabase.ZQBatControl.First;
     dmDatabase.tblBatchTypes.open;
     While not dmDatabase.ZQBatControl.Eof do begin
          dmDatabase.tblBatchTypes.Locate('WBatchTypeID',dmDatabase.ZQBatControlWBatchTypeID.Value,[]);
          // Look Batch table infos
          dmDatabase.tblBatch.Close;
          Tmp := '' ;
          vBatchFile := 'bat' + dmDatabase.ZQBatControlWUserID.AsString + 'T'+IntToStr(dmDatabase.ZQBatControlWBatchTypeID.Value) ;
          dmDatabase.tblBatch.TableName := vBatchFile;
          if TDatabaseTableRoutines.TableExists(dmDatabase.tblBatch.TableName) then
          begin


          dmDatabase.tblBatch.open ;
          Totald := 0 ;
          Totalc := 0 ;
          while not dmDatabase.tblBatch.eof do
           begin
             if  (dmDatabase.tblBatchFDEBIT.AsFloat=0) and (dmDatabase.tblBatchFCREDIT.AsFloat=0) and (dmDatabase.tblBatchSACCOUNT.value='') and (dmDatabase.tblBatchSDESCRIPTION.asstring = '' ) and (dmDatabase.tblBatchSREFERENCE.asstring = '' ) then
               dmDatabase.tblBatch.delete else
               begin
                  Totald := Totald + dmDatabase.tblBatchFDEBIT.AsFloat ;
                  Totalc := Totalc + dmDatabase.tblBatchFCREDIT.AsFloat ;
                  dmDatabase.tblBatch.next ;
               end;
           end;
          if (Totald <> 0) or (Totalc <> 0) then
              tmp:=TDatabaseUserRoutines.GetUsername( dmDatabase.ZQBatControlWUserID.AsInteger)+ ' Batch Entry ('+(dmDatabase.tblBatchTypesSDescription.Value)+') ' + Formatfloat('0.00',totald) +' D<->C '+ Formatfloat('0.00',totalc) ;
        //  dmDatabase.CreateBatch(vBatchFile);
        //
        if Tmp <> '' then
          begin
           tcDocUnposted.add(Tmp);
            tcDocUnpostedDetails.add('Records ('  + IntToStr(dmDatabase.tblBatch.RecordCount)+')');
          end;
        end;  
        dmDatabase.ZQBatControl.Next;
     end
  end;
    // leap check


   for i := 1 to 26 do
     begin
        EndDate   := TDataBaseRoutines.GetPeriodEndDate(i) ;
        EndDate2 := EndDate  + 1 ;
        if FormatDateTime('M',EndDate) = FormatDateTime('M',EndDate2)  then
         begin
          tcDocUnposted.add('Leap bug for period ' + IntToStr(i) + ' end date '+ DateToStr(EndDate) ) ;
          tcDocUnpostedDetails.add('open edit periods and resave to correct!') ;
         end; 
     end;

   for i := 1 to tcDocUnposted.Count -1 do
             InsertLogLine(tcDocUnposted[i],5,0);

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

procedure TfmDataIntegrityCheck.BitBtn2Click(Sender: TObject);
var
aform : TFormReverseBatch ;
begin
 aform := TFormReverseBatch.create(self) ;
 try
 aform.show ;
 aform.BRecalcTotalsClick(self);
 finally
    aform.free ;
 end;

end;

procedure TfmDataIntegrityCheck.vtdataline1SetText(Sender: TField;
  const Text: String);
begin
vtdataline1.AsString := copy(Text,1,255); 
end;

procedure TfmDataIntegrityCheck.InsertLogLine(Astring: String;aType:Integer;Value1:Double;Value2:Double=0;Value3:double=0);
begin
 vtdata.Insert ;
 vtdatawtype.AsInteger :=  aType ;
 vtdataid.AsInteger := vtdata.RecordCount ;
 vtdataline1.Text := Astring ;
 if Value1 <> 0 then
    vtdataamt1.AsFloat := Value1 ;
 if Value2 <> 0 then
    vtdataamt2.AsFloat := Value2 ;
 if Value3 <> 0 then
    vtdataamt3.AsFloat := Value3 ;
 vtdata.Post ;


end;

procedure TfmDataIntegrityCheck.BprintClick(Sender: TObject);
begin
    TDatabaseTableRoutines.DumpToReportmanTransport(vtdata);
    ExecReport( ExtractFilePath(Application.ExeName)  + 'plug_ins\reports\GENERAL\documents\datacheck.rep','');
end;

end.
