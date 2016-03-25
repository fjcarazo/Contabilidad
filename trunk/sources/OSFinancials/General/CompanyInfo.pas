(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CompanyInfo;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, ComCtrls,
    Menus , UOSFVisuals, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxImage,
  cxDBEdit, cxTextEdit;

type
  TfmCompanyInfo = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    PageControl1: TPageControl;
    tabAddress: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    TabOptions: TTabSheet;
    Label4: TLabel;
    Label7: TLabel;
    comboxTaxType: TComboBox;
    edtDueAccount: TEdit;
    Button1: TButton;
    Label13: TLabel;
    PopupMenu1: TPopupMenu;
    LoadFromFile1x: TMenuItem;
    Clear1x: TMenuItem;
    CbCompLogo: TCheckBox;
    Paste1x: TMenuItem;
    DBEdit11: TDBEdit;
    LBankname1: TLabel;
    DBEdit12: TDBEdit;
    LBankNumber1: TLabel;
    LBankname2: TLabel;
    DBEdit14: TDBEdit;
    DBEdit13: TDBEdit;
    LBankNumber2: TLabel;
    DBImage1: TcxDBImage;
    Shape1: TShape;
    Shape2: TShape;
    DBEdit15: TDBEdit;
    Label14: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    DBEdit17: TDBEdit;
    Label16: TLabel;
    DBEdit18: TDBEdit;
    Label17: TLabel;
    LHoldername1: TLabel;
    LHoldername2: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    PFreefield: TPanel;
    cbDefaultOutPut: TComboBox;
    Label12: TLabel;
    Bsetdata: TBitBtn;
    ELocalpath: TEdit;
    EPluginspath: TEdit;
    EIniPath: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Clear: TButton;
    cbDebugsql: TCheckBox;
    ActionList1: TActionList;
    Clear1: TAction;
    LoadFromFile1: TAction;
    Paste1: TAction;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    cxDBTextEdit1: TcxDBTextEdit;
    DBEdit22: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure comboxTaxTypeChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDueAccountEnter(Sender: TObject);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure Clear1Click(Sender: TObject);
    procedure LoadFromFile1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BsetdataClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
  private


    AEditForm : TEditPanel ;

    { Private declarations }
    Procedure LoadReoprtOp;
    Procedure SaveReoprtOp;
  public
    { Public declarations }
  end;

var
  fmCompanyInfo: TfmCompanyInfo;

implementation

Uses
  Database, Main, GlobalFunctions, HtmlHelpAPI, LanguageChoice, TcVariables,
  DatabaseAccess,LedgerRoutines,XRoutines, DB, UDMTCCoreLink,
  OSFGeneralRoutines,ShellApi;
 // DatabaseAccess;

{$R *.DFM}


procedure TfmCompanyInfo.FormShow(Sender: TObject);
begin

   cbDebugsql.Checked := TDatabaseRegistyRoutines.ReadAppRegValue('ini\'+ 'INFO','DEBUGSQL') = '1' ;

   DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
   DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
   //Header 320
   Caption := GetTextLang(320);
   // Company Info
   Label1.Caption := GetTextLang(313);
   // Address
   Label2.Caption := GetTextLang(186);
   tabAddress.Caption:=Label2.Caption;
   //  Tax Reg
   Label9.Caption := GetTextLang(317);
   //  Comp Reg
   Label8.Caption := GetTextLang(316);
   // Fax No
   Label6.Caption := GetTextLang(189);
   // Tel No
   Label5.Caption := GetTextLang(312);
   // E-Mail
   Label10.Caption := GetTextLang(191);
   //  Post -Code
   Label3.Caption := GetTextLang(190);
   //Tax Meth
   Label4.Caption := GetTextLang(314);
   // Due account
   Label7.Caption := GetTextLang(315);
   // Click here to set the Windows date / currency format
   Button1.Caption := GetTextLang(319);
 
   //Default Output
   Label12.Caption := GetTextLang(1009);
   //Company Logo
   Label13.Caption := GetTextLang(1010);
   //Use Picture logo on Reports
   CbCompLogo.Caption := GetTextLang(1010);
   //BtnCancel
   BtnCancel.Caption := GetTextLang(168);
   //Ok
   BtnOk.Caption := GetTextLang(167);
   // Options
   TabOptions.Caption := GetTextLang(1012);

   Paste1.Caption :=GetTextLang(1015);
   LoadFromFile1.Caption :=GetTextLang(1014);
   Clear1.Caption :=GetTextLang(1016);

  comboxTaxType.Items[0] := GetTextLang(1110);
  comboxTaxType.Items[1] := GetTextLang(1111);
  LBankname1.Caption :=GetTextLang(3026) +'  1';
  LBankname2.Caption :=GetTextLang(3026) +'  2';

  LBankNumber1.Caption :=GetTextLang(2211) +'  1';
  LBankNumber2.Caption :=GetTextLang(2211) +'  2';

  LHoldername1.Caption :=GetTextLang(1354) +'  1';
  LHoldername2.Caption :=GetTextLang(1354) +'  2';


  PageControl1.ActivePageIndex:=0;

  LoadReoprtOp;
  LoadPrintOutModes(cbDefaultOutPut);
  dmDatabase.tblSysVars.Open;



  cbDefaultOutPut.ItemIndex := DMTCCoreLink.ReadSysParam('WDEFAULTOUTPUTID',StrToIntDef(DMTCCoreLink.ReadSysVar('WDEFAULTOUTPUTID'),0),CurrentUser) ;
   
  if dmDatabase.tblSysVarsBPaymentsBased.Value =1 then
  begin
    comboxTaxType.ItemIndex:=1;
    Enable(edtDueAccount);
    edtDueAccount.Text:='';
    dmDatabase.tblAccount.Open;
    if dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblSysVarsWDueAccountID.Value, []) then
      edtDueAccount.Text := dmDatabase.tblAccountSMAINACCOUNTCODE.AsString +'-'+ dmDatabase.tblAccountSSUBACCOUNTCODE.AsString;
    dmDatabase.tblAccount.Close;
  end
  else
  begin
    comboxTaxType.ItemIndex:=0;
    Disable(edtDueAccount);
  end;
  DBEdit1.SetFocus;
   BtnCancel.Caption := GetTextLang(169) ;

   AEditForm.EditFormCollection.Load(1);

  ELocalpath.Text := TDatabaseRegistyRoutines.ReadAppRegValue('','OWNBASEDIR') ;
  EPluginspath.Text :=DMTCCoreLink.GetLocalPluginDir ; ;
  EIniPath.Text := DMTCCoreLink.GetLocalBaseDir ;

  try

   DBImage1.DataBinding.DataSource :=  dmDatabase.dsSysVars ;

  except

  end;
end;

procedure TfmCompanyInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblSysVars.Close;
 // dmdatabase.tblOpReport.Close;
end;

procedure TfmCompanyInfo.btnOkClick(Sender: TObject);
begin
 TDatabaseRegistyRoutines.WriteAppRegValue('ini\'+ 'INFO','DEBUGSQL',IntToStr(ord(cbDebugsql.Checked) ))  ;
 dmDatabase.UniSQLMonitor1.Active := cbDebugsql.Checked ;
 // dmDatabase.ZSQLMonitor1.Active := cbDebugsql.Checked ;
  SaveReoprtOp;
  AEditForm.EditFormCollection.Save(1);
  dmDatabase.tblSysVars.Edit;
  SaveOutput := cbDefaultOutPut.ItemIndex;
  DMTCCoreLink.WriteSysParam('WDEFAULTOUTPUTID',IntToStr(SaveOutput),CurrentUser) ;
  dmDatabase.tblSysVarsWDefaultOutPutID.Value := cbDefaultOutPut.ItemIndex;
 
  DefZoom := dmDatabase.tblSysVarsWDefaultZoom.Value;
  if (comboxTaxType.Text = GetTextLang(1111){'Payments Based'}) and (edtDueAccount.Text <> '') then
  begin
   // done : Pieter I gess this is what you want right.
   // edtDueAccount.Text:=Copy(edtDueAccount.Text,2,MainAccountLength + 4);
    dmDatabase.tblSysVarsBPaymentsBased.Value := 1;
    dmDatabase.tblAccount.Open;
    if not dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(edtDueAccount.Text) + GetSubAccountCode(edtDueAccount.Text)]), []) then
      Raise Exception.Create(DMTCCoreLink.GetTextLang( 3064{Not a valid account}));
    dmDatabase.tblSysVarsWDueAccountID.Value := dmDatabase.tblAccountWAccountID.Value;
    dmDatabase.tblAccount.Close;
  end
  else
  begin
    dmDatabase.tblSysVarsBPaymentsBased.Value := 0;
    dmDatabase.tblSysVarsWDueAccountID.AsString := '';
  end;
  dmDatabase.tblSysVars.Post;
  BPaymentsBased := dmDatabase.tblSysVarsBPaymentsBased.Value=1;

  Close;
end;

procedure TfmCompanyInfo.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCompanyInfo.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    if OSFMessageDlg(GetTextLang(445){Do you want to save these changes ?}, mtconfirmation, [mbyes,mbno], 0) = mryes then
      btnOkClick(Sender)
    else
      btnCancelClick(Sender);
    Key := #0;
  end;
end;

procedure TfmCompanyInfo.comboxTaxTypeChange(Sender: TObject);
begin
  if comboxTaxType.Text = GetTextLang(1110) then
  begin
    Disable(edtDueAccount);
    edtDueAccount.Text := '';
    BPaymentsBased := False;
  end
  else
  begin
    if OSFMessageDlg(GetTextLang(821){'The Payments based method of tax treats tax purely on a cash basis. Tax is payable to the revenue authorities only when it is received from the customer. Do you want to continue ?'},
         mtInformation, [mbYes,mbNo], 0) = mrYes then
    if OSFMessageDlg(GetTextLang(820){'Running on the payment basis requires that all debtors and creditors be converted to open item account. Do you want to continue ?'},
         mtInformation, [mbYes,mbOk], 0)= mrYes then
    begin
      Enable(edtDueAccount);
      BPaymentsBased := True;
    end
    else
       comboxTaxType.ItemIndex:=0
    else
       comboxTaxType.ItemIndex:=0;
  end;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCompanyInfo.Button1Click(Sender: TObject);
var
  Exec, Windir : array[0..255] of Ansichar;
begin
  // done : pieter no need to get windows dir its in the search path
  getwindowsdirectoryA(Windir, 255);
  //StrPCopy(Exec, StrPas(Windir) + '\Control.exe Intl.cpl');
  Exec :=  'Control.exe Intl.cpl' ;
 // StrPCopy(Exec, StrPas(Windir) + '\Control.exe Intl.cpl');
  WinExec(Exec, 1);
end;

procedure TfmCompanyInfo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  Var
     Result : Integer;

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(226);
             key := 0;

        end;
end;

procedure TfmCompanyInfo.edtDueAccountEnter(Sender: TObject);
var
  OldValue : String;
begin
  Highlight(edtDueAccount);
  OldValue := edtDueAccount.Text;
//  CallLookup(edtDueAccount.Text, 2);
  CallLookup(edtDueAccount.Text, 13);
  dmDatabase.tblAccount.Open;
  dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(ReturnLookup) + GetSubAccountCode(ReturnLookup)]), []);
  if dmDatabase.tblAccountBSubAccounts.Value =1 then
  begin
    OSFMessageDlg(GetTextLang(638){'You cant select this account, because it contains sub-accounts.'}, mterror, [mbok], 0);
    edtDueAccount.Text := OldValue;
  end
  else
    edtDueAccount.Text := dmDatabase.tblAccountSMAINACCOUNTCODE.AsString + '-' + dmDatabase.tblAccountSSUBACCOUNTCODE.AsString;
  dmDatabase.tblAccount.Close;
  BackNormal(edtDueAccount);
  SelectNext(ActiveControl, True, True);
end;

procedure TfmCompanyInfo.DBEdit9KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    PageControl1.ActivePageIndex:=1;
    Key := #0;
  end
  else
    DBEdit1KeyPress(Sender,Key);
end;

procedure TfmCompanyInfo.Clear1Click(Sender: TObject);
begin
  DmDatabase.tblSysVars.Edit;
  DmDatabase.tblSysVarsBlobLogo.Clear;
  DmDatabase.tblSysVars.Post;
end;

procedure TfmCompanyInfo.LoadFromFile1Click(Sender: TObject);
Var
  tmp:TImage;
  tmpBmp : TbitMap;
  aStream : TmemoryStream  ;
begin
  if fmMain.OpenPictureDialog.Execute then
  begin
    DmDatabase.tblSysVars.Edit ;
    if FileExists(fmMain.OpenPictureDialog.FileName) then
     begin
     tmp:=TImage.Create(nil);
      tmpBmp := TbitMap.Create;
       try
          tmp.Picture.LoadFromFile(fmMain.OpenPictureDialog.FileName);
          tmpBmp.Width := tmp.Picture.Width;
          tmpBmp.Height := tmp.Picture.Height;
          tmpBmp.Canvas.StretchDraw(Rect(0,0,tmp.Picture.Width,tmp.Picture.Height),tmp.Picture.Graphic);
           aStream := TmemoryStream.Create  ;
           try
           tmpBmp.SaveToStream(aStream);
           aStream.Position :=0  ;
          DmDatabase.tblSysVarsBlobLogo.LoadFromStream(aStream);
          finally
            aStream.Free ;
          end;
         // DmDatabase.tblSysVars.Post;
       finally
        tmp.Free;
        tmpBmp.Free;
       end;

     end;
     DmDatabase.tblSysVars.Post ;
  end;

end;


Procedure TfmCompanyInfo.LoadReoprtOp;
begin
  CbCompLogo.Checked := ReadReportOp('BUseCompPicLogo',False).AsBoolean;
end;


Procedure TfmCompanyInfo.SaveReoprtOp;
begin
  WriteReportOp('BUseCompPicLogo',Bool2Str(CbCompLogo.Checked));
end;

procedure TfmCompanyInfo.Paste1Click(Sender: TObject);
begin
  try
//    DmDatabase.tblSysVars.Edit;
    DBImage1.PasteFromClipboard;
//    DmDatabase.tblSysVars.Post;
  except
  end;
end;

procedure TfmCompanyInfo.FormCreate(Sender: TObject);

begin
 AEditForm := TEditPanel.Create(self) ;
 AEditForm.Parent := PFreefield ;
 AEditForm.Align := alClient ;
 AEditForm.SetEditType('SYSVARS','');
 AEditForm.ScaleBy(screen.PixelsPerInch,96);
 if DMTCCoreLink.SimpleMode = 1 then
     begin
        Label4.Visible := false ;
        comboxTaxType.Visible := false ;
        Label7.Visible := false ;
        edtDueAccount.Visible := false ;
        cbDebugsql.Visible := false ;
        Label18.Visible := false ;
        ELocalpath.Visible := false ;
        Label19.Visible := false ;
        EPluginspath.Visible := false ;
        Label20.Visible := false ;
        EIniPath.Visible := false ;
        Bsetdata.Visible := false ;
       Button2.Visible := false ;
     end else
      if DMTCCoreLink.SimpleMode = 2 then
     begin
        Label4.Visible := false ;
        comboxTaxType.Visible := false ;
        Label7.Visible := false ;
        edtDueAccount.Visible := false ;
        cbDebugsql.Visible := false ;
        Label18.Visible := false ;
        ELocalpath.Visible := false ;
        Label19.Visible := false ;
        EPluginspath.Visible := false ;
        Label20.Visible := false ;
        EIniPath.Visible := false ;
        Bsetdata.Visible := false ;
        Button2.Visible := false ;
     end;

end;



function CopyDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;


procedure TfmCompanyInfo.BsetdataClick(Sender: TObject);
begin
 if OSFMessageDlg('Continue ?'#13#10' Warning this setting is per computer per user!.'#13#10' This can have a great effect on the use of the program.'#13#10' please make sure you use this setting on expert notice only!',mtConfirmation,[mbyes,mbno],0) = mrno then exit;


if ELocalpath.Text <> TDatabaseRegistyRoutines.ReadAppRegValue('','OWNBASEDIR') then
   begin
      ForceDirectories(ELocalpath.Text) ;
      if DirectoryExists(ELocalpath.Text) then
         TDatabaseRegistyRoutines.WriteAppRegValue('','OWNBASEDIR',ELocalpath.Text) ;
   end;


if EPluginspath.Text <> DMTCCoreLink.GetLocalPluginDir then
   begin
      ForceDirectories(EPluginspath.Text) ;
      if DirectoryExists(EPluginspath.Text) then
         TDatabaseRegistyRoutines.WriteAppRegValue('','OWNPLUGINDIR',EPluginspath.Text) ;
      if not DirectoryExists(IncludeTrailingBackslash(EPluginspath.Text)+'reports') then
        begin
         ForceDirectories(IncludeTrailingBackslash(EPluginspath.Text)+'reports') ;
         CopyDir(ExtractFilePath(Application.ExeName)+'plug_ins\reports',IncludeTrailingBackslash(EPluginspath.Text)) ;
        end;
   end;


if EIniPath.Text <> DMTCCoreLink.GetLocalBaseDir then
   begin
      ForceDirectories(EIniPath.Text) ;
      if DirectoryExists(EIniPath.Text) then
         TDatabaseRegistyRoutines.WriteAppRegValue('','OWNOSFDIR',EIniPath.Text) ;
      ForceDirectories(IncludeTrailingBackslash( EIniPath.Text) +'bin') ;
   end;





end;

procedure TfmCompanyInfo.ClearClick(Sender: TObject);
begin
TDatabaseRegistyRoutines.WriteAppRegValue('','OWNOSFDIR','') ;
TDatabaseRegistyRoutines.WriteAppRegValue('','OWNPLUGINDIR','') ;
TDatabaseRegistyRoutines.WriteAppRegValue('','OWNBASEDIR','')   ;
  ELocalpath.Text := TDatabaseRegistyRoutines.ReadAppRegValue('','OWNBASEDIR') ;
  EPluginspath.Text :=DMTCCoreLink.GetLocalPluginDir ; ;
  EIniPath.Text := DMTCCoreLink.GetLocalBaseDir ;
end;

end.
