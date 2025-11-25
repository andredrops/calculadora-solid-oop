unit uSomar;

interface

uses uCalculadora;

type
  TSomar = class(TInterfacedObject, IOperacao)
  private
    function Executar(const ANumero1, ANumero2: Double): Double;
    function GetValidar(): IValidar;
  public

  end;

implementation


{ TSomar }

function TSomar.Executar(const ANumero1, ANumero2: Double): Double;
begin
  Result := ANumero1 + ANumero2;
end;

function TSomar.GetValidar: IValidar;
begin
  Result := nil;
end;

end.
