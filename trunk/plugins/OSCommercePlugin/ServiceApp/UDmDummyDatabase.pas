unit UDmDummyDatabase;

interface

uses
  SysUtils, Classes, ZConnection;

type
  TdmDatabase = class(TDataModule)
    ZMainConnection: TUniconnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatabase: TdmDatabase;

implementation

{$R *.dfm}

end.
