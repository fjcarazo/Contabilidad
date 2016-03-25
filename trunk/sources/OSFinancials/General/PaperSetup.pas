unit PaperSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfmPaperSetup = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtLeft: TEdit;
    UpDown1: TUpDown;
    edtTop: TEdit;
    UpDown2: TUpDown;
    edtRight: TEdit;
    UpDown3: TUpDown;
    edtBottom: TEdit;
    UpDown4: TUpDown;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edtLength: TEdit;
    UpDown5: TUpDown;
    edtWidth: TEdit;
    UpDown6: TUpDown;
    rbRepType: TRadioGroup;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ButtonPanel: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    rbDefault: TRadioButton;
    rbCutom: TRadioButton;
    Label14: TLabel;
    Label15: TLabel;
    cbQuality: TComboBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure rbRepTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown6Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
    Procedure LoadPageSet;
    Procedure SavePageSet;

  public
    { Public declarations }
  end;

var
  fmPaperSetup: TfmPaperSetup;

implementation

uses GlobalFunctions, DatabaseAccess, TcVariables,XRoutines;

{$R *.dfm}

Function MakeSpin(S:String;Up:Boolean):String;
VAr
  x:real;
begin
  x:=StrToFloatDef(s,0);
  if Up then
    x := (Round(x*10)+1)/10
  else
    x := (Round(x*10)-1)/10;
  if x<0 then x:=0;  
  Result := FloatToStr(x);
end;

Procedure TfmPaperSetup.LoadPageSet;
Var
  aMust:Boolean;
  aLeft,aRight,aBott,aTop,aWidth,aLen : Real;
begin
  GetRprtSizes(rbRepType.ItemIndex,aLeft,aRight,aBott,aTop,aWidth,aLen,aMust);
  edtLeft.Text := FloatToStr2Dec(aLeft);
  edtTop.Text :=  FloatToStr2Dec(aTop);
  edtRight.Text := FloatToStr2Dec(aRight);
  edtBottom.Text := FloatToStr2Dec(aBott);
  edtWidth.Text := FloatToStr2Dec(aWidth);
  edtLength.Text := FloatToStr2Dec(aLen);
  rbCutom.Checked := aMust;
  (*
  Case rbRepType.ItemIndex of
  1:begin
      edtLeft.Text :=  ReadReportOp('WStmPageMrgLeft','6.0').AsString;
      edtTop.Text :=  ReadReportOp('WStmPageMrgTop','2.0').AsString;
      edtRight.Text :=  ReadReportOp('WStmPageMrgRight','10.0').AsString;
      edtBottom.Text :=  ReadReportOp('WStmPageMrgBottom','13.0').AsString;
      edtWidth.Text :=  ReadReportOp('WStmPageMrgWidth','195.0').AsString;
      edtLength.Text :=  ReadReportOp('WStmPageMrgLength','218.55').AsString;
      rbCutom.Checked :=  ReadReportOp('BStmPageCust',False).AsBoolean;
    end;
  2:begin
      edtLeft.Text :=  ReadReportOp('WOthPageMrgLeft','10.0').AsString;
      edtTop.Text :=  ReadReportOp('WOthPageMrgTop','10.0').AsString;
      edtRight.Text :=  ReadReportOp('WOthPageMrgRight','10.0').AsString;
      edtBottom.Text :=  ReadReportOp('WOthPageMrgBottom','10.0').AsString;
      edtWidth.Text :=  ReadReportOp('WOthPageMrgWidth','195.0').AsString;
      edtLength.Text :=  ReadReportOp('WOthPageMrgLength','218.55').AsString;
      rbCutom.Checked :=  ReadReportOp('BOthPageCust',False).AsBoolean;
    end;
  else
    edtLeft.Text :=  ReadReportOp('WDocPageMrgLeft','0.0').AsString;
    edtTop.Text :=  ReadReportOp('WDocPageMrgTop','2.0').AsString;
    edtRight.Text :=  ReadReportOp('WDocPageMrgRight','5.0').AsString;
    edtBottom.Text :=  ReadReportOp('WDocPageMrgBottom','7.0').AsString;
    edtWidth.Text :=  ReadReportOp('WDocPageMrgWidth','195.0').AsString;
    edtLength.Text :=  ReadReportOp('WDocPageMrgLength','216.0').AsString;
    rbCutom.Checked :=  ReadReportOp('BDocPageCust',False).AsBoolean;
  end;
  *)
  rbDefault.Checked := Not rbCutom.Checked;
  if DocDraft then
    cbQuality.ItemIndex := 0
  else
    cbQuality.ItemIndex := 1;
//  cbQuality.Enabled := (rbRepType.ItemIndex=0);

end;

Procedure TfmPaperSetup.SavePageSet;
begin
  Case rbRepType.ItemIndex of
  1:begin
      WriteReportOp('WStmPageMrgLeft',edtLeft.Text );
      WriteReportOp('WStmPageMrgTop',edtTop.Text );
      WriteReportOp('WStmPageMrgRight',edtRight.Text );
      WriteReportOp('WStmPageMrgBottom',edtBottom.Text );
      WriteReportOp('WStmPageMrgWidth',edtWidth.Text );
      WriteReportOp('WStmPageMrgLength',edtLength.Text );
      WriteReportOp('BStmPageCust',Bool2Str(rbCutom.Checked) );
    end;
  2:begin
      WriteReportOp('WOthPageMrgLeft',edtLeft.Text );
      WriteReportOp('WOthPageMrgTop',edtTop.Text );
      WriteReportOp('WOthPageMrgRight',edtRight.Text );
      WriteReportOp('WOthPageMrgBottom',edtBottom.Text );
      WriteReportOp('WOthPageMrgWidth',edtWidth.Text );
      WriteReportOp('WOthPageMrgLength',edtLength.Text );
      WriteReportOp('BOthPageCust',Bool2Str(rbCutom.Checked) );
    end;
  else
    WriteReportOp('WDocPageMrgLeft',edtLeft.Text );
    WriteReportOp('WDocPageMrgTop',edtTop.Text );
    WriteReportOp('WDocPageMrgRight',edtRight.Text );
    WriteReportOp('WDocPageMrgBottom',edtBottom.Text );
    WriteReportOp('WDocPageMrgWidth',edtWidth.Text );
    WriteReportOp('WDocPageMrgLength',edtLength.Text );
    WriteReportOp('BDocPageCust',Bool2Str(rbCutom.Checked) );
    DocDraft := cbQuality.ItemIndex=0;
  end;
  WriteReportOp('WDocQuality',IntToStr(cbQuality.ItemIndex));
end;

procedure TfmPaperSetup.BitBtn3Click(Sender: TObject);
begin
  rbCutom.Checked := False;
  cbQuality.ItemIndex:=1;
  Case rbRepType.ItemIndex of
  1:begin
      edtLeft.Text := '6.0';
      edtTop.Text :=  '2.0';
      edtRight.Text :=  '10.0';
      edtBottom.Text :=  '13.0';
      edtWidth.Text :=  '195.0';
      edtLength.Text := '218.55';

    end;
  2:begin
      edtLeft.Text := '10.0';
      edtTop.Text :=  '10.0';
      edtRight.Text :=  '10.0';
      edtBottom.Text :=  '10.0';
      edtWidth.Text :=  '210.0';
      edtLength.Text := '297.0';
    end;
  else
    edtLeft.Text := '5.0';
    edtTop.Text :=  '2.0';
    edtRight.Text :=  '5.0';
    edtBottom.Text :=  '7.0';
    edtWidth.Text :=  '195.0';
    edtLength.Text := '216.0';

  end;
end;

procedure TfmPaperSetup.rbRepTypeClick(Sender: TObject);
begin
  LoadPageSet;
end;

procedure TfmPaperSetup.FormShow(Sender: TObject);
begin
  rbRepType.Items.Clear;
  rbRepType.Items.Add(GetTextLang(38));
  rbRepType.Items.Add(GetTextLang(354));
  rbRepType.Items.Add(GetTextLang(1333));
  cbQuality.Clear;
  cbQuality.Items.Add(GetTextLang(1344));
  cbQuality.Items.Add(GetTextLang(1345));
  LoadPageSet;  
end;

procedure TfmPaperSetup.BitBtn1Click(Sender: TObject);
begin
  SavePageSet;
  Close;
end;

procedure TfmPaperSetup.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  edtLeft.Text:=MakeSpin(edtLeft.Text,Button=btNext);
end;

procedure TfmPaperSetup.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
   edtright.Text:=MakeSpin(edtright.Text,Button=btNext);
end;

procedure TfmPaperSetup.UpDown4Click(Sender: TObject; Button: TUDBtnType);
begin
  edtbottom.Text:=MakeSpin(edtbottom.Text,Button=btNext);
end;

procedure TfmPaperSetup.UpDown6Click(Sender: TObject; Button: TUDBtnType);
begin
  edtwidth.Text:=MakeSpin(edtwidth.Text,Button=btNext);
end;

procedure TfmPaperSetup.UpDown5Click(Sender: TObject; Button: TUDBtnType);
begin
  edtlength.Text:=MakeSpin(edtlength.Text,Button=btNext);
end;

procedure TfmPaperSetup.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
    edtTop.Text:=MakeSpin(edtTop.Text,Button=btNext);
end;

end.
