(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ContactListing;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, DB,StdCtrls, Buttons, ExtCtrls,
  VpBaseDS, VpBase, VpDBDS, VpFlxDS,VpContactTCEditDlg,DBAccess , Uni,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfmContactListing = class(TForm)
    ButtonPanel: TPanel;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    DestLbl: TLabel;
    cbDestination: TComboBox;
    lblCopies: TLabel;
    edtCount: TEdit;
    UpDown1: TUpDown;
    DataSource1: TDataSource;
    POkbutton: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    BAdd: TButton;
    BDelete: TButton;
    BEdit: TButton;
    VpFlexDataStore1: TVpFlexDataStore;
    VpControlLink1: TVpControlLink;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Timer1: TTimer;
    Panel1: TPanel;
    Panel6: TPanel;
    Filter: TLabel;
    Value: TLabel;
    CBFindColumn: TComboBox;
    CBOperatot: TComboBox;
    EFilterValue: TEdit;
    BFilter: TButton;
    BClearFilter: TButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1LASTNAME: TcxGridDBColumn;
    cxGrid1DBTableView1PHONE3: TcxGridDBColumn;
    cxGrid1DBTableView1PHONE1: TcxGridDBColumn;
    cxGrid1DBTableView1PHONE2: TcxGridDBColumn;
    cxGrid1DBTableView1EMAIL: TcxGridDBColumn;
    cxGrid1DBTableView1CITY: TcxGridDBColumn;
    cxGrid1DBTableView1STATE: TcxGridDBColumn;
    cxGrid1DBTableView1COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1COMPANY: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ADDRESS: TcxGridDBColumn;
    cxGrid1DBTableView1ZIP: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    //procedure lvContactDblClick(Sender: TObject);
    procedure lvContactKeyPress(Sender: TObject; var Key: Char);
    procedure cbDestinationChange(Sender: TObject);
    procedure edtCountChange(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BEditClick(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGSearchKeyPress(Sender: TObject; var Key: Char);
    procedure EFilterValueKeyPress(Sender: TObject; var Key: Char);
    procedure BFilterClick(Sender: TObject);
    procedure BClearFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGSearchDblClick(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure VpFlexDataStore1SetFilterCriteria(aTable: TDataSet;
      aUseDateTime: Boolean; aResourceID: Integer; aStartDateTime,
      aEndDateTime: TDateTime);
  private
    BDirection : Boolean ;
    IndexColumn : Integer ;
    procedure RefreshContacts(GoTOId : Integer = 0) ;
    { Private declarations }
  public
    EditID : Integer ;
    AddNew,InOPen : Boolean ;
    PickSearch : Boolean ;
    Look : String ;
    LastResult : Integer ;
    DefaultCountry,DefaultName,DefaultAdres1,DefaultAdres2,DefaultAdres3,DefaultPostal,DefaultTelephone,DefaultTelephone2,DefaultEMail,DefaultFax : String ;
    aVpContactTCEditDialog : TVpContactTCEditDialog ;
    { Public declarations }
    procedure OnContactAdd(Sender: TObject);    
  end;


implementation

uses Database,  Main, LanguageChoice, GlobalFunctions,
  TcVariables, DatabaseAccess,  VpDlg,vpMisc, UDMTCCoreLink,
  UReportManager, UDmQuantumGridDefs;

{$R *.DFM}



procedure TfmContactListing.FormShow(Sender: TObject);
var
 i : Integer ;
begin
 DMTCCoreLink.LoadImage(BtnOk.Glyph,'Printer');
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
 DMTCCoreLink.LoadImage(BitBtn2.Glyph,'Ok');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Cancel');
 Caption := GetTextLang(1251);//Contact Listing
 BtnOk.Caption := GetTextLang(52); // &Print
 cxGrid1DBTableView1LASTNAME.Caption :=  GetTextLang(185) ;// Name
 cxGrid1DBTableView1PHONE3.Caption :=  GetTextLang(189) ;// Fax
 cxGrid1DBTableView1PHONE1.Caption :=  GetTextLang(1252) ;// Telephone 1
 cxGrid1DBTableView1PHONE2.Caption :=  GetTextLang(1253) ;// Telephone 2
 cxGrid1DBTableView1EMAIL.Caption :=  GetTextLang(1254) ;//Email Address
 cxGrid1DBTableView1ADDRESS.Caption :=  GetTextLang(2418) ;//Address
 cxGrid1DBTableView1CITY.Caption :=  GetTextLang(2419) ;//City
 cxGrid1DBTableView1STATE.Caption :=  GetTextLang(2420) ;//State
 cxGrid1DBTableView1ZIP.Caption :=  GetTextLang(2422) ;//Zip
 cxGrid1DBTableView1COUNTRY.Caption :=  GetTextLang(2421) ;//Country
 cxGrid1DBTableView1COMPANY.Caption :=  GetTextLang(2385) ;//Company
 BtnCancel.Caption := GetTextLang(828); // &Close
 DestLbl.Caption := GetTextLang(865); //Send report To:
 EditBtns(BAdd,BEdit,BDelete);
 Value.Caption := gettextlang(2871);
 BFilter.Caption := gettextlang(20097);
 BClearFilter.Caption := gettextlang(1016);
 Filter.Caption := gettextlang(2870);
 CBOperatot.Items[0] := gettextlang(20025);

  // load Print Modes
 LoadPrintOutModes(cbDestination);
 dmDatabase.TblResources.Open ;
 CBFindColumn.clear ;
 CBFindColumn.AddItem(gettextlang(2321),TObject(-1));
  for i := 0 to cxGrid1DBTableView1.ColumnCount-1 do
   CBFindColumn.AddItem(cxGrid1DBTableView1.Columns[i].Caption,TObject(i));
 EFilterValue.Text :=  ReadReportOp('CONTFilterValue','').asString;
 CBFindColumn.ItemIndex := ReadReportOp('CONTFilterIndex',0).asinteger;
 CBOperatot.ItemIndex := ReadReportOp('CONTOperatorIndex',0).asinteger;
 cxGrid1DBTableView1.RestoreFromRegistry('Software\osfinancials\contacts',false);
 IndexColumn :=   cxGrid1DBTableView1LASTNAME.Index ;
 RefreshContacts(EditID);
 if EditID <> 0 then
  begin
      BEditClick(self);
  end else
  begin
     cbDestination.SetFocus;
  end;
end;

procedure TfmContactListing.BtnCancelClick(Sender: TObject);
begin
  CLose;
end;

procedure TfmContactListing.BtnOkClick(Sender: TObject);
begin
    ExecReport(DMTCCoreLink.GetLocalPluginDir + 'reports\Newreports\TRN_2876\TRN_2876.rep','');
end;

(*procedure TfmContactListing.lvContactDblClick(Sender: TObject);
Var
  HoldPos:Integer;
begin
   Contact:=lvContact.Selected.Caption;
   dmDatabase.tblContact.Open;
   if dmDatabase.tblContact.Locate('SContactName',Contact,[loCaseInsensitive]) then begin
     // Edit Contact
      if OSFMessageDlg(GetTextLang(805){'Do you want to fill all details for this new contact ?'}, mtConfirmation, [mbYes,mbNo], 0)=mrYes then
      begin
        HoldPos:=lvContact.Selected.Index;
        Hide;
        fmMain.ContactManager(Sender,Contact,T3OnFly);
        Show;
        lvContact.Items[HoldPos].Selected:=True;
        lvContact.Items[HoldPos].Focused:=True;
      end;
    end;
    // Refill All Contacts in the list;
   dmDatabase.tblContact.Close;

end; *)

procedure TfmContactListing.lvContactKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  begin
    SelectNext( ActiveControl,true,true);
    Key:=#0;
  end;
end;

procedure TfmContactListing.cbDestinationChange(Sender: TObject);
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

procedure TfmContactListing.edtCountChange(Sender: TObject);
Begin
   UpDown1.Position:=ValideInt(edtCount.Text);
end;

procedure TfmContactListing.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  EdtCount.Text:=IntToStr(UpDown1.position);
end;

procedure TfmContactListing.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 112 then
        begin
             HtmlShowTopic(168);
             key := 0;
        end;
end;

procedure TfmContactListing.BEditClick(Sender: TObject);
var
 aVpContactTCEditDialog : TVpContactTCEditDialog ;
 LastRec , i : Integer ;
begin
 InOPen := True ;
 try
 if dmDatabase.QContacts.IsEmpty then exit ;
 LastRec := dmDatabase.QContactsRecordID.AsInteger ;
  VpFlexDataStore1.Connected := false ;
  VpFlexDataStore1.Connected := True ;
  VpFlexDataStore1.Load ;
  if VpFlexDataStore1.Resources.Count > 0 then
    VpFlexDataStore1.Resource := VpFlexDataStore1.Resources.Items[0];
 aVpContactTCEditDialog := TVpContactTCEditDialog.Create(self) ;
  try
    aVpContactTCEditDialog.DataStore := VpFlexDataStore1 ;
    aVpContactTCEditDialog.Placement.Height := 500 ;
    aVpContactTCEditDialog.Placement.Width := 500 ;
    if VpFlexDataStore1.Resource <> nil then
     if VpFlexDataStore1.Resource.Contacts.Count <> 0 then
       begin
          for i:= 0 to  VpFlexDataStore1.Resource.Contacts.Count - 1 do
           if VpFlexDataStore1.Resource.Contacts.GetContact(i).RecordID = LastRec then
            begin
            aVpContactTCEditDialog.Execute(VpFlexDataStore1.Resource.Contacts.GetContact(i)) ;
            break ;
            end;
       end;
  finally
    aVpContactTCEditDialog.free ;
  end;
    dmDatabase.QContacts.close ;
    dmDatabase.QContacts.open ;
    dmDatabase.QContacts.Locate('RecordID',LastRec,[]) ;
  finally
    InOPen := False ;
  end;
  if EditID <>0 then
    begin
       // does not allow exit from show so we must delay.
       Timer1.Enabled := true ;
    end
end;

procedure TfmContactListing.BAddClick(Sender: TObject);

begin
  InOPen := True ;
  try
  dmDatabase.TblContacts.close ;
  dmDatabase.TblContacts.Filter :=  '';
  dmDatabase.TblContacts.Filtered := false ;
  dmDatabase.TblContacts.open ;
  VpFlexDataStore1.Connected := false ;
  VpFlexDataStore1.Connected := True ;
  VpFlexDataStore1.Load ;
  if VpFlexDataStore1.Resources.Count > 0 then
    VpFlexDataStore1.Resource := VpFlexDataStore1.Resources.Items[0]
    else
    begin
       dmDatabase.TblResources.Active := true ;
       dmDatabase.TblResources.Insert ;
       dmDatabase.TblResourcesRESOURCEID.AsInteger := 1 ;
       dmDatabase.TblResourcesDESCRIPTION.AsString := 'osFinancials' ;
       dmDatabase.TblResources.Post; 
      VpFlexDataStore1.Load ;
      if VpFlexDataStore1.Resources.Count > 0 then
        VpFlexDataStore1.Resource := VpFlexDataStore1.Resources.Items[0]
    end;
 aVpContactTCEditDialog := TVpContactTCEditDialog.Create(self) ;
  try
    aVpContactTCEditDialog.DataStore := VpFlexDataStore1 ;
    aVpContactTCEditDialog.OnContactAdd := OnContactAdd ;
    aVpContactTCEditDialog.Placement.Height := 500 ;
    aVpContactTCEditDialog.Placement.Width := 500 ;
    if not aVpContactTCEditDialog.AddNewContact then
       LastResult := mrcancel else
       LastResult := mrok ;
    if  assigned(aVpContactTCEditDialog.ceContact) then
     begin
      RefreshContacts(aVpContactTCEditDialog.ceContact.RecordID);
      if PickSearch or AddNew then
         EditId := aVpContactTCEditDialog.ceContact.RecordID ;
     end;
  finally
    FreeAndNil(aVpContactTCEditDialog) ;
  end;
  finally
     InOPen := False ;
  end;
end;

procedure TfmContactListing.BDeleteClick(Sender: TObject);
begin
 if not dmDatabase.QContacts.IsEmpty then
   if OSFMessageDlg(GetTextLang(776){Are you sure you want to delete this account ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
     dmDatabase.QContacts.Delete ;
end;

procedure TfmContactListing.FormDestroy(Sender: TObject);
begin
 WriteReportOp('CONTFilterValue',EFilterValue.Text);
 WriteReportOp('CONTFilterIndex',IntToStr(CBFindColumn.ItemIndex));
 WriteReportOp('CONTOperatorIndex',IntToStr(CBOperatot.ItemIndex));
 cxGrid1DBTableView1.StoreToRegistry('Software\osfinancials\contacts');
end;

procedure TfmContactListing.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false ;
  // Allow edit of item from other form.
  if EditID <>0 then
    begin
       close ;
       exit ;
    end ;
 if AddNew then
   begin
     ModalResult := LastResult ;
   end;
end;

procedure TfmContactListing.DBGSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
 Look  := look + Key ;
 if cxGrid1DBTableView1.Controller.FocusedColumn <> nil then
    begin
      if not dmDatabase.QContacts.Locate(TcxGridDBColumn(cxGrid1DBTableView1.Controller.FocusedColumn).DataBinding.FieldName,look,[loCaseInsensitive, loPartialKey]) then
        look := '' ;
    end;
end;

procedure TfmContactListing.OnContactAdd(Sender: TObject);
begin
 ParseName(aVpContactTCEditDialog.ceContact, DefaultName );
 aVpContactTCEditDialog.ceContact.Company := DefaultName;
 aVpContactTCEditDialog.ceContact.EMail := DefaultEMail;
 aVpContactTCEditDialog.ceContact.Address := DefaultAdres1;
 aVpContactTCEditDialog.ceContact.City := DefaultAdres2;
 aVpContactTCEditDialog.ceContact.State := DefaultAdres3 ;
 aVpContactTCEditDialog.ceContact.Country := DefaultCountry ;
 aVpContactTCEditDialog.ceContact.Phone1 := DefaultTelephone;
 aVpContactTCEditDialog.ceContact.Phone2 := DefaultTelephone2;
 aVpContactTCEditDialog.ceContact.Phone3 := DefaultFax;
 aVpContactTCEditDialog.ceContact.Zip := DefaultPostal ;
end;

procedure TfmContactListing.EFilterValueKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = #13 then
   RefreshContacts ;
end;

procedure TfmContactListing.RefreshContacts(GoTOId : Integer = 0);
var
 ExtraSql : String ;
 OldId : integer ;
begin
  InOPen := True ;
  try
  dmDatabase.QContacts.Filter := '' ;
  if  GoTOId = 0 then
   begin
   oldid := dmDatabase.QContactsRecordID.AsInteger ;
   dmDatabase.QContacts.SQL.Text := 'select * from contacts where 1 = 1  ' ;
   end
   else
   begin
   oldid := GoTOId ;
   dmDatabase.QContacts.SQL.Text := 'select * from contacts where RecordID = ' + IntTOStr(oldid) ;
   dmDatabase.QContacts.open ;
   dmDatabase.QContacts.Locate('RecordID',OldId,[]);
   exit ;
   end;
   if AddNew then
     dmDatabase.QContacts.SQL.Add(' and 1 = 0 ') ;
    if trim(EFilterValue.Text) <> '' then
    if CBFindColumn.ItemIndex >0  then
     begin
       case cxGrid1DBTableView1.Columns[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].DataBinding.Field.DataType of
            ftString : begin
              ExtraSql := ' and upper(' + cxGrid1DBTableView1.Columns[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].DataBinding.Field.Origin + ')'  ;
              case CBOperatot.ItemIndex of
                  0 :    ExtraSql := ExtraSql + ' like ' + QuotedStr(EFilterValue.Text+'%') ;
                  1 :    ExtraSql := ExtraSql + ' = ' + QuotedStr(EFilterValue.Text) ;
                  2 :    ExtraSql := ExtraSql + ' < ' + QuotedStr(EFilterValue.Text) ;
                  3 :    ExtraSql := ExtraSql + ' > ' + QuotedStr(EFilterValue.Text) ;
                  4 :    ExtraSql := ExtraSql + ' <= ' + QuotedStr(EFilterValue.Text) ;
                  5 :    ExtraSql := ExtraSql + ' >= ' + QuotedStr(EFilterValue.Text) ;
                  6 :    ExtraSql := ExtraSql + ' <> ' + QuotedStr(EFilterValue.Text) ;
               end;
              end;
            else   begin
             ExtraSql := ' and ' + cxGrid1DBTableView1.Columns[Integer(CBFindColumn.Items.Objects[CBFindColumn.ItemIndex])].DataBinding.Field.Origin  ;
              case CBOperatot.ItemIndex of
                  0 :    ExtraSql := ExtraSql + ' = ' +  StripNotNumericReturnZero(EFilterValue.Text) ;
                  1 :    ExtraSql := ExtraSql + ' = ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  2 :    ExtraSql := ExtraSql + ' < ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  3 :    ExtraSql := ExtraSql + ' > ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  4 :    ExtraSql := ExtraSql + ' <= ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  5 :    ExtraSql := ExtraSql + ' >= ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  6 :    ExtraSql := ExtraSql + ' <> ' + StripNotNumericReturnZero(EFilterValue.Text) ;
                  end;
             end;
        end;
      dmDatabase.QContacts.SQL.add(ExtraSql);
     end;
  if GoTOId <> 0 then
       dmDatabase.QContacts.SQL.add(')');
  dmDatabase.QContacts.open ;
  dmDatabase.QContacts.Locate('RecordID',OldId,[]);
  finally
  InOPen  := False ;
  end;
end;

procedure TfmContactListing.BFilterClick(Sender: TObject);
begin
   RefreshContacts;
end;

procedure TfmContactListing.BClearFilterClick(Sender: TObject);
begin
   EFilterValue.Clear ;
end;

procedure TfmContactListing.FormActivate(Sender: TObject);
begin
 if AddNew then
   begin
     BAddClick(self) ;
     timer1.Enabled := true ;
   end;
end;

procedure TfmContactListing.DBGSearchDblClick(Sender: TObject);
begin
if PickSearch then
 ModalResult := mrok
else
  BEditClick(sender);
end;

procedure TfmContactListing.Panel6Click(Sender: TObject);
begin
//ShowMessage(BoolToStr(dmDatabase.QContacts.ControlsDisabled,true));
// ShowMessage(BoolToStr(dmDatabase.QContacts.Active,true));

end;

procedure TfmContactListing.VpFlexDataStore1SetFilterCriteria(
  aTable: TDataSet; aUseDateTime: Boolean; aResourceID: Integer;
  aStartDateTime, aEndDateTime: TDateTime);
begin
    if aTable  = dmDatabase.QTasks then
      With aTable as TuniQuery do
        begin
          Active := false ;
          SQL.Text := 'select * from tasks where RESOURCEID = ' + IntToStr(aResourceID)  ;
          Open ;
        end;
    if aTable  = dmDatabase.QContacts then
     if not InOPen then
      With aTable as TuniQuery do
        begin
          Active := false ;
          SQL.Text := 'select * from Contacts '  ;
          Open ;
        end;
end;

end.


