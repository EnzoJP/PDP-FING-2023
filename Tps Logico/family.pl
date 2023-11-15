papa(julian, juan).%julian es papa de juan
papa(juan, jose).
papa(juan, emiliano).
papa(jose, cristian).
papa(jose, javier).
esposa(ivonne, cristian).%ivonne es la esposa de cristian
mama(catalina, javier). %catalina es mama de javier

hijo(A,B):-papa(B,A).
abuelo(A,B):-papa(A,C),papa(C,B).
bisabuelo(A,B):-papa(A,C),abuelo(C,B).
hermano(A,B):-papa(C,A),papa(C,B),A\==B.

primo(Z,X):- papa(Y, X), papa(W, Z), hermano(W, Y).
tio(Z, X):- papa(Y, X), hermano(Z, Y).
cuñado(X, Z):- esposa(Y, Z), hermano(X,Y).