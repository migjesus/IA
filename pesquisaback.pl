%Trabalho realizado por: David Parreira – 33257 Miguel Jesus – 36926.
p(A,T):-
	estado_inicial(E0), 
	statistics(runtime, [T0|_]), 
	back(E0,A), 
	statistics(runtime, [T1|_]),
	T is T1 - T0.


back(e([],A),A).
back(E,Sol):- sucessor_fw(E,E1), ve_restricoes(E1),
                          back(E1,Sol).

sucessor(e([v(N,D,V)|R],E),e(R,[v(N,D,V)|E])):- member(V,D).

sucessor_fw(e([v(N,D,V)|R],E),e(R1,[v(N,D,V)|E])):- member(V,D), cut_value(R,V,R1).

cut_value([],_,[]).
cut_value([v(N,D,V)|R],soma,[v(N,D,V)|R]).
cut_value([v(N,D,V)|R],subtracao,[v(N,D,V)|R]).
cut_value([v(N,D,V)|R],multiplacacao,[v(N,D,V)|R]).
cut_value([v(N,D,V)|R],divisao,[v(N,D,V)|R]).
cut_value([v(N,D,V)|R],Val,[v(N,D1,V)|R1]):-
	delete(D,Val,D1),
	cut_value(R,Val,R1).
