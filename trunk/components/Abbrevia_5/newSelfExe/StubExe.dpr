program StubExe;

uses
  Forms,
  UShowProperties in 'UShowProperties.pas' {Form2},
  AbArcTyp,
  AbUnzPrc,
  AbUtils,
  AbZipTyp,
  SysUtils;

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
begin
  AbUnzip(Sender, TAbZipItem(Item), NewName);
end;

{Build this app using the Define "BuildingStub", to keep it smaller!}

var
  ZipArchive : TAbZipArchive;
  Helper : THelper;
begin
  // WriteLn( 'osfinancials Self Extracting Archive' );
  ZipArchive := TAbZipArchive.Create(ParamStr(0),
                                     fmOpenRead or fmShareDenyNone);
  ChDir( ExtractFilePath(ParamStr(0)));
  Helper := THelper.Create;
  try

    ZipArchive.Load;
    if  MessageDlg('Extract',mtConfirmation,mbYesNo,0) = 0 then

    ZipArchive.ExtractHelper := Helper.UnzipProc;
    ZipArchive.ExtractFiles('*.*');
  finally
    Helper.Free;
    ZipArchive.Free;
  end;
end.
//  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
 // Application.CreateForm(TForm2, Form2);
 // Application.Run;
end.
