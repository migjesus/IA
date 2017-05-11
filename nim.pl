estado_inicial((1,3,5,7)).

terminal((0,0,0,0)).

%função de utilidade.
valor(E,1,P):- terminal(E), X is P mod 2, X=0,!.
valor(E,-1,_):-terminal(E).

op1((X,Y,Z,W),tira_prim,(Xf,Y,Z,W)):- 
	X=1,
	Xf=0.

op1((X,Y,Z,W),tira_seg1,(X,Yf,Z,W)):- 
	Y > 0,
	Yf is Y-1.
	
op1((X,Y,Z,W),tira_seg2,(X,Yf,Z,W)):- 
	Y > 1,
	Yf is Y-2.

op1((X,Y,Z,W),tira_seg3,(X,Yf,Z,W)):- 
	Y > 2,
	Yf is Y-3.


op1((X,Y,Z,W),tira_ter1,(X,Y,Zf,W)):- 
	Z > 0,
	Zf is Z-1.

op1((X,Y,Z,W),tira_ter2,(X,Y,Zf,W)):- 
	Z > 1,
	Zf is Z-2.

op1((X,Y,Z,W),tira_ter3,(X,Y,Zf,W)):- 
	Z > 2,
	Zf is Z-3.

op1((X,Y,Z,W),tira_ter4,(X,Y,Zf,W)):- 
	Z > 3,
	Zf is Z-4.

op1((X,Y,Z,W),tira_ter1,(X,Y,Zf,W)):- 
	Z > 4,
	Zf is Z-5.

op1((X,Y,Z,W),tira_quarta1,(X,Y,Z,Wf)):- 
    W > 0,
    Wf is W-1.

op1((X,Y,Z,W),tira_quarta2,(X,Y,Z,Wf)):- 
    W > 1,
    Wf is W-2.

op1((X,Y,Z,W),tira_quarta3,(X,Y,Z,Wf)):- 
    W > 2,
    Wf is W-3.

op1((X,Y,Z,W),tira_quarta4,(X,Y,Z,Wf)):- 
    W > 3,
    Wf is W-4.

op1((X,Y,Z,W),tira_quarta5,(X,Y,Z,Wf)):- 
    W > 4,
    Wf is W-5.

op1((X,Y,Z,W),tira_quarta6,(X,Y,Z,Wf)):- 
    W > 5,
    Wf is W-6.

op1((X,Y,Z,W),tira_quarta7,(X,Y,Z,Wf)):- 
    W > 6,
    Wf is W-7.

