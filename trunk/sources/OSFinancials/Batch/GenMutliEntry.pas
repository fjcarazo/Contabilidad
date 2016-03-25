(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit GenMutliEntry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls,  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxListView, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmGenMutliEntry = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOk: TBitBtn;
    MultiEntryList: TcxListView;
    Label1: TLabel;
    edtContraAccount: TEdit;
    Label2: TLabel;
    edtNumber1: TEdit;
    lblNumber1: TLabel;
    lblDescription: TLabel;
    edtDescription: TEdit;
    lblDbfrom: TLabel;
    edtDbFrom: TEdit;
    lblDbTo: TLabel;
    edtDbTo: TEdit;
    BedtDbFrom: TBitBtn;
    BedtDbTo: TBitBtn;
    BitBtn3: TBitBtn;
    StatusBar1: TStatusBar;
    DpickTransDate: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure MultiEntryListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure MultiEntryListKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure BedtDbFromClick(Sender: TObject);
    procedure BedtDbToClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    Procedure AmtToAllDebtor;
    Procedure DebtorAmtLess;
    Procedure ChargeAmt(Debtor:Boolean);
    Procedure InterestOnDbt;
  public
    { Public declarations }
  end;

var
  fmGenMutliEntry: TfmGenMutliEntry;

implementation

uses LanguageChoice, Main, GlobalFunctions, Database, DatabaseAccess,
  TcVariables, XRoutines, UDMTCCoreLink, OSFGeneralRoutines;

{$R *.DFM}

procedure TfmGenMutliEntry.FormShow(Sender: TObject);
var
  MyItem:TListItem;
begin
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
  DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

  BtnCancel.Caption := Gettextlang(168); // Cancel
  BtnOk.Caption := Gettextlang(167); // Ok

   edtNumber1.Text:=formatfloat('00.00',0);
   DpickTransDate.Date:=date;
   with MultiEntryList do begin
     // 0 Balance deb with amount
     MyItem:=MultiEntryList.Items.Add;
     MyItem.Caption:=GetTextLang(785);
     MyItem.SubItems.Add('Cr');
     //1 Debt with charge amt
     MyItem:=MultiEntryList.Items.Add;
     MyItem.Caption:=GetTextLang(787);
     MyItem.SubItems.Add('Dr');
     //2 Cred with charge amt
     MyItem:=MultiEntryList.Items.Add;
     MyItem.Caption:=GetTextLang(786);
     MyItem.SubItems.Add('Cr');
     //3 Fixed amount to all debtors
     MyItem:=MultiEntryList.Items.Add;
     MyItem.Caption:=GetTextLang(788);
     MyItem.SubItems.Add('Dr');
     //4 Interest on overdue debt
     MyItem:=MultiEntryList.Items.Add;
     MyItem.Caption:=GetTextLang(789);
     MyItem.SubItems.Add('Dr');


   end;
   MultiEntryList.Items.Item[0].Selected := True;
   MultiEntryList.Columns[0].DisplayName := gettextlang(2131);
   Label1.Caption := gettextlang(2132);
   Label2.Caption := gettextlang(2133);
   lblDescription.Caption := gettextlang(2134);
   Caption := gettextlang(2138);
   lblDbfrom.Caption := gettextlang(2139);
   lblDbTo.Caption := gettextlang(2140);
   edtDescription.Text := gettextlang(2185);

end;

procedure TfmGenMutliEntry.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGenMutliEntry.MultiEntryListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  lblDbTo.Visible:=False;
  lblDbFrom.Visible:=False;
  EdtDbTo.Visible:=False;
  EdtDbFrom.Visible:=False;
  bEdtDbTo.Visible:=False;
  bEdtDbFrom.Visible:=False;
  case Item.Index of
   1,2,3:begin
       lblDescription.Visible:=True;
       edtDescription.Visible:=True;
       if Item.Index=3 then begin
         edtNumber1.Visible:=True;
         lblNumber1.Visible:=True;
         lblNumber1.Caption:=gettextlang(2135);
         lblDbTo.Visible:=True;
         lblDbFrom.Visible:=True;
         EdtDbTo.Visible:=True;
         EdtDbFrom.Visible:=True;
         bEdtDbTo.Visible:=True;
         bEdtDbFrom.Visible:=True;
       end
       else begin
         lblNumber1.Visible:=False;
         edtNumber1.Visible:=False;
       end;
     end;
   0,4:begin
       lblDescription.Visible:=False;
       edtDescription.Visible:=False;
       edtNumber1.Visible:=True;
       lblNumber1.Visible:=True;
       if Item.Index=0 then begin
         lblNumber1.Caption:=gettextlang(2136);
       end
       else begin
         lblNumber1.Caption:=gettextlang(2137);
       end;
     end;
   end;

end;

procedure TfmGenMutliEntry.MultiEntryListKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13:begin
          SelectNext(Screen.activeControl,true,true);
          Key:=#0;
        end;
  end;

end;

procedure TfmGenMutliEntry.BtnOkClick(Sender: TObject);
Var
  vClose :Bool;
begin
  vClose := True;
  Case MultiEntryList.Selected.Index of
   // Dbtor with amt <=Rxx.xx
  0:DebtorAmtLess;
  1:ChargeAmt(True); // Charge DT
  2:ChargeAmt(False); // Charge Cr
   // Fiexed Amt to Dbtor
  3:AmtToAllDebtor;
    //Interest on overdue amount
  4:InterestOnDbt;
  else
    vClose:=False;
  end;
  if vClose then
    Close
  else
    ;
end;

Procedure TfmGenMutliEntry.DebtorAmtLess;
Var
  D,M,Y : Word;
  MyDate : TDate;
  Rftemp,
  RTemp  : Real;
begin
  MyDate:=DpickTransDate.Date;
  RTemp:=Str2FloaT(edtNumber1.Text);
  If RTemp<>0 then
  begin
    dmDatabase.qGen.Close;
    dmDatabase.qGen.SQL.Clear;
    If RTemp >0 then
    dmDatabase.qGen.SQL.add('Select Transact.WAccountID, Sum((Transact.FOutstandingAmount* 100)/100 ) as FoutSum ,'
             + ' Account.SACCOUNTCODE  '
             + ' From Transact,Account '
             + ' Where Transact.WAccountID=Account.WAccountID '
             + ' AND Transact.DDate <= :MyDate'
             + ' AND Account.WAccountTypeID=1'
             + ' Group by Transact.WAccountID,Account.SACCOUNTCODE'
             + ' Having Sum((Transact.FOutstandingAmount* 100)/100 ) <= '+ StringReplace(FloatToStr(RTemp),DecimalSeparator,'.',[rfReplaceAll])
             + ' Order By Transact.WAccountID' ) else
    dmDatabase.qGen.SQL.add('Select Transact.WAccountID, Sum((Transact.FOutstandingAmount* 100)/100 ) as FoutSum ,'
             + ' Account.SACCOUNTCODE  '
             + ' From Transact,Account '
             + ' Where Transact.WAccountID=Account.WAccountID '
             + ' AND Transact.DDate <= :MyDate'
             + ' AND Account.WAccountTypeID=1'
             + ' Group by Transact.WAccountID,Account.SACCOUNTCODE'
             + ' Having Sum((Transact.FOutstandingAmount* 100)/100 ) >= '+ StringReplace(FloatToStr(RTemp),DecimalSeparator,'.',[rfReplaceAll])
             + ' Order By Transact.WAccountID' );
    try
      // Use Filter For Date Fields, DBE Date Configuration not Stable !!!
      dmDatabase.qGen.params[0].AsDateTime :=  MyDate ;

      dmDatabase.qGen.Open;
      dmDatabase.qGen.First;
      dmDatabase.tblBatch.DisableControls;


      DecodeDate(MyDate,Y,M,D);

      While Not dmDatabase.qGen.Eof do
      begin
       if FixAmt(dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat)<>0 then
        begin
        if (RTemp > 0) and (dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat <= RTemp) and (dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat>0)  then
        begin
          dmDatabase.tblBatch.Append;
          dmDatabase.tblBatchSReference.Value:='Bal'+T3FormatStr(D,2)+T3FormatStr(M,2);
          dmDatabase.tblBatchDDate.Value:=MyDate;
          dmDatabase.tblBatchSDescription.Value:= edtDescription.Text +DateToStr(MyDate);
          dmDatabase.tblBatchSACCOUNT.Value:=AddDashInAccCodeNoPRefix(dmDatabase.QGen.FieldByNAme('SACCOUNTCODE').AsString);
          DmDatabase.tblBatchWAccountID.AsString:=dmDatabase.QGen.FieldByNAme('WAccountID').AsString;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
               DmDatabase.tblBatchSCONTRAACCOUNT.Value:= edtContraAccount.Text;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
                 DmDatabase.tblBatchWCONTRAACCOUNTID.Value:= edtContraAccount.Tag;
           Rftemp := dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat;
       // ITs in the query now. No need to totalize the result

     {     Repeat
            Rftemp:= Rftemp + dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat;
            dmDatabase.qGen.Next;
          until dmDatabase.qGen.Eof or (dmDatabase.QGen.FieldByNAme('WAccountID').AsInteger<> DmDatabase.tblBatchWAccountID.AsInteger);
        }
          DmDatabase.tblBatchFAmount.Value:=-Abs(Rftemp);
          DmDatabase.tblBatchFCREDIT.Value:=Abs(Rftemp);
          dmDatabase.tblBatchFTaxAmount.Value:=0;
          dmDatabase.tblBatchSTAX.Value:='';
          dmDatabase.tblBatchBReconciled.AsInteger:=0;
          dmDatabase.tblBatch.Post;

        end
        else
         if (RTemp < 0) and (dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat >= RTemp) and (dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat < 0)then
          begin
          dmDatabase.tblBatch.Append;
          dmDatabase.tblBatchSReference.Value:='Bal'+T3FormatStr(D,2)+T3FormatStr(M,2);
          dmDatabase.tblBatchDDate.Value:=MyDate;
          dmDatabase.tblBatchSDescription.Value:= edtDescription.Text +DateToStr(MyDate);
          dmDatabase.tblBatchSACCOUNT.Value:=AddDashInAccCodeNoPRefix(dmDatabase.QGen.FieldByNAme('SACCOUNTCODE').AsString);
          DmDatabase.tblBatchWAccountID.AsString:=dmDatabase.QGen.FieldByNAme('WAccountID').AsString;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
               DmDatabase.tblBatchSCONTRAACCOUNT.Value:= edtContraAccount.Text;
           if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
               DmDatabase.tblBatchWCONTRAACCOUNTID.Value:= edtContraAccount.Tag;

          Rftemp := dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat;
          DmDatabase.tblBatchFAmount.Value:=Abs(Rftemp);
          DmDatabase.tblBatchFCREDIT.Value:=0;
          dmDatabase.tblBatchFDEBIT.Value:=Abs(Rftemp);

          dmDatabase.tblBatchFTaxAmount.Value:=0;
          dmDatabase.tblBatchSTAX.Value:='';
          dmDatabase.tblBatchBReconciled.Value:=0;
          dmDatabase.tblBatch.Post;
          end ;
         end ; // end sum <> 0
       dmDatabase.qGen.Next;
      end;
    Finally
      dmDatabase.qGen.Close;
      dmDatabase.tblBatch.EnableControls;
    end;
  end;
End;

Procedure TfmGenMutliEntry.AmtToAllDebtor;
Var
  D,M,Y : Word;
  MyDate : TDate;
  RTemp  : Real;
  S1,S2  : String;
begin
  S1:=ZipAccountCode(edtDbFrom.Text);
  S2:=ZipAccountCode(edtDbTo.Text);
  MyDate:=DpickTransDate.Date;
  if (S1<>'') And (S2<>'') then
  begin
    SwapStr(S1,S2);
    dmDatabase.QGen.Close;
    dmDatabase.Qgen.SQl.Clear;
    dmDatabase.Qgen.SQl.Add(' Select * from Account '
               + ' Where SACCOUNTCODE>=''' + S1
               + ''' AND  SACCOUNTCODE<=''' + S2
               + ''' AND WAccountTypeID=1 ');
    dmDatabase.QGen.Open;
    dmDatabase.tblBatch.DisableControls;
    While not dmDatabase.QGen.Eof do
    begin
      dmDatabase.tblBatch.Append;
      DecodeDate(MyDate,Y,M,D);
      dmDatabase.tblBatchSReference.Value:='Bal'+T3FormatStr(D,2)+T3FormatStr(M,2);
      dmDatabase.tblBatchDDate.Value:=MyDate;
      dmDatabase.tblBatchDAllocatedDate.Value:=MyDate;
      dmDatabase.tblBatchSDescription.Value:= edtDescription.Text;
      dmDatabase.tblBatchSACCOUNT.Value:= AddDashInAccCodeNoPRefix(dmDatabase.QGen.FieldByNAme('SACCOUNTCODE').AsString);
//      DmDatabase.QGen.FieldByName('SMAINACCOUNTCODE').AsString+'-'+
//                 dmDatabase.QGen.FieldByName('SSUBACCOUNTCODE').AsString;
      DmDatabase.tblBatchWAccountID.AsString:=dmDatabase.QGen.FieldByName('WAccountID').AsString;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
        DmDatabase.tblBatchSCONTRAACCOUNT.Value:= edtContraAccount.Text;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
        DmDatabase.tblBatchWCONTRAACCOUNTID.Value:= edtContraAccount.Tag;

      RTemp := Str2Float(edtNumber1.Text);
      DmDatabase.tblBatchFAmount.Value:=RTemp;
      if RTemp>0 then
        DmDatabase.tblBatchFDEBIT.Value:=RTemp
      else
        DmDatabase.tblBatchFCREDIT.Value:=-RTemp;
      dmDatabase.tblBatchFTaxAmount.Value:=0;
      dmDatabase.tblBatchSTAX.Value:='';
      dmDatabase.tblBatchBReconciled.Value:=0;
      dmDatabase.tblBatch.Post;
      dmDatabase.QGen.Next;
    end;
    dmDatabase.tblBatch.EnableControls;
  end;
End;

Procedure TfmGenMutliEntry.ChargeAmt(Debtor:Boolean);
Var
  D,M,Y : Word;
  MyDate : TDate;
  RTemp  : Real;
begin
  MyDate:=DpickTransDate.Date;
//  test
  begin
    dmDatabase.qGen.Close;
    dmDatabase.qGen.SQL.Clear;
    if Debtor then
    begin
      dmDatabase.qGen.SQL.add('Select Account.WAccountID , Debtor.FChargeAmount, '
             + ' Account.SACCOUNTCODE '
             + ' From Debtor,Account '
             + ' Where Debtor.WAccountID=Account.WAccountID '
             + ' AND Debtor.FChargeAmount<>0 '
             + ' AND Account.BInactive <> 1');
    end
    else
    begin
      dmDatabase.qGen.SQL.add('Select Account.WAccountID , Debtor.FChargeAmount, '
             + ' Account.SACCOUNTCODE '
             + ' From Creditor Debtor,Account '
             + ' Where Debtor.WAccountID=Account.WAccountID '
             + ' AND Debtor.FChargeAmount<>0 '
             + ' AND Account.BInactive <> 1');
    end;
    try
      
      dmDatabase.qGen.Open;
      dmDatabase.qGen.First;
      dmDatabase.tblBatch.DisableControls;
//      dmDatabase.tblAccount.Filtered:=False;
//      dmDatabase.tblAccount.Open;
      While Not dmDatabase.qGen.Eof do
      begin
        if (dmDatabase.QGen.FieldByNAme('WAccountID').AsString<>'')
          And (dmDatabase.QGen.FieldByNAme('FChargeAmount').AsFloat<>0) then
        begin
          dmDatabase.tblBatch.Append;
          DecodeDate(MyDate,Y,M,D);
          dmDatabase.tblBatchSReference.Value:='Bal'+T3FormatStr(D,2)+T3FormatStr(M,2);
          dmDatabase.tblBatchDDate.Value:=MyDate;
          dmDatabase.tblBatchSDescription.Value:= edtDescription.Text+' '+DateToStr(MyDate);
          dmDatabase.tblBatchSACCOUNT.Value:=AddDashInAccCodeNoPRefix(dmDatabase.QGen.FieldByNAme('SACCOUNTCODE').AsString);
          DmDatabase.tblBatchWAccountID.AsString:=dmDatabase.QGen.FieldByNAme('WAccountID').AsString;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
               DmDatabase.tblBatchSCONTRAACCOUNT.Value:= edtContraAccount.Text;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
        DmDatabase.tblBatchWCONTRAACCOUNTID.Value:= edtContraAccount.Tag;

           if Debtor then
             Rtemp:=dmDatabase.QGen.FieldByNAme('FChargeAmount').AsFloat
           else
          Rtemp:=-dmDatabase.QGen.FieldByNAme('FChargeAmount').AsFloat;

          DmDatabase.tblBatchWCONTRAACCOUNTID.AsInteger := edtContraAccount.Tag ;
          // todo : pieter if i look at the above query then theres no way it van be <0
          // i think we need to check if its debitors or creditors. nad do this minus + on the DmDatabase.tblBatchFAmount.Value
          // tryed it and it seems to work
         { if RTemp>0 then
            DmDatabase.tblBatchFDEBIT.Value:=RTemp
          else
            DmDatabase.tblBatchFCREDIT.Value:=-RTemp;}

          if RTemp > 0  then
             begin
             DmDatabase.tblBatchFDEBIT.Value:=RTemp ;
            DmDatabase.tblBatchFAmount.Value:=RTemp;
             end
          else
             begin
             DmDatabase.tblBatchFCREDIT.Value:=-RTemp ;
             DmDatabase.tblBatchFAmount.Value:=RTemp;
             end;

          dmDatabase.tblBatchFTaxAmount.Value:=0;
          dmDatabase.tblBatchSTAX.Value:='';
          dmDatabase.tblBatchBReconciled.Value:=0;
          dmDatabase.tblBatch.Post;
        end;
        dmDatabase.qGen.Next;
      end;
    Finally
      dmDatabase.qGen.Close;
      dmDatabase.tblBatch.EnableControls;
    end;
  end;
End;

Procedure TfmGenMutliEntry.InterestOnDbt;
Var
  D,M,Y : Word;
  TarDate,
  MyDate : TDate;
  Intstmp,
  RTemp  : Real;
  tmpCount,
  TmpID  : Integer;
  testStr : String ;
begin
  MyDate :=DpickTransDate.Date;
  TarDate := MyDate - ABs(str2float(edtNumber1.text));
  tmpCount := 0;
//  test
  begin
    dmDatabase.qGen.Close;
    dmDatabase.qGen.SQL.Clear;
    dmDatabase.qGen.SQL.add('SELECT Account.WAccountID , Debtor.FInterest, '
             + ' DDate,Account.SACCOUNTCODE, Sum(Transact.FOutStandingAmount) AS FOutSum '
             + ' From Debtor, Account,Transact '
             + ' WHERE Debtor.WAccountID=Account.WAccountID '
             + ' And Transact.WAccountID=Account.WAccountID '
             + ' AND Debtor.FInterest>0 '
             + ' AND  (Debtor.BDisabled <> 1 or Debtor.BDisabled is null) '
             + ' GROUP BY Account.WAccountID, Account.SACCOUNTCODE,Debtor.FInterest,DDate'
             + ' HAVING (Sum(Transact.FOutStandingAmount)<>0)'
             + ' ORDER By Account.WAccountID');

    try
      // Use Filter For Date Fields, DBE Date Configuration not Stable !!!
      // todo : Pieter Best is to use params for date fields works all the time. no mater what config is used
      dmDatabase.qGen.Filtered:=False;
      dmDatabase.qGen.Filter:='DDate<= '''+ DateToStr(TarDate)+'''';
      dmDatabase.qGen.Filtered:=True;
      dmDatabase.qGen.Open;
      dmDatabase.qGen.First;
      dmDatabase.tblBatch.DisableControls;
//      dmDatabase.tblAccount.Filtered:=False;
//      dmDatabase.tblAccount.Open;
      While Not dmDatabase.qGen.Eof do
      begin
        if (dmDatabase.QGen.FieldByNAme('WAccountID').AsString<>'') And
          (DatabaseAccess.FixAmount(dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat)<>0) then
        begin
          dmDatabase.tblBatch.Append;
          DecodeDate(MyDate,Y,M,D);
          TmpID := dmDatabase.QGen.FieldByNAme('WAccountID').AsInteger;
          dmDatabase.tblBatchSReference.Value:=gettextlang(2142)+T3FormatStr(D,2)+T3FormatStr(M,2);
          dmDatabase.tblBatchDDate.Value:=MyDate;
          dmDatabase.tblBatchSACCOUNT.Value:=AddDashInAccCodeNoPRefix(dmDatabase.QGen.FieldByNAme('SACCOUNTCODE').AsString);
          DmDatabase.tblBatchWAccountID.AsString:=dmDatabase.QGen.FieldByNAme('WAccountID').AsString;
          Rtemp :=0;
          Intstmp:= dmDatabase.QGen.FieldByNAme('FInterest').ASFloat;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
                 DmDatabase.tblBatchSCONTRAACCOUNT.Value:= edtContraAccount.Text;
          if (edtContraAccount.Text<>'-') and (edtContraAccount.Text<>'') then
        DmDatabase.tblBatchWCONTRAACCOUNTID.Value:= edtContraAccount.Tag;
          Repeat

            Rtemp:= Rtemp + dmDatabase.QGen.FieldByNAme('FOutSum').AsFloat;
            dmDatabase.qGen.Next;
          until dmDatabase.qGen.Eof or (dmDatabase.QGen.FieldByNAme('WAccountID').AsInteger<> TmpID) ;
          testStr := format(gettextlang(2141),[ FloatToStr(FixAmount(Intstmp)),'%',FloatToStr(FixAmount(Rtemp)),DateToStr(MyDate)]);
          dmDatabase.tblBatchSDescription.Value:= testStr ;
          RTemp:=Intstmp*RTemp/100;
          DmDatabase.tblBatchFAmount.Value:=RTemp;
          if RTemp>0 then
            DmDatabase.tblBatchFDEBIT.Value:=RTemp
          else
            DmDatabase.tblBatchFCREDIT.Value:=-RTemp;
          dmDatabase.tblBatchFTaxAmount.Value:=0;
          dmDatabase.tblBatchSTAX.Value:='';
          dmDatabase.tblBatchBReconciled.Value:=0;
          dmDatabase.tblBatch.Post;
        end
        else
          dmDatabase.qGen.Next;
        StatusBar1.SimpleText :=gettextlang(2143) + ' ' + IntToStr(tmpCount);
        Inc(tmpCount);
      end;
    Finally
      StatusBar1.SimpleText :='';
      dmDatabase.qGen.Close;
      dmDatabase.tblBatch.EnableControls;
    end;
  end;
end;

procedure TfmGenMutliEntry.BedtDbFromClick(Sender: TObject);
begin
  edtDbFrom.Color := clHighlight;
  ReturnLookup:=CallLookup(edtDbFrom.Text, 3);
  if ReturnLookup <> 'ESC' then
    edtDbFrom.Text := ReturnLookup;
  edtDbFrom.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmGenMutliEntry.BedtDbToClick(Sender: TObject);
begin
  edtDbTo.Color := clHighlight;
  ReturnLookup:=CallLookup(edtDbTo.Text, 3);
  if ReturnLookup <> 'ESC' then
    edtDbTo.Text := ReturnLookup;
  edtDbTo.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfmGenMutliEntry.BitBtn3Click(Sender: TObject);
begin
  edtContraAccount.Color := clHighlight;
  ReturnLookup:=CallLookup(edtContraAccount.Text, 1);
  if ReturnLookup <> 'ESC' then
    begin
    edtContraAccount.Text := ReturnLookup;
    edtContraAccount.Tag := ReturnID ;
    end;
  edtContraAccount.Color := clWindow;
  SelectNext(Screen.ActiveControl, True, True);
end;

end.
