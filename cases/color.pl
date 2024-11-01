% See https://en.wikipedia.org/wiki/Four_color_theorem

:- use_module(library(lists)).

'https://eyereasoner.github.io/euler#color'(_Map, Places) :-
    findall([Place, _], neighbours(Place, _), Places),
    places(Places).

places([]).
places([[Place, Color]|Tail]) :-
    places(Tail),
    neighbours(Place, Neighbours),
    member(Color, [red, green, blue, yellow]),
    \+ (member([Neighbour, Color], Tail), member(Neighbour, Neighbours)).

% map of European Union
neighbours(belgium, [france, netherlands, luxemburg, germany]).
neighbours(netherlands, [belgium, germany]).
neighbours(luxemburg, [belgium, france, germany]).
neighbours(france, [spain, belgium, luxemburg, germany, italy]).
neighbours(germany, [netherlands, belgium, luxemburg, denmark, france, austria, poland, czech_republic]).
neighbours(italy, [france, austria, slovenia]).
neighbours(denmark, [germany]).
neighbours(ireland, []).
neighbours(greece, [bulgaria]).
neighbours(spain, [france, portugal]).
neighbours(portugal, [spain]).
neighbours(austria, [czech_republic, germany, hungary, italy, slovenia, slovakia]).
neighbours(sweden, [finland]).
neighbours(finland, [sweden]).
neighbours(cyprus, []).
neighbours(malta, []).
neighbours(poland, [germany, czech_republic, slovakia, lithuania]).
neighbours(hungary, [austria, slovakia, romania, croatia, slovenia]).
neighbours(czech_republic, [germany, poland, slovakia, austria]).
neighbours(slovakia, [czech_republic, poland, hungary, austria]).
neighbours(slovenia, [austria, italy, hungary, croatia]).
neighbours(estonia, [latvia]).
neighbours(latvia, [estonia, lithuania]).
neighbours(lithuania, [latvia, poland]).
neighbours(bulgaria, [romania, greece]).
neighbours(romania, [hungary, bulgaria]).
neighbours(croatia, [slovenia, hungary]).

% query
query('https://eyereasoner.github.io/euler#color'(map1, _ANSWER)).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    halt.
