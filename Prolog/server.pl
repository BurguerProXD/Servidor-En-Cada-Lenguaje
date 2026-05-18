% Prolog puro sin biblioteca(socket) no permite servidores de red.
:- initialization(main).

main :-
    writeln('Prolog server: requiere library(socket) – no disponible en Prolog puro.').
