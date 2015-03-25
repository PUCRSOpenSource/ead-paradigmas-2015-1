Enunciado T2
=================

######Considere a seguinte gramática escrita em EBNF

< bloco> ::= { < linha>+}

< linha> ::= < instrução> ;

< instrução> ::= < var> := < exp>

< var> ::= A | B | C

< exp> ::= < exp1> | < exp2>

< exp1> ::= < var> [ < op> < var> ]

< exp2> ::= < var> < op> < const>

< op> ::= + | – | * | /

< const> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

a.Desenhe a árvore de derivação para o seguinte < bloco>:

{ C := B ; A := C * 2 ; }

b. Desenhe o diagrama de sintaxe para a r egra de < exp1>

######Construa uma árvore de derivação e a s notações de prefixo e sufixo para as
expressões em infixo a seguir:

a. (3 * X) / (4 * X * Z – Y ^ 3 )
b. (((2 + X) / Y) + 2) / X
c. ((X ^ 3) ^ 3 ) ^ 3 – 2

######Escreva a notação de sufixo para a seg uinte expressão em notação de prefixo

/ + – X Y Z W 
