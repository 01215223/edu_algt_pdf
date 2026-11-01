%% Laboratorium 0 - rozwiązania zadań (20-22 X)
% Każda sekcja "%%" = jedno zadanie. Uruchamiaj kolejno (Ctrl+Enter w sekcji).
% Wyniki liczbowe podane w komentarzach "->" służą do sprawdzenia.

clear; close all; clc;

%% Z1. Liczby rzeczywiste: wersja numeryczna i symboliczna
sqrt(52), nthroot(pi,4), log(3/4), exp(-4), sin(7*pi/4)                       % numerycznie
sqrt(sym(52)), sym(pi)^(1/4), log(sym(3)/4), exp(sym(-4)), sin(7*sym(pi)/4)   % symbolicznie
% -> 7.2111, 1.3313, -0.2877, 0.0183, -0.7071
% -> 2*13^(1/2), pi^(1/4), log(3/4), exp(-4), -2^(1/2)/2
vpa(sqrt(sym(52)), 10)     % to samo, ale jako liczba dziesiętna (10 cyfr)

%% Z2. Liczby zespolone - postać symboliczna
u  = sym(1i);                        % symboliczna jednostka urojona
z1 = simplify((5-7*u)/(3-u))         % -> 11/5 - 8j/5
z2 = expand((-1+u*sqrt(sym(3)))^4)   % -> -8 + 8*sqrt(3)j
conj(z1)                             % -> 11/5 + 8j/5
real(z1)                             % -> 11/5
imag(z2)                             % -> 8*sqrt(3)
abs(4*sqrt(sym(3))-8*u)              % -> 4*sqrt(7)
angle(6*u-6)                         % -> 3*pi/4   (rad2deg(...) -> 135)

%% Z3. Wszystkie pierwiastki 8. stopnia z z0 = 48 - 64j
z0 = 48-64*sym(1i);
k  = 0:7;                                       % numery pierwiastków k = 0,...,7
w  = z0^(sym(1)/8)*exp(2*sym(pi)*1i*k/8)        % symbolicznie (dokładnie)
double(w)                                       % numerycznie
abs(w)                                          % moduł każdego = 80^(1/8) ~ 1.7294
% sprawdzenie: simplify(w.^8)  -> każdy element daje 48-64j
% wersja "na skróty": syms z; double(solve(z^8==48-64j, z))   % też 8 pierwiastków

%% Z4. Równanie x^4 + a*x^3 + b*x^2 + c = 0  + rozkład na czynniki
syms x a b c
W = x^4 + a*x^3 + b*x^2 + c;               % postać ogólna
w = subs(W, [a b c], [1 9 5])              % <<< WPISZ 3 RÓŻNE CYFRY ZE SWOJEJ DATY URODZENIA
r = solve(w, x)                            % rozwiązania dokładne (bardzo długie!)
double(r)                                  % rozwiązania numeryczne
factor(w, x, 'FactorMode', 'real')         % rozkład nad R
factor(w, x, 'FactorMode', 'complex')      % rozkład nad C
vpa(factor(w, x, 'FactorMode', 'real'), 6)     % to samo, ale czytelnie
vpa(factor(w, x, 'FactorMode', 'complex'), 6)
% alternatywa numeryczna (uwaga: współczynnik przy x to 0): roots([1 1 9 0 5])

%% Z5. Funkcja wymierna na sumę ułamków prostych
syms x
f(x) = 49*x^6/((x-2)^3*(x^4-3*x^2+9));
partfrac(f(x), x)                                % nad R (domyślnie)
partfrac(f(x), x, 'FactorMode', 'full')          % nad C
vpa(partfrac(f(x), x, 'FactorMode', 'full'), 6)  % czytelniej
