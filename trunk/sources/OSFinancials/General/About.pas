(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,ShellApi, jpeg;

type
  TfmAbout = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    LDate: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    LblWinVer: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    LblOsUser: TLabel;
    Label5: TLabel;
    ProductName2: TLabel;
    OKButton: TBitBtn;
    SystemInfo: TMemo;
    Memo1: TMemo;
    procedure OKButtonClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    MyValue : STring;
    procedure decodeVersionInfo(PInfo: Pointer;Items: TStrings);
    function parseFileVersion(value: String): String;
    procedure readVersionInfo;
    function GetFileDateTime(AFilename: String): TDatetime;
    { Private declarations }
  public
    { Public declarations }
  end;
Function GetApplicationVersion : String ;
Function GetApplicationDate : String ;

implementation

uses GlobalFunctions, Main,DatabaseAccess, TcVariables, UDMTCCoreLink,
  OSFGeneralRoutines;

{$R *.DFM}
Function GetApplicationDate : String ;
var
  aSearchRec: TSearchRec;
begin
  result := '' ;
  if FindFirst(Application.ExeName, faAnyFile, ASearchRec) = 0 then
  begin
      try
        result := DateToStr(FileDateToDateTime(ASearchRec.Time)) ;
      finally
        FindClose(ASearchRec);
      end;
  end;
end;


Function GetApplicationVersion : String ;
var
  fmAbout: TfmAbout;
begin
// layzey way
  fmAbout := TfmAbout.create(nil);
  try
    result := fmAbout.Version.Caption ;
  finally
     fmAbout.free ;
  end;
end;

function TfmAbout.GetFileDateTime(AFilename: String): TDatetime;
var
  aSearchRec: TSearchRec;
begin
  result := 0 ;
  if FindFirst(Afilename, faAnyFile, ASearchRec) = 0 then
  begin
      try
        result := FileDateToDateTime(ASearchRec.Time) ;
      finally
        FindClose(ASearchRec);
      end;
  end;
end;

procedure TfmAbout.OKButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAbout.Label3Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open', Pchar(Label3.Caption), nil, nil, SW_SHOW);
end;

procedure TfmAbout.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(OKButton.Glyph,'OK');

  ProductName.Caption := TDatabaseRegistyRoutines.ReadOsfIni('Appconfig','Appname','osFinancials')+' ' + TDatabaseRegistyRoutines.GetAppValue('FileVersion');
  Caption := 'About ' + ProductName.Caption ;

  if DMTCCoreLink.SimpleMode > 0  then
    ProductName.Caption := ProductName.Caption +' lite' ;
  ProductName2.Caption := ProductName.Caption ;
  LblWinVer.Caption := GetWinOSName;
  LblOsUser.Caption := CurrentOsUserName;
  Label3.Caption := AppWebName;
  Copyright.Caption := AppCopyright;
  MyValue:='';
  Label5.Caption:='User:';
  if fmMAin.MainStatusBar.Panels[2].Text<>'' then
    Label5.Caption:=fmMAin.MainStatusBar.Panels[2].TExt;
end;

function TfmAbout.parseFileVersion(value: String): String;
var
  i,j: Integer;
begin
  Result:='';
  j:=0;
  for i:=1 to length(value) do
  begin
    if (copy(value,i,1)='.') then
      j:=j+1;
    if j=4 then
      exit
    else
      Result:=Result+(copy(value,i,1));
  end;
end;

procedure TfmAbout.readVersionInfo;
var
  VersionHandle: DWORD;
  VersionSize:   DWORD;
	PVersionInfo:  Pointer;
        aFile : string  ;
begin
  aFile := Application.ExeName ;
  {clear old data}
  SystemInfo.Lines.Clear;
      LDate.Caption :=  DateTimeToStr(GetFileDateTime(aFile)) ;

  VersionSize:=GetFileVersionInfoSize(PChar(aFile),VersionHandle);
  {if 0 then no versioninfo available}
	if VersionSize=0 then begin
             aFile := Version.Caption;
            Delete(aFile,1,pos(' ',afile));
            Version.Caption := gettextlang(2105)+' '+ afile;
            exit;
         end;
  {otherwise allocate memory}
	getMem(PVersionInfo,VersionSize);
	try
    {get version info}
    {assuming filename is valid}
		if GetFileVersionInfo(PChar(aFile),VersionHandle,VersionSize,PVersionInfo) then
      {set version info properties}

			DecodeVersionInfo(PVersionInfo,SystemInfo.Lines);
	finally
    {release memory}
		freeMem(PVersionInfo,VersionSize);
	end;
end; //readVersionInfo

procedure TfmAbout.decodeVersionInfo(PInfo: Pointer;Items: TStrings);
var
  PItem:                                  Pointer;
	ItemLen:                                UInt;
	FixedFileInfo:                          PVSFixedFileInfo;
	VersionSection:                         String;
  TempStr:                                String;

  procedure Add(StrName,StrValue: String);
  begin
    Items.Add(StrName+'='+StrValue);
  end;

begin
 if VerQueryValue(PInfo,'\',Pointer(FixedFileInfo),ItemLen) then
  begin
  	{File Version}
		TempStr:=
            IntToStr(HIWORD(FixedFileInfo^.dwFileVersionMS)) +
			'.' + IntToStr(LOWORD(FixedFileInfo^.dwFileVersionMS)) +
			'.' +	IntToStr(HIWORD(FixedFileInfo^.dwFileVersionLS)) +
			'.' + IntToStr(LOWORD(FixedFileInfo^.dwFileVersionLS));


    TempStr := parseFileVersion(TempStr);


	end{if Valid Root Block of Version Resource}
   else begin
     TempStr := Version.Caption;
     Delete(TempStr,1,pos(TempStr,' '));
   end;
   Version.Caption := gettextlang(2105)+' '+TempStr;
end; //decodeVersionInfo

procedure TfmAbout.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin

             HtmlShowTopic(131);
             key := 0;

        end;
     if Key = 27 then
        begin
             Close;
             key := 0;

        end;

end;

procedure TfmAbout.FormCreate(Sender: TObject);
begin
readVersionInfo ;
end;

end.

