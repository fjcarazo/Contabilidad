(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit NewProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, StdCtrls;

type
  TfmNewProgress = class(TForm)
    lblCount: TLabel;
    Gauge1: TGauge;
    tcxTitle: TLabel;
    tcxShape: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Image1: TImage;
    SSubbar: TShape;
    GSubbar: TGauge;
    BtnStop: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnStopClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    CanNowClose:boolean ;
    LastRefresh : Cardinal ;
    Steps,Step:Byte;
    OfText : String ;
    bStop: Boolean;
    procedure initProgress(aText:String;aMax:Integer);
    Procedure SetProgress(aText:String;aPosition:Integer);
    Procedure InitSubProgress(aText:String;aMax:Integer);
    Procedure SetSubProgress(aPosition:Integer);
    procedure CloseProgress;
    Procedure  SetSubText(aText:string);
    Procedure  SetProgressCount(aPosition:Integer);
    Function   GetProgessMax:Integer;
    Function   GetProgress:Integer;
    Function   GetProgressMsg:String;
    Function   GetProgressSubMsg:String;
  end;




implementation

{$R *.dfm}
 uses   TcashClasses, UDMTCCoreLink, Math;



procedure TfmNewProgress.CloseProgress;
begin
CanNowClose := true ;
close ;
end;

procedure TfmNewProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lblCount.Caption:='';
  Label1.Caption:='';
  Gauge1.Progress:=0;
 // Action:=caFree;
 SSubbar.Visible := false ;
 GSubbar.Visible := false ;
end;

procedure TfmNewProgress.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=CanNowClose or ((GetTickCount - LastRefresh) > 1300);
end;

procedure TfmNewProgress.FormShow(Sender: TObject);
begin
tcxTitle.Caption := DMTCCoreLink.gettextlang(2030);
Caption := DMTCCoreLink.gettextlang(2031);
OfText := DMTCCoreLink.gettextlang(2032);
end;

function TfmNewProgress.GetProgessMax: Integer;
begin
  Result := 0;
  if Visible then
    Result := Gauge1.MaxValue;
end;

function TfmNewProgress.GetProgress: Integer;
begin
  Result := 0;
  if Visible then
    Result := Gauge1.Progress;

end;

function TfmNewProgress.GetProgressMsg: String;
begin
  if Visible then
    Result := lblCount.Caption
  else
    Result :='';
end;

function TfmNewProgress.GetProgressSubMsg: String;
begin
  if Visible then
    Result := Label1.Caption
  else
    Result :='';

end;

procedure TfmNewProgress.initProgress(aText: String; aMax: Integer);
begin
  bStop := false ;
   lblCount.Caption := aText;
   lblCount.Repaint ;

   Gauge1.Progress := 0 ;
   if aMax>=0 then
    Gauge1.MaxValue:=aMax;
   self.Show ;
   Application.ProcessMessages ;
end;

procedure TfmNewProgress.InitSubProgress(aText: String; aMax: Integer);
begin
 SSubbar.Visible := True ;
 GSubbar.Visible := True ;
 GSubbar.MaxValue := aMax ;
 GSubbar.MinValue := 0 ;
 GSubbar.Progress := 0 ;
end;

procedure TfmNewProgress.SetProgress(aText: String; aPosition: Integer);
begin
   if (aPosition > Gauge1.MaxValue) then
      aPosition := Gauge1.MaxValue  ;
   if (aPosition < Gauge1.MinValue) then
       aPosition := Gauge1.MinValue ;





   if aText <> '' then
   begin
   lblCount.Caption := aText;
   end else
   lblCount.caption := IntToStr(Gauge1.Progress)+' / ' + IntToStr(Gauge1.MaxValue);
   lblCount.Repaint ;

    if (Gauge1.MaxValue < 1 ) then exit ;
  if self.Visible and BtnStop.visible then
    Application.processmessages ;

   Gauge1.Progress := aPosition ;
   Gauge1.Repaint ;
   // BringToFront ;
end;

procedure TfmNewProgress.SetProgressCount(aPosition: Integer);
begin
  SetProgress(IntToStr(aPosition)+' '+  OfText +' '+ IntToStr(Gauge1.MaxValue) ,aPosition);
end;

procedure TfmNewProgress.SetSubProgress(aPosition: Integer);
begin
 GSubbar.Progress := aPosition ;
end;

procedure TfmNewProgress.SetSubText(aText: string);
begin
  Label1.Caption:=aText;
  Label1.Repaint;
end;

procedure TfmNewProgress.FormCreate(Sender: TObject);
begin
   SetWindowLong(Handle, gwl_ExStyle, GetWindowLong(Handle, gwl_ExStyle) or WS_EX_APPWINDOW);
end;

procedure TfmNewProgress.BtnStopClick(Sender: TObject);
begin
 BStop := true ;
end;

end.
