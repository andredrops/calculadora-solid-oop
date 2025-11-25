unit uCalculadora;

interface

type
  IValidar = interface
    function Validar(const ANumero1, ANumero2: Double): IValidar;
  end;

  IOperacao = interface
    function Executar(const ANumero1, ANumero2: Double): Double;
    function GetValidar(): IValidar;
  end;

  TCalculadora = class
  private

  public
    function Calcular(const AOperacao: IOperacao;
                      const ANumero1, ANumero2: Double): string;
  end;

implementation

uses
  System.SysUtils;

{ TCalculadora }

function TCalculadora.Calcular(const AOperacao: IOperacao;
                      const ANumero1, ANumero2: Double):  string;
begin

  if not Assigned(AOperacao) then
    Raise Exception.Create('Essa Operação não está disponivel nessa versão.');

  if Assigned(AOperacao.GetValidar) then
    AOperacao.GetValidar.Validar(ANumero1, ANumero2);

  Result :=  FormatFloat('#,#0.00', AOperacao.Executar(ANumero1, ANumero2))

end;

end.
