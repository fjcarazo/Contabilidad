(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit ReportWriter;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, wwdbedit, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Wwdotdot, Wwdbcomb, wwdblook, DB, Menus,  Buttons,
  clipbrd,ImgList, ComCtrls, ToolWin, Wwdatsrc, wwdbdatetimepicker, Wwdbdlg,uOsfresources;

type
  TfmReportWriter = class(TForm)
    ButtonPanel: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    wwdbgRowLines: TwwDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbedtReportName: TDBEdit;
    dbedtReportTitle1: TDBEdit;
    Label2: TLabel;
    dbedtReportTitle2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbedtNoOfColumns: TDBEdit;
    dbcboxDisplayDecimals: TDBCheckBox;
    dbcboxCompress: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pnlRelative: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    edtRelFrom: TEdit;
    edtRelTo: TEdit;
    pnlAbsolute: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    edtAbsFrom: TEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    cboxMethod: TComboBox;
    edtAbsTo: TEdit;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    BtnPreview: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    edtColType: TwwDBEdit;
    cbColumnType: TComboBox;
    LblCols: TLabel;
    CoID: TLabel;
    DReportDate: TwwDBDateTimePicker;
    Label12: TLabel;
    LookUpPanel: TPanel;
    LookupGrid: TwwDBGrid;
    StaticText1: TStaticText;
    PopupMenu1: TPopupMenu;
    Deleteline1: TMenuItem;
    InsertLine1: TMenuItem;
    CopyCell1: TMenuItem;
    PasteCell1: TMenuItem;
    PnlFormula: TPanel;
    Label13: TLabel;
    edtFormula: TwwDBEdit;
    ToolButton3: TToolButton;
    ImpoExport: TPopupMenu;
    Export1: TMenuItem;
    Import1: TMenuItem;
    Print1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbedtNoOfColumnsExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwdbgRowLinesColEnter(Sender: TObject);
    procedure GroupBox2Enter(Sender: TObject);
    procedure GroupBox2Exit(Sender: TObject);
    procedure edtAbsFromEnter(Sender: TObject);
    procedure edtAbsToEnter(Sender: TObject);
    procedure edtRelFromExit(Sender: TObject);
    procedure edtRelToExit(Sender: TObject);
    procedure wwdbgRowLinesColExit(Sender: TObject);
    procedure wwdbgRowLinesEnter(Sender: TObject);
    procedure wwdbgRowLinesTopRowChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure wwdbgRowLinesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwdbgRowLinesRowChanged(Sender: TObject);
    procedure wwdbgRowLinesCellChanged(Sender: TObject);
    procedure LookupGridDblClick(Sender: TObject);
    procedure LookupGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LookupGridCellChanged(Sender: TObject);
    procedure LookUpPanelEnter(Sender: TObject);
    procedure LookUpPanelExit(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure wwdbgRowLinesKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton2Click(Sender: TObject);
    procedure dbedtReportNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnPreviewClick(Sender: TObject);
    procedure edtColTypeChange(Sender: TObject);
    procedure cbColumnTypeChange(Sender: TObject);
    procedure cboxMethodChange(Sender: TObject);
    procedure StaticText1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CopyCell1Click(Sender: TObject);
    procedure PasteCell1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure wwdbgRowLinesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFormulaExit(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure Import1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);


  private
     sCpyColID : Integer;
     sCpyLngID : Integer;
     sCopyTemp : String;
     Procedure ShowLookUpPanel(Sender: TObject);
     Procedure ToggelColLbl(Enab:Boolean);
     Function  GetNextRow:Integer;
     Procedure AdjFormulas(InsRow,sRowOfs:Integer);
     Procedure AddFormulas;
     Function  AjdCells(OldFml:string;MvtCol:Boolean):String;
     Procedure ReArrangeRowID;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReportWriter: TfmReportWriter;

implementation

uses Main, Database, GlobalFunctions, HTMLHelpAPI, LanguageChoice,
  GetReportDate,EvaluateExpressions,UserReportReport, DatabaseAccess,XRoutines;

Var

  MoveCrs :SmallInt;
  Cell0Back:Boolean;


{$R *.DFM}

Procedure GetNextCell(Var iStart,iLen:Integer;Formula:String);
Var
  iend:integer;
  Procedure SeekCell;
  begin
    While (iStart<=length(Formula)) AND Not (Formula[iStart] in ['A'..'Z','a'..'z']) do
      Inc(iStart);
  end;
  Procedure SeekOp;
  begin
    iEnd := iStart;
    While (iEnd<=length(Formula)) AND Not (Ord(Formula[iEnd]) in [42..45,47])  do
      Inc(iEnd);
  end;
  Function IsCell:Boolean;
  Var
    iCount:Integer;
  begin
    Result := (Formula[iStart] in ['A'..'Z','a'..'z']);
    iCount := 1;
    While (iLen>1) AND (iCount<iLen) AND Result do
    begin
      Result := Result AND (Ord(Formula[iStart+iCount]) in [48..57]);
      Inc(iCount);      
    end;
  end;
begin
  ilen:=1;
  Repeat
    SeekCell;
    SeekOp;
    iLen := iEnd - iStart;
    if IsCell then
      Break;
    ilen:=0;
    iStart := iEnd;
  Until (iStart>=length(Formula)) ;

  (*
  while (iStart<length(Formula)) And (iStart>0) do
  begin
    if (Upcase(Formula[iStart]) in ['A'..'Z']) AND (Ord(Formula[iStart+1]) in [46,48..57]) then
    begin
      iEnd:=iStart;
      While (iEnd<=length(Formula)) do
      begin
        if (Ord(Formula[iend+1]) in [46,48..57]) then
          inc(iEnd)
        else
          Break
      end;
      iLen:=iEnd-iStart+1;
      Break;
    end
    else
      inc(iStart);
      //Break;
  end;
  *)
end;

Function TfmReportWriter.AjdCells(OldFml:string;MvtCol:Boolean):String;
Var
    Newi,Newj,
    i,jLen:Integer;
begin
    Result := OldFml;
    if Length(OldFml)<0 then
      exit;
    i:=0;
    While i<Length(OldFml)do
    begin
      inc(i);
      GetNextCell(i,jlen,oldfml);
      if JLen=0 then
        Break;
      if MvtCol then
        Newi := Abs(Ord(oldfml[i])-sCpyColID-wwdbgRowLines.SelectedIndex-59)
      else
        Newi := Ord(oldfml[i]);
      if Newi>91 then
        Newi:=Newi - 32;
      if jLen=1 then
        NewJ :=Abs(dmDatabase.tblRepLineWRowID.ASInteger)
      else
        NewJ :=Abs(sCpyLngID-dmDatabase.tblRepLineWRowID.ASInteger-Str2Int(Copy(oldfml,i+1,jlen-1)));
      Delete(OldFml,i,jLen);
      Insert(Char(Newi)+IntToStr(Newj),OldFml,i);
      i:=i-JLen + Length(Char(Newi)+IntToStr(Newj));
    end;
    Result:=OldFml;
end;


Procedure TfmReportWriter.AddFormulas;
Var
  SavePlace : TBookMark;
begin
  sCpyLngID := Str2Int(dmDatabase.tblRepLineWRowID.AsString);
  DmDatabase.tblRepLine.DisableControls;
  SavePlace := DmDatabase.tblRepLine.GetBookmark;
  try
  DmDatabase.tblRepLine.First;
  While not DmDatabase.tblRepLine.Eof do
  begin
    DmDatabase.tblRepLine.Edit;
    DmDatabase.tblRepLine.FieldByName('SColumn'+IntToStr(wwdbgRowLines.SelectedIndex-5)).AsString := AjdCells(edtFormula.Text,False);
    DmDatabase.tblRepLine.Post;
    DmDatabase.tblRepLine.Next;
  end;
  finally
  if DmDatabase.tblRepLine.BookmarkValid(SavePlace)  then
  DmDatabase.tblRepLine.GotoBookmark(SavePlace);
  DmDatabase.tblRepLine.FreeBookmark(SavePlace);
  DmDatabase.tblRepLine.EnableControls;
  end;
end;



Procedure TfmReportWriter.AdjFormulas(InsRow,sRowOfs:Integer);
Var
  iLong,
  i,j,k :integer;
  SNum,
  STmpFormula,
  SFormula:String;
  CCol,CRow:Char;
begin
  For i:=1 to 13 do
  begin
    SFormula := Trim(dmDatabase.tblRepLine.FieldByNAme('SColumn'+IntToStr(i)).AsString);
    STmpFormula := SFormula;
    if (SFormula<>'') AND (dmDatabase.tblRepLineWRowTypeID.Value=78) then
    begin
      J:=0;
      While J<=Length(SFormula)-1 do
      begin
        Inc(j);
        CCol:=SFormula[j]; CRow := SFormula[j+1];
        if (Ord(Upcase(CCol)) in [65..91]) AND (Ord(CRow) in [48..57]) then
        begin
          // Get Full ColId Value
          k := 1;
          While k+j<Length(SFormula) do
          begin
            if (Ord(SFormula[j+k+1]) in [46,48..57]) then
              inc(k)
            else
            begin
              Break;
            end;
          end;
          SNum := Copy(SFormula,j+1,k);
          if ((Str2Int(SNum) = InsRow) And (sRowOfs>0))
           Or (Str2Int(SNum) > InsRow)  then
          begin
            iLong:=Length(SNum);
            // Inc ColID
            SNum := IntToStr(Str2Int(SNum)+sRowOfs);
            // Replace Col Ref in Formula
            delete(SFormula,j+1,iLong);
            Insert(SNum,SFormula,j+1);
          end;
        end;
      end;
    end;
    if STmpFormula<>SFormula then
    begin
      dmDatabase.tblRepLine.Edit;
      dmDatabase.tblRepLine.FieldByNAme('SColumn'+IntToStr(i)).AsString := SFormula;
      dmDatabase.tblRepLine.Post;
    end;
  end;
end;

Procedure TfmReportWriter.ShowLookUpPanel(Sender: TObject);
Var
 TmpID:Integer;
Begin
  if (Not DmDatabase.tblGroups.Active) then exit;
  Case wwdbgRowLines.SelectedIndex of
  0:With DmDatabase do
    begin
      tblType.DisableControls;
      LookupGrid.DataSource:=dsType;
      dmDatabase.tblType.SQL.Text := 'select * from v_TYPES TYPES where WTypeParent = 7 order by WTypeID';
      dmDatabase.tblType.Open;
      tblType.Locate('WTypeID',tblRepLineWRowTypeID.Value,[]);
      Cell0Back:=True;
      LookUpPanel.Visible:=True;
      LookupGrid.SetFocus;
      Cell0Back:=False;
      tblType.EnableControls;
    End;
  1:Begin
      if wwdbgRowLines.Datasource.DataSet.FieldByName('WRowTypeID').IsNull then
        TmpID:=0
      else
        TmpID:=wwdbgRowLines.Datasource.DataSet.FieldByName('WRowTypeID').Value;
      if (TmpID>=73) And (TmpID<=76) then
      With DmDatabase do
      begin
        LookupGrid.DataSource:=dsGroups;
        tblgroups.Filtered := False;
        if TmpID in [75,76] then
          tblgroups.Filter := 'WGroupTypeID = ''21'''
        else
          tblgroups.Filter := 'WGroupTypeID = ''20''';
        tblgroups.Filtered := True;
        LookUpPanel.Visible:=True;
        LookupGrid.SetFocus;
        TmpID:=Str2Int(wwdbgRowLines.DataSource.DataSet.FieldByName('WRowItemID').AsString);
        if not tblgroups.Locate('WGroupID',TmpID,[]) then
         fmReportWriter.LookupGridCellChanged(Sender);
      end;
    End;
  else
    LookUpPanel.Visible:=False;
  end;
end;

Procedure MajCellID(IDCol:Integer);
Begin
  if IDCol >= 6 then begin
    fmReportWriter.CoID.Caption:='Cell: '+Chr(59+IDCol)+IntToStr(dmDatabase.tblRepLineWRowID.Value)+
        '>: '+ dmDatabase.tblRepLine.FieldByName('SColumn'+intToStr(IDCol-5)).AsString;
    fmReportWriter.lblCols.Visible:=True;
    fmReportWriter.ToggelColLbl(True);
    fmReportWriter.lblCols.Caption:='Col '+Chr(59+IDCol);
  end
  else begin
     fmReportWriter.CoID.Caption:='';
     fmReportWriter.lblCols.Visible:=False;
     fmReportWriter.ToggelColLbl(False);
  end;
//  fmReportWriter.Repaint;
  fmReportWriter.lblCols.Repaint;
  fmReportWriter.lblCols.Repaint;
End;
procedure TfmReportWriter.FormShow(Sender: TObject);
Var
   i:Byte;
begin
  sCopyTemp:='';
  sCpyColID :=0 ;
  sCpyLngID :=0;
  Cell0Back:=True;
  DReportDate.Date := Date;
  ButtonPanel.Color := fmMain.ControlPanel.Color;
  DmDatabase.tblRepLine.EnableControls;
  dmDatabase.tblRepCols.Open;
//  dmDatabase.tblRepLine.Open;
  dmDatabase.tblGroups.Open;
  dmDatabase.tblRepHead.Edit;
(*
  dmDatabase.tblRepLine.Filtered := False;
  dmDatabase.tblRepLine.Filter := 'WReportID = ' + IntTostr(dmDatabase.tblRepHeadWReportID.Value) ;
  dmDatabase.tblRepLine.Filtered := True;
*)
  dmDatabase.tblRepLine.Edit;
  //dmDatabase.tblType.Open;
  dmDatabase.tblType.SQL.Text := 'select * from v_TYPES TYPES where WTypeParent = 8 order by WTypeID';
  dmDatabase.tblType.Open;
  cbColumnType.Items.clear;
  while not dmDatabase.tblType.Eof do begin
     cbColumnType.Items.Add(dmDatabase.tblTypeSDescription.Value);
     dmDatabase.tblType.Next;
  end;
  with wwdbgRowLines, wwdbgRowLines.DataSource.DataSet do
  begin
   DisableControls;
   For i:=1 to 13 do
     If i<=dmDatabase.tblRepHeadWNoOfColumns.Value then
     begin
        FieldByName('SColumn' +IntToStr(i)).Displaylabel := Chr(64+i);
        FieldByName('SColumn' +IntToStr(i)).Alignment:=taCenter;
        FieldByName('SColumn' +IntToStr(i)).Visible := True;
        FieldByName('SColumn' +IntToStr(i)).DisplayWidth:=14;
      end
      else
        FieldByName('SColumn' +IntToStr(i)).Visible := False;
    EnableControls;
  end;
  Cell0Back:=False;
  ToolButton3.OnClick:=Export1.OnClick;
  dmDatabase.tblType.Close;
end;

procedure TfmReportWriter.btnCancelClick(Sender: TObject);
begin
  dmDatabase.tblRepLine.Filtered := False;
  dmDatabase.tblRepLine.Filter := '';
  dmDatabase.tblRepLine.Close;
  dmDatabase.tblRepHead.Close;
  dmDatabase.tblGroups.Close;
  Close;
end;

procedure TfmReportWriter.btnOkClick(Sender: TObject);
begin
  dmDatabase.tblRepHead.Edit;
  dmDatabase.tblRepHead.Post;
  dmDatabase.tblRepLine.Edit;
  dmDatabase.tblRepLine.Post;
  dmDatabase.tblRepLine.Filtered := False;
  dmDatabase.tblRepLine.Filter := '';
  dmDatabase.tblRepLine.Close;
  dmDatabase.tblRepHead.Close;
  dmDatabase.tblGroups.Close;
  Close;
end;

procedure TfmReportWriter.dbedtNoOfColumnsExit(Sender: TObject);
Var
  i:Integer;
begin
  if Str2Int(dbedtNoOfColumns.text)<=0 then
   dbedtNoOfColumns.text:='1';
  dmDatabase.tblRepHead.Edit;
  dmDatabase.tblRepHead.Post;
  with wwdbgRowLines.DataSource.DataSet do
  begin
    DisableControls;
    FieldByName('SDescription').Visible := True;

    For i:=1 to 13 do
      If i<=dmDatabase.tblRepHeadWNoOfColumns.Value then
      begin
        FieldByName('SColumn' +IntToStr(i)).Displaylabel := Chr(64+i);
        FieldByName('SColumn' +IntToStr(i)).Alignment:=taCenter;
        FieldByName('SColumn' +IntToStr(i)).Visible := True ;
        FieldByName('SColumn' +IntToStr(i)).DisplayWidth := 14;
     end
      else
         FieldByName('SColumn' +IntToStr(i)).Visible := False;
    EnableControls;
  end;
 
end;

procedure TfmReportWriter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblRepCols.Close;
  dmDatabase.tblType.Filtered := False;
  dmDatabase.tblType.Filter := '';
  dmDatabase.tblType.Close;
  dmDatabase.tblGroups.Close;
end;

procedure TfmReportWriter.wwdbgRowLinesColEnter(Sender: TObject);
var
  Tmp:Integer;
begin
  if wwdbgRowLines.SelectedIndex=5 then begin
    wwdbgRowLines.SelectedIndex:=6;
    exit;
  end;
  if Cell0Back  or (Not dmDatabase.tblRepLine.Active) then
    exit;
  if dmDatabase.tblRepLineWRowID.Value=0 then
  begin
    tmp:=GetNextRow; // This line cause tblrepline to be in browse mode
    dmDatabase.tblRepLine.DisableControls;
    dmDatabase.tblRepLine.Edit;
    dmDatabase.tblRepLineWRowID.Value:=Tmp;
    dmDatabase.tblRepLine.FieldByName('WReportID').Value := dmDatabase.tblRepHeadWReportID.Value;
    dmDatabase.tblRepLine.Post;
    dmDatabase.tblRepLine.EnableControls;
  end;
  MajCellID(wwdbgRowLines.SelectedIndex);
  if wwdbgRowLines.SelectedIndex >= 6 then
  begin
    PnlFormula.Visible := False;
    if not dmDatabase.tblRepCols.Locate('WReportID; WColumnID', VarArrayOf([dmDatabase.tblRepHeadWReportID.Value, wwdbgRowLines.SelectedIndex -5]), []) then
    begin
      dmDatabase.tblRepCols.Append;
      dmDatabase.tblRepColsWReportID.Value := dmDatabase.tblRepHeadWReportID.Value;
      dmDatabase.tblRepColsWColumnID.Value := wwdbgRowLines.SelectedIndex-5;
      dmDatabase.tblRepCols.Post;
    end
    else
    if dmDatabase.tblRepColsWColumnTypeID.Value=80 then
    begin
       PnlFormula.Visible := true;
       
    end
    else
    if dmDatabase.tblRepColsWPeriodStart.Value > 0 then
    begin
        pnlAbsolute.Visible := True;
        pnlRelative.Visible := False;
        cboxMethod.ItemIndex := 0;
        dmDatabase.tblPeriods.Open;
        dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblRepColsWPeriodStart.Value, []);
        edtAbsFrom.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' YYYY',dmDatabase.tblPeriodsDStartDate.Value);
        dmDatabase.tblPeriods.Locate('WPeriodID', dmDatabase.tblRepColsWPeriodEnd.Value, []);
        edtAbsTo.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' YYYY',dmDatabase.tblPeriodsDEndDate.Value);
        dmDatabase.tblPeriods.Close;
    end
    else
    begin
        pnlAbsolute.Visible := False;
        pnlRelative.Visible := True;
        cboxMethod.ItemIndex := 1;
        edtRelFrom.Text := dmDatabase.tblRepColsWPeriodStart.AsString;
        edtRelTo.Text := dmDatabase.tblRepColsWPeriodEnd.AsString;
    end;
  end;
end;

procedure TfmReportWriter.wwdbgRowLinesColExit(Sender: TObject);

begin
   MajCellID(wwdbgRowLines.SelectedIndex);
end;

procedure TfmReportWriter.GroupBox2Enter(Sender: TObject);
begin
  dmDatabase.tblRepCols.Edit;
end;

procedure TfmReportWriter.GroupBox2Exit(Sender: TObject);
begin
  if dmDatabase.tblRepCols.State = dsEdit then
    dmDatabase.tblRepCols.Post;
end;

procedure TfmReportWriter.edtAbsFromEnter(Sender: TObject);
var
  Return : String;
begin
  Highlight(edtAbsFrom);
  Case dmDatabase.tblRepColsWColumnTypeID.Value of
  // Budget
  79: Return := CallLookup(edtAbsFrom.Text, 8);
  // 80 Formula
  // Last Year
  81:Return := CallLookup(edtAbsFrom.Text, 9);
  Else
    // 82 This Year
     Return := CallLookup(edtAbsFrom.Text, 8);
  End;
  if dmDatabase.tblRepColsWColumnTypeID.Value<>80 then
  begin
    dmDatabase.tblPeriods.Open;
    if dmDatabase.tblPeriods.Locate('WPeriodID', StrToInt(Return), []) then
        edtAbsFrom.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' YYYY',dmDatabase.tblPeriodsDStartDate.Value);
    dmDatabase.tblRepColsWPeriodStart.Value := dmDatabase.tblPeriodsWPeriodID.Value;
    dmDatabase.tblPeriods.Close;
  End;  
  BackNormal(edtAbsFrom);
  SelectNext(ActiveControl,true,true);
end;

procedure TfmReportWriter.edtAbsToEnter(Sender: TObject);
var
  Return : String;
begin
  Highlight(edtAbsTo);
  Case dmDatabase.tblRepColsWColumnTypeID.Value of
  // Budget
  79: Return := CallLookup('', 8);
  // 80 Formula
  // Last Year
  81:Return := CallLookup('', 9);
  Else
    // 82 This Year
     Return := CallLookup('', 8);
  End;
  if dmDatabase.tblRepColsWColumnTypeID.Value<>80 then
  begin
    dmDatabase.tblPeriods.Open;
    if dmDatabase.tblPeriods.Locate('WPeriodID', StrToInt(Return), []) then
      edtAbsTo.Text := dmDatabase.tblPeriodsSDescription.Value + FormatDateTime(' YYYY',dmDatabase.tblPeriodsDEndDate.Value);
    dmDatabase.tblRepColsWPeriodEnd.Value := dmDatabase.tblPeriodsWPeriodID.Value;
    dmDatabase.tblPeriods.Close;
  end;
  BackNormal(edtAbsTo);
  SelectNext(ActiveControl,true,true);
end;

procedure TfmReportWriter.edtRelFromExit(Sender: TObject);
begin
  if edtRelFrom.Text <> '' then
    dmDatabase.tblRepColsWPeriodStart.Value := StrToInt(edtRelFrom.Text);
end;

procedure TfmReportWriter.edtRelToExit(Sender: TObject);
begin
  if edtRelTo.Text <> '' then
    dmDatabase.tblRepColsWPeriodEnd.Value := StrToInt(edtRelTo.Text);
end;

procedure TfmReportWriter.wwdbgRowLinesEnter(Sender: TObject);
begin
  if (LookUpPanel.Visible) or (BtnCancel.Focused) then
   exit;
  dmDatabase.tblType.SQL.Text := 'select * from v_TYPES TYPES where WTypeParent = 7 order by WTypeID';
  dmDatabase.tblType.Open;

    if wwdbgRowLines.SelectedIndex=0 then
    begin
      wwdbgRowLines.SelectedIndex:=2;
      wwdbgRowLines.SelectedIndex:=0;
    end;
end;


procedure TfmReportWriter.wwdbgRowLinesTopRowChanged(Sender: TObject);
begin
    MajCellID(wwdbgRowLines.SelectedIndex);
end;

procedure TfmReportWriter.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Case Key of
   112:begin
          //Result := (HTMLHelpShowHelp <> 0);
          HtmlShowTopic(211);
          key := 0;
       end;
    116:Begin
         if ssAlt in Shift then begin
           if WindowState=wsNormal then
             WindowState:=wsMaximized
           else
             WindowState:=wsNormal;
         end
         else
          ;
       end;
   end;
end;

procedure TfmReportWriter.wwdbgRowLinesCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Field.Index>=6 then begin
    ABrush.Color:=clinfoBk;
    Field.Alignment:=taRightJustify	;
   if Highlight then begin
     AFont.Style:=[fsBold];
     AFont.Color:=clWindowText;
   end;
  end;
  if  Field.Index=5 then begin
    Field.Alignment:=taCenter;
    ABrush.Color:=clBtnFace;
    AFont.Style:=[fsBold];
  end;
end;

procedure TfmReportWriter.wwdbgRowLinesRowChanged(Sender: TObject);
begin
//  if Cell0Back  or (Not dmDatabase.tblRepLine.Active) then
//    exit;
  MajCellID(wwdbgRowLines.SelectedIndex);
//  if dmDatabase.tblRepLineWRowItemID.IsNull or (dmDatabase.tblRepLineWRowItemID.Value<=0) then
//    wwdbgRowLines.SelectedIndex:=1;
end;

procedure TfmReportWriter.wwdbgRowLinesCellChanged(Sender: TObject);
var
  Account:String;
begin
   GroupBox2.Enabled:=False;

   Case wwdbgRowLines.SelectedIndex of
   0 :begin
       ShowLookUpPanel(Sender);
      end;
   1 :begin
       ShowLookUpPanel(Sender);
        wwdbgRowLines.DataSource.DataSet.Edit;
        Case dmDatabase.tblRepLineWRowTypeID.Value of
        70 :
            begin
              Account := dmDatabase.tblRepLineSItemName.Value;
              Account := CallLookup(Account, 0);
              dmDatabase.tblAccount.Open;
              dmDatabase.tblAccount.Locate('SACCOUNTCODE', VarArrayOf([GetMainAccountCode(Account) + GetSubAccountCode(Account)]), []);
              dmDatabase.tblRepLineWRowItemID.Value := dmDatabase.tblAccountWAccountID.Value;
              dmDatabase.tblRepLineSDescription.Value := dmDatabase.tblAccountSDescription.Value;
              dmDatabase.tblRepLineSItemName.Value := dmDatabase.tblAccountSMAINACCOUNTCODE.Value +
                                                      '-' +
                                                      dmDatabase.tblAccountSSUBACCOUNTCODE.Value;

              dmDatabase.tblAccount.Close;
            end;

        71:
            Begin
              wwdbgRowLines.DataSource.DataSet.Edit;
              wwdbgRowLines.DataSource.DataSet.FieldByName('SDescription').AsString:='';
              wwdbgRowLines.DataSource.DataSet.FieldByName('SItemName').AsString:='';
              wwdbgRowLines.DataSource.DataSet.FieldByName('WRowItemID').AsString:='';
            End;
       End;
     end;
   6..20:Begin
          GroupBox2.Enabled:=True;
          if dmDatabase.tblRepColsWColumnTypeID.Value-79<0 then
            cbColumnType.ItemIndex:=-1
          else
            cbColumnType.ItemIndex := dmDatabase.tblRepColsWColumnTypeID.Value-79;
        End;
   else

   end;
end;

procedure TfmReportWriter.LookupGridDblClick(Sender: TObject);
begin
  if MoveCrs=0 then
    MoveCrs:=1;
 wwdbgRowLines.SetFocus;
// wwdbgRowLines.SelectedIndex:=wwdbgRowLines.SelectedIndex+MoveCrs;
end;

procedure TfmReportWriter.LookupGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MoveCrs:=0;
  Case Key of
   13 :Begin
         MoveCrs:=1;
         LookupGridCellChanged(Sender);
       end;
   27 :MoveCrs:=1;
   37 :MoveCrs:=-1;
   39 :MoveCrs:=1;
    9 :
  else
  end;
  if MoveCrs<>0 then
  begin
      key:=0;
      LookupGridDblClick(Sender);
  end;
end;

procedure TfmReportWriter.LookupGridCellChanged(Sender: TObject);
begin
  if Not wwdbgRowLines.DataSource.DataSet.active then exit;
  if (LookupPanel.Visible) and (Not Cell0Back) then
  case  wwdbgRowLines.SelectedIndex of
    0:begin
        wwdbgRowLines.DataSource.DataSet.Edit;
        wwdbgRowLines.SelectedField.AsString:=DmDatabase.tblTypeSDescription.AsString;
        wwdbgRowLines.DataSource.DataSet.FieldByName('WRowTypeID').AsString:=DmDatabase.tblTypeWtypeID.AsString;
      end;
    1:begin
        wwdbgRowLines.DataSource.DataSet.Edit;
        wwdbgRowLines.SelectedField.AsString:=DmDatabase.tblGroupsSDescription.AsString;
        wwdbgRowLines.DataSource.DataSet.FieldByName('WRowItemID').AsString:=DmDatabase.tblGroupsWGroupID.AsString;
      end;
  End;
end;

procedure TfmReportWriter.LookUpPanelEnter(Sender: TObject);
begin
  if Cell0Back then exit;
end;

procedure TfmReportWriter.LookUpPanelExit(Sender: TObject);
begin
 wwdbgRowLines.SetFocus;
 LookUpPanel.Hide;
 if  MoveCrs<>0 then
   wwdbgRowLines.SelectedIndex:=wwdbgRowLines.SelectedIndex+MoveCrs
 else
   wwdbgRowLines.SelectedIndex:=2; 
 MoveCrs:=0;
 
end;

procedure TfmReportWriter.ToolButton1Click(Sender: TObject);
Var
 OldRowID,
 TmpRow  : Integer;
begin
  if DmDatabase.tblRepLine.IsEmpty then exit ;
  wwdbgRowLines.SelectedIndex := 4 ;

  if OSFMessageDlg(GetTextLang(712){Are you sure you wish to delete this row informations ?}, mtconfirmation, [mbyes, mbno], 0) = mryes then
   try
     With DmDatabase do
     begin
       OldRowID := tblRepLineWRowID.Value;
       tblRepLine.Delete;
       tblRepLine.DisableControls;
       tblRepLine.First;
       While not tblRepLine.Eof do
       begin
         AdjFormulas(OldRowID,-1);
         tblRepLine.Edit;
         tblRepLineWRowID.Value:=- abs(tblRepLineWRowID.AsInteger) ;
         tblRepLine.Post;
         tblRepLine.Next;
       end;
       tblRepLine.First;
       TmpRow:=0;

       While not tblRepLine.Eof do
       begin
         TmpRow:=TmpRow+1;
         AdjFormulas(OldRowID,-1);
         tblRepLine.Edit;
         tblRepLineWRowID.Value:=TmpRow;
         tblRepLine.Post;
         tblRepLine.Next;
       end;
       tblRepLine.EnableControls;
     end;
   except
   end;
end;

procedure TfmReportWriter.wwdbgRowLinesKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
  #4 :
    begin
      ToolButton1Click(Sender);
      Key:=#0;
    end;
  #3 : // ^c
    Begin
       CopyCell1Click(Sender);
       Key:=#0;
    end;
  #22 : // ^V
    Begin
       PasteCell1Click(Sender);
       Key:=#0;
    end;
  #14:
  begin
    ToolButton2Click(Sender);
    Key:=#0;
  end;
  else
    ;
  end;
end;

procedure TfmReportWriter.ToolButton2Click(Sender: TObject);
Var
  OldRowID ,
  TmpRow    : Integer;
  SavePlace : TbookMark;
begin
     With DmDatabase do
     begin
       OldRowID := tblRepLineWRowID.Value;
       tblRepLine.Insert;
       
       tblRepLine.Post;
       SavePlace:=tblRepLine.GetBookmark;
       tblRepLine.DisableControls;
       try
       tblRepLine.First;
       While not tblRepLine.Eof do
       begin
         AdjFormulas(OldRowID,-1);
         tblRepLine.Edit;
         tblRepLineWRowID.Value:=- abs(tblRepLineWRowID.AsInteger) ;
         tblRepLine.Post;
         tblRepLine.Next;
       end;
       tblRepLine.First;
       TmpRow:=0;
       While not tblRepLine.Eof do
       begin
         TmpRow:=TmpRow+1;
         AdjFormulas(OldRowID,+1);
         tblRepLine.Edit;
         tblRepLineWRowID.Value:=TmpRow;
         tblRepLine.Post;
         tblRepLine.Next;
       end;
       finally
       if tblRepLine.BookmarkValid(SavePlace) then
       tblRepLine.GotoBookmark(SavePlace);
       tblRepLine.FreeBookmark(SavePlace);
       tblRepLine.EnableControls;
       end;
     end;

end;

procedure TfmReportWriter.dbedtReportNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   Case Key of
   13 :if ActiveControl.Name<>'wwdbgRowLines' then
       begin
         SelectNext(ActiveControl,true,true);
         key:=0;
       end;
   end;
end;

procedure TfmReportWriter.BtnPreviewClick(Sender: TObject);
Var
  OK:Boolean;
  vDate:TDate;
begin
   if wwdbgRowLines.Selectedindex<2 then wwdbgRowLines.Selectedindex:=2;
   dmDatabase.tblAccount.Open;
   dmDatabase.tblTotals.Open;
   dmDatabase.tblReportingOptions.Open;
   dmDatabase.tblAccount.Filter:='';
   Ok:=True;

   qrUserReport := TqrUserReport.Create(self);
   try
   qrUserReport.vDate:=DReportDate.Date;
   if Ok then
    PrintReportProcess(0,qrUserReport ,'1');
   finally
    FreeAndNil(qrUserReport);
   end;
   dmDatabase.tblAccount.Close;
   dmDatabase.tblTotals.Close;
   dmDatabase.tblReportingOptions.Close;   
   dmDatabase.tblTotals.Filtered:=False;
   dmDatabase.tblTotals.Filter:='';
   dmDatabase.tblrepline.EnableControls;
   dmDatabase.tblTotals.EnableControls;
end;

procedure TfmReportWriter.edtColTypeChange(Sender: TObject);
var
 tmp:SmallInt;
begin
  Tmp:=Str2Int(edtColType.Text);
  if (tmp<79) then
    tmp:=-1
  else
    tmp:=tmp-79;
  cbColumnType.ItemIndex:=tmp;
end;

procedure TfmReportWriter.cbColumnTypeChange(Sender: TObject);
begin
  PnlFormula.Visible := False;
  edtColType.DataSource.DataSet.Edit;
  edtColType.Field.Value:=IntToStr(79+cbColumnType.ItemIndex);
//  edtColType.DataSource.DataSet.Post;
  if cbColumnType.ItemIndex=1 then
  begin
    PnlFormula.Visible:=True;
    edtFormula.SetFocus;
  end;
end;

procedure TfmReportWriter.cboxMethodChange(Sender: TObject);
begin
  if cboxMethod.Text = 'Absolute' then
  begin
    pnlAbsolute.Visible := True ;
    pnlRelative.Visible := False;
  end
  else
  begin
    pnlRelative.Visible := True;
    pnlAbsolute.Visible := False;
  end;
end;

Procedure TfmReportWriter.ToggelColLbl(Enab:Boolean);
begin
  Label5.Enabled:=Enab;
  Label6.Enabled:=Enab;
  Label7.Enabled:=Enab;
  Label8.Enabled:=Enab;
  Label9.Enabled:=Enab;
  Label10.Enabled:=Enab;
  Label11.Enabled:=Enab;

end;

Function TfmReportWriter.GetNextRow:Integer;
Var
  aSavePlace:{$IFDEF COMPILER12_UP}DB.TBookmark{$ELSE}TBookmarkStr{$ENDIF COMPILER12_UP};
begin
  dmDatabase.tblRepLine.DisableControls;
  aSavePlace:=dmDatabase.tblRepLine.Bookmark;
  try
  dmDatabase.tblRepLine.First;
  Result:=0;
  repeat
    Result:=Result+1;
    dmDatabase.tblRepLine.Next;
  until dmDatabase.tblRepLine.Eof;
  finally
  dmDatabase.tblRepLine.Bookmark := aSavePlace;
  dmDatabase.tblRepLine.EnableControls;
  end;
end;

procedure TfmReportWriter.StaticText1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Const
  SC_DragMove = $F012;  { a magic number }
begin
  ReleaseCapture;
  LookUpPanel.perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TfmReportWriter.CopyCell1Click(Sender: TObject);
begin
// sCopyTemp : My Coy Mem space.
  sCopyTemp:='';
  sCpyColID :=0 ;
  sCpyLngID :=0;
  if wwdbgRowLines.SelectedIndex>5 then
  begin
    sCopyTemp := wwdbgRowLines.SelectedField.AsString;
    sCpyColID := wwdbgRowLines.SelectedIndex+59;
    sCpyLngID := dmDatabase.tblRepLineWRowID.ASInteger;
  end;
end;

procedure TfmReportWriter.PasteCell1Click(Sender: TObject);
begin
// sCopyTemp : My Coy Mem space.
  if wwdbgRowLines.SelectedIndex>5 then
  begin
    dmDatabase.tblRepLine.Edit;
    wwdbgRowLines.SelectedField.AsString:=AjdCells(sCopyTemp,True);
    dmDatabase.tblRepLine.Post;
    MajCellID(wwdbgRowLines.SelectedIndex);
  end;
end;

procedure TfmReportWriter.PopupMenu1Popup(Sender: TObject);
begin
  if (sCopyTemp='') Or (wwdbgRowLines.SelectedIndex<5) then
    PasteCell1.Enabled := False;
  if wwdbgRowLines.SelectedIndex>5 then
    CopyCell1.Enabled := True
  else
    CopyCell1.Enabled := False;
end;

procedure TfmReportWriter.wwdbgRowLinesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if ((Key = ord('V')) and (ssCtrl in Shift)) then begin
//     if Clipboard.HasFormat(CF_TEXT) then
//       Clipboard.AsText:='Ceci est in Test';
//     key := 0;
//   end;
   if (Key = 46) then
   begin
    dmDatabase.tblRepLine.Edit;
    wwdbgRowLines.SelectedField.AsString:='';
    dmDatabase.tblRepLine.Post;
    key := 0;
   end;

end;

procedure TfmReportWriter.edtFormulaExit(Sender: TObject);
begin
  AddFormulas;
end;

procedure TfmReportWriter.Export1Click(Sender: TObject);
Var
  AString : String;
  i:Integer;
  aStream:TStream;
begin
  ToolButton3.OnClick:=Export1.OnClick;
  Export1.Default := True;
  With fmMain.DlgSaveAs do
  begin
    Title := 'Export User report "'+dmDatabase.tblRepHeadSReportName.Value+'" to file';
    DefaultExt:='.csv';
    Filter :='Text Comma Separate (*.csv)|*.csv|all (*.*)|*.*';
    if execute then
    begin
      {Create File}
      if pos('.',Filename)>1 then
         Filename:=Trim(Copy(Filename,1,Pos('.',Filename)-1));
      Filename:=Filename+'.Csv';
      aStream := TFileStream.Create(Filename, fmCreate);
       try
      {Write Header Rec}
      AString :='0,';
      aStream.Write(AString[1], Length(AString));
      for i:=0 to dmDatabase.tblRepHead.FieldCount-1 do
      begin
        AString:='"'+dmDatabase.tblRepHead.FieldDefs.Items[i].Name +'='+
             dmDatabase.tblRepHead.FieldByName(dmDatabase.tblRepHead.FieldDefs.Items[i].Name).AsString+'"';
        if i=dmDatabase.tblRepHead.FieldCount-1 then
            AString:=AString+#13#10
          else
            AString:=AString+',';
        aStream.Write(AString[1], Length(AString));
      end;
      {Write Cols Rec}
      dmDatabase.tblRepCols.Filtered:=False;
      dmDatabase.tblRepCols.Filter:='WReportID='''+dmDatabase.tblRepHeadWReportID.AsString+'''';
      dmDatabase.tblRepCols.Filtered:=True;
      dmDatabase.tblRepCols.First;
      While not dmDatabase.tblRepCols.Eof do
      begin
        AString :='1,';
        aStream.Write(AString[1], Length(AString));
        for i:=0 to dmDatabase.tblRepCols.FieldCount-1 do
        begin
          AString:='"' + dmDatabase.tblRepCols.FieldDefs.Items[i].Name +'='+
             dmDatabase.tblRepCols.FieldByName(dmDatabase.tblRepCols.FieldDefs.Items[i].Name).AsString+'"';
          if i=dmDatabase.tblRepCols.FieldCount-1 then
            AString:=AString+#13#10
          else
            AString:=AString+',';
          aStream.Write(AString[1], Length(AString));
        end;
        dmDatabase.tblRepCols.Next;
      end;
      dmDatabase.tblRepCols.Filtered:=False;
      dmDatabase.tblRepCols.Filter:='';
      {Write Lines Rec}
      dmDatabase.tblRepLine.DisableControls;
      try
      dmDatabase.tblRepLine.First;
      While not dmDatabase.tblRepLine.Eof do
      begin
        AString :='2,';
        aStream.Write(AString[1], Length(AString));
        for i:=0 to dmDatabase.tblRepLine.FieldCount-1 do
        begin
          AString:='"'+dmDatabase.tblRepLine.FieldDefs.Items[i].Name +'='+
             dmDatabase.tblRepLine.FieldByName(dmDatabase.tblRepLine.FieldDefs.Items[i].Name).AsString+'"';
          if i=dmDatabase.tblRepLine.FieldCount-1 then
            AString:=AString+#13#10
          else
            AString:=AString+',';
          aStream.Write(AString[1], Length(AString));
        end;
        dmDatabase.tblRepLine.Next;
      end;
       finally
         dmDatabase.tblRepLine.EnableControls;
       end;
      {finished}
      finally
      aStream.Free;
      end;
    end;
  end;
end;

procedure TfmReportWriter.Import1Click(Sender: TObject);
Var
  UserRepFile : TextFile;
  ReportRec : TStringList;
  Temp      : String;
  i:Byte;
begin
  ToolButton3.OnClick:=Import1.OnClick;
  Import1.Default := True;
  With fmMain.OpenDialog do
  begin
    DefaultExt:='.csv';
    Filter :='Text Comma Separate (*.csv)|*.csv|all (*.*)|*.*';
    Title := 'Import User report from file';    
    if execute then
    begin
      ReportRec := TStringList.Create;
       try
      AssignFile(UserRepFile, FileName);
      Reset(UserRepFile);
      Try
        while not SeekEOF(UserRepFile) do
        begin
          // Read Report Line File
          ReadLn(UserRepFile, Temp);
          ReportRec.Commatext:=Temp;
          Case Str2Int(ReportRec[0]) of
          0: Begin
               dmDatabase.tblRepHead.edit;
               for i:=1 to dmDatabase.tblRepHead.FieldCount-1 do
                 if ReportRec.Names[i+1]<>'WReportID' then
                   dmDatabase.tblRepHead.FieldByName(ReportRec.Names[i+1] ).AsString := ReportRec.Values[ReportRec.Names[i+1]];
               dmDatabase.tblRepHead.Post;
            end;
          1: Begin
               if dmDatabase.tblRepCols.Locate('WReportID;WColumnID',VarArrayOf([dmDatabase.tblRepHeadWReportID.Value,ReportRec.Values['WColumnID']]),[]) then
                 dmDatabase.tblRepCols.edit
               else
                 dmDatabase.tblRepCols.Append;
               dmDatabase.tblRepColsWReportID.Value := dmDatabase.tblRepHeadWReportID.Value;
               for i:=1 to dmDatabase.tblRepCols.FieldCount-1 do
                 if ReportRec.Names[i+1]<>'WReportID' then
                 dmDatabase.tblRepCols.FieldByName(ReportRec.Names[i+1]).AsString := ReportRec.Values[ReportRec.Names[i+1]];
               dmDatabase.tblRepCols.Post;
            end;
          2: Begin
               dmDatabase.tblRepLine.Append;
               for i:=1 to dmDatabase.tblRepLine.FieldCount-1 do
                 if ReportRec.Names[i+1]<>'WReportID' then
                 dmDatabase.tblRepLine.FieldByName(ReportRec.Names[i+1]).AsString := ReportRec.Values[ReportRec.Names[i+1]];
               dmDatabase.tblRepLine.Post;
            end;
          end;
        end;
        ReArrangeRowID;
      except

      end;
       // done : Pieter no free ???
       finally
       ReportRec.free ;
       end;
    end;
  end;
end;

procedure TfmReportWriter.Print1Click(Sender: TObject);
begin
  ToolButton3.OnClick:=Print1.OnClick;
  Print1.Default := True;
  ShowMessage('Implementation in Progress ');
end;


Procedure TfmReportWriter.ReArrangeRowID;
Var
 vln:Integer;
begin
  dmDatabase.tblRepLine.DisableControls;
  dmDatabase.tblRepLine.First;
  vln:=0;
  while not dmDatabase.tblRepLine.eof do
  begin
    inc(vln);
    dmDatabase.tblRepLine.Edit;
    dmDatabase.tblRepLineWRowID.Value:=vln;
    dmDatabase.tblRepLine.Post;
    dmDatabase.tblRepLine.Next;
  end;
  dmDatabase.tblRepLine.EnableControls;
end;

end.
