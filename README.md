## PROVA TÉCNICA


ORIENTAÇÕES:

    Deverá ser construída uma aplicação utilizando-se Visual Studio 2015 ou superior em linguagem C#.
    Crie um RPA que faça busca no site dos correios por CEP e traga o endereço do CEP pesquisado.
    Armazene esses dados em uma estrutura de dados do C# e crie uma busca para buscar os CEP já pesquisados na estrutura de dados criada.

> Importante: Não utilize APIs de pesquisa de CEP, queremos ver sua habilidade de construir um
RPA funcional.

Gostariamos de receber seu código fonte para que possamos anailizar seu desafio por completo.
 
## PASSO-A-PASSO:
    
    a. Crie uma tela que possamos inserir um CEP e execute o RPA no site dos correios.
    b. Salve os dados em sua estrutura de dados, incluindo se seu RPA apresentou erro.
    c. Exiba o resultado obtido pelo seu RPA
    d. Crie uma tela para que possa ser pesquisados os CEPs já processados pelo RPA
    e. Utilize a tecnoligia que mais lhe agrada para criar as telas necessárias para o desafio
 
O QUE SERÁ AVALIADO:

• Organização do Código
• Solução para o problema

• Capacidade de se adaptar à novas situações

• Criatividade

• Manipulação de texto, listas e conversões de tipos de dados

• Clareza nas informações

• Capricho na apresentação dos dados como, por exemplo, formatação de possíveis máscaras para CEP ou padrão único para as informações

---------------

Progresso:

- [x] Criado Web scrap para acessa o Site dos correios e obter dado
- [ ] Validar paginação no dos dados no scraper
- [X] Separa em projetos para reuso
- [x] Testar pesquisa invalida com "aaaaa"
- [X] Obter dados e manter em uma estrutura para pesquisa futura
- [ ] Persistir os dados em disco
- [ ] Criar interface grafica para utilizar o serviço
- [X] Criar uma WebApi que utilize o serviço.
- [ ] Criar App que consuma o serviço
- [ ] Configurar paths via settings.
- [ ] Tratar erros de conexao.    


## App Screens 

App developing in flutter.

![Search complete](https://i.imgur.com/sYsG2Hc.png)

![Search error text empty](https://i.imgur.com/wjlSsZx.png)

![Search on last datas error](https://i.imgur.com/M4QxiD2.png)
 
