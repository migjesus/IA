estado_inicial(e([
          v(var(1),[1,2,3,4,5,6,7,8,9],_),
          v(var(2),[1,2,3,4,5,6,7,8,9],_),
          v(var(3),[1,2,3,4,5,6,7,8,9],_),
          v(var(4),[1,2,3,4,5,6,7,8,9],_),
          v(var(5),[1,2,3,4,5,6,7,8,9],_),
          v(var(6),[1,2,3,4,5,6,7,8,9],_),
          v(opr(1),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(2),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(3),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(4),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(5),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(6),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(7),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(8),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(9),[soma,subtracao,multiplicacao,divisao],_),
          v(opr(10),[soma,subtracao,multiplicacao,divisao],_)],[v(var(7),[1,2,3,4,5,6,7,8,9],1),
          v(var(8),[1,2,3,4,5,6,7,8,9],2),
          v(var(9),[1,2,3,4,5,6,7,8,9],3)])).


%Restriçoes.
ve_restricoes(e(Vni,Vi)):-
	dif(Vi),
	testar(Vi,15,24,12,15,18).
%Dif.
dif(Vi):-
	\+ (member(v(var(X),_,Vx),Vi),
	member(v(var(Y),_,Vy),Vi),
	X \= Y,
	Vx=Vy).
	
%testar ops.
testar(Vi,ResL1,ResL2,ResC1,ResC2,ResC3):-
	length(Vi,X),X<19.
testar(Vi,ResL1,ResL2,ResC1,ResC2,ResC3):- 
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

	%Primeira coluna
	member(v(var(7),_,G),Vi),
	member(v(opr(5),_,Op5),Vi),
	member(v(opr(6),_,Op6),Vi),
	
	%Segunda coluna
	member(v(var(8),_,H),Vi),
	member(v(opr(7),_,Op7),Vi),
	member(v(opr(8),_,Op8),Vi),

	%Terceira coluna
	member(v(var(9),_,I),Vi),
	member(v(opr(9),_,Op9),Vi),
	member(v(opr(10),_,Op10),Vi),


	teste(A,B,C,Op1,Op2,ResL1),
	teste(D,E,F,Op3,Op4,ResL2),
	teste(G,A,D,Op5,Op6,ResC1),
	teste(H,B,E,Op7,Op8,ResC2),
	teste(I,C,F,Op9,Op10,ResC3).


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

