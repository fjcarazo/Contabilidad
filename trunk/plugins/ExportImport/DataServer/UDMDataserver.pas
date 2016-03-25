unit UDMDataserver;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, DBAccess , Uni,
  ZConnection;

type
  TDMDataserver = class(TDataModule)
    ZConnection1: TUniconnection;
    ZQuery: TuniQuery;
  private
    { Private declarations }
  public
    function RunSql(ASql : String) : String ;

    { Public declarations }
  end;

var
  DMDataserver: TDMDataserver;

implementation

uses JvMemoryDataset, janXMLParser2, janStrings,activeX;

{$R *.dfm}

{ TDMDataserver }

function TDMDataserver.RunSql(ASql: String): String;
const
 ATypes ='SELECT,UPDATE,DELETE,ALTER,DROP,CREATE,COMMIT' ;
var
 TypeExecution : String ;
 Adataset : TJvMemoryData ;
begin
ActiveX.CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
 try
 ASql := trim(URLDecode(ASql)) ;
 ZQuery.SQL.Text := ASql ;
 TypeExecution := UpperCase(copy(ASql,1,pos(' ',ASql)-1));
 if pos(TypeExecution,ATypes) <> 0 then
   begin
      case pos(TypeExecution,ATypes) of
      1 : begin
           Adataset := TJvMemoryData.create(nil) ;
             try
              ZQuery.open ;
              Adataset.LoadFromDataSet(ZQuery,-1,lmCopy);
              result := DataSetToXmlString(Adataset);
             finally
              Adataset.free ;
             end;
          end
      else
         begin
            ZQuery.ExecSQL ;
            result := '<RESULT>OK' + IntToStr(ZQuery.RowsAffected) + '</RESULT>' ;
         end;
      end; //end case


   end;  // pos type exec <> 0
 except
    on e : Exception do
     result := '<RESULT>' +  e.message + '</RESULT>' ;
 end;

end;

end.
