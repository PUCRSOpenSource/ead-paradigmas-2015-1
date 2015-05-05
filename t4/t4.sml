(*ALUNOS: Diego Jornada, Milton Caetano*)
fun sum	[]		=	0	| 
	sum	(h::t) 	= 	h + sum t;
	
fun len		[]	=	0	|
	len	(h::t)	=	1 + len t;
 	
fun mediaListaSemPares	[]			= 0.0	| 
	mediaListaSemPares	umaLista	=
  let
  	val l = List.filter(fn x => x mod 2 <> 0) umaLista
  in
  	if len l > 0	then real(sum l) / real(len l)
					else 0.0
  end;
 
fun findBigger(a, []) 		=	[]	| 
	findBigger(a, (h::t)) 	=
  if	a > h	then h::(findBigger(a, t))
				else a::(findBigger(h, t));

fun listaSemMaior []		= nil	| 
	listaSemMaior (h::t)	= findBigger(h, t);
	 
fun	espelhaDobraLista []		=	[]	|
	espelhaDobraLista umaLista	=	(rev umaLista) @ umaLista;
 
fun	removeHead []		=	nil	|
	removeHead	(h::t)	=	t;

fun removeTail	[]			=	nil	|
	removeTail	(h::nil)	=	[]	|
	removeTail	(h::t)		=	h::removeTail(t);
	
fun semDoisExtremos	[]		= 	nil	| 
	semDoisExtremos	umaLista	=	removeHead(removeTail(umaLista));