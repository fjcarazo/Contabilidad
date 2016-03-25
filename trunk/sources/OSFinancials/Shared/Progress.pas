(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, StdCtrls;

type
  TfmProgress = class(TForm)
    lblCount: TLabel;
    Gauge1: TGauge;
    tcxTitle: TLabel;
    tcxShape: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Image1: TImage;
    SSubbar: TShape;
    GSubbar: TGauge;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    CanNowClose:boolean ;
    LastRefresh : Cardinal ;
    Steps,Step:Byte;
    OfText : String ;
  end;

Procedure  _SetProgress(aMax:LongInt);Overload;
Procedure  _SetProgress(aText:String;aPosition:LongInt);Overload;
Procedure  _SetSubProgress(aPosition:LongInt);
Procedure  _InitSubProgress(aText:String;aMax:LongInt);

Procedure  _SetProgress(aMax,Idx:LongInt;Msg,SubMsg:string);Overload;
Procedure  _SetSubText(aText:string);
Procedure  _SetProgressCount(aPosition:Integer);
Function   _GetProgessMax:Integer;
Function   _GetProgress:LongInt;
Function   _GetProgressMsg:String;
Function   _GetProgressSubMsg:String;
procedure  CloseProgressForm ;
// done : Pieter Create when needed
function fmProgress : TfmProgress ;
 var
  BProgressVisible:Boolean = true;

var
  AfmProgress: TfmProgress;

implementation

{$R *.dfm}
 uses DatabaseAccess ;


function fmProgress : TfmProgress ;
begin
   if not assigned(AfmProgress) then
   AfmProgress:= TfmProgress.Create(Application);
   result := AfmProgress ;
end;

Procedure   _SetProgressCount(aPosition:Integer);
begin
  _SetProgress(IntToStr(aPosition)+' '+ fmProgress.OfText +' '+ IntToStr(fmProgress.Gauge1.MaxValue) ,aPosition);
end;

Function   _GetProgessMax:Integer;
begin
  Result := 0;
  if fmProgress.Visible then
    Result := fmProgress.Gauge1.MaxValue;
end;

Function _GetProgress:LongInt;
begin
  Result := 0;
  if fmProgress.Visible then
    Result := fmProgress.Gauge1.Progress;
end;

procedure  CloseProgressForm ;
begin
  //  fmProgress.Visible := False;
    fmProgress.CanNowClose:=True;
    fmProgress.CLose;
end;

Procedure _SetProgress(aMax:LongInt);
begin
  if aMax>=0 then
    fmProgress.Gauge1.MaxValue:=aMax
  else
  begin
   // fmProgress.Visible := False;
    fmProgress.CanNowClose:=True;
    fmProgress.CLose;
  end;
end;

Procedure  _SetProgress(aMax,Idx:LongInt;Msg,SubMsg:string);
begin
  _SetProgress(aMax);
  _SetProgress(Msg,idx);
  _SetSubText(SubMsg);
end;
Procedure  _SetSubProgress(aPosition:LongInt);
begin
 fmProgress.GSubbar.Progress := aPosition ;
end;

Procedure  _InitSubProgress(aText:String;aMax:LongInt);
begin
 fmProgress.SSubbar.Visible := True ;
 fmProgress.GSubbar.Visible := True ;
 fmProgress.GSubbar.MaxValue := aMax ;
 fmProgress.GSubbar.MinValue := 0 ;
 fmProgress.GSubbar.Progress := 0 ;

end;


Procedure _SetProgress(aText:String;aPosition:LongInt);
begin
  if aText<>'' then
  BEGIN
    fmProgress.lblCount.Caption := aText;
   //  fmProgress.lblCount.Repaint;
  END;
  fmProgress.Gauge1.Progress := aPosition;
  if Not fmProgress.Visible then
  begin
    fmProgress.CanNowClose:=False;
    if BProgressVisible then
      fmProgress.Show;
    fmProgress.Update;
  end
  else
  begin
//    fmProgress.Gauge1.Repaint;
//    fmProgress.Bevel2.Repaint;
    //fmProgress.Repaint;
  end;
  fmProgress.BringToFront ;
  // lets refresh on time
  if (GetTickCount - fmProgress.LastRefresh) > 300 then
    begin
     fmProgress.Repaint ;
     fmProgress.LastRefresh := GetTickCount ;
    end;
  // this allows to click on other parts of TC while processing
  // It can generate unexected results.
  // Try a end of year process with this routine on and just click on TC.
  // You will see the gen dataset is closed.
  // This was why and i can imagine more of this problemss
  // Application.ProcessMessages;

end;

procedure TfmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lblCount.Caption:='';
  Label1.Caption:='';
  Gauge1.Progress:=0;
 // Action:=caFree;
 SSubbar.Visible := false ;
 GSubbar.Visible := false ;
end;

Procedure  _SetSubText(aText:string);
begin
  fmProgress.Label1.Caption:=aText;
  fmProgress.Label1.Repaint;
end;

Function   _GetProgressMsg:String;
begin
  if fmProgress.Visible then
    Result := fmProgress.lblCount.Caption
  else
    Result :='';
end;

Function   _GetProgressSubMsg:String;
begin
  if fmProgress.Visible then
    Result := fmProgress.Label1.Caption
  else
    Result :='';
end;


procedure TfmProgress.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=CanNowClose or ((GetTickCount - fmProgress.LastRefresh) > 1300);
end;

procedure TfmProgress.FormShow(Sender: TObject);
begin
tcxTitle.Caption := gettextlang(2030);
Caption := gettextlang(2031);
OfText := gettextlang(2032);
end;

end.
