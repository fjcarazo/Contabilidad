unit UMainDataAccess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZSqlProcessor, ZConnection;

type
  TMainDataAccess = class(TForm)
    ZConnection1: TUniconnection;
    ZSQLProcessor1: TUniScript;
    MData: TMemo;
    Euser: TEdit;
    EPassword: TEdit;
    Label1: TLabel;
    Lpassword: TLabel;
    Label3: TLabel;
    EServer: TEdit;
    Label2: TLabel;
    Ebooks: TEdit;
    Label4: TLabel;
    BGo: TButton;
    BOpzoeken: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Label5: TLabel;
    procedure BOpzoekenClick(Sender: TObject);
    procedure BGoClick(Sender: TObject);
    procedure ZSQLProcessor1Error(Processor: TUniScript;
      StatementIndex: Integer; E: Exception;
      var ErrorHandleAction: TZErrorHandleAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDataAccess: TMainDataAccess;

implementation

{$R *.dfm}

procedure TMainDataAccess.BOpzoekenClick(Sender: TObject);
begin
 if OpenDialog1.Execute then
    begin
       Ebooks.Text := OpenDialog1.FileName ;
    end;
end;

procedure TMainDataAccess.BGoClick(Sender: TObject);
begin
ZConnection1.User := Euser.Text ;
ZConnection1.Password := EPassword.Text ;
ZConnection1.HostName := EServer.Text ;
ZConnection1.Database := Ebooks.Text ;
ZConnection1.Connect ;
ZSQLProcessor1.Script.Text := MData.Text ;
ZSQLProcessor1.Execute ; 
end;

procedure TMainDataAccess.ZSQLProcessor1Error(Processor: TUniScript;
  StatementIndex: Integer; E: Exception;
  var ErrorHandleAction: TZErrorHandleAction);
begin
  Memo1.Lines.Add(e.Message);
  ErrorHandleAction := eaSkip ;
end;

end.
