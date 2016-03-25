unit USQLHolder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TSQLHOLDER = class(TComponent)
  private
    { Private declarations }
    FSQL : TStrings ;
    procedure SetQuery(Value: TStrings);
  protected
    { Protected declarations }
  public
    constructor create(AOwner :TComponent); Override ;
    destructor  destroy ; override ;
    { Public declarations }
  published
    property SQL : TStrings read FSQL write SetQuery;
    { Published declarations }
  end;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('osf', [TSQLHOLDER]);
end;

constructor TSQLHOLDER.create(AOwner :TComponent);
begin
  inherited;
  FSQL := TStringlist.create ;
end;

procedure TSQLHOLDER.SetQuery(Value: TStrings);
begin
  if SQL.Text <> Value.Text then
  begin
    SQL.BeginUpdate;
    try
      SQL.Assign(Value);
    finally
      SQL.EndUpdate;
    end;
  end;
end;

destructor  TSQLHOLDER.destroy ;
begin
  SQL.free;
  inherited ;
end;

end.


