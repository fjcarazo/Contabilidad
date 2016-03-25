unit T3Libraries;

interface

Uses forms,SysUtils,ifps3,ifpidelphi,ifpidelphiruntime,ifpscomp;

Procedure RegisterT3LibR(Sender:TIFPSExec);
Procedure RegisterT3LibC(Sender: TIFPSPascalCompiler);

implementation

uses Main      ;

Procedure SelectSetofBooks;
begin
  fmMain.FileOpenClick(application);
end;

Procedure SelectBatch;
begin
  fmMain.InputBatchEntryClick(application);
end;


Procedure RegisterT3LibR;
begin
  RegisterDelphiFunctionR(Sender, @SelectSetofBooks,UpperCase('SelectSetofBooks'), cdRegister);
  RegisterDelphiFunctionR(Sender, @SelectBatch,UpperCase('SelectBatch'), cdRegister);
end;

Procedure RegisterT3LibC;
begin
  RegisterDelphiFunctionC(Sender, 'Procedure SelectSetofBooks;');
  RegisterDelphiFunctionC(Sender, 'Procedure SelectBatch;');

end;

end.
