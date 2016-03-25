(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit UserReportReport;

interface

uses Windows, SysUtils, Messages, Variants,Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt,printers, QRCtrls;

type
  TqrUserReport = class(TQuickRep)
    qrHeader: TQRBand;
    qrTitle1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrpageLbl: TQRLabel;
    qrTitle2: TQRLabel;
    qrDetailBand: TQRBand;
    qrDetailsDescription: TQRLabel;
    qrSubDetailBand: TQRSubDetail;
    qrAccount: TQRLabel;
    qrCol1Data: TQRLabel;
    qrCol2Data: TQRLabel;
    qrCol1Total: TQRLabel;
    qrCol2Total: TQRLabel;
    qrCol3Total: TQRLabel;
    qrCol4Total: TQRLabel;
    qrCol5Total: TQRLabel;
    qrCol6Total: TQRLabel;
    qrCol7Total: TQRLabel;
    qrCol3Data: TQRLabel;
    qrCol4Data: TQRLabel;
    qrCol5Data: TQRLabel;
    qrCol6Data: TQRLabel;
    qrCol7Data: TQRLabel;
    qrCol8Data: TQRLabel;
    qrCol9Data: TQRLabel;
    qrCol10Data: TQRLabel;
    qrCol11Data: TQRLabel;
    qrCol8Total: TQRLabel;
    qrCol9Total: TQRLabel;
    qrCol10Total: TQRLabel;
    qrCol11Total: TQRLabel;
    qrCompName: TQRLabel;
    qrCol1Title1: TQRLabel;
    qrCol1Title2: TQRLabel;
    qrCol2Title1: TQRLabel;
    qrCol2Title2: TQRLabel;
    qrCol3Title1: TQRLabel;
    qrCol3Title2: TQRLabel;
    qrCol4Title1: TQRLabel;
    qrCol4Title2: TQRLabel;
    qrCol5Title1: TQRLabel;
    qrCol5Title2: TQRLabel;
    qrCol6Title1: TQRLabel;
    qrCol6Title2: TQRLabel;
    qrCol7Title1: TQRLabel;
    qrCol7Title2: TQRLabel;
    qrCol8Title1: TQRLabel;
    qrCol8Title2: TQRLabel;
    qrCol9Title1: TQRLabel;
    qrCol9Title2: TQRLabel;
    qrCol10Title1: TQRLabel;
    qrCol10Title2: TQRLabel;
    qrCol11Title1: TQRLabel;
    qrCol11Title2: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrAccountPrint(sender: TObject; var Value: String);
    procedure qrSubDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     EvalCells : Boolean;
     Procedure  FilterHeadCols;
     Function   FiltertblAccount:Integer;
     Function   FormatColValue(ColID:Integer):String;
     Function   FormatColTotal(ColID:Integer):String;
     Procedure  CleanDataLbl;
     Procedure  CleanTotalLbl;
     Function  GetTotal(ColID,AccID:Integer):real;
  public
    vDate  : TDate;
  end;

var
  qrUserReport: TqrUserReport;
  Tmp:String;
  RowCount,
  ColCount:Integer;
  FileterCols: Array [1..11] of String;
  FormulasTmp: Array [1..11] of String;
implementation

uses Database, GlobalFunctions, EvaluateExpressions, DatabaseAccess,
  XRoutines;

{$R *.DFM}

Function TqrUserReport.GetTotal(ColID,AccID:Integer):real;
Var
  wFormula : String;
  Tmp: Real;
begin
   Result:=0;
   if ColID>ColCount then
     Exit;
   dmDatabase.tblToTals.DisableControls;
   dmDatabase.tblToTals.Filtered:=False;
   if FileterCols[ColID]='' then
     dmDatabase.tblToTals.Filter:=' FAmount<>0  And ( WAccountID='+IntToStr(AccID)+')'
   else
     dmDatabase.tblToTals.Filter:=FileterCols[ColID]+' And FAmount<>0  And ( WAccountID='+IntToStr(AccID)+')';
   dmDatabase.tblToTals.Filtered:=true;
   dmDatabase.tblTotals.First;
   Result:=0;
   While not dmDAtabase.tblTotals.eof do begin
      Result:=Result + Str2Float(dmDatabase.tblTotalSFAmount.AsString);
      dmDatabase.tblTotals.Next;
   end;
   {if Formula Exists Replace In the Formula All Occurences of
    This line Byt Result}
    if (dmDatabase.tblRepLineWRowTypeID.Value in [70,73..76]) And EvalCells then
    begin
      wFormula := Trim(dmDatabase.tblRepLine.FieldByNAme('SColumn'+IntToStr(ColID)).AsString);
      if wFormula<>'' then
      begin
        {Hold Acual Value}
        Tmp := UserTotalA[ dmDatabase.tblRepLineWRowID.AsInteger][ColID];
        UserTotalA[ dmDatabase.tblRepLineWRowID.AsInteger][ColID] := Result;
        Result := StrToFloat(Calc(wFormula));
        {Restore Value}
        UserTotalA[ dmDatabase.tblRepLineWRowID.AsInteger][ColID] := Tmp ;
      end;
    end;
   dmDatabase.tblToTals.Filtered:=False;
   dmDatabase.tblToTals.Filter:='';
   dmDatabase.tblToTals.EnableControls;
End;

Function TqrUserReport.FormatColValue(ColID:Integer):String;
begin
  if ColID>ColCount then
    Exit;
     ;
  // Check if Column type is Formula
  if dmDatabase.tblrepcols.locate('WColumnID;WReportID;WColumnTypeID',VarArrayOf([ColID,dmDatabase.tblRepHeadWReportID.Value,80]),[]) then
  begin
    Result := dmDatabase.tblRepLine.FieldByNAme('SColumn'+IntToStr(ColID)).AsString;
    FormulasTmp[ColID]:= Result;
    Result:='';
  end
  else
  if ((dmDatabase.tblReplineBMainAccount.Value=0) AND (dmDatabase.tblRepLineWRowTypeID.Value in [70,74,76]) AND (dmDatabase.tblAccountBSubAccounts.Value =1)) then
    Result:=''
  else begin
    LocalTot[ColID] := GetTotal(ColID,dmDatabase.tblAccountWAccountID.Value);
    Result:=FloatToStrT(LocalTot[ColID], ffFixed, 18, 2);
  end;
  (FindComponent('qrCol'+IntToStr(ColID)+'Data') as tqrLabel).Caption:=Result;
end;

Procedure SetZeros(Count:Integer);
Var
  J,i:Integer;
begin
  SetLength(UserTotalA,Count);
  For i:=0 to Count-1 do
    For J:=1 to 13 do
      UserTotalA[i][j]:=0;
end;

procedure TqrUserReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
  LineIdx,
  i:Integer;
  tmp:string;
  Som:real;
begin
  // Initialise Cols Filters
  For i:=1 to 11 do
    FileterCols[i]:='';
  // Fixe report Heading
  if ColCount>7 then
  begin
    qrUserReport.Page.Orientation:=poLandscape;
    QRSysData1.left:=794;
    qrpageLbl.Left :=946;
    QRSysData2.left:=982;
  end
  else
  begin
    qrUserReport.Page.Orientation:=poPortrait;
    QRSysData1.left:=454;
    qrpageLbl.Left :=630;
    QRSysData2.left:=672;
  end;
  dmDatabase.tblrepline.DisableControls;
  dmDatabase.tblrepline.First;
  RowCount:=0;
  // Count lines to be printed
  while not dmDatabase.tblrepline.Eof do begin
      dmDatabase.tblrepline.next;
      RowCount:=RowCount+1;
  end;
  dmDatabase.tblrepline.First;
  // Set Data storage erea Range
  // And set All to 0 (Zero)
  SetZeros(RowCount+1);
  // Count Cols in the report
  ColCount:=dmDatabase.tblRepHeadWNoOfColumns.Value;
  // Set Col heading on the report
  For i:=1 to 11 do
  if i>ColCount then
  begin
    with findcomponent('qrCol'+IntToStr(i)+'Title1') as TqrLabel do
      Enabled:=False;
    with findcomponent('qrCol'+IntToStr(i)+'Title2') as TqrLabel do
      Enabled:=False;
  end
  else
  if dmDatabase.tblrepcols.locate('WColumnID;WReportID',VarArrayOf([i,dmDatabase.tblRepHeadWReportID.Value]),[]) then
  begin
    tmp:=dmDatabase.tblrepcolsSHeading1.AsString;
    (FindComponent('qrCol'+IntToStr(i)+'Title1') as TqrLabel).Caption := tmp;
    tmp:=dmDatabase.tblrepcolsSHeading2.AsString;
    (FindComponent('qrCol'+IntToStr(i)+'Title2') as TqrLabel).Caption := tmp;
  end
  else
  begin
    (FindComponent('qrCol'+IntToStr(i)+'Title1') as TqrLabel).Caption := '';
    (FindComponent('qrCol'+IntToStr(i)+'Title2') as TqrLabel).Caption := '';
  end;
  // Get All Columns Filters
  FilterHeadCols;
  // Calculate All Rows Totals;
  LineIdx:=0;
  EvalCells := False;
  dmDatabase.tblrepline.First;
  while not dmDatabase.tblrepline.Eof do
  begin
    inc(LineIdx);
    if dmDatabase.tblRepLineWRowTypeID.Value in [73..76,70] then
    for i:=1 to ColCount do begin
      FiltertblAccount;
      som:=0;
      dmDatabase.tblAccount.First;
      while not dmDatabase.tblAccount.eof do
      begin
  //        if (dmDatabase.tblAccountBSubAccounts.Value=False) or IsControlAccount(dmDatabase.tblAccountWaccountID.Value) then
  //        Case dmDatabase.tblRepLineWRowTypeID.Value of
  //        70,73..76:
  //           Begin
//            if (dmDatabase.tblReplineBMainAccount.Value  AND (dmDatabase.tblAccountSSUBACCOUNTCODE.Value='000'))
//              Or ((dmDatabase.tblReplineBMainAccount.Value=False)  AND (dmDatabase.tblAccountBSubAccounts.Value<>True))
//              Or ((dmDatabase.tblReplineBMainAccount.Value=False)  AND (dmDatabase.tblAccountSSUBACCOUNTCODE.Value<>'000'))
//              then
            if (dmDatabase.tblReplineBMainAccount.Value = 1)
               or ((dmDatabase.tblReplineBMainAccount.Value=0) AND (dmDatabase.tblAccountSSUBACCOUNTCODE.Value='000'))
            then
              som := Som+ GetTotal(i,dmDatabase.tblAccountWAccountID.Value);
  //           end
  //        end;
        dmDatabase.tblAccount.Next;
      end;
      UserTotalA[LineIdx][i]:=Som;
    end;
    dmDatabase.tblrepline.Next;
  end;
  // Evaluate All Formulas
  EvalCells := True ;
  dmDatabase.tblrepline.First;
  LineIdx:=0;
  while not dmDatabase.tblrepline.Eof do
  begin
    inc(LineIdx);
    if dmDatabase.tblRepLineWRowTypeID.Value in [73..76,78] then
    for i:=1 to ColCount do
    begin
      // Get Formula into Tmp string
      tmp:=Trim(dmDatabase.tblRepLine.FieldByNAme('SColumn'+IntToStr(i)).AsString);
      // Call Expression Evaluator
      if tmp<>'' then
      begin
        Som:=Str2Float(Calc(tmp));
        //Store Result in Memorie Area
        UserTotalA[LineIdx][i]:=Som;
      end;  
    end;
    dmDatabase.tblrepline.Next;
  end;
  //
  dmDatabase.tblrepline.EnableControls;
end;

procedure TqrUserReport.qrHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Function ipos:Byte;
begin
  Result:= Pos('#E',tmp );
  if Result=0 then
    Result:= Pos('#e',tmp );
end;
begin
  dmDatabase.tblSysVars.Open;
  qrCompName.Caption:=dmdatabase.tblSysVarsSCompanyName.Value;
  dmDatabase.tblSysVars.Close;
  Tmp:=dmDatabase.tblRepHeadSTitle1.value;
  if ipos<>0 then
  begin
    Insert(DateToStr(vDate),tmp,ipos+2);
    delete(tmp,ipos,2);
  end;
  qrTitle1.Caption:=tmp;
  tmp:=dmDatabase.tblRepHeadSTitle2.value;
  if iPos<>0 then
  begin
    Insert(DateToStr(vDate),tmp,iPos+2);
    delete(tmp,iPos,2);
  end;
  qrTitle2.Caption:=tmp;
end;

procedure TqrUserReport.qrDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  TypeID:Integer;
  tmp :string;
begin
   CleanTotalLbl;
   //   tblReplineBsupressPrint is used as Print and not SupressPrint
   if dmDatabase.tblReplineBsupressPrint.Value=0 then
   begin
     qrSubDetailBand.Enabled:=False;
     PrintBand:=False ;
     exit;
   end;
   {Clean Formulastmp}
   For TypeID:=1 to 11 do begin
      FormulasTmp[TypeID]:='';
      LocalTot[TypeID]:=0;
   end;
   qrDetailsDescription.Width := 211;
   if ColCount>11 then ColCount:=11;
//   qrDetailsDescription.AutoSize:=False;
   TypeID:=dmDatabase.tblRepLineWRowTypeID.Value;
   Case TypeID of
   70 : Begin
          qrDetailsDescription.Caption:=dmDatabase.tblReplineSDescription.Value;
          FiltertblAccount;
//          qrSubDetailBand.Enabled:=Not dmDatabase.tblReplineBMainAccount.Value;
          qrSubDetailBand.Enabled:=True;
          qrDetailBand.Height:=0;
        end;
    72 : Begin {DOuble line}

          qrSubDetailBand.Enabled:=False;
          tmp:=Trim(dmDatabase.tblReplineSDescription.Value);
          {Set Double/Column line to '='}
          if length(tmp)<=0 then
            tmp:='=';
          repeat
            tmp:=tmp + tmp;
          until length(tmp)>=32;
          for TypeiD:=1 to ColCount do
            (FindComponent('qrCol'+IntToStr(TypeiD)+'Total') as tqrLabel).Caption:=tmp;
          qrDetailBand.Height:=22;
          TypeiD:=72;
          qrDetailsDescription.Caption:='';

        end;
    77:begin// Single line
        qrSubDetailBand.Enabled:=False;
        tmp:=Trim(dmDatabase.tblReplineSDescription.Value);
        qrDetailsDescription.Width:=qrHeader.Width;
        qrDetailsDescription.BringToFront;
//       qrDetailsDescription.AutoSize:=True;
         {Set default single Line to '-'}
        if length(tmp)<=0 then
          tmp:='_';
        repeat
          tmp:=tmp + tmp;
        until length(tmp)>=150;
        qrDetailsDescription.Caption:=tmp;
        qrDetailBand.Height:=22;
       end;
    71,78: Begin
        qrSubDetailBand.Enabled:=False;
        qrDetailsDescription.Caption:=dmDatabase.tblReplineSDescription.Value;
        qrDetailBand.Height:=22;
      end;
    74,76: Begin
//        qrDetailsDescription.Caption:=dmDatabase.tblReplineSItemName.Value+'    '+ dmDatabase.tblReplineSDescription.Value;
        FiltertblAccount;
        qrSubDetailBand.Enabled:=True;
        qrDetailBand.Height:=0;
      end;
   Else   //73,75
     if trim(dmDatabase.tblReplineSDescription.Value)='' then
       qrDetailsDescription.Caption := dmDatabase.tblReplineSItemName.Value
     else
       qrDetailsDescription.Caption := dmDatabase.tblReplineSDescription.Value;
//     FiltertblAccount;
     qrSubDetailBand.Enabled:=False;
     qrDetailBand.Height:=22;
   end;
   if (qrDetailBand.Height<>0) And (TypeiD<>72) then
   begin
   for TypeiD:=1 to ColCount do // To be Extended to All Columns
     FormatColTotal(TypeID);
   end;

end;

Function TqrUserReport.FiltertblAccount:Integer;
Begin

   With dmDatabase do
   begin
     Result:=tblRepLineWRowTypeID.Value;
     case tblRepLineWRowTypeID.Value of
     70:begin  // Account
          tblAccount.Filtered:=False;
          if tblReplineBMainAccount.Value  = 1then
            tblAccount.Filter:='WAccountID='+tblReplineWRowItemID.AsString
          else
          begin
           tblAccount.Locate('WAccountID',tblReplineWRowItemID.AsString,[]);
           tblAccount.Filter:='SMAINACCOUNTCODE='''+tblAccountSMAINACCOUNTCODE.Value+'''';
          end;
          tblAccount.Filtered:=True;
        end;
     73:Begin   // Group1
          tblAccount.Filtered:=False;
          tblAccount.Filter:='WReportingGroup1ID='+tblReplineWRowItemID.AsString;
          tblAccount.Filtered:=True;
        end;
     74:begin   // Group1 Detail
          tblAccount.Filtered:=False;
          tblAccount.Filter:='WReportingGroup1ID='+tblReplineWRowItemID.AsString;
          if tblReplineBMainAccount.Value =1then
            tblAccount.Filter := tblAccount.Filter+' AND SSUBACCOUNTCODE=''000'' ';
          tblAccount.Filtered:=True;
        end;
     75:begin // Group2
          tblAccount.Filtered:=False;
          tblAccount.Filter:='WReportingGroup2ID='+tblReplineWRowItemID.AsString;
          tblAccount.Filtered:=True;
        end;
     76:Begin // Group2 Detail
          tblAccount.Filtered:=False;
          tblAccount.Filter:='WReportingGroup2ID='+tblReplineWRowItemID.AsString;
          if tblReplineBMainAccount.Value =1 then
            tblAccount.Filter := tblAccount.Filter+' AND SSUBACCOUNTCODE=''000'' ';
          tblAccount.Filtered:=True;
        End;
      else
       Begin
          tblAccount.Filtered:=False;
          tblAccount.Filter:='WAccountID=-10';
          tblAccount.Filtered:=True;
        End;
     end;
   end;
end;


procedure TqrUserReport.qrAccountPrint(sender: TObject; var Value: String);
begin
  Value:=AddDashInAccCode(DmDatabase.tblAccountSACCOUNTCODE.Text) + ' ' + DmDatabase.tblAccountSDescription.Text;
end;

Procedure  TqrUserReport.FilterHeadCols;
var
  vWPeriodStart,
  vWPeriodEnd,
  i             :integer;
  vBActual      :Boolean;
  mDate :Tdate;
begin
  With dmDatabase do
  for i:=1 to ColCount do begin
     FileterCols[i]:='';
     if tblRepCols.Locate('WColumnID;WReportID',VarArrayOf([i,dmDatabase.tblRepHeadWReportID.Value]),[]) then begin
       vBActual:=True;
       vWPeriodStart:=tblRepColsWPeriodStart.Value;
       vWPeriodEnd:=tblRepColsWPeriodEnd.Value;
       // Relative Case
       if (tblRepColsWPeriodStart.Value<=0) or
          (tblRepColsWPeriodEnd.Value<=0) then
       begin
         MDate:=vDate;
         mDate := IncMonth(mDate,vWPeriodStart);
         vWPeriodStart:=GetPeriod(mDate);
         MDate:= vDate;
         mDate := IncMonth(mDate,vWPeriodEnd);
         vWPeriodEnd:=GetPeriod(mDate);
         If tblRepColsWColumnTypeID.Value in [81,79] then begin
           Dec(vWPeriodEnd,13);
           Dec(vWPeriodStart,13);
         end;
       end;
       SwapInt(vWPeriodStart,vWPeriodEnd);
       // Budget Case
       if tblRepColsWColumnTypeID.Value=79 then
         vBActual:=False;
       if vBActual then
           FileterCols[i]:=' BActual=1 '
       else
         FileterCols[i]:=' BActual<>1 ';
       FileterCols[i] := FileterCols[i]+' And ((WPeriodID>='+IntToStr(vWPeriodStart)+
             ' And WPeriodID<='+IntToStr(vWPeriodEnd);
       if vWPeriodStart>=14 then
         FileterCols[i]:=FileterCols[i]+') Or (WPeriodID=0) )'
       else
         FileterCols[i]:=FileterCols[i]+'))'
     end;
   end;
end;


procedure TqrUserReport.qrSubDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
  i:integer;
  S:String;
begin
  CleanDataLbl;
  if ColCount>11 then ColCount:=11;
  For i:=1 to ColCount do // To Extend to All Columns
    FormatColValue(i);
   {Recal Last step Formuals Colomn}
   for i:=1 to ColCount do
    if FormulasTmp[i]<>'' then
    begin
      if ((dmDatabase.tblReplineBMainAccount.Value=0) AND (dmDatabase.tblRepLineWRowTypeID.Value in [70,74,76]) AND (dmDatabase.tblAccountBSubAccounts.Value =1)) then
        S:=''
      else begin
       s := FloatToStrT(StrToFloat(Calc(FormulasTmp[i],True)), ffFixed, 18, 2) ;
      end;
      (FindComponent('qrCol'+IntToStr(I)+'Data') as tqrLabel).Caption := s ;
    end;
end;

Function TqrUserReport.FormatColTotal(ColID:Integer):String;
Var
  CellID:string;
begin
  if ColID>ColCount then
    Exit;
  Result:='';
//    // Call Expression Evaluator
    if dmDatabase.tblRepLineWRowTypeID.AsInteger in [73,75,78] then
    begin
      CellID := Chr(64+ColID)+ dmDatabase.tblRepLineWRowID.AsString;
      Result:=FloatToStrT(Str2Float(Calc(CellID)),ffFixed, 18, 2);
    end;
  (FindComponent('qrCol'+IntToStr(ColID)+'Total') as tqrLabel).Caption:=Result;
end;

Procedure TqrUserReport.CleanDataLbl;
var
  i:integer;
begin
  For i:=1 to 11 do
  (FindComponent('qrCol'+IntToStr(i)+'Data') as tqrLabel).Caption:='';
end;

Procedure TqrUserReport.CleanTotalLbl;
var
  i:integer;
begin
  For i:=1 to 11 do
  (FindComponent('qrCol'+IntToStr(i)+'Total') as tqrLabel).Caption:='';
end;

end.
