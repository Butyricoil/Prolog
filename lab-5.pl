% Факты о дорогах между городами (город1, город2, тип_дороги).
road(moscow, saint_petersburg, highway).
road(saint_petersburg, novgorod, dirt_road).
road(novgorod, pskov, highway).
road(moscow, kazan, dirt_road).
road(kazan, samara, highway).
road(samara, volgograd, dirt_road).
road(volgograd, krasnodar, highway).
road(krasnodar, moscow, highway).
road(kazan, moscow, highway).

% Правило: если два города соединены дорогой нужного типа, то между ними можно пройти.
can_travel(X, Y) :- road(X, Y, _).
can_travel(X, Y) :- road(X, Z, _), can_travel(Z, Y).

% Правило для поиска самого короткого пути между городами.
shortest_path(Start, End, Path) :-
    find_shortest(Start, End, [Start], Path).

% Рекурсивное правило для нахождения самого короткого пути.
find_shortest(End, End, Path, Path).
find_shortest(Start, End, Visited, Path) :-
    can_travel(Start, Next),  % Ищем доступный следующий город
    \+ member(Next, Visited), % Не посещали ранее
    find_shortest(Next, End, [Next|Visited], Path).
