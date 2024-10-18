% Goal driven Parallel Sequences -- Jos De Roo
% See background paper https://arxiv.org/pdf/2010.12027.pdf

:- use_module(library(lists)).
:- use_module(library(iso_ext)).

% find paths in the state space from initial state to goal state within limits
'https://eyereasoner.github.io/euler#findpath'(_SCOPE, Goal, Path, Duration, Cost, Belief, Comfort, Limits) :-
    findpaths([], Goal, [], 0.0, 0.0, 1.0, 1.0, Path, Duration, Cost, Belief, Comfort, Limits).

findpaths(_Maps, Goal, Path, Duration, Cost, Belief, Comfort, Path, Duration, Cost, Belief, Comfort, _Limits) :-
    Goal,
    !.
findpaths(Maps_s, Goal, Path_s, Duration_s, Cost_s, Belief_s, Comfort_s, Path, Duration, Cost, Belief, Comfort, Limits) :-
    Limits = [MaxDuration, MaxCost, MinBelief, MinComfort, MaxStagecount],
    clause('https://eyereasoner.github.io/euler#description'(Map, From, Transition, To, Action, Duration_n, Cost_n, Belief_n, Comfort_n), Where),
    From,
    Where,
    'https://eyereasoner.github.io/euler#description'(Map, From, Transition, To, Action, Duration_n, Cost_n, Belief_n, Comfort_n),
    append(Maps_s, [Map], Maps_t),
    stagecount(Maps_t, Stagecount),
    Stagecount =< MaxStagecount,
    Duration_t is Duration_s+Duration_n,
    Duration_t =< MaxDuration,
    Cost_t is Cost_s+Cost_n,
    Cost_t =< MaxCost,
    Belief_t is Belief_s*Belief_n,
    Belief_t >= MinBelief,
    Comfort_t is Comfort_s*Comfort_n,
    Comfort_t >= MinComfort,
    append(Path_s, [Action], Path_t),
    becomes(From, To),
    call_cleanup(
        findpaths(Maps_t, Goal, Path_t, Duration_t, Cost_t, Belief_t, Comfort_t, Path, Duration, Cost, Belief, Comfort, Limits),
        becomes(To, From)
    ).

% counting the number of stages (a stage is a sequence of steps in the same map)
stagecount([], 1).
stagecount([C, E|_], B) :-
    C \= E,
    !,
    stagecount(_, G),
    B is G+1.
stagecount([_|D], B) :-
    stagecount(D, B).

% linear implication
becomes(A, B) :-
    catch(A, _, fail),
    conj_list(A, C),
    forall(
        member(D, C),
        retract(D)
    ),
    conj_list(B, E),
    forall(
        member(F, E),
        assertz(F)
    ).

conj_list(true, []) :-
    !.
conj_list(A, [A]) :-
    A \= (_, _),
    A \= false,
    !.
conj_list((A, B), [A|C]) :-
    conj_list(B, C).

% test data
:- dynamic('https://eyereasoner.github.io/euler#description'/9).
:- dynamic('https://eyereasoner.github.io/euler#location'/2).

% partial map of Belgium
'https://eyereasoner.github.io/euler#description'(
    'https://eyereasoner.github.io/euler#map_be',
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#gent'),
    true,
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#brugge'),
    'https://eyereasoner.github.io/euler#drive_gent_brugge',
    1500.0,
    0.006,
    0.96,
    0.99
).
'https://eyereasoner.github.io/euler#description'(
    'https://eyereasoner.github.io/euler#map_be',
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#gent'),
    true,
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#kortrijk'),
    'https://eyereasoner.github.io/euler#drive_gent_kortrijk',
    1600.0,
    0.007,
    0.96,
    0.99
).
'https://eyereasoner.github.io/euler#description'(
    'https://eyereasoner.github.io/euler#map_be',
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#kortrijk'),
    true,
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#brugge'),
    'https://eyereasoner.github.io/euler#drive_kortrijk_brugge',
    1600.0,
    0.007,
    0.96,
    0.99
).
'https://eyereasoner.github.io/euler#description'(
    'https://eyereasoner.github.io/euler#map_be',
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#brugge'),
    true,
    'https://eyereasoner.github.io/euler#location'(S, 'https://eyereasoner.github.io/euler#oostende'),
    'https://eyereasoner.github.io/euler#drive_brugge_oostende',
    900.0,
    0.004,
    0.98,
    1.0
).

% current state
'https://eyereasoner.github.io/euler#location'('https://eyereasoner.github.io/euler#i1', 'https://eyereasoner.github.io/euler#gent').

% query
query(
    'https://eyereasoner.github.io/euler#findpath'(
        'https://eyereasoner.github.io/euler#map_be',
        'https://eyereasoner.github.io/euler#location'(_SUBJECT, 'https://eyereasoner.github.io/euler#oostende'),
        _PATH,
        _DURATION,
        _COST,
        _BELIEF,
        _COMFORT,
        [5000.0, 5.0, 0.2, 0.4, 1]
    )
).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
