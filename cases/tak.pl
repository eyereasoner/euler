% Takeuchi function

'https://eyereasoner.github.io/euler#tak'(X, Y, Z, Z) :-
    X =< Y,
    !.
'https://eyereasoner.github.io/euler#tak'(X, Y, Z, A) :-
    X1 is X-1,
    'https://eyereasoner.github.io/euler#tak'(X1, Y, Z, A1),
    Y1 is Y-1,
    'https://eyereasoner.github.io/euler#tak'(Y1, Z, X, A2),
    Z1 is Z-1,
    'https://eyereasoner.github.io/euler#tak'(Z1, X, Y, A3),
    'https://eyereasoner.github.io/euler#tak'(A1, A2, A3, A).

% query
query('https://eyereasoner.github.io/euler#tak'(34, 13, 8, _ANSWER)).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    halt.
