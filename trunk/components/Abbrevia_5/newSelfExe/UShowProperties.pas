unit UShowProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmProperties = class(TForm)
    bCancel: TButton;
    bOk: TButton;
    lCaption: TLabel;
    mExtra: TMemo;
    Edit1: TEdit;
    lExtractTo: TLabel;
    procedure bOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmProperties: TfmProperties;

implementation

{$R *.dfm}

procedure TfmProperties.bOkClick(Sender: TObject);
begin
ModalResult := mrok ;
end;

end.
