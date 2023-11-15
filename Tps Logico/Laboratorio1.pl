
%EJ1
p(X):- a(X).
p(X):- b(X), c(X), d(X), e(X).
p(X):- f(X).

a(1).
b(1).
c(1).
d(2).
e(2).
f(3).
b(2).
c(2).

%EJ2

%----numero de ocurrencias en la lista--------

concatena([], L2, L2).
concatena([H|L1], L2, [H|L3]) :- concatena(L1, L2, L3).

ocurrList([H|T],X):- msort([H|T],L), aux(L,[],X).

aux([],L,L).
aux([H|T],L,X):- cuenta([H|T],H,N), concatena(L,[[H,N]],E), delete([H|T],H,R),!,aux(R,E,X).


%lista-elemento
cuenta([], _, 0).
cuenta([H|T], X, E) :- X = H, cuenta(T, X, N), E is N + 1.
cuenta([H|T], X, E) :- X \= H, cuenta(T, X, E).






