(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit AccessControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids,  Buttons, StdCtrls, ExtCtrls,  Mask,
  ComCtrls,DB, Menus, CheckLst,TcashClasses, DBCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxListView, PlatformDefaultStyleActnCtrls, ActnList, ActnMan, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxEditRepositoryItems, MemDS,
  DBAccess, Uni, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;


type
  TfmAccessControl = class(TForm)
    ButtonPanel: TPanel;
    BtnClose: TBitBtn;
    PopupMenu1: TPopupMenu;
    Rename1: TMenuItem;
    Delete1: TMenuItem;
    BitBtn1: TBitBtn;
    AccessCtrl: TPageControl;
    Default: TTabSheet;
    Reports: TTabSheet;
    Batches: TTabSheet;
    Label4: TLabel;
    Label1: TLabel;
    edtPassword: TMaskEdit;
    Label2: TLabel;
    wwDBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    GroupBox3: TGroupBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    GroupBox4: TGroupBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    GroupBox5: TGroupBox;
    DBCheckBox3: TDBCheckBox;
    clbBatches: TCheckListBox;
    cbEditUserRep: TCheckBox;
    cbAcc1: TCheckBox;
    cbAcc2: TCheckBox;
    Button1: TButton;
    CBHideDisabledMenuitems: TCheckBox;
    cbAcc0: TCheckBox;
    MDisabledItems: TMemo;
    LCustomLimitation: TLabel;
    GBPos: TGroupBox;
    LCBMode: TLabel;
    CBMode: TComboBox;
    LLinkToSalesMan: TLabel;
    CBSalesManLink: TComboBox;
    CheckBox2: TCheckBox;
    CBEditQty: TCheckBox;
    BAddCustomLim: TButton;
    CBHideDisabel: TComboBox;
    TabSheet2: TTabSheet;
    CBNOPosting: TCheckBox;
    Label5: TLabel;
    MLimitDocSql: TMemo;
    CBAutoRefreschDoc: TCheckBox;
    EAutoRefreshInterval: TEdit;
    Label6: TLabel;
    CBLikeSearchForStrings: TCheckBox;
    MlimitStockSQL: TMemo;
    LLimitStockSql: TLabel;
    cbEditCalender: TCheckBox;
    cbSystemMenu: TCheckBox;
    bLogReport: TButton;
    cbAccessType: TComboBox;
    Label7: TLabel;
    MDisableOnDocForm: TMemo;
    Label8: TLabel;
    Copy1: TMenuItem;
    cbCostcentersInDoc: TCheckBox;
    cbEditOnlyOwnCalander: TCheckBox;
    cbCalendars: TComboBox;
    Label9: TLabel;
    cbDefaultOutPut: TComboBox;
    Label12: TLabel;
    DBESPCIPADDRESS: TDBEdit;
    Label10: TLabel;
    cbReadOnlyTax: TCheckBox;
    tsTypes: TTabSheet;
    cbGroups: TCheckListBox;
    cbDocnoFrom: TComboBox;
    Label11: TLabel;
    Panel1: TPanel;
    lvUsers: TcxListView;
    Panel2: TPanel;
    sbDelete: TBitBtn;
    sbAdd: TBitBtn;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    cbLang: TComboBox;
    Label13: TLabel;
    cbSystemlang: TComboBox;
    Label14: TLabel;
    Numbering1: TMenuItem;
    tsUSertabs: TTabSheet;
    UniQUserTab: TUniQuery;
    cxEditRepository1: TcxEditRepository;
    cxicbActions: TcxEditRepositoryImageComboBoxItem;
    cxibaction: TcxImageComboBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    UniQUserTabWPARAMID: TIntegerField;
    UniQUserTabWUSERID: TIntegerField;
    UniQUserTabSPARAMNAME: TStringField;
    UniQUserTabSPARAMVALUE: TStringField;
    UniQUserTabWTYPEID: TIntegerField;
    UniQUserTabWSOURCEID: TIntegerField;
    UniQUserTabWSOURCETYPEID: TIntegerField;
    UniQUserTabDSYSDATE: TDateTimeField;
    UniQUserTabWPARENTID: TIntegerField;
    UniQUserTabWPARENTTYPEID: TIntegerField;
    UniQUserTabBACTIVE: TSmallintField;
    dsUniQUserTab: TDataSource;
    cxGrid1DBTableView1WPARAMID: TcxGridDBColumn;
    cxGrid1DBTableView1WUSERID: TcxGridDBColumn;
    cxGrid1DBTableView1SPARAMNAME: TcxGridDBColumn;
    cxGrid1DBTableView1SPARAMVALUE: TcxGridDBColumn;
    cxGrid1DBTableView1WTYPEID: TcxGridDBColumn;
    cxGrid1DBTableView1WSOURCEID: TcxGridDBColumn;
    cxGrid1DBTableView1WSOURCETYPEID: TcxGridDBColumn;
    cxGrid1DBTableView1DSYSDATE: TcxGridDBColumn;
    cxGrid1DBTableView1WPARENTID: TcxGridDBColumn;
    cxGrid1DBTableView1WPARENTTYPEID: TcxGridDBColumn;
    cxGrid1DBTableView1BACTIVE: TcxGridDBColumn;
    Button2: TButton;
    Label15: TLabel;
    mLimitDebCred: TMemo;
    Label16: TLabel;
    mLimitLayouts: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbAddClick(Sender: TObject);
    procedure sbDeleteClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvUsersEdited(Sender: TObject; Item: TListItem;
      var S: String);
    procedure Rename1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AccessCtrlExit(Sender: TObject);
    procedure BAddCustomLimClick(Sender: TObject);
    procedure bLogReportClick(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure lvUsersChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvUsersChanging(Sender: TObject; Item: TListItem;
      Change: TItemChange; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Numbering1Click(Sender: TObject);
    procedure UniQUserTabAfterInsert(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure mLimitDebCredDblClick(Sender: TObject);
    procedure MlimitStockSQLDblClick(Sender: TObject);
    procedure mLimitLayoutsDblClick(Sender: TObject);
  private
    { Private declarations }
    Save,BinInit:Boolean;
    Procedure LoadUsers;
    Procedure LoadUserBatCtrl(WBatID:Integer);
    Procedure LoadBatchLIst;
    Procedure SaveBatCtrl;
    procedure SaveChanges;
    Procedure SaveParams(WUserID:Integer);
    Procedure LoadParams(WUserID:Integer);
    function GetPathFromMenuItem(AMenuitem, StopItem: TMenuItem): String;

  public
    ShowBarForUser : Boolean ;
    { Public declarations }
  end;

var
  fmAccessControl: TfmAccessControl;
  BatchTransfer  : Boolean;

implementation

Uses GlobalFunctions, Database, Main, SelectUser, HtmlHelpAPI,
  LanguageChoice, TcVariables, DatabaseAccess, AccountSelect, XRoutines,
   PosRoutines, GenMutliEntry, FreeReportsUnit, UDMTCCoreLink,
  OSFGeneralRoutines,variants,UosfResources, DocSetup;

{$R *.DFM}

Function BAdmin:Boolean;
begin
  Result:=False;
  with dmDatabase do
  begin
    if ( tblUserBDisabled.Value=0) And
    (tblUserBAccounts.Value=1)  And
    (tblUserBStock.Value=1)  And
    (tblUserBBatchEntry.Value=1)  And
    (tblUserBCreditNote.Value=1)  And
    (tblUserBInvoices.Value=1)  And
    (tblUserBPurchases.Value=1)  And
    (tblUserBStockReturns.Value=1)  And
    (tblUserBReconciliation.Value=1)  And
    (tblUserBCreditorReports.Value=1)  And
    (tblUserBDebtorReports.Value=1)  And
    (tblUserBLedgerReports.Value=1)  And
    (tblUserBStockReports.Value=1)  And
    (tblUserBUserReports.Value=1)  And
    (tblUserBPosting.Value=1)  And
    (tblUserBGlobalProcesses.Value=1)  And
    (tblUserBSystemSetup.Value =1)
    then
      Result:=True;
  end;
  
end;

Procedure TfmAccessControl.LoadUsers;
Var
  fItem:TListItem;
  // done : Pieter use bookmark string it mutch saver
  SavePlace :Integer ;

begin
  SavePlace := dmDatabase.tblUserWUSERID.AsInteger ;
  try
    dmDatabase.tblUser.Close ;
    dmDatabase.tblUser.Open ;
    dmDatabase.tblUser.first;

    cbDocnoFrom.Items.Clear ;


    if dmDatabase.tblUserWUserID.Value=0 then
      exit ;
    lvUsers.Items.BeginUpdate ;
    BinInit := True ;
    try
    lvUsers.Items.Clear;
    while not dmDatabase.tblUser.eof do
    begin
      cbDocnoFrom.Items.AddObject(dmDatabase.tblUserSUserName.AsString,TObject(dmDatabase.tblUserWUserID.AsInteger));

      fItem := lvUsers.Items.Add;
      fItem.Caption := dmDatabase.tblUserSUserName.Value;
      // done : Pieter Beter find this way.
      fItem.Data := Pointer(dmDatabase.tblUserWUserID.AsInteger);
      if BAdmin then
        begin
        fItem.ImageIndex:= 16 ;
         
        end
      else
        fItem.ImageIndex:= 4;
      if (SavePlace = dmDatabase.tblUserWUserID.AsInteger) then
         fItem.Selected := True ;
      dmDatabase.tblUser.next;
    end;
    finally
       lvUsers.Items.EndUpdate ;
       BinInit := False ;
    end;

   finally
      dmDatabase.tblUser.Locate('WUSERID',SavePlace,[]);
   end;

end;

Procedure TfmAccessControl.LoadBatchLIst;
Var
  Hold:Boolean;
begin
  Hold := dmDatabase.tblBatchTypes.Active;
  dmDatabase.tblBatchTypes.Active := True;
  clbBatches.Items.BeginUpdate;
  Try
    clbBatches.Clear;
    dmDatabase.tblBatchTypes.First;
    While Not dmDatabase.tblBatchTypes.Eof do
    begin
      clbBatches.Items.Add(dmDatabase.tblBatchTypesSdescription.AsString);
      clbBatches.Checked[clbBatches.Items.Count-1]:= CanUserBatch(dmDatabase.tblUserWUserID.Value,dmDatabase.tblBatchTypesWBatchTypeID.AsInteger);
      dmDatabase.tblBatchTypes.Next;
    end;
  Finally
    clbBatches.Items.EndUpdate;
  end;
  dmDatabase.tblBatchTypes.Active := Hold;

end;


function TfmAccessControl.GetPathFromMenuItem(AMenuitem: TMenuItem;StopItem : TMenuItem): String;
begin
 result := '' ;
 IF  StopItem <> nil then
   if  AMenuitem = StopItem then exit ;

if (AMenuitem.Parent <> nil) then
 begin
 result := StringReplace(AMenuitem.Caption,'&','',[rfreplaceAll]);
 result :=  GetPathFromMenuItem(AMenuitem.Parent,StopItem) + PathDelim + result ;
 end;
end;

procedure TfmAccessControl.FormShow(Sender: TObject);

  {Procedure RecurceMenu(AMenuitem : TMenuItem);
  var x : Integer ;
  begin
 // if Assigned(AMenuitem.onclick) then
     CBMEnuItemList.items.AddObject(GetPathFromMenuItem(AMenuitem,nil),AMenuitem);

   For x := 0 to AMenuitem.Count -1 do
                RecurceMenu(AMenuitem.Items[x]);

  end; }


 procedure HandleGoups (Aparent : String ;AGroup : TActionClients) ;
    var i : Integer ;
     ASubMenuitem : Tmenuitem ;
   begin
      for i := 0 to AGroup.Count -1 do
         begin
           if AGroup[i].Action <> nil then

           with cxicbActions.Properties.Items.Add do
                    begin
                         Description := Aparent +'->'+StringReplace(TAction(AGroup[i].Action).Caption,'&','',[rfReplaceAll]) ;
                         Value := TAction(AGroup[i].Action).Name ;
                         ImageIndex:= TAction(AGroup[i].Action).ImageIndex ;
                     end;
           if  AGroup[i].Items <> nil then
               HandleGoups(Aparent +'->'+  StringReplace(AGroup[i].Caption,'&','',[rfReplaceAll]) ,AGroup[i].Items);
         end;

   end;
  var
 i , x: Integer ;
 AListToSort : TStringlist ;
begin
 cxicbActions.Properties.Items.Clear ;


  for i := 0 to fmmain.mainRibbon.Tabs.Count -2 do
     begin
       for x := 0 to fmmain.mainRibbon.Tabs[i].Page.GroupCount -1 do
          begin
              HandleGoups(fmmain.mainRibbon.Tabs[i].Caption,fmmain.mainRibbon.Tabs[i].Page.Groups[x].Items) ;
          end;
     end;




   cbDefaultOutPut.Items[0] := GetTextLang(985);{'Screen'}
   cbDefaultOutPut.Items[1] := GetTextLang(986);{'Printer'}
   cbDefaultOutPut.Items[2] := GetTextLang(120);{'File'}
   cbDefaultOutPut.Items[3] := GetTextLang(191);{'E-mail'}
   cbDefaultOutPut.Items[4] := GetTextLang(189);{'Fax'}

   DMTCCoreLink.LoadImage(BitBtn1.Glyph,'OK');
   DMTCCoreLink.LoadImage(BtnClose.Glyph,'Close');
   DMTCCoreLink.LoadImage(sbDelete.Glyph,'cancel');
   DMTCCoreLink.LoadImage(sbAdd.Glyph,'Add');
 

   // done : Pieter So no one can forget to put it back.
  AccessCtrl.ActivePageIndex := 0 ;
  self.Caption := GetTextLang(291);
  Default.Caption := GetTextLang(1898);
  Label4.Caption := GetTextLang(1899);
  Label1.Caption := GetTextLang(1972);
  Label2.Caption := GetTextLang(1254);
  DBCheckBox1.Caption := GetTextLang(304);
  GroupBox2.Caption := GetTextLang(1012);
  DBCheckBox17.Caption := GetTextLang(301);
  DBCheckBox16.Caption := GetTextLang(311);
  DBCheckBox9.Caption := GetTextLang(59);
  sbAdd.Caption := GetTextLang(292);
  sbDelete.Caption := GetTextLang(173);
  BitBtn1.Caption :=  GetTextLang(945);
  BtnClose.Caption :=  GetTextLang(828);
  Reports.Caption :=  GetTextLang(1901);
  GroupBox4.Caption :=  GetTextLang(123);
  DBCheckBox10.Caption :=  GetTextLang(305);
  DBCheckBox11.Caption :=  GetTextLang(306);
  DBCheckBox12.Caption :=  GetTextLang(1902);
  DBCheckBox13.Caption :=  GetTextLang(308);
  DBCheckBox14.Caption :=  GetTextLang(309);


  Batches.Caption :=  GetTextLang(1903);
  GroupBox3.Caption :=  GetTextLang(1071);

  DBCheckBox15.Caption :=  GetTextLang(310);
  DBCheckBox4.Caption :=  GetTextLang(43);
  DBCheckBox6.Caption :=  GetTextLang(48);
  DBCheckBox7.Caption :=  GetTextLang(49);
  DBCheckBox5.Caption :=  GetTextLang(47);
  DBCheckBox8.Caption :=  GetTextLang(50);
  Button1.Caption :=  GetTextLang(1904);
  TabSheet1.Caption := GetTextLang(1905);
  GroupBox5.Caption := GetTextLang(22);
  cbAcc0.Caption := GetTextLang(1906);
  DBCheckBox3.Caption := GetTextLang(1907);
  cbEditUserRep.Caption := GetTextLang(1908);
  LCBMode.Caption := GetTextLang(2197);
  CBMode.Items[0] :=  GetTextLang(2198);
  CBMode.Items[1] :=  GetTextLang(2199);
  CBMode.Items[2] :=  GetTextLang(2200);
  cbAcc1.Caption := GetTextLang(2201);
  cbAcc2.Caption := GetTextLang(2202);
  CheckBox2.Caption := GetTextLang(1362);// Edit Price
   LLimitStockSql.Caption := GetTextLang(3097); 



  dmDatabase.tblUser.Open;   
  if dmDatabase.tblUser.RecordCount = 0 then
    AccessCtrl.Enabled := False;
  LoadUsers;

  LoadBatchLIst;
  LoadGroups(CBSalesManLink,31,false);
  CBSalesManLink.Items.InsertObject(0,'All users',TObject(0));
  LoadPosInputVars;
  CheckBox2.Checked := PosChPrice;
  CBEditQty.Checked := PosChQty;

  if lvUsers.Items.Count>0 then
  begin
     if ShowBarForUser then
      begin
       for i := 0 to lvUsers.Items.Count -1 do
         if Integer(lvUsers.Items.Item[i].Data) =  DMTCCoreLink.currentuser then
           begin
               lvUsers.Items.Item[i].Selected := True;
               lvUsers.Items.Item[i].Focused := True;
           end;
         LoadParams(dmDatabase.tblUserWUserID.AsInteger);


      end else
      begin
       lvUsers.Items.Item[0].Selected := True;
       lvUsers.Items.Item[0].Focused := True;
      end;
  end else
  begin
    edtPassword.Text := DecodePassword(dmDatabase.tblUserSPassword.Text);
    LoadBatchLIst;
    LoadParams(dmDatabase.tblUserWUserID.AsInteger);
  end;


 CBHideDisabledMenuitems.Caption := GetTextLang(2973) ;
 CBNOPosting.Caption := GetTextLang(2974) ;
 GBPos.Caption := GetTextLang(1266) ;
 CBEditQty.Caption := GetTextLang(2976) ;
 LLinkToSalesMan.Caption := GetTextLang(2975) ;
 LCustomLimitation.Caption := GetTextLang(2993) ;
 BAddCustomLim.Caption := GetTextLang(292) ;
 CBHideDisabel.Items[0] := GetTextLang(2994);// Hide
 CBHideDisabel.Items[1] := GetTextLang(2995);// Disable
 CBHideDisabel.Items[2] := GetTextLang(2996);// Show
 CBHideDisabel.Items[3] := GetTextLang(2997);// Enable
 
 //GBOpenBatches.Caption := GetTextLang(2999) ;
 //cbOpenBatches.Caption := GetTextLang(2997);// Enable
 //rbUploadOnly.Caption := GetTextLang(3000);
 //rbDownOnly.Caption := GetTextLang(3001);
 TabSheet2.Caption := GetTextLang(38);// documents
 CBAutoRefreschDoc.Caption := GetTextLang(3042);// Autorefresh
 Label6.Caption := GetTextLang(3043);// Interval (sec)
 Label5.Caption := GetTextLang(3044);//  Limit Doc SQL
 CBLikeSearchForStrings.Caption := GetTextLang(3045);//


{ AListToSort := TStringlist.Create ;
 try
 For i := 0 to fmMain.ActionManager1.ActionCount-1 do
   begin
     AListToSort.AddObject(StringReplace(TAction(fmMain.ActionManager1.Actions[i]).Caption,'&','',[rfReplaceAll]),fmMain.ActionManager1.Actions[i]);
   end;
 AListToSort.Sort ;

 For i := 0 to AListToSort.Count-1 do
          with cxicbActions.Properties.Items.Add do
          begin
               Description := StringReplace(TAction(AListToSort.Objects[i]).Caption,'&','',[rfReplaceAll]) ;
               Value := TAction(AListToSort.Objects[i]).Name ;
               ImageIndex:= TAction(AListToSort.Objects[i]).ImageIndex ;
           end;
 finally
  AListToSort.Free ;
 end;
        }
 if ShowBarForUser then
    begin
        for i := 0 to AccessCtrl.PageCount -1 do
         AccessCtrl.Pages[i].TabVisible := False ;

       AccessCtrl.ActivePage :=  tsUSertabs ;
       Panel1.Visible := False ;
       ButtonPanel.Visible := False ;
    end;
end;

procedure TfmAccessControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblUser.Close;
end;

procedure TfmAccessControl.sbAddClick(Sender: TObject);
Var
  i,
  NewUser:Integer;

  NewUSerString : String ;
begin
  NewUser := 0 ;
  NewUSerString := GetTextLang(1909) ;
  While dmDatabase.tblUser.Locate('SUserName',NewUSerString +IntToStr(NewUser), [loCaseinsensitive]) do
    Inc(NewUser);
  if dmDatabase.tblUser.Locate('WUserID', 0, []) = True then
  begin
    dmDatabase.tblUser.Edit;
    dmDatabase.tblUserWUserID.Value := 1;
    dmDatabase.tblUserSUserName.Value := NewUSerString+IntToStr(NewUser);
    SetCurrentUser(1);
    // done : Pieter Default user 0 is not disabled
     dmDatabase.tblUserBDisabled.AsInteger := 0 ;
    RealUser:=CurrentUser;
    // DEfault to general numbering
    WriteReportOp('BUseGeneralNumber',Bool2Str(true));
    WriteReportOp('IUserGeneralNumber',IntToStr(1));

  end
  else
  begin
    dmDatabase.tblUser.Insert;
    dmDatabase.tblUserSUserName.Value := NewUSerString+IntToStr(NewUser);
  end;
  dmDatabase.tblUser.Post;
  AccessCtrl.Enabled := True;
//  edtPassword.SetFocus;
  LoadUsers;
  i:=0;
  While (i<=lvUsers.Items.Count-1) AND (lvUsers.Items.Count-1<>0) do
  begin
    if lvUsers.Items[i].Caption=NewUSerString+IntToStr(NewUser) then
    begin
      lvUsers.Items[i].Selected:=True;
      lvUsers.Items[i].EditCaption;
      Break;
    end;
    inc(i);
  end;
  if Sender = sbAdd then
    LoadParams(dmDatabase.tblUserWUserID.AsInteger);
end;

procedure TfmAccessControl.sbDeleteClick(Sender: TObject);
var
  afmSelectUser: TfmSelectUser;

begin
   afmSelectUser:= TfmSelectUser.Create(Application);
   try

  if OSFMessageDlg(GetTextLang(425){Warning , this will seriously effect your set of books , do you still with to continue ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
  begin
    with dmDatabase do
    begin
      if tblUser.RecordCount = 1 then
      begin
        OSFMessageDlg(GetTextLang(426){You have chosen to delete all users, access control will now be disabled}, mtinformation, [mbok], 0);
        tblUser.Edit;
        tblUserWUserID.Value := 0;
        tblUserSPassword.Value := '';
        tblUserSUserName.Value := '';
        tblUserBDisabled.Value := 0;
        tblUserBAccounts.Value := 1;
        tblUserBStock.Value := 1;
        tblUserBBatchEntry.Value := 1;
        tblUserBCreditNote.Value := 1;
        tblUserBInvoices.Value := 1;
        tblUserBPurchases.Value := 1;
        tblUserBStockReturns.Value := 1;
        tblUserBReconciliation.Value := 1;
        tblUserBCreditorReports.Value := 1;
        tblUserBDebtorReports.Value := 1;
        tblUserBLedgerReports.Value := 1;
        tblUserBStockReports.Value := 1;
        tblUserBUserReports.Value := 1;
        tblUserBPosting.Value := 1;
        tblUserBGlobalProcesses.Value := 1;
        tblUserBSystemSetup.Value := 1;
        tblUser.Post;
        //Associate all batches with the single user
        ExecSql('Update  batcon set WUserid = 0');
        //Associate all transactions with the single user
        ExecSql('Update transact set WUserid = 0') ;
         WriteReportOp('IUserGeneralNumber',IntToStr(0));

         WriteSysParam('IUserGeneralNumber',IntToStr(0),DMTCCoreLink.currentuser,0);

        Close;
      end
      else
      begin
        If OpenSqlAndGetFirtsColumnValue('Select Count(*) from batcon where BPosted <> 1 and WUserId='+tblUserWUserID.AsString) <> '0' then

        begin
          OSFMessageDlg(GetTextLang(427){There are unposted batches associated with this user, please post or delete them before deleting this user}, mterror, [mbok], 0);
          exit;
        end;


        If OpenSqlAndGetFirtsColumnValue('Select Count(*) from batcon where WUserId='+tblUserWUserID.AsString) <> '0' then
        begin
          OSFMessageDlg(GetTextLang(428){There are batches associated with this user, please select a new user to assign these batches to.}, mtinformation, [mbok], 0);
          BatchTransfer := True;
          if afmSelectUser.ShowModal = mrok then
            begin


               ExecSql('Update BatCon set WUserID='+ IntToStr(afmSelectUser.WSelectedUserId) +' Where WUserId=' + tblUserWUserID.AsString );
            end else exit ;
        end;

        If OpenSqlAndGetFirtsColumnValue('Select Count(*) from transact where WUserId='+tblUserWUserID.AsString) <> '0' then
        begin
          OSFMessageDlg(GetTextLang(429){There are transactions associated with this user, please select a new user to assign these transactions to.}, mtinformation, [mbok], 0);
          BatchTransfer := False;
          if afmSelectUser.ShowModal = mrok then
            ExecSql('Update transact set WUserID=' + IntToStr(afmSelectUser.WSelectedUserId) +' Where WUserId=' + tblUserWUserID.AsString )
            else
            exit ;
        end;
        if tblUserWUserID.Value = CurrentUser then
        begin
          tblUser.Delete;
          Close;
        end
        else
          tblUser.Delete;
      end;
    end;
  end;
  finally
     afmSelectUser.free ;
  end;
  LoadUsers;
end;

procedure TfmAccessControl.UniQUserTabAfterInsert(DataSet: TDataSet);
begin
  UniQUserTabWPARAMID.AsInteger :=  DMTCCoreLink.GetNewIdStr('GEN_SYSPARAMS_ID') ;
  UniQUserTabSPARAMNAME.AsString := 'USERTAB' ;
  UniQUserTabWTYPEID.AsInteger := 101 ;
  UniQUserTabWUSERID.AsInteger := dmDatabase.tblUserWUserID.AsInteger ;


end;

procedure TfmAccessControl.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAccessControl.btnCloseClick(Sender: TObject);
begin
 
  Close;
end;

procedure TfmAccessControl.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SelectNext(ActiveControl, True, True);
end;

procedure TfmAccessControl.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);


begin
     if Key = 112 then
        begin
             //Result := (HTMLHelpShowHelp <> 0);
             HtmlShowTopic(224);
             key := 0;

        end;
end;

procedure TfmAccessControl.lvUsersEdited(Sender: TObject; Item: TListItem;
  var S: String);
begin
  if (dmDatabase.tblUser.Locate('SUserName',s,[loCaseinsensitive]))
    Or (Trim(s)='') then
  begin
   s:=Item.Caption;
  end
  else
  begin
    dmDatabase.tblUser.Edit;
    dmDatabase.tblUserSUserName.Value:=S;
    Item.Caption := dmDatabase.tblUserSUserName.Value ;
  end;
end;

procedure TfmAccessControl.mLimitDebCredDblClick(Sender: TObject);
begin
 if mLimitDebCred.text = '' then
   mLimitDebCred.text :=  'and cast(debtor.wsalesmanid as varchar(5)) in (  select sparamvalue from sysparams where sysparams.SPARAMNAME = '+
   QuotedStr( 'WLOGINSALESMANLINK')  + 'and sysparams.wuserid =( select first  1  * from( '+ #13+#10 +
   ' Select first 1 WUSERID  from LOGGEDIN  where  LOGGEDIN.WCONNECTIONID = CURRENT_CONNECTION ))) ' ;
end;

procedure TfmAccessControl.mLimitLayoutsDblClick(Sender: TObject);
begin
if mLimitLayouts.Text ='' then
 FillFreeReportLayoutBox(mLimitLayouts.Lines);
end;

procedure TfmAccessControl.MlimitStockSQLDblClick(Sender: TObject);
begin
if mLimitDebCred.text = '' then
   mLimitDebCred.text :=  'and cast(dochead.wsalesmanid as varchar(5)) in (  select sparamvalue from sysparams where sysparams.SPARAMNAME = '+
   QuotedStr( 'WLOGINSALESMANLINK')  + 'and sysparams.wuserid =( select first  1  * from( '+ #13+#10 +
   ' Select first 1 WUSERID  from LOGGEDIN  where  LOGGEDIN.WCONNECTIONID = CURRENT_CONNECTION ))) ' ;
end;

procedure TfmAccessControl.Rename1Click(Sender: TObject);
begin
  lvUsers.Selected.EditCaption;

end;

procedure TfmAccessControl.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;


Procedure TfmAccessControl.LoadUserBatCtrl(WBatID:Integer);
Var
  ic:Integer;
begin
  For ic:= 0 to clbBatches.count-1 do
  begin
    clbBatches.Checked[ic]:= CanUserBatch(CurrentUser,WBatID);
  end;
end;

Procedure TfmAccessControl.SaveBatCtrl;
Var
  ic:Integer;
begin
  For ic:= 0 to clbBatches.count-1 do
  begin
    SetCanUserBatch(dmDatabase.tblUserWUserID.Value,GetBatchTypeID(clbBatches.Items[ic]),clbBatches.Checked[ic]);
  end;
end;

procedure TfmAccessControl.BitBtn1Click(Sender: TObject);
begin
  dmDatabase.tblUser.DisableControls ;
  try
  Save:=True;
  SaveChanges;
  Save:=false ;

  if lvUsers.Selected <> nil then
  begin
    dmDatabase.tblUser.Locate('SUserName',lvUsers.Selected.Caption,[]);
    edtPassword.Text := DecodePassword(dmDatabase.tblUserSPassword.Text);
    LoadBatchLIst;
    LoadParams(dmDatabase.tblUserWUserID.AsInteger);
  end;
 finally
   dmDatabase.tblUser.EnableControls ;
 end;

end;

procedure TfmAccessControl.Button1Click(Sender: TObject);

begin
  SelectAccounts(dmDatabase.tbluserWUserID.AsINteger);

end;

procedure TfmAccessControl.Button2Click(Sender: TObject);
var
 i : Integer ;
begin
MDisabledItems.Text := '' ;
for i := 0 to cxicbActions.Properties.Items.Count-1   do
 begin
  cxibaction.ItemIndex := i ;
  BAddCustomLimClick(self);

 end;

end;

procedure TfmAccessControl.SaveChanges;
begin
    if not DBCheckBox17.Checked and (lvUsers.Items.Count < 2) then
        if OSFMessageDlg('Not accessing the Setup system with just one user '#13'makes changing user privilages unposible by the program!'#13'Are you sure you want to continue?', mtConfirmation, [mbyes,mbno], 0) = mryes then
           exit ;

  PosChPrice := CheckBox2.Checked ;
  PosChQty   := CBEditQty.Checked ;
   if lvUsers.Items.Count <> 0 then   // lets be able to save the
   begin
  if Save OR (OSFMessageDlg(GetTextLang(430){Do you wish to save the changes to this user ?}, mtconfirmation, [mbyes,mbno], 0) = mryes) then
  begin
    if edtPassword.Text <> '' then
    begin
      dmDatabase.tblUser.Edit;
      dmDatabase.tblUserSPassword.Value := EncodePassword(edtPassword.Text);
      dmDatabase.tblUser.Post;
      SaveBatCtrl;
      SaveParams(dmDatabase.tblUserWUserID.AsInteger);
    end
    else
    begin
      OSFMessageDlg(GetTextLang(431){Please type in a password for this user}, mterror, [mbok], 0);
      edtPassword.SetFocus;
      abort ;
    end;
  end;
  end else
  begin
      SaveBatCtrl;
      SaveParams(dmDatabase.tblUserWUserID.AsInteger);
      // user 0
  end ;
  SavePosInputVars;  
  Save:=False;
  // recreate batch files
  ClearAndCreateBatFiles(false) ; 
end;

procedure TfmAccessControl.AccessCtrlExit(Sender: TObject);
begin
  if (BitBtn1.Focused) OR (BtnClose.Focused) then exit;
  Save:=True;
  SaveChanges;
end;

Procedure TfmAccessControl.SaveParams(WUserID:Integer);
var
 id : Integer ;
begin
 for id := 0 to cbGroups.items.count -1 do
    begin
      dmtccorelink.WriteSysParam('GRACC'+'_'+ IntToStr(Integer(cbGroups.Items.Objects[id])) , BoolToStr(cbGroups.checked[id],true) ,WUserID)

    end;

 if cbDocnoFrom.ItemIndex > -1 then
 WriteSysParam('IUserGeneralNumber',IntToStr(Integer(cbDocnoFrom.Items.Objects[cbDocnoFrom.ItemIndex])),WUserID,0);

 WriteSysParam( 'INV_TAXREADONLY',Bool2Str(cbReadOnlyTax.Checked),WUserID);


 WriteSysParam( 'BUserReportEdit',Bool2Str(cbEditUserRep.Checked),WUserID);
 WriteSysParam( 'BUserSystemMenu',Bool2Str(cbSystemMenu.Checked),WUserID);

 WriteSysParam( 'cbAccessType',IntToStr(cbAccessType.ItemIndex),WUserID);

 DMTCCoreLink.WriteSysParam('WDEFAULTOUTPUTID',IntToStr(cbDefaultOutPut.ItemIndex),WUserID) ;

 WriteSysParam( 'BGlAccount',Bool2Str(cbAcc0.Checked),WUserID);
 WriteSysParam( 'BEditDebtor',Bool2Str(cbAcc1.Checked),WUserID);
 WriteSysParam( 'BEditCreditor',Bool2Str(cbAcc2.Checked),WUserID);
 WriteSysParam( 'BEditCalender',Bool2Str(cbEditCalender.Checked),WUserID);
 WriteSysParam( 'BEditmode',IntToStr(CBMode.ItemIndex),WUserID);
 WriteSysParam( 'BHideDisabledMenuitems',Bool2Str(CBHideDisabledMenuitems.Checked),WUserID);
 if CBSalesManLink.ItemIndex <> -1 then
 WriteSysParam( 'WLOGINSALESMANLINK',IntToStr(Integer(CBSalesManLink.Items.Objects[CBSalesManLink.ItemIndex])),WUserID);
 WriteLongSysParam('DISABLEITEMS',MDisabledItems.Text,WUserID);
 WriteLongSysParam('DISABLEITEMSDOC',MDisableOnDocForm.Text,WUserID);


 WriteLongSysParam('LIMITDEBCRED',mLimitDebCred.Text,WUserID);
 WriteLongSysParam('LIMITLAYOUT',mLimitLayouts.Text,WUserID);

 if cbSystemlang.ItemIndex <> -1 then
 DMTCCoreLink.WriteSysParam('cbusersystemlang',cbSystemlang.Text,WUserID) ;
 if cbLang.ItemIndex <> -1 then
 DMTCCoreLink.WriteSysParam('cbuserlang',IntToStr(Integer(cbLang.Items.Objects[cbLang.ItemIndex])),WUserID) ;





 id :=  0 ;
 if cbCalendars.ItemIndex <> -1 then
    id :=  Integer(cbCalendars.Items.Objects[cbCalendars.ItemIndex]);

 DMTCCoreLink.WriteSysParam('CAL_USERDEF',id,WUserID);



 WriteSysParam('CBDOCPosting',Bool2Str(CBNOPosting.Checked),WUserID);
 //WriteSysParam('BDoOpenBaches',Bool2Str(cbOpenBatches.Checked),WUserID);
 //WriteSysParam('rbUploadOnly',Bool2Str(rbUploadOnly.Checked),WUserID);
 WriteLongSysParam('LIMITDOCSQL',MLimitDocSql.Text,WUserID);
 WriteLongSysParam('LIMITSTOCKSQL',MlimitStockSQL.Text,WUserID);


 WriteSysParam('AutoRefreschDoc',Bool2Str(CBAutoRefreschDoc.Checked),WUserID);
 WriteSysParam('AutoRefreshInterval',EAutoRefreshInterval.Text,WUserID);
 WriteSysParam('LikeSearchForStrings',Bool2Str(CBLikeSearchForStrings.Checked),WUserID);
 WriteSysParam('cbCostcentersInDoc',Bool2Str(cbCostcentersInDoc.Checked),WUserID);
 WriteSysParam('cbEditOnlyOwnCalander',Bool2Str(cbEditOnlyOwnCalander.Checked),WUserID);

end;

Procedure TfmAccessControl.LoadParams(WUserID:Integer);
var
 id : Integer ;
begin
  UniQUserTab.Close ;
  UniQUserTab.Params[0].AsInteger := WUserID ;
  UniQUserTab.Open ;

  cbGroups.clear ;
  dmDatabase.qGen.SQL.Text :=   'select WTYPEID, SDESCRIPTION from v_types TYPES where WTYPEPARENT in (2,10) and WTYPEID <> 2 order by SDescription' ;
  dmDatabase.qGen.open ;

  while not dmDatabase.qGen.eof do
     begin
      cbgroups.items.addobject(dmDatabase.qGen.fields[1].asstring,TObject(dmDatabase.qGen.fields[0].asinteger));
      if dmtccorelink.ReadSysParam('GRACC'+'_'+ dmDatabase.qGen.fields[0].asstring ,True,WUserID) then
         cbgroups.checked[cbgroups.items.count-1] := True ;
      dmDatabase.qGen.next ;
     end;

  cbDocnoFrom.ItemIndex := cbDocnoFrom.Items.IndexOfObject(TObject(StrToInt(varToStr(DMTCCoreLink.ReadSysParam('IUserGeneralNumber', StrToInt(varToStr(DMTCCoreLink.ReadNwReportOp('IUserGeneralNumber',0))),WUserID,0)))));

  cbCalendars.Clear ;

  cbDefaultOutPut.ItemIndex := DMTCCoreLink.ReadSysParam('WDEFAULTOUTPUTID',StrToIntDef(DMTCCoreLink.ReadSysVar('WDEFAULTOUTPUTID'),0),WUserID) ;
  TDataBaseStringRoutines.FillStringListWithSelect(cbCalendars.Items,'select resourceid,description from RESOURCES',20057) ;
  id :=  DMTCCoreLink.ReadSysParam('CAL_USERDEF',-1,WUserID) ;


   if id > 0 then
     cbCalendars.ItemIndex := cbCalendars.Items.IndexOfObject(TObject(id));

  cbEditOnlyOwnCalander.Visible :=  DMTCCoreLink.ReadNwReportOp('AGENDA_MUON',false) ;



  cbSystemlang.ItemIndex :=  cbSystemlang.Items.IndexOf(
     ReadSysParam('cbusersystemlang',DMTCCoreLink.TheGlobalDataObject.Languages.ActiveLanguage.Name,WUserID).AsString);


  cbLang.ItemIndex :=  cbLang.Items.IndexOfObject(Tobject(ReadSysParam('cbuserlang',0,WUserID).AsInteger));

  CBLikeSearchForStrings.Checked := ReadSysParam('LikeSearchForStrings',false,WUserID).AsBoolean;
  cbCostcentersInDoc.Checked := ReadSysParam('cbCostcentersInDoc',false,WUserID).AsBoolean;
  cbEditOnlyOwnCalander.Checked := ReadSysParam('cbEditOnlyOwnCalander',false,WUserID).AsBoolean;
  cbReadOnlyTax.Checked := DMTCCoreLink.ReadSysParam('INV_TAXREADONLY',False,WUserID) ;
  cbSystemMenu.Checked := ReadSysParam('BUserSystemMenu',true,WUserID).AsBoolean;
  cbEditUserRep.Checked := ReadSysParam('BUserReportEdit',true,WUserID).AsBoolean;
  cbAcc0.Checked := ReadSysParam('BGlAccount',true,WUserID).AsBoolean;
  cbAcc1.Checked := ReadSysParam('BEditDebtor',true,WUserID).AsBoolean;
  cbAcc2.Checked := ReadSysParam('BEditCreditor',true,WUserID).AsBoolean;
  cbEditCalender.Checked := ReadSysParam('BEditCalender',true,WUserID).AsBoolean;
  CBMode.ItemIndex := ReadSysParam('BEditmode',0,WUserID).AsInteger;
  CBNOPosting.Checked  := ReadSysParam('CBDOCPosting',false,WUserID).AsBoolean;

  CBHideDisabledMenuitems.Checked := ReadSysParam('BHideDisabledMenuitems',false,WUserID).AsBoolean;

  CBSalesManLink.ItemIndex := CBSalesManLink.Items.IndexOfObject(TObject(ReadSysParam('WLOGINSALESMANLINK',0,WUserID).AsInteger));

  cbAccessType.ItemIndex := ReadSysParam('cbAccessType',0,WUserID).AsInteger;



  MDisabledItems.Text := ReadLongSysparam('DISABLEITEMS',WUserID);
  MDisableOnDocForm.Text := ReadLongSysparam('DISABLEITEMSDOC',WUserID);

  mLimitDebCred.Text := ReadLongSysparam('LIMITDEBCRED',WUserID);
  mLimitLayouts.Text := ReadLongSysparam('LIMITLAYOUT',WUserID);




 // cbOpenBatches.Checked := ReadSysParam('BDoOpenBaches',true,WUserID).AsBoolean;
 // rbUploadOnly.Checked := ReadSysParam('rbUploadOnly',true,WUserID).AsBoolean;
 // rbDownOnly.Checked := Not rbUploadOnly.Checked;

  MLimitDocSql.Text := ReadLongSysparam('LIMITDOCSQL',WUserID);
  MlimitStockSQL.Text := ReadLongSysparam('LIMITSTOCKSQL',WUserID);



  EAutoRefreshInterval.Text :=  ReadSysParam('AutoRefreshInterval','60',WUserID).AsString;
  CBAutoRefreschDoc.Checked := ReadSysParam('AutoRefreschDoc',False,WUserID).AsBoolean;

end;

procedure TfmAccessControl.BAddCustomLimClick(Sender: TObject);
begin
if cxibaction.ItemIndex <> -1 then
   begin

     MDisabledItems.Text := MDisabledItems.Text + ';'+  VarToStr(cxicbActions.Properties.Items[cxibaction.ItemIndex].Value) +'='  ;

     case CBHideDisabel.ItemIndex of
      0 : MDisabledItems.Text := MDisabledItems.Text + 'H' ;
     // name=D(Enabled false)name=H(Visible false)name=E(Enabled true)name=S(Visible true)
      1 : MDisabledItems.Text := MDisabledItems.Text + 'D' ;
      2 : MDisabledItems.Text := MDisabledItems.Text + 'S' ;
      3 : MDisabledItems.Text := MDisabledItems.Text + 'E' ;
      end;
   end;

end;

procedure TfmAccessControl.bLogReportClick(Sender: TObject);
begin
 CheckReportMan(0,0,0,0,'OSFPRINTER=0','Userlog','GENERAL') ;

end;

procedure TfmAccessControl.Copy1Click(Sender: TObject);
var
 OldId,NewID,i  : Integer ;
 CopyArray : Array of variant ;
begin
 OldId  := dmDatabase.tblUserWUserID.AsInteger ;
 SetLength(CopyArray,dmDatabase.tblUser.FieldCount);
 for i :=  0 to dmDatabase.tblUser.FieldCount -1 do
        CopyArray[i] := dmDatabase.tblUser.Fields[i].Value ;

 sbAddClick(self);
 NewId  := dmDatabase.tblUserWUserID.AsInteger ;
 dmDatabase.tblUser.Locate('WUserID',OldId,[]);

 LoadBatchLIst;
 LoadParams(OldId);
 dmDatabase.tblUser.Locate('WUserID',NewId,[]);
 dmDatabase.tblUser.edit ;
 for i :=  0 to dmDatabase.tblUser.FieldCount -1 do
     if dmDatabase.tblUser.Fields[i] <> dmDatabase.tblUserWUSERID then
        dmDatabase.tblUser.Fields[i].Value := CopyArray[i];

 edtPassword.Text := '' ;


end;

procedure TfmAccessControl.DBEdit1Exit(Sender: TObject);
begin
  if lvUsers.Selected <> nil then
    if lvUsers.Selected.Caption <> DBEdit1.Text then
       begin
          if dmDatabase.dsUser.DataSet.State <> dsBrowse then
            dmDatabase.dsUser.DataSet.post ;
          lvUsers.Selected.Caption := DBEdit1.Text ;
       end;
end;

procedure TfmAccessControl.lvUsersChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
if lvUsers.Selected <> nil then
 if not BinInit then
  begin

    dmDatabase.tblUser.Locate('Wuserid',Integer(lvUsers.Selected.Data),[]);
    edtPassword.Text := DecodePassword(dmDatabase.tblUserSPassword.Text);
    LoadBatchLIst;
    LoadParams(dmDatabase.tblUserWUserID.AsInteger);
  end;

end;

procedure TfmAccessControl.lvUsersChanging(Sender: TObject;
  Item: TListItem; Change: TItemChange; var AllowChange: Boolean);
begin
if DBEdit1.Focused then
    edtPassword.SetFocus ;
end;

procedure TfmAccessControl.FormCreate(Sender: TObject);
var
 i : Integer ;
begin
  cbSystemlang.Clear ;
  for i := 0 to DMTCCoreLink.TheGlobalDataObject.Languages.Count -1 do
     begin
       cbSystemlang.Items.Add(DMTCCoreLink.TheGlobalDataObject.Languages[i].Name) ;
     end;
  cblang.Clear ;
  DMTCCoreLink.GroupsObject.FillListWithReportingGroup(1004,cblang.Items);
  cbLang.Items.Insert(0,'');
end;

procedure TfmAccessControl.Numbering1Click(Sender: TObject);
begin
 fmDocumentSetup   := TfmDocumentSetup.Create(Application);
 try
   // fmDocumentSetup.
   fmDocumentSetup.currentuser :=  dmDatabase.tblUserWUserID.AsInteger ;
   fmDocumentSetup.ShowModal ;
 finally
    fmDocumentSetup.free ;
 end;
 dmDatabase.tblUser.open ; 
end;

end.
