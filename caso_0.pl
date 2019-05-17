:- [listas].
:- [busca_profundidade].
:- [busca_largura].


% ?- solucao_bp([p(1,1),0,[p(3,1), p(5,1)]], Meta).

% elevadores
elevador(7).
elevador(9).

%Definindo lixeiras
lixeira(p(6,1)).

parede(p(5,1)).

%Definindo PowerStation
powerstation(p(10,1)).


parede(p(8,2)).
parede(p(8,3)).
parede(p(8,4)).
parede(p(8,5)).
parede(p(8,6)).
parede(p(8,7)).
parede(p(8,8)).
parede(p(8,9)).
parede(p(8,10)).

%%path
%[[p(10, 1), 0, []], 
 %[p(9, 1), 0, []], 
 %[p(8, 1), 0, []], 
 %[p(7, 1), 0, []], 
 %[p(6, 1), 0, []], 
 %[p(6, 1), 2, []], 
 %[p(5, 1), 2, []], 
 %[p(5, 1), 1, [p(5, 1)]], 
 %[p(4, 1), 1, [p(5, 1)]], 
 %[p(3, 1), 1, [p(5, 1)]],
 %[p(3, 1), 0, [p(3, 1), p(5, 1)]],
 %[p(2, 1), 0, [p(3, 1), p(5, 1)]], 
 %[p(1, 1), 0, [p(3, 1), p(5, 1)]].
