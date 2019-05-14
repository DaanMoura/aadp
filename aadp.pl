% Agente Aspirador de Pó
:- [listas].
:- [busca_profundidade].
:- [busca_largura].

% elevadores
elevador(4).
elevador(9).

lixeira(p(1,3)).
lixeira(p(10,5)).

powerstation(p(10,1)).

parede(p(4,1),p(5,1)).

% verificando limites
fora_do_mapa(p(X,Y)) :-
  X = 0;
  Y = 0;
  X = 11;
  Y = 6.

pode_passar(Pos,Pos2) :-
  not((parede(Pos,Pos2);parede(Pos2,Pos))),
  not(fora_do_mapa(Pos2)).

% pegando sujeira
s([Pos, Sacola, Sujeiras], [Pos, Sacola2, Sujeiras2]) :-
    pertence(Pos,Sujeiras),
    retirar_elemento(Pos,Sujeiras,Sujeiras2),
    Sacola < 2,
    Sacola2 is Sacola + 1, writeln('limpou sujeira'). 

% esvaziando sacola na lixeira
s([Pos,Sacola,Sujeiras],[Pos,Sacola2,Sujeiras]) :-
  lixeira(Pos),
  Sacola > 0,
  Sacola2 is 0, writeln('esvaziou sacola').

% andando em X 
s([p(X, Y), Sacola, Sujeiras], [p(SX, Y), Sacola, Sujeiras]) :- 
    (SX is X + 1 ; SX is X - 1),
    pode_passar(p(X,Y),p(SX,Y)).

%subindo no elevador
s([p(X,Y), Sacola, Sujeiras],[p(X,SY),Sacola,Sujeiras]) :-
  elevador(X),
  (SY is Y + 1; SY is Y - 1),
  not(fora_do_mapa(p(X,SY))), writeln('subiu no elevador').

meta([Pos, _, Lixos]) :-
  powerstation(Pos),
  Lixos = [], writeln('pronto').
