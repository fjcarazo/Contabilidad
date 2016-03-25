
{*******************************************************}
{                                                       }
{                MiTeC DB Grid                          }
{           version 1.1 for Delphi 5,6                  }
{                Registration Unit                      }
{           Copyright © 2002 Michal Mutl                }
{                                                       }
{*******************************************************}

{$DEFINE D6PLUS}

unit MDBGridReg;

interface

procedure Register;

implementation

uses
  {$IFNDEF D6PLUS} DsgnIntf, {$ELSE} DesignEditors, DesignIntf, Variants, {$ENDIF}
  Classes, TypInfo, MDBGrid, MDBGridEditor;

procedure Register;
begin
  RegisterComponents('osf', [TMDBGrid]);
  RegisterComponentEditor(TMDBGrid, TMDBGridEditor);
  RegisterPropertyEditor(TypeInfo(TCollection), TMDBGrid, 'Columns',
    TMDBGridColumnsProperty);
end;

end.
