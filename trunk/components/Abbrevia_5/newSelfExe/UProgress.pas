unit UProgress;

interface

uses
  Windows, Messages, SysUtils,  Classes,   Forms,
  Dialogs, ComCtrls,   StdCtrls,  AbArcTyp,
  AbUnzPrc,
  AbUtils,
  AbZipTyp,Buttons, Controls;

type
  TfmProgress = class(TForm)
    ProgressBar1: TProgressBar;
    bStop: TBitBtn;
    mExtra: TMemo;
    procedure bStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    DoStop : Boolean ;
    ZipArchive : TAbZipArchive;
    procedure onProgress  ( Progress : Byte; var Abort : Boolean) ;
    procedure DoConfirmProcessItem(Sender : TObject; Item : TAbArchiveItem;
      ProcessType : TAbProcessType; var Confirm : Boolean);
    { Public declarations }
  end;

var
  fmProgress: TfmProgress;

implementation

{$R *.dfm}

{ TfmProgress }

procedure TfmProgress.bStopClick(Sender: TObject);
begin
  DoStop := True ;
end;

procedure TfmProgress.DoConfirmProcessItem(Sender : TObject; Item : TAbArchiveItem;
      ProcessType : TAbProcessType; var Confirm : Boolean);
begin
  Confirm := True ;
  mExtra.Lines.Add(Item.FileName) ;

end;

procedure TfmProgress.onProgress(  Progress: Byte;
  var Abort: Boolean);
begin
  Abort := DoStop ;
  ProgressBar1.Position := Progress ;
  Application.ProcessMessages ;

end;

end.
