

% EX 1
% Definir la relación primero(L,X) que verifique si X es el primer elemento de la lista L

primero(L,X):- L=[X|_].
primero2([X|_],X).

%EX 2
%Definir la relación resto(L1,L2) que verifique si L2 es la lista obtenida a partir de la lista
%L1 suprimiendo el primer elemento.

resto(L1,L2):- L1=[_|T], L2=[T|_].
resto2([_|T],T).

%EX 3
%d efinir la relación construye(X,L1,L2) que verifique si L2 es la lista obtenida añadiéndole
%X a L1 como primer elemento.

construye(X,L1,L2):- L2=[X|L1].

%EX 4
%Definir la relación pertenece(X,L) que verifique si X es un elemento de la lista L

pertenece(X, [X|_]).
pertenece(X, [_|L]) :- pertenece(X, L).

comunlistas(L1, L2, X):- pertenece(X, L1), pertenece(X, L2).

%EX 5
/*Definir la relación concatena(L1,L2,L3) (equivalente a append) que verifique si L3 es la
lista obtenida escribiendo los elementos de L2 a continuación de los elementos de L1.*/

concatena([], L2, L2).
concatena([H|L1], L2, [H|L3]) :- concatena(L1, L2, L3).

%EX 6
/*Definir
la relación palíndromo(L) que verifique si la lista L es un palíndromo.*/

plaindromo(L):-revert(L,L).
%revert(L,L) ve si una es la reversa de la otra.
revert([], []).
revert([X|Xs], Ys) :-
    revert(Xs, Zs),
   concatena(Zs, [X], Ys).

%EX 7
/*Definir la relación último(X,L) (equivalente a last) que verifique si X es el último elemento
de la lista L.*/

ultimo(X,[X|[]]):-write('es el ultimo').
ultimo(X,[_|L]):-ultimo(X,L).

ultimo2(X,L):- revert(L,[X|_]).

%EX 8
/*Utilizando el predicado select, definir la relación inserta(X,L1,L2) que verifique si L2 es una
lista obtenida insertando X en L1*/

inserta(X,L1,L2):- select(X,L2,L1).

%EX 9
/*Utilizando el predicado append, definir la relación sublista(L1,L2) que verifique si L1 es
una sublista de L2*/

%?????????????????????????????????

%EX 10
/*Definir la relación subconjunto(L1,L2) que verifique si L2 es un subconjunto de L1*/ 

/*
subconjunto([],[]).
subconjunto([X|L1],[X|L2]):-
    subconjunto([_|L1],[_|L2]).
subconjunto([X|L1],[Y|L2]):-??
    subconjunto([_|L1],[_|L2]).*/

subconjunto([],[]).
subconjunto([X|L1],[X|L2]):-
    subconjunto(L1,L2).
subconjunto([_|L1],L2):-
    subconjunto(L1,L2).


%EX 11
/*Definir la relación máximo(X,Y,Z) (equivalente a max) que verifique si Z es el máximo de
X e Y*/

%maximo(X,Y,Z):- X<Z , Y<Z.
maximo(X,Y,X):- X>=Y.
maximo(X,Y,Y):- X<Y.

%EX 12
/*Definir la relación mcd(X,Y,Z) que verifique si Z es el máximo común divisor de X e Y*/

%??????????????????

%EX 13
/*Definir la relación longitud(L,N) que se verifique si N es la longitud de la lista L.*/

len([],0).
len([_|L1],N):- len(L1,M), N is M+1.

%EX 14
/*Una lista está acotada si todos sus elementos son menores que su longitud. Definir la
relación lista_acotada(L) que verifique si todos los elementos de la lista de números L son
menores que la longitud de L.*/

lista_acotada([]).
lista_acotada([X|L]) :- length([X|L], Length), X < Length, lista_acotada(L).

%EX 15
/*Definir la relación max_lista(L,X) que se verifique si X es el máximo de la lista de números
L*/

max_lista([],_).
max_lista([Y|L],X):- pertence(X,[Y|L]), X>=Y, max_lista(L,X).

%EX 16
/*Definir la relación suma_lista(L,X) (equivalente a sumlist) que se verifique si X es la suma
de los elementos de la lista de números L*/

suma_lista([],0).
suma_lista([H|L],M):- suma_lista(L,N),M is N+H.

%EX 17
/*Definir la relación ordenada(L) que se verifique si la lista de números L está ordenada de
manera creciente*/

ordenada([]).
ordenada([X|L]):- ordenadaux(L,X).
ordenadaux([],_).
ordenadaux([Y|L],X):-  Y>X, ordenadaux(L,Y).

%EX 18
/*Definir la relación lista(N,L) que verifique si L es la lista de longitud N cuyos elementos
son N*/

%?????????????????consigna

%EX 19
/*Definir la relación lista_de_números(N,M,L) (equivalente a numlist) que verifica si L es
la lista de los números desde N hasta M, ambos inclusive*/

lista_de_numeros(N,N,[X]):- X=N.
lista_de_numeros(N,M,[X|L]):- X=N , Z is N+1, lista_de_numeros(Z,M,L).

%EX 20
/*Definir la relación entre(N1,N2,X) (equivalente a between) que se verifique si X es un
número entero tal que N1 ≤ X ≤ N2*/

entre(N1,N2,X):- X<=N2 , X>=N1.










