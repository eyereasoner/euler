% Good Cobbler
% Example from https://shs.hal.science/halshs-04148373/document
% Using term logic http://intrologic.stanford.edu/chapters/chapter_11.html

% Some x is a good cobbler
'https://eyereasoner.github.io/euler#is'('https://eyereasoner.github.io/.well-known/genid/995bae55-140a-4a1a-b68f-bc0153f79503#x', 'https://eyereasoner.github.io/euler#good'('https://eyereasoner.github.io/euler#Cobbler')).

% query
% is there someone x which is good at some y
query('https://eyereasoner.github.io/euler#is'(_X, 'https://eyereasoner.github.io/euler#good'(_Y))).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
