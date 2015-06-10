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

%Exercício 3
%Um megâmetro tem desregulagem. Uma cronômetro apresenta tempo errado. Tremor e
%tranco indicam desregulagem e tempo errado indica descalibragem. Calibração
%corrige tempo errado, ajuste fino corrige tremor e alinhamento corrige tranco.
%Se um equipamento tem um problema e um determinado procedimento elimina este
%problema, então aquele equipamento necessita do procedimento mencionado. Um
%procedimento elimina um problema quando este procedimento corrige um indício e
%este indício indica aquele problema. Um equipamento tem um problema quando este
%equipamento apresenta um indícioe este indício indica aquele problema.

tem(megametro,desregulagem).

apresenta(cronometro,tempoErrado).

indica(tremor,desregulagem).
indica(tranco,desregulagem).
indica(tempoErrado,descalibragem).

corrige(calibracao,tempoErrado).
corrige(ajusteFino,tremor).
corrige(alinhamento,tranco).

elimina(Proc,Prob) :- corrige(Proc, X), indica(X, Prob).
necessita(Equip,Prob) :- tem(Equip, X), indica(Y, X), corrige(Prob, Y).
tem(Equip, Prob) :- apresenta(Equip, X), indica(X, Prob).
