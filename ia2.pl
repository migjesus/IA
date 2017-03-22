estado_inicial(e([
          v(var_1,[1,2,3,4,5,6,7,8,9],_),
          v(var_2,[1,2,3,4,5,6,7,8,9],_),
          v(var_3,[1,2,3,4,5,6,7,8,9],_),
          v(op_1,[soma,subtracao,multiplicacao,divisao],_),
          v(op_2,[soma,subtracao,multiplicacao,divisao],_)],[])).

%Restriçoes.
ve_restricoes(e(Vni,Vi)):-
	member(v(var_1,_,V1),Vi),
	member(v(var_2,_,V2),Vi),
	member(v(var_3,_,V3),Vi),
	member(v(op_1,_,Op1),Vi),
	member(v(op_2,_,Op2),Vi),
	val_dif([V1,V2,V3]),
	testar(V1,V2,V3,Op1,Op2,15).


%valores diferentes.   
val_dif([]).
val_dif([H|T]):-
	nao_duplicado(H,T),
	val_dif(T).

nao_duplicado(X,[]).
nao_duplicado(X,[H|T]):-
	\+(X=H),
	nao_duplicado(X,T).

%testar ops.
testar(A,B,C,Op1,Op2,Res):- teste(A,B,C,Op1,Op2,Res).

teste(A,B,C,soma,soma,Res):- Res is A+B+C.
teste(A,B,C,soma,subtracao,Res):- Res is A+B-C.
teste(A,B,C,soma,multiplicacao,Res):- Res is A+B*C.
teste(A,B,C,soma,divisao,Res):- Res is A+B/C.	
teste(A,B,C,subtracao,soma,Res):- Res is A-B+C.
teste(A,B,C,subtracao,subtracao,Res):- Res is A-B-C.
teste(A,B,C,subtracao,multiplicacao,Res):- Res is A-B*C.
teste(A,B,C,subtracao,divisao,Res):- Res is A-B/C.
teste(A,B,C,multiplicacao,soma,Res):-Res is A*B+C.
teste(A,B,C,multiplicacao,subtracao,Res):- Res is A*B-C.
teste(A,B,C,multiplicacao,multiplicacao,Res):- Res is A*B*C.
teste(A,B,C,multiplicacao,divisao,Res):- Res is A*B/C.
teste(A,B,C,divisao,soma,Res):- Res is A/B+C.
teste(A,B,C,divisao,subtracao,Res):- Res is A/B-C.
teste(A,B,C,divisao,multiplicacao,Res):- Res is A/B*C.
teste(A,B,C,divisao,divisao,Res):- Res is A/B/C.			

