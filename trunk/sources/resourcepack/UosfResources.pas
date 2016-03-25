unit UosfResources;

interface           
uses

  SysUtils, Classes, ImgList, Controls,windows;

type
  TdmOsfResource = class(TDataModule)
    BatchDisabledButtons: TImageList;
    MenuImages: TImageList;
    BatchEnabledButtons: TImageList;
    EnabledButtonImageList: TImageList;
    DisabledButtonImageList: TImageList;
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure LoadResourceFileForImages();

var
  dmOsfResource: TdmOsfResource;


implementation

{$R *.dfm}
  procedure LoadResourceFileForImages();
  var
   HResInfo: HRSRC;
   HGlobal: THandle;
   Buffer,aFile : pchar;
   I: integer;
   ms,BinStream:TMemoryStream ;
  begin
  if not Assigned(dmOsfResource) then
    exit ;
  ms:=TMemoryStream.create;
  BinStream:=TMemoryStream.create;
  try
  aFile:='TdmOsfResource';
  HResInfo := FindResource(HInstance, pchar(aFile), RT_RCDATA);
  HGlobal := LoadResource(HInstance, HResInfo);
  if HGlobal = 0 then
     raise EResNotFound.Create('Can''t load resource: '+aFile);
  Buffer := LockResource(HGlobal);  ms.clear;
  ms.WriteBuffer(Buffer[0], SizeOfResource(HInstance, HResInfo));
  ms.Seek(0,0);
  ObjectTextToResource(ms, BinStream);
  UnlockResource(HGlobal);
  FreeResource(HGlobal);
  BinStream.Position := 0 ;
    BinStream.ReadComponentRes(dmOsfResource) ;
  finally
    ms.free ;
    BinStream.free ;
  end;
end;
end.
