% prolog

pertence(Elem,[Elem|_]).
pertence(Elem,[_|Cauda]) :- 
  pertence(Elem,Cauda).

retirar_elemento(Elem,[Elem|Cauda],Cauda).
retirar_elemento(Elem,[Cabeca|Cauda],[Cabeca|Resultado]) :- 
  retirar_elemento(Elem,Cauda,Resultado).

concatena([],L,L).
concatena([Cabeca|Cauda],L2,[Cabeca|Resultado]) :- 
  concatena(Cauda,L2,Resultado).

