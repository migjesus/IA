estado_inicial((1,3,4,2)).

terminal((0,0,0,0)).

%função de utilidade.
valor(E,1,P):- terminal(E), X is P mod 2, X=0,!.
valor(E,-1,_):-terminal(E).

op1((X,Y,Z,W),tira_primeira_fila,(Xf,Y,Z,W)):- 
	X=1,
	Xf=0.
op1((X,Y,Z,W),tira_segunda_fila,(X,Yf,Z,W)):- 
	\+Y = 0,
	(Yf is Y-1;
	Yf is Y-2;
	Yf is Y-3),
	Yf>=0.
op1((X,Y,Z,W),tira_terceira_fila,(X,Y,Zf,W)):- 
	\+Z = 0,
	(Zf is Z-1;
	Zf is Z-2;
	Zf is Z-3;
	Zf is Z-4;
	Zf is Z-5),
	Zf>=0.
op1((X,Y,Z,W),tira_quarta_fila,(X,Y,Z,Wf)):- 
    \+W = 0,
    (Wf is W-1;
	Wf is W-2;
	Wf is W-3;
	Wf is W-4;
	Wf is W-5;
	Wf is W-6;
	Wf is W-7),
	Wf>=0.
