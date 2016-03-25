(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit OpenASetOfBooks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,filectrl, Menus,  DB, Buttons,

    DBClient,shellapi,UosfResources,
  VirtualTable, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS,
      cxContainer,
  cxCheckBox,
    ActnList;

type
  TfmOpenASetOfBooks = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtnOpen: TBitBtn;
    DSBooks: TDataSource;
    Panel1: TPanel;
    LLook: TLabel;
    PopupMenu1: TPopupMenu;
    Purgeinvalide1: TMenuItem;
    TDoOpen: TTimer;
    Purgenonlocal1: TMenuItem;
    pmoptions: TPopupMenu;
    Findasetofbooks1: TMenuItem;
    Createanewsetofbooks1: TMenuItem;
    cdBooks: TVirtualTable;
    cdBooksbookname: TStringField;
    cdBooksdatabase: TStringField;
    cdBooksserver: TStringField;
    cdBooksid: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1bookname: TcxGridDBColumn;
    cxGrid1DBTableView1database: TcxGridDBColumn;
    cxGrid1DBTableView1server: TcxGridDBColumn;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cbAutoOpen: TcxCheckBox;
    ActionList1: TActionList;
    ABrowse: TAction;
    APurgeList: TAction;
    AProperties: TAction;
    AAdd: TAction;
    fcOutlookBar2: TPanel;
    bbrowse: TSpeedButton;
    BPurge: TSpeedButton;
    bprop: TSpeedButton;
    badd: TSpeedButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OpenPropertiesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnBrowseClick(Sender: TObject);

    procedure ButtonPanelDblClick(Sender: TObject);
    procedure Purgeinvalide1Click(Sender: TObject);
    procedure TDoOpenTimer(Sender: TObject);
    procedure Purgenonlocal1Click(Sender: TObject);
    procedure Createanewsetofbooks1Click(Sender: TObject);
    procedure Findasetofbooks1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ABrowseExecute(Sender: TObject);
    procedure APurgeListExecute(Sender: TObject);
    procedure APropertiesExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

 

  public
      LoginResult : Integer ;
      ServerFound : boolean ;
      Gardianfound : Boolean ;
      JustPick : Boolean ;
      RunPluginOpenBooks : Boolean ;
      procedure OpenGlobalSelected ;
    { Public declarations }
  end;

var
  fmOpenASetOfBooks: TfmOpenASetOfBooks;
  Look:String;

implementation

uses
  Main,GlobalFunctions, Database,
  TcVariables, XRoutines,
  ChangeBooksProperties, DatabaseAccess,Variants, TcashClasses,
  UDMTCCoreLink, UPluginsSharedUnit, UTranslateQuantumgrid,
  UDmQuantumGridDefs, OSFGeneralRoutines;
  //Directory, ;

{$R *.DFM}

procedure TfmOpenASetOfBooks.FormShow(Sender: TObject);
Var
  DirsList:TDirectoryListBox;
  I,aMax :Integer;
  vDrive,
  Tmp,LastOpenName ,File1 :String;
  NewSettngName : array [0..256] of char ;
  Sort : Boolean ;
  ALib : HINST ;
  aMenuPlugin : TOSFMenuPlugin ;
begin
 cxGrid1DBTableView1bookname.Caption := DMTCCoreLink.GetTextLang(2116);

   LoginResult := 0 ;
   RunPluginOpenBooks := False ;
   Tmp := ExtractFilePath(Application.ExeName)+'plug_ins\Openbooks.tpd' ;
   if FileExists(Tmp) then
      begin
       ALib := LoadLibrary(pchar(Tmp)) ;
       fcOutlookBar2.Visible := false ;
       if ALib <> 0 then
        begin
       try

         @aMenuPlugin := GetProcAddress(ALib, OSFOPENBOOKSPLUGINSRoutineName);
         if (@aMenuPlugin <> nil) then
            begin
             //  GetTempPath(255,NewSettngName) ;
             //  File1 := trim(NewSettngName);
           //    Randomize ;
            //   File1 := IncludeTrailingPathDelimiter(File1) + IntToStr(random(999999999)) + '.dfm' ;

               File1 := ExtractFilePath(Application.ExeName) +'Bin\Settings.dfm' ;
               LoginResult := aMenuPlugin(Application.Handle,Application,DMTCCoreLink.TheZConnection,'','');


               Tmp := TDMTCCoreLink.GetLocalBaseDir +'Bin\Settings.dfm' ;
               if  not FileExists(Tmp) then
                  begin
                   ForceDirectories(ExtractFilePath(Tmp)) ;
                   CopyFile(pchar(File1),pchar(Tmp),true) ;
                  end;

               if FileExists(Tmp) then
                 begin
                      InitGlobalObject ;
                      RunPluginOpenBooks := true ;
                      fcOutlookBar2.Visible := false ;
                  end;
              if LoginResult <> mrOk then
                begin
                  TheGlobalDataObject.Books.Clear ;
                  raise Exception.Create(DMTCCoreLink.GetTextLang(829));
                end;

           end;
         finally
          FreeLibrary(ALib) ;
         end;
      end;
  end;

   Caption := GetTextLang(172);// Set of books
   btnOpen.Caption := DMTCCoreLink.GetTextLangNoAmp(163);// Cancel
   btnCancel.Caption := DMTCCoreLink.GetTextLangNoAmp(168);// Open
   AProperties.caption := DMTCCoreLink.GetTextLangNoAmp(534);
   ABrowse.caption := DMTCCoreLink.GetTextLangNoAmp(854);// properties
   APurgeList.caption:= DMTCCoreLink.GetTextLangNoAmp(1052);
   AAdd.caption:= DMTCCoreLink.GetTextLangNoAmp(292);// add
   Purgeinvalide1.Caption := DMTCCoreLink.GetTextLangNoAmp(3263);
   Purgenonlocal1.Caption := DMTCCoreLink.GetTextLangNoAmp(3424);

   Findasetofbooks1.Caption := DMTCCoreLink.GetTextLangNoAmp(2109);
   Createanewsetofbooks1.Caption := DMTCCoreLink.GetTextLangNoAmp(2065);

   i := TheGlobalDataObject.Books.Count ;

  cbAutoOpen.Caption := DMTCCoreLink.GetTextLang(3125);

  LastOpenName := ReadT3IniFile('LASTOPEN','lastdir',TDMTCCoreLink.GetLocalBaseDir) ;

  if FileExists(ExtractFilePath(Application.ExeName) + 'gds32.dll') then
   if LastOpenName <> TDMTCCoreLink.GetLocalBaseDir then
     if not RunPluginOpenBooks then
      TheGlobalDataObject.Books.SwitchOrgStart(LastOpenName,TDMTCCoreLink.GetLocalBaseDir);

  WriteT3IniFile('LASTOPEN','lastdir',TDMTCCoreLink.GetLocalBaseDir);


  if not RunPluginOpenBooks then
  begin
  TheGlobalDataObject.Books.ScannBooksDir(IncludeTrailingPathDelimiter(TDMTCCoreLink.GetLocalBaseDir+'books')) ;

  if i <> TheGlobalDataObject.Books.Count then
     TheGlobalDataObject.Save ;
  end;   
  DeleteAllFiles(ExtractFilePath(Application.Exename)+'\tmp');
  Look:='';
  ButtonPanel.Color := MainPanelColor;
  aMax:=1;
  GlobalSetOfBooksToDataSet(CDBooks);


  if CDBooks.RecordCount = 0 then
  begin
    OSFMessageDlg(GetTextLang(471){You have not set up a set of books yet}, mtError, [mbOK], 0);
    btnCancelClick(Sender);
  end
  else
    // no focums if it comes from the Wizzard to refresh list.
     if Sender <> nil then
       cxGrid1.SetFocus;
 // done : Pieter Last open set of books is best kept in ini file.
 LastOpenName :=  TDatabaseRegistyRoutines.ReadRegValue('AUTOLOGIN','BOOKNAME') ; // ReadT3IniFile('LASTOPEN','BOOKNAME','');

 if LastOpenName <> ''  then
   CDBooks.Locate('BookName',LastOpenName,[]);
  fmOpenASetOfBooks.KeyPreview := true;

 DMTCCoreLink.LoadImage(BtnOpen.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 if FileExists(ExtractFilePath(Application.ExeName)+'plug_ins\Openbooks.tpd') then
      TDoOpen.Enabled := true ;


    bbrowse.Action :=  ABrowse;
    BPurge.Action :=  APurgeList;
    bprop.Action :=  AProperties;
    badd.Action :=  AAdd;
end;


procedure TfmOpenASetOfBooks.btnOpenClick(Sender: TObject);
Var
  aid:Integer;

begin
 if (LoginResult <> 0) and (LoginResult <> mrOk ) then exit ;
 aid := CDBooksID.AsInteger ;
  cdBooks.DisableControls ;
  try
 TheGlobalDataObject.Books.DeselectBooks ;
 TheGlobalDataObject.Books.Selected[aid]:=true;


 if JustPick then
   begin
    modalresult := mrok ;
    Exit ;
   end;
  TheGlobalDataObject.Books.SetActive(aid);

  OpenGlobalSelected  ;

  ModalResult := mrOk ;
  finally
     cdBooks.EnableControls ;
  end;
end;


procedure TfmOpenASetOfBooks.btnCancelClick(Sender: TObject);
begin
  Close;
end;

Procedure TfmOpenASetOfBooks.FormKeyPress(Sender: TObject; var Key: Char);
var
   result : boolean;
   IRec:Integer;
begin

  //If the user pushes [enter] do a OK button
  if Key = #13 then
  begin
    btnOpenClick(Sender);
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
  if key = #8 then
    begin
      if Look <> '' then
         delete(Look,length(Look),1);
      Key := #0 ;
    end;
  If Key<>#0 then
  begin
   Look:=Look+Key;
   Key := #0 ;
   If not CDBooks.Locate('Bookname',Look,[LoPartialkey,LoCaseInsensitive])  then
       Look:=''
  end;
  if key = ' ' then
  begin
    Key := #0;
    btnOpenClick(Sender);
  end;
  LLook.Caption := Look ;
end;

procedure TfmOpenASetOfBooks.OpenPropertiesClick(Sender: TObject);
begin
  TheGlobalDataObject.Books.DeselectBooks ;
  TheGlobalDataObject.Books.Selected[CDBooksID.AsInteger] := true;;
  fmChangeBooksProperties := TfmChangeBooksProperties.Create(self);
  try
  SetUpForm(fmChangeBooksProperties);
  if fmChangeBooksProperties.ShowModal = mrok then
     begin
        GlobalSetOfBooksToDataSet(CDBooks);
        TheGlobalDataObject.Save ;
     end;
  finally
  FreeAndNil(fmChangeBooksProperties);
  end;
 GlobalSetOfBooksToDataSet(CDBooks);
end;

procedure TfmOpenASetOfBooks.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmOpenASetOfBooks.KeyPreview := false;
  TDatabaseRegistyRoutines.WriteRegValue('AUTOLOGIN','LASTOPEN',uppercase(booltoStr(cbAutoOpen.checked,true)));

end;

procedure TfmOpenASetOfBooks.FormCreate(Sender: TObject);
begin
    cbAutoOpen.Checked := TDatabaseRegistyRoutines.ReadRegValue('AUTOLOGIN','LASTOPEN') = 'TRUE' ;
end;

procedure TfmOpenASetOfBooks.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = 112 then begin
  HtmlShowTopic(152);
  key := 0;
 end;
end;

procedure TfmOpenASetOfBooks.BtnBrowseClick(Sender: TObject);
Var
  i,K:integer;
begin
  ReturnLookup := ApplicationPath;
  ReturnLookup:=ExcludeTrailingPathDelimiter(ReturnLookup);
  if not CDBooks.IsEmpty then
   ReturnLookup := ExtractFilePath(CDBooksDatabase.AsString) ;

  if filectrl.SelectDIrectory(gettextlang(2109),'' ,ReturnLookup) then
  begin
  ReturnLookup:=UpperCase(ReturnLookup);
  if  TheGlobalDataObject.Books.FindBooksByPath(ReturnLookup+'\Books.fdb') = nil  then
    if FileExists(ReturnLookup+'\Books.fdb') then
    with TheGlobalDataObject.Books.Add as TBooksCollectionItem do
    begin
    UserName := 'sysdba';
    Password := 'masterkey';
    Database :=  ReturnLookup+'\Books.fdb' ;
    While pos('\',ReturnLookup)>0 do
      Delete(ReturnLookup,1,pos('\',ReturnLookup));
    // Remove Path Part
    Name :=  ReturnLookup;
    TheGlobalDataObject.Save;
  end;
 While pos('\',ReturnLookup)>0 do
  Delete(ReturnLookup,1,pos('\',ReturnLookup));
 GlobalSetOfBooksToDataSet(CDBooks);
 CDBooks.Locate('bookname',ReturnLookup,[]);
 end;
end;



procedure TfmOpenASetOfBooks.OpenGlobalSelected;
var
 Tryes,Isopen : Integer ;

begin
  if TheGlobalDataObject.Books.SelectedBooks = nil then exit ;
  Screen.Cursor := crHourGlass ;
  try


  WriteT3IniFile('LASTOPEN','BOOKNAME',TheGlobalDataObject.Books.SelectedBooks.Name);
  TDatabaseRegistyRoutines.WriteRegValue('AUTOLOGIN','BOOKNAME',TheGlobalDataObject.Books.SelectedBooks.Name);

  if TheGlobalDataObject.Books.SelectedBooks.Name <> '' then
  begin
    CloseSetOfBooks;
    TheGlobalDataObject.Books.SetActive(CDBooksID.AsInteger);
    Tryes:=1;
    Repeat
      Isopen:= OpenBooks(False);
      Inc(Tryes);
    Until (Tryes>3) OR (Isopen=0) or (Isopen=2103) or (Isopen=2104)or (Isopen=2102);
    if Isopen <> 0 then  CloseSetOfBooks;
    Close;
  end;
  finally
  Screen.Cursor := crDefault ;
  end;

end;

procedure TfmOpenASetOfBooks.ButtonPanelDblClick(Sender: TObject);
begin
dmdatabase.ZMainconnection.Connected := true ;

end;

procedure TfmOpenASetOfBooks.Purgeinvalide1Click(Sender: TObject);
begin

 CDBooks.IndexFieldNames :=  'ID desc' ;



  CDBooks.First ;
  while not CDBooks.Eof do
   begin
   if (CDBooksServer.AsString = '') and  not FileExists(CDBooksDatabase.AsString) then
      begin
         TheGlobalDataObject.Books.Delete(CDBooksID.AsInteger);
      end ;
      CDBooks.Next ;
   end;
   TheGlobalDataObject.Save;
   GlobalSetOfBooksToDataSet(CDBooks);
end;

procedure TfmOpenASetOfBooks.TDoOpenTimer(Sender: TObject);
begin
 TDoOpen.Enabled := false ;
 btnOpenClick(self) ;
end;

procedure TfmOpenASetOfBooks.Purgenonlocal1Click(Sender: TObject);
begin

  CDBooks.IndexFieldNames :=   'ID CIS' ;



  CDBooks.first ;
  while not CDBooks.eof do
   begin
   if  not FileExists(CDBooksDatabase.AsString) then
      begin
         TheGlobalDataObject.Books.Delete(CDBooksID.AsInteger);
      end ;
      CDBooks.next ;
   end;
   TheGlobalDataObject.Save;
   GlobalSetOfBooksToDataSet(CDBooks);
end;

procedure TfmOpenASetOfBooks.Createanewsetofbooks1Click(Sender: TObject);
begin
 ModalResult := mrYesToAll ;
end;

procedure TfmOpenASetOfBooks.Findasetofbooks1Click(Sender: TObject);
begin
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
  GlobalSetOfBooksToDataSet(CDBooks);
  CDBooks.Locate('bookname',fmChangeBooksProperties.EDisplayname.Text,[]);
  finally
  FreeAndNil(fmChangeBooksProperties);
  end;
end;

procedure TfmOpenASetOfBooks.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

 Function BooksInT3folder:Boolean;
  Var
    aTest:String;
  begin
  
    aTest:=LowerCase(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1database.Index]));
    Result := Pos(LowerCase(ApplicationPath),aTest)=1;
  end;
begin
  ACanvas.Font.Style :=[] ;


  if GetDrvType(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1database.Index]))=4 then
    ACanvas.Font.Style :=[ fsBold]
  else
  if Not BooksInT3folder then begin
    ACanvas.Font.Color:=clBlue;
    ACanvas.Font.Style :=[ fsBold]
  end;
  if VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1server.Index]) <> '' then
   begin
    ACanvas.Font.Color:=clNavy;
    ACanvas.Font.Style :=[ fsBold]
  end else
  if not FileExists(VarToStr(AViewInfo.RecordViewInfo.GridRecord.Values[cxGrid1DBTableView1database.Index])) then
      begin
       ACanvas.Font.Color:=clRed;
       ACanvas.Font.Style :=[ fsBold]
      end;
  if ((AViewInfo.RecordViewInfo.Selected) or (AViewInfo.RecordViewInfo.Focused))then
  if (ACanvas.Font.Color =clNavy) or (ACanvas.Font.Color = clBlue) then ACanvas.Font.Color := clwhite ;
end;


procedure TfmOpenASetOfBooks.ABrowseExecute(Sender: TObject);
begin
    BtnBrowseClick(self);
end;

procedure TfmOpenASetOfBooks.APurgeListExecute(Sender: TObject);
begin
   // done : pieter check if empty
  if CDBooks.IsEmpty then exit ;
  if OSFMessageDlg(gettextlang(519),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;
   TheGlobalDataObject.Books.Delete(CDBooksID.AsInteger);
   TheGlobalDataObject.Save;
   GlobalSetOfBooksToDataSet(CDBooks);

end;

procedure TfmOpenASetOfBooks.APropertiesExecute(Sender: TObject);
begin
  OpenPropertiesClick(self);
end;

procedure TfmOpenASetOfBooks.AAddExecute(Sender: TObject);
begin

  pmoptions.Popup(mouse.CursorPos.X,mouse.CursorPos.y);
end;

end.


