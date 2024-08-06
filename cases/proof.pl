% Showing a proof for peano factorial calculation
% based on https://www.metalevel.at/acomip/

:- op(750, xfy, =>).

mi_clause(factorial(0, s(0)), true).
mi_clause(factorial(s(N), F), (g(factorial(N, F1)), g(product(s(N), F1, F)))).

mi_clause(product(0, _, 0), true).
mi_clause(product(s(N), M, P), (g(product(N, M, K)), g(sum(K, M, P)))).

mi_clause(sum(0, M, M), true).
mi_clause(sum(s(N), M, s(K)), g(sum(N, M, K))).

'https://eyereasoner.github.io/see#mi_tree'(true, true).
'https://eyereasoner.github.io/see#mi_tree'((A, B), (TA, TB)) :-
    'https://eyereasoner.github.io/see#mi_tree'(A, TA),
    'https://eyereasoner.github.io/see#mi_tree'(B, TB).
'https://eyereasoner.github.io/see#mi_tree'(g(G), TBody => G) :-
    mi_clause(G, Body),
    'https://eyereasoner.github.io/see#mi_tree'(Body, TBody).

% query
query('https://eyereasoner.github.io/see#mi_tree'(g(factorial(s(s(s(s(0)))), _X)), _Y)).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
