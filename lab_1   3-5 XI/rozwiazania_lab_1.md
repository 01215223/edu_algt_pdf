# Lab_1 (3–5 XI) — rozwiązania krok po kroku (wykresy)

Kod do wklejenia: **`rozwiazania_lab_1.m`** (sekcje `%% Z1` … `%% Z6` = zadania).
Na liście jest 6 zadań, a wystarczy zrobić 5 — wszystkie poniżej są krótkie, więc można oddać komplet.

Przydatne oznaczenia stylu linii: `'-'` ciągła, `'--'` przerywana, `':'` kropkowana, `'-.'` kreska-kropka;
kolory: `'r'` czerwony, `'g'` zielony, `'b'` niebieski, `'m'` fioletowy (magenta), `'k'` czarny;
znaczniki: `'o'` kółko, `'s'` kwadrat, `'^'` trójkąt, `'*'` gwiazdka.

---

## Z1. f(x) = 2cos²x − x oraz proste 2 − x i −x na [−2π, 2π]

Wg dokumentacji `fplot`: `fplot(f, [xmin xmax], 'styl_kolor')`.

**Kod:**

```matlab
syms x
fplot(2*cos(x)^2 - x, [-2*pi 2*pi], 'g-')     % zielona, ciągła
hold on
fplot(2 - x, [-2*pi 2*pi], 'm--')             % fioletowa, przerywana
fplot(-x,    [-2*pi 2*pi], 'b--')             % niebieska, przerywana
grid on
legend('f', 'f_1', 'f_2', 'Location', 'best')
hold off
```

**Co ma być na rysunku:** zielona fala `2cos²x − x` (okres π, opada w prawo), przecinająca
fioletową prostą `2 − x` (punkt (1,1)) i niebieską `−x` (przechodzi przez początek układu).
Legenda w kolejności rysowania: `f`, `f_1`, `f_2`.

**Uwagi:** `hold on` przed drugim wykresem, `hold off` na końcu. Kolejność argumentów w legendzie
musi odpowiadać kolejności rysowania. Gdyby `'m'` (magenta) uznano za zbyt różową —
to i tak standardowy „fiolet” w MATLAB-ie.

---

## Z2. Krzywa parametryczna x = cos(a·t), y = sin(b·t)

Bierzemy dwie liczby naturalne **względnie pierwsze**, ≤ 20, np. a = 3, b = 5 (NWD(3,5) = 1).

**Kod:**

```matlab
syms t
a = 3; b = 5;
fplot(cos(a*t), sin(b*t), [0 2*pi], 'r')      % czerwona linia
axis equal                                    % jednakowe skale
grid on
```

**Co ma być na rysunku:** zamknięta czerwona krzywa Lissajous wpisana w kwadrat
[−1,1]×[−1,1]; dla a = 3, b = 5 ma 3 „pętle” w pionie i 5 w poziomie. `axis equal` jest
konieczne, żeby proporcje były prawdziwe (bez tego wyjdzie rozciągnięta figura).

---

## Z3. Rodzina |x|^a + |y|^a = 1 dla a = 1, a < 1, a > 1

**Kod:**

```matlab
syms x y
obszar = [-1.5 1.5 -1.5 1.5];                 % [xmin xmax ymin ymax]
fimplicit(abs(x)+abs(y)==1, obszar, 'b')              % a = 1
hold on
fimplicit(abs(x)^0.5+abs(y)^0.5==1, obszar, 'r')      % a = 0.5  (< 1)
fimplicit(abs(x)^2+abs(y)^2==1, obszar, 'g')          % a = 2    (> 1)
axis equal, grid on, hold off
legend('a = 1', 'a = 0.5', 'a = 2')
```

**Co ma być na rysunku:**

* a = 1 → kwadrat obrócony o 45° (romb) o wierzchołkach (±1, 0), (0, ±1),
* a = 0.5 → wklęsła „gwiazda” / asteroida (ramiona wciągnięte do środka),
* a = 2 → okrąg jednostkowy.

**Uwaga:** dla `a < 1` nie używaj `a = 0` — wtedy równanie przestaje opisywać krzywą.

---

## Z4. Trójkąt o wierzchołkach (2,0), (−1,3), (5,4)

**Kod:**

```matlab
X = [2 -1 5 2];  Y = [0 3 4 0];       % ostatni punkt = pierwszy -> zamyka trójkąt
plot(X, Y, 'b--o')                    % niebieska przerywana + kółka w wierzchołkach
axis equal, grid on
```

**Co ma być na rysunku:** niebieski przerywany obwód trójkąta, w każdym wierzchołku kółko.
Sztuczka: `plot` łączy punkty **po kolei**, więc na końcu listy trzeba powtórzyć pierwszy
wierzchołek — inaczej brakuje boku (5,4)→(2,0).

**Dla chętnych** (każdy bok innym kolorem, wierzchołki jednakowe):

```matlab
figure
plot(X(1:2), Y(1:2), 'r-', 'LineWidth', 2), hold on
plot(X(2:3), Y(2:3), 'g-', 'LineWidth', 2)
plot(X(3:4), Y(3:4), 'b-', 'LineWidth', 2)
plot(X, Y, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8)
axis equal, grid on, hold off
```

---

## Z5. Pierwiastki 8. stopnia z 48 − 64j na płaszczyźnie zespolonej

Pierwiastki: `w_k = |z₀|^(1/8)·e^( j(φ+2πk)/8 )`, k = 0,…,7. Tu |z₀| = 80, φ = arg(48 − 64j).

**Kod:**

```matlab
syms t
w = abs(48-64i)^(1/8)*exp(1i*(angle(48-64i)+2*pi*(0:7))/8);   % 8 pierwiastków
r = abs(w(1));                                                % moduł = 80^(1/8) ~ 1.7294
plot(real(w), imag(w), 'ms', 'MarkerFaceColor', 'm')          % fioletowe kwadraciki
hold on
fplot(r*cos(t), r*sin(t), [0 2*pi], 'g')                      % okrąg |z| = r
axis equal, grid on, hold off
legend('pierwiastki', '|z| = r', 'Location', 'best')
```

**Co ma być na rysunku:** osiem fioletowych kwadracików równo co 45° na okręgu o promieniu
r ≈ 1.7294, przez nie przechodzi zielony okrąg. Pierwszy pierwiastek to ≈ 1.7178 − 0.2000j.

**Uwaga:** `'s'` = kwadracik, `'m'` = magenta (fiolet). Wartości nie muszą być wypisywane —
wystarczy sam wykres, ale warto sprawdzić `w(1)^8` ≈ 48 − 64j.

Zamiast wzoru można też użyć `solve` (punkty identyczne): `syms z; w = double(solve(z^8 == 48-64j, z));`

---

## Z6. Powierzchnia i kontury f(x,y) = sin(x² + y²) na [−3,3]×[−3,3]

**Kod:**

```matlab
syms x y
f(x,y) = sin(x^2 + y^2);
figure
fsurf(f, [-3 3 -3 3])
colorbar                                  % pasek skali kolorów z prawej
colormap(jet)                             % wypróbuj: parula, hot, gray, winter
xlabel('x'), ylabel('y'), zlabel('sin(x^2+y^2)')
figure
fcontour(f, [-3 3 -3 3], 'Fill', 'on')    % kontury z wypełnieniem
colormap(jet), colorbar, axis equal
```

**Co ma być na rysunku:**

* `fsurf` — „po falach” współśrodkowe pierścienie (bo argument to x² + y²), pasek kolorów po prawej;
* `fcontour` z `'Fill','on'` — te same pierścienie widziane z góry, jako pokolorowane obszary
  między poziomicami. Dodatkowo można ustawić `'LevelStep', 0.2` (gęstość poziomic) i `'LineColor','k'`.

**Uwaga:** `colormap` dotyczy całej figury — jeśli chcesz porównać kilka palet, zrób to
w osobnych `figure`.

---

## Najczęstsze pułapki (skrót)

1. Brak `hold on` → drugi wykres kasuje pierwszy; brak `hold off` → następne zadanie rysuje na starym rysunku.
2. Brak `axis equal` → koła wychodzą jako elipsy, a „jednakowe skale” są wymagane w Z2, Z5.
3. `plot` łączy punkty w podanej kolejności — przy wielokącie trzeba powtórzyć pierwszy wierzchołek.
4. Styl linii podajemy po zakresie: `fplot(f, [-2*pi 2*pi], 'g-')`.
5. `syms t` musi być **przed** użyciem `t` w `fplot(r*cos(t), r*sin(t), ...)`.
