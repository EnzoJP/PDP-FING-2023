ama(juan,ana).
ama(ana,miguel).
ama(luis,isabel).
ama(miguel,ana).
ama(laura,juan).
ama(isabel,luis).

ama_a_alguien(X):- ama(X,_).
es_amado(X):- ama(_,X).
amor_mutuo(X,Y):-ama(X,Y),ama(Y,X).
amor_no_correspondido(X):- ama(X,Y),\+ama(Y,X).