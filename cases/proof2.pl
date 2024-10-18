% Showing a proof that Socrates is a mortal
% based on https://www.metalevel.at/acomip/

:- op(750, xfy, =>).

% clauses
mi_clause('https://eyereasoner.github.io/euler#Man'('https://eyereasoner.github.io/euler#Socrates'), true).

mi_clause('https://eyereasoner.github.io/euler#Mortal'(X), g('https://eyereasoner.github.io/euler#Man'(X))).

% proof tree
'https://eyereasoner.github.io/euler#mi_tree'(true, true).
'https://eyereasoner.github.io/euler#mi_tree'((A, B), (TA, TB)) :-
    'https://eyereasoner.github.io/euler#mi_tree'(A, TA),
    'https://eyereasoner.github.io/euler#mi_tree'(B, TB).
'https://eyereasoner.github.io/euler#mi_tree'(g(G), TBody => G) :-
    mi_clause(G, Body),
    'https://eyereasoner.github.io/euler#mi_tree'(Body, TBody).

% query
query('https://eyereasoner.github.io/euler#mi_tree'(g('https://eyereasoner.github.io/euler#Mortal'(_X)), _Y)).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
