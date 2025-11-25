unit uDividir;

interface

uses uCalculadora, uValidarDividir;

type
  TDividir = class(TInterfacedObject, IOperacao)
  private
    function Executar(const ANumero1, ANumero2: Double): Double;
    function GetValidar(): IValidar;
  public

  end;

implementation

{ TDividir }

function TDividir.Executar(const ANumero1, ANumero2: Double): Double;
begin
  Result := ANumero1 / ANumero2;
end;

function TDividir.GetValidar: IValidar;
begin
  Result := TValidarDividir.Create;
end;

end.
