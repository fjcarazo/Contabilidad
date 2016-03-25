(*
  Origian : Turbocash 4.0.1.0
  changed for osFinacials fork 2006/06/12  Pieter Valentijn
  Released under the GNU General Public License
*)
unit FinancialCategories;

interface

uses 
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, ImgList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxListView;

type
  TfmFinancialCategories = class(TForm)
    ButtonPanel: TPanel;
    BtnCancel: TBitBtn;
    BtPanel: TPanel;
    GroupBox1: TGroupBox;
    sbAssests: TSpeedButton;
    sbCapital: TSpeedButton;
    sbExpenses: TSpeedButton;
    sbLiabilities: TSpeedButton;
    sbNexpenses: TSpeedButton;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    ListView1: TcxListView;
    BtnAdd1: TBitBtn;
    BtnRem1: TBitBtn;
    ListView2: TcxListView;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure sbAssestsClick(Sender: TObject);
    procedure sbCapitalClick(Sender: TObject);
    procedure sbExpensesClick(Sender: TObject);
    procedure sbLiabilitiesClick(Sender: TObject);
    procedure sbNexpensesClick(Sender: TObject);
    procedure BtnAdd1Click(Sender: TObject);
    procedure BtnRem1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure rgBalClick(Sender: TObject);
  private
    CatID:Integer;
    FcCapID,FcIncID:Integer;
    Bref:Boolean;
    procedure LoadCatGroups;
    procedure SetCatGroups(RecordID,GrID,Value:Integer);
    Procedure SetIntern;
    Procedure RefreshRadio;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFinancialCategories: TfmFinancialCategories;

implementation

uses GlobalFunctions, Database,DatabaseAccess, UDMTCCoreLink,
  OSFGeneralRoutines;

{$R *.DFM}

procedure TfmFinancialCategories.LoadCatGroups;
Var
  vItem : TListItem;
begin
  ListView2.Items.Clear;
  ListView1.Items.Clear;
  dmDatabase.tblGroups.First;
  while not dmDatabase.tblGroups.eof do
  begin
    if dmDatabase.tblGroupsWGroupTypeID.Value in[20,21] then
    begin
      //Keep to List;
      if Not(dmDatabase.tblGroups.FieldByName('WParentGroup1ID').AsInteger In [57..69]) then
      begin
          vItem:=ListView1.Items.Add;
        vItem.data := Pointer(dmDatabase.tblGroupsWGroupID.AsInteger);
        vItem.Caption:= DMTCCoreLink.GroupsObject.GetGroupNesteldName( dmDatabase.tblGroupsWGroupID.AsInteger);
        vItem.SubItems.Add(GetFinCatDescription(dmDatabase.tblGroups.FieldByName('WParentGroup1ID').AsInteger))
      end;
      // Add to the selected List;
      if CatID=dmDatabase.tblGroups.FieldByName('WParentGroup1ID').AsInteger then
      begin
          ListView2.AddItem( DMTCCoreLink.GroupsObject.GetGroupNesteldName( dmDatabase.tblGroupsWGroupID.AsInteger),TOBject(dmDatabase.tblGroupsWGroupID.AsInteger));
      end;
    end;
    dmDatabase.tblgroups.Next;
  end;
end;

procedure TfmFinancialCategories.FormShow(Sender: TObject);

begin
 DMTCCoreLink.LoadImage(BtnCancel.Glyph,'Cancel');
 DMTCCoreLink.LoadImage(BitBtn1.Glyph,'Retry');
 DMTCCoreLink.LoadImage(BtnRem1.Glyph,'backward');
 DMTCCoreLink.LoadImage(BtnAdd1.Glyph,'forward');


  dmDatabase.tblGroups.Open;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Filter:='WGroupTypeID=20 OR WGroupTypeID=21';
  dmDatabase.tblGroups.Filtered:=True;
  sbAssests.Down:=True;
  Bref:=False;
  CatID:=69;
  SetIntern;
  sbAssestsClick(self);
  RefreshRadio;
  // done : Pieter Translations
 ListView1.Columns[0].Caption := gettextlang(1922);
 ListView2.Columns[0].Caption := gettextlang(1922);
 self.Caption := gettextlang(1912);

 BtnAdd1.Caption := gettextlang(292);
 BtnRem1.Caption := gettextlang(1873);
 Label1.Caption := gettextlang(1913);
 sbAssests.Caption := gettextlang(1151);
 sbCapital.Caption := gettextlang(1914);
 sbExpenses.Caption := gettextlang(1915);
 sbLiabilities.Caption := gettextlang(1916);
 sbNexpenses.Caption := gettextlang(1917);


 BitBtn1.Caption   := gettextlang(357);
 BtnCancel.Caption := gettextlang(168);

end;

procedure TfmFinancialCategories.BtnCancelClick(Sender: TObject);
begin
  CLose;
end;

procedure TfmFinancialCategories.sbAssestsClick(Sender: TObject);
begin
  CatID:=69;
  ListView2.Style.Font.Color := sbAssests.Font.Color ;
  LoadCatGroups;

end;

procedure TfmFinancialCategories.sbCapitalClick(Sender: TObject);
begin
  CatID:=FcCapID;//67;
  ListView2.Style.Font.Color := sbCapital.Font.Color ;
  LoadCatGroups;

end;

procedure TfmFinancialCategories.sbExpensesClick(Sender: TObject);
begin
  CatID:=66;
  ListView2.Style.Font.Color := sbExpenses.Font.Color ;
  LoadCatGroups;
end;

procedure TfmFinancialCategories.sbLiabilitiesClick(Sender: TObject);
begin
   CatID:=FcIncID ;//68;
   ListView2.Style.Font.Color := sbLiabilities.Font.Color ;
   LoadCatGroups;
end;

procedure TfmFinancialCategories.sbNexpensesClick(Sender: TObject);
begin
   CatID:=65;
   ListView2.Style.Font.Color := sbNexpenses.Font.Color ;
   LoadCatGroups;
end;

procedure TfmFinancialCategories.SetCatGroups(RecordID,GrID,Value:Integer);
begin
  dmDatabase.tblGroups.Locate('WGroupID',RecordID,[]);
  dmDatabase.tblGroups.Edit;
  dmDatabase.tblGroups.FieldByName('WParentGroup'+IntToStr(GrID)+'ID').AsInteger:=Value;
  dmDatabase.tblGroups.Post;
end;


procedure TfmFinancialCategories.BtnAdd1Click(Sender: TObject);
Var
  i,j : integer;
  MyItem : TListItem;
begin

  if ListView1.Selcount>0 then
  begin
    for i:=0 to ListView1.Items.Count-1 do
      if ListView1.Items[i].Selected then
      begin
        begin
          SetCatGroups(Integer(ListView1.Items[i].data),1,CatID);
        end;
      end;
  end;
  LoadCatGroups;

end;


procedure TfmFinancialCategories.BtnRem1Click(Sender: TObject);
Var
  i:integer;
begin
  For i:=0 to ListView2.Items.count-1 do
  begin
    if ListView2.Items[i].Selected then
      SetCatGroups(Integer(ListView2.Items[i].data) ,1,0);
  end;
  LoadCatGroups;
end;

procedure TfmFinancialCategories.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDatabase.tblGroups.Close;
  dmDatabase.tblGroups.Filtered:=False;
  dmDatabase.tblGroups.Filter:='';
end;

procedure TfmFinancialCategories.BitBtn1Click(Sender: TObject);
begin
  If ( OSFMessageDlg(GetTextLang(641){'This will radically alter your Data. We recommend that you stop and make a backup.}+' '#13#10' '+GetTextLang(642){'Do you wish to Continue?'}, mtinformation, [mbYes,mbNo], 0)<>mrYes) then
     exit ;

  with dmDatabase do
  begin
    tblGroups.First;
    While not tblGroups.Eof do
    begin
      tblGroups.Edit;
      tblGroups.FieldByName('WParentGroup1ID').AsInteger:=0;
      tblGroups.Post;
      tblGroups.Next;
    end;
  end;
  LoadCatGroups;
end;

procedure TfmFinancialCategories.PageControl1Change(Sender: TObject);
begin
  LoadCatGroups;
end;

procedure TfmFinancialCategories.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if Key = 112 then
        begin

             HtmlShowTopic(228);
             key := 0;

        end;
end;

procedure TfmFinancialCategories.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

Procedure TfmFinancialCategories.SetIntern;
begin
  if dmDatabase.tblGroups.Locate('WParentGroup1ID',57,[]) then
   FcCapID:=57
  else
   FcCapID:=67;
  if dmDatabase.tblGroups.Locate('WParentGroup1ID',58,[]) then
   FcIncID:=58
  else
   FcIncID:=68;
end;


Procedure TfmFinancialCategories.RefreshRadio;
begin
 
end;

procedure TfmFinancialCategories.rgBalClick(Sender: TObject);
begin
  if Bref then Exit;
 // if rgBal.ItemIndex=0 then FcCapID:=67 else FcCapID:=57;
 // if rgInc.ItemIndex=0 then FcIncID:=68 else FcIncID:=58;


 FcCapID:=67 ;
 FcIncID:=68 ;

  dmDatabase.tblGroups.First;
  While Not dmDatabase.tblGroups.Eof do
  begin
    if dmDatabase.tblGroupsWParentGroup1ID.Value in [57,67] then
    begin
      dmDatabase.tblGroups.Edit;
      dmDatabase.tblGroupsWParentGroup1ID.Value:=FcCapID;
      dmDatabase.tblGroups.Post;
    end;
    if dmDatabase.tblGroupsWParentGroup1ID.Value in [58,68] then
    begin
      dmDatabase.tblGroups.Edit;
      dmDatabase.tblGroupsWParentGroup1ID.Value:=FcIncID;
      dmDatabase.tblGroups.Post;
    end;
    dmDatabase.tblGroups.Next;
  end;
end;

end.
