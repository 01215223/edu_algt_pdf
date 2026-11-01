%% Laboratorium 1 - rozwiązania zadań (3-5 XI)  [wykresy]
% Każda sekcja "%%" = jedno zadanie. Uruchamiaj kolejno (Ctrl+Enter w sekcji).

clear; close all; clc;

%% Z1. f(x) = 2cos^2(x) - x  oraz proste 2-x (fioletowa) i -x (niebieska)
syms x
fplot(2*cos(x)^2 - x, [-2*pi 2*pi], 'g-')     % zielona, linia ciągła
hold on
fplot(2 - x, [-2*pi 2*pi], 'm--')             % fioletowa (magenta), przerywana
fplot(-x,    [-2*pi 2*pi], 'b--')             % niebieska, przerywana
grid on
legend('f', 'f_1', 'f_2', 'Location', 'best')
hold off

%% Z2. Krzywa parametryczna x = cos(a*t), y = sin(b*t)
syms t
a = 3; b = 5;                                  % względnie pierwsze (NWD = 1), nie więcej niż 20
fplot(cos(a*t), sin(b*t), [0 2*pi], 'r')       % czerwona linia
axis equal                                     % jednakowe skale na osiach
grid on                                        % widoczna siatka

%% Z3. Rodzina |x|^a + |y|^a = 1  dla a = 1, a < 1, a > 1
syms x y
obszar = [-1.5 1.5 -1.5 1.5];                  % [xmin xmax ymin ymax]
fimplicit(abs(x)+abs(y)==1, obszar, 'b')              % a = 1  -> kwadrat obrócony
hold on
fimplicit(abs(x)^0.5+abs(y)^0.5==1, obszar, 'r')      % a = 0.5 (< 1) -> "gwiazda"
fimplicit(abs(x)^2+abs(y)^2==1, obszar, 'g')          % a = 2  (> 1) -> okrąg
axis equal, grid on, hold off
legend('a = 1', 'a = 0.5', 'a = 2')

%% Z4. Trójkąt o wierzchołkach (2,0), (-1,3), (5,4)
X = [2 -1 5 2];  Y = [0 3 4 0];       % ostatni punkt = pierwszy, żeby zamknąć trójkąt
plot(X, Y, 'b--o')                    % boki: niebieskie przerywane, wierzchołki: kółka
axis equal, grid on

% Dla chętnych: każdy bok innym kolorem, wierzchołki jednakowe
figure
plot(X(1:2), Y(1:2), 'r-', 'LineWidth', 2), hold on
plot(X(2:3), Y(2:3), 'g-', 'LineWidth', 2)
plot(X(3:4), Y(3:4), 'b-', 'LineWidth', 2)
plot(X, Y, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8)
axis equal, grid on, hold off

%% Z5. Pierwiastki 8. stopnia z 48-64j + okrąg |z| = r
syms t
w = abs(48-64i)^(1/8)*exp(1i*(angle(48-64i)+2*pi*(0:7))/8);   % 8 pierwiastków (numerycznie)
r = abs(w(1));                                                % moduł = 80^(1/8) ~ 1.7294
plot(real(w), imag(w), 'ms', 'MarkerFaceColor', 'm')          % fioletowe kwadraciki
hold on
fplot(r*cos(t), r*sin(t), [0 2*pi], 'g')                      % okrąg |z| = r, zielony
axis equal, grid on, hold off
legend('pierwiastki', '|z| = r', 'Location', 'best')
% wersja symboliczna (te same punkty): syms z; w = double(solve(z^8==48-64j, z));

%% Z6. Powierzchnia i wykres konturowy f(x,y) = sin(x^2 + y^2)
syms x y
f(x,y) = sin(x^2 + y^2);
figure
fsurf(f, [-3 3 -3 3])
colorbar                                  % pasek skali kolorów (z prawej)
colormap(jet)                             % wypróbuj też: parula, hot, gray, winter
xlabel('x'), ylabel('y'), zlabel('sin(x^2+y^2)')
figure
fcontour(f, [-3 3 -3 3], 'Fill', 'on')    % kontury z pokolorowanymi obszarami
colormap(jet), colorbar, axis equal
