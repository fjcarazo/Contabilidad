(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit EditReceipts;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, StdCtrls, Buttons, ExtCtrls, Mask,
     ImgList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfmEditReceipts = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    LeftPnl: TPanel;
    Panel4: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    edtCount: TEdit;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edtAccountCode: TEdit;
    lblAccountDesc: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDescription: TEdit;
    Label6: TLabel;
    EdtAmount: TEdit;
    lpaymentmethode: TLabel;
    cbxPymtMethod: TComboBox;
    lblReceiptNo: TLabel;
    cbxPrintOut: TCheckBox;
    cbB5Paper: TCheckBox;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    dtpDate: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure edtAccountCodeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    BShow : Boolean ;
  public

    { Public declarations }
  end;

var
  fmEditReceipts: TfmEditReceipts;
  HideWAccountID,
  HideWAccountTypeID:Integer;

implementation

uses LanguageChoice, Main, Database, GlobalFunctions,  TcVariables,
  DatabaseAccess,XRoutines, UDMTCCoreLink, osfLookup, PaymentType,
  OSFGeneralRoutines, NewProgress, UDMReportsGlobals, UReportManager;

{$R *.DFM}

procedure TfmEditReceipts.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Printer');
 edtAccountCode.Clear ;
 lblAccountDesc.Caption :='' ;
   BShow:= True;

   cbxPymtMethod.items.Clear;
   cbxPymtMethod.items.add(GetTextLang(792));
   cbxPymtMethod.items.add(GetTextLang(793));
   cbxPymtMethod.items.add(GetTextLang(823));
   cbxPymtMethod.items.add(GetTextLang(794));

   cbxPymtMethod.itemIndex:=0;

   lpaymentmethode.Caption:= DMTCCoreLink.GetTextLang(1275) ;


   lblAccountDesc.Caption:='';
   dtpDate.Date:=date;
   lblReceiptNo.Caption:='';
   edtDescription.Text:='';
   EdtAmount.text:= formatfloat('00.00',0);
   dmDatabase.tblUser.Open;
  if ReadReportOp('BUseGeneralNumber','false').Asboolean then
         dmDatabase.tblUser.Locate('WUserID',DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0), [])
         else
     dmDatabase.tblUser.Locate('WUserID', CurrentUser, []) ;
  // dmDatabase.tblUser.Locate('WUserID', CurrentUser, []);
   lblReceiptNo.Caption := dmDatabase.tblUserSReceiptNextNumber.Value;
   if trim(lblReceiptNo.Caption) = '' then
      lblReceiptNo.Caption := 'R0000001' ;
   dmDatabase.tblUser.Close;
   LoadPrintOutModes(cbDestination);
   cbB5Paper.Caption := gettextlang(2144);
   lblCopies.Caption := gettextlang(732);
   BtnOk.Caption := gettextlang(167);
   BtnCancel.Caption := gettextlang(168);
  
end;

procedure TfmEditReceipts.edtAccountCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
 // done : Pieter Give '.' as decimal sep for dutch people :-)  but not for all fields.   if key = '.' then
    if sender = edtAmount then
      if key = '.' then
    key :=  DecimalSeparator ;
    
  case Key of
  #13:begin
        SelectNext(ActiveControl,True,true);
        Key:=#0;
      end;
  end;
end;

procedure TfmEditReceipts.BtnOkClick(Sender: TObject);
Var
  TmpVal:Real;
  aProgress : TfmNewProgress ;
  ParamString : String ;
begin


  tmpVal:=Str2Float(edtAmount.text);
   if tmpVal<=0 then
     Raise Exception.Create('No amount entered!');

   if TDataBaseRoutines.GetAccountIdFromCodeAndType( edtAccountCode.Text,1) = 0 then
      Raise Exception.Create('No account entered!');
  aProgress := TfmNewProgress.Create(Application) ;
  try
  aProgress.initProgress('...',2);
  aProgress.SetProgress('',1);
  BShow:= False;

  with dmDatabase do begin
    if tmpVal>=0 then begin
     if cbxPrintOut.checked then begin
        ParamString := 'currentuser=' + IntToStr(DMTCCoreLink.currentuser) + #13 +#10 +
    'datefl=' + FloatToStr(dtpDate.Date) + #13 +#10 +
    'accountid=' + IntToStr(edtAccountCode.Tag) + #13 +#10 +
    'amountfl='+ TDatabaseTableRoutines.GetFirebirdsSqlForFloat(tmpVal) + #13 +#10 +
    'description=' +  edtDescription.Text + #13 +#10 +
    'paymethode=' +  cbxPymtMethod.Text + #13 +#10 +
    'linenr=' + lblReceiptNo.Caption   ;

       ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\documents\receipt.rep',ParamString )
     end;
     aProgress.initProgress('...',2);

     tblSysVars.Close;
     tblAccount.CLose;
     tblUser.Open;
      if ReadReportOp('BUseGeneralNumber','false').Asboolean then
         tblUser.Locate('WUserID',DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),DMTCCoreLink.currentuser,0), [])
         else
     tblUser.Locate('WUserID', CurrentUser, []);


     tblUser.Edit;
     tblUserSReceiptNextNumber.Value:=_IncrementString(lblReceiptNo.Caption);
     tblUser.Post;
     tblUser.Close;
     // Generate Entry in Batch
     tblBatch.Append;
     tblBatchSreference.Value := lblReceiptNo.Caption;
     tblBatchDDate.Value := dtpDate.Date;
     tblBatchDAllocatedDate.Value := dtpDate.Date;
     tblBatchSDescription.Value :=lblReceiptNo.Caption +' '+ edtDescription.text  ;
     tblBatchSACCOUNT.Value := edtAccountCode.Text;
     tblBatchWACCOUNTID.AsInteger :=  TDataBaseRoutines.GetAccountIdFromCodeAndType( edtAccountCode.Text,1) ;
     tblBatchBExclusive.Value := 1 ;
     tblBatchFAmount.Value := -tmpVal ;
     tblBatchFCREDIT.Value := tmpVal;
     tblBatch.Post;
     //
    end;
  end;
  edtAccountCode.SetFocus;
  ModalResult := mrOk ;
  finally
    aProgress.free ;
  end;
end;

procedure TfmEditReceipts.BitBtn1Click(Sender: TObject);

begin
  fmMain.SetupPrinterClick(self);
end;

procedure TfmEditReceipts.BitBtn2Click(Sender: TObject);
begin
  if not BShow then exit;
  HideWAccountID:= -1;
  HideWAccountTypeID:= -1;
 
     osflookup.OSFGetLookupValue(ReturnLookup,ReturnID,'Find account','ER',osflookup.tcstDEB,osflookup.tcltAccount,edtAccountCode.Tag,0);

   // ReturnLookup:=CallLookup(edtAccountCode.Text, 10);
   if ReturnLookup <> 'ESC' then
   begin
     edtAccountCode.Text := ReturnLookup ;
     edtAccountCode.Tag   :=  ReturnID ;
    lblAccountDesc.Caption:= TDataBaseRoutines.GetAccountDescription(ReturnID);

    HideWAccountID:= ReturnID;
    HideWAccountTypeID:=  TDataBaseRoutines.GetAccountType(ReturnID);
   // dmDatabase.tblAccount.Close;
    SelectNext(ActiveControl,True,true);
   end;
end;

end.
