% Traversing graph paths

'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#paris', 'https://eyereasoner.github.io/euler#orleans').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#paris', 'https://eyereasoner.github.io/euler#chartres').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#paris', 'https://eyereasoner.github.io/euler#amiens').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#orleans', 'https://eyereasoner.github.io/euler#blois').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#orleans', 'https://eyereasoner.github.io/euler#bourges').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#blois', 'https://eyereasoner.github.io/euler#tours').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#chartres', 'https://eyereasoner.github.io/euler#lemans').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#lemans', 'https://eyereasoner.github.io/euler#angers').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#lemans', 'https://eyereasoner.github.io/euler#tours').
'https://eyereasoner.github.io/euler#oneway'('https://eyereasoner.github.io/euler#angers', 'https://eyereasoner.github.io/euler#nantes').

'https://eyereasoner.github.io/euler#path'(A, B) :-
    'https://eyereasoner.github.io/euler#oneway'(A, B).
'https://eyereasoner.github.io/euler#path'(A, C) :-
    'https://eyereasoner.github.io/euler#oneway'(A, B),
    'https://eyereasoner.github.io/euler#path'(B, C).

% query
query('https://eyereasoner.github.io/euler#path'(_City, 'https://eyereasoner.github.io/euler#nantes')).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
