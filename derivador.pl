% Problema 2, Derivador -- Richard Osvaldo Leon Chinchilla 2019003759

% k' = 0
dx(K,0):-
    atomic(K).

% x' = 1
dx(x,1):-!

% (f+g)'(x) = f'(x)+g'(x)
dx(F+G,DF+DG):-
    dx(F,DF),
    dx(G,DG).

% (f(x)*g(x))' = f'(x)*g(x)+f(x)*g'(x)
dx(F*G,DF*G+F*DG):-
    dx(F,DF),
    dx(G,DG).

% (f(x)/g(x))' = f'(x) * g(x) − f(x) * g'(x)/f(x)^2
dx(F/G,(DF*G-F*DG)/(DF*DF)):-
    dx(F,DF),
    dx(G,DG).

%(x^n)' = n*x^(n-1)
dx(F**N,N*DF**(N-1)):-
    dx(F,DF).

%log'(x) = 1/x
dx(log(F),DF/F):-
    dx(F,DF).


%cos'(x) = -sin(x)*DX
dx(cos(F),-sin(F)*DF):-
    dx(F,DF).

%sin'(x) = cos(x)*DX
dx(sin(F),cos(F)*DF):-
    dx(F,DF).

%f(g(x))' = f'(g(x)) * g'(x)
dx(F,DF*DG):-
    dx(F,DF),
    dx(G,DG).