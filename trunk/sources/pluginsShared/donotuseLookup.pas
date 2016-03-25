unit Lookup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DB, ComCtrls, ExtCtrls, Menus,
  ZAbstractDataset, DBAccess , Uni, ZAbstractRODataset,UConnectionClass,TcashClasses,UGenSearch,
  MemDS;
const
  SelectAccountSql = 'Select SACCOUNTCODE,SDescription,WAccountTypeID,WAccountID from account ' +
                     'where Binactive = 0 ' ;
  SelectGroupSql = 'Select SACCOUNTCODE,SDescription,WAccountTypeID,WAccountID from account ' +
                     'where Binactive = 0 ' ;
type
  TTCReturnLookupType = (tcrtSelect,tcrtNew,tcrtClose,tcrtEscape,tcrtBack);
  TTCLookupType = (tcltAccount,tcltStock,tcltPeriods,tcltContacts,tcltAccountGroup);
  TTCSelectType = (tcstALL,tcstGLTHREE,tcstGLANDTAX,tcstGLONE,tcstDEB,tcstCRED,
                   tcstBANK,tcstNTAX,tcstTAX,tcstBATCH,tcstTHISYEAR,tcstLASTYEAR,tcstALLYEAR,
                   tcstAccountRepGroup1,tcstAccountRepGroup2,tcstDebtorRepGroup1,tcstDebtorRepGroup2,
                   tcstCreditorRepGroup1,tcstCreditorRepGroup2,tcstStockRepGroup1,tcstStockRepGroup2,
                   tcstDocumentRepGroup1,tcstDocumentRepGroup2 );
  TFmLookup = class(TForm)
    DBGrdLookup: TDBGrid;
    StatusBar: TStatusBar;
    Shape1: TShape;
    cbCode: TCheckBox;
    cbDescription: TCheckBox;
    cbBarCode: TCheckBox;
    Label1: TLabel;
    Bevel1: TBevel;
    PopupMenu1: TPopupMenu;
    Usefilter1: TMenuItem;
    tblAccount: TuniQuery;
    TblStock: TuniQuery;
    tblContacts: TuniQuery;
    TblPeriods: TuniQuery;
    DSGeneral: TDataSource;
    tblSysVars: TuniQuery;
    LSearch: TLabel;
    ZQTblGroup: TuniQuery;
    procedure DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrdLookupTitleClick(Column: TColumn);
    procedure DBGrdLookupDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrdLookupDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rbBarCodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbCodeClick(Sender: TObject);
    procedure Usefilter1Click(Sender: TObject);
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
    Lookuptype : TTCLookupType ;
    search,Look,Look2:String;
    First,Account,BBarCode,CanCreateAccount:Boolean;
    SSelect : TTCSelectType ;
    ReturnLookupType : TTCReturnLookupType ;
    ReturnID : integer ;
    ReturnLookup,ReturnLookupDesc : String ;
    SavePrefix : String ;
    procedure SelectLookup(Sender: TObject ;Title : String ;Select  : TTCSelectType; Tabletype : TTCLookupType ; ID:Integer;Order : integer = 0);
    procedure SetSortOrder ;
    property IsShowForm : Boolean  read FIsShowForm write SetIsShowForm;
    property aOSAConnectionItem : TOSAConnectionItem  read FaOSAConnectionItem write SetaOSAConnectionItem;
    property aGlobalDataObject : TGlobalDataObject  read FaGlobalDataObject write SetaGlobalDataObject;
    { Public declarations }

  end;

implementation

uses variants, Math, OSFGeneralRoutines, UDMTCCoreLink;


{$R *.DFM}


Procedure TFmLookup.SetLookupOrder;
Var
  i:Byte;
begin
  if cbDescription.Checked then
    i:=1
  else if  cbBarCode.Checked then
    i:=2
  else i:=0;
  case Lookuptype of
  tcltAccount :  aOSAConnectionItem.WriteNwReportOp('WAccLookUpOrder',IntToStr(i));
  tcltStock   : aOSAConnectionItem.WriteNwReportOp('WStoLookUpOrder',IntToStr(i));
  tcltPeriods  : aOSAConnectionItem.WriteNwReportOp('WPrdLookUpOrder',IntToStr(i));
  tcltContacts : aOSAConnectionItem.WriteNwReportOp('WCntLookUpOrder',IntToStr(i));
  tcltAccountGroup : aOSAConnectionItem.WriteNwReportOp('WCntAccountGroup',IntToStr(i));
  end; // end case
end;

Procedure TFmLookup.GetLookupOrder;
Var
  i:Byte;
begin
  cbBarCode.Caption:=  aGlobalDataObject.CurrentLanguage.GetTextLang(989);{'Auto Select';}

  case Lookuptype of
      tcltAccount : i:=StrToIntDef(aOSAConnectionItem.ReadNwReportOp('WAccLookUpOrder'),0);
      tcltStock : i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp('WStoLookUpOrder'),0);
      tcltPeriods : i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp('WPrdLookUpOrder'),0);
      tcltcontacts :  i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp('WCntLookUpOrder'),0);
      tcltAccountGroup : i:= StrToIntDef(aOSAConnectionItem.ReadNwReportOp('WCntAccountGroup'),0);
  end ;

  if i=1 then
    cbDescription.Checked := True
  else if i=2 then
    cbCodeClick(cbBarCode)
  else
   cbCodeClick(cbCode);
end;

procedure TFmLookup.SelectLookup(Sender: TObject ;Title : String ;Select  : TTCSelectType
; Tabletype : TTCLookupType ; ID:Integer;Order : integer = 0);
var
NoomPeriod:Integer;
begin
if not assigned(aGlobalDataObject) then raise  Exception.Create('Error no globalobject(coders error)');

 // todo : set make sysparam on user
 look := '' ;
 Usefilter1.Checked := UPPERCASE(VarToStr(aOSAConnectionItem.ReadNwReportOp('ULF_'+SavePrefix+intToStr(ord(Tabletype)),BoolToStr(false,true)))) = 'TRUE' ;
 tblAccount.OnFilterRecord := MyOnFilterRecord ;
 tblStock.OnFilterRecord := MyOnFilterRecord ;
 ZQTblGroup.OnFilterRecord := MyOnFilterRecord ;
 tblContacts.OnFilterRecord := MyOnFilterRecord ;
  InProc := False;
// Initialise the Position and Variables for this form.
     Label1.Caption :=  aGlobalDataObject.CurrentLanguage.GetTextLang(944); {Search by}
     cbCode.Caption := aGlobalDataObject.CurrentLanguage.GetTextLang(605);{'Code';}
     cbDescription.Caption := aGlobalDataObject.CurrentLanguage.GetTextLang(178);{'Description';}
     self.Caption:=Title;
     Lookuptype := Tabletype;
  //   self.top := Screen.WorkAreaHeight - self.Height - 27;
  //   self.Left := Screen.WorkAreaLeft + 5;
    TDatabaseRegistyRoutines.ReadFormPos(self,SavePrefix +IntToStr(ord(Select)) +':' +IntToStr(ord(Tabletype)));
     First:= True;
     Look:='';
     Look2:='';
     BBarCode:=False;
     SSelect:=Select;
     Search:='SMAINACCOUNTCODE';
     DBGrdLookup.Columns.Clear;
     ReturnID:=0;
     ReturnLookup:='';
      if Order = 1 then
         cbCode.Checked := true
      else
      if Order = 2 then
         cbDescription.Checked := true
      else
      if Order = 2 then
         cbDescription.Checked := true
      else
      GetLookupOrder;
     // Just when theres no order

      SetSortOrder ;

// Opens and set DBGrid if Accounts must be looked up.
// Filters according to parameter passed

     if Tabletype  = tcltAccount then
     begin
         tblAccount.SQL.Text := SelectAccountSql ;
         DBGrdLookup.Columns.Add;
          DBGrdLookup.Columns.Add;
          DSGeneral.DataSet := tblAccount;
          DBGrdLookup.Columns[0].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(605);{'Code';}
          DBGrdLookup.Columns[0].FieldName := 'SACCOUNTCODE';
          DBGrdLookup.Columns[1].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(178);{'Description';}
          DBGrdLookup.Columns[1].FieldName := 'SDescription';

          if Select = tcstALL then
           begin
             tblAccount.Filtered:=false;
             tblAccount.SQL.add(' and (WAccountID <>0)');
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
             tblAccount.SQL.add( ' and WAccountID <> ' + aOSAConnectionItem.GetSysVar('DebtorsControlID') +
                                   ' and WAccountID <> 0 and WAccountID <> ' + aOSAConnectionItem.GetSysVar('WCreditorsControlID') +
                                   ' and WAccountID <> ' + aOSAConnectionItem.GetSysVar('WRetainedIncomeID'));
             end;
      tblAccount.Open;       
      tblAccount.Locate('WAccountID',ID,[]);
     end;

     if  Tabletype = tcltStock then
     begin
          tblStock.filtered := true ;
          DBGrdLookup.Columns.Add;
          DBGrdLookup.Columns.Add;
          tblStock.Open;
          DSGeneral.DataSet := tblStock ;
          DBGrdLookup.Columns[0].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(605);{'Code';}
          DBGrdLookup.Columns[0].FieldName := 'SSTOCKCODE';
          DBGrdLookup.Columns[1].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(178);{'Description';}
          DBGrdLookup.Columns[1].FieldName := 'SDescription';
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
          tblPeriods.Open;
          tblSysVars.Open;
          DBGrdLookup.Columns.Add;
          DBGrdLookup.Columns.Add;
          DBGrdLookup.Columns.Add;
          DBGrdLookup.Columns.Add;
          DSGeneral.DataSet := tblPeriods ;

          DBGrdLookup.Columns[0].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(600);{'Period';}
          DBGrdLookup.Columns[0].FieldName := 'WPeriodID';
          DBGrdLookup.Columns[1].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(178);{'Description';}
          DBGrdLookup.Columns[1].FieldName := 'SDescription';
          DBGrdLookup.Columns[2].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(987);{'Start';}
          DBGrdLookup.Columns[2].FieldName := 'DStartDate';
          DBGrdLookup.Columns[3].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(988);{'End';}
          DBGrdLookup.Columns[3].FieldName := 'DEndDate';
          tblPeriods.IndexFieldNames := 'WPeriodID' ;
          case Select of
          tcstTHISYEAR :
          begin
               tblPeriods.Filter:='(wyearid = 1 or WYEARID = 2) and WPeriodID >''13'' and WPeriodID <= '''+IntToStr(26)+'''';
               tblPeriods.Filtered:=true;
          end;
          tcstLASTYEAR :
          begin
               tblPeriods.Filter:='(wyearid = 1 or WYEARID = 2) and WPeriodID <= '''+IntToStr(13)+'''';
               tblPeriods.Filtered:=true;
          end;
          tcstALLYEAR :
          begin
               tblPeriods.Filter:='(wyearid = 1 or WYEARID = 2)';
               tblPeriods.Filtered:=true;
          end;
        end ;// end case
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


          ZQTblGroup.filtered := true ;
          DBGrdLookup.Columns.Add;
          DBGrdLookup.Columns.Add;
          ZQTblGroup.Open;
          DSGeneral.DataSet := ZQTblGroup ;
          DBGrdLookup.Columns[0].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(605);{'Code';}
          DBGrdLookup.Columns[0].FieldName := 'WGroupID';
          DBGrdLookup.Columns[1].Title.Caption:=aGlobalDataObject.CurrentLanguage.GetTextLang(178);{'Description';}
          DBGrdLookup.Columns[1].FieldName := 'SDescription';
          ZQTblGroup.Locate('WGroupID',ID,[]);

       end;// end Reportinggroups
   
     // remeber filter so a filer can be applayed when looking for accounts
     if FIsShowForm then
     begin
     if not (fsShowing in self.Formstate) then
     self.Show ;
     end else
     begin
     self.ShowModal ;
     end;
end;

procedure TFmLookup.DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
var
code:Integer;
begin
     Code:=Ord(Key);
// Determines if it should use Alpha or Numbers for search
     If (First = True)  then
     begin
          First:=False;
          Look:='';
          If ((Code >= 65) and (Code <= 122) And (cbBarCode.Checked)) OR ( cbDescription.Checked) then
          begin
          if (tblAccount.Active ) then
             tblAccount.IndexFieldNames:='SDescription';
          if (tblStock.Active ) then
             tblStock.IndexFieldNames:='SDescription';
          if (ZQTblGroup.Active ) then
              ZQTblGroup.IndexFieldNames :='SDescription';
          Account:=false;
          end;
          If ((Code >= 48) and (Code <=57) AND (cbBarCode.Checked)) OR (cbCode.Checked) then
          begin
          if tblAccount.Active then
             tblAccount.IndexFieldNames:='SACCOUNTCODE';
          if tblStock.Active  then
             tblStock.IndexFieldNames:='SSTOCKCODE';
          if (ZQTblGroup.Active ) then
              ZQTblGroup.IndexFieldNames :='WGROUPID';
          Account:=true;
          end;
     end;

// Lookup and Validate keyboard inputs. Closes if ESC or ENTER is pressed.

     If (Code >= 48) and (Code <= 122) Or (Code in [32,42,45,46,47,92,95])  then
     begin
          Look := Look+Key;
          if Usefilter1.Checked then DBGrdLookup.DataSource.DataSet.Refresh ;
          if Account = false then
          begin
             if Lookuptype = tcltStock then
             begin
             if tblStock.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]) = false then
                if not Usefilter1.Checked then
                begin
                     ReturnLookupType:= tcrtNew;
                     close;
                end;
             end else
             if Lookuptype = tcltAccount then
             begin
               tblAccount.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end else
             if Lookuptype = tcltPeriods then
             begin
                   tblPeriods.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end else
             if Lookuptype = tcltAccountGroup then
             begin
                   ZQTblGroup.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end;

          end;

          if Account = true then
          begin
             if Lookuptype = tcltAccount then
             begin
             // Changed By Sylvain 10-04-2000
                Search:='SACCOUNTCODE';
                if Length(look)>6 then look:=Key;
                if not tblAccount.Locate(Search,Look,[LoPartialkey,LoCaseInsensitive]) then
                  Look:=Key;
             end;
             if Lookuptype = tcltStock then
             begin
             if not tblStock.Locate('SSTOCKCODE',Look,[LoPartialkey,LoCaseInsensitive])  then
               begin
                  if not tblStock.Locate('SBarCodeNumber',Look,[LoPartialkey,LoCaseInsensitive])  then
                  begin
                     if CanCreateAccount then
                       begin
                       ReturnLookupType:= tcrtNew ;
                       close;
                       end;
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
          ReturnLookupType := tcrtSelect ;
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
     if not Account and Usefilter1.Checked then
     begin
     if (Lookuptype = tcltAccount) then
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

procedure TFmLookup.FormClose(Sender: TObject; var Action: TCloseAction);
var
 dummy : integer ;
begin
    dummy := 0 ;
    ReturnID := -1 ;
    ReturnLookupDesc:='';
    SetLookupOrder;
    ReturnLookup := '' ;
     If Lookuptype = tcltAccount then
     begin
       if not tblAccount.Active then exit ; 
        if ReturnLookupType = tcrtSelect then
          begin
           ReturnLookup :=  tblAccount.FieldByName('SACCOUNTCODE').AsString ;
           ReturnID:=tblAccount.FieldByName('WAccountID').Value;
           ReturnLookupDesc := tblAccount.FieldByName('SDescription').Value;
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
    TDatabaseRegistyRoutines.WriteFormPos(self,SavePrefix +IntToStr(ord(sSelect)) +':' +IntToStr(ord(Lookuptype)));


    aOSAConnectionItem.WriteNwReportOp('USELUPF_'+SavePrefix+intToStr(ord(Lookuptype)) ,BoolToStr(Usefilter1.Checked,true));
end;

procedure TFmLookup.DBGrdLookupTitleClick(Column: TColumn);
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

     end;
end;

procedure TFmLookup.DBGrdLookupDblClick(Sender: TObject);
begin
     ReturnLookupType := tcrtSelect ;
     close;
end;

procedure TFmLookup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  //Added by Antonio
  //if the user pushes [home] go to the first record
  if Key = 36 then
  begin
    if Lookuptype = tcltStock   then tblStock.First;
    if Lookuptype = tcltAccount then tblAccount.First;
    if Lookuptype = tcltPeriods then tblPeriods.First;
    If Lookuptype = tcltAccountGroup then ZQTblGroup.First ;
    Key := 0;
  end;
  //Added by sylvain
  // reset look to '' when moving up or down
  if (Key=38) or (Key=40) then
    First:=True;//Look:='';

  if Key = 35 then
  begin
    if Lookuptype = tcltStock   then tblStock.Last;
    if Lookuptype = tcltAccount then tblAccount.Last;
    if Lookuptype = tcltPeriods then tblPeriods.Last;
    If Lookuptype = tcltAccountGroup then ZQTblGroup.Last ;
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
  // left and right key wil also force the exit ;37 39
  if Key = 37 then
     begin
       ReturnLookupType := tcrtBack ;
       close  ;
     end;
  if Key = 39 then
     begin
       DBGrdLookupDblClick(self);
       
     end;

end;

procedure TFmLookup.DBGrdLookupDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Lookuptype = tcltAccount)AND (Not (gdSelected in State) ) then begin
    try
      // TODO : BDEINDEX
      If   ({(dmDataBase.tblAccount.IndexName='Ind_Description') and} (Column.Index=1)) or ({(dmDataBase.tblAccount.IndexName='Ind_AccountCode') and} (Column.Index=0) ) then
      Begin
        DBGrdLookup.Canvas.Brush.Color := clwindow;
        DBGrdLookup.Canvas.Font.Color :=clwindowText ;
        DBGrdLookup.DefaultDrawColumnCell(Rect,DataCol,Column,State);
      end;
    except
    end;
  end;

end;

procedure TFmLookup.rbBarCodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    DBGrdLookup.SetFocus;
end;

// sort setting
procedure TFmLookup.cbCodeClick(Sender: TObject);
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

procedure TFmLookup.SetIsShowForm(const Value: Boolean);
begin
  FIsShowForm := Value;
end;

procedure TFmLookup.Usefilter1Click(Sender: TObject);
begin
Usefilter1.Checked := not Usefilter1.Checked ; 
end;

procedure TFmLookup.MyOnFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
if Usefilter1.Checked then
 begin
 if not Account then
  begin
    if Lookuptype = tcltAccount then
        begin
          if look <> '' then
          Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0
          else
          Accept := true ;
        end else
    if Lookuptype =  tcltStock then
        begin
          if look <> '' then
          Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0
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
  end; // not account
end ;

procedure TFmLookup.SetaOSAConnectionItem(const Value: TOSAConnectionItem);
begin
 FaOSAConnectionItem := Value;
 if FaOSAConnectionItem = nil then exit ;
 FaOSAConnectionItem.AssignConnectionToChilds(self);
end;

procedure TFmLookup.SetaGlobalDataObject(const Value: TGlobalDataObject);
begin
  FaGlobalDataObject := Value;
end;

procedure TFmLookup.SetSortOrder;
begin


  if Lookuptype = tcltAccountGroup then
  begin
    If cbCode.Checked then
      ZQTblGroup.IndexFieldNames:='WGROUPID'
    else
    If cbDescription.Checked then
      ZQTblGroup.IndexFieldNames:='SDescription';
  end else
  if Lookuptype = tcltACCOUNT then
  begin
    If cbCode.Checked then
      tblAccount.IndexFieldNames:='SACCOUNTCODE'
    else
    If cbDescription.Checked then
      tblAccount.IndexFieldNames:='SDescription';
  end else
  if  Lookuptype = tcltSTOCK then
  begin
    If cbCode.Checked then
       tblStock.IndexFieldNames:='SSTOCKCODE'
    else
    If cbDescription.Checked then
       tblStock.IndexFieldNames:='SDescription';
  end;
end;

end.
