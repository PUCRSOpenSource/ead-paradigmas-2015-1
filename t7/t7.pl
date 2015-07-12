%prolog
:-
	nl,
	write('+------------------------------------------------------------+'),nl,
	write('|          Paradigmas das Linguagens de Programação          |'),nl,
	write('|                       Semestre: 2015/1                     |'),nl,
	write('|                 Alunos: Diego Pinto da Jornada             |'),nl,
	write('|                                   e                        |'),nl,
	write('|                       Milton Caetano De Oliveira           |'),nl,
	write('+------------------------------------------------------------+'),nl,
	write('+==================INSTRUÇÕES DE USO=========================+'), nl,
	write('|      Cadastro e movimentação de bules na UmNoveNove        |'), nl,
	write('|      Para executar a primeira vez, digite na consulta:     |'), nl,
	write('|                     ?- inicio.                             |'), nl,
	write('| Para executar a segunda vez em diante, digite na consulta: |'), nl,
	write('|                     ?- controle.                           |'), nl,
	write('+============================================================+'), nl.

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
	write('[3] Vender'),  nl,
	write('[4] Enviar'),  nl,
	write('[5] Estoque'), nl,
	write('[6] Balanço'), nl,
	write('[7] Análise'), nl,
	write('[0] Sair e gravar'), nl,
	write('Informe a operação: '),
	read(Op),
	write('===================================='), nl,
	executa(Op),!. 

executa(1) :-
	write('Informe o código da filial: '),read(C), nl,
	write('Informe o estoque inicial: '), read(E), nl,
	not(filial(C,_)),
	(
		assert(filial(C, E)),
		write('Filial Cadastrada com Sucesso.'), nl,
		controle
	)
	|
	write('Filial Já Cadastrada'), nl, controle.
	
executa(2) :-
	write('Informe o código da filial: '), read(C), nl,
	write('Informe a quantidade de bules a serem compradas: '), read(Q), nl,
	filial(C,_),
	(
		assert(compra(C,Q)),
		filial(C,A), 
		E is A + Q,
		retract(filial(C,A)),
		assert(filial(C,E)),
		write('Compra realizada com sucesso'), nl, controle
	)
	|
	write('Filial Não Cadastrada!'), nl, controle.

executa(3) :-
	write('Informe o código da filial: '), read(C), nl,
	write('Informe a quantidade de bules a serem vendidas: '), read(Q), nl,
	filial(C,_),
	(
		assert(venda(C,Q)),
		filial(C,A), E is A - Q,
		retract(filial(C,A)),
		assert(filial(C,E)),
		write('Venda realizada com sucesso'), nl, controle
	)
	|
	write('Filial Não Cadastrada!'), nl, controle.

executa(4) :-
	write('Informe o código da filial de origem do envio: '),  read(Origem),  nl,
    write('Informe o código da filial de destino do envio: '), read(Destino), nl,
	write('Informe a quantidade de bules a serem enviadas: '), read(Quantia), nl,
	filial(Origem,_),filial(Destino,_),
	(
		assert(envio(Origem, Destino, Quantia)),
		retract(filial(Origem,OrigemQ)),
		retract(filial(Destino, DestinoQ)),
		QOrigem  is OrigemQ-Quantia,
		QDestino is DestinoQ+Quantia,
		assert(filial(Origem, QOrigem)),
		assert(filial(Destino, QDestino)),
		write('Envio realizado com sucesso'), nl, controle
	)
	|
	write('Filial de destino ou de origem não cadastrada!'), nl, controle.

executa(5) :-
	write('Informe o código da filial: '), read(C), nl,
	filial(C,_),
	(
		filial(C,E),
		write('O Estoque da Filial '),
		write(C), write(' é: '), write(E), nl, controle
	)
	|
	write('Filial não cadastrada'), nl, controle.

executa(6) :-
	write('Informe o código da filial: '), read(C), nl,
	filial(C,_),
	(
		filial(C,E),
		findall(vendeu(X), venda(C,X),Vendeu),
		findall(comprou(X), compra(C,X),Comprou),
		findall(recebeu(F,X), envio(F,C,X),Recebeu),
		findall(enviou(F,X), envio(C,F,X),Enviou),
		write('O Estoque da Filial '),
		write(C), write(' é: '), write(E), nl,
		write('=============================='),nl,
		write('------------Vendas------------'),nl,
		write(Vendeu),nl,
		write('=============================='),nl,
		write('------------Compras-----------'),nl,
		write(Comprou),nl,
		write('=============================='),nl,
		write('-Recebimentos(DeQuem, Quanto)-'),nl,
		write(Recebeu),nl,
		write('=============================='),nl,
		write('----Envios(PraQuem,Quanto)----'),nl,
		write(Enviou),nl,
		write('=============================='),nl, controle
	)
	|
	write('Filial não cadastrada'), nl, controle.

executa(7) :-
	analisa.

executa(0) :-
	write('Informe o nome do arquivo entre apóstrofos: '),read(File),nl,
	open(File,write,Stream),
	forall(
			filial(C,E),
			(
				writeq(Stream,filial(C,E)),
				put(Stream,'.'),
				nl(Stream)
			)
		),
	forall(
			compra(C,E),
			(
				writeq(Stream,filial(C,E)),
				put(Stream,'.'),
				nl(Stream)
			)
		),
	forall(
			venda(C,E),
			(
				writeq(Stream,filial(C,E)),
				put(Stream,'.'),
				nl(Stream)
			)
		),
	forall(
			envio(O, D, Q),
			(
				writeq(Stream,envio(O, D, Q)),
				put(Stream,'.'),
				nl(Stream)
			)
		),
	close(Stream), !.

executa(_) :- 
	write('Operação inexistente'),
	nl, controle.

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
	findall(Estoque,filial(_,Estoque),L),media(L,M),
	write('A média é: '),write(M), nl,
	analisa.

analisa(2) :- % Códigos e estoques das filiais com estoque maior que um dado valor
	write('Informe Valor: '), read(V), nl,
	findall(filial(F,T),(filial(F,T), T>V),L),
	write(L),nl,
	analisa.

analisa(3) :- % Diferença (total dos compras menos total dos vendas)
	findall(C,compra(_,C),L),soma(L,Compra),
	findall(V,venda(_,V),L),soma(L,Venda),
	Dif is Compra - Venda,
	write('Diferença: '), write(Dif), nl,
	analisa.

analisa(4) :- % Estoque total
	findall(Estoque,filial(_,Estoque),L),soma(L,S),
	write('Estoque total: '),write(S), nl,
	analisa.

analisa(0) :- % Voltar
	controle.

soma([],0).
soma([C|R],Total) :-
	soma(R,TR),
	Total is C + TR.

media([],0) :- !.
media(L,M) :- soma(L,S), length(L,T), M is S / T.
