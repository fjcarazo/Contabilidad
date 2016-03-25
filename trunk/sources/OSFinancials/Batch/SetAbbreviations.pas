(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit SetAbbreviations;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,   cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfmSetAbbreviations = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    BtnPrint: TBitBtn;
    DBEdit2: TDBEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1CKEY: TcxGridDBColumn;
    cxGrid1DBTableView1SABREVIATION: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
     SetKey  : String ;
    { Public declarations }
  end;

var
  fmSetAbbreviations: TfmSetAbbreviations;


implementation

Uses Database,  GlobalFunctions,databaseaccess,
  UDMTCCoreLink, UReportManager, UDmQuantumGridDefs;

{$R *.DFM}

procedure TfmSetAbbreviations.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(BtnPrint.Glyph,'Printer');
  Panel2.SendToBack ;
  DBEdit2.SetFocus;
  caption := gettextlang(1936);
  Label2.caption := gettextlang(1937);
  cxGrid1DBTableView1CKEY.Caption  := gettextlang(1937);
  cxGrid1DBTableView1SABREVIATION.Caption  := gettextlang(1939);
  BtnPrint.caption := gettextlang(1938);
  Label1.caption := gettextlang(1939);


  dmDatabase.tblAbreviations.Close;
  dmDatabase.tblAbreviations.IndexFieldNames:='CKey';
  dmDatabase.tblAbreviations.open;
end;

procedure TfmSetAbbreviations.BtnPrintClick(Sender: TObject);
begin
  ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\GENERAL\documents\abbreviations.rep','');
  {
  dmDatabase.tblAbreviations.Close;
  dmDatabase.tblAbreviations.IndexFieldNames:='CKey';
  dmDatabase.tblAbreviations.open;
  dmDatabase.tblSysVars.Open;
  qrAbreviation := TqrAbreviation.Create(Self);
  try
  PrintReportProcess(0,qrAbreviation,'1');
  finally
  FreeAndNil(qrAbreviation);
  end;
  dmDatabase.tblAbreviations.Close;
  dmDatabase.tblSysVars.Close;}
end;

procedure TfmSetAbbreviations.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=80) and (ssCtrl in Shift) then begin
    BtnPrintClick(Sender);
    Key:=0;
  end;
end;

end.
