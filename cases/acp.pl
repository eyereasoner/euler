% Access control policy example

:- use_module(library(lists)).
:- use_module(library(iso_ext)).

'https://eyereasoner.github.io/euler#policy'('https://eyereasoner.github.io/euler#test1', 'https://eyereasoner.github.io/euler#PolicyX').
'https://eyereasoner.github.io/euler#has'('https://eyereasoner.github.io/euler#test1', 'https://eyereasoner.github.io/euler#A').
'https://eyereasoner.github.io/euler#has'('https://eyereasoner.github.io/euler#test1', 'https://eyereasoner.github.io/euler#B').
'https://eyereasoner.github.io/euler#has'('https://eyereasoner.github.io/euler#test1', 'https://eyereasoner.github.io/euler#C').
'https://eyereasoner.github.io/euler#Policy'('https://eyereasoner.github.io/euler#PolicyX').
'https://eyereasoner.github.io/euler#allOf'('https://eyereasoner.github.io/euler#PolicyX', 'https://eyereasoner.github.io/euler#A').
'https://eyereasoner.github.io/euler#allOf'('https://eyereasoner.github.io/euler#PolicyX', 'https://eyereasoner.github.io/euler#B').
'https://eyereasoner.github.io/euler#anyOf'('https://eyereasoner.github.io/euler#PolicyX', 'https://eyereasoner.github.io/euler#C').
'https://eyereasoner.github.io/euler#noneOf'('https://eyereasoner.github.io/euler#PolicyX', 'https://eyereasoner.github.io/euler#D').

'https://eyereasoner.github.io/euler#pass'(A, 'https://eyereasoner.github.io/euler#allOfTest') :-
    'https://eyereasoner.github.io/euler#policy'(B, A),
    'https://eyereasoner.github.io/euler#Policy'(A),
    forall(
        'https://eyereasoner.github.io/euler#allOf'(A, C),
        'https://eyereasoner.github.io/euler#has'(B, C)
    ).

'https://eyereasoner.github.io/euler#pass'(A, 'https://eyereasoner.github.io/euler#anyOfTest') :-
    'https://eyereasoner.github.io/euler#policy'(B, A),
    'https://eyereasoner.github.io/euler#Policy'(A),
    findall(C,
        (
            'https://eyereasoner.github.io/euler#anyOf'(A, C),
            'https://eyereasoner.github.io/euler#has'(B, C)
        ),
        D
    ),
    length(D, E),
    E \= 0.

'https://eyereasoner.github.io/euler#pass'(A, 'https://eyereasoner.github.io/euler#noneOfTest') :-
    'https://eyereasoner.github.io/euler#policy'(B, A),
     'https://eyereasoner.github.io/euler#Policy'(A),
    findall(C,
        (
            'https://eyereasoner.github.io/euler#noneOf'(A, C),
            'https://eyereasoner.github.io/euler#has'(B, C)
        ),
        D
    ),
    length(D, 0).

% query
query(
    (
        'https://eyereasoner.github.io/euler#Policy'(_A),
        'https://eyereasoner.github.io/euler#pass'(_A, 'https://eyereasoner.github.io/euler#allOfTest'),
        'https://eyereasoner.github.io/euler#pass'(_A, 'https://eyereasoner.github.io/euler#anyOfTest'),
        'https://eyereasoner.github.io/euler#pass'(_A, 'https://eyereasoner.github.io/euler#noneOfTest')
    )
).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
