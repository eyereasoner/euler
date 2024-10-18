% See https://en.wikipedia.org/wiki/Padovan_sequence

'https://eyereasoner.github.io/euler#padovan'(A, B) :-
    padovan(A, 0, 1, 1, B).

padovan(0, A, _, _, A).
padovan(1, _, A, _, A).
padovan(2, _, _, A, A).
padovan(A, B, C, D, E) :-
    A > 2,
    F is A-1,
    G is B+C,
    padovan(F, C, D, G, E).

'https://eyereasoner.github.io/euler#plastic_ratio'(A, B) :-
    'https://eyereasoner.github.io/euler#padovan'(A, C),
    D is A+1,
    'https://eyereasoner.github.io/euler#padovan'(D, E),
    B is E/C.

% query
query('https://eyereasoner.github.io/euler#padovan'(1, _ANSWER)).
query('https://eyereasoner.github.io/euler#padovan'(2, _ANSWER)).
query('https://eyereasoner.github.io/euler#padovan'(3, _ANSWER)).
query('https://eyereasoner.github.io/euler#padovan'(4, _ANSWER)).
query('https://eyereasoner.github.io/euler#padovan'(5, _ANSWER)).
query('https://eyereasoner.github.io/euler#padovan'(91, _ANSWER)).
query('https://eyereasoner.github.io/euler#padovan'(283, _ANSWER)).
query('https://eyereasoner.github.io/euler#padovan'(3674, _ANSWER)).
query('https://eyereasoner.github.io/euler#plastic_ratio'(1, _ANSWER)).
query('https://eyereasoner.github.io/euler#plastic_ratio'(10, _ANSWER)).
query('https://eyereasoner.github.io/euler#plastic_ratio'(100, _ANSWER)).
query('https://eyereasoner.github.io/euler#plastic_ratio'(1000, _ANSWER)).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
