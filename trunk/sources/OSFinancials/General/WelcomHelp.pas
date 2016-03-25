(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)

unit WelcomHelp;


interface

uses
  SysUtils,Messages, WinTypes, WinProcs,  Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls,OleCtrls,  SHDocVw, StdCtrls,ActiveX;

type
  TFrmWelcome = class(TForm)
    cbhide: TCheckBox;
    stDisable: TStaticText;
    GetUrlTimer: TTimer;
    WebBrowser1: TWebBrowser;


    procedure GetUrlTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    oldOnMessage : TMessageEvent ;
    FOleInPlaceActiveObject: IOleInPlaceActiveObject;
    procedure MsgHandler(var Msg: TMsg; var Handled: Boolean);

    { Private declarations }
  public
    { Public declarations }
  end;
 

implementation

uses UDMTCCoreLink, OSFGeneralRoutines;


{$R *.DFM}


procedure TFrmWelcome.FormCreate(Sender: TObject);
begin
oldOnMessage := Application.OnMessage ;
Application.OnMessage := MsgHandler;
end;

procedure TFrmWelcome.FormDestroy(Sender: TObject);
begin
 FOleInPlaceActiveObject := nil;
end;

procedure TFrmWelcome.FormShow(Sender: TObject);
begin
self.Caption := DMTCCoreLink.GetTextLangNoAmp( 3123);
end;

procedure TFrmWelcome.GetUrlTimerTimer(Sender: TObject);
var
s: String ;
verm,vermn,verlow,verb,alturl : String ;
begin
GetUrlTimer.Enabled := false ;
verb := TDatabaseRegistyRoutines.GetAppValue('FileVersion') ;
verm := copy(verb,1,pos('.',verb)-1);
delete(verb,1,pos('.',verb));

vermn := copy(verb,1,pos('.',verb)-1);
delete(verb,1,pos('.',verb));
verlow := copy(verb,1,pos('.',verb)-1);
delete(verb,1,pos('.',verb));



 s := '' ;
 if  DMTCCoreLink.TheGlobalDataObject.Languages.ActiveLanguage <> nil then

 s  := LowerCase(DMTCCoreLink.TheGlobalDataObject.Languages.ActiveLanguage.Name);
 if s= '' then
 s := 'english' ;
 s := '?id=' + DMTCCoreLink.TheGlobalDataObject.Registration.SerialNumber + '&version1='+ verm+
  '&version2='+ vermn+
  '&version3='+ verlow+
  '&version4='+ verb+ '&cls='+IntToStr(DMTCCoreLink.TheGlobalDataObject.Books.Count)+ '&lang=' +s +'&action=news' ;
 alturl := TDatabaseRegistyRoutines.ReadOsfIni('PROXY','loadhtml','');
 if (alturl <> '') then
  begin
    alturl := TDataBaseStringRoutines.ReplaceTag(alturl,'APPPATH',ExtractFilePath(Application.ExeName),'%')  ;
    WebBrowser1.Navigate(alturl)
  end else
  begin
     if TDatabaseRegistyRoutines.GetAppValue('BASETYPE') = '1'  then
      WebBrowser1.Navigate('http://www.turbocashlive.com')
     else
   //WebBrowser1.Navigate('http://www.osfshop.com/osf_welcome.php'+s);
  // WebBrowser1.Navigate('http://127.0.0.1:8080/register.php'+s);
   WebBrowser1.Navigate('http://online1.osfinancials.org:8080/register.php'+s);
  end;
end;
procedure TFrmWelcome.MsgHandler(var Msg: TMsg; var Handled: Boolean);
const
  StdKeys = [VK_BACK, VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT];
var IOIPAO: IOleInPlaceActiveObject;
  Dispatch: IDispatch;
begin
  if assigned(oldOnMessage) then
        oldOnMessage(Msg,Handled);
  if WebBrowser1 = nil then
  begin
    Handled := False;
    Exit;
  end;
  Handled := (IsDialogMessage(WebBrowser1.Handle, Msg) = True);
  if (Handled) and (not WebBrowser1.Busy) then
  begin
    if FOleInPlaceActiveObject = nil then
    begin
      Dispatch := WebBrowser1.Application;
      if Dispatch <> nil then
      begin
        Dispatch.QueryInterface(IOleInPlaceActiveObject, IOIPAO);
        if IOIPAO <> nil then FOleInPlaceActiveObject := IOIPAO;
      end;
    end;
    if FOleInPlaceActiveObject <> nil then
      if ((Msg.message = WM_KEYDOWN) or (Msg.message = WM_KEYUP)) and
        (Msg.wParam in StdKeys) then
        //nothing  -  do not pass on Backspace, Left, Right, Up, Down arrows
      else FOleInPlaceActiveObject.TranslateAccelerator(Msg);
  end;
end;

initialization
  OleInitialize(nil);

finalization
  OleUninitialize
end.
