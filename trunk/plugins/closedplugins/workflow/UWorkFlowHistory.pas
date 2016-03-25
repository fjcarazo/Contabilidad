unit UWorkFlowHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, DBCtrls, ExtCtrls, Menus;

type
  TfmWorkFlowHistory = class(TForm)
    DBGrid1: TDBGrid;
    dsHist: TDataSource;
    Panel1: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    PopupMenu1: TPopupMenu;
    Whereami1: TMenuItem;
    procedure Whereami1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWorkFlowHistory: TfmWorkFlowHistory;

implementation

uses UWorkFlowDatamodule, UDMTCCoreLink, Uworkflowsetup;

{$R *.dfm}

procedure TfmWorkFlowHistory.Whereami1Click(Sender: TObject);
var
 aLookonly : TfmWorkflow ;
begin

 if dmWorkflowData.ZQTaskHistWWORKFLOWSTEPID.AsInteger = 0 then exit ;
 aLookonly := TfmWorkflow.create(self) ;
 try
   aLookonly.WhereAmIStep := dmWorkflowData.ZQTaskHistWWORKFLOWSTEPID.AsInteger ;
   aLookonly.ShowModal ;

 finally
  aLookonly.free ;
 end;
end;

end.
