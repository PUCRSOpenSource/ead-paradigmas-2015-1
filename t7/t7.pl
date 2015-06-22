%posprolog
:-
	nl,
	write('+------------------------------------------+'),nl,
	write('| Paradigmas das Linguagens de Programação |'),nl,
	write('|           Semestre: 2015/1               |'),nl,
	write('|     Aluno: Diego Pinto da Jornada        |'),nl,
	write('+------------------------------------------+'),nl,
	write('+==================INSTRUÇÕES DE USO========================+'), nl,
	write('|      Cadastro e movimentação de bules na UmNoveNove       |'), nl,
	write('|      Para executar a primeira vez, digite na consulta:    |'), nl,
	write('|                     ?- inicio.                            |'), nl,
	write('| Para executar a segunda vez em diante, digite na consulta:|'), nl,
	write('|                     ?- controle.                          |'),nl,
	write('+===========================================================+'), nl.
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
	write('+============OPÇÕES==================+'), nl,
	write('|        [1] Cadastrar filial        |'), nl,
	write('|        [2] Comprar                 |'), nl,
	write('|        [3] Vender                  |'), nl,
	write('|        [4] Enviar                  |'), nl,
	write('|        [5] Estoque                 |'), nl,
	write('|        [6] Balanço                 |'), nl,
	write('|        [7] Análise                 |'), nl,
	write('|        [0] Sair e gravar           |'), nl,
	write('+====================================+'), nl,
	write('* Informe a operacao:'),	read(Op),
	executa(Op), !.

executa(1) :-
	write('Ainda não é possível cadastrar filiais'), nl,
	controle.

executa(2) :-
	write('Ainda não é possível comprar bules'), nl,
	controle.

executa(3) :-
	write('Ainda não é possível vender bules'), nl,
	controle.

executa(4) :-
	write('Ainda não é possível enviar bules'), nl,
	controle.

executa(5) :-
	write('Ainda não é possível verificar estoque'), nl,
	controle.

executa(6) :-
	write('Ainda não é possível apresentar balanço'), nl,
	controle.

executa(7) :-
	analisa.

executa(0) :-
	write('Só é possível sair, mas ainda não é possível gravar'), nl, !.

executa(_) :- % Operacao inexistente
	write('Operacao inexistente'),
	nl.

analisa :-
	write('===================================='), nl,
	write('Analise'), nl,
	write('[1] Estoque médio da empresa, considerando os estoques de todas as filiais'), nl,
	write('[2] Códigos e estoques das filiais com estoque maior que um dado valor'), nl,
	write('[3] Diferença (total das compras menos total das vendas) em toda a empresa'), nl,
	write('[4] Estoque total da empresa, considerando os estoques de todas as filiais'), nl,
	write('[0] Voltar'), nl,
	write('Informe a operacao: '),
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
	write('Ainda não é possível calcular o estoque total'), nl,
	analisa.

analisa(0) :- % Voltar
	controle.

soma([],0).
soma([C|R],Total) :-
	soma(R,TR),
	Total is C + TR.


