{******************************************************************************}
{                                                                              }
{  TLCDLabel v1.3 - Property Editor for the Custom font filename.              }
{  (c) 1998 - Peter Czidlina                                                   }
{                                                                              }
{******************************************************************************}

unit LCD_Ped;

interface

uses
  Forms, Dialogs, StdCtrls, DsgnIntF, TypInfo;

type
  TFileNameProperty = class(TStringProperty)
    function  GetAttributes : TPropertyAttributes; override;
    procedure Edit; override;
  end;

implementation

function TFileNameProperty.GetAttributes : TPropertyAttributes;
begin
  Result := [paDialog];
end;

procedure TFileNameProperty.Edit;
var
  FileOpenReq : TOpenDialog;
begin
  FileOpenReq := TOpenDialog.Create(Application);
  try
    FileOpenReq.Title := 'Open custom font file';
    FileOpenReq.Filter:= 'Font files|*.fnt';
    if FileOpenReq.Execute then
      SetStrValue(FileOpenReq.FileName);
  finally
    FileOpenReq.Free;
  end;
end;

end.
