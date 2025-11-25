unit uCalculadoraFactory;

interface

uses
  Vcl.StdCtrls, uCalculadora;

type
  TOperacaoWrap = class
  private
  public
    Operacao: IOperacao;
    constructor create(const AOperacao: IOperacao);
  end;

  TCalculadoraFactory = Class
  private

  public
    procedure PopularCombo(const AComboBox: TComboBox);
    function GetOperacao(const AComboBox: TComboBox): IOperacao;

    class function New(): TCalculadoraFactory;
  End;

implementation

{ TCalculadoraFactory }

uses uDividir, uSomar;

function TCalculadoraFactory.GetOperacao(const AComboBox: TComboBox): IOperacao;
var
  LOperacaoWrap: TOperacaoWrap;
begin
  LOperacaoWrap := TOperacaoWrap(AComboBox.Items.Objects[AComboBox.ItemIndex]);

  Result := LOperacaoWrap.Operacao;
end;

class function TCalculadoraFactory.New: TCalculadoraFactory;
begin
  Result := TCalculadoraFactory.Create;
end;

procedure TCalculadoraFactory.PopularCombo(const AComboBox: TComboBox);
begin
  AComboBox.Clear;
  AComboBox.AddItem('+', TOperacaoWrap.create(TSomar.Create));
  AComboBox.AddItem('-', nil);
  AComboBox.AddItem('/', TOperacaoWrap.create(TDividir.Create));
  AComboBox.AddItem('*', nil);
  AComboBox.ItemIndex := 0;
end;

{ TOperacaoWrap }

constructor TOperacaoWrap.create(const AOperacao: IOperacao);
begin
  Operacao := AOperacao;
end;

end.
