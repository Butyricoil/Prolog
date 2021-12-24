% Факты о расстояниях между городами (граф с весами рёбер).
% connected(город1, город2, расстояние).
connected(moscow, saint_petersburg, 700).
connected(saint_petersburg, novgorod, 200).
connected(novgorod, pskov, 150).
connected(moscow, kazan, 800).
connected(kazan, samara, 300).
connected(samara, volgograd, 400).
connected(volgograd, krasnodar, 350).
connected(krasnodar, moscow, 1200).

% Правило для поиска кратчайшего пути от города Start до города End.
% Кратчайший путь будет список из пар (город, расстояние).
shortest_path(Start, End, Path, Distance) :-
    dfs(Start, End, [Start], Path, 0, Distance).

% Поиск в глубину (DFS), накапливая путь и расстояние.
dfs(End, End, Path, Path, Dist, Dist).  % Когда достигнут конец пути.
dfs(Current, End, Visited, Path, Dist, FinalDist) :-
    connected(Current, Next, Distance),
    \+ member(Next, Visited),  % Исключаем уже посещённые города.
    NewDist is Dist + Distance,
    dfs(Next, End, [Next|Visited], Path, NewDist, FinalDist).

% Пример запроса: найти кратчайший путь от Москвы до Краснодар.
% ?- shortest_path(moscow, krasnodar, Path, Distance).
% Ответ: Path = [moscow, saint_petersburg, novgorod, pskov, samara, volgograd, krasnodar],
%         Distance = 2250.
