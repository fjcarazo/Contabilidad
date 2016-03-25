(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit BatchProcessMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TfmBatchProcessMenu = class(TForm)
    ButtonPanel: TPanel;
    lstboxMenu: TListBox;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lstboxMenuKeyPress(Sender: TObject; var Key: Char);
    procedure lstboxMenuEnter(Sender: TObject);
  private
    FReturn: String;
    procedure SetReturn(const Value: String);
    { Private declarations }
  public
    Look            : String;
    PayRollPluginLoaded  : Boolean ;
    function ShowMenu(MenuType : String) : String;
    property Return : String  read FReturn write SetReturn;
    { Public declarations }
  end;

  function fmBatchProcessMenu: TfmBatchProcessMenu;



implementation

uses Main, BatchEntry,BatchPeriodTotals, SelectBatchType, LanguageChoice,
  GlobalFunctions, TcVariables, DatabaseAccess, BatchEntryBank,
  UDMTCCoreLink;

{$R *.DFM}
var
  afmBatchProcessMenu: TfmBatchProcessMenu;
  
function fmBatchProcessMenu: TfmBatchProcessMenu;
begin
   if not assigned(afmBatchProcessMenu) then
   afmBatchProcessMenu:= TfmBatchProcessMenu.Create(Application);
   result := afmBatchProcessMenu ;
end;


function TfmBatchProcessMenu.ShowMenu(MenuType : String) : String;
begin
 // done : Pieter else if you close the action is still executed
 if  fmBatchProcessMenu.ShowModal = mrok then
   result := Return else
   result := '' ;
end;

procedure TfmBatchProcessMenu.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

  Caption:=GetTextLang(620);
  if IsRepeatingBat then
  begin
   lstboxMenu.Items.Clear;
   lstboxMenu.Items.Add(GetTextLang(613));//Erase Batch
   lstboxMenu.Items.Add(GetTextLang(615));//List Batch
   lstboxMenu.Items.Add(GetTextLang(619));//Write Delimited File
   lstboxMenu.Items.Add(GetTextLang(612));//Delimited File Import
   lstboxMenu.Items.Add(GetTextLang(3049){'Import a posted batch'});
//   lstboxMenu.Items.Add('Delimited File Import');
  end
  else
  begin
   lstboxMenu.Items.Clear;
   lstboxMenu.Items.Add(GetTextLang(610)); //Abbreviation Definition
   lstboxMenu.Items.Add(GetTextLang(611));//Balance Batch
   lstboxMenu.Items.Add(GetTextLang(612));//Delimited File Import
   lstboxMenu.Items.Add(GetTextLang(613));//Erase Batch
   if ReadReportOp('CBViewAllBankState',false).AsBoolean then
   begin
     Case IsCashBook of
      1: lstboxMenu.Items.Add(GetTextLang(790));//Creditor balances at date
      2: lstboxMenu.Items.Add(GetTextLang(791));//Create Receipts
     else
       lstboxMenu.Items.Add(GetTextLang(614))//Generate Multiple Entries
     end;
   end
   else
   begin
     Case IsCashBook of
      1,2: lstboxMenu.Items.Add(GetTextLang(791));//Create Receipts
     else
       lstboxMenu.Items.Add(GetTextLang(614))//Generate Multiple Entries
     end;
   end;
   lstboxMenu.Items.Add(GetTextLang(615));//List Batch
   lstboxMenu.Items.Add(GetTextLang(616));//Post Batch
   lstboxMenu.Items.Add(GetTextLang(617)); //Repetitive Transactions
   lstboxMenu.Items.Add(GetTextLang(1756)); //Change Alias
   lstboxMenu.Items.Add(GetTextLang(618)); //Totals for each Period
   lstboxMenu.Items.Add(GetTextLang(619));//Write Delimited File
   lstboxMenu.Items.Add(GetTextLang(1757)); //Revserse Batch
   lstboxMenu.Items.Add(GetTextLang(1758)); //Posted Batches Import
   lstboxMenu.Items.Add(GetTextLang(2212)); //'Pay Creditors'
   lstboxMenu.Items.Add(GetTextLang(2896)); //'Recieve Debtors'
   lstboxMenu.Items.Add(GetTextLang(3049){'Import a posted batch'});
  end;
  if fmBatchEntry <> nil then
   if PayRollPluginLoaded then
     lstboxMenu.Items.Add(GetTextLang(3356) {'Payroll import'});

  BtnOk.Caption:=GetTextLang(167);// Ok
  BtnCancel.Caption:=GetTextLang(168);// Cancel

  lstboxMenu.SetFocus;
end;

procedure TfmBatchProcessMenu.btnOkClick(Sender: TObject);
begin
  if  IsRepeatingBat then
  begin
    if lstboxMenu.Selected[0] = True then
    begin
       if DatabaseAccess.OSFMessageDlg(GetTextLang(621),mtWarning,[MbYes,MbNo],0)=MrYes then
      Begin
        Return := 'RpbtErase';
        ModalResult := mrok ;
      end;
    end else
    if lstboxMenu.Selected[1] = True then
    begin
      Return := 'Print';

      ModalResult := mrok ;
    end else
    if lstboxMenu.Selected[3] = True then
    begin
 if  fmBatchEntry <> nil then
      begin
      fmBatchEntry.ImportDialog.FileName := '';
     // fmBatchEntry.ImportDialog.InitialDir:=ExtractFilePath(Application.ExeName);
      fmBatchEntry.ImportDialog.Execute;
      if fmBatchEntry.ImportDialog.FileName = '' then
        fmBatchEntry.ImportDialog.FileName := 'nothing';
      end else
     if  fmBatchEntryBank <> nil then
      begin
      fmBatchEntryBank.ImportDialog.FileName := '';
   //   fmBatchEntryBank.ImportDialog.InitialDir:=ExtractFilePath(Application.ExeName);
      fmBatchEntryBank.ImportDialog.Execute;
      if fmBatchEntryBank.ImportDialog.FileName = '' then
        fmBatchEntryBank.ImportDialog.FileName := 'nothing';
      end;

      Return := 'Import';
      ModalResult := mrok ;
    end else
    if lstboxMenu.Selected[2] = True then
    begin
     if  fmBatchEntry <> nil then
      begin
      fmBatchEntry.ExportDialog.FileName := '';
      fmBatchEntry.ExportDialog.Execute;
      if fmBatchEntry.ExportDialog.FileName = '' then
        fmBatchEntry.ExportDialog.FileName := 'nothing';
      end else
      if  fmBatchEntryBank <> nil then
      begin
      fmBatchEntryBank.ExportDialog.FileName := '';
      fmBatchEntryBank.ExportDialog.Execute;
      if fmBatchEntryBank.ExportDialog.FileName = '' then
        fmBatchEntryBank.ExportDialog.FileName := 'nothing';
      end;
      Return := 'Export';
      ModalResult := mrok ;
    end
      else if lstboxMenu.Selected[4] = True then
    begin
      Return:='ImportPostBatch';
      ModalResult := mrok ;
    end

  end
  else
  begin
    if lstboxMenu.Selected[0] = True then
    begin
      Return := 'Abbrieve';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[1] = True then
    begin
      Return := 'Balance';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[2] = True then
    begin
     if  fmBatchEntry <> nil then
      begin
      fmBatchEntry.ImportDialog.FileName := '';
     // fmBatchEntry.ImportDialog.InitialDir:=ExtractFilePath(Application.ExeName);
      fmBatchEntry.ImportDialog.Execute;
      if fmBatchEntry.ImportDialog.FileName = '' then
        fmBatchEntry.ImportDialog.FileName := 'nothing';
      end else
     if  fmBatchEntryBank <> nil then
      begin
      fmBatchEntryBank.ImportDialog.FileName := '';
   //   fmBatchEntryBank.ImportDialog.InitialDir:=ExtractFilePath(Application.ExeName);
      fmBatchEntryBank.ImportDialog.Execute;
      if fmBatchEntryBank.ImportDialog.FileName = '' then
        fmBatchEntryBank.ImportDialog.FileName := 'nothing';
      end;

      Return := 'Import';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[3] = True then
    begin
      if OSFMessageDlg(GetTextLang(621),mtWarning,[MbYes,MbNo],0)=MrYes then
      Begin
        Return := 'Erase';
        ModalResult := mrok ;
      end;
    end
    else if lstboxMenu.Selected[4] = True then
    begin
   if ReadReportOp('CBViewAllBankState',false).AsBoolean then
    begin
      case isCashBook of
      1: Return := 'CrBalancesAtDate';
      2: Return := 'CreateReceipts';
      else
        Return := 'MultiEntry';
      end;
     end else
     begin
        case isCashBook of
        1,2: Return := 'CreateReceipts';
        else
          Return := 'MultiEntry';
        end;
     end;
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[5] = True then
    begin
      Return := 'Print';
  //    fmBatchEntry.Print;
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[6] = True then
    begin
      Return := 'Post';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[7] = True then
    begin
      Return := 'RpBtExec';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[8] = True then
    begin
      Return := 'ChangeAlias';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[9] = True then
    begin
      Return:='PeriodTotals';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[10] = True then
    begin
     if  fmBatchEntry <> nil then
      begin
      fmBatchEntry.ExportDialog.FileName := '';
      fmBatchEntry.ExportDialog.Execute;
      if fmBatchEntry.ExportDialog.FileName = '' then
        fmBatchEntry.ExportDialog.FileName := 'nothing';
      end else
      if  fmBatchEntryBank <> nil then
      begin
      fmBatchEntryBank.ExportDialog.FileName := '';
      fmBatchEntryBank.ExportDialog.Execute;
      if fmBatchEntryBank.ExportDialog.FileName = '' then
        fmBatchEntryBank.ExportDialog.FileName := 'nothing';
      end;
      Return := 'Export';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[11] = True then
    begin
      Return:='ReverseBat';
      ModalResult := mrok ;
    end
    Else if lstboxMenu.Selected[12] = True then
    begin
     if  fmBatchEntry <> nil then
      begin
      fmBatchEntry.ImportDialog.Filter:='TurboCash Txf Data file|*.Txf|TurboCash xml Data file|*.xml|All Files|*.*';
      fmBatchEntry.ImportDialog.DefaultExt:='.Txf';
      fmBatchEntry.ImportDialog.FileName := '';
      fmBatchEntry.ImportDialog.Execute;
      if fmBatchEntry.ImportDialog.FileName = '' then
        fmBatchEntry.ImportDialog.FileName := 'nothing';
      end else
      if  fmBatchEntryBank <> nil then
      begin
      fmBatchEntryBank.ImportDialog.Filter:='TurboCash Txf Data file|*.Txf|TurboCash xml Data file|*.xml|All Files|*.*';
      fmBatchEntryBank.ImportDialog.DefaultExt:='.Txf';
      fmBatchEntryBank.ImportDialog.FileName := '';
      fmBatchEntryBank.ImportDialog.Execute;
      if fmBatchEntryBank.ImportDialog.FileName = '' then
        fmBatchEntryBank.ImportDialog.FileName := 'nothing';
      end;
      Return := 'LoadTrans';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Selected[13] = True then
    begin
      Return:='PayCreditors';
      ModalResult := mrok ;
    end
     else if lstboxMenu.Selected[14] = True then
    begin
      Return:='RecieveDebtors';
      ModalResult := mrok ;
    end
     else if lstboxMenu.Selected[15] = True then
    begin
      Return:='ImportPostBatch';
      ModalResult := mrok ;
    end
    else if lstboxMenu.Items.Count > 16 then
     begin
       if lstboxMenu.Selected[16] then
       begin
         Return:='PayrollImportPlugin';
         ModalResult := mrok ;
       end;
     end;
  end;
end;

procedure TfmBatchProcessMenu.btnCancelClick(Sender: TObject);
begin
  Return:='Esc';
  Close;
end;

procedure TfmBatchProcessMenu.lstboxMenuKeyPress(Sender: TObject;
  var Key: Char);
begin

  //If the user pushes [enter] do a OK button
  if Key = #13 then
  begin
    btnOkClick(Sender);
    Key := #0;
  end;
//If the user pushed [esc] do a cancel button
  if Key = #27 then
  begin
    btnCancelClick(Sender);
    Key := #0;
  end;
{
  if Key = #112 then
  begin
      Result := (HTMLHelpShowHelp <> 0);
      Key := #0
  end;
}
end;

procedure TfmBatchProcessMenu.lstboxMenuEnter(Sender: TObject);
begin
  lstBoxMenu.ItemIndex := 1;
end;

procedure TfmBatchProcessMenu.SetReturn(const Value: String);
begin
  FReturn := Value;
end;

end.
