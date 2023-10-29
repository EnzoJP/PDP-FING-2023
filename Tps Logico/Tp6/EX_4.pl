%EX 1
/*Define un predicado multirot(Xs,MRXs) que, dadas las listas Xs y MRXs, se satisface
cuando MRXs es la concatenación de varias rotaciones (al menos una) de Xs.*/


/*
permute([], []).
permute([X|Rest], L) :-
    permute(Rest, L1),
    select(X, L, L1).

%se puede resolver con permutation de prolog

multirotAux1([],_).
multirotAux1([H|T],MRL):- pertenece(H,MRL), multirot(T,MRL).
multirot(L1, L2) :- ((   length(L2) mod length(L1)) = 0) , multirotAux1(L1,L2).

*/

%EX 2

/*
 *Define un predicado son consecutivas(N,Xs) que se satisfaga cuando Xs sea una lista donde
cada número i entre 1 y N aparece i veces consecutivas.
*/

/*
consecutivas(N,[]).
consecutivas(N,[X|L]):- N>X , X>=1, C=1, aux(N,L,C,X).
aux(N,[],_,_).
aux(N,[X|L],C,A):- A\=X, N>X , X>=1, Z=A, C=1 ,aux(N,L,C,X).
aux(N,[X|L],C,A):- A=X, N>X , X>=1, Z is C+1, aux(N,L,Z,X). */


consecutivas(N,[]):- N=N.
consecutivas(N,[X|L]):- X \= N, consecutivas(N,L).
consecutivas(N,[X|L]):- X=N, consecutivasA(N,[X|L],N).

consecutivasA(N,L,0):- consecutivas(N,L). 
consecutivasA(N,[X|L],C):- X=N, N1 is C-1, consecutivasA(N,L,N1).
