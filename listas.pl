% prolog
pertence(Elem,[Elem|_]).			%pertence se é a cabeca
pertence(Elem,[_|Cauda]) :- 		%pertence se pertence à cauda
    pertence(Elem,Cauda).						

retirar_elemento(Elem,[Elem|Cauda],Cauda).
retirar_elemento(Elem,[Cabeca|Cauda],[Cabeca|Resultado]) :- 
  retirar_elemento(Elem,Cauda,Resultado).

concatena([],L,L).
concatena([Cabeca|Cauda],L2,[Cabeca|Resultado]) :- 
  concatena(Cauda,L2,Resultado).

