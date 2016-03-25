(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License

*)
unit NewLookup;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,   StdCtrls, Buttons, ExtCtrls,
  DB,  DBGrids, ComCtrls,  Menus,
    DBAccess , Uni,TCashClasses,
   MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfmPosLookup = class(TForm)
    PopupMenu1: TPopupMenu;
    Usefilter1: TMenuItem;
    PFind: TPanel;
    Bsearch: TButton;
    CBField: TComboBox;
    ZQStock: TuniQuery;
    ZQStockWSTOCKID: TIntegerField;
    ZQStockSSTOCKCODE: TStringField;
    ZQStockSBARCODENUMBER: TStringField;
    ZQStockSDESCRIPTION: TStringField;
    ZQStockWREPORTINGGROUP1ID: TIntegerField;
    ZQStockWREPORTINGGROUP2ID: TIntegerField;
    ZQStockWCOSTACCOUNTID: TIntegerField;
    ZQStockWINPUTTAXID: TIntegerField;
    ZQStockWOUTPUTTAXID: TIntegerField;
    ZQStockFOPENINGAVECOST: TFloatField;
    ZQStockFQTYONHAND: TFloatField;
    ZQStockFOPENINGQTY: TFloatField;
    ZQStockFINVQTYONHAND: TFloatField;
    ZQStockFREORDERQTY: TFloatField;
    ZQStockWSALESACCOUNTID: TIntegerField;
    ZQStockBAPPLYINVOICEDISCOUNT: TSmallintField;
    ZQStockWSTOCKACCOUNTID: TIntegerField;
    ZQStockFSELLINGPRICE1: TFloatField;
    ZQStockFSELLINGPRICE2: TFloatField;
    ZQStockFSELLINGPRICE3: TFloatField;
    ZQStockFUNITAVECOST: TFloatField;
    ZQStockFUNITCOST: TFloatField;
    ZQStockWUNITID: TIntegerField;
    ZQStockDSYSDATE: TDateTimeField;
    ZQStockBAPPLYTAX: TSmallintField;
    ZQStockWINPUTTAX2ID: TIntegerField;
    ZQStockBTAXABLE: TSmallintField;
    ZQStockWSUPPLIER1ID: TIntegerField;
    ZQStockWSUPPLIER2ID: TIntegerField;
    ZQStockWSTOCKTYPEID: TIntegerField;
    ZQStockWOUTPUTTAX2ID: TIntegerField;
    ZQStockWPROFILEID: TIntegerField;
    ZQStockBDISABLED: TSmallintField;
    ZQStockWPERENTID: TIntegerField;
    ZQStockWLOCATIONID: TIntegerField;
    ZQStockWFILENAMEID: TIntegerField;
    ZQStockSEXTRADESC: TStringField;
    ZQStockINTAXCODE: TStringField;
    ZQStockINTAXDESC: TStringField;
    ZQStockINTAXRATE: TFloatField;
    ZQStockOUTTAXCODE: TStringField;
    ZQStockOUTTAXDESC: TStringField;
    ZQStockOUTTAXRATE: TFloatField;
    ZQStockCOSACCCODE: TStringField;
    ZQStockCOSACCDESC: TStringField;
    ZQStockSALESACCCODE: TStringField;
    ZQStockSALESACCDESC: TStringField;
    ZQStockSTOCKACCCODE: TStringField;
    ZQStockSTOCKACCDESC: TStringField;
    dsStock: TDataSource;
    ECode: TEdit;
    cbField2: TComboBox;
    ECode2: TEdit;
    CBLogic: TComboBox;
    Button1: TButton;
    ZQGroups: TuniQuery;
    ZQStockSEXTERNALID: TStringField;
    ZQStockFNETTOWEIGHT: TFloatField;
    ZQStockFGROSSWEIGHT: TFloatField;
    ZQStockFREORDERQTYTRIG: TFloatField;
    ZQStockSMANUFACTURER: TStringField;
    TShowDetail: TTimer;
    tblBatchControl: TuniTable;
    tblBatchControlWBATCHID: TIntegerField;
    tblBatchControlWUSERID: TIntegerField;
    tblBatchControlWBATCHTYPEID: TIntegerField;
    tblBatchControlSBATCHNUMBER: TStringField;
    tblBatchControlBPOSTED: TSmallintField;
    tblBatchControlBIMPORTED: TSmallintField;
    tblBatchControlBDOCSOURCE: TSmallintField;
    tblBatchControlWLINECOUNT: TIntegerField;
    tblBatchControlSFILENAME: TStringField;
    tblBatchControlWDOCID: TIntegerField;
    tblBatchControlDSYSDATE: TDateTimeField;
    tblBatchControlWINITBATID: TIntegerField;
    tblBatchControlSALIAS: TStringField;
    tblBatchControlSUNIQUEID: TStringField;
    dsBatchControl: TDataSource;
    ZQStockFMINIMUMQTY: TFloatField;
    ZQStockWLOCBATSERTYPEID: TIntegerField;
    cbAutogroup: TComboBox;
    LGroup: TLabel;
    cbCreditor: TComboBox;
    LCreditor: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    cbCode: TCheckBox;
    cbDescription: TCheckBox;
    cbBarCode: TCheckBox;
    Shape1: TShape;
    Bevel1: TBevel;
    StatusBar: TStatusBar;
    cbAuto: TCheckBox;
    cbGroup2: TComboBox;
    LGroup2: TLabel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1WSTOCKID: TcxGridDBColumn;
    cxGrid1DBTableView1SSTOCKCODE: TcxGridDBColumn;
    cxGrid1DBTableView1SBARCODENUMBER: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxGrid1DBTableView1SEXTRADESC: TcxGridDBColumn;
    procedure DBGrdLookupCellClick(Column: TColumn);
    procedure DBGrdLookupDblClick(Sender: TObject);
    procedure DBGrdLookupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
    procedure rgLookupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbCodeClick(Sender: TObject);
    procedure cbDescriptionClick(Sender: TObject);
    procedure cbBarCodeClick(Sender: TObject);
    procedure Usefilter1Click(Sender: TObject);
    procedure BsearchClick(Sender: TObject);
    procedure ECodeKeyPress(Sender: TObject; var Key: Char);
    procedure CBLogicChange(Sender: TObject);
    procedure ECode2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ZQStockAfterScroll(DataSet: TDataSet);
    procedure TShowDetailTimer(Sender: TObject);
    procedure ZQStockBeforeOpen(DataSet: TDataSet);
    procedure cbAutoClick(Sender: TObject);

  private

    LookupIndex : Integer ;
    LastButtonStock : Integer ;
    First:Boolean;
    RecSelect:boolean;
    CreateNow,ISSalesmen:Boolean;
    CanClick:Boolean;
    NeedsRefresh : Boolean ;
    ButtonStyle : Boolean;
    ButtonList : TStringlist ;
    BreadCrumb : TStringlist ;
    AScrollBox : TScrollBox ;
    Function GetSearchField:STring;
    Procedure LocateStock(srhField:String);
    Procedure CallLocateBat(srhField:String);
    Function RgIndex:integer;
    procedure MyOnFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure HandelButtons(Groupid: Integer);

    procedure GroupClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure ButtonEnter(Sender: TObject);
    procedure StockClick(Sender: TObject);
    procedure OnLastAction(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
    procedure GetBatchConRec(var aBatch: TBatchCon; DS: TDataSet=nil);
  public
    DefSupplier : Integer ;
    Look,Tbl,ExtraFilter:String;
    STKSQLOnlyForLookup:boolean;
     OnSelect : TNotifyEvent ;
     IsEmbedded : Boolean ;
      LimitStockToCreditor : Boolean;
        ForceShowList ,ListCreditor: Boolean ;
    procedure WMSysCommand (var Msg: TWMSysCommand) ; message WM_SYSCOMMAND;
    Procedure InitThisForm;
    procedure ShowHideCredlist(AVisible : Boolean ) ;    
  end;

  {Stock Table Routines}
  Function SelectLookup(Var aStockRec:TStockRec; CanCreate:Boolean;Filter : String='';ForceShowList : Boolean = true):Boolean; Overload;
  Function LoadStockItem(Var aStockRec:TStockRec; BarCode:String;ForceShowList : Boolean = true):Boolean; Overload;
  Function LoadStockItem(Var aStockRec:TStockRec;ForceShowList : Boolean = true):Boolean; Overload;
  Function SelectLookup(Var aBatchRec:TBatchCon; GotToTop:Boolean;ForceShowList : Boolean = true):Boolean; Overload;
  // Function SelectLookup(Var Value:String; FieldType, tblName:String; toTop:boolean;ForceShowList : Boolean = true):Integer; Overload;


  function fmPosLookup: TfmPosLookup;
 var
   afmPosLookup: TfmPosLookup;

implementation

uses
  UDMTCCoreLink,
  OSFGeneralRoutines,UDmQuantumGridDefs, TcVariables,  uMsgBox
  ;//, StockEntry;//,StockEdit,LanguageChoice;

{$R *.dfm}


procedure TfmPosLookup.WMSysCommand(var Msg: TWMSysCommand);
begin
   if (Msg.CmdType <> SC_MINIMIZE) then
   DefaultHandler(Msg) else
   ModalResult := mrCancel ;

end;

function fmPosLookup: TfmPosLookup;
begin
   if not assigned(afmPosLookup) then
   begin
   afmPosLookup:= TfmPosLookup.Create(Application);
   afmPosLookup.ZQStock.Connection := DMTCCoreLink.TheZConnection ;
   afmPosLookup.ZQGroups.Connection := DMTCCoreLink.TheZConnection ;
   end;
   result := afmPosLookup ;
end;

Function Select_Lookup_Stock(VAr aStockRec:TStockRec;CanCreate,JustLoad:Boolean;Filter : String ='';ForceShowList : Boolean = true ):Boolean;

Var
  AndCondition : String ;
  VAr aCopyStockRec:TStockRecPointer ;
begin
  result := false;
  fmPosLookup.cbAutogroup.Visible := False ;
  fmPosLookup.LGroup.Visible := False ;
  fmPosLookup.LGroup2.Visible := False ;
  fmPosLookup.cbGroup2.Visible := False ;

  fmPosLookup.Look := '' ;
  if not JustLoad then
  begin
    // no purchase items
    if fmPosLookup.Showing then
      Exit ;
  end ;
  fmPosLookup.ForceShowList := ForceShowList ;


  if (Filter <> '') and (fmPosLookup.ZQStock.Filter <> Filter)  then
     begin

     fmPosLookup.ZQStock.close ;
     if copy(Filter,1,1) <> '@' then
        fmPosLookup.ZQStock.Filter := Filter ;
     end;
    if not JustLoad then
    begin
      // no purchase items
      if fmPosLookup.Showing then
        Exit ;
      fmPosLookup.NeedsRefresh := false ;
      fmPosLookup.ZQStock.OnFilterRecord := fmPosLookup.MyOnFilterRecord ;
      AndCondition := DMTCCoreLink.ReadLongSysparam('LIMITSTOCKSQL',DMTCCoreLink.CurrentUser) ;
      if (fmPosLookup.ZQStock.Filter <> '') and (AndCondition <> '') then
       begin
          fmPosLookup.ZQStock.Filter := fmPosLookup.ZQStock.Filter + ' and ' + AndCondition ;
       end else
       if AndCondition <> '' then
          fmPosLookup.ZQStock.Filter := AndCondition ;

      fmPosLookup.ZQStock.Filtered := true ;
    end;

    try
      with fmPosLookup do
      begin
         fmPosLookup.NeedsRefresh := False;
         if Not JustLoad then
         begin
           if not fmPosLookup.ZQStock.Active then
             begin
             if fmPosLookup.STKSQLOnlyForLookup  then
             begin
               fmPosLookup.ZQStock.SQL.Text:=  DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock');
               if copy(Filter,1,1) = '@' then
                  fmPosLookup.ZQStock.SQL.add(copy(filter,2,5000));

               if aStockRec.WStockID <> 0 then
                  begin
                    if pos('WHERE',UpperCase( fmPosLookup.ZQStock.SQL.Text)) > 0 then
                      fmPosLookup.ZQStock.SQL.Text:=  fmPosLookup.ZQStock.SQL.Text + ' and ' else
                      fmPosLookup.ZQStock.SQL.Text:=  fmPosLookup.ZQStock.SQL.Text + ' where '  ;


                    fmPosLookup.ZQStock.SQL.Text:=  fmPosLookup.ZQStock.SQL.Text +' stock.WStockID =' + IntToStr(aStockRec.WStockID);
                  end else
               begin
                fmPosLookup.NeedsRefresh := true;
                if pos('WHERE',UpperCase( fmPosLookup.ZQStock.SQL.Text)) > 0 then
                 fmPosLookup.ZQStock.SQL.Text:=  fmPosLookup.ZQStock.SQL.Text + ' and 1 = 0 '
                else
                fmPosLookup.ZQStock.SQL.Text:=  fmPosLookup.ZQStock.SQL.Text + ' where 1 = 0 ' ;
               //if AndCondition <> '' then
               // fmPosLookup.ZQStock.SQL.add(' where ' +AndCondition);
               end;
             end else
             begin
               if fmPosLookup.STKSQLOnlyForLookup  then
                begin
                  fmPosLookup.NeedsRefresh := true;
                end
                else
                begin
                 fmPosLookup.ZQStock.SQL.Text:=  DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') ;
                 if copy(Filter,1,1) = '@' then
                   fmPosLookup.ZQStock.SQL.add(copy(filter,2,5000))
                  else
               if AndCondition <> '' then
                begin
                if  copy(Filter,1,1) = '@' then
                 fmPosLookup.ZQStock.SQL.add(' and ') else
                 fmPosLookup.ZQStock.SQL.add(' where ') ;

                fmPosLookup.ZQStock.SQL.add(AndCondition);

                end;
                 if not  fmPosLookup.ButtonStyle then
                  begin
                     ZQStock.Open;
                    fmPosLookup.ZQStock.Locate('WSTOCKID',aStockRec.WStockID,[]);
                  end;
                end;
             end;
             if not  fmPosLookup.ButtonStyle then
             ZQStock.Open;
             end;
           {This allow to create if not found}
           CreateNow:=CanCreate;
           {This means the user did select something}
           RecSelect:=False;
           InitThisForm;
           if not  fmPosLookup.ButtonStyle then
           begin
           cxGrid1DBTableView1SSTOCKCODE.Caption:=DMTCCoreLink.GetTextLangNoAmp(605);{'Code';}
           cxGrid1DBTableView1SDESCRIPTION.Caption:=DMTCCoreLink.GetTextLangNoAmp(178);{'Description';}
           cxGrid1DBTableView1SBARCODENUMBER.Caption:=DMTCCoreLink.GetTextLangNoAmp(1774);//Barcode
           cxGrid1DBTableView1SEXTRADESC.Caption:=DMTCCoreLink.GetTextLangNoAmp(2919);//{'Extra Description';}
           tbl:='STOCK';

           ZQStock.Locate('WStockID',aStockRec.WStockID,[]);
           
           cbAutogroup.Visible :=  TDataBaseRoutines.FillStringsWithReportingGroups(cbAutogroup.Items,26) ;

           LGroup.Visible := cbAutogroup.Visible ;

           cbGroup2.Visible :=  TDataBaseRoutines.FillStringsWithReportingGroups(cbGroup2.Items,27) ;

           LGroup2.Visible := cbGroup2.Visible ;
           if (not cbGroup2.Visible) and (not cbCreditor.Visible) then
                PFind.Height := LGroup2.top ; ;
           if ListCreditor then
              begin
                 TDataBaseStringRoutines.FillStringListWithSelect(cbCreditor.Items,'select Waccountid,trim(coalesce(Sdescription,'+QuotedStr('') +'))|| '+QuotedStr(' ') +' || Saccountcode A from account where WaccountTypeid = 2 order by 2 ') ;
              end ;

           cxGrid1DBTableView1.RestoreFromRegistry('Software\osfinancials\grids\lookupstock',false);

           //TDatabaseRegistyRoutines.LoadGridFromRegistry(DBGrdLookup,'STOCK');
           end;
           ShowModal;
           if not  fmPosLookup.ButtonStyle then
           cxGrid1DBTableView1.StoreToRegistry('Software\osfinancials\grids\lookupstock');
           //        TDatabaseRegistyRoutines.SaveGridToRegistry(DBGrdLookup,'STOCK');
         end else
         begin
           RecSelect:=True;
         end;
         if RecSelect then
         begin
           DMTCCoreLink.stockObject.getStock(aCopyStockRec,ReturnLookup) ;
           if ZQStock.Active then
           ZQStock.Locate('SSTOCKCODE',ReturnLookup,[]);
           Result := True;
           if DMTCCoreLink.ExtraOptions.Values['BHANDELBOM'] = '-1' then
               if aCopyStockRec.WStockTypeId = 1 then
                 aCopyStockRec.FQtyOnHand := TDataBaseStockRoutines.GetStockQty(aStockRec.WStockID);
           DMTCCoreLink.stockObject.CopyStockRec(aCopyStockRec,aStockRec)
         end
         else
           Result := False;
      end;
    finally
      fmPosLookup.ZQStock.OnFilterRecord := nil ;
      fmPosLookup.ZQStock.Filtered := false ;
      fmPosLookup.ZQStock.close ;
    end;
end;

Function LoadStockItem(VAr aStockRec:TStockRec;ForceShowList : Boolean = true):Boolean;Overload;
begin
  Result := Select_Lookup_Stock(aStockRec,False,True,'',ForceShowList);
end;

Function LoadStockItem(VAr aStockRec:TStockRec;BarCode:String ;ForceShowList : Boolean = true):Boolean;Overload;
begin
    fmPosLookup.ZQStock.close ;
    if fmPosLookup.STKSQLOnlyForLookup then
    begin
    fmPosLookup.ZQStock.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') + ' where stock.SBarCodeNumber like ' + QuotedStr(BarCode+'%');
    fmPosLookup.ZQStock.open ;
    if fmPosLookup.ZQStock.RecordCount = 1 then
       begin
         aStockRec.WStockID := fmPosLookup.ZQStockWSTOCKID.AsInteger ;
         TDataBaseStockRoutines.StockLoadItem(aStockRec);
         Result :=  true ;
         exit ;
       end;
    end
    else
    begin
     fmPosLookup.ZQStock.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') ;
     fmPosLookup.ZQStock.open ;
    end;
    fmPosLookup.ZQStock.filtered := true ;
    if fmPosLookup.ZQStock.Locate('SBARCODENUMBER',BarCode,[]) then
    Result :=  Select_Lookup_Stock(aStockRec,False,True,'',ForceShowList)
    else
     Result :=  false ;
end;




Function SelectLookup(VAr aStockRec:TStockRec;CanCreate:Boolean;Filter : String='';ForceShowList : Boolean = true):Boolean;
begin
  Result := Select_Lookup_Stock(aStockRec,CanCreate,False,Filter,ForceShowList);
end;

procedure TfmPosLookup.DBGrdLookupCellClick(Column: TColumn);
begin
{  if Not CanClick then
  begin
     CanClick:=True;
     Exit;
  end;
  ReturnLookup := ZQStockSSTOCKCODE.AsString ;
  RecSelect := True;
  Close;  }
end;

procedure TfmPosLookup.DBGrdLookupDblClick(Sender: TObject);
begin
  RecSelect := True;
  ReturnLookup := ZQStockSSTOCKCODE.AsString ;
  ReturnID := ZQStockWSTOCKID.AsInteger ;
  if Assigned(OnSelect) then
    begin
    ECode.tag:=1 ;
    OnSelect(self);
    end;
  if not IsEmbedded then
  Close;
end;

procedure TfmPosLookup.DBGrdLookupKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ButtonStyle then EXIT ;

  //if the user pushes [home] go to the first record
  if Key = 36 then
  begin
    if tbl = 'STOCK'   then ZQStock.First;
    if tbl = 'BAT' then tblBatchControl.First;

    Key := 0;
    First:=True;
  end;
  // reset look to '' when moving up or down
  // but not when we use a filter
  if (Key=38) or (Key=40) then
    if not Usefilter1.Checked then
    First:=True;//Look:='';
  if (WinFormID='DOCS') And (Key = 120) then // F9 Key_Function
  begin
    ReturnLookup:='^'+IntToStr(Key);
    if Assigned(OnSelect) then
      begin
        ECode.tag:=1 ;
       OnSelect(self);
      end;
    if not IsEmbedded then
    Close;
    exit;
  end;
  //if the user pushes [end] go to the last record
  if Key = 35 then
  begin
    if tbl = 'STOCK'   then ZQStock.Last;
    if tbl = 'BAT' then tblBatchControl.Last;
    Key := 0;
    First:=True;
  end;
  //if the user pushed [Shift - Tab]
  if (Key = 9) and (Shift=[ssShift]) then
  begin
    ReturnLookup := 'BACK';
    Key := 0;
    if Assigned(OnSelect) then
      begin
      ECode.tag:=1 ;
      OnSelect(self);

      end;
    if not IsEmbedded then
    Close;
  end;
  if Key = 112 then
  begin
     //HtmlShowTopic(246);
     key := 0;
  end;
  // if the users presses backspace we drop one char of the look string
  if Key = 8 then
  begin
    if Length(look) > 0 then
       begin
         SetLength(look,Length(look)-1);
         if Usefilter1.Checked then
            dsStock.DataSet.Refresh ;
        Label1.Caption := DMTCCoreLink.GetTextLangNoAmp(944){search by} + ':'  + Look ;
       end;
  end;

  if First then
    begin
    Look:='' ;
    if Usefilter1.Checked then
       dsStock.DataSet.Refresh ;
    end;
  if key = vk_right then
     if look = '' then
        begin
            key := 0;
            RecSelect := True;
            if Assigned(OnSelect) then
              begin
               ECode.tag:=1 ;
               OnSelect(self);
              end;
            if not IsEmbedded then
            close;
        end;
end;

Function TfmPosLookup.RgIndex:integer;
begin
  if cbDescription.Checked then
    Result:=1
  else if cbBarCode.Checked then
    Result:=2
  else
    Result :=0;
end;

Function TfmPosLookup.GetSearchField:STring;
begin
  Case RgIndex of
  1:begin
      if tbl = 'STOCK' then
        Result :='SDescription'
      else if tbl = 'BAT' then
        Result:='SAlias';
    end;
  2:begin
      if tbl = 'STOCK' then
        Result :='SBarCodeNumber'
    end;
  else
    if tbl = 'STOCK' then
      Result :='SSTOCKCODE'
    else if tbl = 'BAT' then
      Result:='WBatchID';
 end;
end;

Procedure TfmPosLookup.CallLocateBat(srhField:String);
begin
 // First:= Not
 tblBatchControl.Locate(srhField,Look,[LoPartialkey,LoCaseInsensitive]);
end;

Procedure TfmPosLookup.LocateStock(srhField:String);
begin
if ButtonStyle then EXIT ;
  if (ZQStock.Locate(srhField,Look,[LoPartialkey,LoCaseInsensitive]) = false)then
  begin
     if (CreateNow and (not DMTCCoreLink.ReadNwReportOp('STKDoNotCreateItems',false))) and
      ((not Usefilter1.Checked) or (ZQStock.RecordCount = 0))then
     begin
       if OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(494), mtconfirmation, [mbyes, mbno], 0) = mryes then
       begin

        ReturnLookup := 'NEW';
        if Assigned(OnSelect) then
          begin
          ECode.tag:=1 ;
          OnSelect(self);
          end;
        if not IsEmbedded then
        Close;
       end
       else
       begin
         ECode.setfocus ;
         Look:='';
       end;
     end
     else
     begin
       if not Usefilter1.Checked then
       begin
         OSFMessageDlg(DMTCCoreLink.GetTextLangNoAmp(466)+#13#10+'<'+Look+'...>'+
            #13#10+'in '+ cxGrid1DBTableView1SSTOCKCODE.Caption+
            #13#10+'Try to change the search index ', mterror, [mbok], 0);
         Look:='';
       end;
     end;
  end;
end;

procedure TfmPosLookup.DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
Var
  aField:String;
begin
if ButtonStyle then EXIT ;
  if key = #8 then
    begin
      if Look <> '' then
         delete(Look,length(Look),1);
      Key := #0 ;
       Label1.Caption := DMTCCoreLink.GetTextLangNoAmp(944){search by} + ':'  + Look ;
       StatusBar.SimpleText:=Look;
      exit ;
    end;
     If (Key >= #48) and (Key <= #122) Or (Ord(Key) in [32,42,45,46,47,92,95,38])  then
     begin
       Look:=Look+Key;
       Label1.Caption := DMTCCoreLink.GetTextLangNoAmp(944){search by} + ':'  + Look ;
       aField := GetSearchField;
       if Usefilter1.Checked then
          dsStock.DataSet.Refresh ;

       First:=False;
       if tbl = 'STOCK' then LocateStock(aField)
       else if tbl = 'BAT' then CallLocateBat(aField);
     end
     else
     if Key = #13 then
     begin
       RecSelect := True;
       ReturnLookup := ZQStockSSTOCKCODE.AsString ;
       Key:=#0;
       if Assigned(OnSelect) then
         begin
         ECode.tag:=1 ;
         OnSelect(self);
         end;
       if not IsEmbedded then
       close;
     end
     else
     if Key = #27 then
     begin
       RecSelect:=False;
       Key:=#0;
       if Assigned(OnSelect)  then
         begin
         ECode.tag:=1 ;
         OnSelect(self);
         end;
       if not IsEmbedded then
       close;
     end;
     StatusBar.SimpleText:=Look;
end;

procedure TfmPosLookup.rgLookupClick(Sender: TObject);
begin
if ButtonStyle then EXIT ;
  cxGrid1.setFocus;
end;

Function SelectLookup(Var aBatchRec:TBatchCon; GotToTop:Boolean;ForceShowList : Boolean = true):Boolean; Overload;
begin


  try
    with fmPosLookup do
    begin
      tblBatchControl.Open;
      tblBatchControl.Filtered:=False;
      tblBatchControl.Filter:='BPosted=1';
      tblBatchControl.Filtered:=True;
      tblBatchControl.IndexFieldNames := 'WBATCHID' ;

       Caption :=' Batches List';
       cbBarCode.Visible:=False;
       {This means the user did select something}
       RecSelect:=False;
       InitThisForm;
       tbl:='BAT';
       cxGrid1DBTableView1.DataController.DataSource := dsBatchControl;
       cxGrid1DBTableView1SSTOCKCODE.Caption:= DMTCCoreLink.GetTextLangNoAmp(2046);{'Number'}
       cxGrid1DBTableView1SSTOCKCODE.DataBinding.FieldName := 'WBatchID';
       cxGrid1DBTableView1SDESCRIPTION.Caption:= DMTCCoreLink.GetTextLangNoAmp(2085);{'Alias'}
       cxGrid1DBTableView1SDESCRIPTION.DataBinding.FieldName := 'SAlias';
       cxGrid1DBTableView1SBARCODENUMBER.Caption:=StringReplace(DMTCCoreLink.GetTextLangNoAmp(2014),'&','',[]);{ 'Import'}
       cxGrid1DBTableView1SBARCODENUMBER.DataBinding.FieldName := 'BImported';
       cxGrid1DBTableView1SEXTRADESC.Caption:=DMTCCoreLink.GetTextLangNoAmp(2089); //'Doc no';
       cxGrid1DBTableView1SEXTRADESC.DataBinding.FieldName := 'WDOCID';
       tblBatchControl.Locate('WBatchID',aBatchRec.WBatchID,[]);
       ShowModal;
       Result := RecSelect;
        if Result Then
          GetBatchConRec(ReturnBatch);

        tblBatchControl.Close;
        tblBatchControl.Filtered:=False;
        tblBatchControl.Filter:='';

    end;

  except
    Result := False;
  end;
end;



procedure TfmPosLookup.GetBatchConRec(Var aBatch:TBatchCon;DS:TDataSet=Nil);
begin

     if Ds=nil then ds := tblBatchControl;
     aBatch.WBatchID     := ds.FieldByName('WBatchID').AsInteger;
     aBatch.WBatchTypeID := ds.FieldByName('WBatchTypeID').AsInteger;
     aBatch.SAlias := ds.FieldByName('SAlias').AsString;
     aBatch.SName :=  TDataBaseRoutines.GetBatchNameById(aBatch.WBatchTypeID);
     aBatch.BPosted := ds.FieldByName('BPosted').Asinteger = 1;
     aBatch.WDocID := ds.FieldByName('WDocID').AsInteger;
     aBatch.BDocSource := ds.FieldByName('BDocSource').Asinteger = 1;
     aBatch.BImported := ds.FieldByName('BImported').Asinteger = 1;
     aBatch.DSysDate := ds.FieldByName('DSysDate').AsDateTime;
     aBatch.SFilename := ds.FieldByName('SFilename').AsString;
     aBatch.SUniqueID := ds.FieldByName('SUniqueID').AsString;
     aBatch.SBatchNumber := ds.FieldByName('SBatchNumber').AsString;
     aBatch.WLineCount := ds.FieldByName('WLineCount').AsInteger;
     aBatch.WInitBatID := ds.FieldByName('WInitBatID').AsInteger;
     aBatch.WUserID := ds.FieldByName('WUserID').AsInteger;

end;

procedure TfmPosLookup.GroupClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  HandelButtons(StrToInt(Copy((sender As Tcomponent).Name,4,20)));
end;



procedure TfmPosLookup.StockClick(Sender: TObject);
begin
 ZQStock.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') +' where stock.WStockId = ' +IntToStr(StrToInt(Copy((sender As Tcomponent).Name,4,20))) ;
 ZQStock.open ;
 DBGrdLookupDblClick(self);
end;


procedure TfmPosLookup.HandelButtons(Groupid : Integer)  ;
 Var
  AButton : TPanel ;
  aQtyOnhand : Double ;
   AImage : Timage ;
  ALabel : TLabel ;
  ButtonHeigth , ButtonWidth : Integer ;
  var
   i , NextTop,NextLeft:  integer ;
   procedure MoveNextPos ;
   begin
     AButton.Top := NextTop ;
     AButton.Left := NextLeft ;
     AButton.Height := ButtonHeigth ;
     AButton.Width := ButtonWidth ;
     AButton.Parent := AScrollBox ;
    if NextLeft + ((ButtonWidth * 2 )-10) > Self.Width then
       begin
         NextTop := NextTop + ButtonHeigth +10  ;
         NextLeft :=  1 ;
       end else
       NextLeft := NextLeft + (ButtonWidth + 10);
   end;
begin
AButton := nil ;
 ButtonWidth :=  DMTCCoreLink.ReadNwReportOp('ButtonWidth',120) ;
 ButtonHeigth := DMTCCoreLink.ReadNwReportOp('Buttonheigth',40) ;
 if not assigned(AScrollBox) then
  begin
   AScrollBox := TScrollBox.create(self) ;
   AScrollBox.Parent := self ;
   AScrollBox.Align := alClient ;
  end;
 BreadCrumb.Add(IntToStr(Groupid)) ;
  for i := 0 to ButtonList.Count -1 do
    begin
       ButtonList.Objects[i].Free ;
    end;
  ButtonList.clear ;
  If Groupid = 0 then
   begin
     ZQGroups.SQL.Text := 'Select WGroupid,sDescription , WCOLOR, WTEXTCOLOR from v_groups groups where  WGroupTypeID = 26 and (BDisable is null or BDisable = 0 ) and (WParentGroup2id is null or WParentGroup2id =0) order by WSortno' ;
     ZQStock.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') +' where  (stock.WREPORTINGGROUP1ID is null  or stock.WREPORTINGGROUP1ID =0) order by stock.SDescription' ;
   end
  else
   begin
     ZQGroups.SQL.Text := 'Select WGroupid,sDescription, WCOLOR, WTEXTCOLOR from v_groups groups where   WParentGroup2id =' + IntToStr(Groupid) +' and (BDisable is null or BDisable = 0 ) ' ;
     ZQStock.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') + ' where stock.WREPORTINGGROUP1ID = ' + IntToStr(Groupid) +
     ' or stock.WStockid in (select x.WStockid from STOCK_MULTIGROUP x where x.WStockid= stock.WStockid and x.WGroupid = ' + IntToStr(Groupid) +
     ' ) order by stock.SDescription' ;
   end;
 NextTop := 1 ;
 NextLeft := 1 ;
 ZQGroups.open ;
 while not ZQGroups.Eof do
     begin
        AButton := TPanel.Create(self);
        ButtonList.AddObject(ZQGroups.Fields[0].AsString,AButton);
        AButton.Name := 'GRP' + ZQGroups.fields[0].AsString ;
        AButton.ParentBackground := false ;
        AButton.Caption := '' ;
        AButton.OnMouseUp := GroupClick;
        AButton.Hint := ZQGroups.Fields[1].AsString ;
        if ZQGroups.Fields[2].AsInteger <> 0 then
           begin
             AButton.Color := ZQGroups.Fields[2].AsInteger ;
             AButton.Font.Color := ZQGroups.Fields[3].AsInteger ;
           end;
        AButton.Font.Style := [fsBold] ;
        AButton.Font.Name := self.Font.Name ;
        AButton.ShowHint := true ;
         AImage := TImage.Create(AButton);
        AImage.Parent := AButton ;
        AImage.Align := alClient ;
        AImage.Name := 'GRI' + ZQGroups.fields[0].AsString ;
        AImage.Center := true ;
        AImage.OnMouseUp := GroupClick;
        AImage.Transparent := true ;
        ALabel := TLabel.create(AButton);
        ALabel.Parent := AButton ;
        ALabel.Align := alClient ;
        ALabel.Transparent := true ;
        ALabel.WordWrap := true ;
        ALabel.Name := 'GRL' + ZQGroups.fields[0].AsString ;
        ALabel.OnMouseUp := GroupClick;
        ALabel.Caption :=  ZQGroups.Fields[1].AsString ;
        ALabel.Alignment := taCenter ;
         try
      if FileExists( DMTCCoreLink.GroupsObject.GetGroupImgName(ZQGroups.fields[0].AsInteger) ) then
          begin
           AImage.Picture.LoadFromFile(DMTCCoreLink.GroupsObject.GetGroupImgName(ZQGroups.fields[0].AsInteger));
           AButton.Caption := '' ;
          end  ;

         except
            // to image on except
         end;
        MoveNextPos ;
        ZQGroups.next ;
     end;
 if not ZQGroups.IsEmpty then
  begin
    NextTop := NextTop + ButtonHeigth +10 ;
    NextLeft := 1 ;
  end;
 ZQStock.open ;
 while not ZQStock.Eof do
     begin
        AButton := TPanel.Create(self);
        ButtonList.AddObject(ZQStock.FieldByName('WStockid').AsString,AButton);
        AButton.Name := 'STK' + ZQStock.FieldByName('WStockid').Asstring ;
        AButton.Caption := '' ;
        AButton.ParentBackground := false ;
        AButton.OnClick := StockClick ;
        AButton.OnEnter := ButtonEnter;
        AButton.Hint := ZQStock.FieldByName('SDescription').AsString ;
        AButton.ShowHint := true ;
         AImage := TImage.Create(AButton);
        AImage.Parent := AButton ;
        AImage.Align := alBottom ;
        AImage.AutoSize := true ;
        AImage.Center := true ;
        AImage.Transparent := true ;
        AImage.Name := 'STI' + ZQStock.FieldByName('WStockid').Asstring ;
        AImage.OnClick := StockClick;
        ALabel := TLabel.create(AButton);
        ALabel.Parent := AButton ;
        ALabel.Align := alClient ;
        ALabel.Transparent := true ;
        ALabel.Alignment := taCenter ;
        ALabel.WordWrap := true ;
        ALabel.Name := 'STL' + ZQStock.FieldByName('WStockid').Asstring ;
        ALabel.OnClick := StockClick;
        ALabel.Caption := ZQStock.FieldByName('SDescription').AsString ;
        if (ZQStockFREORDERQTY.AsFloat <> -1) then
           begin
             aQtyOnhand := ZQStockFQTYONHAND.AsFloat - TDataBaseStockRoutines.GetUnpostedStockITemCount(ZQStockWSTOCKID.AsInteger,0) ;
             ALabel.Caption := '(' + FloatToStr(aQtyOnhand) + ') '  + ALabel.Caption  ;
             if aQtyOnhand <= 0 then
                begin
                  AButton.Color := clRed ;
                end;
           end;
         try
        if FileExists( TDataBaseStockRoutines.getImage(ZQStock.FieldByName('WStockid').AsInteger) ) then
          begin
            AImage.Picture.LoadFromFile(TDataBaseStockRoutines.getImage(ZQStock.FieldByName('WStockid').AsInteger));
          end ;
        except
           // No image on except
        end;
        MoveNextPos ;
        ZQStock.next ;
        if ButtonList.Count > 1000 then break ;
     end;
 if not ZQStock.IsEmpty then
  begin
   NextLeft := 1 ;
   NextTop := NextTop + ButtonHeigth +10 ;
  end;
if Groupid <> 0 then
  begin
    AButton := TPanel.Create(self);
    buttonList.AddObject('Back',AButton);
    AButton.Caption := '« ' +DMTCCoreLink.GetTextLangNoAmp(1208) ;
    AButton.OnMouseUp := OnLastAction ;
    MoveNextPos ;
  end;
//  if Assigned(AButton) then
 //    AButton.SetFocus ;
end;

procedure TfmPosLookup.FormShow(Sender: TObject);
begin
 if not ForceShowList then
   ButtonStyle := DMTCCoreLink.ReadSysParam('LookupButtons',false,CurrentUser) else
   ButtonStyle := false ;

 if ButtonStyle and (cxGrid1DBTableView1.DataController.DataSource <> dsBatchControl) then
 begin
 dsStock.DataSet := nil ;
   BreadCrumb.Clear ;
   cbBarCode.Visible := false ;
   cbDescription.Visible := false ;
   cbCode.Visible := false ;
   PFind.Visible := false ;
   cxGrid1.Visible := false ;
   Shape1.Visible := false ;
   label1.Visible := false ;
   Bevel1.Visible := false ;
   cbDescription.Visible := false ;
   StatusBar.Visible := False ;
   HandelButtons(0);
   exit ;
 end else
 begin
 if Assigned(AScrollBox) then
   begin
    FreeAndNil(AScrollBox);
   cbBarCode.Visible := True ;
   cbDescription.Visible := True ;
   cbCode.Visible := True ;
   PFind.Visible := True ;
   cxGrid1.Visible := True ;
   Shape1.Visible := True ;
   label1.Visible := True ;
   Bevel1.Visible := True ;
   cbDescription.Visible := True ;
  end;

 LGroup.Caption := TDataBaseRoutines.GetTypeDescription(26);
 LGroup2.Caption := TDataBaseRoutines.GetTypeDescription(27);
 CBField.Items[0] := DMTCCoreLink.GetTextLangNoAmp(2123); //Code
 CBField.Items[1] := DMTCCoreLink.GetTextLangNoAmp(1708);//Description
 CBField.Items[2] := DMTCCoreLink.GetTextLangNoAmp(1774);//Barcode
 CBField.Items[3] := DMTCCoreLink.GetTextLangNoAmp(1708) +' ' + DMTCCoreLink.GetTextLangNoAmp(2145) +' ' + DMTCCoreLink.GetTextLangNoAmp(2919);// Description and extra description
 CBField.Items[4] := DMTCCoreLink.GetTextLangNoAmp(3321);

 cbField2.Items[0] := DMTCCoreLink.GetTextLangNoAmp(2123); //Code
 cbField2.Items[1] := DMTCCoreLink.GetTextLangNoAmp(1708);//Description
 cbField2.Items[2] := DMTCCoreLink.GetTextLangNoAmp(1774);//Barcode
 cbField2.Items[3] := DMTCCoreLink.GetTextLangNoAmp(1708) +' ' + DMTCCoreLink.GetTextLangNoAmp(2145) +' ' + DMTCCoreLink.GetTextLangNoAmp(2919);// Description and extra description

 CBLogic.Items[0] := DMTCCoreLink.GetTextLangNoAmp(2321);//  None
 CBLogic.Items[1] := DMTCCoreLink.GetTextLangNoAmp(2145);//  And
 CBLogic.Items[2] := DMTCCoreLink.GetTextLangNoAmp(20094);// Or
 Bsearch.caption := DMTCCoreLink.GetTextLangNoAmp(952);//Search
 Button1.caption := DMTCCoreLink.GetTextLangNoAmp(1016);//Clear
 ReturnLookup := '' ;
 Usefilter1.caption := DMTCCoreLink.GetTextLangNoAmp(2967);
  Usefilter1.Checked := DMTCCoreLink.ReadSysParam('FILTNEWLOOKUP',BoolToStr(false,true),currentUser) ;
  cbAuto.Visible := Usefilter1.Checked ;
  CanClick:=False;

 cbCode.Checked := False ;
 cbDescription.Checked := False ;
 cbBarCode.Checked := False ;
 cbAuto.Checked := False ;
 LookupIndex := DMTCCoreLink.ReadSysParam('LASTNEWLOOKUP',0,currentUser) ;
case LookupIndex of
 0 : cbCode.Checked := true ;
 1 : cbDescription.Checked := true ;
 2 : cbBarCode.Checked := true ;
 3 : cbAuto.Checked := true ;
 end;
 if cbAuto.Checked and not cbAuto.Visible then
    LookupIndex := 0 ;


    If cbDescription.Checked then

      begin
      cxGrid1DBTableView1.Columns[1].SortIndex := 0 ;
      cxGrid1DBTableView1.Columns[1].SortOrder := soAscending ;
      end else
      begin
      cxGrid1DBTableView1.Columns[0].SortIndex := 0 ;
      cxGrid1DBTableView1.Columns[0].SortOrder := soAscending ;
      end;



 CBField.ItemIndex := DMTCCoreLink.ReadSysParam('FIELDLOOKUP',0,currentUser);
 ECode.Text := DMTCCoreLink.ReadSysParam('FIELDLOOKUPTEXT','',currentUser);

  cbAutogroup.ItemIndex :=  cbAutogroup.Items.IndexOfObject(TObject(StrToIntDef(VarToStr(DMTCCoreLink.ReadSysParam('GROUPLOOKUPTEXT',0,DMTCCoreLink.currentUser)),0)));
  cbGroup2.ItemIndex :=  cbGroup2.Items.IndexOfObject(TObject(StrToIntDef(VarToStr(DMTCCoreLink.ReadSysParam('GROUPLOOKUPTEXT2',0,DMTCCoreLink.currentUser)),0)));

 CBLogic.ItemIndex := DMTCCoreLink.ReadSysParam('LOGICLOOKUP',0,currentUser);
 CBField2.ItemIndex := DMTCCoreLink.ReadSysParam('FIELD2LOOKUP',0,currentUser);
 ECode2.Text := DMTCCoreLink.ReadSysParam('FIELD2LOOKUPTEXT','',currentUser);
 CBLogicChange(self);

 Label1.Caption := DMTCCoreLink.GetTextLangNoAmp(944){search by} + ' : '  ;
 Caption := StringReplace(DMTCCoreLink.GetTextLangNoAmp(1163),'&','',[rfreplaceAll]);
 cbCode.Caption := DMTCCoreLink.GetTextLangNoAmp(605);
 cbAuto.Caption := DMTCCoreLink.GetTextLangNoAmp(989);

 cbDescription.Caption := DMTCCoreLink.GetTextLangNoAmp(606);
 cbBarCode.Caption := DMTCCoreLink.GetTextLangNoAmp(990);


 if STKSQLOnlyForLookup  then
  begin
   ECode.SetFocus ;
   ECode.SelectAll ;
  end;
 if NeedsRefresh then
   begin
      NeedsRefresh := false ;
      BsearchClick(nil);
   end;
  end;
  TDatabaseRegistyRoutines.ReadFormPos(self,'LST');
  if (DefSupplier <>0) then
     begin
        cbCreditor.ItemIndex := cbCreditor.Items.IndexOfObject(TObject(DefSupplier));

     end;
end;

Procedure TfmPosLookup.InitThisForm;
begin
  {the lookup value typed by the user}
   Look:='';
   top := Screen.WorkAreaHeight - Height-25;
   Left := Screen.WorkAreaLeft + 10;

end;
{
Function SelectLookup(Var Value:String;FieldType,tblName:String;toTop:boolean;ForceShowList : Boolean = true):Integer;
begin
  if SameText(tblName,'Stock') then
  begin
    TmpStockRec.WStockID:=0;
    TmpStockRec.SSTOCKCODE:='';
    if SameText(FieldType,'Code') then
      TmpStockRec.SSTOCKCODE:=Value;
    Select_Lookup_Stock(TmpStockRec,False,False,'',ForceShowList);
    Value :=StockRecToXml(TmpStockRec);
  end;
end;
 }
procedure TfmPosLookup.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
  i  : Integer ;
begin
TShowDetail.Enabled := false ;

 // Action := cafree;
 if not ButtonStyle then
 begin
 DMTCCoreLink.WriteSysParam('FILTNEWLOOKUP',BooltoStr(Usefilter1.Checked,true),currentUser);
 DMTCCoreLink.WriteSysParam('FIELDLOOKUP',CBField.ItemIndex,currentUser);
 DMTCCoreLink.WriteSysParam('FIELDLOOKUPTEXT',ECode.Text,currentUser);

 DMTCCoreLink.WriteSysParam('LOGICLOOKUP',CBLogic.ItemIndex,currentUser);
 DMTCCoreLink.WriteSysParam('FIELD2LOOKUP',CBField2.ItemIndex,currentUser);
 DMTCCoreLink.WriteSysParam('FIELD2LOOKUPTEXT',ECode2.Text,currentUser);

 DMTCCoreLink.WriteSysParam('WIDTHLOOKUP', IntToStr(self.Width),currentUser);

 if cbAutogroup.ItemIndex > -1 then
 DMTCCoreLink.WriteSysParam('GROUPLOOKUPTEXT',IntToStr(Integer(cbAutogroup.Items.Objects[cbAutogroup.ItemIndex])),DMTCCoreLink.currentUser)
 else
 DMTCCoreLink.WriteSysParam('GROUPLOOKUPTEXT',IntToStr(0),DMTCCoreLink.currentUser) ;

 if cbGroup2.ItemIndex > -1 then
 DMTCCoreLink.WriteSysParam('GROUPLOOKUPTEXT2',IntToStr(Integer(cbGroup2.Items.Objects[cbGroup2.ItemIndex])),DMTCCoreLink.currentUser)
 else
 DMTCCoreLink.WriteSysParam('GROUPLOOKUPTEXT2',IntToStr(0),DMTCCoreLink.currentUser) ;





 if cbCode.Checked then
 DMTCCoreLink.WriteSysParam('LASTNEWLOOKUP',0,currentUser)
 else
 if cbDescription.Checked then
 DMTCCoreLink.WriteSysParam('LASTNEWLOOKUP',1,currentUser)
 else
 if cbBarCode.Checked then
 DMTCCoreLink.WriteSysParam('LASTNEWLOOKUP',2,currentUser)
 else
 if cbAuto.Checked then
 DMTCCoreLink.WriteSysParam('LASTNEWLOOKUP',3,currentUser) ;

 ZQStock.OnFilterRecord := nil ;

 if (ReturnLookup = '') and not (ZQStock.IsEmpty) then
    ReturnLookup :='ESC' ;
 end else
 begin
   for i := 0 to ButtonList.Count -1 do
    begin
       ButtonList.Objects[i].Free ;
    end;
   ButtonList.clear ;
 end;
 TDatabaseRegistyRoutines.WriteFormPos(self,'LST');
end;

procedure TfmPosLookup.cbCodeClick(Sender: TObject);
begin
  cbBarCode.OnClick := nil ;
  cbCode.OnClick := nil ;
  cbDescription.OnClick := nil ;
  cbAuto.OnClick := nil ;
  cbCode.Checked := True ;
  if cbCode.Checked then
     begin
        cbDescription.State := cbUnchecked ;
        cbBarCode.State := cbUnchecked ;
        cbAuto.State := cbUnchecked ;
     end else
     begin
      cbDescription.State := cbChecked ; ;
      cbAuto.State := cbUnchecked ;
      cbBarCode.State := cbUnchecked ;
     end;

   cxGrid1DBTableView1.DataController.ClearSorting(True);

      cxGrid1DBTableView1.Columns[1].SortOrder := soAscending ;


  cbBarCode.OnClick := cbBarCodeClick ;
  cbCode.OnClick := cbCodeClick ;
  cbDescription.OnClick := cbDescriptionClick ;
  cbAuto.OnClick := cbAutoClick ;

end;

procedure TfmPosLookup.cbDescriptionClick(Sender: TObject);
var
 oldId : Integer ;
begin
  cbBarCode.OnClick := nil ;
  cbCode.OnClick := nil ;
  cbDescription.OnClick := nil ;
  cbAuto.OnClick := nil ;
  cbDescription.Checked := True ;

      cbCode.State := cbUnchecked ; ;
      cbAuto.State := cbUnchecked ;
      cbBarCode.State := cbUnchecked ;



   cxGrid1DBTableView1.DataController.ClearSorting(True);

  cxGrid1DBTableView1.Columns[2].SortOrder := soAscending ;

  cbBarCode.OnClick := cbBarCodeClick ;
  cbCode.OnClick := cbCodeClick ;
  cbDescription.OnClick := cbDescriptionClick ;
  cbAuto.OnClick := cbAutoClick ;
end;

procedure TfmPosLookup.cbBarCodeClick(Sender: TObject);
begin
 cbBarCode.OnClick := nil ;
  cbCode.OnClick := nil ;
  cbDescription.OnClick := nil ;
  cbAuto.OnClick := nil ;
  cbBarCode.Checked := True ;

        cbCode.State := cbUnchecked ;
        cbDescription.State := cbUnchecked ;
        cbAuto.State := cbUnchecked ;

   cxGrid1DBTableView1.DataController.ClearSorting(True);

      cxGrid1DBTableView1.Columns[3].SortOrder := soAscending ;

  cbBarCode.OnClick := cbBarCodeClick ;
  cbCode.OnClick := cbCodeClick ;
  cbDescription.OnClick := cbDescriptionClick ;
  cbAuto.OnClick := cbAutoClick ;     
end;

procedure TfmPosLookup.Usefilter1Click(Sender: TObject);
begin
Usefilter1.Checked := NOT Usefilter1.Checked ;
cbAuto.Visible := Usefilter1.Checked ;
end;

procedure TfmPosLookup.MyOnFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
if Usefilter1.Checked then
 begin
    if tbl ='STOCK' then
        begin
          if cbDescription.Checked then
          begin
          if look <> '' then
            begin
             Accept := (pos(uppercase(look),uppercase(ZQStock.FieldByName('SDescription').AsString)) <> 0) or
                       (pos(uppercase(look),uppercase(ZQStock.FieldByName('SExtraDesc').AsString)) <> 0 )
            end 
          else
          Accept := true ;
          end else
          if cbCode.Checked then
          begin
          if look <> '' then
          Accept := pos(uppercase(look),uppercase(ZQStock.FieldByName('SSTOCKCODE').AsString)) <> 0
          else
          Accept := true ;
          end else
          if cbBarCode.Checked then
          begin
          if look <> '' then
          Accept := pos(uppercase(look),uppercase(ZQStock.FieldByName('SBarCodeNumber').AsString)) <> 0
          else
          Accept := true ;
          end else
          if cbAuto.Checked then
          begin
          if look <> '' then
          Accept := (pos(uppercase(look),uppercase(ZQStock.FieldByName('SBarCodeNumber').AsString)) <> 0) or
          (pos(uppercase(look),uppercase(ZQStock.FieldByName('SSTOCKCODE').AsString)) <> 0) or
           (pos(uppercase(look),uppercase(ZQStock.FieldByName('SDescription').AsString)) <> 0) or
                       (pos(uppercase(look),uppercase(ZQStock.FieldByName('SExtraDesc').AsString)) <> 0 )
          else
          Accept := true ;
          end;
        end;
    end;
end ;

procedure TfmPosLookup.BsearchClick(Sender: TObject);
Var
 AndOrLogic : String ;
 BarcodeName : String ;
 ExtraDesc : String ;
begin

 if tbl = 'STOCK' then
 begin
  ZQStock.filter := '' ;

  BarcodeName :=  DMTCCoreLink.ReadSysParam('STK_BRCODELOOKUP','stock.SBARCODENUMBER',0);
  ExtraDesc :=  DMTCCoreLink.ReadSysParam('STK_EXTRDESCLOOKUP','stock.SExtraDesc',0);
  ZQStock.SQL.Text:=  DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') ;
 if ECode.Text <> '' then
 begin
 case CBField.ItemIndex of
   1 :  ZQStock.SQL.Add('Where upper(stock.SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ));
   2 :  ZQStock.SQL.Add('Where '+BarcodeName+' like ' + QuotedStr('%'+ECode.Text +'%' ));
   3 :  ZQStock.SQL.Add('Where (upper(stock.SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ) +
        '  or upper('+ExtraDesc+') like ' + QuotedStr('%'+ECode.Text +'%' ) +')' );
   4 :  ZQStock.SQL.Add('Where (upper(stock.SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ) +
        '  or upper('+ExtraDesc+') like ' + QuotedStr('%'+ECode.Text +'%')  +
        ' or stock.SStockCode like ' + QuotedStr('%'+ECode.Text +'%') + ')' );

   else
    ZQStock.SQL.Add('Where stock.SStockCode like ' + QuotedStr('%'+ECode.Text +'%' ));
   end ; // end case
 end else
   ZQStock.SQL.Add('Where 1 = 1');
 AndOrLogic := '' ;

 case CBLogic.ItemIndex of
   1 : AndOrLogic := ' and ' ;
   2 : AndOrLogic := ' or ' ;
   end;
   if ECode2.Text <> '' then
   begin
   if CBLogic.ItemIndex > 0 then
    begin
         case CBField.ItemIndex of
           1 :  ZQStock.SQL.Add(AndOrLogic + 'stock.SDescription like ' + QuotedStr('%'+ECode2.Text +'%' ));
           2 :  ZQStock.SQL.Add(AndOrLogic +BarcodeName + ' like ' + QuotedStr('%'+ECode2.Text +'%' ));
           3 :  ZQStock.SQL.Add(AndOrLogic +'(upper(stock.SDescription) like ' + QuotedStr('%'+ECode2.Text +'%' ) +
                '  or upper('+ExtraDesc+') like ' + QuotedStr('%'+ECode2.Text +'%' ) +')' );
           else
            ZQStock.SQL.Add(AndOrLogic +'stock.SStockCode like ' + QuotedStr('%'+ECode2.Text +'%' ));
           end ; // end case
    end;
   end;

 if cbAutogroup.ItemIndex > 0  then
    begin
       ZQStock.SQL.Add(' and  stock.WReportingGroup1id in (' + TDataBaseRoutines.GetChildIDsFromGroupID(Integer(cbAutogroup.Items.Objects[cbAutogroup.ItemIndex] ),0) +')' ) ;
    end;

 if cbGroup2.ItemIndex > 0  then
    begin
       ZQStock.SQL.Add(' and  stock.WReportingGroup2id in (' + TDataBaseRoutines.GetChildIDsFromGroupID(Integer(cbGroup2.Items.Objects[cbGroup2.ItemIndex] ),0) +')' ) ;
    end;

 if (DefSupplier <> 0) or (cbCreditor.ItemIndex > 0 ) then
    begin
     if ListCreditor and (cbCreditor.ItemIndex > 0 ) then
         begin
           ZQStock.SQL.Add('   and (WSUPPLIER1ID = ' + IntToStr(Integer(cbCreditor.items.objects[cbCreditor.ItemIndex])) + ' or WSUPPLIER2ID = ' + IntToStr(Integer(cbCreditor.items.objects[cbCreditor.ItemIndex])) + ' )')
         end else
     ZQStock.SQL.Add('   and (WSUPPLIER1ID = ' + IntToStr(DefSupplier) + ' or WSUPPLIER2ID = ' + IntToStr(DefSupplier) + ' or WSUPPLIER1ID = 0 or WSUPPLIER1ID is null)') ;
   end;
 if ExtraFilter <> '' then
    ZQStock.SQL.Add(' and (' +  ExtraFilter +')');
 ZQStock.open ;
 end;
 Look := '' ;
 Label1.Caption := DMTCCoreLink.GetTextLangNoAmp(944){search by} + ':'  + Look ;
 if self.Visible then
 cxGrid1.SetFocus ;
end;

procedure TfmPosLookup.ECodeKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
   begin
     BsearchClick(self);
     key := #0 ;
   end;
end;

procedure TfmPosLookup.CBLogicChange(Sender: TObject);
begin
cbField2.Visible := CBLogic.ItemIndex > 0 ;
ECode2.Visible := CBLogic.ItemIndex > 0 ;
end;

procedure TfmPosLookup.ECode2KeyPress(Sender: TObject; var Key: Char);
begin
 
 if key = #13 then
   begin
     BsearchClick(self);
     key := #0 ;
   end;
end;

procedure TfmPosLookup.Button1Click(Sender: TObject);
begin
   ECode.Text := '' ;
   ECode2.Text := '' ;
   cbAutogroup.ItemIndex := -1 ;
   cbGroup2.ItemIndex := -1 ;
   //cbCreditor.ItemIndex := -1;
end;

procedure TfmPosLookup.FormCreate(Sender: TObject);
begin
 DMTCCoreLink.AssignConnectionToChilds(self);
 ButtonList := TStringlist.Create ;
 BreadCrumb := TStringlist.Create ;
 STKSQLOnlyForLookup := DMTCCoreLink.ReadNwReportOp('STKSQLOnlyForLookup',false) ;
 LimitStockToCreditor  := DMTCCoreLink.ReadNwReportOp('STKSTOCKLIMITCREDITOR',false) ;
 ListCreditor :=  DMTCCoreLink.ReadNwReportOp('STKSTOCKLISTCREDITOR',false) ;
  if not ListCreditor then
     begin
        cbCreditor.Visible := False ;
        LCreditor.Visible := False ;
        PFind.Height := LCreditor.Top ;
     end;
     ISSalesmen := DMTCCoreLink.ReadSysParam('WLOGINSALESMANLINK', 0, DMTCCoreLink.currentuser)  <> 0 ;
end;

procedure TfmPosLookup.FormDestroy(Sender: TObject);
begin
 ButtonList.free ;
 BreadCrumb.free ;
end;

procedure TfmPosLookup.OnLastAction(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   BreadCrumb.Delete(BreadCrumb.Count-1);
   if BreadCrumb.Count <> 0 then
   BEGIN
   HandelButtons(StrToInt(BreadCrumb[BreadCrumb.Count-1]));
   BreadCrumb.Delete(BreadCrumb.Count-1);
   END;
end;

procedure TfmPosLookup.ZQStockAfterScroll(DataSet: TDataSet);
begin
  if ButtonStyle then exit ;
  TShowDetail.Enabled := false ;
  StatusBar.Panels[0].Text := '' ;
  StatusBar.Panels[1].Text := '' ;
  StatusBar.Panels[2].Text := '' ;
  StatusBar.Panels[3].Text := '' ;
  StatusBar.Panels[4].Text := '' ;
  StatusBar.Panels[5].Text := '' ;
  StatusBar.Panels[6].Text := '' ;
  StatusBar.Panels[7].Text := '' ;


  TShowDetail.Enabled := true ;
end;

procedure TfmPosLookup.TShowDetailTimer(Sender: TObject);
var
 Total , QtyOnHand : Variant ;
 Stockid : Integer ;
 AStockRec : TStockRec ;
begin

  TShowDetail.Enabled := false ;
    if ButtonStyle then exit ;
  StatusBar.Panels[0].Text := '' ;
  StatusBar.Panels[1].Text := '' ;
  StatusBar.Panels[2].Text := '' ;
  StatusBar.Panels[3].Text := '' ;
  StatusBar.Panels[4].Text := '' ;
  StatusBar.Panels[5].Text := '' ;
  StatusBar.Panels[6].Text := '' ;
  StatusBar.Panels[7].Text := '' ;

  if ButtonStyle then
    Stockid :=  LastButtonStock  
  else
  Stockid :=  ZQStockWSTOCKID.AsInteger ;
  AStockRec.WStockID := Stockid ;
  TDataBaseStockRoutines.StockLoadItem(AStockRec) ;

  Total := 0 ;
  QtyOnHand := TDataBaseStockRoutines.GetStockQty(Stockid) ;

  if varToStr(QtyOnHand) <> '' then
  Total := QtyOnHand ;
  TShowDetail.Enabled := False ;
  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(Stockid,10,-1);
   if varToStr(QtyOnHand) <> '' then
  Total := Total - QtyOnHand ;
  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(Stockid,11,-1);
   if varToStr(QtyOnHand) <> '' then
  Total := Total + QtyOnHand ;
  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(Stockid,12,-1);
   if varToStr(QtyOnHand) <> '' then
  Total := Total + QtyOnHand ;
  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(Stockid,13,-1);
   if varToStr(QtyOnHand) <> '' then
  Total := Total - QtyOnHand ;
  StatusBar.Panels[0].Text := DMTCCoreLink.GetTextLang(3329)+ ' : ' +FloatToStr(Total) ;

  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(Stockid,14,-1);
   if Trim(varToStr(QtyOnHand)) <> '' then
  Total := Total - QtyOnHand ;
   if Trim(varToStr(QtyOnHand)) <> '' then
  StatusBar.Panels[1].Text := DMTCCoreLink.GetTextLang(3330)+ ' : ' +  FloatToStr(QtyOnHand) ;

  QtyOnHand := TDataBaseStockRoutines.GetUnpostedStockITemCountFromType(Stockid,15,-1);
  if varToStr(QtyOnHand) <> '' then
  Total := Total + QtyOnHand ;
  if varToStr(QtyOnHand) <> '' then
  StatusBar.Panels[2].Text :=  DMTCCoreLink.GetTextLang(3333)+ ' : ' +FloatToStr(QtyOnHand) ;
  StatusBar.Panels[3].Text :=  DMTCCoreLink.GetTextLang(3334)+ ' : ' + FloatToStr(Total) ;
  StatusBar.Panels[4].Text :=  DMTCCoreLink.GetTextLang(3331)+ '1 : '+FloatToStr(AStockRec.FPrice1) + '(' + FloatToStr(AStockRec.FPrice1 * TDataBaseRoutines.GetTaxRateOnId(AStockRec.WOutputTaxID))+ ')' ;
  StatusBar.Panels[5].Text :=  DMTCCoreLink.GetTextLang(3331)+ '2 : ' +FloatToStr(AStockRec.FPrice2) + '(' +FloatToStr(AStockRec.FPrice2 * TDataBaseRoutines.GetTaxRateOnId(AStockRec.WOutputTaxID)) + ')' ;
  StatusBar.Panels[6].Text :=  DMTCCoreLink.GetTextLang(3331)+ '3 : ' +FloatToStr(AStockRec.FPrice3) + '(' +FloatToStr(AStockRec.FPrice3 * TDataBaseRoutines.GetTaxRateOnId(AStockRec.WOutputTaxID)) + ')' ;
  if Not ISSalesmen then
    StatusBar.Panels[7].Text :=  DMTCCoreLink.GetTextLang(3332)+ ' : ' +FloatToStr(AStockRec.FUnitCost) + '(' +FloatToStr(AStockRec.FUnitCost * TDataBaseRoutines.GetTaxRateOnId(AStockRec.WOutputTaxID))  + ')' ;

end;

procedure TfmPosLookup.ZQStockBeforeOpen(DataSet: TDataSet);
begin

 if (DataSet is TuniQuery) then
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') +' where stock.WStockid is null  ');
end;

procedure TfmPosLookup.ButtonEnter(Sender: TObject);
begin
LastButtonStock := StrToInt(Copy((sender As Tcomponent).Name,4,20)) ;
//TShowDetail.Enabled := false ;
//TShowDetail.Enabled := True ;
end;

procedure TfmPosLookup.cbAutoClick(Sender: TObject);
begin
 cbBarCode.OnClick := nil ;
  cbCode.OnClick := nil ;
  cbDescription.OnClick := nil ;
  cbAuto.OnClick := nil ;
  if cbAuto.Checked then
     begin
        cbCode.State := cbUnchecked ;
        cbDescription.State := cbUnchecked ;
        cbBarCode.State := cbUnchecked ;
     end else
     begin
      cbCode.State := cbchecked ;
      cbBarCode.State := cbUnchecked ;
      cbDescription.State := cbUnchecked ;
     end;


cxGrid1DBTableView1.DataController.ClearSorting(True);


  cbBarCode.OnClick := cbBarCodeClick ;
  cbCode.OnClick := cbCodeClick ;
  cbDescription.OnClick := cbDescriptionClick ;
  cbAuto.OnClick := cbAutoClick ;     
end;

procedure TfmPosLookup.ShowHideCredlist(AVisible: Boolean);
begin
 if ListCreditor then
     begin
       if AVisible then
        begin
        PFind.Height := 189 ;
        LCreditor.Visible := True ;
        cbCreditor.Visible := True ;
        end else
        begin
        PFind.Height := LCreditor.Top ;
        LCreditor.Visible := false ;
        cbCreditor.Visible := False ;
        end;
     end;

end;

end.
