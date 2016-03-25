unit DataImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,shellapi;

type
  TfmDataImport = class(TForm)
    tcxShape: TShape;
    tcxTitle: TLabel;
    Notebook1: TNotebook;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    cbDataType: TComboBox;
    Label4: TLabel;
    cbFileFormat: TComboBox;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edtfile1: TEdit;
    edtfile2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    Image1: TImage;
    Label8: TLabel;
    CpDir: TLabel;
    BtnPrior: TBitBtn;
    BtnNext: TBitBtn;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnNextClick(Sender: TObject);
    procedure BtnPriorClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    Function ValidateDocFiles:Boolean;
    Function ValidateExt(FileName:String; Var ext:String):Boolean;
    Procedure FixDataType(Ext:String);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    Procedure NextPage(List:Integer);
    Procedure PriorPage(List:Integer);
    Procedure MovePage(List:Integer;Up:Boolean=True);
    Procedure CheckPage(List:integer);
    Procedure InitTypes;
    Procedure GetFileName(Var FileName,adir: String);
  public
    { Public declarations }
  end;

var
  fmDataImport: TfmDataImport;

Procedure ShowDataImport;

implementation

{$R *.dfm}
uses ExchangeTCData, GlobalFunctions, Main, Database, TcVariables,
  DatabaseAccess, XRoutines, UImportCheck, UDMTCCoreLink;


Var
  sLog:String ;

Procedure ShowDataImport;
begin
  ImportCheck  := TImportCheck.create(nil);
  try
    fmDataImport := TfmDataImport.Create(nil);
    try
     SetupForm(fmDataImport);
     fmDataImport.Notebook1.PageIndex:=0;
     fmDataImport.InitTypes;
     fmDataImport.ShowModal;
    finally
     FreeAndNil(fmDataImport);
    end;
 finally
  FreeAndNil(ImportCheck);
 end;

end;

Function FullFileName(Filename:string):String;
Var
  aDir : String;
begin
  adir := fmDataImport.CpDir.Caption;
  Result := IncludeTrailingPathdelimiter(adir)+ fileName;
end;

Procedure TfmDataImport.GetFileName(Var FileName,adir: String);
Var
  Fext:string;
begin
  ValidateExt(FileName,Fext);
  FixDataType(FExt);
  FmMain.OpenDialog.InitialDir:= aDir;
  FmMain.OpenDialog.FileName:= FileName;
  Case cbFileFormat.ItemIndex of
  1: FmMain.OpenDialog.Filter:= 'Xml Database (*.Xml)|*.Xml';
  2: FmMain.OpenDialog.Filter:= 'Lotus SpreadSheet (*.Wk1) |*.Wk1';
  3: FmMain.OpenDialog.Filter:= 'Any text file|*.*';
  4: FmMain.OpenDialog.Filter:= 'Any text file|*.*';
  else
    FmMain.OpenDialog.Filter:= 'TurboCash exchange file (*.txf)|*.txf|Any text file|*.*';
  end;
  FmMain.OpenDialog.FilterIndex:= cbFileFormat.itemIndex;
  FmMain.OpenDialog.DefaultExt:=Fext;
  if Trim(adir)='' then
    adir := TDMTCCoreLink.GetLocalBaseDir;
  if FmMain.OpenDialog.Execute then
  begin
    fileName := ExtractFileName(FmMain.OpenDialog.FileName);
    adir := ExtractFilePath(FmMain.OpenDialog.FileName);
    Fext := ExtractFileExt(FileName);
    FixDataType(FExt);
  end;

end;

procedure TfmDataImport.BitBtn1Click(Sender: TObject);
Var
  tmpf,tmpd:String;
begin
  tmpf:=edtfile1.Text;
  tmpd:= CpDir.Caption;
  GetFileName(tmpf,tmpd);
  edtfile1.Text:=tmpf;
  CpDir.Caption:=tmpd;
end;



Procedure TfmDataImport.PriorPage(List:Integer);
Var
  Curr:integer;
begin
  Curr := Notebook1.PageIndex;
  BtnPrior.Enabled:= Curr>0;
  if Curr<=0 then exit;
//  Case List of  {Documents}
//  0:Notebook1.PageIndex := Curr - 1 ;
//  end;
  Notebook1.PageIndex := Curr - 1 ;
end;

Procedure TfmDataImport.CheckPage(List:integer);
begin
  Case List of
  0: begin {Documents}
        if Notebook1.PageIndex=1 then
        begin
          Label6.Visible := True;
          Label5.Caption := 'Headers';
          edtfile2.Visible := True;
          BitBtn2.Visible := True;
          if cbFileFormat.ItemIndex=0 then
          begin
            Label5.Caption := 'Data';
            edtfile2.Visible := False;
            BitBtn2.Visible := False;
            Label6.Visible := False;
          end;
        end
        else if Notebook1.PageIndex=2 then
        begin
          BtnNext.Enabled:= False;
        end
     end;
  else
    if Notebook1.PageIndex=1 then
    begin
      Label6.Visible := True;
      Label5.Caption := 'Data';
      edtfile2.Visible := False;
      BitBtn2.Visible := False;
      Label6.Visible := False;
    end
    else if Notebook1.PageIndex=2 then
    begin
      BtnNext.Enabled:= False;
    end
  end;
end;

Procedure TfmDataImport.NextPage(List:Integer);
Var
  Curr:integer;
begin
  Curr := Notebook1.PageIndex;
//  Case List of  {Documents}
//  0: Notebook1.PageIndex := Curr + 1 ;
//  end;
 Notebook1.PageIndex := Curr + 1 ;
end;

Procedure TfmDataImport.MovePage(List:Integer;Up:Boolean=True);
begin
  if List<=0 then List :=0;
  if Up then
    NextPage(List)
  else
    PriorPage(List);
  if Not BtnPrior.Enabled then
   BtnNext.Enabled:=True;
  CheckPage(List);
  if Notebook1.PageIndex<=0 then
    BtnPrior.Enabled:=False;
end;

procedure TfmDataImport.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDataImport.BtnNextClick(Sender: TObject);
begin
  MovePage(cbDataType.ItemIndex);
  BtnPrior.Enabled := True;
end;

procedure TfmDataImport.BtnPriorClick(Sender: TObject);
begin
  MovePage(cbDataType.ItemIndex,False);
  BtnNext.Enabled := True;
end;

Procedure TfmDataImport.InitTypes;
begin
  cbDataType.Items.Clear;
  cbDataType.Items.Add(gettextlang(1998));
  cbDataType.Items.Add(gettextlang(2001));
  cbDataType.Items.Add(gettextlang(2000)+'/'+gettextlang(2002));
  cbDataType.Items.Add(Gettextlang(1999));

  cbDataType.ItemIndex:=0;

  cpDir.caption := ReadLongSysparam('SImportPath',CurrentUser);
  edtfile2.Text := ReadReportOp('SImportLine').AsString;
  edtfile1.Text := ReadReportOp('SImportHead').AsString;
//  WriteReportOp('SImportLog', 'ImporLog');
  cbDataType.ItemIndex := ReadReportOp('WImportDataType',0).AsInteger;
  cbFileFormat.ItemIndex := ReadReportOp('WImportformat',0).AsInteger;
end;

Function TfmDataImport.ValidateExt(FileName:String; Var ext:String):Boolean;
begin
  ext := ExtractFileExt(FileName);
  if (ext='') and (filename<>'') then
  case cbFileFormat.ItemIndex of
  0 : ext:='.txf';
  1 : ext:='.xml';
  2 : ext:='.wk1';
  4 : ext:='';
  5 : ext:='';
  end;
  Result := sametext(ext,'.txf') or (ext='') or (ext='.wk1') or (ext='.xml');
end;

Function TfmDataImport.ValidateDocFiles:Boolean;
Var
  ext1,ext2:String;
begin
  Result := ValidateExt(edtfile1.text,ext1);
  Result := Result AND ValidateExt(edtfile2.text,ext2);
  Case cbFileFormat.ItemIndex of
  0:begin {Txf File format}
      if (ext1<>'.txf') then
        FixDataType(ext1);
    end;
  end;
end;

Procedure TfmDataImport.FixDataType(Ext:String);
begin
Exit;
  if sameText(ext,'.wk1') then
    cbFileFormat.ItemIndex:=2
  else if sameText(ext,'.xml') then
    cbFileFormat.ItemIndex:=1
  else
    if  cbFileFormat.ItemIndex < 4 then
    cbFileFormat.ItemIndex:=0
end;

procedure TfmDataImport.BtnOkClick(Sender: TObject);
Var
  aResult : Integer;
begin
 try
  Try
    aResult:=100;
    LastErrMsg := '' ;
    Case cbDataType.ItemIndex of
    0:begin {Import documents}
       //if not ValidateDocFiles then
        //  OSFMessageDlg('Invalid file format' , mterror, [mbok], 0);
       Case cbFileFormat.ItemIndex of
       1:  aResult:= ImportXmlDocs(FullFileName(edtfile1.text),FullFileName(edtfile2.text),sLog);
       2:OSFMessageDlg(DMTCCoreLink.GetTextLang(3082){'file format Import Not Implemented' }, mterror, [mbok], 0);
       else
         begin
          aResult:= ReadTxfFromFile(FullFileName(edtfile1.text),false);
          if aResult = 0 then
           if FileExists(ChangeFileExt(FullFileName(edtfile1.text),'doc' + ExtractFileExt(FullFileName(edtfile1.text)))) then
             aResult:= ReadTxfFromFile(ChangeFileExt(FullFileName(edtfile1.text),'doc' + ExtractFileExt(FullFileName(edtfile1.text))),false);


         end;
       end;
      end;
     1: Begin
       Case cbFileFormat.ItemIndex of
       1: aResult := ImportFileAccounts(FullFileName(edtfile1.text),True,sLog);
       // done Wk1 is supported ?
       2: aResult := ImportFileAccounts(FullFileName(edtfile1.text),True,sLog);
       3 :  aResult := ImportDtCtAndAccountsFromTextFile(FullFileName(edtfile1.text),',',true,false,sLog);
       4 :  aResult := ImportDtCtAndAccountsFromTextFile(FullFileName(edtfile1.text),ListSeparator,true,false,sLog);
       5 :  aResult := ImportDtCtAndAccountsFromTextFile(FullFileName(edtfile1.text),#9,true,false,sLog);
       else
         aResult := ReadTxfFromFile(FullFileName(edtfile1.text),false);
       end;                             
     end;
     2: Begin  // Debit / creditor
       Case cbFileFormat.ItemIndex of
       1: aResult:=ImportDtCt(FullFileName(edtfile1.text),True,sLog);
       2: aResult:=ImportDtCt(FullFileName(edtfile1.text),True,sLog); //OSFMessageDlg('file format Import Not Implemented' , mterror, [mbok], 0);
       3 :  aResult := ImportDtCtAndAccountsFromTextFile(FullFileName(edtfile1.text),',',true,true,sLog);
       4 :  aResult := ImportDtCtAndAccountsFromTextFile(FullFileName(edtfile1.text),ListSeparator,true,true,sLog);
       5 :  aResult := ImportDtCtAndAccountsFromTextFile(FullFileName(edtfile1.text),#9,true,true,sLog);
       else
         aResult := ReadTxfFromFile(FullFileName(edtfile1.text),false);
       end;
     end;
     3: Begin // stock
       Case cbFileFormat.ItemIndex of
       1 :  aResult := ImportXmlStock(FullFileName(edtfile1.text),sLog);
       2 :  aResult := ImportWkxSTock(FullFileName(edtfile1.text),sLog);
       3 :  aResult := ImportTextStock(FullFileName(edtfile1.text),sLog,',');
       4 :  aResult := ImportTextStock(FullFileName(edtfile1.text),sLog,ListSeparator);
       5 :  aResult := ImportTextStock(FullFileName(edtfile1.text),sLog,#9);
       else
         aResult := ReadTxfFromFile(FullFileName(edtfile1.text),false);
       end;
     end;
    end;
  except
   on e : Exception do
     begin
     LastErrMsg := trim(LastErrMsg + '  ' + e.Message) ;
     aResult := 3 ;
     end;
  end;
  if aResult = 0 then
    //OSFMessageDlg(IntToStr(RecImported)+' Record(s) imported', mtinformation, [mbok], 0)
     OSFMessageDlg(gettextlang(2022), mtinformation, [mbok], 0)
  else
    //OSFMessageDlg(GetTExtLang(1412), mtError, [mbok], 0);
    ShowErrMsg(aResult);
    finally
  SetProgress(-2);
   end;
  WriteLongSysParam('SImportPath', cpDir.caption,CurrentUser);
  WriteReportOp('SImportLine', edtfile2.Text );
  WriteReportOp('SImportHead', edtfile1.Text );
  WriteReportOp('SImportLog', sLog);
  WriteReportOp('WImportDataType',IntToStr(cbDataType.ItemIndex));
  WriteReportOp('WImportformat',IntToStr(cbFileFormat.ItemIndex));
end;

procedure TfmDataImport.BitBtn2Click(Sender: TObject);
Var
  tmpf,tmpd:String;
begin
  tmpf:=edtfile1.Text;
  tmpd:= CpDir.Caption;
  GetFileName(tmpf,tmpd);
  edtfile2.Text:=tmpf;
  CpDir.Caption:=tmpd;
end;

procedure TfmDataImport.FormShow(Sender: TObject);
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');

  sLog:= ApplicationPath +'Import.log';
  GroupBox1.Caption := gettextlang(2015);
  BtnOk.Caption := gettextlang(2014);
  Label5.Caption := gettextlang(2016);
  Label6.Caption := gettextlang(2017);
  Label8.Caption := gettextlang(2018);
  tcxTitle.Caption := gettextlang(2020);
  BitBtn3.Caption := gettextlang(2019);
  Caption := gettextlang(2021);
  Label2.Caption := gettextlang(2025);
  Label3.Caption := gettextlang(2026);
  Label4.Caption := gettextlang(2027);
  Label7.Caption := gettextlang(2028);

  BtnCancel.Caption := gettextlang(828); // close
end;

procedure TfmDataImport.BitBtn3Click(Sender: TObject);
var
url : String ;
begin
url :=  CpDir.Caption +  edtfile1.Text ;
ShellExecute(Handle, 'open', Pchar(url   ), nil, nil, SW_SHOW);
end;

end.

