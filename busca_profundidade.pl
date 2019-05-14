:- [listas].

solucao_bp(Inicial,Solucao) :- 
    bp([],Inicial,Solucao),writeln(Solucao).
bp(Caminho,Estado,[Estado|Caminho]) :- 
    meta(Estado).
bp(Caminho,Estado,Solucao) :- 
    s(Estado,Sucessor),
    not(pertence(Sucessor,[Estado|Caminho])),
    bp([Estado|Caminho],Sucessor,Solucao).
