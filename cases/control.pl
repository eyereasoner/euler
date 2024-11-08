% Examples of control systems.

% facts
'https://eyereasoner.github.io/euler#measurement1'('https://eyereasoner.github.io/euler#input1', [6, 11]).
'https://eyereasoner.github.io/euler#measurement1'('https://eyereasoner.github.io/euler#disturbance2', [45, 39]).

'https://eyereasoner.github.io/euler#measurement2'('https://eyereasoner.github.io/euler#input2', true).

'https://eyereasoner.github.io/euler#measurement3'('https://eyereasoner.github.io/euler#input3', 56967).
'https://eyereasoner.github.io/euler#measurement3'('https://eyereasoner.github.io/euler#disturbance1', 35766).

'https://eyereasoner.github.io/euler#measurement4'('https://eyereasoner.github.io/euler#output2', 24).

'https://eyereasoner.github.io/euler#query1'('https://eyereasoner.github.io/euler#state1', 80).

'https://eyereasoner.github.io/euler#query2'('https://eyereasoner.github.io/euler#state2', false).

'https://eyereasoner.github.io/euler#query3'('https://eyereasoner.github.io/euler#state3', 22).

'https://eyereasoner.github.io/euler#target2'('https://eyereasoner.github.io/euler#output2', 29).

% control system
'https://eyereasoner.github.io/euler#control1'('https://eyereasoner.github.io/euler#actuator1', A) :-
    'https://eyereasoner.github.io/euler#measurement10'('https://eyereasoner.github.io/euler#input1', B),
    'https://eyereasoner.github.io/euler#measurement2'('https://eyereasoner.github.io/euler#input2', true),
    'https://eyereasoner.github.io/euler#measurement3'('https://eyereasoner.github.io/euler#disturbance1', C),
    D is B*19.6,            % proportial part
    E is log(C)/log(10),    % compensation part
    A is D-E.               % simple feedforward control

'https://eyereasoner.github.io/euler#control1'('https://eyereasoner.github.io/euler#actuator2', A) :-
    'https://eyereasoner.github.io/euler#measurement3'('https://eyereasoner.github.io/euler#input3', _),
    'https://eyereasoner.github.io/euler#query3'('https://eyereasoner.github.io/euler#state3', B),
    'https://eyereasoner.github.io/euler#measurement4'('https://eyereasoner.github.io/euler#output2', C),
    'https://eyereasoner.github.io/euler#target2'('https://eyereasoner.github.io/euler#output2', D),
    E is D-C,               % error
    F is B-C,               % differential error
    G is 5.8*E,             % proportial part
    H is 7.3/E,             % nonlinear factor
    I is H*F,               % nonlinear differential part
    A is G+I.               % PND feedback control

'https://eyereasoner.github.io/euler#measurement10'(A, B) :-
    'https://eyereasoner.github.io/euler#measurement1'(A, [C, D]),
    C<D,
    B is (D-C)^0.5.

'https://eyereasoner.github.io/euler#measurement10'(A, B) :-
    'https://eyereasoner.github.io/euler#measurement1'(A, [B, C]),
    B >= C.

% query
query('https://eyereasoner.github.io/euler#control1'(_A, _B)).

test :-
    query(Q),
    Q,
    write_term(Q, [numbervars(true), quoted(true), double_quotes(true)]),
    write('.\n'),
    fail;
    halt.
