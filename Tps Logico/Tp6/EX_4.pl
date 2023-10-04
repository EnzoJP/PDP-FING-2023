%EX 1
/*Define un predicado multirot(Xs,MRXs) que, dadas las listas Xs y MRXs, se satisface
cuando MRXs es la concatenación de varias rotaciones (al menos una) de Xs.*/

multirot([],[]).
multirot(Xs,MRXs):- rnef.

%EX 2

/*
 *Define un predicado son consecutivas(N,Xs) que se satisfaga cuando Xs sea una lista donde
cada número i entre 1 y N aparece i veces consecutivas.
*/

consecutivas(N,[]).
consecutivas(N,[X|L]):- N>X , X>=1, C=1, aux(N,L,C,X).
aux(N,[],_,_).
aux(N,[X|L],C,A):- A\=X, N>X , X>=1, Z=A, C=1 ,aux(N,L,C,X).
aux(N,[X|L],C,A):- A=X, N>X , X>=1, Z is C+1, aux(N,L,Z,X).