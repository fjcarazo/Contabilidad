unit MainWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfmMainWizard = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ListBox1: TListBox;
    Paymt1: TTabSheet;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMainWizard: TfmMainWizard;

implementation

uses UDMTCCoreLink;

{$R *.dfm}

procedure TfmMainWizard.FormShow(Sender: TObject);
begin

 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');

end;

end.
