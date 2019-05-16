% Busca em Largura
:- [listas]. % importa regras de lista

solucao_bl(Inicial,Solucao) :-
  bl([[Inicial]],Solucao),writeln(Solucao).

bl([[Estado|Caminho]|_],[Estado|Caminho]) :-
  meta(Estado).

bl([Primeiro|Outros],Solucao) :-
  estende(Primeiro,Sucessores),
  concatena(Outros,Sucessores,NovaFronteira),
  bl(NovaFronteira,Solucao).

estende(_,[]).
estende([Estado|Caminho],ListaSucessores) :-
  bagof(
    [Sucessor,Estado|Caminho],
    (s(Estado,Sucessor),not(pertence(Sucessor,[Estado|Caminho]))),
    ListaSucessores),!.


%Entrada exemplo
%?- solucao_bl([p(1,1),0,[p(3,3),p(3,5)]], Meta)).

