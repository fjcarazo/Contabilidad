unit Uworkflowtoolbox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UPluginsSharedUnit,db, StdCtrls, OleCtrls, SHDocVw,mshtml,
  ExtCtrls, OleCtnrs, uni, ComCtrls;

type
  twf_TWorkFlowShowSelectedData = class(TWorkFlowImplementBase)
   public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
  end;


  twf_TWorkFlowShowSelectionData = class(TWorkFlowImplementBase)
   public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
  end;

  twf_TWorkFlowSplitTask = class(TWorkFlowImplementBase)
   public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
  end;

  twf_TWorkFlowMobileDevStep = class(TWorkFlowImplementBase)
   public
    constructor Create(AOwner: TComponent); override;
  published
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;
  end;

  twf_TWorkFlowDialog = class(TWorkFlowImplementBase)
   public
    constructor Create(AOwner: TComponent); override;
  published
    procedure  ExtraClick (sender : TObject) ;
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;

  end;
  twf_TWorkFlowImbeddedIE = class(TWorkFlowImplementBase)
   public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    localCach : TForm ;
    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;

  end;

  twf_TWorkFlowImbeddedOLE = class(TWorkFlowImplementBase)
   public

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published

    function   WorkFlowStart : TForm ; override;
    procedure  WorkflowEnd (AForm  : TForm );override;

  end;


  TfmWorkFlowToolBox = class(TForm)
    WebBrowser1: TWebBrowser;
    Timer1: TTimer;
  private
    
    { Private declarations }
  public
   NavTo : String ;
    { Public declarations }
  end;

var
  fmWorkFlowToolBox: TfmWorkFlowToolBox;

implementation

uses UDMTCCoreLink, OSFGeneralRoutines, StrUtils, UMsgBox, UGenSearch;



{$R *.dfm}
{ twf_TWorkFlowDialog }

constructor twf_TWorkFlowDialog.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'workflow-dialog';
  Description := 'Dialog screen'  +#13+#10 +
  'DIALOGTEXT test to use as question'  +#13+#10 +
  'DIALOGANSWERS answer posibilities YES|NO|CANCEL|OK|CLOSE'  +#13+#10 +
  'AUTOTRANS automatic process'  +#13+#10 +
  'PROCESS if text = UPDATE then the process logic will be executed'  +#13+#10 +
  'PROCESSSEL Selection for process'  +#13+#10 +
  'PROCESSUPD Update process'  +#13+#10 +
  'MEMOCONTROLTYPE 0 = standard , 1 = rtf , 3 is none'  +#13+#10 +

  'GUID unique identifieer for batch process' ;
  with Inparams.Add as TParam do
     begin
        Name := 'DIALOGTEXT' ;
        DataType := ftstring ;
        size := 255 ;
        Value := 'Your text' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'MEMOCONTROLTYPE' ;
        DataType := ftinteger ;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'DIALOGANSWERS' ;
        DataType := ftstring ;
        size := 255 ;
        Value := 'YES|NO|CANCEL|OK|CLOSE' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'AUTOTRANS' ;
        DataType := ftboolean ;
        Value := false ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PROCESS' ;
        size := 255 ;
        DataType := ftString;
        Value := '' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PROCESSSEL' ;
        DataType := ftmemo;
        Value := 'Select * from dochead where bposted = 0 and WTypeid = 10 and SReference = ' + QuotedStr('') ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'PROCESSUPD' ;
        DataType := ftmemo;
        Value := 'update dochead set SReference = '+ QuotedStr('<@VANREK@>') + ' where Wdocid = <@WDOCID@> @@GO@@ update dochead set SReference = trim(SReference) ||  '+ QuotedStr(';<@NAARREK@>') + ' '+
        ' where Wdocid = <@WDOCID@> @@GO@@  update dochead set SReference = trim(SReference) || '+ QuotedStr(';<@BEDRAG@>') + ' where Wdocid = <@WDOCID@> @@GO@@  update dochead set SReference = Trim(SReference) || '+ QuotedStr(';<@KENMERK@>') + ' where Wdocid = <@WDOCID@>  @@GO@@ ' +
        ' insert into ACCOUNTREF(WACCOUNTREFID, SREFERENCE, WACCOUNTID) values(GEN_ID(GEN_ACCOUNTREF_ID,1) ,'+ QuotedStr('@<@KENMERK@>') + ',<@WACCOUNTID@>) @@GO@@'  ;
     end;
  with Outparams.Add as TParam do
     begin
        Name := 'GUID' ;
        DataType := ftString;
        size := 255 ;
        Value := '';
     end;
     

end;

procedure twf_TWorkFlowDialog.ExtraClick(sender: TObject);
begin
   TForm(TButton(sender).Parent).ModalResult := TButton(sender).tag;
   if Assigned( Self.OnInternalProgress) then
        Self.OnInternalProgress(sender);
end;

procedure twf_TWorkFlowDialog.WorkflowEnd(AForm: TForm);
var
 AQuery : TUniQuery ;
 ANumber,vanRekening,NaarRekening,bedrag,OutString,ProcessList: String ;
 ACheck : Int64 ;
 aantalarray : array [0..9] of word ;
 i ,x: Integer ;
 AAmount : Integer ;
 AGuid : TGUID ;
begin


  inherited;
  ProcessList := '' ;
  aantalarray[0] := 1;
  aantalarray[1] :=  6   ;
  aantalarray[2] :=  3  ;
  aantalarray[3] :=  7  ;
  aantalarray[4] :=  9  ;
  aantalarray[5] :=  10 ;
  aantalarray[6] :=  5 ;
  aantalarray[7] :=  8 ;
  aantalarray[8] :=  4 ;
  aantalarray[9] :=  2 ;

  OutId := '0' ;
  OutSubid := '0' ;
  if  (Inparams.paramByName('PROCESS').AsString = 'UPDATE') and(AForm.ModalResult = mrOk) then
      begin
       AQuery := TUniQuery.Create(nil) ;
         try
           AQuery.Connection := DMTCCoreLink.TheZConnection ;
           AQuery.SQL.Text :=   Inparams.paramByName('PROCESSSEL').AsString ;
           AQuery.open ;
           if OSFMessageDlg('Processing ' + IntToStr(AQuery.RecordCount) +' records! continue?' ,mtConfirmation,[mbyes,mbno],0) = mryes then
           begin
             while not AQuery.Eof do
                begin
                 ProcessList := ProcessList  + #13+#10;

                 // add to fields
                 if Inparams.paramByName('PROCESSUPD').AsString  <> '' then
                    begin

                      CreateGUID(AGuid);
                      Outparams.ParamByName('GUID').AsString :=  GUIDToString(AGuid)     ;
                       OutString := TDatabaseTableRoutines.GetDatasetAsParamString(aQuery) +#13+#10 + 'GUID=' + GUIDToString(AGuid)  ;
                       ProcessList :=ProcessList +  StringReplace(OutString,#13+#10,' ',[rfReplaceAll]) ;
                       OutString := TDatabaseTableRoutines.ReplaceParams(Inparams.paramByName('PROCESSUPD').AsString,OutString) ;
                       Try
                       TDataBaseRoutines.ExecSqlWithDelim(OutString);
                       Except
                        on e:Exception do
                         ProcessList := ProcessList + e.message;
                       end;
                    end;
                   AQuery.Next ;
                end;
             OSFMessageDlg('End of processing ' + IntToStr(AQuery.RecordCount) +' records!'+ ProcessList ,mtConfirmation,[mbok],0) ;
           end;
         finally
           AQuery.free ;
         end;
      end else
   if  (Inparams.paramByName('PROCESS').AsString = 'GIRO') and(AForm.ModalResult = mrOk) then

      begin
       if not DMTCCoreLink.IsRegistered('{EB28B68B-8FBC-45E0-9F32-0977B3BD2F21}') then raise exception.Create('Process GIRO is not registered!');
       
        x := 0;
        vanRekening := TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select SBANKNUMBER1 FROM SYSVARS') ;
        vanRekening := TDataBaseStringRoutines.StripNotNumeric(vanRekening) ;
        NaarRekening := vanRekening ;
                if length(NaarRekening)  < 9 then
                  begin
                   // postbank
                   for i :=  Length(NaarRekening) downto 1 do
                    begin
                      ACheck := ACheck + StrToInt(NaarRekening[i]) * aantalarray[x] ;
                      inc(X);
                      if x= 10 then x:=0 ;
                    end;
                    x:= 11 - (ACheck mod 11) ;
                    if x = 11 then x := 0 ;
                    if x = 10 then x := 1 ;
                    NaarRekening := '00' + IntToStr(x) + rightstr('0000000'+NaarRekening,7) ;
                   end else
                   NaarRekening := rightstr('0000000'+NaarRekening,10) ;
                   vanRekening := NaarRekening  ;

         AQuery := TUniQuery.Create(nil) ;
         try
           AQuery.Connection := DMTCCoreLink.TheZConnection ;
           AQuery.SQL.Text :=   Inparams.paramByName('PROCESSSEL').AsString ;
           AQuery.open ;
           if OSFMessageDlg('Processing ' + IntToStr(AQuery.RecordCount) +' records! continue?' ,mtConfirmation,[mbyes,mbno],0) = mryes then
           begin
           while not AQuery.Eof do
              begin
               ProcessList := ProcessList  + #13+#10;
               ACheck := 0 ;
               x := 0;
                ANumber:=  RightStr('0000000000000000000'+FormatDateTime('YYYYMMDD'  ,now) + TDataBaseStringRoutines.StripNotNumeric(AQuery.FieldByName('SDOCNO').AsString),15)  ;
                NaarRekening := RightStr(TDataBaseStringRoutines.StripNotNumeric(TDatabaseDebtorCreditorRoutines.GetBankAccount(AQuery.FieldByName('Waccountid').AsInteger)),9);
                if length(NaarRekening)  < 9 then
                  begin
                   // postbank
                   for i :=  Length(NaarRekening) downto 1 do
                    begin
                      ACheck := ACheck + StrToInt(NaarRekening[i]) * aantalarray[x] ;
                      inc(X);
                      if x= 10 then x:=0 ;
                    end;
                    x:= 11 - (ACheck mod 11) ;
                    if x = 11 then x := 0 ;
                    if x = 10 then x := 1 ;
                    NaarRekening := '00' + IntToStr(x) + rightstr('0000000'+NaarRekening,7) ;
                   end else
                    NaarRekening := rightstr('0000000'+NaarRekening,10) ;

                 ACheck := 0 ;
                x := 0;
                for i :=  Length(ANumber) downto 1 do
                   begin
                     ACheck := ACheck + StrToInt(ANumber[i]) * aantalarray[x] ;
                     inc(X);
                     if x= 10 then x:=0 ;
                   end;
                  x:= 11 - (ACheck mod 11) ;
                     if x= 11 then x:=0 ;
                     if x = 10 then x := 1 ;
                  // x = check
                  ANumber := ANumber + IntToStr(x) ;
                 AAmount := Trunc(AQuery.FieldByName('FDOCAMOUNT').Asfloat * 100 );
                 bedrag := RightStr('00000000'+IntTostr(AAmount) ,8 );

                ACheck := 0 ;
                x := 0;
                for i :=  Length(bedrag) downto 1 do
                   begin
                     ACheck := ACheck + StrToInt(bedrag[i]) * aantalarray[x] ;
                     inc(X);
                      if x= 10 then x:=0 ;
                   end;
                  x:= 11 - (ACheck mod 11) ;
                  if x= 11 then x:=0 ;
                  if x = 10 then x := 1 ;

               bedrag := bedrag + intToStr(x);

              ProcessList :=ProcessList + aQuery.FieldByName('SDOCNO').AsString ;
               // add to fields
               if Inparams.paramByName('PROCESSUPD').AsString  <> '' then
                  begin
                     OutString := 'VANREK=' + vanRekening + #13+#10 + 'NAARREK=' + NaarRekening + #13+#10 + 'BEDRAG='+ bedrag + #13+#10 + 'KENMERK=' + ANumber + #13+#10 +
                     'WDOCID=' + AQuery.FieldByName('WDOCID').AsString + #13+#10 +  'WACCOUNTID=' + AQuery.FieldByName('WACCOUNTID').AsString;
                     ProcessList :=ProcessList + '  ' + StringReplace(OutString,#13+#10,' ',[rfReplaceAll]) ;
                     OutString := TDatabaseTableRoutines.ReplaceParams(Inparams.paramByName('PROCESSUPD').AsString,OutString) ;
                     Try
                     TDataBaseRoutines.ExecSqlWithDelim(OutString);
                     Except
                      on e:Exception do
                       ProcessList := ProcessList + e.message;
                     end;
                  end;
                 AQuery.Next ;
              end;
             OSFMessageDlg('End of processing ' + IntToStr(AQuery.RecordCount) +' records!'+ ProcessList ,mtConfirmation,[mbok],0) ;
           end;
         finally
           AQuery.free ;
         end;
      end;
    OutId :=  IntToStr(AForm.modalresult)  ;
    AForm.free ;
end;

function twf_TWorkFlowDialog.WorkFlowStart: TForm;
var
 AString,LocString : String ;
 ModalRes : Integer ;
 NextLeft : Integer ;
 aTimer : TTimer ;
begin
         NextLeft := 50 ;
          result := TForm.Create(self);
          AString := Inparams.paramByName('DIALOGANSWERS').AsString ;
         // YES|NO|CANCEL|OK|CLOSE
         while AString <> '' do
         begin
         if copy(AString,1,1) = '|' then
           delete(AString,1,1) ;
         if pos ('|',AString) > 0 then
           begin
           LocString := copy(AString,1,pos ('|',AString)-1);
           delete(AString,1,pos ('|',AString))
           end else
           begin
             LocString :=  AString ;
             AString := '';
           end;
          if  Inparams.paramByName('MEMOCONTROLTYPE').AsInteger = 1 then
          begin
           with TRichEdit.Create(result) do
            begin
               top := 150 ;
               left := 5 ;
               parent := Result ;
               Height := Result.Height -155 ;
               Width := Result.Width - 10 ;
               Anchors :=  [akBottom,akLeft,akRight,akTop] ;
               Text :=  Inparams.paramByName('DIALOGTEXT').AsString ;
               Font.Size := 14 ;
               SelectAll ;
               Alignment :=  taCenter;
               SelAttributes.Size := 14 ;
               ReadOnly := True ;
               ParentColor := True ;
            end;
          end else
          if  Inparams.paramByName('MEMOCONTROLTYPE').AsInteger = 2 then
          begin
          end else
          begin
          with TMemo.Create(result) do
            begin
               top := 150 ;
               left := 5 ;
               parent := Result ;
               Height := Result.Height -155 ;
               Width := Result.Width - 10 ;
               Anchors :=  [akBottom,akLeft,akRight,akTop] ;
               Text :=  Inparams.paramByName('DIALOGTEXT').AsString ;
               ReadOnly := True ;
               ParentColor := True ;
            end;
          end;
          modalres := -1 ;
          if LocString = 'YES' then
             modalres := mrYes else
          if LocString = 'NO' then
             modalres := mrNo else
          if LocString = 'CANCEL' then
             modalres := mrCancel else
          if LocString = 'OK' then
             modalres := mrOk else
          if LocString = 'CLOSE' then
             modalres := mrIgnore ;
          if modalres <> -1 then
          with TButton.Create(Result) do
             begin
                Parent := Result ;
                caption := LocString ;
                tag := modalres ;
                Top := 5 ;
                Left := NextLeft  ;
                NextLeft := NextLeft + 130 ;
                Width := 120 ;
                OnClick := self.ExtraClick ;
                Anchors :=  [akTop,akLeft] ;
             end;
         end;
    if Inparams.paramByName('AUTOTRANS').AsBoolean then
       begin
         aTimer := TTimer.Create(Result) ;
         aTimer.Enabled := False ;
         aTimer.OnTimer := self.OnInternalProgress ;
         aTimer.Interval := 200 ;
         aTimer.Enabled := True ;
       end;
end;
{ twf_TWorkFlowImbeddedIE }

constructor twf_TWorkFlowImbeddedIE.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'workflow-webbrowser';
  Description := 'Show imbedded Internet explorer'  +#13+#10 +
  'URL url to folow'  +#13+#10 +
  'REUSE keep IE in mem for next screen'  +#13+#10 +
  '1NAMEVALUE..3 name=value like usersname=test are used as post for fields in IE'  +#13+#10 +
  'SUBMIT if true it tryes to do a submit with the values of namevalue1..3'   ;

  with Inparams.Add as TParam do
     begin
        Name := 'URL' ;
        DataType := ftstring ;
        size := 255 ;
        Value := 'http://www.osfshop.com' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'REUSE' ;
        DataType := ftBoolean;
        Value := True ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := '1NAMEVALUE' ;
        DataType := ftString;
        size := 255 ;
        Value := '' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := '2NAMEVALUE' ;
        DataType := ftString;
        size := 255 ;
        Value := '' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := '3NAMEVALUE' ;
        DataType := ftString;
        size := 255 ;
        Value := '' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'SUBMIT' ;
        DataType := ftboolean;

        Value := false ;
     end;
end;



destructor twf_TWorkFlowImbeddedIE.Destroy;
begin
  if Assigned(localCach) then
    FreeAndNil(localCach);
  inherited;
end;

procedure twf_TWorkFlowImbeddedIE.WorkflowEnd(AForm: TForm);
begin
  inherited;
  if not Inparams.ParamByName('REUSE').AsBoolean then
    begin

    if Assigned(localCach) then
    FreeAndNil(localCach);
  end else
  begin
  AForm.Close ;
   AForm.Parent := nil ;
  end;
end;

function twf_TWorkFlowImbeddedIE.WorkFlowStart: TForm;
var
 ModalRes : Integer ;
 NextLeft : Integer ;

   forms : IHTMLElementCollection;
   form : IHTMLFormElement;
   idx,idY : integer;
   field: IHTMLElement;
   controlparams : TStringList;
   fName : String ;
   SetForm : IHTMLFormElement ;
 begin


  if Not Assigned(localCach) then
   begin
    result := TfmWorkFlowToolBox.Create(self)
    end
    else  result :=  localCach ;

   result.Parent := Self.Parent ;
   result.Align := alClient ;
   result.BorderStyle := bsNone ;
   result.Show;



    localCach := Result;
  with result as TfmWorkFlowToolBox do
     begin
     //   NavTo :=  ;
        WebBrowser1.Navigate(Inparams.ParamByName('URL').AsString);
        while WebBrowser1.Busy do
         Application.ProcessMessages ;

        controlparams := TStringList.Create;
        try
        controlparams.Text := Inparams.ParamByName('1NAMEVALUE').AsString +#13+#10+  Inparams.ParamByName('2NAMEVALUE').AsString +#13+#10+ Inparams.ParamByName('3NAMEVALUE').AsString ;
          SetForm := nil ;
           forms := (WebBrowser1.Document AS IHTMLDocument2).forms ;
              for idx := 0 to   forms.length -1  do
                begin
                  form := forms.item(idx,0) as IHTMLFormElement; ;
                   for idY :=  0 to form.length -1 do
                     begin
                        field := form.Item(idY,'') as IHTMLElement;
                        fName := field.id;
 
                       if field.tagName = 'INPUT' then fName := (field as IHTMLInputElement).name;
                       if field.tagName = 'SELECT' then fName := (field as IHTMLSelectElement).name;
                       if field.tagName = 'TEXTAREA' then fName := (field as IHTMLTextAreaElement).name;
                       if field.tagName = 'PASSWORD' then  fName :=(field as IHTMLTextAreaElement).name  ;

                        if controlparams.Values[fName] <> '' then
                           begin
                             SetForm := Form ;
                             if field.tagName = 'INPUT' then (field as IHTMLInputElement).value := controlparams.Values[fName]
                             else
                             if field.tagName = 'SELECT' then (field as IHTMLSelectElement).value := controlparams.Values[fName]

                             else
                             if field.tagName = 'TEXTAREA' then (field as IHTMLTextAreaElement).value := controlparams.Values[fName]
                             else
                             if field.tagName = 'PASSWORD' then (field as IHTMLTextAreaElement).value := controlparams.Values[fName];
                          end;
                     end;
                 end;
               if assigned(SetForm ) and (Inparams.ParamByName('SUBMIT').AsBoolean) then
                 SetForm.submit;
        finally

        end;
       //  WebFormSetFieldValue(WebBrowser1.Document AS IHTMLDocument2,0,'email_address','Test');

      //   WebFormSetFieldValue(WebBrowser1.Document AS IHTMLDocument2,2,'email_address','Test');
      //   WebFormSetFieldValue(WebBrowser1.Document AS IHTMLDocument2,3,'email_address','Test');
      //   WebFormSetFieldValue(WebBrowser1.Document AS IHTMLDocument2,4,'email_address','Test');

     end;
end;


{
 function WebFormGet(const formNumber: integer; const document: IHTMLDocument2): IHTMLFormElement;
 var
   forms : IHTMLElementCollection;
 begin
   forms := document.Forms as IHTMLElementCollection;
   result := forms.Item(formNumber,'') as IHTMLFormElement
 end;
 procedure WebFormSubmit(
   const document: IHTMLDocument2;
   const formNumber: integer) ;
 var
   form : IHTMLFormElement;
   field: IHTMLElement;
 begin
   form := WebFormGet(formNumber, WebBrowser1.Document AS IHTMLDocument2) ;
 
   form.submit;
 end;

procedure WebFormSetFieldValue(const document: IHTMLDocument2; const formNumber: integer; const fieldName, newValue: string) ;
 var
   form : IHTMLFormElement;
   field: IHTMLElement;
 begin
   form := WebFormGet(formNumber, WebBrowser1.Document AS IHTMLDocument2) ;
   field := form.Item(fieldName,'') as IHTMLElement;
   if field = nil then Exit;
 
   if field.tagName = 'INPUT' then (field as IHTMLInputElement).value := newValue;
   if field.tagName = 'SELECT' then (field as IHTMLSelectElement) := newValue;
   if field.tagName = 'TEXTAREA' then (field as IHTMLTextAreaElement) := newValue;
 end;
}
{ twf_TWorkFlowImbeddedOLE }

constructor twf_TWorkFlowImbeddedOLE.Create(AOwner: TComponent);
begin
  inherited;
 Displayname := 'workflow-olecontainer';
   Description := 'Object linked and Embedded container.'  +#13+#10 +
  'READONLY show file readonly.'  +#13+#10 +
  'INPLACE show inplace editor for file.'  +#13+#10 +
  'OLEFILE file to be loaded as ole file.'   ;
  with Inparams.Add as TParam do
     begin
        Name := 'OLEFILE' ;
        DataType := ftstring ;
        size := 255 ;
        Value := 'c:\text.pdf' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'READONLY' ;
        DataType := ftBoolean;
        Value := True ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'INPLACE' ;
        DataType := ftBoolean;
        Value := True ;
     end;
end;

destructor twf_TWorkFlowImbeddedOLE.Destroy;
begin

  inherited;
end;

procedure twf_TWorkFlowImbeddedOLE.WorkflowEnd(AForm: TForm);
begin
  inherited;
  AForm.Close ;
  AForm.free ;
end;

function twf_TWorkFlowImbeddedOLE.WorkFlowStart: TForm;
var
  acontainer : TOleContainer ;

begin
     try
          result := TForm.Create(self);
          acontainer := TOleContainer.create(Result) ;
          acontainer.Align := alClient ;
          acontainer.Parent := Result ;
          acontainer.CreateLinkToFile(Inparams.paramByName('OLEFILE').AsString,false);
          if Inparams.paramByName('READONLY').AsBoolean then
              acontainer.AutoActivate := aaManual
           else
          acontainer.AutoActivate := aaDoubleClick ;

          acontainer.AllowInPlace := Inparams.paramByName('INPLACE').AsBoolean  ;
    except
        on e: exception do
          begin
            FreeAndNil(result) ;
            raise Exception.Create(e.Message);
          end ;
    end;
end;
{ twf_TWorkFlowMobileDevStep }

constructor twf_TWorkFlowMobileDevStep.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'workflow-mobilestep';
  Description := 'Step reserved for external system comunication'  ;
end;

procedure twf_TWorkFlowMobileDevStep.WorkflowEnd(AForm: TForm);
begin
  inherited;
  Aform.free ;
end;

function twf_TWorkFlowMobileDevStep.WorkFlowStart: TForm;
var
 aTimer : TTimer ;
begin
   result := TForm.Create(self);
   aTimer := TTimer.Create(Result) ;
   aTimer.Enabled := False ;
   aTimer.OnTimer := self.OnInternalProgress ;
   aTimer.Interval := 200 ;
   aTimer.Enabled := True ;
end;
{ twf_TWorkFlowSplitTask }

constructor twf_TWorkFlowSplitTask.Create(AOwner: TComponent);
begin
  inherited;
  Displayname := 'workflow-splittask';
  Description := 'Split a task in to 2 diverent workflows.' + #13+#10 +
  'STEPID select the step to split this task to'  ;
    with Inparams.Add as TParam do
     begin
        Name := 'LASTID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
    with Inparams.Add as TParam do
     begin
        Name := 'STEPID' ;
        DataType := ftInteger;
        Value := 0 ;
     end;
end;

procedure twf_TWorkFlowSplitTask.WorkflowEnd(AForm: TForm);
begin
  inherited;
  Aform.free ;
end;

function twf_TWorkFlowSplitTask.WorkFlowStart: TForm;
var
 aTimer : TTimer ;
begin
   result := TForm.Create(self);
   aTimer := TTimer.Create(Result) ;
   aTimer.Enabled := False ;
   aTimer.OnTimer := self.OnInternalProgress ;
   aTimer.Interval := 200 ;
   aTimer.Enabled := True ;
end;

{ twf_TWorkFlowShowSelectionData }

constructor twf_TWorkFlowShowSelectionData.Create(AOwner: TComponent);
begin
  inherited;
  OutId := '' ;
  Displayname := 'workflow-selectiondata';
    Description := 'Generic selection screen.' + #13+#10+
  'SELECT sql to use as basis for lookup' + #13+#10+
  'FREEFIELDLOOKUPTYPE typoe of freefield search to use' + #13+#10+
  'LOOKUPTYPE 0 will genrate autofields on basis of the fields in the search and 2 will disable the search part.'  ;

  with Inparams.Add as TParam do
     begin
        Name := 'SELECT' ;
        DataType := ftmemo ;
        Value := 'select first 20 * from Stock  ' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FREEFIELDLOOKUPTYPE' ;
        DataType := ftString ;
        Size := 255 ;
        Value := 'STOCKENTRY' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'LOOKUPTYPE' ;
        DataType := ftInteger ;
        Value := 0 ;
     end;

end;

procedure twf_TWorkFlowShowSelectionData.WorkflowEnd(AForm: TForm);
begin
  inherited;
   OutId := '' ;
   if not TGenSearch(AForm).ZQGenSearch.IsEmpty then
     OutId :=  TGenSearch(AForm).ZQGenSearch.Fields[0].AsString ;
   AForm.Free ;
end;

function twf_TWorkFlowShowSelectionData.WorkFlowStart: TForm;
begin
 Result := TGenSearch.Create(self);
 TGenSearch(Result).Init(Inparams.paramByName('FREEFIELDLOOKUPTYPE').AsString);
 TGenSearch(Result).aSearchPanel.DefSql := Inparams.paramByName('SELECT').AsString ;
 if Inparams.paramByName('LOOKUPTYPE').AsInteger = 0 then
    TGenSearch(Result).AutoFieldCols := True ;

 if Inparams.paramByName('LOOKUPTYPE').AsInteger = 2 then
    TGenSearch(Result).PSearch.Visible := False ;

 TGenSearch(Result).ForceSearch := True ;
  if Inparams.ParamByName('LIMITCONTROL').AsString <> '' then
         begin
            Self.HandelProperties(StringReplace(Inparams.ParamByName('LIMITCONTROL').AsString,'#@#' ,#13+#10,[rfReplaceAll]),Result);
         end;

end;

{ twf_TWorkFlowShowSelectedData }

constructor twf_TWorkFlowShowSelectedData.Create(AOwner: TComponent);
begin
  inherited;
   Description := 'Generic show selection screen.' + #13+#10+
  'SELECT sql to use as basis' + #13+#10+
  'FORMAT format endresult' + #13+#10+
  'FONTSIZE,NAME_FONTFONT_COLOR,BACK_COLOR propertys to set the font for the control'  ;

  Displayname := 'workflow-selecteddata';
  with Inparams.Add as TParam do
     begin
        Name := 'SELECT' ;
        DataType := ftmemo ;
        Value := 'select * from Stock  where WStockid = <@WLINKID@>' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FORMAT' ;
        DataType := ftmemo ;
        Value := 'Stockcode <@SSTOCKCODE@> name <@SDESCRIPTION@>' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FONTSIZE' ;
        DataType := ftinteger ;
        Value := 12 ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'NAME_FONT' ;
        DataType := ftString ;
        Value := 'MS Sans Serif' ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'FONT_COLOR' ;
        DataType := ftinteger ;
        Value := clBlack ;
     end;
  with Inparams.Add as TParam do
     begin
        Name := 'BACK_COLOR' ;
        DataType := ftinteger ;
        Value := clWhite  ;
     end;

end;

procedure twf_TWorkFlowShowSelectedData.WorkflowEnd(AForm: TForm);
begin
  inherited;
  Aform.free ;
end;

function twf_TWorkFlowShowSelectedData.WorkFlowStart: TForm;
begin
 result := TForm.Create(self);
 with TMemo.Create(Result) do
   begin
      Parent := Result ;
      Align := alClient ;
      Text := TDatabaseTableRoutines.ReplaceParams(Inparams.paramByName('FORMAT').AsString , TDatabaseTableRoutines.GetQueryAsParamString(
      TDatabaseTableRoutines.ReplaceParams(Inparams.paramByName('SELECT').AsString,TDatabaseTableRoutines.GetDatasetAsParamString(locWorkFlowDataset)),false,true),nil,false) ;
      font.Name := Inparams.paramByName('NAME_FONT').asstring ;
      font.Color := Inparams.paramByName('FONT_COLOR').AsInteger ;
      Color := Inparams.paramByName('BACK_COLOR').AsInteger ;
      font.Size := Inparams.paramByName('FONTSIZE').AsInteger ;
   end;
end;

initialization
twf_TWorkFlowShowSelectedData.create(nil);
twf_TWorkFlowDialog.create(nil);
twf_TWorkFlowImbeddedIE.create(nil);
twf_TWorkFlowImbeddedOLE.create(nil);
twf_TWorkFlowMobileDevStep.create(nil);
twf_TWorkFlowSplitTask.create(nil);
twf_TWorkFlowShowSelectionData.create(nil);
end.
