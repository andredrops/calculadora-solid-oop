unit uValidarDividir;

interface

uses uCalculadora;

type
  TValidarDividir = class(TInterfacedObject, IValidar)
  private
    function Validar(const ANumero1, ANumero2: Double): IValidar;
  public

  end;

implementation

uses
  System.SysUtils;

{ TValidarDividir }

function TValidarDividir.Validar(const ANumero1, ANumero2: Double): IValidar;
begin
  Result := Self;

  if ANumero2 = 0 then
    raise Exception.Create('Error: ' + 'Não é possivel divisão por zero!');

end;

end.
