% Socrates is a mortal

'https://eyereasoner.github.io/euler#Man'('https://eyereasoner.github.io/euler#Socrates').

'https://eyereasoner.github.io/euler#Mortal'(X) :-
    'https://eyereasoner.github.io/euler#Man'(X).

% query
query('https://eyereasoner.github.io/euler#Mortal'(_IND)).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
