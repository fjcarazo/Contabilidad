(*
  Id: osfLookup.pas,v 1 2006/09/01 23:27:52 Pieter Valentijn
  osFinancials , Open Source Accounting Solutions
  Mixed Unit (TC and changes osF)
  http://www.osfinancials.org
  Released under the GNU General Public License
*)
unit osfLookup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DB, ComCtrls, ExtCtrls, Menus,
   DBAccess , Uni, UConnectionClass,TcashClasses,UGenSearch,UOSFVisuals,
  MemDS, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;
const
  SelectAccountSql = 'Select SACCOUNTCODE,SDescription,WAccountTypeID,WAccountID from v_account account ' +
                     'where Binactive = 0 ' ;

type
  TTCReturnLookupType = (tcrtSelect,tcrtNew,tcrtClose,tcrtEscape,tcrtBack);
  TTCLookupType = (tcltAccount,tcltStock,tcltPeriods,tcltContacts,tcltAccountGroup,tcltDocument,tcltBatch);
  TTCSelectType = (tcstALL,tcstGLTHREE,tcstGLANDTAX,tcstGLONE,tcstDEB,tcstCRED,
                   tcstBANK,tcstNTAX,tcstTAX,tcstBATCH,tcstTHISYEAR,tcstLASTYEAR,tcstALLYEAR,
                   tcstAccountRepGroup1,tcstAccountRepGroup2,tcstDebtorRepGroup1,tcstDebtorRepGroup2,
                   tcstCreditorRepGroup1,tcstCreditorRepGroup2,tcstStockRepGroup1,tcstStockRepGroup2,
                   tcstDocumentRepGroup1,tcstDocumentRepGroup2,tcstDEBCRED );
  TosfLookup = class(TForm)
    PopupMenu1: TPopupMenu;
    Usefilter1: TMenuItem;
    tblAccount: TuniQuery;
    TblStock: TuniQuery;
    tblContacts: TuniQuery;
    TblPeriods: TuniQuery;
    DSGeneral: TDataSource;
    tblSysVars: TuniQuery;
    ZQTblGroup: TuniQuery;
    Panel1: TPanel;
    CBField: TComboBox;
    CBLogic: TComboBox;
    cbField2: TComboBox;
    ECode2: TEdit;
    ECode: TEdit;
    Bsearch: TButton;
    Button1: TButton;
    StatusBar: TStatusBar;
    TShowDetail: TTimer;
    cbAutogroup: TComboBox;
    Label2: TLabel;
    ZQBatType: TuniQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel2: TPanel;
    Label1: TLabel;
    LSearch: TLabel;
    cbCode: TCheckBox;
    cbDescription: TCheckBox;
    cbBarCode: TCheckBox;
    procedure DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrdLookupTitleClick(Column: TColumn);
    procedure DBGrdLookupDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbBarCodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbCodeClick(Sender: TObject);
    procedure Usefilter1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BsearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBLogicChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TblStockAfterScroll(DataSet: TDataSet);
    procedure TShowDetailTimer(Sender: TObject);
    procedure ECodeKeyPress(Sender: TObject; var Key: Char);
    procedure TblStockWSTOCKIDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure TblStockAfterOpen(DataSet: TDataSet);
  private
    InProc:Boolean;
    FIsShowForm: Boolean;
    FaOSAConnectionItem: TOSAConnectionItem;
    FaGlobalDataObject: TGlobalDataObject;

    Procedure SetLookupOrder;
    Procedure GetLookupOrder;
    procedure SetIsShowForm(const Value: Boolean);
    procedure MyOnFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure SetaOSAConnectionItem(const Value: TOSAConnectionItem);
    procedure SetaGlobalDataObject(const Value: TGlobalDataObject);


    { Private declarations }
  public
    Asearch : TGenSearch ;

    Lookuptype : TTCLookupType ;
    STKSQLOnlyForLookup: Boolean ;
    search,Look,Look2:String;
    First,Account,BBarCode,CanCreateAccount:Boolean;
    SSelect : TTCSelectType ;
    SExtraLimit : String ;
    ReturnLookupType : TTCReturnLookupType ;
    ReturnID : integer ;
    ReturnDocid : Integer ;
    ReturnLookup,ReturnLookupDesc : String ;
    SavePrefix : String ;
    MyGroupLookup : Integer ;
    FAmount : Double ;
    procedure SelectLookup(Sender: TObject ;Title : String ;Select  : TTCSelectType; Tabletype : TTCLookupType ; ID:Integer;Order : integer = 0;ExtraLimit : String = '' );
    procedure SetSortOrder ;
    procedure AccountCodeGetText(Sender: TField; var Text: String;  DisplayText: Boolean);

    property IsShowForm : Boolean  read FIsShowForm write SetIsShowForm;
    property aOSAConnectionItem : TOSAConnectionItem  read FaOSAConnectionItem write SetaOSAConnectionItem;
    property aGlobalDataObject : TGlobalDataObject  read FaGlobalDataObject write SetaGlobalDataObject;
    procedure WMSysCommand (var Msg: TWMSysCommand) ; message WM_SYSCOMMAND;

    { Public declarations }

  end;


procedure OSFGetLookupValue(Var ReturnLookup: String;var ReturnID : Integer;Title,SavePrefix : String ;Select  : TTCSelectType; Tabletype : TTCLookupType ; ID , Order: Integer;ExtraLimit : String = '');


implementation


uses {XRoutines,}variants, Math, UDMTCCoreLink, OSFGeneralRoutines,
  UMsgBox, UDmQuantumGridDefs;


{$R *.DFM}
procedure OSFGetLookupValue(Var ReturnLookup: String;var ReturnID : Integer;Title,SavePrefix : String ;Select  : TTCSelectType; Tabletype : TTCLookupType ; ID , Order: Integer;ExtraLimit : String = '');
var
 aosfLookup : TosfLookup ;
begin
 aosfLookup := TosfLookup.Create(nil) ;
  try
  aosfLookup.aGlobalDataObject := DMTCCoreLink.TheGlobalDataObject ;
  aosfLookup.SavePrefix := SavePrefix ;
  aosfLookup.aOSAConnectionItem :=  DMTCCoreLink.TheOSAConnectionItem ;
  aosfLookup.Width := 600 ;
  aosfLookup.Height := 600 ;
  aosfLookup.ScaleBy(Trunc(100 * glScaleByPerc),100);
  aosfLookup.SelectLookup(nil,Title,Select,Tabletype,ID,Order,extraLimit);

  ReturnLookup := aosfLookup.ReturnLookup ;
  ReturnID := aosfLookup.ReturnID ;
 finally
   aosfLookup.free ;
 end;
end;

procedure TosfLookup.WMSysCommand(var Msg: TWMSysCommand);
begin
   if (Msg.CmdType <> SC_MINIMIZE) then
   DefaultHandler(Msg)  else
   ModalResult := mrCancel ;
end;


Procedure TosfLookup.SetLookupOrder;
Var
  i:Byte;
begin
  if cbDescription.Checked then
    i:=1
  else if  cbBarCode.Checked then
    i:=2
  else i:=0;
  case Lookuptype of
  tcltAccount :  aOSAConnectionItem.WriteNwReportOp(SavePrefix+ 'WAccLookUpOrder',IntToStr(i));
  tcltStock   : aOSAConnectionItem.WriteNwReportOp(SavePrefix+'WStoLookUpOrder',IntToStr(i));
  tcltDocument : aOSAConnectionItem.WriteNwReportOp(SavePrefix+'WDocLookUpOrder',IntToStr(i));
  tcltPeriods  : aOSAConnectionItem.WriteNwReportOp(SavePrefix+'WPrdLookUpOrder',IntToStr(i));
  tcltContacts : aOSAConnectionItem.WriteNwReportOp(SavePrefix+'WCntLookUpOrder',IntToStr(i));
  tcltAccountGroup : aOSAConnectionItem.WriteNwReportOp(SavePrefix+'WCntAccountGroup',IntToStr(i));
  end; // end case
end;

Procedure TosfLookup.GetLookupOrder;
Var
  i:Byte;
begin
  cbBarCode.Caption:=  aGlobalDataObject.CurrentLanguage.GetTextLang(989);{'Auto Select';}
  i := 0 ;
  case Lookuptype of
      tcltAccount : i:=StrToIntDef(aOSAConnectionItem.ReadNwReportOp(SavePrefix+ 'WAccLookUpOrder'),0);
      tcltStock : i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp(SavePrefix+'WStoLookUpOrder'),0);
      tcltDocument : i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp(SavePrefix+'WDocLookUpOrder'),0);
      tcltPeriods : i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp(SavePrefix+'WPrdLookUpOrder'),0);
      tcltcontacts :  i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp(SavePrefix+'WCntLookUpOrder'),0);
      tcltAccountGroup : i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp(SavePrefix+'WCntAccountGroup'),0);
  end ;

  if i=1 then
    cbDescription.Checked := True
  else if i=2 then
    cbCodeClick(cbBarCode)
  else
   cbCodeClick(cbCode);
end;


procedure TosfLookup.AccountCodeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not tblAccount.IsEmpty then
  Text :=  TDataBaseRoutines.AccTypeToChar(tblAccount.fieldbyname('WAccountTypeID').AsInteger) + Sender.asstring ;
end;


procedure TosfLookup.SelectLookup(Sender: TObject ;Title : String ;Select  : TTCSelectType
; Tabletype : TTCLookupType ; ID:Integer;Order : integer = 0;ExtraLimit : String = '');
var
 i : Integer ;
begin


 if Asearch.aSearchPanel.LookupExists('GENL_'+IntToStr(ord(Select))+'_'+IntToStr(ord(Tabletype))) then
   begin
      TDatabaseRegistyRoutines.ReadFormPos(self,SavePrefix+IntToStr(ord(sSelect)) +':' +IntToStr(ord(Lookuptype)));
      Panel1.Visible := false ;
       cxGrid1.Visible := False ;
      Asearch.tag := 1 ;
      Asearch.Show ;
      Asearch.Init('GENL_'+IntToStr(ord(Select))+'_'+IntToStr(ord(Tabletype)));
   end else
   begin
     cxGrid1.Visible := True ;
     Panel1.Visible := True ;
     Asearch.tag := 0 ;
     Asearch.Hide ;



 // todo : set make sysparam on user
 cbAutogroup.Visible := False ;
 Label2.Visible := false ;
 look := '' ;
 SExtraLimit := ExtraLimit ;
 Usefilter1.Checked := UPPERCASE(VarToStr(aOSAConnectionItem.ReadNwReportOp('LUPF_'+SavePrefix+intToStr(ord(Tabletype)),BoolToStr(false,true)))) = 'TRUE' ;
 tblAccount.OnFilterRecord := MyOnFilterRecord ;
 tblStock.OnFilterRecord := MyOnFilterRecord ;
 ZQTblGroup.OnFilterRecord := MyOnFilterRecord ;
 tblContacts.OnFilterRecord := MyOnFilterRecord ;
  InProc := False;
// Initialise the Position and Variables for this form.
     Label1.Caption := aGlobalDataObject.CurrentLanguage.GetTextLang(944); {Search by}
     cbCode.Caption := aGlobalDataObject.CurrentLanguage.GetTextLang(605);{'Code';}
     cbDescription.Caption := aGlobalDataObject.CurrentLanguage.GetTextLang(178);{'Description';}
     self.Caption:=Title;
     Lookuptype := Tabletype;
     SSelect:=Select;

     TDatabaseRegistyRoutines.ReadFormPos(self,SavePrefix+IntToStr(ord(sSelect)) +':' +IntToStr(ord(Lookuptype)));




     First:= True;
     Look:='';
     Look2:='';
     BBarCode:=False;

     Search:='SMAINACCOUNTCODE';
     for i := cxGrid1DBTableView1.ColumnCount-1 downto 0 do
       cxGrid1DBTableView1.Columns[i].Free ;
     ReturnID:=0;
     ReturnLookup:='';



    CBField.ItemIndex := DMTCCoreLink.ReadSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELDLOOKUP',0,DMTCCoreLink.currentuser);
    ECode.Text := DMTCCoreLink.ReadSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELDLOOKUPTEXT','',DMTCCoreLink.currentUser);
    CBLogic.ItemIndex := DMTCCoreLink.ReadSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWLOGICLOOKUP',0,DMTCCoreLink.currentUser);
    CBField2.ItemIndex := DMTCCoreLink.ReadSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELD2LOOKUP',0,DMTCCoreLink.currentUser);
    ECode2.Text := DMTCCoreLink.ReadSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELD2LOOKUPTEXT','',DMTCCoreLink.currentUser);
    cbAutogroup.ItemIndex :=  cbAutogroup.Items.IndexOfObject(TObject(StrToIntDef(VarToStr(DMTCCoreLink.ReadSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'GROUPLOOKUPTEXT',0,DMTCCoreLink.currentUser)),0)));


// Opens and set DBGrid if Accounts must be looked up.
// Filters according to parameter passed

     if Tabletype  = tcltAccount then
     begin
         tblAccount.SQL.Text := SelectAccountSql ;
         if ExtraLimit ='ALL' then
           tblAccount.SQL.Text :=   'Select SACCOUNTCODE,SDescription,WAccountTypeID,WAccountID from v_account account where 1 = 1' ;

            if SSelect = tcstTAX  then
             begin
              tblAccount.SQL.Text := 'select account.* from v_account account left join tax on account.Waccountid = tax.Waccountid where account.BINACTIVE = 0 and WAccountTypeID = 4';

             end;


          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;


          cxGrid1DBTableView1.Columns[0].Caption:=DMTCCoreLink.GetTextLang(605);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'SACCOUNTCODE';
          cxGrid1DBTableView1.Columns[1].Caption:=DMTCCoreLink.GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
          cxGrid1DBTableView1.Columns[1].Width := 300  ;

          DSGeneral.dataset :=   tblAccount ;
          if ExtraLimit <> '' then
            if ExtraLimit <>'ALL' then
             tblAccount.SQL.add(ExtraLimit);

          if Select = tcstALL then
           begin



             tblAccount.Filtered:=true;
           end
          else if Select = tcstGLTHREE then
             begin
             tblAccount.SQL.add(' and (WAccountTypeID=0 or WAccountTypeID=3 or ((WAccountTypeID=4) and (WAccountID <>0)))');
             tblAccount.Filtered:=true;
             end
          else if Select = tcstGLANDTAX then
             begin
             tblAccount.SQL.add('and (WAccountTypeID = 0 OR (WAccountTypeID = 4 AND WAccountID<>0))');
              tblAccount.Filtered:=true;
             end
          else if Select = tcstGLONE then
             begin
             tblAccount.SQL.add(' and (WAccountTypeID=0)');
              tblAccount.Filtered:=true;
             end
          else if Select = tcstDEB then
             begin
             tblAccount.SQL.add(' and (WAccountTypeID=1)');
             tblAccount.Filtered:=true;
             end
          else if Select = tcstCRED  then
             begin
             tblAccount.SQL.add(' and (WAccountTypeID=2)');
               tblAccount.Filtered:=true;
             end
          else if Select = tcstDEBCRED  then
             begin
             tblAccount.SQL.add(' and (WAccountTypeID=2 or WAccountTypeID=1)');
               tblAccount.Filtered:=true;
             end
          else if Select = tcstBANK  then
             begin
             tblAccount.SQL.add(' and WAccountTypeID = 3');
               tblAccount.Filtered:=true;
             end
          else if Select = tcstNTAX  then
             begin
             tblAccount.SQL.add(' and WAccountTypeID = 4 And WAccountID<>0');
              tblAccount.Filtered:=true;
             // default tax  is not 1 but 0
             end
          else if Select = tcstTAX  then
             begin
               tblAccount.SQL.add(' and WAccountTypeID = 4');
               tblAccount.Filtered:=true;
             // default tax  is not 1 but 0
             if ID = 1 then ID := 0 ;
             end
          else if Select = tcstBATCH  then
              begin
               tblAccount.SQL.add( ' and account.WAccountID <> ' + aOSAConnectionItem.GetSysVar('DebtorsControlID') +
                                   ' and account.WAccountID <> 0 and account.WAccountID <> ' + aOSAConnectionItem.GetSysVar('WCreditorsControlID') +
                                   ' and account.WAccountID <> ' + aOSAConnectionItem.GetSysVar('WRetainedIncomeID'));
             end;
       if STKSQLOnlyForLookup then
          tblAccount.SQL.Add(' and account.WAccountID = '+ IntToStr( ID));

      tblAccount.Open;
      tblAccount.FindField('SACCOUNTCODE').OnGetText := AccountCodeGetText ;
      tblAccount.FindField('SACCOUNTCODE').DisplayWidth := tblAccount.FindField('SACCOUNTCODE').DisplayWidth + 2  ;


      tblAccount.Locate('WAccountID',ID,[]);
     end else
    if  Tabletype = tcltBatch then
         begin

           ZQBatType.SQL.Text := 'Select * from v_battypes battypes ' ;
           if SExtraLimit <> '' then
             ZQBatType.SQL.add(sExtraLimit);


          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;


          cxGrid1DBTableView1.Columns[0].Caption:=DMTCCoreLink.GetTextLang(605);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'WBATCHTYPEID';
          cxGrid1DBTableView1.Columns[1].Caption:=DMTCCoreLink.GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
          cxGrid1DBTableView1.Columns[1].Width := 300  ;

          DSGeneral.DataSet := ZQBatType;


          ZQBatType.open ;
 


         end else

     if  Tabletype = tcltDocument then
         begin

          if Select =  tcstDEBCRED then
            begin
             tblAccount.SQL.Text := 'select 0 Saccountcode, tr.wdocid,tr.WTRANSACTIONID,tr.Sreference SDocno , trim(Cast(tr.FOUTSTANDINGAMOUNT as varchar(15))) sdescription,FOUTSTANDINGAMOUNT, tr.WDESCRIPTIONID from '+
             ' transact tr left join dochead doc on tr.Wdocid = doc.Wdocid where tr.FOUTSTANDINGAMOUNT <> 0 '
             + ExtraLimit + ' union select 0 Saccountcode, tr.wdocid,0,tr.SDocno , trim(Cast(cast(sum(rl.FINCLUSIVEAMT ) as numeric(12,2) ) as varchar(15))) sdescription,sum(rl.FINCLUSIVEAMT ) FOUTSTANDINGAMOUNT, 0 ' +
             ' from dochead tr join docline rl on tr.WDocid = rl.WDocid where tr.Wtypeid = 10 and tr.Bposted = 0 and WSOURCETYPEID <> 3 and SDocNo <> ' + QuotedStr('')  +' '  + ExtraLimit +
             ' group by  tr.wdocid,tr.SDocno having cast(sum(rl.FINCLUSIVEAMT )as numeric(12,2))  > 0 ' ;

 
 
             Panel1.Visible:= false ;

            end
          else
           begin
            tblAccount.SQL.Text := 'Select WDocid, SDocNo,trim(coalesce(Account.SDescription,'+QuotedStr('')+')) ||'+QuotedStr(' ')+' || trim(coalesce(SReference,'+QuotedStr('')+')) || trim(coalesce(Cast(Fdocamount as varchar(15)),'+QuotedStr('')+'))  Sdescription from dochead join v_account account on dochead.Waccountid = Account.WAccountid and dochead.SDocNo <> ' + QuotedStr('') + ExtraLimit ;
           end;

          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;


          cxGrid1DBTableView1.Columns[0].Caption:=DMTCCoreLink.GetTextLang(605);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'SDocNo';
          cxGrid1DBTableView1.Columns[1].Caption:=DMTCCoreLink.GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
           cxGrid1DBTableView1.Columns[1].Width := 300  ;
          DSGeneral.DataSet := tblAccount;


          tblAccount.open ;
 


         end else

     if  Tabletype = tcltStock then
     begin

          cbAutogroup.Visible := TDataBaseRoutines.FillStringsWithReportingGroups(cbAutogroup.Items,26) ;
          Label2.Visible := cbAutogroup.Visible ;
          tblStock.filtered := true ;


          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;



          tblStock.sql.text := 'Select * from stock where (BDISABLED  = 0 or  BDISABLED  is null) ' ;
          if ExtraLimit <> '' then
             tblStock.SQL.add(ExtraLimit);

          if select =  tcstDEB then
             begin
                tblStock.sql.add('and WStockTypeId in (0,1,2,4,7,8)');
             end ;
          if select =  tcstCRED then
             begin
               tblStock.sql.add('and WStockTypeId in (0,3,5,7)');
             end ;

          if STKSQLOnlyForLookup then
          tblStock.SQL.Add(' and WStockID = '+ IntToStr( ID));

          cxGrid1DBTableView1.Columns[0].Caption:=DMTCCoreLink.GetTextLang(605);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'SSTOCKCODE';
          cxGrid1DBTableView1.Columns[1].Caption:=DMTCCoreLink.GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
           cxGrid1DBTableView1.Columns[1].Width := 300  ;
          cxGrid1DBTableView1.Columns[2].Caption:=DMTCCoreLink.GetTextLang(2919);{'Description';}
          cxGrid1DBTableView1.Columns[2].DataBinding.FieldName := 'SExtraDesc';
           cxGrid1DBTableView1.Columns[3].Width := 300  ;
          cxGrid1DBTableView1.Columns[3].Caption:= TDataBaseRoutines.GetTypeDescription(26);
          cxGrid1DBTableView1.Columns[3].DataBinding.FieldName := 'WREPORTINGGROUP1ID';
           cxGrid1DBTableView1.Columns[3].Width := 300  ;
          cxGrid1DBTableView1.Columns[4].Caption:= TDataBaseRoutines.GetTypeDescription(27);
          cxGrid1DBTableView1.Columns[4].DataBinding.FieldName := 'WREPORTINGGROUP2ID';
           cxGrid1DBTableView1.Columns[4].Width := 300  ;

          tblStock.Open;
          DSGeneral.DataSet := tblStock ;

          tblStock.Locate('WStockID',ID,[]);
         if Order = 1 then
            cbCode.Checked := true ;
         if Order = 2 then
            cbDescription.Checked := true ;

     end;
// Opens and set DBGrid if Periods must be looked up.
// Filters according to parameter passed
     if Tabletype = tcltPeriods then
     begin

 
         Panel1.Visible:= false ;



         TblPeriods.SQL.Text := 'Select * from periods ' ;
          case Select of
          tcstTHISYEAR :
          begin
               TblPeriods.SQL.add('where (wyearid = 1 or WYEARID = 2) and WPeriodID >' + IntToStr(13) + ' and WPeriodID <= '+IntToStr(26));
          end;
          tcstLASTYEAR :
          begin
               TblPeriods.SQL.add('where (wyearid = 1 or WYEARID = 2) and WPeriodID <=' + IntToStr(13)) ;
          end;
          tcstALLYEAR :
          begin
                TblPeriods.SQL.add('where (wyearid = 1 or WYEARID = 2)');
          end;
          end ;// end case

          tblPeriods.Open;
          tblSysVars.Open;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;

          cxGrid1DBTableView1.Columns[0].Caption:=DMTCCoreLink.GetTextLang(600);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'WPeriodID';
          cxGrid1DBTableView1.Columns[1].Caption:=DMTCCoreLink.GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
          cxGrid1DBTableView1.Columns[2].Caption:=DMTCCoreLink.GetTextLang(987);{'Description';}
          cxGrid1DBTableView1.Columns[2].DataBinding.FieldName := 'DStartDate';
          cxGrid1DBTableView1.Columns[3].Caption:= DMTCCoreLink.GetTextLang(988);
          cxGrid1DBTableView1.Columns[3].DataBinding.FieldName := 'DEndDate';

          DSGeneral.DataSet := tblPeriods ;


          tblPeriods.IndexFieldNames := 'WPeriodID' ;


      tblPeriods.Locate('WPeriodID',ID,[]);
     end;   // end periods
     if Tabletype = tcltAccountGroup then
       begin
          ZQTblGroup.close ;
          case Select of
          tcstAccountRepGroup1 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 20 ;
          tcstAccountRepGroup2 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 21 ;
          tcstDebtorRepGroup1 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 22 ;
          tcstDebtorRepGroup2 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 23 ;
          tcstCreditorRepGroup1 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 24 ;
          tcstCreditorRepGroup2 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 25 ;
          tcstStockRepGroup1 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 26 ;
          tcstStockRepGroup2 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 27 ;
          tcstDocumentRepGroup1 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 28 ;
          tcstDocumentRepGroup2 : ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := 29 ;
          end ;// end case
           if MyGroupLookup <> 0 then
              ZQTblGroup.ParamByName('WGroupTypeID').AsInteger := MyGroupLookup ;


          ZQTblGroup.filtered := true ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.Columns[0].Caption:=DMTCCoreLink.GetTextLang(605);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'WGroupID';
          cxGrid1DBTableView1.Columns[1].Caption:=DMTCCoreLink.GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';


          ZQTblGroup.Open;
          DSGeneral.DataSet := ZQTblGroup ;
 
          ZQTblGroup.Locate('WGroupID',ID,[]);

       end;// end Reportinggroups
     // remeber filter so a filer can be applayed when looking for accounts
     try
        cxGrid1DBTableView1.ReStoreFromRegistry('Software\osfinancials\grids\'+ SavePrefix+IntToStr(ord(sSelect)) +':' +IntToStr(ord(Lookuptype)),false);
     except
        cxGrid1DBTableView1.RestoreDefaults ;
     end;

     end;

      if Order = 1 then
         cbCode.Checked := true
      else
      if Order = 2 then
         cbDescription.Checked := true
      else
      if Order = 3 then
         cbBarCode.Checked := true
      else
      GetLookupOrder;
     // Just when theres no order

      SetSortOrder ;


    { if FIsShowForm then
     begin
     if not (fsShowing in self.Formstate) then
     self.Show ;
     end else  }
     self.ShowModal ;
end;

procedure TosfLookup.DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
var
code:Integer;
begin
   if  Asearch.Tag = 1 then
    begin
  if Key = #13 then
     begin
          ModalResult := mrOk ;
          ReturnLookupType := tcrtSelect ;
          First := false ;
          Key:=#0;
          close;
     end;
     if Key = #27 then
     begin
          ReturnLookupType := tcrtEscape ;
          Key:=#0;
          close;
     end;
      exit ;
    end;



     Code:=Ord(Key);
// Determines if it should use Alpha or Numbers for search
     If (First = True) and (Key <> #13)  then
     begin
          First:=False;
          Look:='';
          If ((Code >= 65) and (Code <= 122) And (cbBarCode.Checked)) OR ( cbDescription.Checked) then
          begin
            cxGrid1DBTableView1.Columns[0].SortOrder := soNone ;
            cxGrid1DBTableView1.Columns[1].SortOrder := soAscending ;
            cxGrid1DBTableView1.Columns[1].SortIndex := 1 ;

          Account:=false;
          end;
          If ((Code >= 48) and (Code <=57) AND (cbBarCode.Checked)) OR (cbCode.Checked) then
          begin
            cxGrid1DBTableView1.Columns[1].SortOrder := soNone ;
            cxGrid1DBTableView1.Columns[0].SortOrder := soAscending ;
            cxGrid1DBTableView1.Columns[0].SortIndex := 1 ;


          Account:=true;

          end;
          
     end;

// Lookup and Validate keyboard inputs. Closes if ESC or ENTER is pressed.

     If (Code >= 48) and (Code <= 122) Or (Code in [32,42,45,46,47,92,95])  then
     begin
          Look := Look+Key;
          if Usefilter1.Checked then cxGrid1DBTableView1.DataController.DataSet.Refresh ;
          if Account = false then
          begin
             if Lookuptype = tcltStock then
             begin
             if not Usefilter1.Checked then
               if tblStock.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]) = false then

                begin
                 if  CanCreateAccount then
                       begin
                       ReturnLookupType:= tcrtNew ;
                       close;
                       end;
                end;
             end else
             if Lookuptype = tcltDocument then
             begin
               if not Usefilter1.Checked then
               tblAccount.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end else
             if Lookuptype = tcltAccount then
             begin
               if not Usefilter1.Checked then
               tblAccount.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end else
             if Lookuptype = tcltPeriods then
             begin
                if not Usefilter1.Checked then
                   tblPeriods.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end else
             if Lookuptype = tcltAccountGroup then
             begin
                if not Usefilter1.Checked then
                   ZQTblGroup.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end;

          end;

          if Account = true then
          begin
             if Lookuptype = tcltDocument then
             begin
              if not Usefilter1.Checked then
               begin
                Search:='SDOCNO';
                if not tblAccount.Locate(Search,Look,[LoPartialkey,LoCaseInsensitive]) then
                  Look:=Key;
                end;

             end else
             if Lookuptype = tcltAccount then
             begin
             // Changed By Sylvain 10-04-2000
             if not Usefilter1.Checked then
               begin
                Search:='SACCOUNTCODE';
                if Length(look)> DMTCCoreLink.MainAccountLength + 3  then look:=Key;
                if not tblAccount.Locate(Search,Look,[LoPartialkey,LoCaseInsensitive]) then
                  Look:=Key;
                end;
             end;
             if Lookuptype = tcltStock then
             begin
             if not tblStock.Locate('SSTOCKCODE',Look,[LoPartialkey,LoCaseInsensitive])  then
               begin
                 if  CanCreateAccount then
                       begin
                       ReturnLookupType:= tcrtNew ;
                       close;
                       end;

               end;
             end;
             if Lookuptype = tcltPeriods then
             begin
                  try
                  tblPeriods.Locate('WPeriodID',Look,[]) ;
                  except
                  Look:='';
                  end;
             end;
             if Lookuptype = tcltAccountGroup then
             begin
                  try
                  ZQTblGroup.Locate('WGROUPID',Look,[]);
                  except
                   Look:='';
                  end;
             end;


          end;
     end;
     if Key = #13 then
     begin
          ModalResult := mrOk ;
          ReturnLookupType := tcrtSelect ;
          First := false ;
          Key:=#0;
          close;
     end;
     if Key = #27 then
     begin
          ReturnLookupType := tcrtEscape ;
          Key:=#0;
          close;
     end;
     StatusBar.SimpleText:=Look;
     if {not Account and} Usefilter1.Checked then
     begin
     if (Lookuptype = tcltAccount) or (Lookuptype = tcltDocument)  then
       if tblAccount.active then
       tblAccount.Refresh;
     if (Lookuptype = tcltStock) then
       if tblStock.active then
       tblStock.Refresh;
     end;
 LSearch.Caption := look ;
 if look = '' then
   First := true;
end;

procedure TosfLookup.FormClose(Sender: TObject; var Action: TCloseAction);
var
 dummy : integer ;
begin
 if   (Asearch.Tag = 1 ) then
     begin
        if ReturnLookupType = tcrtSelect then
          begin
            ReturnLookup := '' ;
            if Asearch.ZQGenSearch.FindField('NAME') <> nil then
               ReturnLookup := Asearch.ZQGenSearch.FindField('NAME').AsString ;

           ReturnID := 0 ;
           if Asearch.ZQGenSearch.FindField('ID') <> nil then
              ReturnID := Asearch.ZQGenSearch.FindField('ID').AsInteger ;

            TDatabaseRegistyRoutines.WriteFormPos(self,SavePrefix + IntToStr(ord(sSelect)) +':' +IntToStr(ord(Lookuptype)));

          end;
     end else
     begin


   TShowDetail.Enabled := false ;
   cxGrid1DBTableView1.StoreToRegistry('Software\osfinancials\grids\'+ SavePrefix+IntToStr(ord(sSelect)) +':' +IntToStr(ord(Lookuptype)));


   try
    dummy := 0 ;
    ReturnID := -1 ;
    ReturnLookupDesc:='';
    SetLookupOrder;
    ReturnLookup := '' ;
     If Lookuptype = tcltDocument then
     begin
        if ReturnLookupType = tcrtSelect then
          begin
           if SSelect = tcstDEBCRED then
             begin
               ReturnLookup :=  tblAccount.FieldByName('SDOCNO').AsString ;
               ReturnID:=tblAccount.FieldByName('WTRANSACTIONID').AsInteger;
               ReturnLookupDesc := DMTCCoreLink.ReadDescription(tblAccount.FieldByName('WDESCRIPTIONID').AsInteger);
               ReturnLookupType := tcrtSelect ;
               FAmount := tblAccount.FieldByName('FOUTSTANDINGAMOUNT').AsFloat;
               ReturnDocid := tblAccount.FieldByName('WDOCID').AsInteger;
             end else
             begin
               ReturnLookup :=  tblAccount.FieldByName('SDOCNO').AsString ;
               ReturnID:=tblAccount.FieldByName('WDOCID').AsInteger;
               ReturnLookupDesc := tblAccount.FieldByName('SDescription').AsString;
               ReturnLookupType := tcrtSelect ;
               ReturnDocid := tblAccount.FieldByName('WDOCID').AsInteger;
             end;
          end;
          tblAccount.Filter:='';
        //  tblAccount.Close;
     end else
      If Lookuptype = tcltBatch then
     begin
        if ReturnLookupType = tcrtSelect then
          begin
           ReturnLookup :=  ZQBatType.FieldByName('WBATCHTYPEID').AsString ;
           ReturnID:=ZQBatType.FieldByName('WBATCHTYPEID').AsInteger;
           ReturnLookupDesc := ZQBatType.FieldByName('SDescription').AsString;
           ReturnLookupType := tcrtSelect ;
          end;
          ZQBatType.Filter:='';
          ZQBatType.Close;
     end;
     If Lookuptype = tcltAccount then
     begin
        if ReturnLookupType = tcrtSelect then
          begin
           ReturnLookup :=  tblAccount.FieldByName('SACCOUNTCODE').AsString ;
           ReturnID:=tblAccount.FieldByName('WAccountID').AsInteger;
           ReturnLookupDesc := tblAccount.FieldByName('SDescription').AsString;
           ReturnLookupType := tcrtSelect ;
          end;
          tblAccount.Filter:='';
          tblAccount.Close;
     end;
     If Lookuptype = tcltContacts then
     begin
       if ReturnLookupType = tcrtSelect then
        begin
          ReturnID := tblContacts.FieldByName('WContactID').AsInteger ;
          ReturnLookup:= tblContacts.FieldByName('WContactID').AsString;
          ReturnLookupDesc := tblContacts.FieldByName('SContactName').AsString;
         end;
          tblContacts.Filter:='';
          tblContacts.Close;
     end;
     If Lookuptype = tcltStock then
     begin
          if ReturnLookupType = tcrtSelect then
          begin
          ReturnLookup:=tblStock.FieldByName('SSTOCKCODE').AsString;
          ReturnLookupDesc := tblStock.FieldByName('Sdescription').AsString;
          ReturnID:= tblStock.FieldByName('WStockID').AsInteger;
          end;
          tblStock.Filter:='';
          tblStock.Close;
     end;
     If Lookuptype = tcltPeriods then
     begin
          if ReturnLookupType = tcrtSelect then
          begin
          ReturnLookup := tblPeriods.FieldByName('WPeriodID').AsString;
          ReturnID := tblPeriods.FieldByName('WPeriodID').AsInteger;
          end;
          tblPeriods.Filter:='';
          tblPeriods.Close;
     end;
     If Lookuptype = tcltAccountGroup then
     begin
          if ReturnLookupType = tcrtSelect then
          begin
          ReturnLookup := aOSAConnectionItem.GetNesteldNameFromGroupID(ZQTblGroup.FieldByName('WGroupId').AsInteger,dummy);
          ReturnID := ZQTblGroup.FieldByName('WGroupId').AsInteger;
          end;
          ZQTblGroup.Filter:='';
          ZQTblGroup.Close;
     end;
    tblStock.filtered := false ;
    tblStock.OnFilterRecord := nil ;
    tblAccount.OnFilterRecord := nil ;
    tblContacts.OnFilterRecord := nil ;
    ZQTblGroup.OnFilterRecord := nil ;
    // todo : Make sysparams
   TDatabaseRegistyRoutines.WriteFormPos(self,SavePrefix + IntToStr(ord(sSelect)) +':' +IntToStr(ord(Lookuptype)));
 


 DMTCCoreLink.WriteSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELDLOOKUP',CBField.ItemIndex,DMTCCoreLink.currentUser);
 DMTCCoreLink.WriteSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELDLOOKUPTEXT',ECode.Text,DMTCCoreLink.currentUser);

 DMTCCoreLink.WriteSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWLOGICLOOKUP',CBLogic.ItemIndex,DMTCCoreLink.currentUser);
 DMTCCoreLink.WriteSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELD2LOOKUP',CBField2.ItemIndex,DMTCCoreLink.currentUser);
 DMTCCoreLink.WriteSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'NEWFIELD2LOOKUPTEXT',ECode2.Text,DMTCCoreLink.currentUser);
 if cbAutogroup.ItemIndex > -1 then
 DMTCCoreLink.WriteSysParam(IntToStr(ord(SSelect)) + IntToStr(ord(Lookuptype)) + 'GROUPLOOKUPTEXT',IntToStr(Integer(cbAutogroup.Items.Objects[cbAutogroup.ItemIndex])),DMTCCoreLink.currentUser);


    aOSAConnectionItem.WriteNwReportOp('LUPF_'+SavePrefix+intToStr(ord(Lookuptype)) ,BoolToStr(Usefilter1.Checked,true));
   except
     on e : Exception do
      begin
          OSFMessageDlg(e.Message,mtError,[mbok],0);
      end;
   end;
 end;
end;

procedure TosfLookup.DBGrdLookupTitleClick(Column: TColumn);
begin
     if  (Lookuptype in [tcltSTOCK,tcltACCOUNT,tcltAccountGroup]) then
     begin
          If uppercase(Column.FieldName) = 'SDESCRIPTION' then
          begin
            cbCodeClick(cbDescription);
          end
          else
          begin
            cbCodeClick(cbCode);
          end;

     end else
      tblAccount.IndexFieldNames := Column.FieldName ;
end;

procedure TosfLookup.DBGrdLookupDblClick(Sender: TObject);
begin
     ReturnLookupType := tcrtSelect ;
     close;
end;

procedure TosfLookup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 
  //Added by Antonio
  //if the user pushes [home] go to the first record
  if Key = 36 then
  begin
   if  Asearch.Tag = 1 then
      Asearch.ZQGenSearch.First
    else
    begin
    if Lookuptype = tcltStock   then tblStock.First;
    if Lookuptype = tcltAccount then tblAccount.First;
    if Lookuptype = tcltPeriods then tblPeriods.First;
    If Lookuptype = tcltAccountGroup then ZQTblGroup.First ;
    end;
    Key := 0;
  end;
  //Added by sylvain
  // reset look to '' when moving up or down
  if (Key=38) or (Key=40) then
    First:=True;//Look:='';

  if Key = 35 then
  begin
   if  Asearch.Tag = 1 then
      Asearch.ZQGenSearch.First
    else
    begin
    if Lookuptype = tcltStock   then tblStock.Last;
    if Lookuptype = tcltAccount then tblAccount.Last;
    if Lookuptype = tcltPeriods then tblPeriods.Last;
    If Lookuptype = tcltAccountGroup then ZQTblGroup.Last ;
    end;
    Key := 0;
  end;
  //if the user pushed [Shift - Tab]
  if (Key = 9) and (Shift=[ssShift]) then
  begin
    ReturnLookupType := tcrtBack;
    Key := 0;
    Close;
  end;
  if Key = 45 then
  begin
     ReturnLookupType:= tcrtNew;
     Key := 0;
     close;
  end;
  // if the users presses backspace we drop one char of the look string
  if Key = 8 then
  begin
    if Length(look) > 0 then
       SetLength(look,Length(look)-1);
  end;

end;

procedure TosfLookup.rbBarCodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    cxGrid1.SetFocus;
end;

// sort setting
procedure TosfLookup.cbCodeClick(Sender: TObject);
  Procedure UnCheck(cbx,cby,cbz:TCheckBox);
  begin
    InProc := True;
    cbx.Checked := False;
    cby.Checked := False;
    cbz.Checked := True;
    InProc := False;
  end;
begin
  if InProc then exit;
  Look:='';First:=True;
  StatusBar.SimpleText:='';
  if Sender is TCheckBox then
  begin
    Case (Sender as TCheckBox).Tag of
    12:UnCheck(cbDescription,cbCode,cbBarCode);
    11:UnCheck(cbCode,cbBarCode,cbDescription);
    else
      UnCheck(cbDescription,cbBarCode,cbCode)
    end;
  end;
  SetSortOrder ;
  if cbDescription.Checked then
    Account:=False
  else if cbCode.Checked then
    Account:=True;
end;

procedure TosfLookup.SetIsShowForm(const Value: Boolean);
begin
  FIsShowForm := Value;
end;

procedure TosfLookup.Usefilter1Click(Sender: TObject);
begin
Usefilter1.Checked := not Usefilter1.Checked ; 
end;

procedure TosfLookup.MyOnFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
if Usefilter1.Checked then
 begin
     if Lookuptype = tcltDocument then
        begin
          if look <> '' then
         Accept := (pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0) or
            (pos(uppercase(look),uppercase(DataSet.FieldByName('SDocno').AsString)) <> 0)
          else
          Accept := true ;
        end else


    if Lookuptype = tcltAccount then
        begin
          if look <> '' then
          Accept := (pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0) or
            (pos(uppercase(look),uppercase(DataSet.FieldByName('SAccountcode').AsString)) <> 0)
          else
          Accept := true ;
        end else
    if Lookuptype =  tcltStock then
        begin
          if look <> '' then
          Accept := (pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0) or
                    (pos(uppercase(look),uppercase(DataSet.FieldByName('SStockCode').AsString)) <> 0)
          else
          Accept := true ;
        end  else
    if Lookuptype =  tcltAccountGroup then
        begin
          if look <> '' then
          Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0
          else
          Accept := true ;
        end;

  end;
end ;

procedure TosfLookup.SetaOSAConnectionItem(const Value: TOSAConnectionItem);
begin
 FaOSAConnectionItem := Value;
 if FaOSAConnectionItem = nil then exit ;
 FaOSAConnectionItem.AssignConnectionToChilds(self);
end;

procedure TosfLookup.SetaGlobalDataObject(const Value: TGlobalDataObject);
begin
  FaGlobalDataObject := Value;
end;

procedure TosfLookup.SetSortOrder;
begin
  if cxGrid1DBTableView1.ColumnCount <>0  then
   begin
    cxGrid1DBTableView1.DataController.ClearSorting(True);
    If cbCode.Checked then
      begin
      cxGrid1DBTableView1.Columns[0].SortOrder := soAscending ;
      end else
       If cbDescription.Checked then
       begin
      cxGrid1DBTableView1.Columns[1].SortOrder := soAscending ;
      end  ;

   end;
end;

procedure TosfLookup.FormCreate(Sender: TObject);
begin
 Asearch := TGenSearch.Create(self) ;
 Asearch.Parent := Self ;
 Asearch.Align := alClient ;
 Asearch.BorderStyle := bsNone ;
Asearch.DBGrid1.OnKeyPress :=  DBGrdLookupKeyPress ;
Asearch.DBGrid1.OnKeyDown :=  FormKeyDown ;
Asearch.DBGrid1.OnDblClick :=  DBGrdLookupDblClick ;
 Asearch.Init('');
 Asearch.Panel1.Visible := False ;
 STKSQLOnlyForLookup := DMTCCoreLink.ReadNwReportOp('STKSQLOnlyForLookup',false) ;
 CBField.Items[0] := DMTCCoreLink.GetTextLangNoAmp(2123); //Code
 CBField.Items[1] := DMTCCoreLink.GetTextLangNoAmp(1708);//Description
 CBField.Items[2] := DMTCCoreLink.GetTextLangNoAmp(1708) +' ' + DMTCCoreLink.GetTextLangNoAmp(2145) + ' '+ DMTCCoreLink.GetTextLangNoAmp(2123) ;//
 cbField2.Items[0] := DMTCCoreLink.GetTextLangNoAmp(2123); //Code
 cbField2.Items[1] := DMTCCoreLink.GetTextLangNoAmp(1708);//Description
 CBLogic.Items[0] := DMTCCoreLink.GetTextLangNoAmp(2321);//  None
 CBLogic.Items[1] := DMTCCoreLink.GetTextLangNoAmp(2145);//  And
 CBLogic.Items[2] := DMTCCoreLink.GetTextLangNoAmp(20094);// Or
 Bsearch.caption := DMTCCoreLink.GetTextLangNoAmp(952);//Search
 Button1.caption := DMTCCoreLink.GetTextLangNoAmp(1016);//Clear
 Label2.Caption := TDataBaseRoutines.GetTypeDescription(26);
 cbCode.Caption := DMTCCoreLink.GetTextLangNoAmp(605);
 cbDescription.Caption := DMTCCoreLink.GetTextLangNoAmp(606);
 cbBarCode.Caption := DMTCCoreLink.GetTextLangNoAmp(990);
 Usefilter1.caption := DMTCCoreLink.GetTextLangNoAmp(2967);
 DMTCCoreLink.GetTextLangNoAmp(944)
end;

procedure TosfLookup.BsearchClick(Sender: TObject);
Var
 AndOrLogic : String ;

 ExtraDesc : String ;
begin

if  LookupType = tcltBatch then
     begin
          ZQBatType.SQL.Text := 'Select * from battypes ' ;
           if SExtraLimit <> '' then
             ZQBatType.SQL.add(sExtraLimit);

         if ECode.Text <> '' then
         begin
         case CBField.ItemIndex of
           1 :  ZQBatType.SQL.Add(' and WBATCHTYPEID like ' + QuotedStr('%'+ECode.Text +'%' ));
           2 :  ZQBatType.SQL.Add('(and upper(trim(SDescription)) like ' + QuotedStr('%'+ECode.Text +'%')  +
                ' or WBATCHTYPEID like ' + QuotedStr('%'+ECode.Text +'%') + ')' );
           else
            ZQBatType.SQL.Add('and upper(trim(SDescription)) like ' + QuotedStr('%'+ECode.Text +'%' ));
           end ; // end case
         end;
        ZQBatType.open ;
     end else

 if  LookupType = tcltDocument then
     begin
          tblAccount.SQL.Text := 'Select WDocid, SDocNo,trim(Account.SDescription) ||'+QuotedStr(' ')+' || trim(SReference) || trim(Cast(Fdocamount as varchar(15)))  Sdescription from dochead join account on dochead.Waccountid = Account.WAccountid' ;
           if SExtraLimit <> '' then
             tblAccount.SQL.add(sExtraLimit);

          if ECode.Text <> '' then
         begin
         case CBField.ItemIndex of
           1 :  tblAccount.SQL.Add('and upper(trim(Account.SDescription) ||'+QuotedStr(' ')+' || trim(SReference) || trim(Cast(Fdocamount as varchar(15)))) like ' + QuotedStr('%'+ECode.Text +'%' ));
           2 :  tblAccount.SQL.Add('and (upper(trim(Account.SDescription) ||'+QuotedStr(' ')+' || trim(SReference) || trim(Cast(Fdocamount as varchar(15)))) like ' + QuotedStr('%'+ECode.Text +'%' ) +
                ' or SDocNo like ' + QuotedStr('%'+ECode.Text +'%') + ')' );
           else
            tblAccount.SQL.Add('and SDocNo like ' + QuotedStr('%'+ECode.Text +'%' ));
           end ; // end case
         end;

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
               1 :  tblAccount.SQL.Add(AndOrLogic + ' upper(trim(Account.SDescription) ||'+QuotedStr(' ')+' || trim(SReference) || trim(Cast(Fdocamount as varchar(15)))) like ' + QuotedStr('%'+ECode.Text +'%' ));
               else
                tblAccount.SQL.Add(AndOrLogic +' SDocNo like ' + QuotedStr('%'+ECode.Text +'%' ));
               end ; // end case
        end;
       end;
     tblAccount.open ;
     if tblAccount.FindField('SACCOUNTCODE') <> nil then
       begin
        tblAccount.FindField('SACCOUNTCODE').OnGetText := AccountCodeGetText ;
        tblAccount.FindField('SACCOUNTCODE').DisplayWidth := tblAccount.FindField('SACCOUNTCODE').DisplayWidth + 2  ;
      end;
 end else
 if LookupType  = tcltStock then
 begin
// BarcodeName :=  DMTCCoreLink.ReadSysParam('STK_BRCODELOOKUP','stock.SBARCODENUMBER',0);
 ExtraDesc :=  DMTCCoreLink.ReadSysParam('STK_EXTRDESCLOOKUP','stock.SExtraDesc',0);
 TblStock.SQL.Text:=  DMTCCoreLink.SQLList.GetFormatedSQLByName('database_selectstock') ;
 TblStock.SQL.Add('where stock.BDISABLED = 0 ');
           if SExtraLimit <> '' then
             TblStock.SQL.add(sExtraLimit);

 if ECode.Text <> '' then
 begin
 case CBField.ItemIndex of
   1 :  TblStock.SQL.Add('and upper(stock.SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ));
   2 :  TblStock.SQL.Add('and (upper(stock.SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ) +
       ' or upper(stock.SExtraDesc) like ' + QuotedStr('%'+ECode.Text +'%') +  ' or stock.SStockCode like ' + QuotedStr('%'+ECode.Text +'%') + ')' );
   else
    TblStock.SQL.Add('and stock.SStockCode like ' + QuotedStr('%'+ECode.Text +'%' ));
   end ; // end case
 end;
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
           1 :  TblStock.SQL.Add(AndOrLogic + 'stock.SDescription like ' + QuotedStr('%'+ECode2.Text +'%' ));
           else
            TblStock.SQL.Add(AndOrLogic +'stock.SStockCode like ' + QuotedStr('%'+ECode2.Text +'%' ));
           end ; // end case
    end;
   end;

 if cbAutogroup.ItemIndex > 0 then
    begin

       TblStock.SQL.Add(' and  stock.WReportingGroup1id in (' + TDataBaseRoutines.GetChildIDsFromGroupID(Integer(cbAutogroup.Items.Objects[cbAutogroup.ItemIndex] ),0) +')' ) ;
    end;
 TblStock.open ;

 end else
  if LookupType  = tcltAccount then
 begin
    // BarcodeName :=  DMTCCoreLink.ReadSysParam('STK_BRCODELOOKUP','stock.SBARCODENUMBER',0);
  case SSelect of
  tcstALL : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0' ;
  tcstGLTHREE : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 '+
               ' and ((WAccountTypeID=0 or WAccountTypeID=3 or WAccountTypeID=4) and WAccountID <>0 )';

  tcstGLANDTAX : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid in (0,4)' ;
  tcstGLONE : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid in (0)' ;
  tcstDEB : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid in (1)' ;
  tcstCRED : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid in (2)' ;
  tcstBANK : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid in (3)' ;
  tcstTAX : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid in (4)' ;
  tcstNTAX : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid not in (4)' ;
  tcstDEBCRED : tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 and BInactive = 0 and WAccountTypeid in (1,2)' ;

  end;
  if  SExtraLimit = 'ALL' then
    begin
       tblAccount.SQL.Text:= 'Select * from v_account account where BSUBACCOUNTS = 0 ' ;
    end;

 if ECode.Text <> '' then
 begin

 case CBField.ItemIndex of
   1 :  tblAccount.SQL.Add('and upper(account.SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ));
   2 :  tblAccount.SQL.Add('and (upper(account.SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ) +
        ' or account.SAccountcode like ' + QuotedStr('%'+ECode.Text +'%') + ')' );
   else
    tblAccount.SQL.Add('and account.SAccountcode like ' + QuotedStr('%'+ECode.Text +'%' ));
   end ; // end case
 end;
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
           1 :  tblAccount.SQL.Add(AndOrLogic + 'account.SDescription like ' + QuotedStr('%'+ECode2.Text +'%' ));
           else
            tblAccount.SQL.Add(AndOrLogic +'account.SAccountcode like ' + QuotedStr('%'+ECode2.Text +'%' ));
           end ; // end case
    end;
   end;
      if SExtraLimit <> '' then
        if  SExtraLimit <> 'ALL' then
         tblAccount.SQL.add(SExtraLimit);


 tblAccount.open ;
       tblAccount.FindField('SACCOUNTCODE').OnGetText := AccountCodeGetText ;
      tblAccount.FindField('SACCOUNTCODE').DisplayWidth := tblAccount.FindField('SACCOUNTCODE').DisplayWidth + 2  ;
 end  else
  if LookupType  = tcltPeriods then
 begin

    // BarcodeName :=  DMTCCoreLink.ReadSysParam('STK_BRCODELOOKUP','stock.SBARCODENUMBER',0);
 case SSelect of
          tcstTHISYEAR :
          begin
               TblPeriods.SQL.add('where (wyearid = 1 or WYEARID = 2) and WPeriodID >' + IntToStr(13) + ' and WPeriodID <= '+IntToStr(26));
          end;
          tcstLASTYEAR :
          begin
               TblPeriods.SQL.add('where (wyearid = 1 or WYEARID = 2) and WPeriodID <=' + IntToStr(13)) ;
          end;
          tcstALLYEAR :
          begin
                TblPeriods.SQL.add('where (wyearid = 1 or WYEARID = 2)');
          end;
   end ;// end case

     if SExtraLimit <> '' then
     TblPeriods.SQL.add(SExtraLimit);

 if ECode.Text <> '' then
 begin
  TblPeriods.SQL.Add('and upper(SDescription) like ' + QuotedStr('%'+ECode.Text +'%' ));
 end;
 AndOrLogic := '' ;


 TblPeriods.open ;
 end;

 Look := '' ;
 Label1.Caption := DMTCCoreLink.GetTextLangNoAmp(944){search by} + ':'  + Look ;
 if self.Visible then
 cxGrid1.SetFocus ;
end;

procedure TosfLookup.FormShow(Sender: TObject);
begin
 if Panel1.Visible then
 begin
 CBLogicChange(self);
 ECode.SetFocus ;
 end;
 cbCodeClick(self);
end;

procedure TosfLookup.CBLogicChange(Sender: TObject);
begin
cbField2.Visible := CBLogic.ItemIndex > 0 ;
ECode2.Visible := CBLogic.ItemIndex > 0 ;
end;

procedure TosfLookup.Button1Click(Sender: TObject);
begin
   ECode.Text := '' ;
   ECode2.Text := '' ;
   cbAutogroup.ItemIndex := -1 ;
end;

procedure TosfLookup.TblStockAfterScroll(DataSet: TDataSet);
begin
  TShowDetail.Enabled := true ;
end;

procedure TosfLookup.TShowDetailTimer(Sender: TObject);
var
 Total , QtyOnHand : Variant ;
 Stockid : Integer ;
 AStockRec : TStockRec ;
begin
  TShowDetail.Enabled := false ;
  if TblStock.FindField('WStockid') = nil then exit ;

  Stockid :=  TblStock.fieldByName('WStockid').AsInteger ;
  StatusBar.Panels[0].Text := '' ;
  StatusBar.Panels[1].Text := '' ;
  StatusBar.Panels[2].Text := '' ;
  StatusBar.Panels[3].Text := '' ;
  StatusBar.Panels[4].Text := '' ;
  StatusBar.Panels[5].Text := '' ;
  StatusBar.Panels[6].Text := '' ;
  StatusBar.Panels[7].Text := '' ;
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
   if varToStr(QtyOnHand) <> '' then
  Total := Total - QtyOnHand ;
   if varToStr(QtyOnHand) <> '' then
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
  StatusBar.Panels[7].Text :=  DMTCCoreLink.GetTextLang(3332)+ ' : ' +FloatToStr(AStockRec.FUnitCost) + '(' +FloatToStr(AStockRec.FUnitCost * TDataBaseRoutines.GetTaxRateOnId(AStockRec.WOutputTaxID))  + ')' ;
end;

procedure TosfLookup.ECodeKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
    BsearchClick(self);
end;


procedure TosfLookup.TblStockWSTOCKIDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
   aGroupRec : TGroupRecPointer ;
begin

         DMTCCoreLink.GroupsObject.getGroup(aGroupRec,Sender.AsInteger ) ;
         Text := aGroupRec^.SDescription ;

end;

procedure TosfLookup.TblStockAfterOpen(DataSet: TDataSet);
begin
 if DataSet.FindField('WREPORTINGGROUP1ID') <> nil then
   DataSet.FindField('WREPORTINGGROUP1ID').OnGetText := TblStockWSTOCKIDGetText ;
 if DataSet.FindField('WREPORTINGGROUP2ID') <> nil then
   DataSet.FindField('WREPORTINGGROUP2ID').OnGetText := TblStockWSTOCKIDGetText ;
end;

end.
