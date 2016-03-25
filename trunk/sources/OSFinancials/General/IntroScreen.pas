(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)

unit IntroScreen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Gauges, jpeg;

type
  TfmIntroScreen = class(TForm)
    Gauge: TGauge;
    Timer1: TTimer;
    Label1: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    LastTimer : Integer ;
    { Public declarations }
  end;



implementation

uses TcVariables,XRoutines, About;



{$R *.DFM}

procedure TfmIntroScreen.FormShow(Sender: TObject);
begin
  LastTimer := 0 ;
  Gauge.Color := StrToInt(ReadT3IniFile('INTRO','color',IntToStr(Gauge.Color))) ;
  Gauge.ForeColor := StrToInt(ReadT3IniFile('INTRO','ForeColor',IntToStr(Gauge.ForeColor))) ;
  Gauge.BackColor := StrToInt(ReadT3IniFile('INTRO','BackColor',IntToStr(Gauge.BackColor))) ;
  if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
    begin
     Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
      self.Repaint ;
     Image1.Repaint ;
     self.Width := Image1.Width + 3;
     self.Height := Image1.Height + 25 ;
    end;

end;

procedure TfmIntroScreen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree ;
end;

procedure TfmIntroScreen.Timer1Timer(Sender: TObject);
begin
 LastTimer:=LastTimer + 1 ;
 if LastTimer > 100 then
    self.Close ;
end;

procedure TfmIntroScreen.FormCreate(Sender: TObject);
begin
     Appname := ReadT3IniFile('Current Language','applicationname',  'osfinancials opensource accounting');
     Application.Title :=  Appname ;
     AppVersion := GetApplicationVersion ;
end;

end.
