estado_inicial((o,[((1,1),o),((1,2),vazio),((1,3),o),
					((2,1),vazio),((2,2),x),((2,3),x),
					((3,1),vazio),((3,2),vazio),((3,3),vazio)])).


terminal((V,L)):- ve_linhas(L).
terminal((V,L)):- ve_colunas(L). 
terminal((V,L)):- ve_diagonais(L).
terminal((V,L)):- cheio(L). %empate.

%função de utilidade, retorna o valor dos estados terminais, 1 ganha -1 perde.
valor((V,L),1,P):- terminal((V,L)), X is P mod 2, X=0, \+ cheio(L).
valor((V,L),-1,P):- terminal((V,L)),\+ cheio(L).
valor((V,L),0,_):- terminal((V,L)).


%operadores de estado.
%op1((O,Li),joga,(X,Lf)):-  inv(O,X),jogValida(X,Li,Lf).

op1((O,Li),joga11,(X,Lf)):- member(((1,1),vazio),Li),replace(((1,1),vazio),((1,1),O),Li,Lf),inv(O,X).
op1((O,Li),joga12,(X,Lf)):- member(((1,2),vazio),Li),replace(((1,2),vazio),((1,2),O),Li,Lf),inv(O,X).
op1((O,Li),joga13,(X,Lf)):- member(((1,3),vazio),Li),replace(((1,3),vazio),((1,3),O),Li,Lf),inv(O,X).
op1((O,Li),joga21,(X,Lf)):- member(((2,1),vazio),Li),replace(((2,1),vazio),((2,1),O),Li,Lf),inv(O,X).
op1((O,Li),joga22,(X,Lf)):- member(((2,2),vazio),Li),replace(((2,2),vazio),((2,2),O),Li,Lf),inv(O,X).
op1((O,Li),joga23,(X,Lf)):- member(((2,3),vazio),Li),replace(((2,3),vazio),((2,3),O),Li,Lf),inv(O,X).
op1((O,Li),joga31,(X,Lf)):- member(((3,1),vazio),Li),replace(((3,1),vazio),((3,1),O),Li,Lf),inv(O,X).
op1((O,Li),joga32,(X,Lf)):- member(((3,2),vazio),Li),replace(((3,2),vazio),((3,2),O),Li,Lf),inv(O,X).
op1((O,Li),joga33,(X,Lf)):- member(((3,3),vazio),Li),replace(((3,3),vazio),((3,3),O),Li,Lf),inv(O,X).




%verifica a validade da jogada.
jogValida(o,[((Xi,Yi),vazio)|T],[((Xi,Yi),o)|T]).
jogValida(x,[((Xi,Yi),vazio)|T],[((Xi,Yi),x)|T]).
jogValida(Val,[((Xi,Yi),V)|T],[((Xi,Yi),V)|T1]):- \+(V = vazio), jogValida(Val,T,T1).

%inverter jogadores.
inv(Val,Inv):-
	Val = o,
	Inv = x.
inv(Val,Inv):-
	Val = x,
	Inv = o.

%se tabuleiro cheio.
cheio(L):-
	findall(V,member(((_,_),V),L),K),
	\+ member(vazio,K).


%arranjar generalizaçao.
ve_diagonais(L):-
	member(((1,1),V1),L),
	member(((2,2),V2),L),
	member(((3,3),V3),L),
	tudoIgual([V1,V2,V3],V1).
ve_diagonais(L):-
	member(((1,3),V1),L),
	member(((2,2),V2),L),
	member(((3,1),V3),L),
	tudoIgual([V1,V2,V3],V1).

ve_linhas(L):-
	member(((1,1),V1),L),
	member(((1,2),V2),L),
	member(((1,3),V3),L),
	tudoIgual([V1,V2,V3],V1).
ve_linhas(L):-
	member(((2,1),V1),L),
	member(((2,2),V2),L),
	member(((2,3),V3),L),
	tudoIgual([V1,V2,V3],V1).
ve_linhas(L):-
	member(((3,1),V1),L),
	member(((3,2),V2),L),
	member(((3,3),V3),L),
	tudoIgual([V1,V2,V3],V1).

ve_colunas(L):-
	member(((1,1),V1),L),
	member(((2,1),V2),L),
	member(((3,1),V3),L),
	tudoIgual([V1,V2,V3],V1).
ve_colunas(L):-
	member(((1,2),V1),L),
	member(((2,2),V2),L),
	member(((3,2),V3),L),
	tudoIgual([V1,V2,V3],V1).
ve_colunas(L):-
	member(((1,3),V1),L),
	member(((2,3),V2),L),
	member(((3,3),V3),L),
	tudoIgual([V1,V2,V3],V1).

%simbolos iguais e nao vazio.
tudoIgual([],V).
tudoIgual([H|T],V):-
	H = V,
	\+ V = vazio, 
	tudoIgual(T,V).

replace(_, _, [], []).
replace(O, R, [O|T], [R|T2]) :- replace(O, R, T, T2).
replace(O, R, [H|T], [H|T2]) :- \+H=O, replace(O, R, T, T2).

