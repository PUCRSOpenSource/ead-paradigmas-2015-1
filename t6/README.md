Enunciado T6
=================
##Construa uma base PROLOG que permita as seguintes consultas

1. Dada uma lista L, define-se M como a média dos valores numéricos de L
   descartando-se seus dois maiores elementos. A média M de L será zero se ela
   tiver menos de dois elementos. Exemplo de consulta:

   ```prolog
   ?- mediaListaDescarta2Maiores([1,5,2,7,3],M).
   M = 2.
   ```


2. Dada uma lista L, constitui-se a lista R somente dos dois elementos extremos
   (o primeiro e o último) de L. Se L tiver menos de dois elementos R será
   vazia.  Exemplo de consulta:

	```prolog
   ?- doisExtremos([1,2,3,4], R).
   R = [1, 4].
	```
3. Um megâmetro tem desregulagem. Uma cronômetro apresenta tempo errado. Tremor
   e tranco indicam desregulagem e tempo errado indica descalibragem. Calibração
   corrige tempo errado, ajuste fino corrige tremor e alinhamento corrige
   tranco. Se um equipamento tem um problema e um determinado procedimento
   elimina este problema, então aquele equipamento necessita do procedimento
   mencionado. Um procedimento elimina um problema quando este procedimento
   corrige um indício e este indício indica aquele problema. Um equipamento tem
   um problema quando este equipamento apresenta um indício e este indício
   indica aquele problema.

   ```prolog
   ?- tem(cronômetro,Oque).
   Oque = descalibragem.

   ?-necessita(megâmetro,Oque).
   Oque = ajusteFino ;
   Oque = alinhamento ;
   false.

   ?-elimina(Procedimento,Problema).
   Procedimento = calibração,
   Problema = descalibragem ;
   Procedimento = ajusteFino,
   Problema = desregulagem ;
   Procedimento = alinhamento,
   Problema = desregulagem.
   ```


Na base Prolog construída não são permitidos os fatos:

	```prolog
	elimina(calibração,descalibragem).
	elimina(ajustefino,desregulagem).
	elimina(alinhamento,desregulagem).
	tem(cronômetro,descalibragem).
	necessita(megâmetro,ajusteFino).
	necessita(megâmetro,alinhamento).
	necessita(cronômetro,calibração).
	```

