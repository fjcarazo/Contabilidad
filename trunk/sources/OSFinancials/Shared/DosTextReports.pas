unit DosTextReports;

interface
Uses SysUtils,Printers;

Function PrintDocTotext80(aPrn:String;DocID,PaperType:Integer):Integer;

implementation


uses DosTextPrint, Database, GlobalFunctions, TcVariables, DatabaseAccess,
  UDMTCCoreLink,Tcashclasses;

Function EscChr(aCode:Char):String;
begin
  Result :=  aCode;
  exit;
  {this is not working fo Panasonic But it's look It must be there for
   Epson ???}
  if aCode>#15 then
    Result := #27+REsult;
end;

Function XChr(X:Byte;aChar:Char):String;
begin
  Result := StringOfChar(aChar,x);
end;

Function TabChr(X:Byte):String;
begin
  Result := StringOfChar(#9,x);
end;

Function MkEsc(aCode:String):String;
Var
  ic:Integer;
begin
  Result:='';
  For ic:=0 to length(Acode) do begin
    Result:= Result + EscChr(aCode[ic]);
  end;
end;

Function Q:String;
begin
  Result:=#13#10;
end;



Function PrintDocTotext80(aPrn:String;DocID,PaperType:Integer):Integer;
VAR
    Linne : Integer;
    TotExc ,fTotal,TxTotal: Real;
    LongDes:String;
    PageNbr:Integer;
    NextLine:integer;
    DocText:String;
    Lines:Array[0..200] of String;
    LineCount:Integer;
    DocHRec : TDocHeadRec;
    ComLng:Boolean;
    Function ReadComment(NotCom:Boolean=True):String;
    var
      iPos:Integer;
    begin
      iPos := Pos(#13#10,LongDes);
      if iPos=0 then
        iPos := Pos(#13,LongDes)
      else
        inc(ipos);
      if NotCom then begin
        if (iPOs>100) OR (iPOs=0) then iPos:=100
      end else
        if (iPOs>26) OR (iPOs=0) then iPos:=26 ;
      Result := Copy(LongDes,1,ipos);
      System.Delete(LongDes,1,iPos);
      if Result='' then exit;
      While (Result[Length(Result)] in [#13,#10]) Do
        System.Delete(Result,Length(Result),1);
    end;
    Procedure PrepareDocLines;
    begin
      LineCount:=0;

      dmDatabase.tblDocLine.filtered:=False;
      dmDatabase.tblDocLine.sql.Text :='select * from docline where WDocID=' +dmDatabase.qryDocHeadWDocID.AsString ;
      dmDatabase.tblDocLine.open ;
      dmDatabase.tblDocLine.filtered:=True;
      SetSQlLine(' AND WDocID=''' +dmDatabase.tblDocHeaderWDocID.AsString+'''');
      dmDatabase.qrPrnDocLines.Open;
      dmDatabase.qrPrnDocLines.First;
      TotExc := 0;
      fTotal := 0;
      TxTotal := 0;
      While not dmDatabase.qrPrnDocLines.Eof do
      begin                                              //6
         Inc(LineCount);
         ComLng:=False;
         Case dmDatabase.qrPrnDocLinesWLineTypeID.Value of
         91: Begin
              ComLng := True;
              LongDes := DMTCCoreLink.ReadDescription(dmDatabase.qrPrnDocLinesWDescriptionID.AsInteger);
              Lines[LineCount] := Lines[LineCount] + MkEsc(#27#15#15) + ReadComment + #13+q
           end
         else
           //LongDes := dmDatabase.qrPrnDocLinesSdescription.Value;
           // 3.72 bug Item description not printing


           LongDes := DMTCCoreLink.ReadDescription(dmDatabase.qrPrnDocLinesWDescriptionID.AsInteger);
           Lines[LineCount] := Lines[LineCount]     + MkEsc(#15)+
           dmDatabase.qrPrnDocLinesSSTOCKCODE.AsString + #13+TabChr(2)+
           ReadComment(True)     + #13+TabChr(6)+
           FormatFloat(
           dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WEntryDecimals)
           ,dmDatabase.qrPrnDocLinesFQtyShipped.Value)+ #13+TabChr(8)+

           FormatFloat(
           dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals)
           ,dmDatabase.qrPrnDocLinesFSellingPrice.Value)+ #13+TabChr(9)+
           FormatFloat('0.00',dmDatabase.qrPrnDocLinesFItemDiscount.Value)+ #13+TabChr(11)+
           FormatFloat(
           dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals)
           ,dmDatabase.qrPrnDocLinesFExclusiveAmt.Value)+ #13+TabChr(12)+ '   '+
           FormatFloat(
           dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals)
           ,dmDatabase.qrPrnDocLinesFTaxAmount.Value)+ #13+TabChr(14)+
           FormatFloat(
           dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals)
           ,dmDatabase.qrPrnDocLinesFInclusiveAmt.Value)+ q;
           TotExc  := TotExc + FixAmount(dmDatabase.qrPrnDocLinesFExclusiveAmt.Value);
           TxTotal := TxTotal + FixAmount(dmDatabase.qrPrnDocLinesFTaxAmount.Value);
           fTotal:= fTotal + FixAmount(dmDatabase.qrPrnDocLinesFInclusiveAmt.Value);
         end;
         Repeat
           if Length(LongDes)>0  then
           begin
              Inc(LineCount);
              if Not ComLng then
                Lines[LineCount] := MkEsc(#15) + TabChr(2)+ ReadComment(True) + Q
              else
                Lines[LineCount] := MkEsc(#15) +  ReadComment + Q;
           end;
         Until (trim(LongDes)='') Or (LineCount=200);
         dmDatabase.qrPrnDocLines.Next;
       end;                                               //6
      dmDatabase.qrPrnDocLines.Close;
    end;
    Function  AddHeadings:string;
    begin
      LoadDocHead(DocID,DocHRec);
      With dmDatabase do
      begin
        Result := '';
        Inc(PageNbr);
        Result :=  MkEsc(#27#18#18)+ DocHRec.CompLogo.SCompName+#13+TabChr(7)+ DocHRec.SDocNo +q;
        Result := Result + Q;
        Result := Result + DocHRec.CompLogo.SAdd1 + #13+#9+#9+#9+#9+#9+#9+#9 + Trim(IntToStr(PageNbr))+q;
        Result := Result + DocHRec.CompLogo.SAdd2 + #13+ TabChr(7) +DocHRec.SDate + q;
        Result := Result + DocHRec.CompLogo.SAdd3 + MkEsc(#15) +' '+DocHRec.CompLogo.SAddCode + MkEsc(#18#13)+ TabChr(7) + DocHRec.STAXRef+Q ;
        Result := Result + MkEsc(#13#18) + TabChr(7) + DocHRec.SRef + q;
        if DocHRec.CompLogo.Visible then
          Result := Result + MkEsc(#15) + 'Tel :'+ DocHRec.CompLogo.STel+ ' Fax :' + DocHRec.CompLogo.SFax+#13+MkEsc(#18#9+#9+#9+#9+#9+#9+#9)+DocHRec.SACCOUNTCODE+q
        else
          Result := Result + MkEsc(#18#13) + TabChr(7) + DocHRec.SACCOUNTCODE + q;
        Result := Result + MkEsc(#15) + DocHRec.CompLogo.SEmail + q;
        Result := Result + MkEsc(#18) + q ;
        Result := Result + DocHRec.SACCOUNTDesc + MkEsc(#13+TabChr(5)) + DocHRec.SdelAdr1 + q;
        Result := Result + DocHRec.SPost1 + MkEsc(#13+TabChr(5)) + DocHRec.SdelAdr2 + q;
        Result := Result + DocHRec.SPost2 + MkEsc(#13+TabChr(5))+ DocHRec.SdelAdr3 + q;
        Result := Result + DocHRec.SPost3 + MkEsc(#13+TabChr(5))+ DocHRec.SdelCode + q;
        Result := Result + DocHRec.SPostCode;// + MkEsc(#13+TabChr(5))+ DocHRec.SdelCode + q + Q;
        Result := Result + q + q + q + q + q ;
      end;
    end;
    Function BlankSummary:String;
    Var
      I:Byte;
    Begin
      Result:='';
      For i:=1 to 13 do Result := Result + Q;
    end;
    Function AddSummary:String;
    begin
      Result := '';
      Result := Result + TabChr(11)+
      FormatFloat(
      dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals)
      ,TotExc)+#13+TabChr(12)+ '  '+
      FormatFloat(
      dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals)
      ,TxTotal)+#13+TabChr(14)+
      FormatFloat(
      dmDatabase.SetOfBooksPropertys.DataParameter.GetmaskFromDigets(dmDatabase.SetOfBooksPropertys.DataParameter.WDocRowDecimals)
      ,fTotal)+ q + q;
      Result := Result  + MkEsc(#27#18#18) ;
      Result := Result  + q ;
      Result := Result  + DocHRec.SMess1 + q;
      Result := Result  + DocHRec.SMess2 + q;
      Result := Result  + DocHRec.SMess3 + q;
      Result := Result  + '' + q ;
//      Result := Result  + q ;
      Result := Result  + MkEsc(#15)+#9+#9+#9+ DocHRec.CompLogo.SCompReg + q;
      Result := Result  + #9+#9+#9+DocHRec.CompLogo.STAXRegNo +MkEsc(#18) + q ;
      Result := Result  + MkEsc(#15)+q ;
      Result := Result  + MkEsc(#15)+q ;
      Result := Result  + MkEsc(#15)+q ;
      Result := Result  + '.' + q ;
    end;
    Function AddLines:String;
    begin
      Linne:= 20;
      Result:='';
      While (NextLine<=LineCount) And (Linne>1) do
      begin
        Result := Result + Lines[NextLine];
        Inc(NextLine);
        Dec(Linne);
      end;
      while linne > 0 do
      begin  //8
       Result := Result + q;
       linne:=linne-1;
     end;

    end;
begin
  aPrn:=Uppercase(aPrn);
  if Trim(aPrn)='' then
  begin
    aPrn := Printer.Printers[PrnVars.PrinterIndex];
  end;
  DocText:='';
  LineCount:=0;
  NextLine:=1;
  PageNbr :=0;
  PrepareDocLines;

  While (NextLine<=LineCount) do
   try
    DocText := DocText + AddHeadings + AddLines;
    if NextLine>LineCount then
      DocText := DocText + AddSummary
    else
      DocText := DocText + BlankSummary;
   except
      DocText:='';
   end;
   if DocText<>'' then
     PrintTextNow(DocText,aPrn,AppName+'Document ',readSysParam('cbForceCutprn1',True,0).AsBoolean);
end;



end.
