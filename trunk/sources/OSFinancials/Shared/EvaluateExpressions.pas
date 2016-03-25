(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit EvaluateExpressions;


interface
Uses Sysutils;


Function  CalcPower(OldOp:Char;TmpCalcPower,RetExpression:String):String;
Procedure EvalExpr(OldOp:Char;Expression:String;Var TmpCalcResult,CalcResult:String);
Function  Calc(Expression:String;Loc:Boolean=False):String;
Function  EvalFonction(Fonction:String;RetExpression:String):String;
Function  SoutPart(Var Source:String;CarG,CarD:Char;Var Retlong:Integer):String;StdCall;
Function  FixNextOp(NextOp:Char;Var Source,Express:String):Char;
Function  GetNextOp  (Var Source,Express:String;LimGauche,LimDroite:String):Char;stdcall;
Function  GetMid  (Source:String;DebutPos:Integer):String;stdCall;
Function  isNumber(SValNumber:String):Boolean;
Function  FixExpression(Var wExpression:String):Boolean;
Function  OpLogiqIn(Expr:string):Boolean;
Function  EvalBoolean(Expres:String):String;

Const
  AllOps='(-+*/^';
Type
  ToTalRow = Array [1..13] of Real;

Var
  UserTotalA:Array of ToTalRow;
  LocalTot : Array [1..13] of Real;
implementation

Uses Math;

Var
  UseLocMem : Boolean;

Function Str2Int(S:String):Integer;
begin
 Result:=0;
 if (Trim(S)='') then exit;
 try
   Result:=StrToInt(s);
 except
   Result:=0;
 end;
end;

Procedure  SpitCell(Cell:String;Var Col,Row:Integer);
begin
  Col  := 0;
  Row  := 0;
  if (length(Cell)>=2) AND (Ord(Cell[1]) in [65..90]) then
  begin
    Col:=Ord(Cell[1])-64;
    Row:=Str2Int(Copy(Cell,2,18));
  end;
end;

Function Str2Float(S:String):Real;
 Var i : Integer ;
begin
 // done : Pieter Lets strip anny non numeric characters before conversion
 for i := length(S) downto 1 do
    if not (s[i] in ['1','2','3','4','5','6','7','8','9','0',DecimalSeparator,'-']) then
       delete(s,i,1);

 Str2Float:=0;
 if (Trim(S)='') then exit;
 try
   str2Float:=StrToFloat(s);
 except
   Str2Float:=0;
 end;
end;

Function  CalcPower(OldOp:Char;TmpCalcPower,RetExpression:String):String;
Var
  Res:Real ;
Begin
  Try
    Res:=Power(Str2Float(TmpCalcPower),Str2Float(RetExpression));
    CalcPower:=FloatToStr(Res);
  except (* error divided by 0 *)
    CalcPower:='0';
  end;
end;

Procedure EvalExpr(OldOp:Char;Expression:String;Var TmpCalcResult,CalcResult:String);
begin
   FixExpression(Expression);
   Case OldOp of
   '+':begin
         CalcResult:=FloatToStr(Str2Float(CalcResult)+Str2Float(Expression));
       end;
   '-':begin

         CalcResult:=FloatToStr(Str2Float(CalcResult)-Str2Float(Expression));
       end;
   '*':begin
         TmpCalcResult:=FloatToStr(Str2Float(TmpCalcResult)*Str2Float(Expression));
       end;
   '/':begin
         TmpCalcResult:=FloatToStr(Str2Float(TmpCalcResult)/Str2Float(Expression));
       end;
   end;
end;


Function Calc(Expression:String;Loc:Boolean=False):String;
//Function Calc(Expression:String):String;
Var
 LimD,LimG,
 Fonction        :String;
 RetExpression   :String;
 IntTmp1,Retlong :LongInt;
 OldOp,NextOp,
 PwOldOp         :char;
 TmpCalcResult,
 TmpCalcPower,
 CalcResult      :String;
 Signe           :Integer;
label
  FixSigne;
Begin
  LimG:='"';
  LimD:='"';
  OldOp:='+';
  PwOldOp:='+';
  CalcResult:='';
  UseLocMem := Loc;

  while Expression<>'' do
  begin
    Signe:=1;
FixSigne:
    RetExpression:=AllOps;
    NextOp:=GetNextOp(Expression,RetExpression,LimG,LimD);
//
    NextOp:=FixNextOp(NextOp,Expression,RetExpression);
    if ((NextOp='+') or (NextOp='-')) and (RetExpression='') then
    begin
      Signe:=signe * StrToInt(NextOp+'1');
      Goto FixSigne;
    end;
    if NextOp=#0 then
      if length(IntToStr(Signe))>1 then
        Expression:='-'+Expression else
    else
      if length(IntToStr(Signe))>1 then
        RetExpression:='-'+RetExpression;
    if  NextOp='(' then
    Begin
       Expression:='('+Expression;
       RetLong:=-1;
       // RetLong:=-1 ,On Cherche seulement la position des parentheses
       // avec la fonction SoutPart.
       StrToInt(SoutPart(Expression,'(',')',RetLong));
       if (RetExpression='-') or (RetExpression='+') then
        RetExpression:=''; 
       RetExpression:=RetExpression+Copy(Expression,1,RetLong+2);
       IntTmp1:=Pos('(',RetExpression);
       Expression:=GetMid(Expression,RetLong+3);
       if IntTmp1>1 then //Cas de fonction Probable ou Variable tableau
       begin
         Fonction:=Copy(RetExpression,1,IntTmp1-1);
         RetExpression:=Copy(RetExpression,IntTmp1+1,length(RetExpression)-IntTmp1-1);
         RetExpression:=EvalFonction(Fonction,RetExpression);
       end
       else  // Cas de simple parenthese
       begin
         RetExpression:=Copy(RetExpression,2,length(RetExpression)-2);
         RetExpression:=Calc(RetExpression,Loc);
         if Signe=-1 then
         RetExpression:=FloatToSTr((Str2Float(RetExpression)*-1));
         Signe:=1;

       end;
       if Expression='' then
          NextOp:=#0
       else
       begin
         if OpLogiqIn(Expression) then
         begin
            ExPression:=EvalBoolean(ExPression);
            NextOp:=Char(Expression[1]);
            NextOP:=FixNextOp(NextOp,Expression,RetExpression)
         end
         else
         begin
           NextOp:=Char(Expression[1]);
           Expression:=GetMid(Expression,2);
           NextOP:=FixNextOp(NextOp,Expression,RetExpression)
         end;
      end;
    end;
    if (OldOp='^') and (NextOp<>'^') then
    begin
      OldOp:=PwOldOp;
      if NextOp=#0 then
        Expression:=CalcPower(OldOp,TmpCalcPower,Expression)
      else
        RetExpression:=CalcPower(OldOp,TmpCalcPower,RetExpression);
      TmpCalcPower:='';
    end;
    Case NextOp of
    '+','-':Begin
              EvalExpr(OldOp,RetExpression,TmpCalcResult,CalcResult);
              if Pos(OldOp,'+-')=0 then
              begin
                CalcResult:=FloatToStr(Str2Float(CalcResult)+Str2Float(TmpCalcResult));
                TmpCalcResult:='';
              end;
              OldOp:=NextOp;
            end;
    '*','/':Begin
              Case OldOp of
                '+','-':begin
                         FixExpression(RetExpression); // Test if Error
                         TmpCalcResult:=FloatToStr(Str2Float(RetExpression)*StrToInt(OldOp+'1'));
                       end;
                '*','/':Begin
                         EvalExpr(OldOp,RetExpression,TmpCalcResult,CalcResult);
                       end;
              else
                  // Erreur Probable
              end;
              OldOp:=NextOp;
            end;
    '^'    :begin
              if OldOp<>'^' then
              begin
                PwOldOp:=OldOp;
                TmpCalcPower:=RetExpression;
                FixExpression(TmpCalcPower);
                if PwOldOp='-' then
                begin
                  TmpCalcPower:='-'+TmpCalcPower;
                  PwOldOp:='+';
                end;
              end
              else
               TmpCalcPower:=CalcPower(OldOp,TmpCalcPower,RetExpression);
              OldOp:=NextOp;
            end;
     '>','<','=': // Added Specialy for Turbo CASH
            Begin
              EvalExpr(OldOp,RetExpression,TmpCalcResult,CalcResult);
              if Pos(OldOp,'+-')=0 then
              begin
                CalcResult:=FloatToStr(Str2Float(CalcResult)+Str2Float(TmpCalcResult));
                TmpCalcResult:='';
              end;
              OldOp:=NextOp;
           end;
    else
      if RetExpression=AllOps then
      begin
        if OpLogiqIn(Expression) then
          Expression:=EvalBoolean(Expression);
        RetExpression:=Expression;
        Expression:='';
        EvalExpr(OldOp,RetExpression,TmpCalcResult,CalcResult);
        RetExpression:=TmpCalcResult;
        TmpCalcResult:='0';
        OldOp:='+';
      end;
      EvalExpr(OldOp,RetExpression,TmpCalcResult,CalcResult);
      if (OldOp<>'+') And (OldOp<>'-') then
        CalcResult:=TmpCalcResult;
    end;
  end;
  Calc:=CalcResult;
end;

Function EvalFonction(Fonction:String;RetExpression:String):String;
// Cette fonction permet d'evaluer les fonctions contenues dans
// les expressions. Elle contiendra toutes  les fonctions
// qui seront disponibles.

Var
 iCount,iPos,
 iRow,iCol,
 jRow,jCol,
 i,j:integer;
 S1,S2,S3:string;
 Res:Real;

begin
// Cas des fonction numeriques avec un seul Parametre numerique
  Result:='';
  Fonction:=UpperCase(Trim(Fonction));
  RetExpression:=UpperCase(Trim(RetExpression));
  if (Fonction='@ABS') or (Fonction='ABS') then
  begin
    Result:=FloatToStr(ABS(Str2Float(Calc(RetExpression))));
  end
  else
  if (Fonction='@SUM') or (Fonction='SUM') then
  begin
    iPos:=Pos(':',RetExpression);
    if iPos=0 then
 //     error
    else
    begin
      S1:=Trim(Copy(RetExpression,1,iPos-1));
      S2:=Trim(GetMid(RetExpression,iPos+1));
      if (length(S1)<2) Or (length(S2)<2) then
        // Error
      else
      begin
        Res:=0;
        SpitCell(S1,iCol,iRow);
//        iCol:=Ord(S1[1])-64;
//        iRow:=StrToInt(S1[2]);
        SpitCell(S2,jCol,jRow);
//        jCol:=Ord(S2[1])-64;
//        jRow:=StrToInt(S2[2]);
        if iCol>jCol then begin i:=jCol;jCol:=iCol;iCol:=i end;
        if iRow>jRow then begin i:=jRow;jRow:=iRow;iRow:=i end;
        For i:=iRow to jRow do
          For j:=iCol to jCol do
            Res := Res + UserTotalA[i][j];
        Result := FloatToStr(Res);
      end;
    end;
  end else
  if (Fonction='@AVG') or (Fonction='AVG') then
  begin
    iPos:=Pos(':',RetExpression);
    if iPos=0 then
 //     error
    else
    begin
      S1:=Trim(Copy(RetExpression,1,iPos-1));
      S2:=Trim(GetMid(RetExpression,iPos+1));
      if (length(S1)>2) Or (length(S2)>2) then
        // Error
      else
      begin
        Res:=0;
        iCount:=0;
        iCol:=Ord(S1[1])-64;
        iRow:=StrToInt(S1[2]);
        jCol:=Ord(S2[1])-64;
        jRow:=StrToInt(S2[2]);
        if iCol>jCol then begin i:=jCol;jCol:=iCol;iCol:=i end;
        if iRow>jRow then begin i:=jRow;jRow:=iRow;iRow:=i end;
        For i:=iRow to jRow do
          For j:=iCol to jCol do
          begin
            iCount:=iCount+1;
            Res:=Res + UserTotalA[i][j];
          end;
        try
          Result:=FloatToStr(Res/iCount)
        except end;
      end;
    end;
  end
  else
  if (Fonction='@IF') or (Fonction='IF') then
  begin
    // Get First Part
    i:=Pos(',',RetExpression);
    if i=0 then ; // Error
    S1:=Copy(RetExpression,1,i-1);
    RetExpression:=GetMid(RetExpression,i+1);
    // Get 2Cnd Part
    i:=Pos(',',RetExpression);
    if i=0 then ; // Error
    S2:=Copy(RetExpression,1,i-1);
    // Get 3th Part
    S3:=GetMid(RetExpression,i+1);
    j:=Str2Int(Calc(S1));
    if J=0 then
      Result:=Calc(S3)
    else
      Result:=Calc(S2);
  end
  else
  if (Fonction='@INV') or (Fonction='INV') then
    Result:=FloatToStr(1/(Str2Float(Calc(RetExpression))))
  else
  if (Fonction='@SQRT') or (Fonction='SQRT') then
    Result:=FloatToStr(SQRT(Str2Float(Calc(RetExpression))));
end;

Function FixExpression(Var wExpression:String):Boolean;
Var
 vCol,
 vline : Integer;
 Ch    : char;
begin
   wExpression:=UpperCase(Trim(wExpression));
   if wExpression='' then exit;
   if not isNumber(wExpression) then
   begin
     Ch:=' ';
     if wExpression[1] in ['-'] then
     begin
       Ch:=wExpression[1];
       Delete(wExpression,1,1);
     end;
     vCol:=Ord(wExpression[1]);
     if vCol>=65 then  vCol:=vCol-64;
     vLine:=Str2Int(GetMid(wExpression,2));
     FixExpression:=True;
     {27/06/2003}
     if UseLocMem Then
       wExpression:=FloatToStr(LocalTot[vCol])
     else
       wExpression:=FloatToStr(UserTotalA[vline][vCol]);
     if (wExpression[1]='-') And (Ch='-') then
       wExpression[1]:='+'
     else if (wExpression[1]='+') And (Ch='-') then
       wExpression[1]:='-';
   end
   else
     FixExpression:=False // Error
end;

Function GetMid(Source:String;DebutPos:Integer):String;stdCall;
begin
 GetMid:='';
 if (DebutPos<=0) or (DebutPos>Length(Source)) then Exit;
 GetMid:=Copy(Source,DebutPos,Length(Source)+1-DebutPos)
end;

Function isNumber(SValNumber:String):Boolean;
var
  i:integer;
begin
  SValNumber:=Trim(SValNumber);
  if length(SValNumber)<1 then
    isNumber:=False
  else
  begin
    isNumber:=True;
    While (SValNumber[1]='+') or (SValNumber[1]='-') do
      SValNumber:=GetMid(SValNumber,2);
    For i:=1 to length(SValNumber) do
      if Pos(SValNumber[1],'.0123456789')=0 then
      begin
        isNumber:=False;
      end;
    end;
end;


Function LookPos(iPos:Integer;SousChaine,Chaine:String):Integer;stdCall;
{ Cfr Fonction Pos. Plus Debut variant}
Var
  STmp:String;
begin
 Stmp:='';
 if iPos<=0 then iPos:=1;
 if iPos<=length(SousChaine) Then Stmp:=GetMid(Chaine,iPos);
 LookPos:=Pos(Chaine,SousChaine);
end;

Function SoutPart(Var Source:String;CarG,CarD:Char;Var Retlong:Integer):String;StdCall;
{ Lors de l'appel si RetLong est <>-1, la chaine Source ne contiendra plus la partie trouvee
  Si RestLong=-1 a l'appel, Source restera intacte et SoutPart prend la position de la partie
  trouvee et RetLong la longueur)
 }
Var
 iCount,Debut,Fin,
 CharCount:Integer;
 StpTmp,SourceTmp:String;
Begin
 SoutPart:='';
 SourceTmp:=Source;
 Fin:=Length(Source);
 Debut:=0;
 if Length(Source)=0 Then exit;
 if Pos(CarG,Source)<>0 then
 begin
   CharCount:=1;iCount:=Pos(CarG,Source);Debut:=iCount;
   while (CharCount>0) and ( iCount<Length(Source) )  do
   begin
     inc(iCount);
     if Copy(Source,iCount,1)=CarD then Dec(CharCount) else
        if Copy(Source,iCount,1)=CarG then Inc(CharCount);
     if CharCount=0 then
     begin
       Fin:=iCount;
       Break
     end;
     if iCount>=Length(Source) then
//     begin
      Fin:=0;
//      Debut:=0
//     end;
   end;
   StpTmp:=Copy(Source,Debut+1,fin-Debut-1);
   if (Copy(Source,1,Debut-1)+GetMid(Source,Fin+1))='' then
     Source:=''
   else
     Source:=Copy(Source,1,Debut-1)+GetMid(Source,Fin+1);
 end;
 if RetLong=-1 then
 begin
   Source:=SourceTmp;
//   if Debut<>0 then inc(Debut);
   if Debut=0 then inc(Debut);
   SoutPart:=IntToStr(Debut);
 end
 else
   SoutPart:=StpTmp;
 RetLong:=Length(StpTmp);
end;

Function FixNextOp(NextOp:Char;Var Source,Express:String):Char;
Var
 OpOk:Boolean;
 Signe:integer;
 S:String;
Begin
  // Analyse des cas des signes qui se suivent
  //++,-+,+-,*-,*+ etc.
  Signe:=1;
   OpOk:=False;
  While Not OpOk do
    begin
      Source:=Trim(Source);
       if (Pos(NextOp,'+-')>0) and (Pos(Char(Source[1]),'+-')>0) then
         begin
           if NextOp<>Char(Source[1]) then
              NextOp:='-' // Cas de -+ ou +-
           else
              NextOp:='+'; // Cas de -- ou ++
           Source:=GetMid(Source,2);
         end
       else
           if (Pos(NextOp,'*/')>0) and (Pos(Char(Source[1]),'+-')>0) then
           begin
//              Express:=FloatToStr(Str2Float(Express)*StrToInt(Char(Source[1])+'1'));
//              Source:=GetMid(Source,2);
              While (Source[1]='+') or (Source[1]='-') do
              begin
                Signe:=Signe*StrToInt(Char(Source[1])+'1');
                Source:=GetMid(Source,2);
              end;
              OpOk:=True;
              S:=IntToStr(Signe);
              if length(S)>1 then
                Source:=s[1]+Source;
           end
       else
           OpOk:=True;
    end;
  FixNextOp:=NextOp;
end;

Function GetNextOp(Var Source,Express:String;LimGauche,LimDroite:String):Char;stdcall;
Var
 tmpPos,Long,
 iPos         :Integer;
 NextOp       :Char;
 Ok           :Boolean;
begin
  Source:=Trim(Source);
  LimGauche:=Copy(LimGauche,1,10);
  LimDroite:=Copy(LimDroite,1,10);
  iPos:=0;
  Ok:=True;
  NextOp:=#0;
  GetNextOp:=NextOp;
  If (Source='') or (Express='') then exit;
  While Ok and (ipos<length(Source)) do
  begin
    Inc(iPos);
    if Pos(Source[iPos],Express)>0 then
    begin
      NextOp:=Char(Source[iPos]);
      Express:=Copy(Source,1,iPos-1);
      Source:=GetMid(Source,iPos+1);
      Break
    end;
    tmpPos:=Pos(Source[iPos],LimGauche);
    if tmpPos>0 then
    begin
       Long:=-1;
       if StrToInt(SoutPart(Source,LimGauche[tmpPos],LimDroite[tmpPos],Long))>0 then
          iPos:=iPos+Long+1
       else
         Ok:=False;
    end;
  end;
//
//  GetNextOp:=FixNextOp(NextOp,Source,Express);
  GetNextOp:=NextOp;
//
end;

Function OpLogiqIn(Expr:string):Boolean;
begin
  if (Pos('>',Expr)<>0) Or
     (Pos('<',Expr)<>0) Or
     (Pos('>=',Expr)<>0) Or
     (Pos('<=',Expr)<>0) Or
     (Pos('=',Expr)<>0) Or
     (Pos(' AND ',UpperCase(Expr))<>0) Or
     (Pos(' OR ',UpperCase(Expr))<>0) Or
     (Pos(' NOT ',UpperCase(Expr))<>0)
  Then
    Result:=True
  else
    Result:=False;
end;

Function Bool2Int(vBool:Boolean):integer;
begin
  if vBool then
    Result:=-1
  else
    Result:=0;
end;

Function Bool2Str(vBool:Boolean):String;
begin
  if vBool then
    Result:='-1'
  else
    Result:='0';
end;

Function EvalBoolean(Expres:String):String;
Var
  i:integer;
  vBool : Boolean;
  vLog1 : String;
  Value1,Value2 :Real;
begin
  vBool:=False;// test for double Boolean signe
  if Pos('>',Expres)<>0 then
  begin
     i:=Pos('>',Expres);
     vLog1:=Copy(Expres,1,i-1);
     Value1:=Str2Float(Calc(vLog1));
     Expres:=Trim(GetMid(Expres,i+1));
     if Pos('=',Expres)=1 then
     begin // Case of >=
       Expres:=Trim(GetMid(Expres,2));
       vBool:=True;
     end;
     Value2:=Str2Float(Calc(Expres));
     if vBool then
       Result:=Bool2Str(Value1>=Value2)
     else
       Result:=Bool2Str(Value1>Value2);
  end
  else
  if Pos('<',Expres)<>0 then
  begin
     i:=Pos('<',Expres);
     vLog1:=Copy(Expres,1,i-1);
     Value1:=Str2Float(Calc(vLog1));
     Expres:=Trim(GetMid(Expres,i+1));
     if Pos('=',Expres)=1 then
     begin // Case of <=
       Expres:=Trim(GetMid(Expres,2));
       vBool:=True;
     end;
     Value2:=Str2Float(Calc(Expres));
     if vBool then
       Result:=Bool2Str(Value1<=Value2)
     else
       Result:=Bool2Str(Value1<Value2);
  end
  else
  if Pos('=',Expres)<>0 then
  begin
     i:=Pos('=',Expres);
     vLog1:=Copy(Expres,1,i-1);
     Value1:=Str2Float(Calc(vLog1));
     Expres:=Trim(GetMid(Expres,i+1));
     Value2:=Str2Float(Calc(Expres));
     Result:=Bool2Str(Value1=Value2);
  end;
end;

end.
