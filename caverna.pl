%estado inicial.
estado_inicial((2,2)).

%estado final.
estado_final((2,3)).

%tabuleiro nxn.
dimensao(5,5).

%portas bloqueadas.
porta_bloqueada((1,2),(1,3)).
porta_bloqueada((1,3),(1,2)).
porta_bloqueada((2,3),(2,2)).
porta_bloqueada((2,2),(2,3)).
porta_bloqueada((3,4),(4,4)).
porta_bloqueada((4,4),(3,4)).
porta_bloqueada((4,5),(3,5)).
porta_bloqueada((3,5),(4,5)).

%verificar se pos actual e pos final estao dentro das dimensoes do tabuleiro.
pos_validas((L,C),(Lf,Cf)):-
	dimensao(X,Y),
	X @>= L,
	Y @>= C,
	X @>= Lf,
	Y @>= Cf,
	L@>0,
	C@>0,
	Lf@>0,
	Cf@>0.

%op(Estado_act,operador,Estado_seg,Custo).
op((L,C), moveD, (Lf,Cf),1) :-
	L=Lf,
	Cf is C+1, 
	pos_validas((L,C),(Lf,Cf)),
	\+ porta_bloqueada((L,C),(Lf,Cf)).
op((L,C), moveE, (Lf,Cf),1) :-
	L=Lf,
	Cf is C-1, 
	pos_validas((L,C),(Lf,Cf)),
	\+ porta_bloqueada((L,C),(Lf,Cf)).
op((L,C), moveCima, (Lf,Cf),1) :-
	C=Cf,
	Lf is L-1, 
	pos_validas((L,C),(Lf,Cf)),
	\+ porta_bloqueada((L,C),(Lf,Cf)).
op((L,C), moveBaixo, (Lf,Cf),1) :-
	C=Cf,
	Lf is L+1,
	pos_validas((L,C),(Lf,Cf)), 
	\+ porta_bloqueada((L,C),(Lf,Cf)).
