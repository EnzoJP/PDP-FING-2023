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


%H representa la altura%
%A representa la torre origen%
%B representa la torre destino%
%C representa la torre auxiliar%
moveToTower(0,_,_,_).
moveToTower(H,A,B,C) :- Z is H-1,moveToTower(Z, A, C, B), escribir(A,B), moveToTower(Z,C,B,A),!.
escribir(X,Y) :- write(" Pasar de la torre "), write(X), write(" a "), write(Y), nl.




elemento_en(K,L,X):- elemnAux(K,L,X,1).

elemnAux(K,[X|_],X,K):-!.
elemnAux(K,[_|T],X,N):- N1 is N+1, elemnAux(K,T,X,N1).


/*elemento_en(K,L,X):- elemento_en(K,1,L,X).
elemento_en(K,K,[H|_],X):- X is H.
elemento_en(K,I,[_|T],X):- J is I+1, elemento_en(K,J,T,X).*/


telescopio(N,Xs):- msort(Xs,R),R==Xs,max_list(Xs,M),M==N,telescopio1(N,Xs,0,0).

telescopio1(N,[H|T],C1,C2):-telescopio1(N,[H|T],1,0,H).
telescopio1(N,[],N,_,_):-!.
telescopio1(N,[H|T],C1,I,E):- H==E,  C1 =< H,C2 is C1+1,telescopio1(N,T,C2,I,H),!.
telescopio1(N,[H|T],C1,I,E):- H\=E, telescopio1(N,[H|T],0,I,H),!.




/*
% repetir n, k veces y devolverlo en L
lista_repetir(N,K,L):- lista_repetir(N,K,[],L).
lista_repetir(_,0,L,L).
lista_repetir(N,K,L,L2):- K > 0, K1 is K-1, concatena([N],L,L1), lista_repetir(N,K1,L1,L2).

% repetir n, k veces y devolverlo en L (list of lists)
lista_repetir2(N,K,[L]):- lista_repetir2(N,K,[],L).
lista_repetir2(_,0,L,L).
lista_repetir2(N,K,L,L2):- K > 0, K1 is K-1, concatena([N],L,L1), lista_repetir2(N,K1,L1,L2).


es_telescopio(N,L):- es_telescopio(1,N,L).
es_telescopio(X,N,[]):- X is N+1.
es_telescopio(I,N,L):- I > 0, N >= I, I1 is I+1, es_telescopio(I1,N,L1), lista_repetir(I,I,R), concatena(R,L1,L).

es_telescopio2(N,L):- es_telescopio2(1,N,L).
es_telescopio2(X,N,[]):- X is N+1.
es_telescopio2(I,N,L):- I > 0, N >= I, I1 is I+1, es_telescopio2(I1,N,L1), lista_repetir2(I,I,R), concatena(L1,R,L).

son_consecutivas(N,L):- es_telescopio2(N,T), permutacion(T,P), append(P,L)*/


