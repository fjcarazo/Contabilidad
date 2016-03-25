unit UDocRefLinks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, DB,
   DBAccess , Uni, StdCtrls, Buttons, ComCtrls, MemDS;

type
  TfmDocLinks = class(TForm)
    ZQLinksFrom: TuniQuery;
    ZQLinksTo: TuniQuery;
    PageControl1: TPageControl;
    tsFrom: TTabSheet;
    tsTo: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    dsTo: TDataSource;
    dsFrom: TDataSource;
    Panel1: TPanel;
    bClose: TBitBtn;
    ZQLinksFromWTODOCID: TIntegerField;
    ZQLinksFromWTODOCLINEID: TIntegerField;
    ZQLinksToWFROMDOCID: TIntegerField;
    ZQLinksToWFROMDOCLINEID: TIntegerField;
    ZQLinksFromSLOOKUPDOCLINE: TStringField;
    ZQLinksFromSLOOKUPQTY: TFloatField;
    ZQQtyLink: TuniQuery;
    Panel2: TPanel;
    bDelFrom: TButton;
    bLinkFrom: TButton;
    ZQLinksFromWFROMDOCID: TIntegerField;
    ZQLinksFromWFROMDOCLINEID: TIntegerField;
    ZULinksFrom: TUniUpdateSql;
    ZULinksTo: TUniUpdateSql;
    ZQLinksToWTODOCID: TIntegerField;
    ZQLinksToWTODOCLINEID: TIntegerField;
    ZQLinksToSLOOKUPDOCLINE: TStringField;
    ZQQtyLinkTo: TuniQuery;
    Panel3: TPanel;
    bDelTo: TButton;
    bLinkTo: TButton;
    ZQLinksToFORGQTY: TFloatField;
    ZQLinksToSLOOKUPQTY: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQLinksFromCalcFields(DataSet: TDataSet);
    procedure bLinkFromClick(Sender: TObject);
    procedure bDelFromClick(Sender: TObject);
    procedure ZQLinksToCalcFields(DataSet: TDataSet);
    procedure bDelToClick(Sender: TObject);
    procedure bLinkToClick(Sender: TObject);
    procedure ZQLinksFromAfterScroll(DataSet: TDataSet);
    procedure ZQLinksToAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FDocID: Integer;
    FDocLineID: Integer;
    FStockId: Integer;
    FQty,FInternalQty: double;
    FDoctype: Integer;
    procedure SetDocID(const Value: Integer);
    procedure SetDocLineID(const Value: Integer);
    procedure SetStockId(const Value: Integer);
    procedure SetQty(const Value: Double);
    procedure SetDoctype(const Value: Integer);
    { Private declarations }
  public
   property DocID : Integer  read FDocID write SetDocID;
   property DocLineID : Integer  read FDocLineID write SetDocLineID;
   property StockId : Integer  read FStockId write SetStockId;
   property Qty : Double  read FQty write SetQty;
   property Doctype : Integer  read FDoctype write SetDoctype;
   procedure SaveData(ADocid:Integer) ;
   procedure refreshQty ;
    { Public declarations }
  end;



implementation

uses UDMTCCoreLink, UGenSearch, UOSFVisuals, UMsgBox, OSFGeneralRoutines;

{$R *.dfm}

{ TfmDocLinks }

procedure TfmDocLinks.SetDocID(const Value: Integer);
begin
  FDocID := Value;
 ZQLinksFrom.Close ;
 ZQLinksFrom.Params[0].AsInteger := FDocID ;
 ZQLinksFrom.Open; ;
 ZQLinksTo.Close ;
 ZQLinksTo.Params[0].AsInteger := FDocID ;
 ZQLinksTo.Open;
end;

procedure TfmDocLinks.SetDocLineID(const Value: Integer);
begin
  FDocLineID := Value;
 ZQLinksFrom.Filtered := False ;
 ZQLinksFrom.Filter := 'WFROMDOCLINEID = ' + IntToStr(FDocLineID)  ;
 ZQLinksFrom.Filtered := True ;
 ZQLinksTo.Filtered := False ;
 ZQLinksTo.Filter := 'WTODOCLINEID = ' + IntToStr(FDocLineID)  ;
 ZQLinksTo.Filtered := True ;
 refreshQty ;
end;

procedure TfmDocLinks.FormShow(Sender: TObject);
begin
 TDatabaseRegistyRoutines.ReadFormPos(self,'DOCLINKS');

 IF (Doctype IN [10,11,14,16,18]) then
   begin
      PageControl1.ActivePageIndex := 0 ;
      bLinkTo.Visible := False ;
      bLinkFrom.Visible := True ;
    end else
    begin
    PageControl1.ActivePageIndex := 1 ;
    bLinkTo.Visible := True ;
    bLinkFrom.Visible := False ;
    end;

end;

procedure TfmDocLinks.FormCreate(Sender: TObject);
begin
DMTCCoreLink.AssignConnectionToChilds(self);
caption := DMTCCoreLink.GetTextLang(3481);
  tsTo.caption := DMTCCoreLink.GetTextLang(3483);
  tsFrom.caption := DMTCCoreLink.GetTextLang(3482);
  bClose.caption := DMTCCoreLink.GetTextLang(828);
  bLinkFrom.caption := DMTCCoreLink.GetTextLang(3484);
  bLinkTo.caption := DMTCCoreLink.GetTextLang(3484);
  bDelFrom.caption := DMTCCoreLink.GetTextLang(173);
  bDelTo.caption := DMTCCoreLink.GetTextLang(173);
  DBGrid1.Columns[0].Title.Caption:= DMTCCoreLink.GetTextLang(38);
  DBGrid2.Columns[0].Title.Caption:= DMTCCoreLink.GetTextLang(38);
  DBGrid1.Columns[1].Title.Caption:= DMTCCoreLink.GetTextLang(3140);
  DBGrid2.Columns[1].Title.Caption:= DMTCCoreLink.GetTextLang(3140);


end;

procedure TfmDocLinks.SetStockId(const Value: Integer);
begin
  FStockId := Value;
end;

procedure TfmDocLinks.ZQLinksFromCalcFields(DataSet: TDataSet);
begin
 ZQLinksFromSLOOKUPDOCLINE.AsString := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select trim( b.SDocno) || ' + QuotedStr(' ' ) + ' || s.Sdescription a from docline a join dochead b on a.wdocid = b.wdocid join messages s on a.WDescriptionid = S.WMessageid '+
 ' and a.wdocid = ' +  IntToStr(ZQLinksFromWTODOCID.AsInteger) +' and a.wdoclineid = ' +  IntToStr(ZQLinksFromWTODOCLINEID.AsInteger) ));
 ZQQtyLink.close ;
 ZQQtyLink.Params[0].AsInteger :=   FDocID;
 ZQQtyLink.Params[1].AsInteger :=   ZQLinksFromWTODOCID.AsInteger;
 ZQQtyLink.Params[2].AsInteger :=   ZQLinksFromWTODOCLINEID.AsInteger;
 ZQQtyLink.open ;

 ZQLinksFromSLOOKUPQTY.AsFloat :=ZQQtyLink.fields[0].asfloat - Qty ;
end;

procedure TfmDocLinks.SetQty(const Value: Double);
begin
  FQty := Value;
end;

procedure TfmDocLinks.bLinkFromClick(Sender: TObject);
var
 AGenSearch : TGenSearch ;
begin
 if (FDoctype in [10,14]) then
 begin
 AGenSearch := TGenSearch.Create(self) ;
 AGenSearch.Caption := bLinkFrom.Caption;
 TDatabaseRegistyRoutines.ReadFormPos(AGenSearch,'DOCLINKLOOK2');
 with AGenSearch do
         begin
            AutoFieldCols := False ;
            Init('');
            AGenSearch.aSearchPanel.DefSql := 'Select  ac.Saccountcode trn605,ac.Sdescription trn185,b.WTYPEID, a.WDocid,A.Wdoclineid,b.ddate trn238,b.SDocno trn1120 , s.Sdescription TRN178 ,  cast((a.FqtyShipped * coalesce(unit.FUNITQTY,1) )- '+
            ' sum(coalesce(dl.FqtyShipped* coalesce(dlu.FUNITQTY,1),0)) as numeric(12,8))  trn413 ,ms.Sdescription trn2185'+
            ' from docline a join dochead b on a.wdocid = b.wdocid join stock s on a.WstockId = S.Wstockid and a.Wstockid = ' + IntToStr(StockId) +
            ' join account ac on b.Waccountid = ac.Waccountid '+
            ' left join messages ms  on a.WDESCRIPTIONID = ms.WMESSAGEID '+
            ' left join DOC_LINK v on v.WTODOCID = a.WDOCID and v.WTODOCLINEID = a.WDOCLINEID '+
            ' left join UNIT on cast(unit.WUNITID as char(10)) = a.Sunit ' +
            ' left join docline dl on v.WFROMDOCID = dl.WDOCID and dl.wDOCLINEID = v.WFROMDOCLINEID ' +
            ' left join UNIT dlu on cast(dlu.WUNITID as char(10)) = dl.Sunit ' +
            ' where B.Wtypeid  in (12,15)  group by  b.ddate ,ac.Saccountcode,ac.Sdescription ,unit.FUNITQTY,b.WTYPEID,a.WDocid,A.Wdoclineid,b.SDocno , s.Sdescription, a.FqtyShipped,ms.Sdescription ' +
            ' having  a.FqtyShipped - sum(coalesce(dl.FqtyShipped,0)) <> 0 ' ;
            AGenSearch.FType := 'DOCREF2';
            aSearchPanel.FLookup := 'DOCREF2';
            with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 's.SDESCRIPTION' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 20 ;
                  WColumnTranslation := 1708 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 0 ;
               end;

              with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'b.SDocno' ;
                  WLength := 20 ;
                  WControlX := 130 ;
                  WControly := 20 ;
                  WColumnTranslation := 1708 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 1 ;
               end;
          with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'ac.Sdescription' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 60 ;
                  WColumnTranslation := 185 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 2 ;
               end;

              with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'ac.Saccountcode' ;
                  WLength := 20 ;
                  WControlX := 130 ;
                  WControly := 60 ;
                  WColumnTranslation := 605 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 3 ;
               end;
               with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'D' ;
                  SColumnOrigen := 'b.ddate' ;
                  WLength := 20 ;
                  WControlX := 20 ;
                  WControly := 100 ;
                  WColumnTranslation := 238 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 4 ;
               end;
              with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'D' ;
                  SColumnOrigen := 'b.ddate' ;
                  WLength := 20 ;
                  WControlX := 130 ;
                  WControly := 100 ;
                  WColumnTranslation := 238 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 5 ;
               end;
            aSearchPanel.BuildGui ;
            ForceSearch := True ;

            if ShowModal = mrok then
              if not ZQGenSearch.IsEmpty then
               if not ZQLinksFrom.Locate('WTODOCID;WTODOCLINEID',VarArrayOf([ZQGenSearch.FieldByNAme('WDocid').AsInteger,ZQGenSearch.FieldByNAme('WDocLineid').AsInteger]),[]) then
                begin
                   ZQLinksFrom.Insert ;
                   ZQLinksFromWFROMDOCID.AsInteger := FDocID ;
                   ZQLinksFromWFROMDOCLINEID.AsInteger := FDocLineID ;
                   ZQLinksFromWTODOCID.AsInteger := ZQGenSearch.FieldByNAme('WDocid').AsInteger ;
                   ZQLinksFromWTODOCLINEID.AsInteger := ZQGenSearch.FieldByNAme('WDocLineid').AsInteger ;
                   
                   ZQLinksFrom.Post ;
                end;
           TDatabaseRegistyRoutines.WriteFormPos(AGenSearch,'DOCLINKLOOK2');     
           free ;
         end;
    end;
end;

procedure TfmDocLinks.SetDoctype(const Value: Integer);
begin
  FDoctype := Value;
end;

procedure TfmDocLinks.bDelFromClick(Sender: TObject);
begin
if OSFMessageDlg(DMTCCoreLink.GetTextLang(712) ,mtConfirmation,[mbyes,mbno],0) = mrno then exit ;
if not ZQLinksFrom.IsEmpty then
   ZQLinksFrom.Delete ;

end;

procedure TfmDocLinks.ZQLinksToCalcFields(DataSet: TDataSet);
begin
 ZQLinksToSLOOKUPDOCLINE.AsString := VarToStr(DMTCCoreLink.OpenSqlReturnFirstColumn('Select trim( b.SDocno) || ' + QuotedStr(' ' ) + ' || s.Sdescription a from docline a join dochead b on a.wdocid = b.wdocid join messages s on a.WDescriptionid = S.WMessageid '+
 ' and a.wdocid = ' +  IntToStr(ZQLinksToWFROMDOCID.AsInteger) +' and a.wdoclineid = ' +  IntToStr(ZQLinksToWFROMDOCLINEID.AsInteger) ));

end;

procedure TfmDocLinks.bDelToClick(Sender: TObject);
begin
if OSFMessageDlg(DMTCCoreLink.GetTextLang(712),mtConfirmation,[mbyes,mbno],0) = mrno then exit ;
if not ZQLinksTo.IsEmpty then
   ZQLinksTo.Delete ;
   refreshQty    ;
end;

procedure TfmDocLinks.bLinkToClick(Sender: TObject);
var
 AGenSearch : TGenSearch ;
begin
 if not (FDoctype in [10,13,14]) then
 begin
 AGenSearch := TGenSearch.Create(self) ;
 AGenSearch.Caption := bLinkTo.Caption;
 TDatabaseRegistyRoutines.ReadFormPos(AGenSearch,'DOCLINKLOOK1');
 with AGenSearch do
         begin
            AutoFieldCols := False ;
            Init('');
            AGenSearch.aSearchPanel.DefSql := 'Select  ac.Saccountcode trn605,ac.Sdescription trn185,b.WTYPEID, a.WDocid,b.ddate trn238,A.Wdoclineid,b.SDocno trn1120 , s.Sdescription TRN178 ,ms.Sdescription trn2185 ,'+
            ' cast((a.FqtyShipped * coalesce(unit.FUNITQTY,1) )  as numeric(12,8))  trn413 '+
            ' from docline a join dochead b on a.wdocid = b.wdocid join stock s on a.WstockId = S.Wstockid and a.Wstockid = ' + IntToStr(StockId) +
            ' join account ac on b.Waccountid = ac.Waccountid '+
            ' left join messages ms  on a.WDESCRIPTIONID = ms.WMESSAGEID '+

            ' left join DOC_LINK v on v.WTODOCID = a.WDOCID and v.WTODOCLINEID = a.WDOCLINEID '+
            '  left join UNIT on cast(unit.WUNITID as char(10)) = a.Sunit ' +
            ' left join docline dl on v.WFROMDOCID = dl.WDOCID and dl.wDOCLINEID = v.WFROMDOCLINEID ' +
            ' left join UNIT dlu on cast(dlu.WUNITID as char(10)) = dl.Sunit ' +
            ' where B.Wtypeid  in (10,14)  group by  b.ddate,ac.Saccountcode,ac.Sdescription ,unit.FUNITQTY,b.WTYPEID,a.WDocid,A.Wdoclineid,b.SDocno , s.Sdescription, a.FqtyShipped,ms.Sdescription ' +
            ' having  a.FqtyShipped - sum(coalesce(dl.FqtyShipped,0)) <> 0 ' ;
            AGenSearch.FType := 'DOCREF1';
            aSearchPanel.FLookup := 'DOCREF1';

            with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 's.SDESCRIPTION' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 20 ;
                  WColumnTranslation := 1708 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 0 ;
               end;

              with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'b.SDocno' ;
                  WLength := 20 ;
                  WControlX := 130 ;
                  WControly := 20 ;
                  WColumnTranslation := 1120 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 1 ;
               end;
            with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'ac.Sdescription' ;
                  WLength := 20 ;
                  WControlX := 10 ;
                  WControly := 60 ;
                  WColumnTranslation := 185 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 2 ;
               end;

              with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'S' ;
                  SColumnOrigen := 'ac.Saccountcode' ;
                  WLength := 20 ;
                  WControlX := 130 ;
                  WControly := 60 ;
                  WColumnTranslation := 605 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 3 ;
               end;
               with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'D' ;
                  SColumnOrigen := 'b.ddate' ;
                  WLength := 20 ;
                  WControlX := 20 ;
                  WControly := 100 ;
                  WColumnTranslation := 238 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 4 ;
               end;
               with aSearchPanel.aSearchCollection.Add as TSearchCollectionItem do
               begin
                  SControlType := 'D' ;
                  SColumnOrigen := 'b.ddate' ;
                  WLength := 20 ;
                  WControlX := 130 ;
                  WControly := 100 ;
                  WColumnTranslation := 238 ;
                  WControlWidth := 100 ;
                  WControlHeigth := 20 ;
                  Wosf_search_fields_id := 5 ;
               end;
            aSearchPanel.BuildGui ;
            ForceSearch := True ;

            if ShowModal = mrok then
              if not ZQGenSearch.IsEmpty then
               if not ZQLinksTo.Locate('WFROMDOCID;WFROMDOCLINEID',VarArrayOf([ZQGenSearch.FieldByNAme('WDocid').AsInteger,ZQGenSearch.FieldByNAme('WDocLineid').AsInteger]),[]) then
                begin
                   ZQLinksTo.Insert ;
                   ZQLinksToWTODOCID.AsInteger := FDocID ;
                   ZQLinksToWTODOCLINEID.AsInteger := FDocLineID ;
                   ZQLinksToWFROMDOCID.AsInteger := ZQGenSearch.FieldByNAme('WDocid').AsInteger ;
                   ZQLinksToWFROMDOCLINEID.AsInteger := ZQGenSearch.FieldByNAme('WDocLineid').AsInteger ;
                   ZQLinksToFORGQTY.AsFloat := ZQGenSearch.FieldByNAme('trn413').AsFloat ;
                   ZQLinksTo.Post ;
                end;
              refreshQty ;
            TDatabaseRegistyRoutines.WriteFormPos(AGenSearch,'DOCLINKLOOK1');
           free ;
         end;
    end;
end;

procedure TfmDocLinks.ZQLinksFromAfterScroll(DataSet: TDataSet);
begin
  bDelFrom.Visible :=   not ZQLinksFrom.IsEmpty  ;
end;

procedure TfmDocLinks.ZQLinksToAfterScroll(DataSet: TDataSet);
begin
 bDelTo.Visible :=   not ZQLinksTo.IsEmpty  ;
end;

procedure TfmDocLinks.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 TDatabaseRegistyRoutines.WriteFormPos(self,'DOCLINKS');
end;

procedure TfmDocLinks.SaveData(ADocid: Integer);
begin
 ZQLinksFrom.Filtered := False ;
 ZQLinksTo.Filtered := False ;
 ZQLinksFrom.first ;
 while not ZQLinksFrom.eof do
   begin
      if ZQLinksFromWFROMDOCID.AsInteger <> ADocid then
       begin
         ZQLinksFrom.Edit ;
         ZQLinksFromWFROMDOCID.AsInteger := ADocid ;
         ZQLinksFrom.post ;
       end;
      ZQLinksFrom.next ;
   end;
 ZQLinksTo.first ;
 while not ZQLinksTo.eof do
   begin
      if ZQLinksToWFROMDOCID.AsInteger <> ADocid then
       begin
         ZQLinksTo.Edit ;
         ZQLinksToWTODOCID.AsInteger := ADocid ;
         ZQLinksTo.post ;
       end;
      ZQLinksTo.next ;
   end;
  if ZQLinksTo.UpdatesPending then
    ZQLinksTo.ApplyUpdates ;
 if ZQLinksFrom.UpdatesPending then
    ZQLinksFrom.ApplyUpdates ;


end;

procedure TfmDocLinks.refreshQty;
var
 abookmarkstr :TBookmark ;
begin
 FInternalQty := FQty ;
 ZQLinksTo.DisableControls ;
 try
 abookmarkstr := ZQLinksTo.Bookmark ;
 ZQLinksTo.first ;
 while not ZQLinksTo.Eof do
    begin
      FInternalQty := FInternalQty - ZQLinksToFORGQTY.AsFloat ;
      ZQLinksTo.next ;
    end;
 ZQLinksTo.first ;
 while not ZQLinksTo.Eof do
    begin
      ZQLinksTo.Edit ;
      ZQLinksToSLOOKUPQTY.AsFloat := FInternalQty ;
      ZQLinksTo.post ;

      ZQLinksTo.next ;
    end;

 finally
   ZQLinksTo.Bookmark:= abookmarkstr ;
   ZQLinksTo.EnableControls ;
 end;
end;

end.

