% Факты о связях между городами.
connected(moscow, saint_petersburg).
connected(saint_petersburg, novgorod).
connected(novgorod, pskov).
connected(moscow, kazan).
connected(kazan, samara).
connected(samara, volgograd).
connected(volgograd, krasnodar).

% Правило: если два города непосредственно связаны, то существует маршрут между ними.
route(X, Y) :- connected(X, Y).

% Правило: если существует маршрут от X до Z, и Z связано с Y, то существует маршрут от X до Y.
route(X, Y) :-
    connected(X, Z),
    route(Z, Y).

% Пример запроса: найти все маршруты между Москвой и Волгоградом.
% ?- route(moscow, volgograd).
% Ответ: true.
% Пример запроса: найти все маршруты между Москвой и Псковом.
% ?- route(moscow, pskov).
% Ответ: true.
% Пример запроса: найти маршруты между городами, например, от Казани до Санкт-Петербурга.
% ?- route(kazan, saint_petersburg).
% Ответ: true.
% это решение взялу у димы