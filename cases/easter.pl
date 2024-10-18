% calculate easter date

:- use_module(library(between)).

'https://eyereasoner.github.io/euler#easter'(Year, Month, Day) :-
    A is Year rem 19,
    B is Year//100,
    C is Year rem 100,
    D is (19*A+B-B//4-((B-(B+8)//25+1)//3)+15) rem 30,
    E is (32+2*(B rem 4)+2*(C//4)-D-(C rem 4)) rem 7,
    F is D+E-7*((A+11*D+22*E)//451)+114,
    Month is F//31,
    Day is F rem 31+1.

% query
query('https://eyereasoner.github.io/euler#easter'(Year, _Month, _Day)) :-
    between(2021, 2050, Year).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
