Enunciado T7
=================

Introdução
------------

A empresa UmNoveNove  possui algu mas  filiais e deseja controlar a movimentação
de um dos seus produtos de última tecnologia: o bule. A gerência deve controlar
compras, vendas e envio(entre filiais) dos fabulosos bules.  Construa um
programa em Prolog  onde a cláusula “inicia” solicita o nome de um arquivo de
dados para fazer a leitura inicial dos dados e  a cláusula “controla” apresenta
o seguinte menu  inicial :

[1]  Cadastro de filial  
[2]  Compra de produto  
[3]  Venda de produto  
[4]  Envio de produto  
[5]  Estoque  
[6]  Balanço  
[7] Análise  
[0] Sair
  
1. Dados iniciais 

Fazem  parte da base inicial os seguintes termos que devem constar  d o
arquivo  a ser lido a partir da cláusula “inicia” 

 ```prolog
filial(0,0). 
compra(0,0).
venda(0,0).
envio(0,0,0).
 ```

Este termos devem ser lidos no início, antes de ser apresentado o menu. Eles
vão sendo ampliados à medida que ocorram  cadastros de filiais(filial) e
compras(compra ), vendas(venda) e envios(envio) de produto . Por
exemplo, se ocorrer o cadastro de duas filiais , uma com código 1 e
estoque inicial de 240 bules e outra com código 2 e estoque inicial de 100
bules , devem ser incluídos os termos 

 ```prolog
filial(1, 240).
filial(2, 100).
 ```

Se houver uma compra de 100 bules n a filial com código 1, deve ser incluído o
termo

 ```prolog
compra(1,100). 
 ```

 Se houver uma venda de 50 bules n a filial com código 1, deve ser incluído o termo

 ```prolog
venda(1,50).
 ```

Se houver um envio de 60 bules d a filial com código 1 para a filial com código 2, deve ser incluído o termo

 ```prolog
envio(1, 2, 60).
 ```

Naturalmente o s estoque s d a s filia i s deve m ser
atualizado s a cada movimentação. Por exemplo, após as movimentações
exemplificadas acima, a base deverá ficar assim:

 ```prolog
filial(0, 0).  
compra(0, 0).
venda(0, 0).
envio(0, 0, 0).
compra(1, 100).
venda(1, 50).
envio(1, 2, 60).
filial(1, 230).
filial(2, 160).
 ```

Opções do menu 
=================

1. Cadastrar filial

	Caso o usuário escolha a opção 1 (menu	inicial) , deve ser solicitado um
	código de filial e um estoque inicial. Se um a filial com aquele código não
	existir, deve ser criad a um a filial com aquele código e aquele estoque .
	Caso contrário, o usuário deve ser informado que não houve o cadastro.

2. Compra

	Caso o usuário escolha a opção 2(menu inicial), deve ser solicitado o código
	da filial e a compra(quantidade de bules a incluir no estoque desta filial).
	Se existir a filial, deve ser registrada a compra	e atualizado o estoque
	da filial.Caso contrário, o usuário deve ser informado que não houve a
	compra.

3. Venda

	Caso o usuário escolha a opção 3(menu inicial), deve ser solicitado o código
	da filial e a venda(quantidade de bules a retirar do estoque desta
	filial).Se existir a filial e houver estoque suficiente, deve ser registrada
	a venda e atualizado o  estoque da filial. Caso contrário, o usuário deve
	ser informado que não houve a venda e a razão.

4. Envio

	Caso o usuário escolha a opção 4(menu inicial), deve ser solicitado o código
	da filial de origem do envio, o código da filial que irá receber os bules e
	a quantidade de bules a enviar. Existindo as duas filiais e sendo o estoque
	da filial de origem suficiente, deve ser registrado o envio e atualizados os
	respectivos estoques. Caso contrário, o usuário deve ser informado que não
	houve o envio e a razão. Atenção: um envio é efetivado realizando-se
	simultaneamente uma venda da filial de origem e uma compra da filial de
	destino para que o controle de estoque seja viabilizado 

5. Estoque

	Caso o usuário escolha a opção 5 (menu inicial) , deve ser solicitado o
	código da filial e informado o seu estoque , se a filial existir. Se não
	existir a filial, o usuário deve ser informado.

6. Balanço

	Caso o usuário escolha a opção 6 (menu inicial) , deve ser solicitado o código
	da filial e informado o seu estoque , as compras, as vendas e as envios
	relacionados a esta filial(em qualquer ordem). Se não existir a filial, o
	usuário deve ser informado

7. Análise

	Caso o usuário escolha a opção 7 (menu inicial), deve ser apresentado o seguinte menu para as atividades de análise : 

	[1] Estoque médio da empresa, considerando os estoques de todas as filiais  
	[2] Códigos e estoques das filiais com estoque maior que um dado valor  
	[3] Diferença (total das compras menos total das vendas) em toda a empresa  
	[4] Estoque total da empresa , considerando os estoques de todas as filiais  
	[5] Voltar

	Para cada opção que o usuário escolher deve ser apresentada na tela a
	informação correspondente. Se o usuário escolher a opção 2, deve ser
	solicitado um valor(quantidade de bules). As filiais apresentadas devem ter
	estoque maior que o valor informado. Se o usuário escolher a opção 5, deve
	ser apresentado o menu inicial.
