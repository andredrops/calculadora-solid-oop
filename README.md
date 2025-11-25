📘 Calculadora SOLID em Delphi

Este projeto demonstra como aplicar SOLID na prática utilizando uma calculadora simples em Delphi.

Foram implementadas:

✔ TSomar → operação sem validação
✔ TDividir → operação com validação (divisor ≠ 0)

🔧 Exercício sugerido: implementar as classes
> TSubtrair
> TMultiplicar

🧠 Arquitetura Geral
View (Form)
   ↓ seleciona operação
TCalculadoraFactory
   ↓ retorna IOperacao
IOperacao
   ↓ fornece seu validador (IValidador)
TCalculadora
   ↓ valida e executa
Resultado (ou Exception)

Cada peça tem uma responsabilidade clara e única.


🧩 Aplicação do SOLID na prática
A seguir, cada letra do SOLID com explicação simples e a ligação exata com o código do projeto.

✔ S — Single Responsibility Principle (Responsabilidade Única)
> Cada classe faz APENAS uma coisa:

TSomar → regra de soma
TDividir → regra de divisão
TValidadorDivisao → valida divisor zero
TCalculadora → orquestra operação + validação
TCalculadoraFactory → monta o ComboBox com operações

📍 Onde isso aparece no projeto:
Cada unit (uSomar, uDividir, uCalculadora, uCalculadoraFactory) tem apenas um motivo para existir.

✔ O — Open/Closed Principle (Aberto para extensão, Fechado para modificação)
>Você pode adicionar uma nova operação sem alterar nada no que já existe.

Exemplo: TRaizQuadrada

Basta criar:

TRaizQuadrada = class ...
Se necessário: TValidadorRaizQuadrada
Nenhuma classe precisa ser modificada:

❌ não edita TCalculadora
❌ não edita TSomar
❌ não edita TDividir
❌ não edita validadores existentes

📍 Onde isso aparece no projeto:
IOperacao.GetValidar permite que a operação indique seu próprio validador.

✔ L — Liskov Substitution Principle (Substituição de Liskov)
>Qualquer operação deve funcionar no lugar da outra:

FOperacao := TSomar.Create;
FOperacao := TDividir.Create;

Ambas funcionam porque seguem IOperacao.

📍 Onde isso aparece no projeto:
TCalculadora.Calcular nunca sabe qual classe concreta está recebendo — só usa a interface.

✔ I — Interface Segregation Principle (Segregação de Interfaces)
>Interfaces pequenas e específicas:

IOperacao → calcula
IValidador → valida

Nenhuma operação é obrigada a validar se não precisar.

📍 Onde isso aparece:

TSomar.GetValidar → retorna nil
TDividir.GetValidar → retorna seu validador específico

✔ D — Dependency Inversion Principle (Inversão de Dependência)
>O sistema depende de interfaces, não de implementações concretas.

📍 Onde isso aparece:
TCalculadora.Calcular recebe apenas:
IOperacao, Double, Double

E a validação também é interface (IValidador).

🧪 Funcionalidades implementadas
✔ Soma

Sem regras extras.

✔ Divisão

Validação:  divisor não pode ser 0 = gera exception
view captura e exibe a mensagem ao usuário

🎓 Exercício para estudo

Implemente:

TSubtrair
TMultiplicar

Passos:

- Criar classe implementando IOperacao
- Retornar nil em GetValidar
- Adicionar na TCalculadoraFactory.PopularCombo

⚠️ Boas práticas com Exceptions (como aplicado aqui)
✔ 1. A operação ou o validador deve gerar a exception

Exemplo simplificado:

if ANumero2 = 0 then
  raise Exception.Create('Não é possível dividir por zero.');

✔ 2. A Calculadora nunca exibe mensagem

Ela só:
- pergunta pelo validador
- valida
- executa
- retorna o resultado

✔ 3. A View (Form) é responsável pelo feedback visual

Exemplo:

try
  lblResultado.Caption := FCalculadora.Calcular(FOperacao, N1, N2);
except
  on E: Exception do
    ShowMessage('Erro: ' + E.Message);
end;

🎯 Resultado:

-Domínio não tem dependência de UI
-UI não sabe como funciona a lógica
-Cada camada tem um papel claro (SRP + DIP)

📦 Tecnologias utilizadas

-Delphi OOP
-Interfaces
-Factory Method simples
-Aplicação de SOLID

🚀 Como executar

-Abra o projeto no Delphi
-Execute a aplicação
-Escolha a operação no ComboBox
-Digite dois números
-Clique em Calcular
