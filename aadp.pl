% Agente Aspirador de Pó
:- [listas].
:- [busca_profundidade].
:- [busca_largura].
%:- [cenariobesta].
%:- [cenariocomum].
%:- [cenariomedio].


% elevadores
elevador(4).
elevador(9).

%Definindo lixeiras
lixeira(p(1,3)).
lixeira(p(10,5)).	

%Definindo Power Station
powerstation(p(10,1)).

parede(p(7,1)).

% verificando limites
fora_do_mapa(p(X,Y)) :-
  X = 0;
  Y = 0;
  X = 11;
  Y = 6.

pode_passar(Pos,Pos2) :-
  not(parede(Pos2)),
  not(fora_do_mapa(Pos2)).

% pegando sujeira
s([Pos, Sacola, Sujeiras], [Pos, Sacola2, Sujeiras2]) :-  	  %estado (P,Sa,Su) vem antes de (P,Sa2,Su2) se
    pertence(Pos,Sujeiras),										                %Essa posicao pertence à lista de sujeiras &
    retirar_elemento(Pos,Sujeiras,Sujeiras2),					        %Sujeiras 2 é sujeira sem o 'elemento' Pos &
    Sacola < 2,													                      % A sacola não está cheia 				   &
    Sacola2 is Sacola + 1, writeln('limpou sujeira'). 			  % Sa2 tem 1 lixo a mais que Sa 					

% esvaziando sacola na lixeira
s([Pos,Sacola,Sujeiras],[Pos,Sacola2,Sujeiras]) :-			      % (P,Sa,Su) vem antes de (P,Sa2,Su2) se
  lixeira(Pos),													                      %há uma lixeira em P &
  Sacola > 0,													                        %Tem lixo na sacola  &
  Sacola2 is 0, writeln('esvaziou sacola').						        %A nova sacola está vazia 

% andando em X 
s([p(X, Y), Sacola, Sujeiras], [p(SX, Y), Sacola, Sujeiras]) :- % (XY,Sa,Su) vem antes de (SXY,Sa,Su) se
    (SX is X + 1 ; SX is X - 1),									              % o x novo está à um passo do antigo, seja direita ou esquerda
    pode_passar(p(X,Y),p(SX,Y)).									              % X -> SX é navegável

%subindo no elevador
s([p(X,Y), Sacola, Sujeiras],[p(X,SY),Sacola,Sujeiras]) :-		%Andar no Y ( apenas no elevador) se
  elevador(X),														                    %Há um elevador no X atual
  (SY is Y + 1; SY is Y - 1),										              %o Y novo está há um passo do antigo, subida ou descida
  not(fora_do_mapa(p(X,SY))), writeln('subiu no elevador').	  %a nova posição não está fora do mapa

meta([Pos, _, Lixos]) :-										%A meta é um estado onde o robo está na powerStation,
  powerstation(Pos),												%e a lista de lixos está vazia
  Lixos = [], writeln('pronto').

