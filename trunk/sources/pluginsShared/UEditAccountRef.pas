unit UEditAccountRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  DB, Mask, DBAccess , Uni,
    ExtCtrls,  ComCtrls, MemDS, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  DBCtrls;

type
  TfmEditAccountRef = class(TForm)
    Panel1: TPanel;
    ZQRefs: TuniQuery;
    qAccountinfo: TuniQuery;
    ZQRefsWACCOUNTREFID: TIntegerField;
    ZQRefsSREFERENCE: TStringField;
    ZQRefsWACCOUNTID: TIntegerField;
    qAccountinfoSACCOUNTCODE: TStringField;
    qAccountinfoSDESCRIPTION: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBNavigator1: TDBNavigator;
    dsRefs: TDataSource;
    Memo1: TMemo;
    ZUSQLRefs: TUniUpdateSql;
    PageControl1: TPageControl;
    tsdetail: TTabSheet;
    tsList: TTabSheet;
    ZQRefList: TuniQuery;
    ZQRefListWACCOUNTID: TIntegerField;
    ZQRefListSREFERENCE: TStringField;
    ZQRefListSACCOUNTCODE: TStringField;
    ZQRefListSDESCRIPTION: TStringField;
    Panel2: TPanel;
    Button1: TButton;
    DataSource2: TDataSource;
    qAccountinfoSBANKACCOUNTNUMBER: TStringField;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1SREFERENCE: TcxGridDBColumn;
    cxGrid2DBTableView1SACCOUNTCODE: TcxGridDBColumn;
    cxGrid2DBTableView1SDESCRIPTION: TcxGridDBColumn;
    procedure ZQRefsBeforePost(DataSet: TDataSet);
    procedure ZQRefsBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Init(AAccount : Integer) ;
    { Public declarations }
  end;

var
  fmEditAccountRef: TfmEditAccountRef;

implementation

uses UDMTCCoreLink, UOSFVisuals, UDmQuantumGridDefs;

{$R *.dfm}

{ TfmEditAccountRef }

procedure TfmEditAccountRef.Init(AAccount: Integer);
begin
PageControl1.ActivePageIndex := 0 ;
ZQRefs.close ;
ZQRefs.Params[0].AsInteger:= AAccount ;
ZQRefs.Open ;
qAccountinfo.close ;
qAccountinfo.Params[0].AsInteger:= AAccount ;
qAccountinfo.Params[1].AsInteger:= AAccount ;
qAccountinfo.Params[2].AsInteger:= AAccount ;
qAccountinfo.Open ;
end;

procedure TfmEditAccountRef.ZQRefsBeforePost(DataSet: TDataSet);
begin
 if ZQRefsWACCOUNTREFID.AsInteger = 0 then
    ZQRefsWACCOUNTREFID.AsInteger := DMTCCoreLink.GetNewIdStr('GEN_ACCOUNTREF_ID') ;
 if ZQRefsWACCOUNTID.AsInteger = 0 then
    ZQRefsWACCOUNTID.AsInteger :=  ZQRefs.Params[0].AsInteger ;
end;

procedure TfmEditAccountRef.ZQRefsBeforeOpen(DataSet: TDataSet);
begin
  DMTCCoreLink.InitFieldLengtsForDatasetfields(DataSet,'Select * from AccountRef where Waccountid is null');
end;

procedure TfmEditAccountRef.FormCreate(Sender: TObject);
begin
 uosfvisuals.ChangeDBNavigatorIcons(DBNavigator1);
 DMTCCoreLink.AssignConnectionToChilds(self);
 cxGrid1DBTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLang(1285);
end;

procedure TfmEditAccountRef.Button1Click(Sender: TObject);
begin
if not ZQRefList.IsEmpty then
   Init(ZQRefListWACCOUNTID.AsInteger);
end;

procedure TfmEditAccountRef.PageControl1Change(Sender: TObject);
begin
 if PageControl1.ActivePage = tsList then
    begin
      ZQRefList.close ;
      ZQRefList.Open ;
    end;
end;

procedure TfmEditAccountRef.FormShow(Sender: TObject);
begin
 Memo1.Lines.Text:= DMTCCoreLink.GetTextLang(3276) ;
 Caption:= DMTCCoreLink.GetTextLang(3277) ;
 tsdetail.Caption:= DMTCCoreLink.GetTextLang(930) ;
 tsList.Caption:= DMTCCoreLink.GetTextLang(903011) ;

 Button1.Caption:= DMTCCoreLink.GetTextLang(930) ;
 Label3.Caption:= DMTCCoreLink.GetTextLang(3278) ;
 Label1.Caption:= DMTCCoreLink.GetTextLang(608) ;
 Label2.Caption:= DMTCCoreLink.GetTextLang(1708) ;
 cxGrid2DBTableView1SREFERENCE.Caption := DMTCCoreLink.GetTextLang(1285);
 cxGrid2DBTableView1SACCOUNTCODE.Caption:= DMTCCoreLink.GetTextLang(608) ;
 cxGrid2DBTableView1SDESCRIPTION.Caption:= DMTCCoreLink.GetTextLang(1708) ;
end;

end.
