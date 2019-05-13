% Agente Aspirador de Pó
:- [listas].
:- [busca_profundidade].
:- [busca_largura].

% verificando se é adjacente
adjacente(p(X,Y), p(FX, FY)) :-
    (   FX is X - 1;
    FX = X;
    FX is X +1),
    (   FY is Y - 1;
    FY = Y;
    FY is Y +1).

% verificando limites
esta_no_mapa(p(X,Y)) :-
    X > 0,
    Y > 0,
    X < 11,
    Y < 6.

% pegando sujeira
s([Pos, Sacola, Sujeiras], [Pos, Sacola2, Sujeiras2]) :-
    pertence(p(X, Y),Sujeiras),
    retirar_elemento(p(SX, SY),Sujeiras,Sujeiras2),
    Sacola2 is Sacola + 1. 
    
% andando 
s([p(X, Y), Sacola, Sujeiras], [p(SX, SY), Sacola, Sujeiras]) :- 
    esta_no_mapa(p(SX, SY)),
    adjacente(p(X,Y), p(SX, SY)).

meta([p(_, _), _, []]).
% buscas 2 sujeiras - carregador - guarda a ultima sujeira
