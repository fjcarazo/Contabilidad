unit Lookup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, DB, ComCtrls, ExtCtrls,  Menus,
    DBAccess , Uni,TcashClasses, MemDS, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxCheckBox;

type
  TFmLookup = class(TForm)
    StatusBar: TStatusBar;
    PopupMenu1: TPopupMenu;
    Usefilter1: TMenuItem;
    ZQAccounts: TuniQuery;
    dsAccount: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Label1: TLabel;
    LLook: TLabel;
    cbCode: TcxCheckBox;
    cbDescription: TcxCheckBox;
    cbBarCode: TcxCheckBox;
    procedure SelectLookup(Sender: TObject ;Title, Select, Tabletype :String;
    ID:Integer;FreeLimit : String = '');
    procedure DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrdLookupDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbBarCodeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbCodeClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Usefilter1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    InProc:Boolean;
     FIsShowForm: Boolean;
    LastFullAccountFilter : String ;
    Procedure SetLookupOrder;
    Procedure GetLookupOrder;
    procedure SetIsShowForm(const Value: Boolean);
    procedure MyOnFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure AccountCodeGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    { Private declarations }
  public
    MyGroupLookup : Integer ;
    procedure WMSysCommand (var Msg: TWMSysCommand) ; message WM_SYSCOMMAND;
    property IsShowForm : Boolean  read FIsShowForm write SetIsShowForm;

    { Public declarations }
  end;
  function FmLookup: TFmLookup;
var
  search,Look,Look2,Tbl,SSelect:String;
  First,Account:Boolean;
var
  aFmLookup: TFmLookup;

implementation

uses  Database,GlobalFunctions, TcVariables, DatabaseAccess, XRoutines,
  OSFGeneralRoutines, UDMTCCoreLink, UDmQuantumGridDefs;

{$R *.DFM}

Var
  AccBlocked :   TrSelect;

procedure TFmLookup.WMSysCommand(var Msg: TWMSysCommand);
begin
   if (Msg.CmdType <> SC_MINIMIZE) then
   DefaultHandler(Msg)  else
   ModalResult := mrCancel ;
end;

function FmLookup: TFmLookup;
begin
   if not assigned(aFmLookup) then
   aFmLookup:= TFmLookup.Create(Application);
   result := aFmLookup ;
end;


Procedure TFmLookup.SetLookupOrder;
Var
  i:Byte;
begin
  if cbDescription.Checked then
    i:=1
  else if  cbBarCode.Checked then
    i:=2
  else i:=0;
  if Uppercase(tbl) = 'ACCOUNT' then
    WriteNwReportOp('WAccLookUpOrder',IntToStr(i))
  else if Uppercase(tbl) = 'STOCK' then
    WriteNwReportOp('WStoLookUpOrder',IntToStr(i))
  else if Uppercase(tbl) = 'PERIODS' then
    WriteNwReportOp('WPrdLookUpOrder',IntToStr(i))
  else if Uppercase(tbl) = 'CONTACT' then
    WriteNwReportOp('WCntLookUpOrder',IntToStr(i));
end;

Procedure TFmLookup.GetLookupOrder;
Var
  i:Byte;
begin
  i := 0 ;
  cbBarCode.Caption:= GetTextLang(989);{'Auto Select';}
  if tbl = 'ACCOUNT' then
    i:=Str2Int(ReadNwReportOp('WAccLookUpOrder').AsString);
  if tbl = 'STOCK' then
  begin
    i:= Str2Int(ReadNwReportOp('WStoLookUpOrder').AsString);
    cbBarCode.Caption:= GetTextLang(989);{'Bar Code';}
  end;
  if tbl = 'PERIODS' then
    i:= Str2Int(ReadNwReportOp('WPrdLookUpOrder').AsString);
  if tbl = 'CONTACT' then
    i:= Str2Int(ReadNwReportOp('WCntLookUpOrder').AsString);
  if i=1 then
    cbDescription.Checked := True
  else if i=2 then
    cbCodeClick(cbBarCode)
  else
//    rbCode.Checked:= True;
    cbCodeClick(cbCode);
end;

procedure TFmLookup.SelectLookup(Sender: TObject ;Title,Select,
Tabletype : String; ID:Integer;FreeLimit : String = '');
var
NoomPeriod:Integer;
i : Integer ;
begin
 AccExclFilter:= GetAccExclFilter(AccBlocked);
 dmDatabase.tblSysParams.Open ;
 Usefilter1.Checked := ReadSysParam('USELOOKUPFILTER',Bool2Str(false),currentUser).AsBoolean ;
 dmDatabase.tblSysParams.Close ;
 ZQAccounts.OnFilterRecord := MyOnFilterRecord ;
 dmDataBase.tblStock.OnFilterRecord := MyOnFilterRecord ;
 dmDataBase.tblStock.filtered := true ;



    InProc := False;
// Initialise the Position and Variables for this form.
     Label1.Caption := GetTextLang(944); {Search by}
     cbCode.Caption := GetTextLang(605);{'Code';}
     cbDescription.Caption := GetTextLang(178);{'Description';}
     FmLookup.Caption:=Title;
     tbl:=Uppercase(Tabletype);
     FmLookup.top := Screen.WorkAreaHeight - FmLookup.Height - 27;
     FmLookup.Left := Screen.WorkAreaLeft + 5;

     if parent = nil then
        TDatabaseRegistyRoutines.ReadFormPos(self,'LST');



     First:= True;
     Look:='';
     Look2:='';
     BBarCode:=False;
     SSelect:=Select;
     Search:='SMAINACCOUNTCODE';
     for i := cxGrid1DBTableView1.ColumnCount-1 downto 0 do
       cxGrid1DBTableView1.Columns[i].Free ;


     ReturnID:=0;
     ReturnLookup:='';

     if Uppercase(Tabletype) = 'ACCOUNT' then
     begin
          if cbDescription.Checked then
              begin
                ZQAccounts.IndexFieldNames := 'SDescription';
              end
          else
            begin
             ZQAccounts.IndexFieldNames := 'SACCOUNTCODE';
            end;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.DataController.DataSource := dSACCOUNT;
          dSACCOUNT.dataset := ZQAccounts ;
          cxGrid1DBTableView1.Columns[0].Caption:=GetTextLang(605);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'SACCOUNTCODE';
          cxGrid1DBTableView1.Columns[1].Caption:=GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
          cxGrid1DBTableView1.Columns[1].Width := 300 ;

          if Uppercase(Select) = 'ALL' then
          begin
             ZQAccounts.Filtered:=false;
             ZQAccounts.SQL.Text := 'select * from v_account account where WAccountID <>0  ';
             ZQAccounts.Filtered:=true;
          end
          else if Uppercase(Select) = 'GLTHREE' then
             begin
             ZQAccounts.SQL.Text := 'select * from v_account  account where (WAccountTypeID=0 or WAccountTypeID=3 or WAccountTypeID=4) and WAccountID <>0  ';
             ZQAccounts.Filtered:=true;
             end
          else if Uppercase(Select) = 'GLANDTAX' then
             begin
             ZQAccounts.SQL.Text := 'select * from v_account account where (WAccountTypeID = 0 OR WAccountTypeID = 4) AND WAccountID<> 0  ';
             ZQAccounts.Filtered:=true;
             end
          else if Uppercase(Select) = 'GLONE' then
             begin
             ZQAccounts.SQL.Text := 'select * from v_account account where WAccountTypeID = 0';
             ZQAccounts.Filtered:=true;
             end
          else if Uppercase(Select) = 'DEB' then
             begin
             ZQAccounts.SQL.Text := 'select * from  account where WAccountTypeID = 1';
             ZQAccounts.Filtered:=true;
             end
          else if Uppercase(Select) = 'CRED' then
             begin
             ZQAccounts.SQL.Text := 'select * from  account where WAccountTypeID = 2';
             ZQAccounts.Filtered:=true;
             end
          else if Uppercase(Select) = 'BANK' then
             begin
             ZQAccounts.SQL.Text := 'select * from v_account account where WAccountTypeID = 3';
             ZQAccounts.Filtered:=true;
             end
          else if Uppercase(Select) = 'NTAX' then
             begin
             ZQAccounts.SQL.Text := 'select * from v_account account where WAccountTypeID = 4 And WAccountID<>0';
             ZQAccounts.Filtered:=true;
             // default tax  is not 1 but 0
             end
          else if Uppercase(Select) = 'TAX' then
             begin
             ZQAccounts.SQL.Text := 'select account.* from v_account account left join tax on account.Waccountid = tax.Waccountid where WAccountTypeID = 4';
             ZQAccounts.Filtered:=true;
             // default tax  is not 1 but 0
             if ID = 1 then ID := 0 ;
             end
          else if Uppercase(Select) = 'BATCH' then
             begin
//04/10

             if dmDatabase.tblSysVars.Active then
               ZQAccounts.SQL.Text := 'select * from v_account account where WAccountID <> ''' + dmDatabase.tblSysVarsWDebtorsControlID.AsString +''' and WAccountID <> ''0'''+ ' and WAccountID <> ''' + dmDatabase.tblSysVarsWCreditorsControlID.AsString + ''' and WAccountID <> ''' + dmDatabase.tblSysVarsWRetainedIncomeID.AsString + ''''
             else
             begin
               dmDatabase.tblSysVars.Open;
               ZQAccounts.SQL.Text := 'select * from v_account account where WAccountID <> ''' + dmDatabase.tblSysVarsWDebtorsControlID.AsString +''' and WAccountID <> ''0'''+ ' and WAccountID <> ''' + dmDatabase.tblSysVarsWCreditorsControlID.AsString + ''' and WAccountID <> ''' + dmDatabase.tblSysVarsWRetainedIncomeID.AsString + '''';
               dmDatabase.tblSysVars.Close;
             end;
               ZQAccounts.Filtered:=true;

             end;

             ZQAccounts.SQL.add(' and (account.BSubaccounts = 0 or account.BSubaccounts is null) and account.BINACTIVE = 0');


             if AccExclFilter<>'' Then
             begin
               ZQAccounts.Filtered := False;
               if ZQAccounts.Filter='' then
                 ZQAccounts.Filter:= AccExclFilter
               else
                ZQAccounts.Filter:= ZQAccounts.Filter + ' AND ('+AccExclFilter+')';
               ZQAccounts.Filtered := True;
             end;
     if FreeLimit <> '' then
     ZQAccounts.SQL.Add(FreeLimit);
     ZQAccounts.Open;
     ZQAccounts.FindField('SACCOUNTCODE').OnGetText := AccountCodeGetText ;
     ZQAccounts.FindField('SACCOUNTCODE').DisplayWidth := ZQAccounts.FindField('SACCOUNTCODE').DisplayWidth + 2  ;
     ZQAccounts.Locate('WAccountID',ID,[]);
     end;

// Opens and set DBGrid if Contact must be looked up.
// Added by Sylvain

     if Uppercase(Tabletype) = 'CONTACT' then
     begin

     end;



     if Uppercase(Tabletype) = 'STOCK' then
     begin
          if cbDescription.Checked then
              begin
                dmDatabase.tblStock.IndexFieldNames := 'SDescription';
              end
          else
            begin
              dmDatabase.tblStock.IndexFieldNames := 'SSTOCKCODE';
            end;

          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;


          cxGrid1DBTableView1.Columns[0].Caption:=GetTextLang(605);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'SSTOCKCODE';
          cxGrid1DBTableView1.Columns[1].Caption:=GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
          cxGrid1DBTableView1.Columns[1].Width := 300 ;
          cxGrid1DBTableView1.DataController.DataSource := dmDataBase.dsStock;

          dmDatabase.tblStock.Open;



          dmDataBase.tblStock.Locate('WStockID',ID,[]);
     end;
// Opens and set DBGrid if Periods must be looked up.
// Filters according to parameter passed
     if Uppercase(Tabletype) = 'PERIODS' then
     begin
          dmDatabase.tblPeriods.Open;
          dmDatabase.tblSysVars.Open;
          NoomPeriod:=DmDataBase.tblSysVarsWNoOfPeriods.AsInteger;


          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;
          cxGrid1DBTableView1.CreateColumn ;


          cxGrid1DBTableView1.Columns[0].Caption:=GetTextLang(600);{'Code';}
          cxGrid1DBTableView1.Columns[0].DataBinding.FieldName := 'WPeriodID';
          cxGrid1DBTableView1.Columns[1].Caption:=GetTextLang(178);{'Description';}
          cxGrid1DBTableView1.Columns[1].DataBinding.FieldName := 'SDescription';
          cxGrid1DBTableView1.Columns[1].Width := 300 ;
          cxGrid1DBTableView1.Columns[2].Caption:=GetTextLang(987);{'Description';}
          cxGrid1DBTableView1.Columns[2].DataBinding.FieldName := 'DStartDate';
          cxGrid1DBTableView1.Columns[3].Caption:=GetTextLang(988);{'Description';}
          cxGrid1DBTableView1.Columns[3].DataBinding.FieldName := 'DEndDate';
          cxGrid1DBTableView1.DataController.DataSource := dmDataBase.dsPeriods;
          if Uppercase(Select) = 'THISYEAR' then
          begin
               NoomPeriod:=NoomPeriod+13;
               DmDataBase.tblPeriods.Filter:='(WyearID = 1) or (WYearid = 2) and WPeriodID >''13'' and WPeriodID <= '''+IntToStr(NoomPeriod)+'''';
               DmDataBase.tblPeriods.Filtered:=true;
          end;
          if Uppercase(Select) = 'LASTYEAR' then
          begin
               DmDataBase.tblPeriods.Filter:='(WyearID = 1) or (WYearid = 2) and WPeriodID <= '''+IntToStr(NoomPeriod)+'''';
               DmDataBase.tblPeriods.Filtered:=true;
          end;
          if Uppercase(Select) = 'ALLYEAR' then
          begin
               DmDataBase.tblPeriods.Filter:='(WyearID = 1) or (WYearid = 2)';
               DmDataBase.tblPeriods.Filtered:=true;
          end;


     dmDataBase.tblPeriods.Locate('WPeriodID',ID,[]);
     dmDataBase.tblPeriods.IndexFieldNames := 'WPeriodID'
     end;
     // remeber filter so a filer can be applayed when looking for accounts
     LastFullAccountFilter :=  ZQAccounts.filter ;
      GetLookupOrder;

    if cxGrid1DBTableView1.DataController.DataSource.DataSet.RecordCount =1 then
    begin
      FmLookup.Show ;
      FmLookup.DBGrdLookupDblClick(self);

    end else
    begin
   {  if FIsShowForm then
     begin
     if not (fsShowing in FmLookup.Formstate) then
     FmLookup.Show ;
     end else}
     FmLookup.ShowModal ;
    end;
end;

procedure TFmLookup.AccountCodeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if not ZQAccounts.IsEmpty then
  Text :=  TDataBaseRoutines.AccTypeToChar(ZQAccounts.fieldbyname('WAccountTypeID').AsInteger)   + Sender.asstring ;
end;


procedure TFmLookup.DBGrdLookupKeyPress(Sender: TObject; var Key: Char);
var
code:Integer;
begin


     First:= Look ='';
     Code:=Ord(Key);
// Determines if it should use Alpha or Numbers for search
     If (First = True)  then
     begin
          Look:='';
          If ((Code >= 65) and (Code <= 122) And (cbBarCode.Checked)) OR ( cbDescription.Checked) then
          begin
          First:=False;

          if (ZQAccounts.Active ) then
             ZQAccounts.IndexFieldNames:='SDescription';
          if (dmDataBase.tblStock.Active ) then
             dmDataBase.tblStock.IndexFieldNames:='SDescription';

          Account:=false;
          end;
          If ((Code >= 48) and (Code <=57) AND (cbBarCode.Checked)) OR (cbCode.Checked) then
          begin
          First:=False;
          if (ZQAccounts.Active = true) then
             ZQAccounts.IndexFieldNames:='SACCOUNTCODE';
          if (dmDataBase.tblStock.Active = true) then
             dmDataBase.tblStock.IndexFieldNames:='SSTOCKCODE';
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
             if tbl ='STOCK' then
             begin

             if dmDataBase.tblStock.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]) = false then
                if not Usefilter1.Checked then
                begin
                     ReturnLookup:='NEW';
                     close;
                end;
             end ;
             if tbl ='ACCOUNT' then
             begin
               begin
               ZQAccounts.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
               if not Usefilter1.Checked  then

               if Not AccountExists('SDescription',Look,True) then
                  begin
                       Look:=Key;
                       ZQAccounts.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
                  end;
               end;
             end;
             if tbl ='PERIODS' then
             begin
                  DmDataBase.tblPeriods.Locate('SDescription',Look,[LoPartialkey,LoCaseInsensitive]);
             end;
          end;

          if Account = true then
          begin
             if tbl ='ACCOUNT' then
             begin
             // Changed By Sylvain 10-04-2000
                Search:='SACCOUNTCODE';
                if Length(look)> MainAccountLength + 3  then look:=Key;
                if ZQAccounts.Locate(Search,Look,[LoPartialkey,LoCaseInsensitive])=False then
                  Look:=Key;
             end;
             if tbl ='STOCK' then
             if dmDataBase.tblStock.Locate('SSTOCKCODE',Look,[LoPartialkey,LoCaseInsensitive]) = false  then
                if (dmDataBase.tblStock.Locate('SBarCodeNumber',Look,[LoPartialkey,LoCaseInsensitive]) = false) then
                begin
                     ReturnLookup:='NEW';
                     if dmDataBase.tblStockSBarCodeNumber.Value =Look then
                       BBarCode:=True;
                     close;
                end;
             if tbl ='PERIODS' then
             begin
                  try
                  DmDataBase.tblPeriods.Locate('WPeriodID',Look,[]);
                  If Look <> '1' then
                  Look:='';
                  except
                  end;
             end;
          end;
     end;
     if Key = #13 then
     begin
        // Stops from picking from list with keys and enter.
        // If look='' then
          ReturnLookup:=   'Close';
          Key:=#0;
          close;
          exit ;
     end;
     if Key = #27 then
     begin
          ReturnLookup:='ESC';
          Key:=#0;
          close;
          exit ;
     end;
     StatusBar.SimpleText:=Look;
     if not Account and Usefilter1.Checked then
     begin
     if (tbl ='ACCOUNT') then
       if ZQAccounts.active then
       ZQAccounts.Refresh;
     if (tbl ='STOCK') then
       if dmDatabase.tblStock.active then
       dmDatabase.tblStock.Refresh;
     end;
  LLook.Caption := Look ;
end;

procedure TFmLookup.FormClose(Sender: TObject; var Action: TCloseAction);
begin


    ReturnLookupDesc:='';
    SetLookupOrder;
// Set the return values according to the Parameters passed.
     If ReturnLookup='' Then ReturnLookup:='ESC';
     If ReturnLookup='Close' Then ReturnLookup:='';
     If tbl ='ACCOUNT' then
     begin
          If ReturnLookup='' then
          begin
          ReturnLookup:=ZQAccounts.fieldbyname('SMAINACCOUNTCODE').AsString+'-'+
          ZQAccounts.fieldbyname('SSUBACCOUNTCODE').AsString;
          // done : Pieter Gettign that - out of the deb and cred accounts
          // why not use the account code
          if SSelect ='CRED' then ReturnLookup := ZQAccounts.fieldbyname('SACCOUNTCODE').AsString ;
          if SSelect ='DEB' then ReturnLookup :=  ZQAccounts.fieldbyname('SACCOUNTCODE').AsString ;
          ReturnID:=ZQAccounts.fieldbyname('WAccountID').AsInteger;
          ReturnLookupDesc := ZQAccounts.fieldbyname('SDescription').AsString;
          end;
          ZQAccounts.Filter:='';
          ZQAccounts.Close;
     end;
     If tbl ='CONTACT' then
     begin
         // ToDo : Rewrite lookp
         (*  If ReturnLookup='' then
          ReturnLookup:=DmDataBase.tblContactWContactID.AsString;
          ReturnLookupDesc := DmDataBase.tblContactSContactName.AsString;
          DmDataBase.tblContact.Filter:='';
          DmDataBase.tblContact.Close; *)
     end;
        //  dmDatabase.tblContact.Open;
     If tbl ='STOCK' then
     begin
          If ReturnLookup='' then
          ReturnLookup:=DmDataBase.tblStockSSTOCKCODE.AsString;
          ReturnLookupDesc := DmDataBase.tblStockSdescription.AsString;
          ReturnID:= DmDataBase.tblStockWStockID.AsInteger;
          DmDataBase.tblStock.Filter:='';
          DmDataBase.tblStock.Close;
     end;
     If tbl ='PERIODS' then
     begin
          If ReturnLookup='' then
          ReturnLookup := DmDataBase.tblPeriodsWPeriodID.AsString;
          ReturnID := DmDataBase.tblPeriodsWPeriodID.AsInteger;
          DmDataBase.tblPeriods.Filter:='';
          DmDataBase.tblPeriods.Close;
          DmDataBase.tblSysVars.close;
     end;
     // Added By Sylvain
     If ReturnLookup='-' then ReturnLookup:='';
//     if Not BIsFrom then
//     begin
//       ToID := ReturnID;
//       sToID := ZipAccountCode(ReturnLookup);
//     end
//     else
//     begin
//       FromID := ReturnID;
//       sFromID := ZipAccountCode(ReturnLookup);
//     end;
//  Action := cafree;
    dmDataBase.tblStock.filtered := false ;
    dmDataBase.tblStock.OnFilterRecord := nil ;
    ZQAccounts.OnFilterRecord := nil ;
    dmDatabase.tblSysParams.Open ;
    WriteSysParam('USELOOKUPFILTER',Bool2Str(Usefilter1.Checked),currentUser);
    dmDatabase.tblSysParams.Close ;
    if Parent = nil then
     TDatabaseRegistyRoutines.WriteFormPos(self,'LST');
end;

procedure TFmLookup.DBGrdLookupDblClick(Sender: TObject);
begin
     ReturnLookup:='Close';
     close;
end;

procedure TFmLookup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  //Added by Antonio
  //if the user pushes [home] go to the first record
  if Key = 36 then
  begin
    if tbl = 'STOCK'   then dmDatabase.tblStock.First;
    if tbl = 'ACCOUNT' then ZQAccounts.First;
    if tbl = 'PERIODS' then dmDatabase.tblPeriods.First;
    Key := 0;
  end;

  if (WinFormID='DOCS') And (Key = 120) then // F9 Key_Function
  begin
    ReturnLookup:='^'+IntToStr(Key);
    Close;
    exit;
  end;
  //if the user pushes [end] go to the last record
  if Key = 35 then
  begin
    if tbl = 'STOCK'   then dmDatabase.tblStock.Last;
    if tbl = 'ACCOUNT' then ZQAccounts.Last;
    if tbl = 'PERIODS' then dmDatabase.tblPeriods.Last;
    Key := 0;
  end;
  //if the user pushed [Shift - Tab]
  if (Key = 9) and (Shift=[ssShift]) then
  begin
    ReturnLookup := 'BACK';
    Key := 0;
    Close;
  end;
  if Key = 45 then
  begin
     ReturnLookup:='NEW';
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
       ReturnLookup := 'BACK';
       close  ;
     end;
  if Key = 39 then
     begin
       DBGrdLookupDblClick(self);
       
     end;

end;

procedure TFmLookup.rbBarCodeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    cxGrid1.SetFocus;
end;

procedure TFmLookup.cbCodeClick(Sender: TObject);
  Procedure UnCheck(cbx,cby,cbz:TcxCheckBox);
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
  if Sender is TcxCheckBox then
  begin
    Case (Sender as TcxCheckBox).Tag of
    12:UnCheck(cbDescription,cbCode,cbBarCode);
    11:UnCheck(cbCode,cbBarCode,cbDescription);
    else
      UnCheck(cbDescription,cbBarCode,cbCode)
    end;
  end;
 if cxGrid1DBTableView1.ColumnCount <>0  then
 begin
  cxGrid1DBTableView1.DataController.ClearSorting(True);
   If cbCode.Checked then
  begin
    if cxGrid1DBTableView1.GetColumnByFieldName('SACCOUNTCODE') <> nil then
        cxGrid1DBTableView1.GetColumnByFieldName('SACCOUNTCODE').SortOrder := soAscending ;
  end else
  If cbDescription.Checked then
  begin
    if cxGrid1DBTableView1.GetColumnByFieldName('SDescription') <> nil then
        cxGrid1DBTableView1.GetColumnByFieldName('SDescription').SortOrder := soAscending ;
  end ;
 end;


  if cbDescription.Checked then
    Account:=False
  else if cbCode.Checked then
    Account:=True;
end;

procedure TFmLookup.FormDeactivate(Sender: TObject);
begin
// if self.Showing then
//    close ;
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
    if tbl ='ACCOUNT' then
        begin
          if look <> '' then
          Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0
          else
          Accept := true ;
        end;
 if not Account then
    if tbl ='STOCK' then
        begin
          if look <> '' then
          Accept := pos(uppercase(look),uppercase(DataSet.FieldByName('SDescription').AsString)) <> 0
          else
          Accept := true ;
        end;
    end;
end ;

procedure TFmLookup.FormShow(Sender: TObject);
begin
   Usefilter1.caption := DMTCCoreLink.GetTextLangNoAmp(2967);
   cbCodeClick(self);

end;

end.
