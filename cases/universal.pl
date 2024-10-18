% Examples of universal statements

% Every x: type(x, Resource)
'http://www.w3.org/2000/01/rdf-schema#Resource'(_).

% Everybody loves somebody who is lonely
'https://eyereasoner.github.io/euler#loves'(A, skolem(A)).
'https://eyereasoner.github.io/euler#is'(skolem(_), 'https://eyereasoner.github.io/euler#lonely').

% query
query('http://www.w3.org/2000/01/rdf-schema#Resource'('https://eyereasoner.github.io/euler#Pat')).
query(
    (
        'https://eyereasoner.github.io/euler#loves'('https://eyereasoner.github.io/euler#Bob', X),
        'https://eyereasoner.github.io/euler#is'(X, 'https://eyereasoner.github.io/euler#lonely')
    )
).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
