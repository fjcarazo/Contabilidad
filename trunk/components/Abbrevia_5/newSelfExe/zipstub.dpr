program zipstub;

uses
  Forms,
  UShowProperties in 'UShowProperties.pas' {fmProperties},
  controls,
  dialogs,
  AbArcTyp,
  AbUnzPrc,
  AbUtils,
  AbZipTyp,
  SysUtils,
  UProgress in 'UProgress.pas' {fmProgress};

{$R *.RES}
type
  THelper = class
  public
    procedure UnzipProc(Sender : TObject;
                        Item : TAbArchiveItem;
                        const NewName : string);
  end;

procedure THelper.UnzipProc(Sender : TObject;
                            Item : TAbArchiveItem;
                            const NewName : string);
    var
     Mynewname,TheFullDir : String ;

begin
  Mynewname := IncludeTrailingPathDelimiter(fmProperties.Edit1.Text) +StringReplace( TAbZipItem(Item).FileName,'/','\',[rfReplaceAll])   ;
  TheFullDir := ExtractFilePath(Mynewname);
  if UpperCase(ExtractFileName(Mynewname)) = 'BOOKS.FDB'  then
    begin
       Mynewname := IncludeTrailingPathDelimiter(fmProperties.Edit1.Text) +'BOOKS.FDB' ;
    end else

  ForceDirectories(TheFullDir);

 // ShowMessage(Mynewname );
  AbUnzip(Sender, TAbZipItem(Item),  Mynewname);


  if TAbZipItem(Item).DiskPath <> '' then
    begin


    end;


end;

{Build this app using the Define "BuildingStub", to keep it smaller!}

var
  ZipArchive : TAbZipArchive;
  Helper : THelper;
begin
  // WriteLn( 'osfinancials Self Extracting Archive' );
 //  Application.Initialize;
 // Application.MainFormOnTaskbar := True;

  ZipArchive := TAbZipArchive.Create(ParamStr(0),
                                     fmOpenRead or fmShareDenyNone);
  ChDir( ExtractFilePath(ParamStr(0)));
  Helper := THelper.Create;
  try
     TRY
    ZipArchive.Load;
    fmProperties := TfmProperties.Create(Application);

   // if  MessageDlg('Extract',mtConfirmation,mbYesNo,0) = 0 then
     fmProperties.lCaption.Caption := ExtractFilePath(ParamStr(0)) ;
     //ZipArchive.ZipfileComment ;
     fmProperties.mExtra.Lines.Text := ZipArchive.ZipfileComment ;
     fmProperties.Edit1.Text :=  fmProperties.mExtra.Lines.Values['zipfolder']  ;


     if fmProperties.ShowModal = mrok then
     begin
      fmProgress := TfmProgress.Create(Application);
      ForceDirectories(fmProperties.Edit1.Text);
      ZipArchive.BaseDirectory := fmProperties.Edit1.Text ;
      fmProgress.mExtra.Lines.Text := 'Extracting ' +  fmProperties.mExtra.Lines.Values['name'] ;
      fmProgress.mExtra.Lines.Add('From ' +  fmProperties.mExtra.Lines.Values['zipfolder']) ;
      fmProgress.mExtra.Lines.Add('To ' +   fmProperties.Edit1.Text );
      ZipArchive.OnProgress := fmProgress.onProgress;
        ZipArchive.OnConfirmProcessItem :=fmProgress.DoConfirmProcessItem ;
       fmProgress.show ;
       ZipArchive.ExtractHelper := Helper.UnzipProc;
      ZipArchive.ExtractOptions := [eoCreateDirs];
      ZipArchive.ExtractFiles('*.*');
     end;


     Except
       on e:exception do
        ShowMessage(e.Message);
     END;
  finally
    Helper.Free;
    ZipArchive.Free;
  end;

  {    AbZipKit1.ZipfileComment := 'zipfolder=' + ExtractFilePath(lblFrom.Text) + #13 + #10 +
    'name='  +lvSetofBooks.Selected.Caption + #13 + #10 + 'date=' + FormatDateTime('YYYYMMDD',now)
    + #13 + #10 + 'time=' + FormatDateTime('HHNNSS',now);}
 // Application.Run;
end.
//  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
 // Application.CreateForm(TForm2, Form2);
 // Application.Run;
end.
