%prolog

%Exerc�cio 1
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

%Exerc�cio 2
primeiro([F | _], F).

extremos([], []) :- !.
extremos([_|[]], []) :- !.
extremos(L, E) :- primeiro(L, P), last(L, U), append([P], [U], E).

%Exerc�cio 3
%Um meg�metro tem desregulagem. Uma cron�metro apresenta tempo errado. Tremor e
%tranco indicam desregulagem e tempo errado indica descalibragem. Calibra��o
%corrige tempo errado, ajuste fino corrige tremor e alinhamento corrige tranco.
%Se um equipamento tem um problema e um determinado procedimento elimina este
%problema, ent�o aquele equipamento necessita do procedimento mencionado. Um
%procedimento elimina um problema quando este procedimento corrige um ind�cio e
%este ind�cio indica aquele problema. Um equipamento tem um problema quando este
%equipamento apresenta um ind�cioe este ind�cio indica aquele problema.

tem(meg�metro, desregulagem).
apresenta(cronometro, tempoErrado).

indica(tremor, desrregulagem).
indica(tranco, desrregulagem).
indica(tempoErrado, descalibragem).

corrige(calibra��o, tempoErrado).
corrige(ajusteFino, tremor).
corrige(alinhamento, tranco).

necessita(Equipamento, Problema) :- !.
