% beetle example 6

:- use_module(library(iso_ext)).
:- use_module(library(lists)).
:- use_module(library(terms)).

:- dynamic(brake/0).
:- dynamic('http://www.w3.org/2000/10/swap/log#sequent'/2).
:- dynamic('urn:example:is'/2).

% beetle is a car
'urn:example:Car'('urn:example:beetle').

% all cars are green or blue
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:Car'(A),
    [
        'urn:example:is'(A, 'urn:example:green'),
        'urn:example:is'(A, 'urn:example:blue')
    ]
).

% green things are nice or pretty
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:green'),
    [
        'urn:example:is'(A, 'urn:example:nice'),
        'urn:example:is'(A, 'urn:example:pretty')
    ]
).

% pretty things are beautiful
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

% blue things are beautiful
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:blue'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

% cars are not beautiful
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:Car'(A),
    [
        'http://www.w3.org/2000/10/swap/log#sequent'(
           'urn:example:is'(A, 'urn:example:beautiful'),
           []
        )
    ]
).

% resolution
'http://www.w3.org/2000/10/swap/log#sequent'(
    (
        'http://www.w3.org/2000/10/swap/log#sequent'(A, B),
        select(C, B, D),
        'http://www.w3.org/2000/10/swap/log#sequent'(C, E),
        length(E, F),
        F =< 1,
        append(E, D, G)
    ),
    [
        'http://www.w3.org/2000/10/swap/log#sequent'(A, G)
    ]
).

% factoring
'http://www.w3.org/2000/10/swap/log#sequent'(
    (
        'http://www.w3.org/2000/10/swap/log#sequent'(A, B),
        list_to_set(B, C)
    ),
    [
        'http://www.w3.org/2000/10/swap/log#sequent'(A, C)
    ]
).

% sequent
sequent :-
    (   'http://www.w3.org/2000/10/swap/log#sequent'(A, Bs),
        A,
        (   Bs = []
        ->  write(fuse('http://www.w3.org/2000/10/swap/log#sequent'(A, Bs), A)),
            nl,
            halt(2)
        ;   true
        ),
        Bs = [B],
        \+B,
        step(B),
        retract(brake),
        false
    ;   brake,
        !
    ;   assertz(brake),
        sequent
    ).

step((A, B)) :-
    !,
    step(A),
    step(B).
step(A) :-
    (   \+A
    ->  assertz(A)
    ;   true
    ).

% query
query('urn:example:is'(_A, _B)).

test :-
    sequent,
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
