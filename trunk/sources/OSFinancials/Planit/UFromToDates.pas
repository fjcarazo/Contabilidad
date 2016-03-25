(*
  Id: UFromToDates.pas by Pieter Valentijn
  Released under the GNU General Public License
*)
unit UFromToDates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormReportingDates = class(TForm)
    DTFromdate: TDateTimePicker;
    DTToDate: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LFromdate: TLabel;
    LToDate: TLabel;
    EStockCode: TEdit;
    BBInput: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBInputClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure loadParams ;
    procedure SaveParams ;
    { Public declarations }
  end;



implementation

uses OSFGeneralRoutines, UDMTCCoreLink, Lookup, osfLookup;

{$R *.dfm}

procedure TFormReportingDates.BitBtn1Click(Sender: TObject);
begin
  // EStockCode.Tag := TDataBaseStockRoutines.GetStockID(EStockCode.Text);
  if EStockCode.Tag = 0 then
    raise Exception.Create('Not a valide stock code');
  ModalResult := mrok ;  
end;

procedure TFormReportingDates.FormShow(Sender: TObject);
begin


 loadParams ;
end;

procedure TFormReportingDates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveParams ;
end;

procedure TFormReportingDates.loadParams;
begin
   DTFromdate.Date := DMTCCoreLink.ReadNwReportOpSaveDate('BILLHO_FROMDATE',Date - 30);
   DTToDate.Date := DMTCCoreLink.ReadNwReportOpSaveDate('BILLHO_TODATE',Date );
   EStockCode.Tag := DMTCCoreLink.ReadNwReportOp('BILLHO_STOCKITEM',-1);
   EStockCode.Text := TDataBaseStockRoutines.GetStockCode(EStockCode.Tag);
end;

procedure TFormReportingDates.SaveParams;
begin
    DMTCCoreLink.WriteNwReportOpSaveDate('BILLHO_FROMDATE',DTFromdate.Date );
    DMTCCoreLink.WriteNwReportOpSaveDate('BILLHO_TODATE',DTToDate.Date );
    DMTCCoreLink.WriteNwReportOp('BILLHO_STOCKITEM',IntToStr(EStockCode.Tag));
end;

procedure TFormReportingDates.BBInputClick(Sender: TObject);
var
 aosfLookup : TosfLookup ;
begin
 aosfLookup := TosfLookup.Create(nil) ;
  try
  aosfLookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
  aosfLookup.SavePrefix := 'BILLHO' ;
  aosfLookup.aOSAConnectionItem :=  DMTCCoreLink.TheOSAConnectionItem ;
  aosfLookup.SelectLookup(self,DMTCCoreLink.GetTextLang(37) ,tcstALL,tcltStock,0);
  EStockCode.Tag := aosfLookup.ReturnID ;
  EStockCode.Text := TDataBaseStockRoutines.GetStockCode(EStockCode.Tag)  ;
 finally
   aosfLookup.free ;
 end;
end;

procedure TFormReportingDates.FormCreate(Sender: TObject);
begin
  Caption := DMTCCoreLink.GetTextLang(3316);

 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BitBtn2.Glyph,'Cancel');
 LFromdate.Caption := DMTCCoreLink.GetTextLang(286);
 LToDate.Caption :=  DMTCCoreLink.GetTextLang(287);
 Label1.Caption := DMTCCoreLink.GetTextLang(37);



 BitBtn1.Caption := DMTCCoreLink.GetTextLang(167);
 BitBtn2.Caption := DMTCCoreLink.GetTextLang(168);
end;

end.
