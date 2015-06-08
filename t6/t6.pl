%prolog

%Exercício 1
soma([],0).
soma([X|R],T) :-	soma(R,TR), T is TR + X.

media([],0) :- !.
media(L,M) :- soma(L,S), length(L,T), M is S / T.

remove2Ult([], []) :- !.
remove2Ult([_,_| []], []) :- !.
remove2Ult([H|T], L) :- remove2Ult(T, L1), append([H], L1, L).

mediaSem2Maiores([], 0) :- !.
mediaSem2Maiores([_,_| [] ], 0) :- !.
mediaSem2Maiores([_|[] ], 0) :- !.
mediaSem2Maiores(L, M) :- msort(L,L1), remove2Ult(L1, L2), media(L2,M).

%Exercício 2
primeiro([F | _], F).

extremos([], []) :- !.
extremos([_|[]], []) :- !.
extremos(L, E) :- primeiro(L, P), last(L, U), append([P], [U], E).



/****************************************
12) Dados dois números, verificar se o maior é múltiplo do menor.
*****************************************/

multiplo(A,B) :- (A > B, Maior is A | Maior is B),
Menor is A + B - Maior, R is Maior mod Menor, R = 0.

/****************************************
13) Verificar se um retângulo (com conhecidas base e altura) tem área menor que uma determinada área.
*****************************************/

areaRetangulo(Base,Altura,Area) :- Area is Base * Altura.

areaRetMenor(Base,Altura,AreaMaxima) :-
	areaRetangulo(Base,Altura,Area),
	Area < AreaMaxima.

/****************************************
14) Remover um elemento de uma lista.
*****************************************/
remover(_, [], []).
remover(X, [X|R], R).
remover(X, [Y|C], [Y|D]) :- remover(X, C, D).

/****************************************
15) Inserir um elemento em uma lista.
*****************************************/

inserir(X, L, L1) :-	remover(X, L1, L).

/* ou */

inserir1(X, L, [X | L]).


/****************************************
16) Dada uma lista L, verificar se uma lista P é seu prefixo. Por exemplo: P = [1,2,3] é prefixo de L = [1,2,3,4,5].
*****************************************/

prefixo([],_).
/*prefixo([X],[X|_]).*/
prefixo([X|P],[X|R]) :- prefixo(P,R).

/****************************************
17) Dada uma lista L, verificar se uma lista S é seu sufixo. Por exemplo: S = [4,5] é sufixo de L = [1,2,3,4,5].
*****************************************/

sufixo([],_).
sufixo(R,[_|R]).
sufixo(S,[_|R]) :- sufixo(S,R).

/****************************************
18) Calcular a soma dos inteiros de 1 a N. Por exemplo, a soma dos inteiros de 1 a 4 é igual a 1 + 2 + 3 + 4 = 10.
*****************************************/

somaAteN(0,0) :- !.
somaAteN(N,S) :- M is N - 1, somaAteN(M,R), S is N + R.

/****************************************
20) Calcular a média de N inteiros, descartando os negativos.
*****************************************/

descartaNeg([],[]).
descartaNeg([X|R],L) :- X >= 0, descartaNeg(R,L1), append([X],L1,L), !.
descartaNeg([_|R],L) :- descartaNeg(R,L).
mediaListaDescartaNeg(L,M) :- descartaNeg(L,L1), media(L1,M).

/****************************************
21) Encontrar o maior de N números.
*****************************************/

maiorDeLista([X|[]],X) :- !.
maiorDeLista([X|R],M) :- maiorDeLista(R,MR), X > MR, M is X, !.
maiorDeLista([_|R],M) :- maiorDeLista(R,M).

/****************************************
22) Dados N elementos, retirar o último.
*****************************************/

menosUlt([],[]) :- !.
menosUlt([_|[]],[]) :- !.
menosUlt([X|R],L) :- menosUlt(R,L1), append([X],L1,L).

