unit ReplicationParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,dateutils;

type
  TFrmReplicationParams = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Label1: TLabel;
    dParam: TDateTimePicker;
    tparam: TDateTimePicker;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReplicationParams: TFrmReplicationParams;

function CheckReplicationdate(Var ADate:TDateTime):boolean;

implementation

uses UDMTCCoreLink;

{$R *.dfm}

function CheckReplicationdate(Var ADate:TDateTime):boolean;
begin
  Result := False;
  FrmReplicationParams := TFrmReplicationParams.Create(Application);
  Try
    FrmReplicationParams.dParam.DateTime := ADate;
    FrmReplicationParams.tparam.DateTime := ADate;
    Result :=  FrmReplicationParams.ShowModal = mrOK ;
    if Result Then
      ADate := DateOf(FrmReplicationParams.dParam.Date)+
               TimeOf(FrmReplicationParams.tparam.Time);
  finally
    FrmReplicationParams.Free;
  end;
end;


procedure TFrmReplicationParams.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

end;

end.
