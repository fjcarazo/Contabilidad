(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit AbreviationReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrAbreviation = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  qrAbreviation: TqrAbreviation;

implementation

uses Database, DatabaseAccess;

{$R *.DFM}

procedure TqrAbreviation.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabel3.Caption := GetTextLang(178){Description};
  QRLabel2.Caption := GetTextLang(1179){Key};
  QRLabel1.Caption := GetTextLang(1180){Abreviation List};
  QRSysData2.Text:= GetTextLang(1024); // Page
end;

end.
