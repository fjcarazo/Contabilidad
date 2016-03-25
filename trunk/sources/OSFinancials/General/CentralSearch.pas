unit CentralSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB,Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, ToolWin, jpeg,
  Spin,    DBAccess , Uni,tcashclasses,
  Menus,UosfResources, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxListView;

type
  TfmInvestigator = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Shape1: TShape;
    btnSearch: TBitBtn;
    btnStop: TBitBtn;
    Shape2: TShape;
    Label3: TLabel;
    Panel2: TPanel;
    Bevel1: TBevel;
    ToolBar1: TToolBar;
    tblSearch: TToolButton;
    Splitter1: TSplitter;
    LblMsg: TLabel;
    Panel4: TPanel;
    lblMoreInfo: TLabel;
    LblBig: TLabel;
    Shape3: TShape;
    Image1: TImage;
    edtSearch: TComboBox;
    Animate1: TAnimate;
    Label4: TLabel;
    Label5: TLabel;
    Panel5: TPanel;
    Label6: TLabel;
    cbin: TCheckBox;
    cbLeft: TCheckBox;
    cbRight: TCheckBox;
    cbCase: TCheckBox;
    Panel6: TPanel;
    cbAll: TCheckBox;
    cbDocs: TCheckBox;
    cbBatches: TCheckBox;
    cbStockInf: TCheckBox;
    cbAccNames: TCheckBox;
    cbAccInfo: TCheckBox;
    Label7: TLabel;
    Panel7: TPanel;
    SearchView: TcxListView;
    Splitter2: TSplitter;
    nbDetails: TNotebook;
    LvDetails: TcxListView;
    tblDetails: TToolButton;
    Label11: TLabel;
    Panel8: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label8: TLabel;
    MaxRec: TSpinEdit;
    StatusBar1: TStatusBar;
    ZTblMessage: TuniTable;
    ZTblMessageWMESSAGEID: TIntegerField;
    ZTblMessageSDESCRIPTION: TStringField;
    ZTblMessageSEXTRADESCRIPTION: TStringField;
    ZRQLocSerialBatch: TuniQuery;
    PopupMenu1: TPopupMenu;
    Showdetail1: TMenuItem;
    Links1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure tblSearchClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure SearchViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure SearchViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure SearchViewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchViewDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tblDetailsClick(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZTblMessageBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FindCount:Integer;
    AscSort:Boolean;
    FSearching: Boolean;
    LinkToList :TStringList ;
    Function  DoLogTest(aText2:string):Boolean;
    procedure AccNameRecordFilter(DataSet: TDataSet;var Accept: Boolean);
    procedure StkinfoRecordFilter(DataSet: TDataSet;var Accept: Boolean);
    procedure DebtorRecordFilter(DataSet: TDataSet;var Accept: Boolean);
    procedure CreditorRecordFilter(DataSet: TDataSet;var Accept: Boolean);
    procedure MessageRecordFilter(DataSet: TDataSet;var Accept: Boolean);
    procedure DocHeadRecordFilter(DataSet: TDataSet;var Accept: Boolean);
    procedure TransactRecordFilter(DataSet: TDataSet;var Accept: Boolean);
    Procedure UpdateMsg;
    Procedure SearchNow;
    Procedure SearchAccNames;
    Procedure SearchStockInfo;
    Procedure SearchAccInfo;
    Procedure CheckRefine;
    Procedure SearchDocuments;
    Procedure SearchTransacts;
    Procedure ShowDetails;
    Procedure ShowAccDetails;
    Function CheckLimit:Boolean;
    Procedure CleanProcess;
    procedure SetSearching(const Value: Boolean);
    procedure GoToDocFromTagOfSender(Sender: TObject);

  public
    property Searching : Boolean  read FSearching write SetSearching;
    { Public declarations }
  end;

var
  fmInvestigator: TfmInvestigator;

  AcIndex:Integer = 0;
  RecPrg : LongInt = 0;

implementation

uses Main, Database, GlobalFunctions, TcVariables, DatabaseAccess,debtor,TAccountView,
  UDMTCCoreLink, OSFGeneralRoutines, UPluginsSharedUnit;

{$R *.dfm}

Function TfmInvestigator.CheckLimit:Boolean;
begin
  Result := FindCount>=MaxRec.Value;
  if Result then
    begin
    OSFMessageDlg(GetTextLang(1161),mtinformation,[mbok],0);
    Searching := Not Result ;
    end;
end;

Function TfmInvestigator.DoLogTest(aText2:string):Boolean;
Var
  iPos:Integer;
  aText1:String;
begin
  aText1:=edtSearch.Text;
  if not cbCase.Checked then
  begin
    aText1:=LowerCase(aText1);
    aText2:=LowerCase(aText2);
  end;
  iPos:=Pos(aText1,aText2);
  Result := False;
  if cbIn.Checked then
    Result :=iPos<>0;
  if cbLeft.Checked then
    Result := Result or (iPos=1);
  if cbRight.Checked then
    Result := Result or (iPos+Length(aText1)-1=length(atext2)) AND (iPos<>0)
end;

procedure TfmInvestigator.SpeedButton1Click(Sender: TObject);
begin
  Panel3.Visible := False;
end;

procedure TfmInvestigator.tblSearchClick(Sender: TObject);
begin
  Panel3.Visible := True;
end;

Procedure TfmInvestigator.UpdateMsg;
begin
  LblMsg.Caption := IntToStr(FindCount)+' '+'Found';
  LblMsg.Repaint;
  if not Searching then
   abort;
end;


procedure TfmInvestigator.btnSearchClick(Sender: TObject);
begin
  RecPrg:=0;
  FindCount:=0;
  Searching:=True;
  btnSearch.Enabled:=False;
  SearchView.SortType:=stNone;
  SearchView.Clear;
  btnStop.Enabled:=True;
  Animate1.Active:=True;
  Animate1.Visible:=True;
  AscSort:=False;
  SearchNow;
  UpdateMsg;
  btnStopClick(Sender);
  if FindCount>0 then
  begin
    lblMoreInfo.Caption:='Select an item to view more information';
  end
  else
    lblMoreInfo.Caption:='';
  StatusBar1.Panels[1].Text:='';
end;

Procedure TfmInvestigator.CleanProcess;
begin

  dmDatabase.tblAccount.Close;
 
  dmDatabase.tblAccount.OnFilterRecord:=nil;
  dmDatabase.tblAccount.Filtered:=False;

  dmDatabase.tblStock.Close;

  dmDatabase.tblStock.OnFilterRecord:=nil;
  dmDatabase.tblStock.Filtered:=False;

  dmDatabase.tblDebtor.Close;

  dmDatabase.tblDebtor.OnFilterRecord:=nil;
  dmDatabase.tblDebtor.Filtered:=False;

  dmDatabase.tblCreditor.Close;

  dmDatabase.tblCreditor.OnFilterRecord:=nil;
  dmDatabase.tblCreditor.Filtered:=False;

  dmDatabase.tblDocHeader.Close;
  dmDatabase.tblDocLine.Close;

  ZTblMessage.OnFilterRecord:=nil;
  dmDatabase.tblDocHeader.OnFilterRecord:=nil;
  dmDatabase.tblDocHeader.Filtered:=False;
  dmDatabase.tblDocLine.Filtered:=False;
  dmDatabase.tblDocLine.Filter:='';
  dmDatabase.tblDocHeader.Filter:='';

  dmDatabase.ZQTransAction.close;

end;

procedure TfmInvestigator.btnStopClick(Sender: TObject);
begin
  Searching:=False;
  Application.ProcessMessages ;
  btnStop.Enabled:=False;
  btnSearch.Enabled:=True;
  Animate1.Stop;
  Animate1.Visible:=False;
  StatusBar1.Panels[1].Text:='';
end;

Procedure TfmInvestigator.SearchNow;
begin
  if Searching And(cbAccNames.Checked OR (cbAll.Checked)) then SearchAccNames;
  if Searching And(cbStockInf.Checked OR (cbAll.Checked)) then SearchStockInfo;
  if Searching And(cbAccInfo.Checked OR (cbAll.Checked)) then SearchAccInfo;
  if Searching And(cbDocs.Checked OR (cbAll.Checked)) then SearchDocuments;
  if Searching And (cbBatches.Checked or cbAll.Checked) then SearchTransacts;
end;


procedure TfmInvestigator.AccNameRecordFilter(DataSet: TDataSet;var Accept: Boolean);
begin
  Accept:= DoLogTest(dmDatabase.tblAccountSDescription.Value);
  Accept:= Accept or DoLogTest(dmDatabase.tblAccountSACCOUNTCODE.Value);
end;

procedure TfmInvestigator.StkinfoRecordFilter(DataSet: TDataSet;var Accept: Boolean);
begin
  Accept:= DoLogTest(dmDatabase.tblStockSSTOCKCODE.Value);
  Accept := Accept Or DoLogTest(dmDatabase.tblStockSDescription.Value);
end;

procedure TfmInvestigator.MessageRecordFilter(DataSet: TDataSet;var Accept: Boolean);
begin
  Accept:= DoLogTest(ZTblMessageSdescription.Value);
  Accept := Accept Or DoLogTest(ZTblMessageSExtradescription.Value);
end;

procedure TfmInvestigator.TransactRecordFilter(DataSet: TDataSet;var Accept: Boolean);
begin
  Accept:= DoLogTest(dmDatabase.ZQTransActionFAMOUNT.AsString);
  Accept := Accept Or DoLogTest(dmDatabase.ZQTransActionFTaxAmount.AsString);
  Accept := Accept Or DoLogTest(ReadDescription(dmDatabase.ZQTransActionWDESCRIPTIONID.AsInteger));
end;


procedure TfmInvestigator.DebtorRecordFilter(DataSet: TDataSet;var Accept: Boolean);
begin

  Accept:= DoLogTest(dmDatabase.tblDebtorSPostal1.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSPostal2.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSPostal3.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSPostalCode.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSDelivery1.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSDelivery2.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSDelivery3.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSDeliveryCode.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSTelephone1.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSTelephone2.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSFax.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSEmail.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSBankName.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSBranchCode.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSBankAccountNumber.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSBankAccountName.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSCreditCardNumber.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSCreditCardType.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblDebtorSCreditCardHolder.Value);
end;

procedure TfmInvestigator.CreditorRecordFilter(DataSet: TDataSet;var Accept: Boolean);
begin

  Accept:= DoLogTest(dmDatabase.tblCreditorSPostal1.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSPostal2.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSPostal3.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSPostalCode.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSDelivery1.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSDelivery2.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSDelivery3.Value);
//  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSDeliveryCode.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSTelephone1.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSTelephone2.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSFax.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSEmail.Value);
//  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSBankName.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSBranchCode.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSBankAccountNumber.Value);
  Accept:= Accept Or DoLogTest(dmDatabase.tblCreditorSBankAccountName.Value);
end;

procedure TfmInvestigator.DocHeadRecordFilter(DataSet: TDataSet;var Accept: Boolean);
  Function LookInDocLines:Boolean;
  begin
    Result :=False;
    dmDatabase.tblDocLine.sql.Text :='select * from docline where WDocID=' + IntToStr(dmDatabase.tblDocHeaderWDocID.Value);
    dmDatabase.tblDocLine.Open;
    While not dmDatabase.tblDocLine.Eof do
    begin

      Result := DoLogTest(ReadDescription(dmDatabase.tblDocLineWDescriptionID.Value)) or
               DoLogTest( TDataBaseStockRoutines.GetStockFullDescription(dmDatabase.tblDocLineWStockID.Value));
      if Result Then Break;
      Result:=Result Or DoLogTest(dmDatabase.tblDocLineFInclusiveAmt.DisplayText) or
         DoLogTest(dmDatabase.tblDocLineFExclusiveAmt.DisplayText) or
         DoLogTest(dmDatabase.tblDocLineFTaxAmount.DisplayText);
      if Result Then Break;
      // added serial batch etc
        ZRQLocSerialBatch.close ;
        ZRQLocSerialBatch.ParamByName('wdocid').AsInteger := dmDatabase.tblDocLineWDOCID.AsInteger ;
        ZRQLocSerialBatch.ParamByName('wlineid').AsInteger := dmDatabase.tblDocLineWDOCLINEID.AsInteger ;
        ZRQLocSerialBatch.ParamByName('wdocid2').AsInteger := dmDatabase.tblDocLineWDOCID.AsInteger ;
        ZRQLocSerialBatch.ParamByName('wlineid2').AsInteger := dmDatabase.tblDocLineWDOCLINEID.AsInteger ;
        ZRQLocSerialBatch.Open ;
        while not ZRQLocSerialBatch.Eof do
          begin
             Result:=Result Or DoLogTest(ZRQLocSerialBatch.fieldByName('SDESCRIPTION').AsString)   ;
                   if Result Then exit;
            ZRQLocSerialBatch.Next ;
          end;
      dmDatabase.tblDocLine.Next;
    end;
    dmDatabase.tblDocLine.Filtered:=False;
    dmDatabase.tblDocLine.Filter:='';
  end;
begin
  Accept:= DoLogTest(dmDatabase.tblDocHeaderSReference.Value);
  Accept:= Accept Or  DoLogTest(dmDatabase.tblDocHeaderSDocNo.Value);
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWMessage1ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWMessage2ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWMessage3ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWDelAddress1ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWDelAddress2ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWDelAddress3ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWDelCodeID.Value));
  if Accept then Exit else
    Accept:=  DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWPostal1ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWPostal2ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWPostal3ID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(ReadDescription(dmDatabase.tblDocHeaderWPostalCodeID.Value));
  if Accept then Exit else
    Accept:= DoLogTest(dmDatabase.tblDocHeaderFDOCAMOUNT.DisplayText);
  if Accept then Exit else
    Accept:= DoLogTest(dmDatabase.tblDocHeaderFTAXAMOUNT.DisplayText);
  if Accept then Exit else
   Accept:= LookInDocLines;
end;

Procedure TfmInvestigator.SearchAccNames;
Var                  
  NewItem:TListItem;
  Accept : Boolean ;
begin
  Try
    dmDatabase.tblAccount.Close;
    dmDatabase.tblAccount.Filtered:=False;
    dmDatabase.tblAccount.Open;
    dmDatabase.tblAccount.First;
    while not dmDatabase.tblAccount.Eof and Searching do
    begin
      AccNameRecordFilter(dmDatabase.tblAccount,Accept);
      UpdateMsg;
      if accept then
      begin
      Inc(FindCount);
      NewItem := SearchView.Items.Add;
      NewItem.Caption := dmDatabase.tblAccountSDescription.Value;
      NewItem.SubItems.Add(dmDatabase.tblAccountSACCOUNTCODE.Value);
      NewItem.SubItems.Add('Account');
      NewItem.ImageIndex:=18;
      NewItem.SubItems.Add(DateToStr(date));
      NewItem.SubItems.Add(dmDatabase.tblAccountWAccountID.AsString);
      NewItem.SubItems.Add('A');
      end;
      dmDatabase.tblAccount.Next;
      // 2 times to handel of the click (one click and one click handel)
      Application.ProcessMessages;
      Application.ProcessMessages;
      if CheckLimit then Break;
    end;
  Finally
    dmDatabase.tblAccount.Filtered:=False;
    dmDatabase.tblAccount.Close;
  end;
end;

Procedure TfmInvestigator.SearchStockInfo;
Var
  NewItem:TListItem;
  Accept : Boolean ;
begin
  Try
    dmDatabase.tblStock.Close;
    dmDatabase.tblStock.Filtered:=False;
    dmDatabase.tblStock.Open;
    dmDatabase.tblStock.First;
    while not dmDatabase.tblStock.Eof and Searching do
    begin

     StkinfoRecordFilter(dmDatabase.tblStock,accept);
     UpdateMsg;
     if Accept then
     begin
      Inc(FindCount);
      NewItem := SearchView.Items.Add;
      NewItem.Caption := dmDatabase.tblStockSDescription.Value;
      NewItem.SubItems.Add(dmDatabase.tblStockSSTOCKCODE.Value);
      NewItem.SubItems.Add('Stock');
      NewItem.SubItems.Add(DateToStr(date));
      NewItem.SubItems.Add(dmDatabase.tblStockWSTOCKID.AsString);
      NewItem.SubItems.Add('');
     end;
      dmDatabase.tblStock.Next;
      // 2 times to handel of the click (one click and one click handel)
      Application.ProcessMessages;
      Application.ProcessMessages;
      if CheckLimit then Break;
    end;
  Finally
    dmDatabase.tblStock.OnFilterRecord:=nil;
    dmDatabase.tblStock.Filtered:=False;
    dmDatabase.tblStock.Close;
  end;
end;

Procedure TfmInvestigator.SearchAccInfo;
Var
  NewItem:TListItem;
  Accept : Boolean ;
begin
  Try
    dmDatabase.tblDebtor.Close;
    dmDatabase.tblAccount.Open;
    dmDatabase.tblDebtor.Filtered:=False;
    dmDatabase.tblDebtor.Open;
    dmDatabase.tblDebtor.First;
    while not dmDatabase.tblDebtor.Eof and Searching do
    begin
      dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblDebtorWAccountID.Value,[]);
      DebtorRecordFilter(dmDatabase.tblDebtor,Accept);
      UpdateMsg;
      if Accept then
      begin
      Inc(FindCount);
      NewItem := SearchView.Items.Add;
      NewItem.Caption := dmDatabase.tblAccountSDescription.Value;
      NewItem.SubItems.Add(dmDatabase.tblAccountSACCOUNTCODE.Value);
      NewItem.SubItems.Add('Debtor');
      NewItem.SubItems.Add(DateToStr(date));
      NewItem.SubItems.Add(dmDatabase.tblDebtorWAccountID.AsString);
      NewItem.SubItems.Add('');
      end;
      dmDatabase.tblDebtor.Next;
      // 2 times to handel of the click (one click and one click handel)
      Application.ProcessMessages;
      Application.ProcessMessages;
      if CheckLimit then Break;
    end;
  Finally
    dmDatabase.tblDebtor.Close;
  end;
  {Same For Creditors}
  dmDatabase.tblCreditor.Filtered := false ;
  dmDatabase.tblCreditor.Open;
  dmDatabase.tblCreditor.First;
  Try
    while not dmDatabase.tblCreditor.Eof and Searching do
    begin
      dmDatabase.tblAccount.Locate('WAccountID',dmDatabase.tblCreditorWAccountID.Value,[]);
      UpdateMsg;
      CreditorRecordFilter(dmDatabase.tblCreditor,Accept);
      If accept then begin
      Inc(FindCount);
      NewItem := SearchView.Items.Add;
      NewItem.Caption := dmDatabase.tblAccountSDescription.Value;
      NewItem.SubItems.Add(dmDatabase.tblAccountSACCOUNTCODE.Value);
      NewItem.SubItems.Add('Creditor');
      NewItem.SubItems.Add(DateToStr(date));
      NewItem.SubItems.Add(dmDatabase.tblCreditorWAccountID.AsString);
      NewItem.SubItems.Add('');
      end;
      dmDatabase.tblCreditor.Next;
      // 2 times to handel of the click (one click and one click handel)
      Application.ProcessMessages;
      Application.ProcessMessages;
      if CheckLimit then Break;
    end;
  Finally
    dmDatabase.tblCreditor.Close;
  end;
  dmDatabase.tblAccount.Close;
end;

Procedure TfmInvestigator.SearchTransacts;
Var
  NewItem:TListItem;
  SearchStr:string;
  Accept : Boolean ;
begin
  SearchStr:='';
  Try
    dmdatabase.tblBatchTypes.Open;
    dmDatabase.ZQTransAction.SQL.Text := 'select * from transact order by wtransactionid desc' ;

    dmDatabase.ZQTransAction.Open;

    while not dmDatabase.ZQTransAction.Eof and Searching do
    begin
      TransactRecordFilter(dmDatabase.ZQTransAction,Accept);
      UpdateMsg;
      if accept then
      begin
        Inc(FindCount);
        NewItem := SearchView.Items.Add;
        NewItem.Caption :=  ReadDescription(dmDatabase.ZQTransActionWDESCRIPTIONID.AsInteger);
        NewItem.SubItems.Add(GetBatchTypeName(dmDatabase.ZQTransActionWBatchTYpeID.AsInteger));
        NewItem.SubItems.Add('Batch');


        NewItem.SubItems.Add(dmDatabase.ZQTransActionDDAte.AsString);
        NewItem.SubItems.Add(dmDatabase.ZQTransActionWBatchID.AsString);
        NewItem.SubItems.Add(dmDatabase.ZQTransActionWLineID.AsString);

        NewItem.ImageIndex:=20;
      end;
      dmDatabase.ZQTransAction.Next;
      // 2 times to handel of the click (one click and one click handel)
      Application.ProcessMessages;
      Application.ProcessMessages;
      if CheckLimit then Break;
    end;
  Finally

    dmDatabase.ZQTransAction.Close;
    dmdatabase.tblBatchTypes.Close;

  end;
end;


Procedure TfmInvestigator.SearchDocuments;
Var
  NewItem:TListItem;
  SearchStr:string;
  Accept : Boolean ;
begin
  SearchStr:='';
  Try
  {  ZTblMessage.Close;
    ZTblMessage.Filtered:=False;
    ZTblMessage.Filter:='';
    ZTblMessage.OnFilterRecord:=MessageRecordFilter;
    ZTblMessage.Filtered:=True;
    ZTblMessage.Open;   }
    {DocHeader}
    dmDatabase.tblDocHeader.Close;
    dmDatabase.tblDocHeader.SQL.Text := 'select * from dochead order by Wdocid desc';
    dmDatabase.tblDocHeader.Filtered:=False;
    dmDatabase.tblDocHeader.Filter:='';
  //  dmDatabase.tblDocHeader.OnFilterRecord:=DocHeadRecordFilter;
    dmDatabase.tblDocHeader.Filtered:=True;
    dmDatabase.tblDocHeader.Open;
    dmDatabase.tblDocLine.SQL.Text := 'select * from docline order by Wdocid desc';
    dmDatabase.tblDocLine.Open;
    dmDatabase.tblDocHeader.First;
    while not dmDatabase.tblDocHeader.Eof and Searching do
    begin
      DocHeadRecordFilter(dmDatabase.tblDocHeader, Accept) ;
      UpdateMsg;
      if Accept then
       begin
          Inc(FindCount);
          NewItem := SearchView.Items.Add;
          NewItem.Caption := GetDocName(dmDatabase.tblDocHeaderWTypeID.Value)+' Details';
          NewItem.SubItems.Add(dmDatabase.tblDocHeaderSDocNo.Value);
          NewItem.SubItems.Add('Document');
          NewItem.SubItems.Add(dmDatabase.tblDocHeaderDDAte.AsString);
          NewItem.SubItems.Add(dmDatabase.tblDocHeaderWDocID.AsString);
          NewItem.SubItems.Add('');
       end;
      dmDatabase.tblDocHeader.Next;
      // 2 times to handel of the click (one click and one click handel)
      Application.ProcessMessages;
      Application.ProcessMessages;
      if CheckLimit then Break;
    end;
  Finally
    ZTblMessage.OnFilterRecord:=nil;
    dmDatabase.tblDocHeader.OnFilterRecord:=nil;
    dmDatabase.tblDocHeader.Close;
    dmDatabase.tblDocLine.Close;
    dmDatabase.tblDocHeader.Filtered:=False;
    dmDatabase.tblDocLine.Filtered:=False;
    dmDatabase.tblDocLine.Filter:='';
    dmDatabase.tblDocHeader.Filter:='';
  end;
end;



procedure TfmInvestigator.SearchViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
 tblDetails.Visible :=  Item.SubItems[4] ='A' ;

  LblBig.Caption:=Item.Caption;
  lblMoreInfo.Caption:='';
  if SameText(Item.SubItems[1],'Document') then
  begin
    lblMoreInfo.Caption:='Double-Click on the item to view the '+ Item.Caption
  end
  else if SameText(Item.SubItems[1],'Account') then
  begin
    lblMoreInfo.Caption:='Account Code:'+#13#10+'   '+Item.SubItems[0]+#13#10
       + 'Account Description:'+#13#10+'   '+ Item.Caption+#13#10
  end;
  ShowDetails;
end;

procedure TfmInvestigator.SearchViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if AcIndex<>Column.Index then
    AscSort:= True
  else
    AscSort:= Not AscSort;
  if Column.Index<=3 then
  AcIndex:=Column.Index;
  SearchView.AlphaSort;
end;

procedure TfmInvestigator.SearchViewCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  Case AcIndex of
  0: if AscSort then
      Compare:= CompareText(Item1.Caption,Item2.Caption)
     else
      Compare:= CompareText(Item2.Caption,Item1.Caption) ;
  else
    if AscSort then
      Compare:= CompareText(Item1.SubItems[AcIndex-1],Item2.SubItems[AcIndex-1])
    else
      Compare:= CompareText(Item2.SubItems[AcIndex-1],Item1.SubItems[AcIndex-1]);
  end;

end;

procedure TfmInvestigator.Label5Click(Sender: TObject);
begin
  panel5.BringToFront;
  panel5.Visible:=True;
end;

Procedure TfmInvestigator.CheckRefine;
begin
  if Not cbCase.Checked And Not cbLeft.Checked And Not CbRight.Checked then
    cbIn.Checked:=True;
end;

procedure TfmInvestigator.Label6Click(Sender: TObject);
begin
  panel5.SendToBack;
  panel5.Visible:=False;
end;

procedure TfmInvestigator.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
  begin
    Key:=0;  
    btnSearchClick(sender);
  end;
end;

procedure TfmInvestigator.SearchViewDblClick(Sender: TObject);
var
   aTAccountView : TfmTAccountView;
    fmDebtor: TfmDebtor;
begin
  if SearchView.Selected=nil Then Exit;
  if SameText(SearchView.Selected.SubItems[1],'Document') then
    PreviewDocument(0,StrToIntDef(SearchView.Selected.SubItems[3],0));

  if SameText(SearchView.Selected.SubItems[1],'Debtor') then
    begin
      
      fmDebtor := TfmDebtor.Create(application);
      try
      fmDebtor.UseCreditor:=False;
      fmDebtor.GoToId :=   StrToIntDef(SearchView.Selected.SubItems[3],0) ;
      fmDebtor.ShowModal;
      finally
      FreeAndNil(fmDebtor);
      end;
    end;
  if SameText(SearchView.Selected.SubItems[1],'Creditor') then
    begin
      
      fmDebtor := TfmDebtor.Create(application);
      try
      fmDebtor.UseCreditor:=True;
      fmDebtor.GoToId :=   StrToIntDef(SearchView.Selected.SubItems[3],0) ;
      fmDebtor.ShowModal;
      finally
      FreeAndNil(fmDebtor);
      end;
    end;
  if SameText(SearchView.Selected.SubItems[1],'Account') then
     begin
      aTAccountView := TfmTAccountView.Create(self);
      try
      aTAccountView.Name := 'AccViewer' ;
      aTAccountView.GoToId := StrToIntDef(SearchView.Selected.SubItems[3],0) ;
      SetUpForm(aTAccountView);
      aTAccountView.ShowModal;
      finally
       aTAccountView.free ;
      end;

     end;
  if SameText(SearchView.Selected.SubItems[1],'Batch') then
     begin
      aTAccountView := TfmTAccountView.Create(self);
      try
      aTAccountView.Name := 'AccViewer' ;
      aTAccountView.aFromDate := StrToDateDef(SearchView.Selected.SubItems[2],date);
      aTAccountView.aTodate := StrToDateDef(SearchView.Selected.SubItems[2],date) + 1 ;

      aTAccountView.GoToSql := ' a.WBatchid = ' + IntToStr(StrToIntDef(SearchView.Selected.SubItems[3],0))+' and (a.WLineID = ' + SearchView.Selected.SubItems[4] + ' or a.WLINKEDID  = ' + SearchView.Selected.SubItems[4] +  ')' ;
      aTAccountView.GoSubSql := ' a.WBatchid = ' + IntToStr(StrToIntDef(SearchView.Selected.SubItems[3],0))+' and (a.WLineID = ' + SearchView.Selected.SubItems[4] + ' or a.WLINKEDID  = ' + SearchView.Selected.SubItems[4] +  ')' ;

     
      SetUpForm(aTAccountView);
      aTAccountView.ShowModal;
      finally
       aTAccountView.free ;
      end;

     end;
end;

Procedure TfmInvestigator.ShowDetails;
  procedure HideDetails;
  begin
     Splitter2.Visible := False;
     nbDetails.Height := 0;
  end;
begin
  if Not tblDetails.Down then Exit;
  if SearchView.Selected=nil then exit;
  if SearchView.Selected.SubItems[4]='A' then
    ShowAccDetails
  else
    HideDetails;
end;

Procedure TfmInvestigator.ShowAccDetails;
Var
  NewCol:TListColumn;
  NewItem:TListItem;
  aAccRec:TAccountRec;
  i:Integer;
  FCum:Real;
begin
  LvDetails.Clear;
  LvDetails.Columns.Clear;
  NewCol:=LvDetails.Columns.Add;
  NewCol.Caption:='Period';
  NewCol.Width:=50;
  NewCol:=LvDetails.Columns.Add;
  NewCol.Caption:='Start';
  NewCol.Alignment:=taRightJustify;
  NewCol.Width:=80;
  NewCol:=LvDetails.Columns.Add;
  NewCol.Caption:='End';
  NewCol.Alignment:=taRightJustify;
  NewCol.Width:=80;
  NewCol:=LvDetails.Columns.Add;
  NewCol.Caption:='Balances';
  NewCol.Alignment:=taRightJustify;
  NewCol.Width:=80;
  NewCol:=LvDetails.Columns.Add;
  NewCol.Caption:='Cumul';
  NewCol.Width:=80;
  NewCol.Alignment:=taRightJustify;
  aAccRec.WAccountID:=StrToIntDef(SearchView.Selected.SubItems[3],0);
  FCum:=0;
  dmDatabase.tblPeriods.Open;
  if GetTotalsByPeriods(aAccRec) then ;
  For i:=0 to 26 do
  begin
    dmDatabase.tblPeriods.Locate('WPeriodID',i,[]);
    NewItem := LvDetails.Items.Add;
    NewItem.Caption:=IntToStr(i);
    if i=0 then
    begin
      NewItem.SubItems.Add('Opening');
      NewItem.SubItems.Add('');
    end  
    else
    begin
      NewItem.SubItems.Add(FormatDateTime('dd mmm yyyy',dmDatabase.tblPeriodsDSTartDate.Value));
      NewItem.SubItems.Add(FormatDateTime('dd mmm yyyy',dmDatabase.tblPeriodsDEndDate.Value));
    end;
    NewItem.SubItems.Add(FLoatToStr(RoundAmount(aAccRec.FBalances[i])));
    if aAccRec.BIncExp AND (i=14) then FCum:=0;
    FCum:=FCum + RoundAmount(aAccRec.FBalances[i]);
    NewItem.SubItems.Add(FLoatToStr(FCum));
  end;
  dmDatabase.tblPeriods.Close;
  nbDetails.Visible := True ;
  Splitter2.Visible := True;
end;

procedure TfmInvestigator.FormShow(Sender: TObject);
begin
    Caption := GetTextLang(1203); //Investigator
    tblSearch.Caption :='F3:'+ GetTextLang(1204); ////Search
    if DMTCCoreLink.SimpleMode = 1 then
       begin
          cbDocs.Visible := False ;
       end;
    tblDetails.Caption :='F4:'+ GetTextLang(930); //Details
    Label2.Caption := GetTextLang(1205)+':'; //Serach For:
    btnSearch.Caption := GetTextLang(1206); //Search Now
    btnStop.Caption := GetTextLang(897);//Stop
    cbCase.Caption := GetTextLang(1214);//Case Sensitive
    cbin.Caption := GetTextLang(1215);//Whereever in
    cbLeft.Caption := GetTextLang(1216);//Starting position
    cbRight.Caption := GetTextLang(1217);//Ending
    Label11.Caption := GetTextLang(1218)+' >>';//More >>
    cbRight.Caption := GetTextLang(1217);//Ending
    Label7.Caption := GetTextLang(1219); //Search Options
    Label10.Caption := GetTextLang(1207); //Advanced Options
    Label9.Caption := '<< '+ GetTextLang(1208); //<< Back
    Label6.Caption := Label9.Caption;
    Label5.Caption := GetTextLang(1209); //Refine Search
    Label8.Caption := GetTextLang(1210); // Record Found limit
    Label4.Caption := GetTextLang(1211); ////Type in what you are looking for if want to look a specific type check the corresponding button or Click down here to refine your serach
    Label1.Caption := GetTextLang(944); //Search
    Label3.Caption := GetTextLang(1212); //Search Tip
    cbAccInfo.Caption := GetTextLang(1213); //Accounts Informations
    cbAccNames.Caption := GetTextLang(1220); //Accounts Names
    cbAll.Caption := GetTextLang(1221); //Everything
    cbDocs.Caption := GetTextLang(38); //Documents
    cbStockInf.Caption := GetTextLang(103); //Stock Information
    cbBatches.Caption := GetTextLang(1071);  //Batches
    SearchView.Columns[0].Caption := GetTextLang(178); //Description
    SearchView.Columns[1].Caption := GetTextLang(607); //reference
    SearchView.Columns[2].Caption := GetTextLang(1079); //Type
    SearchView.Columns[3].Caption := GetTextLang(238); //Date
    SearchView.Columns[4].Caption := GetTextLang(1179); //key
    SearchView.Columns[5].Caption := GetTextLang(20076); //Unique lineno.
    SearchView.Columns[6].Caption := GetTextLang(238); //Checked.


  tblDetailsClick(Sender);

  edtSearch.SelectAll ;
  edtSearch.SetFocus ;

end;

procedure TfmInvestigator.tblDetailsClick(Sender: TObject);
begin
  if not tblDetails.Down then
  begin
    Splitter2.Visible := False;
    nbDetails.Visible := False ;
  end else
  ShowDetails ;
end;

procedure TfmInvestigator.Label11Click(Sender: TObject);
begin
  Panel8.BringToFront;
  Panel8.Visible:=True;
end;

procedure TfmInvestigator.Label9Click(Sender: TObject);
begin
  Panel5.BringToFront;
  Panel8.Visible:=False;
  Panel5.Visible:=True;
end;

procedure TfmInvestigator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CleanProcess;
end;

procedure TfmInvestigator.SetSearching(const Value: Boolean);
begin
 if FSearching <> Value then
  FSearching := Value;
end;

procedure TfmInvestigator.ZTblMessageBeforeOpen(DataSet: TDataSet);
begin
DMTCCoreLink.InitFieldLengtsForDatasetfields(ZTblMessage,'Select * from messages where WMEssageID is null');
end;

procedure TfmInvestigator.FormCreate(Sender: TObject);
begin
  DMTCCoreLink.AssignConnectionToChilds(self);
  cbStockInf.Checked := DMTCCoreLink.ReadSysParam('GSEARCH_STOCK',False,DMTCCoreLink.currentuser) ;
  cbAll.Checked := DMTCCoreLink.ReadSysParam('GSEARCH_ALL',True,DMTCCoreLink.currentuser) ;
  cbDocs.Checked := DMTCCoreLink.ReadSysParam('GSEARCH_DOC',False,DMTCCoreLink.currentuser) ;
  cbBatches.Checked := DMTCCoreLink.ReadSysParam('SEARCH_BATCH',False,DMTCCoreLink.currentuser) ;
  cbAccNames.Checked := DMTCCoreLink.ReadSysParam('SEARCH_ACCOUNTN',False,DMTCCoreLink.currentuser) ;
  cbAccInfo.Checked := DMTCCoreLink.ReadSysParam('SEARCH_ACCOUNT',False,DMTCCoreLink.currentuser) ;
  edtSearch.Text :=  DMTCCoreLink.ReadSysParam('SEARCH_LASTSEARCH','',DMTCCoreLink.currentuser) ;
  LinkToList :=TStringList.create ;
end;

procedure TfmInvestigator.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DMTCCoreLink.WriteSysParam('GSEARCH_STOCK',BoolToStr(cbStockInf.Checked,True),DMTCCoreLink.currentuser) ;

  DMTCCoreLink.WriteSysParam('GSEARCH_ALL',BoolToStr(cbAll.Checked,True),DMTCCoreLink.currentuser) ;
  DMTCCoreLink.WriteSysParam('GSEARCH_DOC',BoolToStr(cbDocs.Checked,True),DMTCCoreLink.currentuser) ;
  DMTCCoreLink.WriteSysParam('SEARCH_BATCH',BoolToStr(cbBatches.Checked,True),DMTCCoreLink.currentuser) ;
  DMTCCoreLink.WriteSysParam('SEARCH_ACCOUNTN',BoolToStr(cbAccNames.Checked,True),DMTCCoreLink.currentuser) ;
  DMTCCoreLink.WriteSysParam('SEARCH_ACCOUNT',BoolToStr(cbAccInfo.Checked,True),DMTCCoreLink.currentuser) ;
  DMTCCoreLink.WriteSysParam('SEARCH_LASTSEARCH',edtSearch.Text,DMTCCoreLink.currentuser) ;
end;

procedure TfmInvestigator.PopupMenu1Popup(Sender: TObject);
var
 i : Integer ;
  Amenu : tmenuitem ;
 aQuery : TuniQuery ;
begin
  Links1.Visible := False ;
 for i := Links1.ComponentCount -1 downto 0 do
   Links1.Components[i].free ;
 LinkToList.Clear ;

  if SearchView.Selected=nil Then Exit;
  if SameText(SearchView.Selected.SubItems[1],'Document') then
 if DMTCCoreLink.ExtraOptions.Values['DOCLINKLINES'] = 'True'  then
 begin
   aQuery := TuniQuery.create(nil) ;
   try
     aQuery.Connection := DMTCCoreLink.TheZConnection ;
     aQuery.sql.text := 'Select b.wdocid,trim( b.SDocno) || ' + QuotedStr(' ' ) + ' || trim(s.Sdescription) a ,0 b,a.Wdoclineid from docline a  join dochead b on a.wdocid = b.wdocid '+
     'join stock s on a.WstockId = S.Wstockid '+
     ' join DOC_LINK ad on a.WDOCID = ad.WFROMDOCID and a.WDOCLINEID = ad.WFROMDOCLINEID ' +
      ' and ad.WTODOCID = ' +  IntToStr(StrToIntDef(SearchView.Selected.SubItems[3],0)) +
     ' union ' +
     ' Select b.wdocid,trim( b.SDocno) || ' + QuotedStr(' ' ) + ' || trim(s.Sdescription) a ,1 b,a.Wdoclineid  '+
     ' from docline a join dochead b on a.wdocid = b.wdocid join stock s on a.WstockId = S.Wstockid '+
     ' join DOC_LINK ad on a.WDOCID = ad.WTODOCID and a.WDOCLINEID = ad.WTODOCLINEID '+
     ' and ad.WFROMDOCID = ' +  IntToStr(StrToIntDef(SearchView.Selected.SubItems[3],0)) + ' order by 3,2'  ;
     aQuery.open ;
     while not aQuery.Eof do
        begin
          Amenu := TMenuItem.Create(Links1);
          Amenu.Caption := aQuery.Fields[1].AsString ;
          Amenu.Tag := aQuery.Fields[0].AsInteger ;
          LinkToList.Values[aQuery.Fields[0].AsString] := aQuery.Fields[3].AsString ;
          Amenu.OnClick := GoToDocFromTagOfSender ;
          Links1.Add(Amenu);
          aQuery.Next ;
        end;
       Links1.Visible := not aQuery.IsEmpty ;
   finally
    aQuery.free ;
   end;
 end;

end;

procedure TfmInvestigator.GoToDocFromTagOfSender(Sender: TObject);
var
 i : Integer ;
 Aform : Tform ;
begin
 
 for i := 0 to WF_WorkFlowList.Count -1 do
  if TComponent(WF_WorkFlowList.Objects[i]).ClassName = 'twf_TfmDocument' then
     begin
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('DOCTYPE').AsInteger := 10 ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('LASTID').AsInteger :=  TComponent(Sender ).Tag ;
         TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Inparams.ParamByName('SUBPROCESS').AsString := 'SHOWMODAL';
          TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).Parent := nil ;
         Aform := TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkFlowStart ;
         try

         finally
           TWorkFlowImplementBase(WF_WorkFlowList.Objects[i]).WorkflowEnd(Aform)    ;
         end;
         break ;
     end;
end;


procedure TfmInvestigator.FormDestroy(Sender: TObject);
begin
LinkToList.free ;
end;

end.
