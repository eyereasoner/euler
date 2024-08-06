% Meta-interpretation
% Original code from https://www.youtube.com/watch?v=nmBkU-l1zyc&t=1870s

'https://eyereasoner.github.io/see#mi'([]).
'https://eyereasoner.github.io/see#mi'([G|Gs]) :-
    head_body_(G, Goals, Gs),
    'https://eyereasoner.github.io/see#mi'(Goals).

head_body_('https://eyereasoner.github.io/see#mi'([]), Rs, Rs).
head_body_('https://eyereasoner.github.io/see#mi'([G|Gs]), [head_body_(G, Goals, Gs), 'https://eyereasoner.github.io/see#mi'(Goals)|Rs], Rs).

head_body_(head_body_(Head, Goals0, Goals), Rs, Rs) :-
    head_body_(Head, Goals0, Goals).

head_body_(factorial(0, s(0)), Rs, Rs).
head_body_(factorial(s(N), F), [factorial(N, F1), prod(s(N), F1, F)|Rs], Rs).

head_body_(prod(0, _, 0), Rs, Rs).
head_body_(prod(s(N), M, P), [prod(N, M, K), sum(K, M, P)|Rs], Rs).

head_body_(sum(0, M, M), Rs, Rs).
head_body_(sum(s(N), M, s(K)), [sum(N, M, K)|Rs], Rs).

% query
query('https://eyereasoner.github.io/see#mi'(['https://eyereasoner.github.io/see#mi'(['https://eyereasoner.github.io/see#mi'(['https://eyereasoner.github.io/see#mi'(['https://eyereasoner.github.io/see#mi'([factorial(s(s(s(s(s(s(0)))))), _X)])])])])])).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
