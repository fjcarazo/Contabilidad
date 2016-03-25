unit USetPrinters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, printers, WinSpool, StdCtrls,rppagesetupvcl, rpcompobase,
  rpvclreport, Buttons, ExtCtrls;

type
  TfrSetPrinter = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    topen: TTimer;
    TClose: TTimer;
    procedure BFirtsPageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TCloseTimer(Sender: TObject);
    procedure topenTimer(Sender: TObject);
  private
    { Private declarations }
  public
   isedit : boolean ;
   Procedure ShowPrinter ;
    { Public declarations }
  end;

var
  frSetPrinter: TfrSetPrinter;

implementation

uses TcashClasses, UDMTCCoreLink,rpmdprintconfigvcl;


{$R *.dfm}
 



procedure TfrSetPrinter.BFirtsPageClick(Sender: TObject);
begin

    ShowPrintersConfiguration ;

end;

procedure TfrSetPrinter.ShowPrinter;

begin

end;

procedure TfrSetPrinter.TCloseTimer(Sender: TObject);
begin
TClose.Enabled := False ;
 self.Close ;
end;

procedure TfrSetPrinter.topenTimer(Sender: TObject);
begin
   topen.Enabled := false ;
   ShowPrintersConfiguration ;
   TClose.Enabled := True ;
end;

procedure TfrSetPrinter.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Close');
 BitBtn1.Caption := DMTCCoreLink.GetTextLang(2397);
 Caption := DMTCCoreLink.GetTextLang( 864);
 topen.Enabled := True ;
end;

end.
