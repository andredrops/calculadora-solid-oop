unit uView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCalculadora, Vcl.StdCtrls, Vcl.NumberBox, uDividir;

type
  TForm4 = class(TForm)
    edtNumero1: TNumberBox;
    edtNumero2: TNumberBox;
    Button1: TButton;
    cbOperacao: TComboBox;
    lblResultado: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FCalculadora: TCalculadora;
    FOperacao: IOperacao;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses uSomar, uCalculadoraFactory;

procedure TForm4.Button1Click(Sender: TObject);
begin

  try
    FOperacao := TCalculadoraFactory.New().GetOperacao(cbOperacao);
    lblResultado.Caption := FCalculadora.Calcular(FOperacao,edtNumero1.Value,edtNumero2.Value);
  except
    on E:exception do
      ShowMessage('Erro: ' + E.Message);
  end;

end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FCalculadora := TCalculadora.Create;
  TCalculadoraFactory.New().PopularCombo(cbOperacao);
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCalculadora);
end;

end.
