(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CreationCompWiz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,DB, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls,  
  FileCtrl,ShellApi, DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  MemDS, VirtualTable, cxContainer, cxLabel, cxDBLabel;

type
  TfmCreationCompWiz = class(TForm)
    TopPanel: TPanel;
    rgPanel: TPanel;
    nbCreate: TNotebook;
    ButtonPanel: TPanel;
    BtnBack: TBitBtn;
    BtnNext: TBitBtn;
    btnCancel: TBitBtn;
    LftPanel: TPanel;
    Image1: TImage;
    LblMessages: TLabel;
    sbBrowse: TSpeedButton;
    BtnFinish: TBitBtn;
    StatusBar1: TStatusBar;
    LblLocation: TLabel;
    LblFolder: TLabel;
    Label1: TLabel;
    edtNewName: TEdit;
    SpeedButton1: TSpeedButton;
    lblToCopy: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblToCopyName: TLabel;
    lblToCopyLoc: TLabel;
    DriveComboBox1: TDriveComboBox;
    dlbOldBooks: TDirectoryListBox;
    Label12: TLabel;
    ProgressPanel: TPanel;
    Label11: TLabel;
    ProgressBar1: TProgressBar;
    Animate2: TAnimate;
    Label4: TLabel;
    edtCredControl: TEdit;
    Label5: TLabel;
    edtDebtorsControl: TEdit;
    Label6: TLabel;
    edtRetainedEarnings: TEdit;
    lblOption0: TLabel;
    lblOption2: TLabel;
    lblOption3: TLabel;
    lblOption4: TLabel;
    lblOption5: TLabel;
    lblOption6: TLabel;
    NextOptionAr: TImage;
    lblOption1: TLabel;
    ProgressBar: TProgressBar;
    CbStep11: TCheckBox;
    Label19: TLabel;
    CbStep12: TCheckBox;
    Label16: TLabel;
    CbStep13: TCheckBox;
    Label28: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    cbStock: TCheckBox;
    Label7: TLabel;
    rgOptions: TGroupBox;
    index0: TRadioButton;
    index1: TRadioButton;
    index2: TRadioButton;
    index3: TRadioButton;
    index4: TRadioButton;
    BitBtn1: TBitBtn;
    EAccountDigets: TEdit;
    LAccountDigets: TLabel;
    UpDown1: TUpDown;
    DSBooks: TDataSource;
    index5: TRadioButton;
    index6: TRadioButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Bookname: TcxGridDBColumn;
    cxGrid1DBTableView1Database: TcxGridDBColumn;
    cxGrid1DBTableView1Server: TcxGridDBColumn;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cdBooks: TVirtualTable;
    cdBooksbookname: TStringField;
    cdBooksdatabase: TStringField;
    cdBooksserver: TStringField;
    cdBooksid: TIntegerField;
    lblDir1: TcxDBLabel;
    lblDir: TcxDBLabel;
    CbChangeCompData: TCheckBox;
    cbChangeSalesman: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure nbCreatePageChanged(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure dbgridAccountsRowChanged(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure BtnFinishClick(Sender: TObject);
    procedure edtCredControlExit(Sender: TObject);
    procedure edtDebtorsControlExit(Sender: TObject);
    procedure edtRetainedEarningsExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbBrowseClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EAccountDigetsChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    CustIndex : Integer;
    FirstName : String;
    Procedure ShowMessage;
    Procedure CopySetOfBooks;
    Procedure ConvertSetOfBooks;
    Procedure HelpCreation;
    Function  TestCtrlAccount(Sender: TObject):Boolean;
    Procedure CreatBooksOp3;
    Procedure FinishCustom;
    Function  SetOfBooksExist(sPath,SetName:string):Boolean;
    Procedure  OnProcessPatches (AString : String );
    Function  GetOpIndex:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;
//  Function  SetOfBooksExist(sPath,SetName:string):Boolean;

var
  fmCreationCompWiz: TfmCreationCompWiz;
  Etapes,
  CtrDebitorID,
  CtrCreditorID,
  CtrRetEarningID:Integer;
implementation

uses LanguageChoice, Main, Database, GlobalFunctions, Periods, Directory,
  OpenASetOfBooks, TcVariables, DatabaseAccess,LedgerRoutines,
  ChangeBooksProperties, TcashClasses, OSFGeneralRoutines, UDMTCCoreLink,
  ConvTOX, UDmQuantumGridDefs;

{$R *.DFM}

Function  TfmCreationCompWiz.SetOfBooksExist(sPath,SetName:string):Boolean;
begin

  Result := False;
  if SetName = '' then
    begin
    OSFMessageDlg(GetTextLang(2897), mterror, [mbok], 0);
    Result := True;
    exit ;
    end;
  sPath := IncludeTrailingBackslash(sPath)+ SetName;


  if (TheGlobalDataObject.Books.FindBooksByName(SetName) <> NIL)
    or FileExists(sPath +'\books.fdb') Or FileExists(TrimInStr(SetName) +'\books.fdb')

  then
  begin
    Result:= True;
    OSFMessageDlg(GetTextLang(539)+' ' + edtNewName.Text + ' '+GetTextLang(632), mterror, [mbok], 0);
  end;
end;

Procedure TfmCreationCompWiz.ShowMessage;
begin
  Case nbCreate.PageIndex of
  0: Begin
       LblMessages.Caption:= GetTextLang(544);
       BtnBack.Visible := False;
       BtnFinish.Visible := False;
       BtnNext.Visible := True;
     end;
  1: Begin
       LblMessages.Caption:= GetTextLang(541);
       BtnBack.Visible := True;
       BtnFinish.Visible := False;
       BtnNext.Visible := True;
 
       cxGrid1.SetFocus;
     end;
  2: Begin
       LblMessages.Caption:= GetTextLang(824);
       BtnBack.Visible := True;
       BtnFinish.Visible := True;
       BtnNext.Visible := False;
       Label2.Visible := True;
       Label3.Visible := True;
       lblToCopy.Visible := True;
       lblToCopyLoc.Visible := True;
       lblToCopyName.Visible := True;
//       case rgOptions.ItemIndex of
       case GetOpIndex of
       0: Begin
           lblToCopy.Caption := GetTextLang(1818); //'Old Set of Books to Convert :';
           lblToCopyLoc.Caption := dlbOldBooks.Directory;
           lblToCopyName.Caption := ExtractFileName(ExcludeTrailingBackslash(dlbOldBooks.Directory));
           if Trim(edtNewName.Text)='' then
             edtNewName.Text := lblToCopyName.Caption;
          end ;
       1: Begin
           lblToCopy.Caption := GetTextLang(877); // 'Set of Books to Copy :';
           lblToCopyLoc.Caption := lblDir.Caption;
           lblToCopyName.Caption := CDBooksDatabase.AsString;
          end;
       2: begin
           LblMessages.Caption:=GetTextLang(1816); // 'Fill in the name of new set of books';
           BtnFinish.Visible := False;
           BtnNext.Visible := True;
           lblToCopy.Visible := False;
           lblToCopyLoc.Visible := False;
           lblToCopyName.Visible := False;
           Label2.Visible := False;
           Label3.Visible := False;
           lblToCopyName.Caption := CDBooksDatabase.AsString;
          end;
       3: Begin
           LblMessages.Caption:= GetTextLang(1816); // 'Fill in the name of new set of books';
           BtnFinish.Visible := False;
           BtnNext.Visible := True;
           lblToCopy.Visible := False;
           lblToCopyLoc.Visible := False;
           lblToCopyName.Visible := False;
           Label2.Visible := False;
           Label3.Visible := False;
           lblToCopyName.Caption := CDBooksDatabase.AsString;
          end
       end;
       edtNewName.SetFocus;
     end;
  3: Begin
       LblMessages.Caption:= GetTextLang(572);
       BtnBack.Visible := True;
       BtnFinish.Visible := False;
       BtnNext.Visible := True;
//       lblToCopy.Caption := 'Old Set of b
       lblToCopyLoc.Caption := lblDir.Caption;
       lblToCopyName.Caption := CDBooksDatabase.AsString;
     end;
  5: Begin
       BtnBack.Visible := True;
       BtnFinish.Visible := False;
       BtnNext.Visible := True;
       LblMessages.Caption:= GetTextLang(1815); //'Set control accounts number and company setting and parameters';
       if (CustIndex>-1) AND (CustIndex<=6) then
         NextOptionAr.Top:=(FindComponent('lblOption'+IntToStr(CustIndex)) As TLabel).Top;
       Case CustIndex of
       -1:begin

          end;
        0:begin
           if not DMTCCoreLink.TheZConnection.Connected then
             CreatBooksOp3;
          // 'Specify Company info.';
          fmMain.SetupCompanyInfoClick(Application);
          end;
        1: begin
             fmPeriods := TfmPeriods.Create(self);
             SetUpForm(fmPeriods);
             fmPeriods.ShowModal;
             fmPeriods.Free;
            end;
        2:begin
          //'Specify now your Groups.';
          fmMain.SetupGroupsClick(Application);
          end;
        3:begin
          // 'Specify Salesman info.';
          fmMain.SetupSalesmanClick(Application);
          end;
        4:begin
          //'Specify now your batch types.';
          fmMain.SetupBatchTypesClick(Application);
          end;
        5:begin
          // Docs Setup
          SetCurrentUser(0) ;
          fmMain.SetupDocumentsClick(Application);
          end;
        6:begin
            BtnFinish.Visible := True;
            BtnNext.Visible := False;
            // Stock info
            fmMain.SetupStockInfoClick(Application);
          end;
        end;
     end;
   7: begin
        LblMessages.Caption := GetTextLang(825);
        BtnBack.Visible := True;
        BtnFinish.Visible := False;
        BtnNext.Visible := True;
      end;
   8: begin
        LblMessages.Caption := GetTextLang(1053);
        BtnBack.Visible := True;
        BtnFinish.Visible := true;
        BtnNext.Visible := False;
      end;
  end;
end;

procedure TfmCreationCompWiz.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(btnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BtnBack.Glyph,'backward');
 DMTCCoreLink.LoadImage(BtnNext.Glyph,'forward');

 DMTCCoreLink.LoadImage(BtnFinish.Glyph,'end');

 DMTCCoreLink.LoadImage(sbBrowse.Glyph,'Search');
 sbBrowse.NumGlyphs := 1 ;

 DMTCCoreLink.LoadImage(SpeedButton1.Glyph,'Search');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Search');



   Caption := GetTextLang(540);// Creation Wizard
   sbBrowse.Caption := GetTextLang(542);// Browse
   BtnFinish.Caption := GetTextLang(543);
   rgOptions.Caption := GetTextLang(545);// Do you wish to :
   index0.Caption := GetTextLang(546);// Convert from an older TurboCASH (v 2.01 2.02, 2.03) ?
   index1.Caption := GetTextLang(547);// Copy an existing set of books ?
   index2.Caption := GetTextLang(548);// Let TurboCASH help you to create a set of books ?
   index3.Caption := GetTextLang(549);// Customise your own set of books (Advanced) ?
   index4.Caption := GetTextLang(550);// Convert from Pastel Partner 4... ?

   index6.Caption := GetTextLang(3126);

   BtnCancel.Caption := GetTextLang(168);//Cancel
   Label4.Caption := GetTextLang(552);// Creditors Control
   Label5.Caption := GetTextLang(553);// Debtors Control
   Label6.Caption := GetTextLang(554);// Retained Earnings
   lblOption1.Caption := GetTextLang(875);// Finacial Periods
   lblOption0.Caption := GetTextLang(320);// Compn Info
   lblOption2.Caption := GetTextLang(345);// Groups
   lblOption3.Caption := GetTextLang(876);// Salesman
   lblOption4.Caption := GetTextLang(241);// Batch Types
   lblOption5.Caption := GetTextLang(344);// Docuents set up
   lblOption6.Caption := GetTextLang(103);// Stock info
   lblToCopy.Caption := GetTextLang(877); // Set of Books to Copy :
   LblLocation.Caption := GetTextLang(716); // Location :
   label3.Caption := GetTextLang(716); // Location :
   Label2.Caption := GetTextLang(185);//  Name
   Label1.Caption := GetTextLang(175);//  Name for new set of books
   SpeedButton1.Caption := GetTextLang(854);// &Browse
   BtnBack.Caption := GetTextLang(879);// &Back
   BtnNext.Caption := GetTextLang(729);//  Next



 // Force refresh of list.
  fmOpenASetOfBooks := TfmOpenASetOfBooks.Create(self);
  try

  fmOpenASetOfBooks.FormShow(nil);
  finally
  FreeAndNil(fmOpenASetOfBooks);
  end;
  GlobalSetOfBooksToDataSet(CDBooks);
  /// just the existing books
  CDBooks.First ;
  while not CDBooks.eof do
    begin
      if not FileExists(CDBooksDatabase.AsString) then
       CDBooks.delete
       else
        CDBooks.next ;
    end;

  nbCreate.PageIndex:=0;
  CustIndex := -1;
  ShowMessage;
  FirstName:='';

  LblFolder.Caption := TDMTCCoreLink.GetLocalBaseDir + 'books' + PathDelim ;
  if FileExists(ApplicationPath+'Conversion.exe') then
     index4.Enabled := True
   else
     index4.Enabled := False;

  if FileExists(ApplicationPath+'Conversiontc4.exe') then
     index6.Enabled := True
   else
     index6.Enabled := False;

   index3.Visible :=   DMTCCoreLink.SimpleMode = 0 ;
   index4.Visible :=   DMTCCoreLink.SimpleMode = 0 ;
   index6.Visible :=   DMTCCoreLink.SimpleMode = 0 ;

   // done : Pieter Translation
   BitBtn1.Caption :=  GetTextLang(1820);
   Label11.Caption :=  GetTextLang(1821);
   Label19.Caption :=  GetTextLang(1822);
   Label16.Caption :=  GetTextLang(1823);
   Label28.Caption :=  GetTextLang(1824);
   Label7.Caption :=   GetTextLang(1825);
   Label18.Caption :=  GetTextLang(1826);
   index5 .Caption :=  GetTextLang(3030);
   index5.Visible :=false ;
   SpeedButton1.Caption :=  GetTextLang(1820);
   sbBrowse.Caption :=  GetTextLang(1820);
   lblToCopy.Caption :=  GetTextLang(1827);
   Label2.Caption :=  GetTextLang(1828);
   Label3.Caption :=  GetTextLang(1829);
   LblLocation.Caption :=  GetTextLang(1829);
   Label17.Caption :=  GetTextLang(2033);
   LAccountDigets.Caption :=  GetTextLang(2115);
   CDBooksBookname.DisplayLabel :=GetTextLang(2116);
   // translate after open
 // wwDBGrid1.Columns[0].DisplayLabel := GetTextLang(2116);
 // wwDBGrid1.Columns[1].DisplayLabel := GetTextLang(2117);
end;

procedure TfmCreationCompWiz.nbCreatePageChanged(Sender: TObject);
begin
  ShowMessage;
end;

procedure TfmCreationCompWiz.BtnNextClick(Sender: TObject);
begin
//  case rgOptions.ItemIndex of
  if nbCreate.PageIndex = 0 then
     CloseSetOfBooks;
  case GetOpIndex of
  0: Begin

      if nbCreate.PageIndex=0 then
       nbCreate.PageIndex:=3
      else
       nbCreate.PageIndex:=2
     end;
  1:Begin
      nbCreate.PageIndex:=nbCreate.PageIndex+1;
    end;
  2:Begin
      if nbCreate.PageIndex=0 then
        nbCreate.PageIndex:=7
      else if nbCreate.PageIndex=7 then
        nbCreate.PageIndex:=2
      else if (nbCreate.PageIndex=2) And (Trim(edtNewName.Text)<>'') then
         begin
           if SetOfBooksExist(LblFolder.Caption,edtNewName.Text) then
             exit;
           nbCreate.PageIndex:=8;
         end
      else if (nbCreate.PageIndex=2) And (Trim(edtNewName.Text)='') then
      begin
        OSFMessageDlg(GetTextLang(826), mterror, [mbok], 0);
        edtNewName.SetFocus;
      end
      else
        nbCreate.PageIndex:=nbCreate.PageIndex+1;
    end;
  3:Begin
      if nbCreate.PageIndex<>2 then
      begin
        if (CustIndex=-1) AND (nbCreate.PageIndex=0)
        And (Trim(edtNewName.Text)='') then
        begin
         nbCreate.PageIndex:=2;
          exit;
        end;
        if (CustIndex=-1) And (Trim(edtNewName.Text)<>'')
        AND (nbCreate.PageIndex=0) then
        begin
          nbCreate.PageIndex:=5;
          Exit;
        end;
//        if (CustIndex=0) OR (CustIndex=-1) then
        if (CustIndex=-1) then
        begin
          if not TestCtrlAccount(edtCredControl) then
            exit;
          if not TestCtrlAccount(edtDebtorsControl) then
            exit;
          if not TestCtrlAccount(edtRetainedEarnings) then
            exit;

        end;
        if (CustIndex<6) AND (nbCreate.PageIndex<>2) then
          Inc(CustIndex);
        ShowMessage;
      end
      else
      if Trim(edtNewName.Text)<>'' then
      begin
        if SetOfBooksExist(LblFolder.Caption,edtNewName.Text) then
          exit;
        nbCreate.PageIndex:=5;
      end else
      begin
        OSFMessageDlg(GetTextLang(2897), mterror, [mbok], 0);
      end;
    end;
  4: Begin
       Close;
       ShellExecute(Handle, 'open', Pchar(ExtractFilePath(Application.ExeName)+'Conversion.exe'), nil, nil, SW_SHOW);
       BtnFinish.Visible := True ;
       Exit;
     end;

  6 : Begin
       Close;
       ShellExecute(Handle, 'open', Pchar(ExtractFilePath(Application.ExeName)+'Conversiontc4.exe'), nil, nil, SW_SHOW);
       BtnFinish.Visible := True ;
       Exit;
     end;
  5: Begin
  TheGlobalDataObject.Books.DeselectBooks ;
  TheGlobalDataObject.Books.Selected[(TheGlobalDataObject.Books.Add as TBooksCollectionItem).Index] := true;
  fmChangeBooksProperties := TfmChangeBooksProperties.Create(self);
  try
      SetUpForm(fmChangeBooksProperties);
      if fmChangeBooksProperties.ShowModal = mrok then
         begin
            GlobalSetOfBooksToDataSet(CDBooks);
            TheGlobalDataObject.Save ;
         end else
         TheGlobalDataObject.Books.Delete(TheGlobalDataObject.Books.Count-1);
      finally
      FreeAndNil(fmChangeBooksProperties);
      end;
      BtnFinish.Visible := True ;
      Exit;
     end;
  End;
end;

procedure TfmCreationCompWiz.dbgridAccountsRowChanged(Sender: TObject);
begin
  lblDir.Caption:=CDBooksDatabase.AsString;
end;

procedure TfmCreationCompWiz.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCreationCompWiz.BtnBackClick(Sender: TObject);
begin
//  case rgOptions.ItemIndex of
  case GetOpIndex of
  0: if nbCreate.PageIndex=2 then
       nbCreate.PageIndex:=3
      else if nbCreate.PageIndex=3 then
       nbCreate.PageIndex:=0;
  1: if nbCreate.PageIndex >0 then
        nbCreate.PageIndex:=nbCreate.PageIndex-1;
  2: if (nbCreate.PageIndex=2) then
        nbCreate.PageIndex:=7
     else if nbCreate.PageIndex=7 then
        nbCreate.PageIndex:=0
     else if nbCreate.PageIndex=8 then
        nbCreate.PageIndex:=2;
  3:Begin
      if (CustIndex>0) then
      begin
        Dec(CustIndex);
        ShowMessage;
      end
      else if CustIndex<=0 then
      begin
        CustIndex:=-1;
        nbCreate.PageIndex:=0;
      end;
    end;
  End;
end;

procedure TfmCreationCompWiz.BtnFinishClick(Sender: TObject);
begin
//  case rgOptions.ItemIndex of
  case GetOpIndex of
  0:begin
     if SetOfBooksExist(LblFolder.Caption,edtNewName.Text) then
       exit;
      ConvertSetOfBooks;
      ModalResult := mrYesToAll ;
    end;
  1:begin
      if SetOfBooksExist(ExtractFilePath(lblDir.Caption),edtNewName.Text) then
        exit;
      CopySetOfBooks;
      ModalResult := mrYesToAll ;
    end;
  2: begin
      HelpCreation;
      ModalResult := mrYesToAll ;
     end;
  3: begin
       FinishCustom;
       ModalResult := mrYesToAll ;
     end;
  4,5: begin
       ModalResult := mrYesToAll ;
     end;
  end;
end;

Procedure TfmCreationCompWiz.CopySetOfBooks;
Var
  Return:integer;
begin
  // Test New Name
  if Trim(edtNewName.Text)='' then
  begin
   beep;
   OSFMessageDlg(GetTextLang(826), mterror, [mbok], 0);   
   edtNewName.SetFocus;
   Exit;
  end;

  if TheGlobalDataObject.Books.FindBooksByPath(IncludeTrailingPathDelimiter(LblFolder.Caption)+edtNewName.Text) <> NIL then
  begin
    OSFMessageDlg(GetTextLang(539)+' ' + CDBooksBookname.AsString + ' '+GetTextLang(632), mterror, [mbok], 0);
    edtNewName.Clear;
    edtNewName.SetFocus;
    Exit;
  end;
  if OSFMessageDlg(GetTextLang(446){Are you sure you want to create the } + ' ' +edtNewName.Text + ' ' +GetTextLang(447){ set of books ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if lblDir.Caption <> '' then
    begin
      if not FileExists(lblDir.Caption ) then
      begin
        OSFMessageDlg(GetTextLang(558){'This directory does not contain a set of books, or the set of books is damaged.'}, mterror, [mbok], 0);
        exit;
      end;
      CloseSetOfBooks;
      Return := CopyExistingBooks(ExtractFilePath(lblDir.Caption), LblFolder.Caption + edtNewName.Text,edtNewName.Text);
      if Return = 1 then
        begin
         OSFMessageDlg(edtNewName.Text + GetTextLang(448){ set of books created}, mtinformation, [mbok], 0);
        end;
      if Return = 2 then
        OSFMessageDlg(GetTextLang(449){Error creating books}, mterror, [mbok], 0);
      if Return = 3 then
        OSFMessageDlg(GetTextLang(450){The} + ' ' +edtNewName.Text + ' ' +GetTextLang(451){ set of books already exist}, mterror, [mbok], 0);
    end
    else
      OSFMessageDlg(GetTextLang(559){'You have to choose a set of books or directory to copy'}, mterror, [mbok], 0);
  end;


end;

Procedure TfmCreationCompWiz.ConvertSetOfBooks;
begin
  if FileExists(dlbOldBooks.Directory + '\Accounts.dat') = True then
  begin
    ProgressBar1.Visible := True;
    ProgressBar1.Position := 0;
    ProgressPanel.Visible := True;
    BtnBack.Enabled := False;
    BtnNext.Enabled := False;
    BtnFinish.Enabled := False;
    StatusBar1.SimpleText := GetTextLang(1806) ;//'Creating set of books...';
    LblFolder.Caption := IncludeTrailingBackslash(LblFolder.Caption);
    Animate2.Play(1, 34, 0);
    fmCreationCompWiz.Repaint;
    convTOX.OnUpdate := OnProcessPatches;
    try
      CreateBooks(LblFolder.Caption,edtNewName.Text,StrToInt(EAccountDigets.text));
    finally
        convTOX.OnUpdate := nil ;
    end;
    if TheGlobalDataObject.Books.FindBooksByName(edtNewName.Text) <> nil then
       begin
        dmdatabase.ConnectToBooks(TheGlobalDataObject.Books.FindBooksByName(edtNewName.Text));
       end;


    ProgressBar1.StepBy(3);
    StatusBar1.SimpleText := GetTextLang(1831) ;// 'Converting set of books...';
    fmCreationCompWiz.Repaint;
    ImportSetOfBooks(dlbOldBooks.Directory);
    //Added by Sylvain
    ProperlyInUseClosed(True);
    //
    ProgressBar1.StepBy(7);
    StatusBar1.SimpleText := GetTextLang(1814) ;//'Finished !';
    Animate2.Stop;
    OSFMessageDlg(GetTextLang(454){Finished !}, mtinformation, [mbok], 0);
    ProgressPanel.Visible := False;
    BtnBack.Enabled := True;
    BtnNext.Enabled := True;
    BtnFinish.Enabled := True;
    fmMain.MainStatusBar.Panels.Items[0].Text := '';
    ProgressBar1.Position := 0;
//    dmDatabase.tblBooks.Close;
    // see modal result
    // Close;
  end
  else
    OSFMessageDlg(GetTextLang(455){This directory does not contain a TurboCASH 2.01, 2.02 or 2.03 set of books}, mterror, [mbok], 0);
end;

Function TfmCreationCompWiz.TestCtrlAccount(Sender: TObject):Boolean;
begin
  Result:=False;
  with (Sender as TEdit) do
  begin
    if Text = '' then
    begin
      OSFMessageDlg(GetTextLang(452){Account cannot be blank}, mterror, [mbok], 0);
      SetFocus;
      exit;
    end;
    if CheckAccountNumber(Text) = False then
    begin
      OSFMessageDlg(GetTextLang(453){The first letter of the account number must be a number}, mterror, [mbok], 0);
      Text := '';
      SetFocus;
      exit;
    end;
    if Length(Text) < StrToInt(EAccountDigets.text) then
    begin
      while Length(Text) < StrToInt(EAccountDigets.text) do
        Text := '0' + Text;
    end;

    Text := copy(Text,(Length(Text)-StrToInt(EAccountDigets.text))+1,StrToInt(EAccountDigets.text));
  end;
  Result:=True;
End;


procedure TfmCreationCompWiz.edtCredControlExit(Sender: TObject);
begin
   if btnCancel.Focused then Exit;
   TestCtrlAccount(edtCredControl);
end;

procedure TfmCreationCompWiz.edtDebtorsControlExit(Sender: TObject);
begin
   if btnCancel.Focused then Exit;
   TestCtrlAccount(edtDebtorsControl);
end;

procedure TfmCreationCompWiz.edtRetainedEarningsExit(Sender: TObject);
begin
   if btnCancel.Focused then Exit;
   TestCtrlAccount(edtRetainedEarnings);
end;

procedure TfmCreationCompWiz.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

Procedure TfmCreationCompWiz.CreatBooksOp3;
begin
  if (edtCredControl.Text = edtDebtorsControl.Text) or
     (edtCredControl.Text = edtRetainedEarnings.Text) or
     (edtDebtorsControl.Text = edtRetainedEarnings.Text) then begin
          OSFMessageDlg(GetTextLang(779){The account must be unique}, mterror, [mbok], 0);
     edtCredControl.Setfocus;
     exit;
  end;
  StatusBar1.SimpleText := GetTextLang(1806); //Creating set of books...
  fmCreationCompWiz.Repaint;
  ProgressBar.ViSible:=True;
  ProgressBar.Position := 0;
  convTOX.OnUpdate := OnProcessPatches ;
  try
  CreateBooks(LblFolder.Caption,edtNewName.Text,StrToInt(EAccountDigets.text));
  finally
   convTOX.OnUpdate := nil ;
  end;
  ProgressBar.StepBy(2);
  StatusBar1.SimpleText := GetTextLang(1807); // 'Creating required accounts...'
  with dmDatabase do
  begin
      if TheGlobalDataObject.Books.FindBooksByName(edtNewName.Text) <> nil then
       begin
        DmDatabase.ConnectToBooks(TheGlobalDataObject.Books.FindBooksByName(edtNewName.Text));
       end;
    ProgressBar.StepBy(2);
  //Create the required accounts
    StatusBar1.SimpleText := GetTextLang(1808); //'Creating required accounts(Creditors Control)...'
    tblAccount.Filter := '' ;
    tblAccount.Open;
    if not tblAccount.Locate('SACCOUNTCODE',edtCredControl.Text,[]) then
    tblAccount.Insert else
    tblAccount.Edit ;
    tblAccountSMAINACCOUNTCODE.Value := edtCredControl.Text;
    tblAccountSSUBACCOUNTCODE.Value := '000';
    tblAccountSDescription.Value := GetTextLang(1809);//'Creditors Control' ;
    tblAccountWAccountTypeID.Value := 0;
    tblAccountWLINKACCOUNT.AsInteger := tblAccountWACCOUNTID.AsInteger ;
    // Sylvain Acc
    tblAccountSACCOUNTCODE.Value := edtCredControl.Text+'000';
    tblAccount.Post;
    CtrCreditorID:=tblAccountWAccountID.Value;
    tblSysVars.Open;
    tblSysVars.Edit;
    tblSysVarsWCreditorsControlID.Value := tblAccountWAccountID.Value;
    tblSysVars.Post;
    tblSysVars.Close;
    ProgressBar.StepBy(2);
    StatusBar1.SimpleText := GetTextLang(1810);// 'Creating required accounts(Debtors Control)...';

    if not tblAccount.Locate('SACCOUNTCODE',edtDebtorsControl.Text,[]) then
    tblAccount.Insert else
    tblAccount.Edit ;
    tblAccountSMAINACCOUNTCODE.Value := edtDebtorsControl.Text;
    tblAccountSSUBACCOUNTCODE.Value := '000';
    tblAccountSDescription.Value := GetTextLang(1811);//'Debtors Control';
    tblAccountWAccountTypeID.Value := 0;
    tblAccountWLINKACCOUNT.AsInteger := tblAccountWACCOUNTID.AsInteger ;
    // Sylvain Acc
    tblAccountSACCOUNTCODE.Value := edtDebtorsControl.Text+'000';
    tblAccount.Post;
    CtrDebitorID:=tblAccountWAccountID.Value;
    ProgressBar.StepBy(2);
    StatusBar1.SimpleText := GetTextLang(1812);// 'Creating required accounts(Retained Earnings)...';
    tblSysVars.Open;
    tblSysVars.Edit;
    tblSysVarsWDebtorsControlID.Value := tblAccountWAccountID.Value;
    tblSysVars.Post;
    tblSysVars.Close;

    if not tblAccount.Locate('SACCOUNTCODE',edtRetainedEarnings.Text,[]) then
    tblAccount.Insert else
    tblAccount.Edit ;
    tblAccountSMAINACCOUNTCODE.Value := edtRetainedEarnings.Text;
    tblAccountSSUBACCOUNTCODE.Value := '000';
    tblAccountSDescription.Value := GetTextLang(1813);// 'Retained Earnings';
    tblAccountWAccountTypeID.Value := 0;
    tblAccountWLINKACCOUNT.AsInteger := tblAccountWACCOUNTID.AsInteger ;
    // Sylvain Acc
    tblAccountSACCOUNTCODE.Value := edtRetainedEarnings.Text+'000';
    tblAccount.Post;
    CtrRetEarningID:=tblAccountWAccountID.Value;
    tblSysVars.Open;
    tblSysVars.Edit;
    tblSysVarsWRetainedIncomeID.Value := tblAccountWAccountID.Value;
    tblSysVars.Post;
    tblSysVars.Close;
    ScriptErrorList := '' ;
 end;
  ProgressBar.StepBy(2);
  StatusBar1.SimpleText := GetTextLang(1814);// 'Finished !';
  ProgressBar.ViSible:=False;
end;

Procedure TfmCreationCompWiz.FinishCustom;
begin
  CtrDebitorID := GetControlAccountID(1);// Det Ctrl
  CtrCreditorID := GetControlAccountID(2);// Det Ctrl
  CtrRetEarningID := GetControlAccountID(3);// Det Ctrl
   dmdatabase.tblAccount.close;
  dmdatabase.tblAccount.Open;
  if not TestCtrlAccount(edtCredControl) then
    exit;
  if not TestCtrlAccount(edtDebtorsControl) then
    exit;
  if not TestCtrlAccount(edtRetainedEarnings) then
    exit;
  TDataBaseRoutines.CreateTotalsForAccount(CtrCreditorID);
  TDataBaseRoutines.CreateTotalsForAccount(CtrDebitorID);
  TDataBaseRoutines.CreateTotalsForAccount(CtrRetEarningID);

  dmdatabase.tblAccount.Locate('WAccountID',CtrDebitorID,[]);
  dmdatabase.tblAccount.Edit;
  dmdatabase.tblAccountSMAINACCOUNTCODE.Value := edtDebtorsControl.Text;
  dmdatabase.tblAccountSACCOUNTCODE.Value := edtDebtorsControl.Text+'000';
  dmdatabase.tblAccountWLINKACCOUNT.AsInteger :=  CtrDebitorID ;
  dmdatabase.tblAccount.Post;
  //
  dmdatabase.tblAccount.Locate('WAccountID',CtrCreditorID,[]);
  dmdatabase.tblAccount.Edit;
  dmdatabase.tblAccountSMAINACCOUNTCODE.Value := edtCredControl.Text;
  dmdatabase.tblAccountSACCOUNTCODE.Value := edtCredControl.Text+'000';
  dmdatabase.tblAccountWLINKACCOUNT.AsInteger :=  CtrCreditorID ;
  dmdatabase.tblAccount.Post;
  //
  dmdatabase.tblAccount.Locate('WAccountID',CtrRetEarningID,[]);
  dmdatabase.tblAccount.Edit;
  dmdatabase.tblAccountSMAINACCOUNTCODE.Value := edtRetainedEarnings.Text;
  dmdatabase.tblAccountSACCOUNTCODE.Value := edtRetainedEarnings.Text+'000';
  dmdatabase.tblAccountWLINKACCOUNT.AsInteger :=  CtrRetEarningID ;
  dmdatabase.tblAccount.Post;
  dmdatabase.tblAccount.Close;
   // see modal result
  // Close;
end;

procedure TfmCreationCompWiz.SpeedButton1Click(Sender: TObject);
begin
  fmDirectory := TfmDirectory.Create(self);
  SetUpForm(fmDirectory);
  fmDirectory.ShowModal;
  fmDirectory.Free;
  if ReturnLookUp[length(ReturnLookUp)]<>'\' then
    ReturnLookUp:=ReturnLookUp+'\';
  LblFolder.Caption:=ReturnLookUp;
end;

Procedure TfmCreationCompWiz.HelpCreation;
var
  Return : Integer;

begin
  if OSFMessageDlg(GetTextLang(446){Are you sure you want to create the } +' ' +edtNewName.Text + ' '+ GetTextLang(447){ set of books ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    if lblDir1.Caption <> '' then
    begin
      if not FileExists(lblDir1.Caption ) then
      begin
        OSFMessageDlg(GetTextLang(558){'This directory does not contain a set of books, or the set of books is damaged.'}, mterror, [mbok], 0);
        exit;
      end;
      Return := CopyExistingBooks(ExtractFileDir(lblDir.Caption), LblFolder.Caption + edtNewName.Text, edtNewName.Text);
      if Return = 1 then
      begin

        DmDatabase.ConnectToBooks(TheGlobalDataObject.Books[TheGlobalDataObject.Books.Count-1]);
 
        ClearReset;
        nbCreate.PageIndex := 9;
        Etapes:=1;
      end;
      if Return = 2 then
        OSFMessageDlg(GetTextLang(449){Error creating books}, mterror, [mbok], 0);
      if Return = 3 then
        OSFMessageDlg(GetTextLang(450){The} + edtNewName.Text + GetTextLang(451){ set of books already exist}, mterror, [mbok], 0);
    end
    else
    begin
      OSFMessageDlg(GetTextLang(559){'You have to choose a set of books or directory to copy'}, mterror, [mbok], 0);
    end;

     // add resource
     dmDatabase.TblResources.Active := true ;
     if dmDatabase.TblResources.IsEmpty then
     begin
     dmDatabase.TblResources.Insert ;
     dmDatabase.TblResourcesRESOURCEID.AsInteger := 1 ;
     if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
     dmDatabase.TblResourcesDESCRIPTION.AsString := 'Turbocash'
     else
     dmDatabase.TblResourcesDESCRIPTION.AsString := 'osFinancials' ;
     dmDatabase.TblResources.Post;
     end;
     dmDatabase.TblResources.Active := False ;



     // 'Specify Company info.';
    if CbChangeCompData.Checked then
     fmMain.SetupCompanyInfoClick(Application);

    if CbStep11.Checked then
    //'You now need to type in the number of periods there are in your financial year and the date of the start of the year.';
     fmMain.SetupReportingDatesClick(Application);

     if CbStep12.Checked then
      //'Specify now your batch types.';
        fmMain.SetupBatchTypesClick(Application);

     if CbStep13.Checked then
      //'Specify now your Groups.';
        fmMain.SetupGroupsClick(Application);

     // 'Specify Salesman info.';


     if cbStock.Checked then
     begin
     // Didigan sales persons should not show.
       SetCurrentUser(0) ;
       fmMain.SetupDocumentsClick(Application);
       fmMain.SetupStockInfoClick(Application);
     end;
       if cbChangeSalesman.Checked then
          fmMain.SetupSalesmanClick(Application);
      // see modal result
     // close;
  end;
end;

procedure TfmCreationCompWiz.sbBrowseClick(Sender: TObject);
begin
  fmOpenASetOfBooks := TfmOpenASetOfBooks.Create(self);
  try
    fmOpenASetOfBooks.BtnBrowseClick(Sender);
    GlobalSetOfBooksToDataSet(CDBooks);
  finally
    fmOpenASetOfBooks.Free;
  end;
  CDBooks.Locate('bookname',ReturnLookup,[]);
end;

Function TfmCreationCompWiz.GetOpIndex:Integer;
begin
  if index0.Checked then
    Result := 0
  else
  if index1.Checked then
    Result := 1
  else
  if index2.Checked then
    Result := 2
  else
  if index3.Checked then
    Result := 3
  else
  if index4.Checked then
    Result := 4;
  if index5.Checked then
    Result := 5;
  if index6.Checked then
    Result := 6;


end;


procedure TfmCreationCompWiz.BitBtn1Click(Sender: TObject);
begin
  fmOpenASetOfBooks := TfmOpenASetOfBooks.Create(self);
  try
    fmOpenASetOfBooks.BtnBrowseClick(Sender);
    GlobalSetOfBooksToDataSet(CDBooks);
  finally
    fmOpenASetOfBooks.Free;
  end;
  CDBooks.Locate('bookname',ReturnLookup,[]);
end;

procedure TfmCreationCompWiz.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then
  begin
    //Result := (HTMLHelpShowHelp <> 0);
    Case GetOpIndex of
    0: HtmlShowTopic(106);
    1: HtmlShowTopic(108);
    2: HtmlShowTopic(109);
    3: HtmlShowTopic(110);
    4: HtmlShowTopic(107);
    else
      HtmlShowTopic(104);
    end;
    key := 0;
 end;
end;

procedure TfmCreationCompWiz.EAccountDigetsChange(Sender: TObject);
begin
 MainAccountLength := StrToInt(EAccountDigets.text);
 edtCredControl.MaxLength := MainAccountLength;
 edtDebtorsControl.MaxLength := MainAccountLength;
 edtRetainedEarnings.MaxLength := MainAccountLength;
 if edtCredControl.Text <> '' then
 TestCtrlAccount(edtCredControl);
 if edtDebtorsControl.Text <> '' then
 TestCtrlAccount(edtDebtorsControl);
 if edtRetainedEarnings.Text <> '' then
 TestCtrlAccount(edtRetainedEarnings);
end;

procedure TfmCreationCompWiz.OnProcessPatches(AString: String);
begin
   StatusBar1.SimpleText := AString ;
   Application.ProcessMessages ;
end;

procedure TfmCreationCompWiz.FormCreate(Sender: TObject);
begin
 cbStock.Visible :=  DMTCCoreLink.SimpleMode =0 ;
 cbStock.Checked :=  DMTCCoreLink.SimpleMode =0 ;
 Label7.Visible :=  DMTCCoreLink.SimpleMode =0 ;
 Label18.Visible :=  DMTCCoreLink.SimpleMode =0 ;

 if FileExists(ExtractFilePath(Application.ExeName) +'logohor.jpg') then
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) +'logohor.jpg');
end;

end.
