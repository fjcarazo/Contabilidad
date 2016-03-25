(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit LanguageChoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ComCtrls, Menus, ExtCtrls,consts,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxListView;
         
type
  TfmLangChoice = class(TForm)
    bOk: TBitBtn;
    bCancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    Customize1: TMenuItem;
    LVLanguage: TcxListView;

    //procedure DoTranslation;
    procedure bCancelClick(Sender: TObject);
    procedure bOkClick(Sender: TObject);
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupListBox1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TranslateForm(fm:TForm);
    procedure Customize1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurrentLanguage : integer;

  end;


var
  fmLangChoice: TfmLangChoice;
  
implementation

uses Database, Main, OpenASetOfBooks, DeleteASetOfBooks, Directory, HtmlHelpAPI,
  ChangeBooksProperties, Periods,



  DocSetup, Groups, PaymentType, Salesman,  StockInfo,
  BatchTypes, OpenLink, About,  

  BatchEntry, UpdateInvoice,  
    SelectBatchType, InvoiceEntryGrid,
  BatchOptions,   CreationCompWiz,
  CustomLang,GlobalFunctions, DataIntegrityCheck,
  ZipBackupRestore, ReconcileBank, 



   ExportTcData,
     SaveAs,

  TcVariables, PosEntry, PosPassword,   
  BatchPeriodTotals, BatchProcessMenu,  Support,
    CentralSearch, Calculator, ConfirmDocs,
    CheckUnpost,
   DosTextPrint, DosTextReports, ExportToSpreadSheet,
  ExchangeTCData, Progress, DataEntry, EvaluateExpressions, EnterLinkAmount,
  DatabaseAccess,  LotusWKx, IntroScreen, PosRoutines,
  OpenItemSelection,  Lookup, Read123,
  XRoutines, GetReportDate,  UMsgBox,
  WelcomHelp, TcashClasses, SetAbbreviations, PosCashup, PosReportOptions,
  EditReceipts,  PosInvoiceInfo, PosPayments,
  TAccountView,  SelectUser, PosSetup, Password,
  UDMTCCoreLink;

{$R *.DFM}

procedure TfmLangChoice.TranslateForm(fm:TForm);
Const
  T='&';
var _TableName : string;
    tmp : string;
  procedure ChangePrnLbls(aDestLbl,alblCopies:Tlabel;aBitSetPrint:TBitBtn);
  begin
    aBitSetPrint.Caption := GetTextLang(864);
    aDestLbl.Caption := GetTextLang(865);
    alblCopies.Caption := GetTextLang(866);
  end;
 
  Procedure OkCancel(aOk,aCancel:TBitBtn);
  begin
    aOk.Caption := GetTextLang(167);
    aCancel.Caption := GetTextLang(168);
  end;
begin
 

  if fm.Name = 'fmProgress' then with (fm as TfmProgress) do begin
    Caption := GetTextLang(1255); // Processing
    tcxTitle.Caption := GetTextLang(1256);//Please wait...
  end else

  if fm.Name = 'FrmBatchPeriodTotals' then with (fm as TFrmBatchPeriodTotals) do begin
    Caption := GetTextLang(1192); // BackOrders Outatanding

  end else


  if fm.Name = 'fmGetDateValue' then with (fm as TfmGetDateValue) do begin
    Caption := GetTextLang(1312); // Get Date Report Value
    Label1.Caption := GetTextLang(1037);// Date of Report :
    OkCancel(BtnOk,BtnCancel);
  end else
  if fm.Name = 'fmEditReceipts' then with (fm as TfmEditReceipts) do begin
    Caption := GetTextLang(1314); // Edit Receipts Options
    Label1.Caption := GetTextLang(34);// Account

    Label6.Caption := GetTextLang(946);// Amount
    OkCancel(BtnOk,BtnCancel);
    Label3.Caption := GetTextLang(238);// Date
    Label4.Caption := GetTextLang(1273);// Receipt Number
    Label5.Caption := GetTextLang(178);// Description
    
    cbxPrintOut.Caption := GetTextLang(1315);//Print out
    DestLbl.Caption := GetTextLang(865);//Send report To:
    BitBtn1.Caption := GetTextLang(864);////&Printer Setup
  end else



  if fm.Name = 'fmSelectBatchType' then with (fm as TfmSelectBatchType) do begin
   Caption := GetTextLang(241);// Accounts
   btnOpen.Caption := GetTextLang(163);// Cancel
   btnCancel.Caption := GetTextLang(168);// Open
  end else

  if CompareText(fm.Name,'fmZipBackupRestore')=0 then with (fm as TfmZipBackupRestore) do begin
   sbBackup.Caption := GetTextLang(891);// Bacckup
   SbRestore.Caption := GetTextLang(892);// Restore
   lvSetofBooks.Columns[0].Caption := GetTextLang(172);// Set Of Books
   lvSetofBooks.Columns[1].Caption :=GetTextLang(716);// Location
   BtnClose.Caption := GetTextLang(168);// Cancel
   BtnStop.Caption := GetTextLang(897);// Cancel
  end else




  if fm.Name = 'fmDataIntegrityCheck' then with (fm as TfmDataIntegrityCheck) do begin (* File | Delete A Set of Books *)
   Caption := GetTextLang(106);//a
   DataCheck1.Caption := GetTextLang(880);// Files Corruption
   DataCheck2.Caption := GetTextLang(881);// Balances per Period
   DataCheck3.Caption := GetTextLang(882);// Count Accounts and Stock items
   DataCheck4.Caption := GetTextLang(883);// Debtors and Creditors
   DataCheck5.Caption := GetTextLang(884);// Outstanding  batches and Documents
   DataCheck6.Caption := GetTextLang(885);// Unposted Documents
   
   btnClose.Caption := GetTextLang(169);//Close;
   LblT6.Caption := GetTextLang(886);//  Select Set of Books
   BtnCheck.Caption := GetTextLang(887); // Check
   
   
   BtnCancel.Caption := GetTextLang(168);//BtnCancel
   sbBrowse.Caption := GetTextLang(854);//sbBrowse
   lblLst.Caption := GetTextLang(1119);
  end else

  if fm.Name = 'fmDeleteASetOfBooks' then with (fm as TfmDeleteASetOfBooks) do begin (* File | Delete A Set of Books *)
   Caption := GetTextLang(172);//a
   btnDelete.Caption := GetTextLang(173);//a
   btnCancel.Caption := GetTextLang(168);//a
  end else



  if SameText('fmAbout',fm.Name) then with (fm as TfmAbout) do begin (* File | Create a set of Books -- CreationWiz*)
               Caption := GetTextLang(119);//Header 365
               OKbutton.Caption := GetTextLang(167);//OK 167
          end else


  if fm.Name = 'fmPaymentType' then with (fm as TfmPaymentType) do
          begin
               Caption := GetTextLang(346);//Header 346
               DBGrid1.columns[0].Title.Caption := GetTextLang(355);//Description 355
               sbAdd.Caption := GetTextLang(292);//add 292
               sbDelete.Caption := GetTextLang(293);//Delete 293
               btnClose.Caption := GetTextLang(169);//Close 169
          end else  


  if fm.Name = 'fmUpdateInvoice' then with (fm as TfmUpdateInvoice) do begin
              (* Input Documents Invoice Update Ledger or Credit Notes*)
               btnCancel.Caption := GetTextLang(828);//Close 828
               //
               Label3.Caption :=  GetTextLang(1068);
               cbPosted.Caption :=  GetTextLang(961);
               //
               Label4.Caption :=  GetTextLang(1012);
               // Documents
               PageControl1.Pages[0].Caption := GetTextLang(38);
               // Batches
               PageControl1.Pages[1].Caption := GetTextLang(1071);
               btSearch.Caption := GetTextLang(952);
               // From ... To
               RbRange.Caption := GetTextLang(1069);
               //Selected
               RbSelect.Caption := GetTextLang(1070);

          end else
 

 
          if   SameText(fm.Name ,'fmSaveAs') then with (fm as TfmSaveAs) do
         begin
           //Save As...
           Caption :=GetTextLang(19);
           //Directory
           Label2.Caption := GetTextLang(1107);
           //btnCancel
           btnCancel.Caption := GetTextLang(168);
           //btnSave
           btnSave.Caption := t + GetTextLang(726);
           //Name for new set of books
           label1.Caption := t + GetTextLang(175);
         end  ;
end;



procedure TfmLangChoice.bCancelClick(Sender: TObject);
begin
     fmLangChoice.Close;
end;

procedure TfmLangChoice.bOkClick(Sender: TObject);
var _sLanguageName, _sLanguageFile : string;

     ALanguage:TLanguageCollectionItem ;
begin
  if LVLanguage.Selected = nil then exit ;
  ALanguage:=TLanguageCollectionItem(LVLanguage.Selected.data);
  TheGlobalDataObject.Languages.SetActiveLanguage(ALanguage.Index);
  TheGlobalDataObject.FirstTime := false ;
  TheGlobalDataObject.Save ;
  WriteT3IniFile('Current Language','File',ALanguage.filename );
  WriteT3IniFile('Current Language','Name',ALanguage.Name);
  ModalResult := mrok ;

end;

procedure TfmLangChoice.DBLookupListBox1Click(Sender: TObject);
begin
     bOk.Enabled := true;
end;

procedure TfmLangChoice.FormShow(Sender: TObject);
var
  i : Integer ;
  AItem , aSelected : TListItem ;
begin
 DMTCCoreLink.LoadImage(bOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(bCancel.Glyph,'Cancel');



  aSelected := nil ;
  LVLanguage.Items.Clear;
  for i := TheGlobalDataObject.Languages.Count -1 downto 0 do
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + 'Bin\Languages\' + TheGlobalDataObject.Languages[i].filename+'.dfm' ) then
       begin
          AItem :=  LVLanguage.Items.Add ;
           with AItem do
             begin
                Caption := TheGlobalDataObject.Languages[i].Name ;
                Data := TheGlobalDataObject.Languages[i] ;
                if TheGlobalDataObject.Languages[i].Active then
                  begin
                   aSelected :=  AItem ;
                  end;
             end;
       end else
        TheGlobalDataObject.Languages.Delete(i);
    end;

    if aSelected <> nil then
      begin
       aSelected.Selected := true ;
       aSelected.MakeVisible(false);
      end;
 //   no translations in select language
 //   Caption := GetTextLang(171);
 //   Bok.Caption :=  GetTextLang(167);
 //   bCancel.Caption := GetTextLang(168);
 //   Customize1.Caption := GetTextLang(2103);
end;

procedure TfmLangChoice.DBLookupListBox1DblClick(Sender: TObject);
begin
     bOkClick(fmLangChoice);
end;

procedure TfmLangChoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(233);
             key := 0;

        end;
end;

procedure TfmLangChoice.Customize1Click(Sender: TObject);
begin
  fmCustomLang := TfmCustomLang.Create(self);
  try
   SetUpForm(fmCustomLang);
   fmCustomLang.ShowModal;
  finally
   FreeAndNil(fmCustomLang);
  end;
  FormShow(Sender);
end;



end.
