unit UMainPump;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZConnection, Buttons, DB, DBAccess, Uni;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    EFromusername: TEdit;
    EFromPass: TEdit;
    EFromDb: TEdit;
    ZConnection1: TUniconnection;
    ZConnection2: TUniconnection;
    EFromServer: TEdit;
    cbToType: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    cbFromType: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
