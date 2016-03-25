(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit OpenItemSelection;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,db, Buttons, ExtCtrls,
   Menus,
  DBAccess , Uni, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxSplitter;

type
  TfmOpenItemSelection = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    Panel1: TPanel;
    MDocinfo: TMemo;
    btnOk: TBitBtn;
    ZQTransAction: TuniQuery;
    ZUSQLTransAction: TUniUpdateSql;
    ZQOILinks: TuniQuery;
    ZQOILinksWOILINKSID: TIntegerField;
    ZQOILinksDDOCDATE: TDateTimeField;
    ZQOILinksSREFERENCE: TStringField;
    ZQOILinksSLINKEDREFERENCE: TStringField;
    ZQOILinksWFULLAMOUNT: TFloatField;
    ZQOILinksWOUTSTANDINGAMOUNT: TFloatField;
    ZQOILinksWLINKEDAMOUNT: TFloatField;
    ZQOILinksDDATE: TDateTimeField;
    ZQOILinksUNUSED1: TIntegerField;
    ZQOILinksWAMOUNTTRANSACTIONID: TIntegerField;
    ZQOILinksWLINKTRANSACTIONID: TIntegerField;
    ZQOILinksWUSERID: TIntegerField;
    ZQOILinksUNUSED2: TIntegerField;
    ZQOILinksWBATCHID: TIntegerField;
    ZQOILinksWACCOUNTID: TIntegerField;
    ZQOILinksWTAXID: TIntegerField;
    ZQOILinksDSYSDATE: TDateTimeField;
    ZQOILinksSDESCRIPTION: TStringField;
    ZUSQLOIlinks: TUniUpdateSql;
    dsOilinks: TDataSource;
    ZQOILINKSPRE: TuniQuery;
    ZUSQLLinksPre: TUniUpdateSql;
    ZQOILINKSPREWBATCHID: TIntegerField;
    ZQOILINKSPREWLINEID: TIntegerField;
    ZQOILINKSPREWBATCHTYPEID: TIntegerField;
    ZQOILINKSPREWTRANSACTIONID: TIntegerField;
    ZQOILINKSPREFAMOUNT: TFloatField;
    ZQTransActionWTRANSACTIONID: TIntegerField;
    ZQTransActionDDATE: TDateTimeField;
    ZQTransActionSREFERENCE: TStringField;
    ZQTransActionWTAXACCOUNTID: TIntegerField;
    ZQTransActionFAMOUNT: TFloatField;
    ZQTransActionORGOUTSTAND: TFloatField;
    ZQTransActionAMTPRE: TFloatField;
    ZQTransActionFOUTSTANDINGAMOUNT: TFloatField;
    ZQLinkeddetail: TuniQuery;
    dsLinkedDetail: TDataSource;
    ZUPDSQLLinkeddetail: TUniUpdateSql;
    ZQLinkeddetailWTRANSACTIONID: TIntegerField;
    ZQLinkeddetailWBATCHID: TIntegerField;
    ZQLinkeddetailWBATCHTYPEID: TIntegerField;
    ZQLinkeddetailWLINEID: TIntegerField;
    ZQLinkeddetailBCARRIEDFORWARD: TSmallintField;
    ZQLinkeddetailBLASTYEAR: TSmallintField;
    ZQLinkeddetailBLINKSUSED: TSmallintField;
    ZQLinkeddetailBMULTIPLEITEMS: TSmallintField;
    ZQLinkeddetailWACCOUNTID: TIntegerField;
    ZQLinkeddetailDDATE: TDateTimeField;
    ZQLinkeddetailWPERIODID: TIntegerField;
    ZQLinkeddetailWYEARID: TIntegerField;
    ZQLinkeddetailSREFERENCE: TStringField;
    ZQLinkeddetailFTAXRATE: TFloatField;
    ZQLinkeddetailWTAXACCOUNTID: TIntegerField;
    ZQLinkeddetailFAMOUNT: TFloatField;
    ZQLinkeddetailFTAXAMOUNT: TFloatField;
    ZQLinkeddetailFOUTSTANDINGAMOUNT: TFloatField;
    ZQLinkeddetailBRECONCILED: TSmallintField;
    ZQLinkeddetailWBALANCINGACCOUNTID: TIntegerField;
    ZQLinkeddetailWDESCRIPTIONID: TIntegerField;
    ZQLinkeddetailWCURRENCYID: TIntegerField;
    ZQLinkeddetailFFOREXAMOUNT: TFloatField;
    ZQLinkeddetailWUSERID: TIntegerField;
    ZQLinkeddetailUNUSED: TIntegerField;
    ZQLinkeddetailDSYSDATE: TDateTimeField;
    ZQLinkeddetailBUNUSED: TSmallintField;
    ZQLinkeddetailWTAX2ID: TIntegerField;
    ZQLinkeddetailFCURRENCYRATE2: TFloatField;
    ZQLinkeddetailFTAXRATE2: TFloatField;
    ZQLinkeddetailFTAX2AMOUNT: TFloatField;
    ZQLinkeddetailWJOBCODEID: TIntegerField;
    ZQLinkeddetailWPROFILEID: TIntegerField;
    ZQLinkeddetailBEXCLUSIVE: TSmallintField;
    ZQLinkeddetailWLINKEDID: TIntegerField;
    ZQLinkeddetailWREPORTINGGROUP1ID: TIntegerField;
    ZQLinkeddetailWREPORTINGGROUP2ID: TIntegerField;
    ZQLinkeddetailWDOCID: TIntegerField;
    ZQLinkeddetailDPAYMENTDATE: TDateTimeField;
    ZQLinkeddetailWREMITTANCECOUNT: TIntegerField;
    ZQLinkeddetailWPAYMENTTYPE: TIntegerField;
    ZQLinkeddetailWBATCHID_1: TIntegerField;
    ZQLinkeddetailWLINEID_1: TIntegerField;
    ZQLinkeddetailWBATCHTYPEID_1: TIntegerField;
    ZQLinkeddetailWTRANSACTIONID_1: TIntegerField;
    ZQLinkeddetailFAMOUNT_1: TFloatField;
    ZQLinkeddetailWMESSAGEID: TIntegerField;
    ZQLinkeddetailSDESCRIPTION: TStringField;
    ZQLinkeddetailSEXTRADESCRIPTION: TStringField;
    ZQLinkeddetailWACCOUNTID_1: TIntegerField;
    ZQLinkeddetailSACCOUNTCODE: TStringField;
    ZQLinkeddetailSMAINACCOUNTCODE: TStringField;
    ZQLinkeddetailSSUBACCOUNTCODE: TStringField;
    ZQLinkeddetailSDESCRIPTION_1: TStringField;
    ZQLinkeddetailWACCOUNTTYPEID: TIntegerField;
    ZQLinkeddetailWREPORTINGGROUP1ID_1: TIntegerField;
    ZQLinkeddetailWREPORTINGGROUP2ID_1: TIntegerField;
    ZQLinkeddetailBSUBACCOUNTS: TSmallintField;
    ZQLinkeddetailBINCOMEEXPENSE: TSmallintField;
    ZQLinkeddetailBOPENITEM: TSmallintField;
    ZQLinkeddetailBINACTIVE: TSmallintField;
    ZQLinkeddetailDSYSDATE_1: TDateTimeField;
    ZQLinkeddetailWPROFILEID_1: TIntegerField;
    ZQLinkeddetailWLINKACCOUNT: TIntegerField;
    ZQLinkeddetailWTAXACCOUNT: TIntegerField;
    ZQLinkeddetailWCURRENCYID_1: TIntegerField;
    ZQLinkeddetailWBATCHID_2: TIntegerField;
    ZQLinkeddetailWUSERID_1: TIntegerField;
    ZQLinkeddetailWBATCHTYPEID_2: TIntegerField;
    ZQLinkeddetailSBATCHNUMBER: TStringField;
    ZQLinkeddetailBPOSTED: TSmallintField;
    ZQLinkeddetailBIMPORTED: TSmallintField;
    ZQLinkeddetailBDOCSOURCE: TSmallintField;
    ZQLinkeddetailWLINECOUNT: TIntegerField;
    ZQLinkeddetailSFILENAME: TStringField;
    ZQLinkeddetailWDOCID_1: TIntegerField;
    ZQLinkeddetailDSYSDATE_2: TDateTimeField;
    ZQLinkeddetailWINITBATID: TIntegerField;
    ZQLinkeddetailSALIAS: TStringField;
    ZQLinkeddetailSUNIQUEID: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    llinkedlines: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    lopenlines: TLabel;
    bcloseline: TBitBtn;
    EFindline: TEdit;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    LAccount: TMemo;
    Panel6: TPanel;
    bClear: TBitBtn;
    bOpenitem: TButton;
    bCloseDiv: TBitBtn;
    cbAutomatic: TCheckBox;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DDOCDATE: TcxGridDBColumn;
    cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid1DBTableView1SLINKEDREFERENCE: TcxGridDBColumn;
    cxGrid1DBTableView1WFULLAMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1WOUTSTANDINGAMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1WLINKEDAMOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1UNUSED2: TcxGridDBColumn;
    cxGrid1DBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxTopDBTableView1: TcxGridDBTableView;
    cxTopLevel1: TcxGridLevel;
    cxTop: TcxGrid;
    cxTopDBTableView1DDATE: TcxGridDBColumn;
    cxTopDBTableView1SREFERENCE: TcxGridDBColumn;
    cxTopDBTableView1FAMOUNT: TcxGridDBColumn;
    cxTopDBTableView1FOUTSTANDINGAMOUNT: TcxGridDBColumn;
    cxTopDBTableView1FAMOUNT_1: TcxGridDBColumn;
    cxTopDBTableView1SDESCRIPTION: TcxGridDBColumn;
    cxTopDBTableView1SALIAS: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    procedure BtnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OidbGridFieldChanged(Sender: TObject; Field: TField);
    procedure OidbGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OidbGridUpdateFooter(Sender: TObject);
    procedure OidbGridKeyPress(Sender: TObject; var Key: Char);
    procedure OidbGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OidbGridRowChanged(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQOILinksAfterInsert(DataSet: TDataSet);
    procedure ZQOILINKSPREAfterInsert(DataSet: TDataSet);
    procedure ZQTransActionCalcFields(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bClearClick(Sender: TObject);
    procedure bOpenitemClick(Sender: TObject);
    procedure bCloseDivClick(Sender: TObject);
    procedure OidbGridTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure EFindlineKeyPress(Sender: TObject; var Key: Char);
    procedure Copy1Click(Sender: TObject);
    procedure cxGrid1DBTableView1EditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure ZQOILinksBeforePost(DataSet: TDataSet);
    procedure cxTopDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1CustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    TotalSelected : Double ;
    LookStr : String ;
    NewOutStanding : Real;
    OrgAmount : Double ;
    NewOutStandingID : Integer;
    BBool : Boolean;
    AccCaption : String ;
    FAsLookup: Boolean;
    AccID,BatchCtrlID,BatLineID : Integer ;
    TryAutoLink : Boolean ;
    ExtrLineDescription : String ;
    areference:String;
    addate: TDatetime ;
    Procedure AllocateAmount(Value:real);
    Procedure ShowFooter;
    Procedure CleanupLinks ;
    procedure SetAsLookup(const Value: Boolean);
    procedure UpDateOutStanding(Linkamount:Double;TransactID:Integer);
  public
    TotalTrans,TotalOpen : Double ;
    localparams  : String ;
    property AsLookup : Boolean  read FAsLookup write SetAsLookup;
    function HandelLinkBuild(LinkAMount : Double) : boolean;
    { Public declarations }
  end;
  Function CanRunOpenItem(areference:String;addate: TDatetime;AccID, BatchCtrlID,OITypeID:Integer;LinkAMount:Real;BatLineID:Integer;TryAutoLink : Boolean; ExtrLineDescription:String;AsLookup:Boolean =false):Boolean;

//function   fmOpenItemSelection: TfmOpenItemSelection;
var
  Amt2Allocate :Real;
  OpenItemAllocatedAmount : Double ;
//  BatLinkedID  : Integer;
// is from variable unit
//  ItemLiked : Boolean;


implementation

uses GlobalFunctions, TcVariables, DatabaseAccess,variants,
  OSFGeneralRoutines, NewProgress, UDMTCCoreLink, TcashClasses, Database,
  LedgerRoutines, OpenLink, UDmQuantumGridDefs;

{$R *.DFM}
 {

function fmOpenItemSelection: TfmOpenItemSelection; 
begin
   if not assigned(afmOpenItemSelection) then
   afmOpenItemSelection:= TfmOpenItemSelection.Create(Application);
   result := afmOpenItemSelection ;
end;  }

Function CanRunOpenItem(areference:String;addate: TDatetime;AccID,BatchCtrlID,OITypeID:Integer;LinkAMount:Real;BatLineID:Integer;TryAutoLink : Boolean ; ExtrLineDescription:String;AsLookup:Boolean =false):Boolean;
Var

  afmOpenItemSelection: TfmOpenItemSelection;


begin
  OpenItemAllocatedAmount := 0 ;
  Result :=False;

  // new empty line exit..
  if AccID = 0 then exit ;
  if not TDataBaseRoutines.IsOpenAccount(AccID) then exit ;
  // todo : Pieter check if the link doen not go to the wrong item as the Batch is moved to the next line on use of enter
  // This wil make the wrong line link.
  // I Sugest we do it on something like field exit and maby have a popup menu in the batch so you can recall the open item link screen.
  afmOpenItemSelection:= TfmOpenItemSelection.create(nil);
  try

  afmOpenItemSelection.AsLookup := AsLookup ;
  afmOpenItemSelection.AccID:= AccID ;
  afmOpenItemSelection.BatchCtrlID:= BatchCtrlID ;
  afmOpenItemSelection.BatLineID:= BatLineID ;
  afmOpenItemSelection.addate := addate ;
  afmOpenItemSelection.OrgAmount := LinkAMount ;
   afmOpenItemSelection.areference := areference ;
  afmOpenItemSelection.ExtrLineDescription:= ExtrLineDescription ;
  afmOpenItemSelection.TryAutoLink:= TryAutoLink ;
  afmOpenItemSelection.ZQLinkeddetail.Close ;
  afmOpenItemSelection.ZQLinkeddetail.ParamByName('WLINEID').AsInteger:= BatLineID ;
  afmOpenItemSelection.ZQLinkeddetail.ParamByName('WBATCHID').AsInteger:= BatchCtrlID ;

  afmOpenItemSelection.ZQLinkeddetail.open ;




  ItemLiked:=False;

  if (not AsLookup) and (LinkAMount=0) then exit;
  {This must be stoped before calling this function}





//  if OITypeID=1 then
  {This Should be Based on the Amount To let user to link Both Sides}
  result := afmOpenItemSelection.HandelLinkBuild(LinkAMount);

  finally
  freeandnil(afmOpenItemSelection);
  end;
end;


function TfmOpenItemSelection.HandelLinkBuild(LinkAMount : Double) : boolean;
var
  AProgress : TfmNewProgress ;
    FoundLines : Integer ;
   Aparams : String ;
   ThisLineHasLinks : Boolean ;
begin
 result := False ;

 { INSERT INTO OILINKS (WOILINKSID, DDOCDATE, SREFERENCE, SLINKEDREFERENCE, WFULLAMOUNT, WOUTSTANDINGAMOUNT, WLINKEDAMOUNT, DDATE, UNUSED1, WAMOUNTTRANSACTIONID, WLINKTRANSACTIONID,
 WUSERID, UNUSED2, WBATCHID, WACCOUNTID, WTAXID, DSYSDATE)
  select gen_id(GEN_OILINKS_ID,1), a.ddate,a.SREFERENCE,'<@LINKREF@>',a.FAMOUNT,

 a.FOUTSTANDINGAMOUNT +coalesce( sum(b.FAMOUNT),0) a, <@LINKAMT@> d,  <@DDATE@>  , -1 e, a.WTRANSACTIONID,
<@WLINEID@>,<@USERID@>,0, <@BATCHID@>, a.WACCOUNTID, a.WTAXID,current_timestamp

      from transact a left join OILINKSPRE b on a.WTRANSACTIONID = b.WTRANSACTIONID where  a.Waccountid = <@ACCOUNTID@> and  a.FoutStandingAmount <@DIRECTION@>

 group by    a.ddate,a.SREFERENCE, a.FAMOUNT,
 a.WACCOUNTID, a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT , a.WTRANSACTIONID ,a.WACCOUNTID, a.WTAXACCOUNTID,a.FOUTSTANDINGAMOUNT
       order by a.ddate asc




 }


        { ZQOILinksDDate.Value:=  addate ;
        ZQOILinksDDocDate.Value := ZQTransaction.fieldByName('DDate').Value ;
        ZQOILinksUnUsed1.Value :=-1;
        ZQOILinksWUserID.Value := CurrentUser;
        ZQOILinksWLinkedAmount.Value:= Amt2Allocate;
        ZQOILinksSReference.value := ZQTransaction.fieldByName('SReference').Value;
        ZQOILinksSLinkedReference.value := areference ;
        ZQOILinksWBatchID.value := BatchCtrlID;
        ZQOILinksWTaxID.value := ZQTransaction.fieldByName('WTaxAccountID').AsInteger;
        ZQOILinksWLinkTransactionID.Value := BatLineID;  }


  Aparams := 'WACCOUNTID=' + IntToStr(AccID);
  Aparams :=  Aparams + #13 + #10 + 'LINKREF=' + QuotedStr(areference) ;

  Aparams :=  Aparams + #13 + #10 + 'DDATE=' +TDatabaseTableRoutines.GetFirebirdsSqlForDate(addate);
  Aparams :=  Aparams + #13 + #10 + 'WLINEID=' + IntToStr(BatLineID);
  Aparams :=  Aparams + #13 + #10 + 'USERID='  + IntToStr(CurrentUser);
  Aparams :=  Aparams + #13 + #10 + 'BATCHID=' + IntToStr(BatchCtrlID);





  if AsLookup then
    begin
    Aparams := Aparams +#13+#10 + 'DIRECTION=<> 0';
     // all sides

     ZQTransAction.SQL.Text := 'select a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT, a.FOUTSTANDINGAMOUNT ORGOUTSTAND , sum(b.FAMOUNT) AMTPRE '+
     ' from transact a left join OILINKSPRE b on a.WTRANSACTIONID = b.WTRANSACTIONID where a.WAccountId = :WAccountId and a.FoutStandingAmount <> 0 '+
     ' group by a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT, a.FOUTSTANDINGAMOUNT order by a.ddate asc ' ;

     ZQTransAction.ParamByName('WaccountID').AsInteger := AccID ;
  //   ZQTransAction.Open ;

    end else
  if LinkAMount<0 then
  begin
     Aparams := Aparams +#13+#10 + 'DIRECTION=> 0';
    // Debit Side
    ZQTransAction.SQL.Text :=  'select a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT, a.FOUTSTANDINGAMOUNT ORGOUTSTAND , sum(b.FAMOUNT) AMTPRE '+
     ' from transact a left join OILINKSPRE b on a.WTRANSACTIONID = b.WTRANSACTIONID where a.WAccountId = :WAccountId and a.FoutStandingAmount > 0 '+
     ' group by a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT, a.FOUTSTANDINGAMOUNT order by a.ddate asc ' ;
    ZQTransAction.ParamByName('WaccountID').AsInteger := AccID ;
 //   ZQTransAction.Open ;
    //Amt2Allocate := FixAmount(LinkAMount);
  end
  else
  begin
    // Credit Side
    Aparams := Aparams +#13+#10 + 'DIRECTION=< 0';
    ZQTransAction.SQL.Text :=  'select a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT, a.FOUTSTANDINGAMOUNT ORGOUTSTAND , sum(b.FAMOUNT) AMTPRE '+
     ' from transact a left join OILINKSPRE b on a.WTRANSACTIONID = b.WTRANSACTIONID where a.WAccountId = :WAccountId and a.FoutStandingAmount < 0 '+
     ' group by a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT, a.FOUTSTANDINGAMOUNT order by a.ddate asc ' ;
    ZQTransAction.ParamByName('WaccountID').AsInteger := AccID ;
   // ZQTransAction.Open ;
    {the amount now got the sign so this ligne is moved out of the if clause}
  end;


  ZQLinkeddetail.first ;
  while not ZQLinkeddetail.Eof do
     begin
       LinkAMount := LinkAMount + ZQLinkeddetailFAMOUNT_1.AsFloat ;
       ZQLinkeddetail.Next ;
     end;


  Amt2Allocate := -(FixAmount(LinkAMount));

  Aparams :=  Aparams + #13 + #10 + 'LINKAMT=' + TDatabaseTableRoutines.GetFirebirdsSqlForFloat(Amt2Allocate) ;

  localparams := Aparams ;

 AProgress := TfmNewProgress.create(nil) ;
       try
   AProgress.initProgress('Loading...',2);
   AProgress.SetProgress('',1);
   CleanupLinks ;
 // DMTCCoreLink.ExecSql('delete from   OILINKS where OILINKS.UNUSED2 = 1 and Waccountid = ' + IntToStr( AccID)) ;
  DMTCCoreLink.ExecSql(TDatabaseTableRoutines.ReplaceParams('INSERT INTO OILINKS (WOILINKSID, DDOCDATE, SREFERENCE, SLINKEDREFERENCE, WFULLAMOUNT, '+
  'WOUTSTANDINGAMOUNT, WLINKEDAMOUNT, DDATE, UNUSED1, WAMOUNTTRANSACTIONID, WLINKTRANSACTIONID,  WUSERID, UNUSED2, WBATCHID, WACCOUNTID, WTAXID, DSYSDATE) ' +
  '  select '+DMTCCoreLink.GetGenUniSyntaxShort('GEN_OILINKS_ID') +' , a.ddate,a.SREFERENCE,<@LINKREF@>,a.FAMOUNT,  a.FOUTSTANDINGAMOUNT -coalesce( sum(b.FAMOUNT),0) a, <@LINKAMT@> d,  <@DDATE@> ' +
  ' , -1 e, a.WTRANSACTIONID, <@WLINEID@>,<@USERID@>,0, <@BATCHID@>, a.WACCOUNTID, a.WTAXACCOUNTID,current_timestamp '+
  '  from transact a left join OILINKSPRE b on a.WTRANSACTIONID = b.WTRANSACTIONID where  a.Waccountid = <@WACCOUNTID@> and  a.FoutStandingAmount <@DIRECTION@> '+
  '  group by    a.ddate,a.SREFERENCE, a.FAMOUNT,  a.WACCOUNTID, a.WTRANSACTIONID,a.ddate,a.SREFERENCE,a.WTAXACCOUNTID,a.FAMOUNT , a.WTRANSACTIONID ' +
  ' ,a.WACCOUNTID, a.WTAXACCOUNTID,a.FOUTSTANDINGAMOUNT   order by a.ddate asc ' ,Aparams,nil,false));


   DMTCCoreLink.ExecSql(TDatabaseTableRoutines.ReplaceParams('delete from   OILINKS where OILINKS.UNUSED1 = -1 and Waccountid = '+
   ' <@WACCOUNTID@> and WOUTSTANDINGAMOUNT = 0 ' ,Aparams,nil,false));

  AProgress.SetProgress('',2);

  ZQOILinks.SQL.Text := DMTCCoreLink.SQLList.GetFormatedSQLByName('database_OILinksOnAccountAndAmount');
  ZQOILinks.ParamByName('WAccountID').AsInteger :=   AccID ;
  ZQOILinks.open ;
  ZQOILinks.IndexFieldNames := 'DDocDate;sReference' ;

  ZQOILinks.Filtered:=False;
  ZQOILinks.Filter:='(UnUsed1=-1 or UnUsed1=0) AND WOutStandingAmount<>0 ';
  ZQOILinks.Filtered:=True;

  finally
    AProgress.free ;
  end;

  ThisLineHasLinks := DMTCCoreLink.OpenSqlReturnFirstColumn('select count(*) from OILINKSPRE where WBATCHID = ' + IntToStr(BatchCtrlID) + ' and WLINEID = ' + IntToStr(BatLineID))  > 0  ;


  if (ZQOILinks.RecordCount>0) or (ThisLineHasLinks) then
  begin
    Result:=True;
    AccCaption :=  GetAccountCodeAndDescription(AccID) ;
    if ExtrLineDescription <> '' then
       begin
        AccCaption :=  AccCaption + #13+#10+ ExtrLineDescription ;
       end;
LAccount.Lines.Text := AccCaption ;
   // end;
   // Add unlinked Amount

  ZQOILinks.DisableControls ;
  try

if result then
    if TryAutoLink then
    begin
       result := false ;
       ZQOILinks.first ;
       FoundLines  :=0 ;
       while not ZQOILinks.eof do
        begin

           if (Trunc(ZQOILinksWOUTSTANDINGAMOUNT.AsFloat *100) = Trunc(Amt2Allocate * 100))  then
              begin
              inc(FoundLines) ;
               // result := true ;
               // break ;
              end;
          ZQOILinks.next ;
        end;
       if  FoundLines = 1 then
       begin
       ZQOILinks.first ;
       while not ZQOILinks.eof do
        begin
           if (Trunc(ZQOILinksWOUTSTANDINGAMOUNT.AsFloat *100) = Trunc(Amt2Allocate * 100))  then
              begin
               result := true ;
               break ;
              end;
          ZQOILinks.next ;
        end;
      end;
      if result then
          begin
             ZQOILinks.EnableControls ;
             AllocateAmount(Amt2Allocate);
          end else
          begin
          CleanupLinks ;
          ZQOILinks.EnableControls ;
          end;
    end else
    begin
       ZQOILinks.first ;
       while not ZQOILinks.eof do
        begin
           if (Trunc(ZQOILinksWOUTSTANDINGAMOUNT.AsFloat *100) = Trunc(Amt2Allocate * 100))  then
            break ;
          ZQOILinks.Next ;
        end;
        if (Trunc(ZQOILinksWOUTSTANDINGAMOUNT.AsFloat *100) <> Trunc(Amt2Allocate * 100))  then
           ZQOILinks.First ;

        ZQOILinks.EnableControls ;
       if not self.Visible then
        ShowModal;
    end;
     finally
    ZQOILinks.EnableControls ;
  end; 
  end
  else
    begin
    Result:=False;

    end;

  //ZQTransaction.Close;

end;

Procedure TfmOpenItemSelection.UpDateOutStanding(Linkamount:Double;TransactID:Integer);

begin
 ZQOILINKSPRE.close ;
 ZQOILINKSPRE.params[0].AsInteger :=  TransactID ;
 ZQOILINKSPRE.params[1].AsInteger :=   BatchCtrlID ;
 ZQOILINKSPRE.params[2].AsInteger :=  BatLineID ;
 ZQOILINKSPRE.open ;
 if ZQOILINKSPRE.IsEmpty then
 begin
 ZQOILINKSPRE.Insert ;
 ZQOILINKSPREFAMOUNT.AsFloat := Linkamount ;
 ZQOILINKSPREWTRANSACTIONID.AsInteger := TransactID ;
 ZQOILINKSPRE.Post ;
 end else
 begin
 ZQOILINKSPRE.edit ;
 ZQOILINKSPREFAMOUNT.AsFloat := ZQOILINKSPREFAMOUNT.AsFloat + Linkamount ;
 ZQOILINKSPRE.Post ;
 end;
end;

Procedure TfmOpenItemSelection.ShowFooter;
var

 sqlResult : Variant ;
Begin
 TotalSelected := 0 ;
     cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0] := FormatFloat('0.00',Amt2Allocate);
     {  OidbGrid.Columns[4].FooterValue := FormatFloat('0.00',TotalTrans);
       OidbGrid.Columns[5].FooterValue := FormatFloat('0.00',TotalOpen);
       OidbGrid.Columns[6].FooterValue := FormatFloat('0.00',Amt2Allocate); }


  if FAsLookup then
  begin
  sqlResult :=   TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('select sum(WOUTSTANDINGAMOUNT) from OILINKS where UNUSED2 = 1  and WAccountId = ' + IntToStr(AccID)) ;
  if VarToStr(sqlResult) <> '' then
    TotalSelected := sqlResult ;
    cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0] := FormatFloat('0.00',TotalSelected) + ' / ' + FormatFloat('0.00',Amt2Allocate) ;
 end;
end;

procedure TfmOpenItemSelection.BtnCancelClick(Sender: TObject);
begin
  Close;
end;



procedure TfmOpenItemSelection.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  Case Key of
  #27:BtnCancelClick(Sender);
  end;
end;

procedure TfmOpenItemSelection.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
CleanupLinks ;
end;

Procedure TfmOpenItemSelection.AllocateAmount(Value:real);
Var
  TempValue: Real;

begin
if not FAsLookup then
 if ZQOILinks.ControlsDisabled then exit ;

   ZQOILinks.DisableControls ;
   try
  TempValue :=  Value ;
    // i think its not open sometimes ??
  if Value <>0 then
  begin
    ItemLiked:=True;
    if ZQOILinksUnUsed1.Value=-1 then
    begin
      TempValue:=Value;
      ZQOILinks.Edit;
      if Amt2Allocate > 0 then
      begin
      if Value > Amt2Allocate then
        TempValue:=Amt2Allocate;
      end else
      begin
      if Value < Amt2Allocate then
        TempValue:=Amt2Allocate;

      end ;

      if Abs(ZQOILinksWOutStandingAmount.Value) < Abs(TempValue) then
        TempValue := ZQOILinksWOutStandingAmount.Value;

        ZQOILinksWlinkedAmount.Value := TempValue;
        if  abs(ZQOILinksWlinkedAmount.Value) = abs(ZQOILinksWOutStandingAmount.Value) then
        ZQOILinksUnUsed1.Value := -2;

      TotalTrans := TotalTrans - ZQOILinksWFULLAMOUNT.AsFloat ;
      TotalOpen := TotalOpen - TempValue ;

      NewOutStanding := ZQOILinksWOutStandingAmount.Value - TempValue;
      NewOutStandingID := ZQOILinksWAmountTransactionID.Value;
      Amt2Allocate := Amt2Allocate-ZQOILinksWLinkedAmount.Value;
      //
      ZQOILinksWOutStandingAmount.Value := NewOutStanding;
      ZQOILinks.Post;
      ItemLiked:=True;
    end
    else
    Begin
      // Test
      NewOutStanding := ZQOILinksWOutStandingAmount.Value;
    end;
    // Updating Transaction OutStandingAmount.
    UpDateOutStanding(TempValue,NewOutStandingID);
  end;

  if FAsLookup then
     exit ;

  if Amt2Allocate<>0 then
  begin
    ItemLiked:=True;
    ZQOILinks.DisableControls;
    try
    ZQOILinks.First;
    while not ZQOILinks.eof do
    begin
      if ZQOILinksUnUsed1.Value=-1 then
      begin
        ZQOILinks.Edit;
        ZQOILinksWlinkedAmount.Value := Amt2Allocate;
        ZQOILinks.Post;
      end;
      ZQOILinks.Next;
    end;
    ZQOILinks.First;
    while not ZQOILinks.eof do
    begin
      if (Trunc(ZQOILinksWOUTSTANDINGAMOUNT.AsFloat *100) = Trunc(Amt2Allocate * 100)) then
        break;
      ZQOILinks.Next;
    end;
    if  (Trunc(ZQOILinksWOUTSTANDINGAMOUNT.AsFloat *100) <> Trunc(Amt2Allocate * 100))  then
       ZQOILinks.first ;


    finally
       ZQOILinks.EnableControls ;
    end;
  end;
  ShowFooter;
  if  (FixAmount(Amt2Allocate)=0) then
     begin
     CleanupLinks ;
     Close;
     end;
  finally
    ZQOILinks.EnableControls ;
    ZQLinkeddetail.Close ;
    ZQLinkeddetail.open ;
  end;
end;
 

procedure TfmOpenItemSelection.OidbGridFieldChanged(Sender: TObject;
  Field: TField);
begin
  if Field.FullName='UNUSED2' then
    begin
       if (ZQOILinks.State in [dsEdit,dsInsert]) then
         ZQOILinks.post ;
    end;
  if Field.FullName='WLINKEDAMOUNT' then
  if not ZQOILinks.ControlsDisabled then
  begin
    BBool:=False;
    AllocateAmount(Field.AsFloat);
    Abort ;
  end;
end;

procedure TfmOpenItemSelection.OidbGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key of
  27 : BtnCancelClick(Sender);
  13 : Begin
         try
          OidbGridDblClick(self);
         except
         end;

       end;
  end;
end;

procedure TfmOpenItemSelection.OidbGridUpdateFooter(Sender: TObject);
begin
  ShowFooter;
end;

procedure TfmOpenItemSelection.OidbGridKeyPress(Sender: TObject;
  var Key: Char);
begin
 if key = '.' then key := DecimalSeparator ;

 if key = #8 then
   delete(LookStr,length(LookStr),1)
   else
 LookStr := LookStr + Key ;
 lopenlines.Caption := GetTextLang(1979) + ' ' + LookStr ;
 if Trim(LookStr) <> '' then
  begin
    if ZQOILinks.IndexFieldNames = '' then
    ZQOILinks.IndexFieldNames := 'SREFERENCE' ;
    ZQOILinks.Locate(ZQOILinks.IndexFieldNames,LookStr,[loCaseInsensitive,loPartialKey]) ;
  end;



end;

procedure TfmOpenItemSelection.OidbGridDblClick(Sender: TObject);
begin
if ZQOILinks.IsEmpty then exit ;

     // let dobl click be te same as enter for mouse oriented people.
if FAsLookup then exit ;

         BBool := True;
         if ZQOILinks.State <> dsEdit then
         ZQOILinks.Edit;
         ZQOILinks.Post;

         if (not FAsLookup) and BBool then
           AllocateAmount(ZQOILinksWLINKEDAMOUNT.AsFloat);
end;

procedure TfmOpenItemSelection.FormShow(Sender: TObject);
begin
 TDatabaseRegistyRoutines.ReadFormPos(self,'');

 Panel2.Height := StrToIntDef(TDatabaseRegistyRoutines.ReadRegValue('openitem','Panel2heigth'),Panel2.Height);
 if Panel2.Height < 10 then Panel2.Height := 10 ;
 Panel1.Height := StrToIntDef(TDatabaseRegistyRoutines.ReadRegValue('openitem','Panel1heigth'),Panel1.Height);
 if Panel1.Height < 10 then Panel1.Height := 10 ;

 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Close');
 DMTCCoreLink.LoadImage(btnOk.Glyph,'Ok');
  ShowFooter;
  cxTopDBTableView1.Columns[0].Caption := gettextlang(238);
  cxTopDBTableView1.Columns[1].Caption := gettextlang(607);
  cxTopDBTableView1.Columns[2].Caption := gettextlang(178);
  cxTopDBTableView1.Columns[3].Caption := gettextlang(1272);
  cxTopDBTableView1.Columns[4].Caption := gettextlang(947);
  cxTopDBTableView1.Columns[5].Caption := gettextlang(946);
  cxTopDBTableView1.Columns[6].Caption := gettextlang(1975);
   llinkedlines.Caption := GetTextLang(472);
   lopenlines.Caption := GetTextLang(1979);
   cbAutomatic.Checked := DMTCCoreLink.ReadNwReportOp('OPENITEMTAUTO',False) ;
   cxGrid1.SetFocus;
   bCloseDiv.Caption := GetTextLang(3473);
   bcloseline.Caption := GetTextLang(3472);
   cbAutomatic.Caption :=   GetTextLang(3474);
   cxGrid1DBTableView1.Columns[0].Caption := gettextlang(238);
   cxGrid1DBTableView1.Columns[1].Caption := gettextlang(607);
   cxGrid1DBTableView1.Columns[2].Caption := gettextlang(1975);
   cxGrid1DBTableView1.Columns[3].Caption := gettextlang(178);
   cxGrid1DBTableView1.Columns[4].Caption := gettextlang(946);
   cxGrid1DBTableView1.Columns[5].Caption := gettextlang(947);
   cxGrid1DBTableView1.Columns[6].Caption := gettextlang(1272);
   BtnCancel.Caption := gettextlang(828);
   bOpenitem.Caption := GetTextLang(360);
   bClear.Caption := GetTextLang(1016);
   Caption := gettextlang(2034) ;
   LAccount.Font.Size :=  10 ;
   try
   cxgrid1.Setfocus ;
   except

   end;
end;

procedure TfmOpenItemSelection.OidbGridRowChanged(Sender: TObject);
var
 Docid : Integer ;
begin
 MDocinfo.Lines.Text := '' ;
 Docid := TdataBaseDocumentRoutines.GetDocIdFromTransactId(ZQOILinksWAMOUNTTRANSACTIONID.AsInteger);
 IF Docid = 0 then
 Docid := TdataBaseDocumentRoutines.GetDocIdFromTransactId(ZQOILinksWLINKTRANSACTIONID.AsInteger);
 IF Docid > 0 then
    begin
       MDocinfo.Lines.Text := VarToSTR(TDataBaseRoutines.OpenSqlAndGetFirtsColumnValue('Select trim(d.SReference) || ' + QuotedStr(' ') +  ' ||  trim(g.SDescription) from dochead d left join groups g on d.WREPORTINGGROUP1ID = g.WGROUPID where wdocid = ' + IntToStr(Docid)));
    end;
end;

procedure TfmOpenItemSelection.CleanupLinks;
var
  AProgress : TfmNewProgress ;
begin
AProgress := TfmNewProgress.create(nil) ;
try
 AProgress.initProgress('Processing...',2);
 ZQOILinks.close ;
 AProgress.SetProgress('',1);
 DMTCCoreLink.ExecSql('delete from   OILINKS where OILINKS.UNUSED1 = -1 and Waccountid = ' + IntToStr( AccID)) ;
 AProgress.SetProgress('',2);
 finally
      AProgress.free ;
   end;

end;
procedure TfmOpenItemSelection.SetAsLookup(const Value: Boolean);
begin
   FAsLookup := Value;
   if not FAsLookup then
    begin
      cxGrid1DBTableView1UNUSED2.VisibleForCustomization := False ;
      cxGrid1DBTableView1UNUSED2.Visible := False ;
    end else
    begin
    btnOk.Visible := true ;
      cxGrid1DBTableView1WLINKEDAMOUNT.VisibleForCustomization := False ;
      cxGrid1DBTableView1WLINKEDAMOUNT.Visible := False ;
      Panel1.Visible := False ;
      cxSplitter1.Visible := False ;
     end;

end;

procedure TfmOpenItemSelection.btnOkClick(Sender: TObject);
begin
 if ZQOILinks.IsEmpty then exit ;
 // checked items

 ZQOILinks.DisableControls ;
 ZQOILinks.Filter := '' ;
 try
 ZQOILinks.First ;
 while not ZQOILinks.eof do
    begin
       if ZQOILinksUNUSED2.AsInteger = 1 then
        begin
          OpenItemAllocatedAmount := OpenItemAllocatedAmount + ZQOILinksWOUTSTANDINGAMOUNT.AsFloat ;
          ZQOILinks.edit ;
          ZQOILinksUnUsed1.Value:=-1  ;
          ZQOILinks.Post ;

        end;
       ZQOILinks.next ;
    end;
   
 ZQOILinks.First ;
 Amt2Allocate := OpenItemAllocatedAmount ;
 while not ZQOILinks.eof do
    begin
       if ZQOILinksUNUSED2.AsInteger = 1 then
        begin
         // OpenItemAllocatedAmount := OpenItemAllocatedAmount + ZQOILinksWOUTSTANDINGAMOUNT.AsFloat ;


           AllocateAmount(ZQOILinksWLINKEDAMOUNT.AsFloat);
        end;
       ZQOILinks.next ;
    end;
   ItemLiked:=True;

 finally
   ZQOILinks.EnableControls ;
 end;
 close ;
end;

procedure TfmOpenItemSelection.FormCreate(Sender: TObject);
begin
self.Top := 0 ;
self.Left := 0 ;
DMTCCoreLink.AssignConnectionToChilds(self);
ZQOILinksWFULLAMOUNT.DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;
ZQOILinksWOUTSTANDINGAMOUNT.DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;
ZQOILinksWLINKEDAMOUNT.DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;

ZQLinkeddetailFAMOUNT.DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;
ZQLinkeddetailFAMOUNT_1.DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;
ZQLinkeddetailFOUTSTANDINGAMOUNT.DisplayFormat := dmDatabase.SetOfBooksPropertys.DataParameter.CurrencyMask ;
end;

procedure TfmOpenItemSelection.ZQOILinksAfterInsert(DataSet: TDataSet);
begin
   dataset.FieldByName('WOILINKSID').AsInteger :=  DMTCCoreLink.GetNewId(tcidNEWOILINKS);
end;

procedure TfmOpenItemSelection.ZQOILINKSPREAfterInsert(DataSet: TDataSet);
begin
 ZQOILINKSPREWBATCHID.AsInteger := BatchCtrlID ;
 ZQOILINKSPREWLINEID.AsInteger := BatLineID ;
 ZQOILINKSPREWBATCHTYPEID.AsInteger := TDataBaseRoutines.GetBatchIdFromPRocessId( BatchCtrlID );
end;

procedure TfmOpenItemSelection.ZQTransActionCalcFields(DataSet: TDataSet);
begin
  ZQTransActionFOUTSTANDINGAMOUNT.AsFloat := ZQTransActionORGOUTSTAND.AsFloat - ZQTransActionAMTPRE.AsFloat ;
end;

procedure TfmOpenItemSelection.DBGrid1DblClick(Sender: TObject);
begin
  if  not ZQLinkeddetail.IsEmpty then
    begin
        ZQLinkeddetail.Delete ;
        CleanupLinks ;
        HandelLinkBuild(OrgAmount);
        ShowFooter ;
    end;
end;

procedure TfmOpenItemSelection.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 TDatabaseRegistyRoutines.WriteFormPos(self,'');
 TDatabaseRegistyRoutines.WriteRegValue('openitem','Panel2heigth',IntToStr(Panel2.Height));
 TDatabaseRegistyRoutines.WriteRegValue('openitem','Panel1heigth',IntToStr(Panel1.Height));
 if  not ZQLinkeddetail.IsEmpty then
      ItemLiked := True ;
    DMTCCoreLink.WriteNwReportOp('OPENITEMTAUTO',BoolToStr(cbAutomatic.Checked,True)) ;
end;

procedure TfmOpenItemSelection.bClearClick(Sender: TObject);
begin
 LedgerRoutines.UnlinkLine(BatLineID,BatchCtrlID) ;
 ZQLinkeddetail.close ;
 ZQLinkeddetail.open ;
 CleanupLinks ;
 HandelLinkBuild(OrgAmount);
 ShowFooter ;
end;

procedure TfmOpenItemSelection.bOpenitemClick(Sender: TObject);
begin
 fmOpenLink := TfmOpenLink.Create(self);
  try
   fmOpenLink.bFrombatch := True ;
   fmOpenLink.GotoAccount := AccID  ;
   fmOpenLink.ShowModal ;

  finally
   fmOpenLink.free ;
  end;
 ZQLinkeddetail.close ;
 ZQLinkeddetail.open ;
 CleanupLinks ;
 HandelLinkBuild(OrgAmount);
 ShowFooter ;
end;

procedure TfmOpenItemSelection.bCloseDivClick(Sender: TObject);
var
 AaMount : Double ;
 Atrn : Integer ;
begin
 if Sender = bcloseline then
 begin
   if ZQOILinks.IsEmpty then exit ;
   Atrn :=  ZQOILinksWAMOUNTTRANSACTIONID.AsInteger ;
   AaMount :=  ZQOILinksWOUTSTANDINGAMOUNT.AsInteger ;
 end else
 begin
 if ZQLinkeddetail.IsEmpty then exit ;
 if (ZQLinkeddetailFOUTSTANDINGAMOUNT.AsFloat - ZQLinkeddetailFAMOUNT_1.AsFloat)  <> 0 then
    begin
       AaMount := ZQLinkeddetailFOUTSTANDINGAMOUNT.AsFloat - ZQLinkeddetailFAMOUNT_1.AsFloat ;
       Atrn := ZQLinkeddetailWTRANSACTIONID.AsInteger ;
    end else
    if  Amt2Allocate <> 0 then
       AaMount :=  - Amt2Allocate ;
  end;
   if AaMount = 0 then exit ;
fmOpenLink := TfmOpenLink.Create(self);
  try
   fmOpenLink.bFrombatch := True ;
   fmOpenLink.GotoAccount := AccID  ;
   fmOpenLink.LinkOfTrn := Atrn ;
   fmOpenLink.LinkOffAmount := AaMount ;
    fmOpenLink.AutoMaticPost := cbAutomatic.Checked ;
    if Sender <> bcloseline then
     begin

      fmOpenLink.Saveprefix := 'PDIS_';
     end else
     begin
       fmOpenLink.Saveprefix := 'PDIV_';
     end;
   fmOpenLink.Show ;
  finally
   fmOpenLink.free ;
  end;
 ZQLinkeddetail.close ;
 ZQLinkeddetail.open ;
 CleanupLinks ;
 HandelLinkBuild(OrgAmount);
 ShowFooter ;
end;

procedure TfmOpenItemSelection.OidbGridTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
 if  ZQOILinks.IndexFieldNames <> AFieldName then
 ZQOILinks.IndexFieldNames := AFieldName
   else
   ZQOILinks.IndexFieldNames := AFieldName + ' desc'  ;

end;

procedure TfmOpenItemSelection.EFindlineKeyPress(Sender: TObject;
  var Key: Char);
  var
    i : Integer ;
begin

 if key = #13 then
    begin
      ZQOILinks.First ;
      while not ZQOILinks.Eof do
         begin
            for i := 0 to ZQOILinks.FieldCount -1 do
              begin
               if pos(UpperCase(EFindline.Text),UpperCase(ZQOILinks.Fields[i].DisplayText)) > 0 then
                   exit ;
              end;
            ZQOILinks.next ;
         end;
    end;
end;

procedure TfmOpenItemSelection.Copy1Click(Sender: TObject);
var
  i : Integer ;
begin
 LAccount.CopyToClipboard ;
 EFindline.PasteFromClipboard ;

 ZQOILinks.First ;
 if trim(EFindline.Text) = '' then exit ;

      while not ZQOILinks.Eof do
         begin
            for i := 0 to ZQOILinks.FieldCount -1 do
              begin
               if pos(UpperCase(EFindline.Text),UpperCase(ZQOILinks.Fields[i].DisplayText)) > 0 then
                   exit ;
              end;
            ZQOILinks.next ;
         end;

end;
 procedure TfmOpenItemSelection.cxGrid1DBTableView1CustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  var
   i : Integer ;
   Total : Double ;

begin
 if cxGrid1DBTableView1UNUSED2.Visible then
 begin

 Total := 0 ;

   for i := 0 to  AViewInfo.Column.GridView.ViewData.RowCount -1 do
       begin
         if vartoStr(AViewInfo.Column.GridView.ViewData.Rows[i].Values[cxGrid1DBTableView1UNUSED2.Index]) ='1' then
            Total := Total + AViewInfo.Column.GridView.ViewData.Rows[i].Values[cxGrid1DBTableView1WOUTSTANDINGAMOUNT.Index] ;
       end;
    cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[3] := Total ;
 end;
end;

procedure TfmOpenItemSelection.cxGrid1DBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
if key = vk_return then
   OidbGridDblClick(self)
end;

procedure TfmOpenItemSelection.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13  then
    OidbGridDblClick(self);
end;

procedure TfmOpenItemSelection.ZQOILinksBeforePost(DataSet: TDataSet);
begin
 if ZQOILinksWOUTSTANDINGAMOUNT.AsFloat >0 then
    ZQOILinksWLINKEDAMOUNT.AsFloat :=  abs(ZQOILinksWLINKEDAMOUNT.AsFloat) else
    ZQOILinksWLINKEDAMOUNT.AsFloat := -abs(ZQOILinksWLINKEDAMOUNT.AsFloat);

end;

procedure TfmOpenItemSelection.cxTopDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if not (AViewInfo.Selected  ) then
   ACanvas.Brush.Color:=clinfoBk;
 
end;

end.




