% beetle example 12

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

% pretty things are pretty1 or pretty2
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty'),
    [
        'urn:example:is'(A, 'urn:example:pretty1'),
        'urn:example:is'(A, 'urn:example:pretty2')
    ]
).

% nice things are nice1 or nice2
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:nice'),
    [
        'urn:example:is'(A, 'urn:example:nice1'),
        'urn:example:is'(A, 'urn:example:nice2')
    ]
).

% pretty1 things are pretty11 or pretty12
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty1'),
    [
        'urn:example:is'(A, 'urn:example:pretty11'),
        'urn:example:is'(A, 'urn:example:pretty12')
    ]
).

% pretty2 things are pretty21 or pretty22
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty2'),
    [
        'urn:example:is'(A, 'urn:example:pretty21'),
        'urn:example:is'(A, 'urn:example:pretty22')
    ]
).

% nice1 things are nice11 or nice12
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:nice1'),
    [
        'urn:example:is'(A, 'urn:example:nice11'),
        'urn:example:is'(A, 'urn:example:nice12')
    ]
).

% nice2 things are nice21 or nice22
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:nice2'),
    [
        'urn:example:is'(A, 'urn:example:nice21'),
        'urn:example:is'(A, 'urn:example:nice22')
    ]
).

% pretty or nice or blue things are beautiful
'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty11'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty12'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty21'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:pretty22'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:nice11'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:nice12'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:nice21'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:nice22'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'(A, 'urn:example:blue'),
    [
        'urn:example:is'(A, 'urn:example:beautiful')
    ]
).

'http://www.w3.org/2000/10/swap/log#sequent'(
    'urn:example:is'('urn:example:beetle', 'urn:example:beautiful'),
    [
        'urn:example:is'('urn:example:test', true)
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
