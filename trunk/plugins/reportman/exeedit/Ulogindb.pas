unit Ulogindb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfmLoginDB = class(TForm)
    pcmainsetup: TPageControl;
    tsdatabase: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    EUsername: TEdit;
    EPassword: TEdit;
    EDatabase: TEdit;
    EServer: TEdit;
    cbProtocol: TComboBox;
    EPort: TEdit;
    tslog: TTabSheet;
    MLog: TMemo;
    btnOpen: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLoginDB: TfmLoginDB;

implementation

uses UDmDummyDatabase, UDMTCCoreLink, MainReportMan;

{$R *.dfm}

procedure TfmLoginDB.FormCreate(Sender: TObject);
var
 AList : TStringlist ;
begin
 if FileExists(ChangeFileExt(Application.ExeName,'.ini')) then
 begin
  AList := TStringlist.Create ;
  try
        AList.LoadFromFile(ChangeFileExt(Application.ExeName,'.ini'));
        EUsername.Text := AList.Values['Username'];
        cbProtocol.Text := AList.Values['Protocol'];
        if cbProtocol.Text = '' then
           cbProtocol.Text := 'firebird-1.5' ;

        EPassword.Text := AList.Values['Password'];
        EServer.Text := AList.Values['Server'];
        EPort.Text := AList.Values['Port'];
        EDatabase.Text := AList.Values['Database'];
  finally
   AList.free ;
  end;
 end;

end;

procedure TfmLoginDB.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 AList : TStringlist ;
begin
  AList := TStringlist.Create ;
  try
      AList.Values['Username'] := EUsername.Text ;
      AList.Values['Protocol'] := cbProtocol.Text ;
      AList.Values['Password'] := EPassword.Text ;
      AList.Values['Server']   := EServer.Text ;
      AList.Values['Port']     := EPort.Text ;
      AList.Values['Database'] := EDatabase.Text  ;
      try
      AList.SaveToFile(ChangeFileExt(Application.ExeName,'.ini'));
       except

       end;
  finally
   AList.free ;
  end;
end;

procedure TfmLoginDB.btnOpenClick(Sender: TObject);
begin
dmDatabase.ZMainConnection.Connected := False ;

    with dmDatabase.ZMainConnection do
     Begin
        Username := EUsername.Text ;
        ProviderName := cbProtocol.Text ;
        if ProviderName = '' then
           ProviderName := 'InterBase' ;
        Password := EPassword.Text ;
        Server := EServer.Text ;
        Port := StrToIntDef(EPort.Text,0) ;
        Database := EDatabase.Text ;
        Connect ;
     end;

  DMTCCoreLink := TDMTCCoreLink.create(Application);
  try
     DMTCCoreLink.AApplication := Application ;
     frMainReportMan:= TfrMainReportMan.create(Application);
     try
       frMainReportMan.showmodal ;
     finally
       FreeAndNil(frMainReportMan) ;
     end;
     finally
       FreeAndNil(DMTCCoreLink) ;
     end;
end;

end.
