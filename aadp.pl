% Agente Aspirador de Pó
:- [listas].
:- [busca_profundidade].
:- [busca_largura].

% verificando se é adjacente
adjacente(p(X,Y), p(FX, FY)) :-
    (  FX is X +1; 
    FX = X;
    FX is X - 1),
    (   FY is Y - 1;
    FY = Y;
    FY is Y +1).

% verificando limites
fora_do_mapa(p(X,Y)) :-
  X = 0;
  Y = 0;
  X = 11;
  Y = 6.

% pegando sujeira
s([Pos, Sacola, Sujeiras], [Pos, Sacola2, Sujeiras2]) :-
    pertence(Pos,Sujeiras),
    retirar_elemento(Pos,Sujeiras,Sujeiras2), writeln('limpou sujeira'),
    Sacola2 is Sacola + 1. 
    
% andando em X 
s([p(X, Y), Sacola, Sujeiras], [p(SX, Y), Sacola, Sujeiras]) :- 
    (SX is X + 1 ; SX is X - 1), writeln('andou em X'),
    not(fora_do_mapa(p(SX, Y))).

meta([p(_, _), _, []]). 

