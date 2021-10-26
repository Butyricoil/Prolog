% Базовые факты: кто чьи родители.
parent(john, mary).   % Джон — родитель Мэри.
parent(mary, anne).   % Мэри — родитель Энн.
parent(john, paul).   % Джон — родитель Пола.
parent(paul, alice).  % Пол — родитель Алисы.
parent(anne, mike).   % Энн — родитель Майка.

% Правило: если X является родителем Y, то X — предок Y.
ancestor(X, Y) :- parent(X, Y).

% Правило: если X — предок Z, а Z — предок Y, то X — предок Y.
ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).

% Пример запроса: Кто является предком Алисы?
% ?- ancestor(X, alice).
% Ответ: X = john ;
%         X = paul ;
%         X = mary.
