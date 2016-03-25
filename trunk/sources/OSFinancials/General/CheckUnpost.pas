(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit CheckUnpost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxListView;

type
  TfmCheckUnpost = class(TForm)
    Panel1: TPanel;
    lblMessage: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    btnOdetails: TBitBtn;
    ListView: TcxListView;
    btnCDetails: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnOdetailsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     Procedure Check;
    { Public declarations }
  end;


// done : Pieter Create when needed
function fmCheckUnpost : TfmCheckUnpost ;


implementation

uses Database, LanguageChoice, Main, DatabaseAccess,TcVariables,GlobalFunctions,LedgerRoutines,
  UDMTCCoreLink;

{$R *.DFM}
var
  afmCheckUnpost: TfmCheckUnpost;

function fmCheckUnpost : TfmCheckUnpost ;
begin
   if not assigned(afmCheckUnpost) then
   afmCheckUnpost:= TfmCheckUnpost.Create(Application);
   result := afmCheckUnpost ;
end;

procedure TfmCheckUnpost.Check;

Var
  LedgerCalculationClass : TLedgerCalculationClass ;
  i ,x,TempPeriode,RecordCount,TotalBatchCount,TotalDocumentCount : Integer ;
  TotCount:LongInt;
  Debit,Credit : Double ;
  OldFilter : String ;
  WasFilterd : Boolean ;
  ListItem:TListItem;
  cCountDoc:Array [10..13] of LongInt;

begin
 if dmDatabase.SetOfBooksPropertys.DataParameter.nOWarningUnposted  then exit ;
   LedgerCalculationClass := TLedgerCalculationClass.Create(self,TLedgerItem) ;
   try
   ReadLedgerObjectFromBatches(LedgerCalculationClass);
   TotalBatchCount := 0 ;
   TotalDocumentCount := 0 ;
   dmDatabase.tblBatch.DisableControls;
   try
   dmDatabase.tblBatch.close ;
    dmDatabase.qryUpdateBatch.close ;
    dmDatabase.qryUpdateBatch.open ;
    dmDatabase.qryUpdateBatch.DisableControls;
    try
    TotCount:=dmDatabase.qryUpdateBatch.RecordCount;
    // all balance
    dmDatabase.qryUpdateBatch.First;

    // recheck totals
   dmDatabase.qryUpdateBatch.First;
    TotCount := 0 ;
    ListView.Clear ;
    while not dmDatabase.qryUpdateBatch.eof do
    begin
        LedgerCalculationClass.GetTotalsFromBatch(dmDatabase.qryUpdateBatchWBATCHTYPEID.AsInteger,debit,credit);
        if (debit <> 0 ) or (credit <> 0)then
        begin
        ListItem := ListView.Items.Add ;
        inc(TotalBatchCount) ;
        ListItem.Caption := dmDatabase.qryUpdateBatchSDescription.AsString ;
        ListItem.Data := Pointer(dmDatabase.qryUpdateBatchWBatchID.AsInteger);
        ListItem.SubItems.Text := IntToStr(LedgerCalculationClass.GetTotalInBacthCount(dmDatabase.qryUpdateBatchWBatchID.AsInteger))+ #13 +dmDatabase.qryUpdateBatchWUserID.Asstring + #13 + FloatToStr(Debit) + #13 + FloatToStr(Credit) ;
        end;
        dmDatabase.qryUpdateBatch.next ;
    end;
    finally
      dmDatabase.qryUpdateBatch.EnableControls;
    end;


  dmDatabase.ZQDocHead.SQL.Text :=  dmDatabase.SQLList.GetFormatedSQLByName('database_selectdocheadOnPosted');

  dmDatabase.ZQDocHead.Open;
  {}


  cCountDoc[10]:=0;
  cCountDoc[12]:=0;
  cCountDoc[13]:=0;
  cCountDoc[11]:=0;

  if dmDatabase.ZQDocHead.RecordCount>0 then
  begin
   dmDatabase.ZQDocHead.First;
   While not dmDatabase.ZQDocHead.Eof do
   begin
      if dmDatabase.ZQDocHeadWTypeID.Value in [10..13] then
        Inc(cCountDoc[dmDatabase.ZQDocHeadWTypeID.Value]);
   dmDatabase.ZQDocHead.Next;
   end;
   With ListView do
   begin
     For i:=10 to 13 do
     if cCountDoc[i]>0 then
     begin
       inc(TotalDocumentCount) ;
       ListItem:=Items.Add;
       ListItem.ImageIndex:=1;
       Case i of
       11:ListItem.Caption:= gettextlang(2187){'(Doc.)}+' ' + GetTextLang(706);// Credit Note';
       12:ListItem.Caption:= gettextlang(2187){'(Doc.)}+' ' + GetTextLang(929);//Purchases';
       13:ListItem.Caption:=gettextlang(2187){'(Doc.)}+' ' + GetTextLang(419);//Goods Returned'
       else
          ListItem.Caption:=gettextlang(2187){'(Doc.)}+' ' + GetTextLang(300);//Invoice';
       end;
       ListItem.subitems.add(IntToStr(cCountDoc[i]));
     end;
   end;
  end;



  lblMessage.Caption:='';
  if (TotalBatchCount <> 0) and (TotalDocumentCount <> 0) then
      lblMessage.Caption:=GetTextLang(530){'Warning, there are}+' ' + IntToStr(TotalBatchCount) + ' '+GetTextLang(531){unposted batches and '} +' '+ IntToStr(TotalDocumentCount) + ' '+GetTextLang(533){unposted documents.'}
    else
  if TotalBatchCount <> 0  then
      lblMessage.Caption:=GetTextLang(530){'Warning, there are}+' ' + IntToStr(TotalBatchCount) + ' '+GetTextLang(532){unposted batches.'}
  else
    if TotalDocumentCount <> 0 then
      lblMessage.Caption:=GetTextLang(530){'Warning, there are}+' ' + IntToStr(TotalDocumentCount) + ' '+GetTextLang(533){unposted documents.'};
  Height:= Panel1.Height + 30 ;
  ListView.Visible:=False;
 finally
    dmDatabase.tblBatch.EnableControls;
 end
  finally
      LedgerCalculationClass.Free ;

  end;
  if lblMessage.Caption<>'' then fmCheckUnpost.ShowModal;

end;

procedure TfmCheckUnpost.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmCheckUnpost.btnOdetailsClick(Sender: TObject);
begin
  if Height<253 then begin
    ListView.Visible:=True;
    Height:=253;
    btnOdetails.Visible:=False;
    btnCdetails.Visible:=True;
    btnCdetails.SetFocus;
  end
  else begin
    ListView.Visible:=False;
    Height:=253-ListView.Height;
    btnCdetails.Visible:=False;
    btnOdetails.Visible:=True;
    btnOdetails.SetFocus;
  end;
end;

procedure TfmCheckUnpost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblDocLine.Close;
  dmDatabase.tblDocHeader.Close;
  dmDatabase.tblBatch.Close;
  dmDatabase.tblUser.Close;
end;

procedure TfmCheckUnpost.FormShow(Sender: TObject);
begin
  DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Ok');
 DMTCCoreLink.LoadImage(btnCDetails.Glyph,'Beginning');
 DMTCCoreLink.LoadImage(btnOdetails.Glyph,'End');

  bitBtn1.SetFocus;
  caption := gettextlang(2188);
  ListView.columns[0].Caption := gettextlang(185);//name;
  ListView.columns[1].Caption := gettextlang(1250);//name;
  ListView.columns[2].Caption := gettextlang(1072);//name;

end;

end.
