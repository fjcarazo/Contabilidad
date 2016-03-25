unit UReportBasis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFormReportOptionsBase = class(TForm)
    PPrintoptions: TPanel;
    cbPrintTo: TComboBox;
    LPrintType: TLabel;
    Button1: TBitBtn;
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    procedure BPageSetupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GetPrintType : Integer ;

    { Public declarations }
  end;

var
  FormReportOptionsBase: TFormReportOptionsBase;

implementation

uses UDMReportsGlobals, UDMTCCoreLink, USetPrinters, OSFGeneralRoutines,
  UMsgBox;

{$R *.dfm}

{ TFormReportOptionsBase }

function TFormReportOptionsBase.GetPrintType: Integer;
begin
case cbPrintTo.ItemIndex of
 -1,0 : result := 0 ;
    1 : result := 1 ;
    2 : Result := 2 ;
    3 : Result := 3 ;
    4 : Result := 10 ;
    5 : Result := 11 ;
 end;

   if result = 2 then
     begin
     if DMTCCoreLink.currentuser <> 0 then
      if VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select BSYSTEMSETUP from users where Wuserid =' + IntToStr(DMTCCoreLink.currentuser))) <> '1' then
      begin
        OSFMessageDlg('No right please setup SYSTEMSETUP in access control!' , mterror, [mbok], 0);
        result := 0;
      end;

     end;


end;

procedure TFormReportOptionsBase.BPageSetupClick(Sender: TObject);
begin
    DMReportsGlobals.VCLReport1.PageSetup ;

end;

procedure TFormReportOptionsBase.FormCreate(Sender: TObject);
begin
 if DMTCCoreLink.CurrentTheme = '' then
     DMTCCoreLink.UpdateTheme ;
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Ok');
 DMTCCoreLink.LoadImage(Button1.Glyph,'Printer'); 
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');


   //BtnCancel
   BtnCancel.Caption := DMTCCoreLink.GetTextLang(168);
   //Ok
   BtnOk.Caption := DMTCCoreLink.GetTextLang(167);

 cbPrintTo.Items[0] := DMTCCoreLink.GetTextLangNoAmp(985) ;
 cbPrintTo.Items[1] := DMTCCoreLink.GetTextLangNoAmp(986) ;
 cbPrintTo.Items[2] := DMTCCoreLink.GetTextLangNoAmp(2889) ;
 cbPrintTo.Items[3] := DMTCCoreLink.GetTextLangNoAmp(3346) ;
 cbPrintTo.Items[4] := DMTCCoreLink.GetTextLangNoAmp(864) ;
 cbPrintTo.Items[5] := DMTCCoreLink.GetTextLangNoAmp(1911) ;
  LPrintType.Caption := DMTCCoreLink.GetTextLangNoAmp(3217);
  cbPrintTo.ItemIndex := DMTCCoreLink.ReadNwReportOp('REP_DEFAULT_IND',0);
end;

procedure TFormReportOptionsBase.FormDestroy(Sender: TObject);
begin
  DMTCCoreLink.WriteNwReportOp('REP_DEFAULT_IND',IntToStr(cbPrintTo.ItemIndex)); 
end;

procedure TFormReportOptionsBase.Button1Click(Sender: TObject);
begin
 frSetPrinter := TfrSetPrinter.Create(nil);
  try
    frSetPrinter.ShowModal ;
  finally
    frSetPrinter.free ;
  end;
end;

end.
