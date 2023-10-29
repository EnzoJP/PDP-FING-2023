%EX 5

% muestra los arboles genealógicos de la familia Stark y Targaryen
% en la serie Games of Thrones

persona(rickard,stark,230).
persona(lyarra,stark,u).
persona(catelyn,stark,264).
persona(eddard,stark,263).
persona(brandon,stark,262).
persona(benjen,stark,267).
persona(lyanna,stark,266).
persona(robb,stark,283).
persona(sansa,stark,286).
persona(arya,stark,289).
persona(bran,stark,290).
persona(rickon,stark,295).

persona(aerys,targaryen,244).
persona(rhaella,targaryen,254).
persona(rhaegar,targaryen,259).
persona(elia,targaryen,256).
persona(viserys,targaryen,276).
persona(daenerys,targaryen,284).
persona(rhaenys,targaryen,280).
persona(aegon,targaryen,281).

persona(jon,snow,283).
bastardo(jon).

pertenece_a_casa(rickard,stark).
pertenece_a_casa(lyarra,stark).
pertenece_a_casa(catelyn,stark).
pertenece_a_casa(eddard,stark).
pertenece_a_casa(brandon,stark).
pertenece_a_casa(benjen,stark).
pertenece_a_casa(lyanna,stark).
pertenece_a_casa(lyanna,stark).
pertenece_a_casa(robb,stark).
pertenece_a_casa(sansa,stark).
pertenece_a_casa(arya,stark).
pertenece_a_casa(bran,stark).
pertenece_a_casa(rickon,stark).

pertenece_a_casa(aerys,targaryen).
pertenece_a_casa(rhaella,targaryen).
pertenece_a_casa(rhaegar,targaryen).
pertenece_a_casa(elia,targaryen).
pertenece_a_casa(viserys,targaryen).
pertenece_a_casa(rhaenys,targaryen).
pertenece_a_casa(aegon,targaryen).

pareja(rickard, lyarra).
pareja(eddard, catelyn).
pareja(aerys, rhaella).
pareja(rhaegar, elia).
pareja(jon, daenerys).

amante(rhaegar, lyanna).

muerto(rickard).
muerto(lyarra).
muerto(catelyn).
muerto(eddard).
muerto(brandon).
muerto(lyanna).
muerto(robb).
muerto(rickon).

muerto(aerys).
muerto(rhaella).
muerto(rhaegar).
muerto(elia).
muerto(viserys).
muerto(rhaenys).
muerto(aegon).

revivido(aeron).

padres(eddard,rickard,lyarra).
padres(brandon,rickard,lyarra).
padres(benjen,rickard,lyarra).
padres(lyanna,rickard,lyarra).
padres(robb,eddard,catelyn).
padres(sansa,eddard,catelyn).
padres(arya,eddard,catelyn).
padres(bran,eddard,catelyn).
padres(rickon,eddard,catelyn).
padres(rhaegar,aerys,rhaella).
padres(viserys,aerys,rhaella).
padres(daenerys,aerys,rhaella).
padres(rhaenys,rhaegar,elia).
padres(aegon,rhaegar,elia).

casa(stark).
casa(targaryen).

padre(X,Y):- padres(X,Y,_).
madre(X,Y):- padres(X,_,Y).

hermano(X,Y):- padre(Z,X), !, padre(Z,Y), X \= Y.
hermano(X,Y):- madre(Z,X), !, madre(Z,Y), X \= Y.

pertenece(X, [X|_]).
pertenece(X, [_|L]) :- pertenece(X, L).

lista_hermanos(X,L):- lista_hermanos(X,[],L).
lista_hermanos(X,U,L):- hermano(X,H), not(pertenece(H,U)), !, append([H],U,R), lista_hermanos(X,R,L), !.
lista_hermanos(X,U,U):- hermano(X,H), pertenece(H,U).

lista_personas(L):- lista_personas([],L).
lista_personas(U,L):- persona(X,_,_), not(pertenece(X,U)), !, append([X],U,R), lista_personas(R,L), !.
lista_personas(U,U):- persona(X,_,_), pertenece(X,U).

lista_casa(X,[H]):- pertenece_a_casa(X,H).
lista_casa(X,[H|_]):- pertenece_a_casa(X,H),!.
lista_casa(X,[H|T]):- not(pertenece_a_casa(X,H)),lista_casa(X,T).

mas_viejo(X,Y):- persona(X,_,D), persona(Y,_,D2), X \= Y, D < D2.

noCasa(C, X) :- pertenece_a_casa(X, C), pertenece_a_casa(X, Z), Z /= C.

descendiente(X, Y):- padre(Y, X).
descendiente(X, Y):- padre(Y, Z), descendiente(X, Z).

bastardos_de_casa(C, X) :- pertenece_a_casa(X, C), padre(Y, X), madre(Z, X), not(pareja(Y, Z)).
hijos_no_bastardos(X, Y, C) :- padre(X, C), madre(Y, C), pareja(X, Y). 