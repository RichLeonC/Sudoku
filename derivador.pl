% Problema 2, Derivador -- Richard Osvaldo Leon Chinchilla 2019003759

%Hechos de las derivadas

% k' = 0
dx(K,X,0):-
    number(K).

% x' = 1
dx(X,X,1):-!.

% (f+g)'(x) = f'(x)+g'(x)
dx(F+G,X,DF+DG):-
    dx(F,X,DF),
    dx(G,X,DG).

% (f(x)*g(x))' = f'(x)*g(x)+f(x)*g'(x)
dx(F*G,X,DF*G+F*DG):-
    dx(F,X,DF),
    dx(G,X,DG).

% (f(x)/g(x))' = f'(x) * g(x) − f(x) * g'(x)/f(x)^2
dx(F/G,X,(DF*G-F*DG)/(DF*DF)):-
    dx(F,X,DF),
    dx(G,X,DG).

%(x^n)' = n*x^(n-1)
dx(F^N,X,DF*N*F^(N-1)):-
    dx(F,X,DF).

%log'(x) = 1/x
dx(log(F),X,DF/F):-
    dx(F,X,DF).


%cos'(x) = -sin(x)*DX
dx(cos(F),X,-sin(F)*DF):-
    dx(F,X,DF).

%sin'(x) = cos(x)*DX
dx(sin(F),X,cos(F)*DF):-
    dx(F,X,DF).

%f(g(x))' = f'(g(x)) * g'(x)
% dx(F(G),X,DF*DG):-
%     dx(F,X,DF),
%     dx(G,X,DG).


%Parte que resuelve y simplifica

simplificar(+X,Result):- simplificar(X,Result).
simplificar(-X,-Result):- simplificar(X,Result).

simplificar(X+Y,Result):-
    simplificar(X,RX),
    simplificar(Y,RY),
    simSuma(RX,RY,Result).

simplificar(X-Y, Result) :-
    simplificar(X, RX), 
    simplificar(Y, RY), 
    simResta(RX, RY, Result).

simplificar(X*Y,Result) :-
    simplificar(X, RX), 
    simplificar(Y, RY), 
    simMulti(RX, RY, Result).

simplificar(X/Y,Result) :-
    simplificar(X, RX), 
    simplificar(Y, RY), 
    simDiv(RX, RY, Result).

simplificar(X^1,Result):-
    simplificar(X,Result).

simplificar(X^Y,Result):-
    simplificar(X,RX),
    simplificar(Y,RY),
    simExp(RX^RY,Result).

simExp(X^1,Result):- 
    simplificar(X,Result).

simExp(X^Y,X^Y):-!.

simplificar(X,X):-!.

%Suma

simSuma(X,0,X):-!.
simSuma(0,X,X):-!.
simSuma(X,Y,Result):-
    number(X),
    number(Y),
    Result is X+Y.

simSuma(K+X,Y,Result):-
    number(K),
    simSuma(X+K,Y,Result).

simSuma(X,K+Y,Result):-
    number(K),
    simSuma(X,Y+K,Result).

simSuma(K+X,Y+C,Result):-
    number(K),
    number(C),
    simSuma(X+K,Y+C,Result).

simSuma(X,Y,X+Y):-!.

%Resta
simResta(X,Y,Result):-
    number(X),
    number(Y),
    Result is X-Y.

simResta(X,K,Result):-
    number(K),
    K<0,
    C is -K,
    simSuma(X,C,Result).

simResta(X,Y,X-Y):-!.

%Multiplicacion
simMulti(X,Y,0) :- 
    (X = 0; Y = 0).

simMulti(1,X,X) :- !.

simMulti(X,1,X) :- !.

simMulti(-1,X,-X) :- !.

simMulti(X,-1,-X) :- !.

simMulti(X,Y,Result):-
    number(X),
    number(Y),
    Result is X*Y.

simMulti(X,X,X^2):-!.

simMulti(X,X^K,X^C):-
    simSuma(K,1,C).

simMulti(X^K,X,X^C):-
    simSuma(K,1,C).

simMulti(X^C,X^K,X^R):-
    simSuma(C,K,R).

simMulti(K*X,Y,C*X) :- 
    number(K), 
    number(Y),
     C is K*Y.
    
simMulti(K,Y*X,C*X) :- 
    number(K), 
    number(Y),
    C is K*Y.

simMulti(K,Y*(S*X),C*X*Y) :- 
    number(K), 
    number(S),
    C is K*S.

simMulti(K*X,L*Y,C*R) :- 
    number(K), 
    number(L),
    C is K*L,
    simplificar(X*Y, R).



simMulti(X,Y,X*Y):-!.

%Division

simDiv(0,X,0):-!.
simDiv(X,1,X):-!.
simDiv(X,X,1):-!.
simDiv(X*Y,X,Y):-!.
simDiv(X*Y,Y,X):-!.

simDiv(X+Y,K,RX+RY):-
    simplificar(X/Z,RX),
    simplificar(Y/Z,RY).

simDiv(X-Y,K,RX-RY):-
    simplificar(X/Z,RX),
    simplificar(Y/Z,RY).

simDiv(X/Y,Z,Result):-
    simplificar(X/(Y*Z),Result).

simDiv(K,K*X,1/X):-
    number(K).

simDiv(X,Y,X/Y):-!.

%Funciones especiales

simplificar(cos(X),cos(RX)):-
    simplificar(X,RX).

simplificar(sin(X),sin(RX)):-
    simplificar(X,RX).

simplificar(log(X),log(RX)):-
    simplificar(X,RX).



%Lo que hacemos es obtener la expresion, se va simplificando y derivando de manera recursiva
derive(F,X,DF):- !,
    simplificar(F,RF),
    dx(RF,X,RDF),
    simplificar(RDF,DF).
    

