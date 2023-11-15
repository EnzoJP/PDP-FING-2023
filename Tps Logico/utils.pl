concatenate([], L, L).
concatenate([H|B], L, [H|R]) :- concatenate(B, L, R).

reverse([], []).
reverse([H|B], R) :- reverse(B, R2), concatenate(R2, [H], R).

head([H|_], H).
tail(L, T) :- reverse(L, R), head(R, T).

appendTail([], I, [I]).
appendTail([H|B], I, [H|R]) :- appendTail(B, I, R).

appendHead(L, I, [I|L]).

removeHead([_|B], B).

removeTail([_], []) :- !.
removeTail([H|B], [H|R]) :- removeTail(B, R). 

getAtIndex(L, I, E) :- getAtIndexImpl(L, I, E, 0).
getAtIndexImpl([], _, _, _) :- false.
getAtIndexImpl([E|_], I, E, I) :- !.
getAtIndexImpl([_|B], I, E, N) :-
	NewIndex is 1 + N,
	getAtIndexImpl(B, I, E, NewIndex).

contains([X|_], X).
contains([H|T], X) :- H \= X, contains(T, X).

removeFirstMatch([X|B], X, B) :- !.
removeFirstMatch([H|B], X, [H|Y]) :- removeFirstMatch(B, X, Y).

removeAllMatches([], _, []) :- !.
removeAllMatches([E|B], E, B2) :- removeAllMatches(B, E, B2), !.	
removeAllMatches([H|B], E, [H|B2]) :- removeAllMatches(B, E, B2).

replaceMatches([], _, _, []) :- !.
replaceMatches([E|B], E, R, [R|B2]) :- replaceMatches(B, E, R, B2), !.
replaceMatches([H|B], E, R, [H|B2]) :- replaceMatches(B, E, R, B2).

sumElements([], 0).
sumElements([N1|B], R) :- sumElements(B, S), R is N1 + S.

multiplyElements([], 1).
multiplyElements([N1|B], R) :- multiplyElements(B, S), R is N1 * S.

lengthList([], 0).
lengthList([_|B], L) :- lengthList(B, L1), L is L1 + 1.

zipList([], [], []).
zipList([H1|B1], [H2|B2], Z) :- zipList(B1, B2, Z2), Pair = [H1, H2], Z = [Pair|Z2].

isSorted([_]).
isSorted([H1|[H2|B]]) :- H1 =< H2, isSorted([H2|B]).

fill(_, 0, []) :- !.
fill(Item, Length, [Item|B]) :-
	L is Length - 1,
	fill(Item, L, B).
	
closedInterval(X, X, [X]) :- !.
closedInterval(A, B, [A|T]) :-
	Next is A + 1,
	closedInterval(Next, B, T).
	

takeSmaller([], _, []) :- !.
takeSmaller([H|B], N, [H|B2]) :- H < N, takeSmaller(B, N, B2), !.
takeSmaller([_|B], N, B2) :-takeSmaller(B, N, B2).

takeGreaterEqual([], _, []) :- !.
takeGreaterEqual([H|B], N, [H|B2]) :- H >= N, takeGreaterEqual(B, N, B2), !.
takeGreaterEqual([_|B], N, B2) :-takeGreaterEqual(B, N, B2).

quickSort([], []).
quickSort([H|B], R) :-
	takeSmaller(B, H, Smaller),
	takeGreaterEqual(B, H, Greater),
	quickSort(Smaller, SortedSmaller),
	quickSort(Greater, SortedGreater),
	concatenate(SortedSmaller, [H], LeftSorted),
	concatenate(LeftSorted, SortedGreater, R).


takeSlice(L, A, B, S) :- takeSliceImpl(L, A, B, S, 0).
takeSliceImpl(_, A, B, [], _) :- A > B, !.
takeSliceImpl([H|_], _, B, [H], B) :- !.
takeSliceImpl([H|T], A, B, [H|T2], I) :- 
	I >= A, 
	INew is I + 1, 
	takeSliceImpl(T, A, B, T2, INew),
	!.
takeSliceImpl([_|T], A, B, T2, I) :- 
	INew is I + 1, 
	takeSliceImpl(T, A, B, T2, INew).

takeLeftHalf(L, H) :- length(L, Len), B is Len // 2 - 1, takeSlice(L, 0, B, H).
takeRightHalf(L, H) :- length(L, Len), A is Len // 2, B is Len - 1, takeSlice(L, A, B, H).

mergeSortedLists([], A, A) :- !. 
mergeSortedLists(A, [], A) :- !.
mergeSortedLists([H1|B1], [H2|B2], [H1|B3]) :- H1 < H2, mergeSortedLists(B1, [H2|B2], B3), !.
mergeSortedLists([H1|B1], [H2|B2], [H2|B3]) :- mergeSortedLists([H1|B1], B2, B3).

mergeSort([], []) :- !.
mergeSort([A], [A]) :- !.
mergeSort(L, S) :-
	takeLeftHalf(L, Left),
	takeRightHalf(L, Right),
	mergeSort(Left, SortedLeft),
	mergeSort(Right, SortedRight),
	mergeSortedLists(SortedLeft, SortedRight, S).
