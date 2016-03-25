unit UWorkFlowExeCuteStep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,UPluginsSharedUnit, Buttons, DB,
  uni, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, cxButtons,
  cxRichEdit;

type
  TfmWorkflowExecuteStep = class(TForm)
    ptop: TPanel;
    pView: TPanel;
    Timer1: TTimer;
    tShowScreen: TTimer;
    Panel2: TPanel;
    bContinue: TcxButton;
    Panel3: TPanel;
    Memo1: TcxRichEdit;
    lStepHint: TLabel;
    BwhereAmi: TcxButton;
    BBack: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bContinueClick(Sender: TObject);
    procedure ChoiceClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure activateTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tShowScreenTimer(Sender: TObject);
    procedure BwhereAmiClick(Sender: TObject);
    procedure BBackClick(Sender: TObject);


  private
    { Private declarations }
  public
    apluginRec : TFormPluginRecord ;
    aWorkFlowobj : TWorkFlowImplementBase ;
    params : TStringlist ;
    { Public declarations }
  end;

var
  fmWorkflowExecuteStep: TfmWorkflowExecuteStep;

implementation

uses UWorkFlowDatamodule, Debtor, OSFGeneralRoutines, InvoiceEntryGrid,
  UDMTCCoreLink, Uworkflowtoolbox, Uworkflowsetup, UMsgBox, NewProgress;

{$R *.dfm}

procedure TfmWorkflowExecuteStep.FormShow(Sender: TObject);

begin
  bContinue.Caption := DMTCCoreLink.GetTextLang(677);
  BwhereAmi.Caption := DMTCCoreLink.GetTextLangNoAmp(3485) ;
  lStepHint.Caption := DMTCCoreLink.GetTextLangNoAmp(3486) ;

  BBack.Caption := DMTCCoreLink.GetTextLangNoAmp(879) ;
  tShowScreen.Enabled := True ;
end;

procedure TfmWorkflowExecuteStep.FormCreate(Sender: TObject);
begin
params := TStringlist.Create ;
end;

procedure TfmWorkflowExecuteStep.FormDestroy(Sender: TObject);
begin
 params.free ;
end;

procedure TfmWorkflowExecuteStep.bContinueClick(Sender: TObject);
var
 x,Recs,TextWidth,i,ORgPRocess,LastTaskId,NewTaskId : Integer ;
 DoAdd : Boolean ;
 Amessage,SubSql,ALines : String ;
 AButton : Tbutton ;
 aQuery : TUniQuery;
 IsSplitStep : Boolean ;
begin


 pView.Caption := '' ;
   dmWorkflowData.ZQGetTransitions.close ;
   dmWorkflowData.ZQGetTransitions.Params[0].AsInteger :=  dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger ;
   dmWorkflowData.ZQGetTransitions.open ;

   if sender <> nil then
     begin

     dmWorkflowData.ZQHist.Open ;
     TRY
     dmWorkflowData.ZQHist.Insert ;
     dmWorkflowData.ZQHistWWORKFLOWWORKID.AsInteger := dmWorkflowData.ZQTasksWWORKFLOWWORKID.AsInteger ;
     dmWorkflowData.ZQHistWUSERID.AsInteger := dmWorkflowData.ZQTasksWUSERID.AsInteger ;
     dmWorkflowData.ZQHistWSTATUS.AsInteger := dmWorkflowData.ZQTasksWSTATUS.AsInteger ;
     dmWorkflowData.ZQHistWWORKFLOWSTEPID.AsInteger := dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger ;
     dmWorkflowData.ZQHistWLINKID.AsInteger := dmWorkflowData.ZQTasksWLINKID.AsInteger ;
     dmWorkflowData.ZQHistDDATEACTION.AsDateTime := dmWorkflowData.ZQTasksDDATEACTION.AsDateTime ;
     dmWorkflowData.ZQHist.post ;
     EXCEPT
        dmWorkflowData.ZQHist.Cancel;
     END;
     dmWorkflowData.ZQTasks.Edit ;
     if aWorkFlowobj <> nil then
       begin
         if aWorkFlowobj is twf_TWorkFlowSplitTask  then
           begin
            IsSplitStep := True ;
            ORgPRocess :=  dmWorkflowData.ZQTasksWWORKFLOWWORKID.AsInteger  ;
           end;
         aWorkFlowobj.WorkflowEnd( Tform(pView.tag));
         pView.tag :=0 ;
         ALines := '' ;
         for i := 0 to aWorkFlowobj.Outparams.Count -1 do
           begin
              if ALines <>'' then ALines := ALines + #13+#10 ;
              ALines :=  ALines + aWorkFlowobj.Outparams[i].Name +'=' + aWorkFlowobj.Outparams[i].AsString ;
           end;
         if ALines <> '' then
         dmWorkflowData.ZQTasksPARAMS.AsString := ALines ;
         if aWorkFlowobj.OutId <> '' then
          dmWorkflowData.ZQTasksWLINKID.AsString := aWorkFlowobj.OutId ;

       end ;
   dmWorkflowData.ZQTasksWSTATUS.AsInteger := 1 ;



   Amessage := '' ;
   // handel end step
   if not dmWorkflowData.ZQGetStepSSQLSTEP.IsNull then
      begin
        Amessage := dmWorkflowData.ZQGetStepSSQLSTEP.AsString ;
        if Trim(Amessage) <> '' then
          begin
            if pos('@@GO@@',Amessage) < 1 then
             Amessage := Amessage + '@@GO@@' ;
             try
              while pos('@@GO@@',Amessage) > 1 do
                begin
                 SubSql := trim(copy(Amessage,1,pos('@@GO@@',Amessage)-1));
                 Delete(Amessage,1,pos('@@GO@@',Amessage)+ 5);
                 if pos('SELECT',trim(UpperCase(SubSql))) = 1 then
                    begin
                      SubSql := TDatabaseTableRoutines.ReplaceParams(SubSql, TDatabaseTableRoutines.GetDatasetAsParamString(dmWorkflowData.ZQGetStep)+ #13+#10 + TDatabaseTableRoutines.GetDatasetAsParamString(dmWorkflowData.ZQTaskList));
                      aQuery := TUniQuery.Create(nil);
                      try
                       aQuery.Connection := DMTCCoreLink.TheZConnection ;
                       aQuery.SQL.Text := SubSql ;
                       aQuery.open ;
                       for i := 1 to dmWorkflowData.ZQTasks.FieldCount -1 do
                          begin
                            if aQuery.FindField(dmWorkflowData.ZQTasks.Fields[i].FieldName) <> nil then
                               begin
                                  dmWorkflowData.ZQTasks.Fields[i].Value := aQuery.FindField(dmWorkflowData.ZQTasks.Fields[i].FieldName).Value ;
                               end;
                          end;
                      finally
                        aQuery.free ;
                      end;
                    end else
                    begin
                      SubSql := TDatabaseTableRoutines.ReplaceParams(SubSql, TDatabaseTableRoutines.GetDatasetAsParamString(dmWorkflowData.ZQGetStep)+ #13+#10 + TDatabaseTableRoutines.GetDatasetAsParamString(dmWorkflowData.ZQTaskList));
                      DMTCCoreLink.ExecSql(SubSql);
                    end;
                end;
                except

                end;
          end ;

      end;
     dmWorkflowData.ZQTasks.Post ;
   end else
   begin
    // if aWorkFlowobj <> nil then
    //   begin
       //  aWorkFlowobj.WorkflowEnd( Tform(pView.tag));
        //  pView.tag :=0 ;
    //   end ;
   end;
   Recs := 0 ;
   x := 10 ;

   while not dmWorkflowData.ZQGetTransitions.Eof do
      begin
         DoAdd := False ;
         if TDatabaseTableRoutines.BlobFieldToString(dmWorkflowData.ZQGetTransitionsSCONDITION) <> '' then
           begin
             if varToStr(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue(TDatabaseTableRoutines.ReplaceParams(TDatabaseTableRoutines.BlobFieldToString(dmWorkflowData.ZQGetTransitionsSCONDITION),'KEY='+dmWorkflowData.ZQTasksWLINKID.AsString))) <> '' then
               DoAdd := True ;
           end else
           begin
              DoAdd := True ;
           end;
         if DoAdd then
            begin
                  if  IsSplitStep then
                    begin
                        try
                         LastTaskId := dmWorkflowData.ZQTasksWWORKFLOWWORKID.AsInteger ;
                         dmWorkflowData.ZQTasks.edit ;
                         dmWorkflowData.ZQTasksWSTATUS.AsInteger := -1 ;
                         dmWorkflowData.ZQGetStep.close ;
                         dmWorkflowData.ZQGetStep.params[0].AsInteger :=  dmWorkflowData.ZQGetTransitionsWTOWORKFLOWSTEPID.AsInteger ;
                         dmWorkflowData.ZQGetStep.open ;
                         dmWorkflowData.ZQTasks.post ;
                         NewTaskId :=0 ;

                     if  (dmWorkflowData.ZQGetTransitionsWTOWORKFLOWSTEPID.AsInteger <> 0) and (dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger <> dmWorkflowData.ZQGetTransitionsWTOWORKFLOWSTEPID.AsInteger) then
                         begin


                         dmWorkflowData.ZQGetStep.close ;
                         dmWorkflowData.ZQGetStep.params[0].AsInteger := aWorkFlowobj.Inparams.ParamByName('STEPID').AsInteger ;
                         dmWorkflowData.ZQGetStep.open ;
                         if not dmWorkflowData.ZQGetStep.IsEmpty then
                         begin
                         dmWorkflowData.ZQTasks.Insert ;
                         NewTaskId := dmWorkflowData.ZQTasksWWORKFLOWWORKID.AsInteger ;
                         dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger := aWorkFlowobj.Inparams.ParamByName('STEPID').AsInteger ;
                         dmWorkflowData.ZQTasksWSTATUS.AsInteger := 0 ;
                         dmWorkflowData.ZQTasksDDATEACTION.AsDateTime := now ;
                         if dmWorkflowData.ZQGetStepWUSERID.AsInteger <> 0 then
                            dmWorkflowData.ZQTasksWUSERID.AsInteger := dmWorkflowData.ZQGetStepWUSERID.AsInteger  
                          else
                         dmWorkflowData.ZQTasksWSTATUS.AsInteger := -1 ;
                         dmWorkflowData.ZQTasks.post ;
                        end;
                        end ;
                          except
                            dmWorkflowData.ZQTasks.Cancel ;
                          end;
                  inc(recs);
                  dmWorkflowData.ZQTasks.Locate('WWORKFLOWWORKID',LastTaskId,[]);
                  dmWorkflowData.ZQTasks.Edit ;
                  dmWorkflowData.ZQTasksWLINKID.AsInteger := NewTaskId ;
                  dmWorkflowData.ZQTasks.Post ;
                  break ;
                end else
                begin
              AButton := TButton.Create(pView) ;
               with AButton do
                 begin
                    Tag :=  dmWorkflowData.ZQGetTransitionsWWORKFLOWTRANSID.AsInteger ;
                    Caption := dmWorkflowData.ZQGetTransitionsSTRANSNAME.AsString ;
                    OnClick:= ChoiceClick ;
                    Parent := pView ;
                    TextWidth := self.Canvas.TextWidth(Caption) ;
                    TextWidth :=TextWidth + 30 ;
                    Top := 20 ;
                    Left := x ;
                    Width := (TextWidth-10) ;
                    inc(x,TextWidth) ;
                    inc(recs);
                 end;
               end;
            end;
          dmWorkflowData.ZQGetTransitions.next ;
      end;
    if dmWorkflowData.ZQGetTransitions.IsEmpty then
      begin
        dmWorkflowData.ZQTasks.edit ;
        dmWorkflowData.ZQTasksWSTATUS.AsInteger := -1 ;
        dmWorkflowData.ZQTasks.post ;
      end;
    if  recs = 0 then
      begin
        self.close ;
      end;
    if (recs = 1) and (not IsSplitStep) then
       ChoiceClick(AButton);
    if IsSplitStep then
       begin
          FormShow(self);
       end;
end;

procedure TfmWorkflowExecuteStep.ChoiceClick(Sender: TObject);
begin
 if dmWorkflowData.ZQGetTransitions.Locate('WWORKFLOWTRANSID',Tcomponent(Sender).Tag,[]) then
   begin

     dmWorkflowData.ZQTasks.edit ;
     if  (dmWorkflowData.ZQGetTransitionsWTOWORKFLOWSTEPID.AsInteger <> 0) and (dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger <> dmWorkflowData.ZQGetTransitionsWTOWORKFLOWSTEPID.AsInteger) then
         begin
         dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger := dmWorkflowData.ZQGetTransitionsWTOWORKFLOWSTEPID.AsInteger ;
         dmWorkflowData.ZQGetStep.close ;
         dmWorkflowData.ZQGetStep.params[0].AsInteger := dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger ;
         dmWorkflowData.ZQGetStep.open ;
          dmWorkflowData.ZQTasksWSTATUS.AsInteger := 0 ;
         dmWorkflowData.ZQTasksDDATEACTION.AsDateTime := now ;
       //  dmWorkflowData.ZQTasksWLINKID.AsInteger := 0 ;
         if dmWorkflowData.ZQGetStepWUSERID.AsInteger <> 0 then
            dmWorkflowData.ZQTasksWUSERID.AsInteger := dmWorkflowData.ZQGetStepWUSERID.AsInteger ;
         end  else
         dmWorkflowData.ZQTasksWSTATUS.AsInteger := -1 ;
         dmWorkflowData.ZQTasks.post ;
   end;
   Formshow(nil);
end;

procedure TfmWorkflowExecuteStep.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := False ;
 bContinueClick(self);
end;

procedure TfmWorkflowExecuteStep.activateTimer(Sender: TObject);
begin
 Timer1.Enabled := True ;
end;

procedure TfmWorkflowExecuteStep.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if (aWorkFlowobj <> nil) and ( pView.tag <> 0) then
       begin
         Tform(pView.tag).ModalResult := mrNone ;
         aWorkFlowobj.WorkflowEnd( Tform(pView.tag));
         pView.tag :=0 ;
       end ;
end;

procedure TfmWorkflowExecuteStep.tShowScreenTimer(Sender: TObject);
var
 AForm : TForm ;
 i : Integer ;
 
   aIns : Integer ;
 ReturnName : Array [0..1024] of char ;
 APChar : PChar ;
 Amessage,Subparams : String ;
 aProgress :   TfmNewProgress ;
begin

tShowScreen.Enabled := False ;
aProgress :=   TfmNewProgress.Create(self) ;
try
aProgress.initProgress('loading...',3);
Application.ProcessMessages ;
  aWorkFlowobj := nil ;
    if dmWorkflowData.ZQTasksWSTATUS.AsInteger = -1 then
      close ;
  if dmWorkflowData.ZQTasksWSTATUS.AsInteger = 1 then
   begin
    dmWorkflowData.ZQGetStep.close ;
    dmWorkflowData.ZQGetStep.params[0].AsInteger := dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger ;
    dmWorkflowData.ZQGetStep.open ;
    if dmWorkflowData.ZQGetStep.IsEmpty then exit ;
    Memo1.Lines.Text := dmWorkflowData.ZQGetStepSREMARK.AsString ;
    ptop.Height := 105  ;
    if  Memo1.Lines.Count > 6 then
       ptop.Height := 105 +((Memo1.Lines.Count-6)* 14);
    if ptop.Height > 250 then ptop.Height := 250 ;   
    self.Caption := 'WORKFLOW ' + dmWorkflowData.ZQGetStepSSTEPNAME.AsString ;
    bContinueClick(nil);
    exit;
   end;


  for i := pView.ComponentCount -1 downto 0 do
    pView.Components[i].free ;

   if not dmWorkflowData.ZQTasks.IsEmpty then
      begin
       dmWorkflowData.ZQGetStep.close ;
       dmWorkflowData.ZQGetStep.params[0].AsInteger := dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger ;

       dmWorkflowData.ZQGetStep.open ;
       Memo1.Lines.Text := dmWorkflowData.ZQGetStepSREMARK.AsString ;
        ptop.Height := 105  ;
        if  Memo1.Lines.Count > 6 then
           ptop.Height := 105 +((Memo1.Lines.Count-6)* 14);
        if ptop.Height > 250 then ptop.Height := 250 ;
       self.Caption := 'WORKFLOW ' + dmWorkflowData.ZQGetStepSSTEPNAME.AsString ;
        if  dmWorkflowData.ZQGetStep.IsEmpty then
          begin
             self.close ;
             exit ;
          end;
        if not  dmWorkflowData.ZQGetStep.IsEmpty then
          begin
            params.Text := dmWorkflowData.ZQGetStepSPARAMS.AsString ;
            if  params.Values['TYPE'] <> '' then
                  aWorkFlowobj := WF_GetWorkflowImplentOnName(params.Values['TYPE']) ;
           if  aWorkFlowobj <> nil then
            begin
               params.Values['LASTID'] := dmWorkflowData.ZQTasksWLINKID.Asstring ;

               aWorkFlowobj.OnInternalProgress :=  activateTimer ;

               for i := 0 to  params.Count -1 do
                  begin
                    if aWorkFlowobj.Inparams.FindParam(params.Names[i]) <> nil then
                      aWorkFlowobj.Inparams.FindParam(params.Names[i]).Value := params.ValueFromIndex[i] ;
                  end;
               Subparams := '' ;
               if not dmWorkflowData.ZQTasksPARAMS.IsNull then
                  Subparams := dmWorkflowData.ZQTasksPARAMS.AsString ;
               if Subparams <> '' then
                 aWorkFlowobj.StringToParams(aWorkFlowobj.Inparams, Subparams,False);


               aWorkFlowobj.Parent := pView ;
               aWorkFlowobj.locWorkFlowDataset :=  dmWorkflowData.ZQTasks ;

                 Application.ProcessMessages ;

               BBack.Visible :=  not aWorkFlowobj.Inparams.ParamByName('HIDELASTBTN').AsBoolean ;
                aProgress.SetProgress('loading... ' + aWorkFlowobj.Displayname,2);
               if  aWorkFlowobj.Inparams.ParamByName('MSGPOPUP').AsBoolean then
                   OSFMessageDlg(Memo1.text,mtInformation,[mbok],0);
              AForm := aWorkFlowobj.WorkFlowStart ;
              if AForm.Parent = nil then
              begin
              AForm.Parent := pView ;
              AForm.BorderStyle := bsnone ;
              AForm.Align := alClient ;

              end ;
              pView.tag := Integer(AForm);
              AForm.Top := 0 ;
              AForm.Left := 0 ;
              AForm.Width := pView.Width - 1  ;
              AForm.Height := pView.Height -1 ;
              if not AForm.Visible then
              AForm.Show  ;
              aProgress.SetProgress('loading... ' + aWorkFlowobj.Displayname,3);
           end
      end;
   end;
   finally
     aProgress.free ;
   end;
end;

procedure TfmWorkflowExecuteStep.BwhereAmiClick(Sender: TObject);
var
 aLookonly : TfmWorkflow ;
begin
 if dmWorkflowData.ZQTaskListWWORKFLOWWORKID.AsInteger = 0 then exit ;
 aLookonly := TfmWorkflow.create(self) ;
 try
   aLookonly.WhereAmIStep := dmWorkflowData.ZQTaskListWWORKFLOWSTEPID.AsInteger ;
   aLookonly.WorkflowWorkId := dmWorkflowData.ZQTaskListWWORKFLOWWORKID.AsInteger ;
   aLookonly.ShowModal ;

 finally
  aLookonly.free ;
 end;
end;

procedure TfmWorkflowExecuteStep.BBackClick(Sender: TObject);
begin
     dmWorkflowData.ZQHist.close ;
     dmWorkflowData.ZQHist.Params[0].AsInteger := dmWorkflowData.ZQTasksWWORKFLOWWORKID.AsInteger ;
     dmWorkflowData.ZQHist.Open ;
     if not dmWorkflowData.ZQHist.IsEmpty then
        begin
         dmWorkflowData.ZQTasks.Edit ;
         dmWorkflowData.ZQTasksWUSERID.AsInteger := dmWorkflowData.ZQHistWUSERID.AsInteger ;
         dmWorkflowData.ZQTasksWSTATUS.AsInteger := dmWorkflowData.ZQHistWSTATUS.AsInteger ;
         dmWorkflowData.ZQTasksWWORKFLOWSTEPID.AsInteger := dmWorkflowData.ZQHistWWORKFLOWSTEPID.AsInteger ;
         dmWorkflowData.ZQTasksWLINKID.AsInteger := dmWorkflowData.ZQHistWLINKID.AsInteger ;
         dmWorkflowData.ZQTasks.Post ;
         dmWorkflowData.ZQHist.Delete ;
        end;
  tShowScreen.Enabled := True ;

end;

end.
