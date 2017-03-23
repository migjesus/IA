estado_inicial(e([
          v(var(1),[4,5,6,7,8,9],_),
          v(var(2),[4,5,6,7,8,9],_),
          v(var(3),[4,5,6,7,8,9],_),
          v(var(4),[4,5,6,7,8,9],_),
          v(var(5),[4,5,6,7,8,9],_),
          v(var(6),[4,5,6,7,8,9],_),
          v(opr(1),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(2),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(3),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(4),[soma,subtracao,multiplicacao,divisao],_)
          ],[])).

%Restriçoes.
ve_restricoes(e(Vni,Vi)):-
	dif(Vi),
	testar(Vi,15,24).
%Dif.
dif(Vi):-
	\+ (member(v(var(X),_,Vx),Vi),
	member(v(var(Y),_,Vy),Vi),
	X \= Y,
	Vx=Vy).
	
%testar ops.
testar(Vi,ResL1,ResL2):-
	length(Vi,X),X<10.
testar(Vi,ResL1,ResL2):- 
	%Primeira linha
	member(v(var(1),_,A),Vi),
	member(v(var(2),_,B),Vi),
	member(v(var(3),_,C),Vi),
	member(v(opr(1),_,Op1),Vi),
	member(v(opr(2),_,Op2),Vi),
	%Segunda linha 
	member(v(var(4),_,D),Vi),
	member(v(var(5),_,E),Vi),
	member(v(var(6),_,F),Vi),
	member(v(opr(3),_,Op3),Vi),
	member(v(opr(4),_,Op4),Vi),
	
	teste(A,B,C,Op1,Op2,ResL1),
	teste(D,E,F,Op3,Op4,ResL2).

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

