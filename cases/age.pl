% age checker

:- use_module(library(time)).
:- use_module(library(lists)).

% person data
'https://eyereasoner.github.io/euler#birthDay'('https://eyereasoner.github.io/euler#patH', [1944, 8, 21]).

% is the age of a person above some years?
'https://eyereasoner.github.io/euler#ageAbove'(S, A) :-
    'https://eyereasoner.github.io/euler#birthDay'(S, [Yb, Mb, Db]), 
    local_time(Yl, Ml, Dl, _, _, _), 
    (   Yl > Yb+A
    ->  true
    ;   (   Yl =:= Yb+A
        ->  Ml > Mb
        ;   Ml =:= Mb, 
            Dl >= Db
        )
    ).

local_time(A, B, C, D, E, F) :-
    catch(date_time(A, B, C, D, E, F), _, get_time(A, B, C, D, E, F)).

get_time(A, B, C, D, E, F) :-
    current_time(L), 
    maplist(time_get_num, [L, L, L, L, L, L], ['Y', 'm', 'd', 'H', 'M', 'S'], [A, B, C, D, E, F]).

time_get_num(A, B, C) :-
    memberchk(B=D, A), 
    number_chars(C, D).

% query
query('https://eyereasoner.github.io/euler#ageAbove'(_, 80)).

test :-
    query(Q), 
    Q, 
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]), 
    write('.\n'), 
    fail;
    halt.
