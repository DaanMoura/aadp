% prolog

negativo(N) :- N < 0.
positivo(N) :- N > 0.
zero(N) :- 
  not(negativo(N)), not(positivo(N)).

pertence(Elem,[Elem|_]).
pertence(Elem,[_|Cauda]) :- 
  pertence(Elem,Cauda).

inserir(Elem,Lista,[Elem|Lista]).

inserir_ultimo(Elem,[],[Elem]).
inserir_ultimo(Elem,[Cabeca|Cauda],[Cabeca|Cauda_Resultante]) :- 
  inserir_ultimo(Elem,Cauda,Cauda_Resultante).

retirar_elemento(Elem,[Elem|Cauda],Cauda).
retirar_elemento(Elem,[Cabeca|Cauda],[Cabeca|Resultado]) :- 
  retirar_elemento(Elem,Cauda,Resultado).

retirar_todos(Elem,[],[]).
retirar_todos(Elem,[Elem|Cauda1],Resultado) :- 
  retirar_todos(Elem,Cauda1,Resultado).
retirar_todos(Elem,[Cabeca|Cauda],[Cabeca|Cauda_Resultante]) :- 
  Elem \== Cabeca.
retirar_todos(Elem,Cauda,Cauda_Resultante).


concatena([],L,L).
concatena([Cabeca|Cauda],L2,[Cabeca|Resultado]) :- 
  concatena(Cauda,L2,Resultado).

soma([],0).
soma([Elem|Cauda],S) :- 
  soma(Cauda,S1), 
  S is S1 + Elem.

multiplica([],1).
multiplica([Elem|Cauda], S) :- 
  multiplica(Cauda,S1), 
  S is S1 * Elem.

conta([],0).
conta([_|Cauda],N) 
  :- conta(Cauda,N1), 
  N is N1 + 1.

conta_occorrencia(Elem,[],0).
conta_occorrencia(Elem,[Elem|Cauda],N) :- 
  conta_occorrencia(Elem,Cauda,N_Cauda), 
  N is N_Cauda + 1.
conta_occorrencia(Elem,[Cabeca|Cauda],N) :- 
  Elem \== Cabeca, 
  conta_occorrencia(Elem,Cauda,N).

% Exercício: Dada uma lista de números, separar em duas sendo
% uma com os positivos e o zero, e outra com os negativos

separa([],[],[]).
separa([Elem|Cauda],[Elem|Cauda_P],Cauda_N) :- 
  separa(Cauda,Cauda_P,Cauda_N), 
  not(negativo(Elem)).
separa([Elem|Cauda],Cauda_P,[Elem|Cauda_N]) :- 
  separa(Cauda,Cauda_P,Cauda_N), 
  negativo(Elem).

separa_sem_zero([],[],[]).
separa_sem_zero([Elem|Cauda],[Elem|Cauda_P],Cauda_N) :- 
  separa_sem_zero(Cauda,Cauda_P,Cauda_N), 
  positivo(Elem).
separa_sem_zero([Elem|Cauda],Cauda_P,[Elem|Cauda_N]) :- 
  separa_sem_zero(Cauda,Cauda_P,Cauda_N), 
  negativo(Elem).
separa_sem_zero([Elem|Cauda],Cauda_P,Cauda_N) :- 
  separa_sem_zero(Cauda,Cauda_P,Cauda_N), 
  zero(Elem).

