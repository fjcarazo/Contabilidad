unit GroupsList;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TqrGroupsList = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    qrGroupTree: TQRRichText;
    qrGroupType: TQRLabel;
    QRBand3: TQRBand;
    qrGroupName: TQRLabel;
  private

  public

  end;

var
  qrGroupsList: TqrGroupsList;

implementation

{$R *.DFM}

end.
