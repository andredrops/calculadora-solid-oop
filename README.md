🧩 Sobre o Projeto

Este projeto foi criado para demonstrar, na prática, como aplicar os princípios SOLID em Delphi usando uma calculadora simples.

A ideia é manter o código:

Extensível (fácil de adicionar novas operações)

Organizado (cada classe fazendo apenas o que deve fazer)

Didático (ideal para estudo e treino)

Foram criadas apenas duas operações:

TSomar → exemplo de operação sem validação

TDividir → exemplo de operação com validação (divisor ≠ 0)

👉 Como exercício, você pode implementar:

TSubtrair

TMultiplicar

🧠 Arquitetura Geral

A estrutura final ficou assim:

View (Form)
   ↓ cria
TCalculadoraFactory
   ↓ retorna
IOperacao (TSomar, TDividir, ...)
   ↓ informa seu
IValidador (ou nil)
   ↓ executado por
TCalculadora


Cada peça tem uma responsabilidade única e clara.

🧱 Aplicação Prática do SOLID (simples e direto)

Aqui está a relação entre cada letra do SOLID e o projeto, com explicações curtas e os pontos exatos onde isso aparece no código.

✔ S – Single Responsibility Principle (Responsabilidade Única)

Cada classe faz uma única coisa:

TSomar → soma dois números

TDividir → divide dois números

TValidadorDivisao → apenas valida divisor zero

TCalculadora → apenas orquestra (validar + calcular)

TCalculadoraFactory → apenas cria/prepara operações para a view

👉 Onde ver isso no projeto:
Cada unidade (uSomar, uDividir, uCalculadora, uCalculadoraFactory) contém apenas uma responsabilidade central.

✔ O – Open/Closed Principle (Aberto para extensão, Fechado para modificação)

Você pode adicionar novas operações sem alterar classes existentes.

Exemplo: adicionar TRaizQuadrada no futuro.
Para isso, basta criar:

Nova classe: TRaizQuadrada

Novo validador (se necessário)

E nada muda em:

TCalculadora

TSomar

TDividir

TCalculadoraFactory (se usar registro automático)

👉 Onde ver isso no projeto:
O método TRaizQuadrada.GetValidador informaria seu próprio validador.
A Calculadora não sabe quais operações existem — apenas executa a interface IOperacao.

✔ L – Liskov Substitution Principle (Substituição de Liskov)

Qualquer operação deve funcionar no lugar de outra.

Exemplo:

FOperacao := TSomar.Create;
FOperacao := TDividir.Create;


Ambas funcionam porque implementam IOperacao.

👉 Onde ver isso no projeto:
A Calculadora chama sempre:

AOperacao.Executar(AN1, AN2);


e isso funciona para qualquer operação.

✔ I – Interface Segregation Principle (Segregação de Interface)

Interfaces são pequenas e específicas:

IOperacao → calcula
IValidador → valida


Não existe uma interface gigante obrigando todas as operações a terem métodos de validação, impressão, logs, etc.

👉 Onde ver isso no projeto:
TSomar.GetValidar → retorna nil (não precisa validar)
TDividir.GetValidar → retorna TValidadorDivisao

Cada classe usa apenas o que precisa.

✔ D – Dependency Inversion Principle (Inversão de Dependência)

A Calculadora depende de abstrações (interfaces), não de classes concretas.

Ela não sabe:

se é soma, divisão, multiplicação, raiz…

se existe validador ou não

Ela só usa:

IOperacao
IValidador


👉 Onde ver isso no projeto:
O método:

function TCalculadora.Calcular(...)


Trabalha apenas com interfaces.

🧪 Funcionalidades Implementadas
✔ SOMAR

Simples, sem nenhuma validação.

✔ DIVIDIR

Inclui validação específica:

divisor ≠ 0

se inválido → lança exception tratada na view

🎓 Exercício Proposto (para estudo)

Implemente as classes:

TSubtrair

TMultiplicar

Cada uma com:

implementação de IOperacao

GetValidar retornando nil

registro na TCalculadoraFactory.PopularCombo

Após isso, o ComboBox passa a permitir escolher as novas operações automaticamente.

🚀 Como rodar

Abra o projeto no Delphi

Execute o formulário principal

Escolha a operação no ComboBox

Informe dois números

Clique em “Calcular”

A view cuida apenas de:

escolher operação

exibir resultado

tratar exceções com ShowMessage

Toda a lógica SOLID fica nos objetos.

📦 Tecnologias e padrões usados

Delphi VCL

Interfaces

Factory Method (simples)

Encapsulamento

Abstração

SOLID aplicado na prática
