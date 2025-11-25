program CalculadoraSOLID;

uses
  Vcl.Forms,
  uView in 'uView.pas' {Form4},
  uCalculadora in 'uCalculadora.pas',
  uSomar in 'uSomar.pas',
  uDividir in 'uDividir.pas',
  uValidarDividir in 'uValidarDividir.pas',
  uCalculadoraFactory in 'uCalculadoraFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
