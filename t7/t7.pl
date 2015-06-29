%prolog
:-
	nl,
	write('+------------------------------------------+'),nl,
	write('| Paradigmas das Linguagens de Programação |'),nl,
	write('|           Semestre: 2015/1               |'),nl,
	write('|     Alunos: Diego Pinto da Jornada       |'),nl,
	write('|                       e                  |'),nl,
	write('|           Milton Caetano De Oliveira     |'),nl,
	write('+------------------------------------------+'),nl,
	write('+==================INSTRUÇÕES DE USO========================+'), nl,
	write('|      Cadastro e movimentação de bules na UmNoveNove       |'), nl,
	write('|      Para executar a primeira vez, digite na consulta:    |'), nl,
	write('|                     ?- inicio.                            |'), nl,
	write('| Para executar a segunda vez em diante, digite na consulta:|'), nl,
	write('|                     ?- controle.                          |'), nl,
	write('+===========================================================+'), nl.

:- dynamic filial/2.	
:- dynamic compra/2.
:- dynamic venda/2.
:- dynamic envio/3.

inicio :-

	leArq,
	controle, !.

leArq :-
	write('Informe o nome do arquivo de dados para leitura: '),
	read(A),
	exists_file(A),
	(
		see(A),
		leitura, !
	)
	|
	write('Arquivo nao existe'), nl,
	write('O nome do arquivo deve ser digitado entre apóstrofos'),
	nl, leArq.

leitura :-
	read(Dados),
	Dados \= end_of_file,
	(
		assert(Dados),
		leitura
	)
	| seen, !.

controle :-
	write('===================================='), nl,
	write('[1] Cadastrar filial'), nl,
	write('[2] Comprar'), nl,
	write('[3] Vender'), nl,
	write('[4] Enviar'), nl,
	write('[5] Estoque'), nl,
	write('[6] Balanço'), nl,
	write('[7] Análise'), nl,
	write('[0] Sair e gravar'), nl,
	write('Informe a operação: '),
	read(Op),
	write('===================================='), nl,
	executa(Op), 
	controle.

executa(1) :-
	write('Informe o código da filial'), nl,
	read(C), nl,
	write('Informe o estoque inicial'), nl,
	read(E), nl,
	not(filial(C,_)),
	(
		assert(filial(C, E)), nl,
		write('Filial Cadastrada com Sucesso.'), nl,
		!
	)
	|
	write('Filial Já Cadastrada'), nl.
	
executa(2) :-
	write('Informe o código da filial'), nl,
	read(C), nl,
	write('Informe a quantidade de bules a serem compradas'), nl,
	read(Q), nl,
	filial(C,_),
	(
		filial(C,A), E is A + Q,
		retract(filial(C,A)),
		assert(filial(C,E)),
		write('Compra realizada com sucesso'), nl,!
	)
	|
	write('Filial Não Cadastrada!'), nl,!.

executa(3) :-
	write('Informe o código da filial'), nl,
	read(C), nl,
	write('Informe a quantidade de bules a serem vendidas'), nl,
	read(Q), nl,
	filial(C,_),
	(
		filial(C,A), E is A - Q,
		retract(filial(C,A)),
		assert(filial(C,E)),
		write('Venda realizada com sucesso'), nl,!
	)
	|
	write('Filial Não Cadastrada!'), nl,!.

executa(4) :-
	write('Ainda não é possível enviar bules'), nl,
	write('Informe o código da filial de origem do envio'), nl,
	read(CodigoFilialOrigem), nl,
    write('Informe o código da filial de destino do envio'), nl,
	read(CodigoFilialDestino), nl,
	write('Informe a quantidade de bules a serem enviadas'), nl,
	read(QuantBulesEnviadas), nl,
	envio(CodigoFilialOrigem,CodigoFilialDestino,QuantBulesEnviadas), nl,
	controle.

executa(5) :-
	write('Ainda não é possível verificar estoque'), nl,
	write('Informe o código da filial'), nl,
	read(CodigoFilial), nl,
	controle.

executa(6) :-
	write('Ainda não é possível apresentar balanço'), nl,
	write('Informe o código da filial'), nl,
	read(CodigoFilial), nl,

	controle.

executa(7) :-
	analisa.

executa(0) :-
	write('Só é possível sair, mas ainda não é possível gravar'), nl, !.

executa(_) :- 
	write('Operação inexistente'),
	nl.

analisa :-
	write('===================================='), nl,
	write('Analise'), nl,
	write('[1] Estoque médio da empresa, considerando os estoques de todas as filiais'), nl,
	write('[2] Códigos e estoques das filiais com estoque maior que um dado valor'), nl,
	write('[3] Diferença (total das compras menos total das vendas) em toda a empresa'), nl,
	write('[4] Estoque total da empresa, considerando os estoques de todas as filiais'), nl,
	write('[0] Voltar'), nl,
	write('Informe a operação: '),
	read(Op),
	write('===================================='), nl,
	analisa(Op), !.

analisa(1) :- % Média
	write('Ainda não é possível calcular a média'), nl,
	analisa.

analisa(2) :- % Códigos e estoques das filiais com estoque maior que um dado valor
	write('Ainda não é possível ver códigos e estoques das filiais com estoque maior que um dado valor'), nl,
	analisa.

analisa(3) :- % Diferença (total dos compras menos total dos vendas)
	write('Ainda não é possível calcular esta diferença'), nl,
	analisa.

analisa(4) :- % Estoque total
	write('Ainda não á possível calcular o estoque total'), nl,
	analisa.

analisa(0) :- % Voltar
	controle.

soma([],0).
soma([C|R],Total) :-
	soma(R,TR),
	Total is C + TR.
