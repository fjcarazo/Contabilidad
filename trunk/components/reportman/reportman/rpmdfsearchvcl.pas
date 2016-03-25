{*******************************************************}
{                                                       }
{       Report Manager Designer                         }
{                                                       }
{       rpmdfsearchvcl                                  }
{                                                       }
{       Search dialog for paramters                     }
{                                                       }
{       Copyright (c) 1994-2005 Toni Martir             }
{       toni@pala.com                                   }
{                                                       }
{       This file is under the MPL license              }
{       If you enhace this file you must provide        }
{       source code                                     }
{                                                       }
{                                                       }
{*******************************************************}

unit rpmdfsearchvcl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  rpmdconsts,rpdatainfo,rpparams,rpreport,
  StdCtrls, ExtCtrls, Grids, DBGrids,  Db, virtualTable;

type
  TFRpSearchParamVCL = class(TForm)
    PTop: TPanel;
    LSearch: TLabel;
    ESearch: TEdit;
    BSearch: TButton;
    Timer1: TTimer;
    GridData: TDBGrid;
    BOK: TButton;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure ESearchChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BSearchClick(Sender: TObject);
    procedure BOKClick(Sender: TObject);

  private
    { Private declarations }
    param:TRpParam;
    params:TRpParamList;
    searchparam:TRpParam;
    databaseinfo:TRpDatabaseInfoList;
    datainfo:TRpDataInfoList;
    dinfo:TRpDataInfoItem;
    report:TRpReport;
    DData : TVirtualTable ;
  public
    { Public declarations }
  end;


procedure ParamValueSearch(aparam:TRpParam;report:TRpReport);

implementation

{$R *.DFM}

procedure ParamValueSearch(aparam:TRpParam;report:TRpReport);
var
 dia:TFRpSearchParamVCL;
begin
 dia:=TFRpSearchParamVCL.Create(Application);
 try
  dia.param:=aparam;
  dia.params:=TRpParamList(aparam.Collection);
  dia.report:=report;
  dia.databaseinfo:=dia.Report.databaseinfo;
  if Length(aparam.SearchParam)>0 then
   dia.searchparam:=dia.Params.ParamByName(aparam.SearchParam);
  dia.datainfo:=dia.Report.datainfo;
  dia.LSearch.Visible:=Assigned(dia.searchparam);
  dia.ESearch.Visible:=Assigned(dia.searchparam);
  dia.dinfo:=dia.datainfo.ItemByName(aparam.SearchDataset);
  try
   if not assigned(dia.searchparam) then
   begin
    dia.BSearch.Visible:=false;
    dia.Timer1Timer(dia);
    dia.PTop.Height:=dia.BOk.Top+dia.BOk.Height+5;
   end;
   dia.ShowModal;
  finally
   dia.dinfo.Disconnect;
  end;
 finally
  dia.free;
 end;
end;

procedure TFRpSearchParamVCL.FormCreate(Sender: TObject);
begin
 DData := TVirtualTable.Create(self);
 DataSource1.DataSet := DData ;
 Caption:=SRpSearchValue;
 LSearch.Caption:=SRpSearchValue;
 BOK.Caption:=TranslateStr(93,BOK.Caption);
 BSearch.Caption:=SRpSearch;
end;

procedure TFRpSearchParamVCL.ESearchChange(Sender: TObject);
begin
 Timer1.Enabled:=true;
end;

procedure TFRpSearchParamVCL.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled:=false;
 DData.Close;
 try
  dinfo.Disconnect;
  if assigned(searchparam) then
   searchparam.Value:=ESearch.Text;
  dinfo.Connect(databaseinfo,params);
 DData.Assign(dinfo.Dataset);
  DData.Open;
  BOK.Enabled:=Not DData.Eof;
  GridData.Visible:=true;
 except
  GridData.Visible:=false;
  BOK.Enabled:=false;
  raise;
 end;
end;

procedure TFRpSearchParamVCL.BSearchClick(Sender: TObject);
begin
 Timer1Timer(Self);
end;

procedure TFRpSearchParamVCL.BOKClick(Sender: TObject);
begin
 param.Value:=DData.Fields[0].AsVariant;
 Close;
end;


end.
