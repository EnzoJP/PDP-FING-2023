pertenece(X,[X|_]).
pertenece(X,[_|T]):- pertenece(X,T).

concatena(L,[],L).
concatena([],L,L).
concatena([H|T],L,[H|T1]):- concatena(T,L,T1).

inversa([],[]).
inversa([H|T],R):- inversa(T,R1), concatena(R1,[H],R).

palindromo(L):- inversa(L,L).

selecciona(X,[X|T],T).
selecciona(X,[H|T],[H|L2]):- selecciona(X,T,L2).

diferencia([],_,[]).
diferencia([H|T],C2,C3):- pertenece(H,C2), diferencia(T,C2,C3).
diferencia([H|T],C2,[H|D]):- diferencia(T,C2,D).

diferencia1([],_,[]).
diferencia1([H|T],C2,[H|D]):- not(pertenece(H,C2)), diferencia(T,C2,C3).
diferencia1([H|T],C2,C3):- diferencia(T,C2,C3).

diferencia2([],_,[]).
diferencia2([H|T],C2,D):- not(pertenece(H,C2)), diferencia(T,C2,C3), !, D is [H|C3].
diferencia2([_|T],C2,C3):- diferencia(T,C2,C3).

%QUICKSORT%

quicksort([],[]).
quicksort([H|T],L1):- elemMen(H,T,Men), elemMay(H,T,May), quicksort(Men,L2), quicksort(May,L3), append(L2,[H|L3],L1).

elemMen(_,[],[]):-!.
elemMen(X,[H|T],[H|Men]):- H =<X, !, elemMen(X,T,Men).
elemMen(X,[_|T],Men):- elemMen(X,T,Men).

elemMay(_,[],[]):-!.
elemMay(X,[H|T],[H|Men]):- H>X, !, elemMay(X,T,Men).
elemMay(X,[_|T],Men):- elemMay(X,T,Men).

%flatten([a,[b,c],[[d],[],e]],X). , X = [a, b, c, d, e].

flatten([],[]):- !.
flatten([H|T], L2):- flatten(H,L),flatten(T,L3),append(L,L3,L2), !.
flatten(X, [X]).

f(a,b).
f(a,c).
f(a,d).

list(X,L):-listR(X,[],L).

listR(X,L1,L2):- f(X,Y), not(member(Y,L1)),append([Y],L1,L3),listR(X,L3,L2),!.
listR(_,L,L).



sumaPares(L,N):- sumaPares(L,0,N).
sumaPares([],N,N).
sumaPares([H|T],N1,N):- R is H mod 2, R is 0, N2 is N1+1, sumaPares(T,N2,N).
sumaPares([H|T],N1,N):- R is H mod 2, R \= 0, sumaPares(T,N1,N).

sumaPares1(L,N):- sumaPares1(L,0,N).
sumaPares1([],N,N).
sumaPares1([H|T],N1,N):- R is H mod 2, R is 0, N2 is N1+1, sumaPares1(T,N2,N).
sumaPares1([H|T],N1,N):- R is H mod 2, not(R is 0), sumaPares1(T,N1,N).

sumaPares2(L,N):- sumaPares2(L,0,N).
sumaPares2([],N,N).
sumaPares2([H|T],N1,N):- R is H mod 2, R is 0, !, N2 is N1+1, sumaPares2(T,N2,N).
sumaPares2([_|T],N1,N):- sumaPares2(T,N1,N).
