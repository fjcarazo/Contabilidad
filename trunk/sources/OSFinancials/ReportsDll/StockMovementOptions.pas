(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit StockMovementOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, wwdbdatetimepicker, Buttons, ComCtrls;

type
  TfmStockMovementOptions = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbcomboxSequence: TDBComboBox;
    dbedtFromCode: TDBEdit;
    dbedtToCode: TDBEdit;
    dbdtFromDate: TwwDBDateTimePicker;
    dbdtToDate: TwwDBDateTimePicker;
    TopPnl: TPanel;
    DestLbl: TLabel;
    lblCopies: TLabel;
    cbDestination: TComboBox;
    Bitprn1: TBitBtn;
    edtCount: TEdit;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDestinationChange(Sender: TObject);
    procedure cbDestinationKeyPress(Sender: TObject; var Key: Char);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Bitprn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmStockMovementOptions: TfmStockMovementOptions;

implementation

Uses
  Database, Main, Lookup, StockMovementReport, HTMLHelpAPI, GlobalFunctions,
  TcVariables, DatabaseAccess;

{$R *.DFM}

Procedure ModifySqlText(SortField:String);
// Added by Sylvain
// This allows to Shift Sort Field which can be
// StockTrn.WStockID Or  Stock.SDescription
begin
  With dmDatabase do Begin
    qryStockMovement.Close;
    qryStockMovement.Sql.Clear;
    qryStockMovement.Sql.Text := dmDatabase.SQLList.GetFormatedSQLByName('stock_stockActivity')+
    '  ORDER BY '+SortField+', StockTrn.DDate' ;
  end;
end;

procedure TfmStockMovementOptions.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Key := #0;
  end;
end;

procedure TfmStockMovementOptions.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblReportingOptions.Post;
  Case dbcomboxSequence.ItemIndex of
   1:ModifySqlText('Stock.SDescription');
   2:ModifySqlText('Stock.WReportingGroup1ID');
   3:ModifySqlText('Stock.WReportingGroup2ID');
   else
     ModifySqlText('Stock.SSTOCKCODE');
  end;
  dmDatabase.qryStockMovement.ParamByName('FromDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DStockMovementFromDate').AsDateTime;
  dmDatabase.qryStockMovement.ParamByName('ToDate').AsDateTime := dmDatabase.tblReportingOptions.FieldByName('DStockMovementToDate').AsDateTime;
  dmDatabase.qryStockMovement.Open;
  dmDatabase.qryStockMovement.Filtered := False;
  dmDatabase.qryStockMovement.Filter := 'SSTOCKCODE >= ''' + dmDatabase.tblReportingOptions.FieldByName('SStockMovementFromCode').AsString + ''' AND SSTOCKCODE <= ''' + dmDatabase.tblReportingOptions.FieldByName('SStockMovementToCode').AsString + '''';
  dmDatabase.qryStockMovement.Filtered := True;
  dmDatabase.tblSysVars.Open;
  qrStockMovementReport := TqrStockMovementReport.Create(Self);
  try
//  qrStockMovementReport.Preview;
  PrintReportProcess(cbDestination.ItemIndex,qrStockMovementReport,edtCount.Text);
  finally
   FreeAndNil(qrStockMovementReport);
  end;
  dmDatabase.qryStockMovement.Filtered := False;
  dmDatabase.qryStockMovement.Filter := '';
  dmDatabase.qryStockMovement.Close;
  dmDatabase.tblReportingOptions.Close;
  dmDatabase.tblSysVars.Close;
  if OptionsClose then Close
  else FormShow(Sender);
end;

procedure TfmStockMovementOptions.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmStockMovementOptions.FormShow(Sender: TObject);
begin
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  dbcomboxSequence.Items.Clear;
  dbcomboxSequence.Items.Add('Stock Code');
  dbcomboxSequence.Items.Add('Stock Description');
  dmDatabase.tblSysVars.Open;
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName1.Value);
  dbcomboxSequence.Items.Add(dmDatabase.tblSysVarsSStockReportName2.Value);
  dmDatabase.tblSysVars.Close;
  dmDatabase.tblReportingOptions.Open;
  dmDatabase.tblReportingOptions.Edit;
  // load Print Modes
  LoadPrintOutModes(cbDestination);
  cbDestination.SetFocus;
end;

procedure TfmStockMovementOptions.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(207);
             key := 0;

        end;
end;

procedure TfmStockMovementOptions.cbDestinationChange(Sender: TObject);
begin
  if  cbDestination.ItemIndex=1 then
  begin
    lblCopies.Enabled:=True;
    EdtCount.Enabled:=True;
    UpDown1.Enabled:=True;
  end
  else
  begin
    lblCopies.Enabled:=False;
    EdtCount.Enabled:=False;
    UpDown1.Enabled:=False;
  end;
end;

procedure TfmStockMovementOptions.cbDestinationKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmStockMovementOptions.edtCountChange(Sender: TObject);
Var
 Nb:Integer;
begin
  Nb:=Abs(StrToInt(EdtCount.Text));
  if Nb<0 then Nb:=1;
   UpDown1.Position:=Nb;
end;

procedure TfmStockMovementOptions.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmStockMovementOptions.Bitprn1Click(Sender: TObject);
begin
  fmMain.SetupPrinterClick(Sender);
end;

procedure TfmStockMovementOptions.BitBtn1Click(Sender: TObject);
begin
  dbedtFromCode.Color := clHighlight;
//  fmLookup.SelectLookup(Sender, 'Stock', 'STOCK', 'STOCK', 1);
  ReturnLookup:=CallLookup(dbedtFromCode.Text, 7);
  if ReturnLookup <> 'ESC' then
    dbedtFromCode.Text := ReturnLookup;
  dbedtFromCode.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

procedure TfmStockMovementOptions.BitBtn2Click(Sender: TObject);
begin
  dbedtToCode.Color := clHighlight;
//  fmLookup.SelectLookup(Sender, 'Stock', 'STOCK', 'STOCK', 1);
  ReturnLookup:=CallLookup(dbedtToCode.Text, 7);
  if ReturnLookup <> 'ESC' then
    dbedtToCode.Text := ReturnLookup;
  dbedtToCode.Color := clWindow;
  SelectNext(ActiveControl, True, True);
end;

end.
